local json = require 'json'
local QBCore = exports['qb-core']:GetCoreObject()
local birthdays = {}
LoadBirthdays()

function LoadBirthdays()
    CreateThread(function()
        Wait(500)
        local path = LoadResourceFile(GetCurrentResourceName(), "server/birthdays.json")
        local result = json.decode(path)
        if result then
            birthdays = result
        end
    end)
end

RegisterNetEvent('abt-birthday:server:saveBirthday')
AddEventHandler('abt-birthday:server:saveBirthday', function(birthday)
    local src = source
    local citizenid = GetPlayerIdentifier(src)
    birthdays[citizenid] = birthday
    SaveResourceFile(GetCurrentResourceName(), "server/birthdays.json", json.encode(birthdays), -1)
    print("[ABT-Birthday] Saved birthday for " .. citizenid .. ": " .. birthday)
end)

RegisterNetEvent("abt-birthday:server:checkBirthday")
AddEventHandler("abt-birthday:server:checkBirthday", function()
    local src = source
    local citizenid = GetPlayerIdentifier(src)
    local birthday = birthdays[citizenid]
    if birthday then
        local currentDate = os.date("*t")
        local birthMonth, birthDay = birthday:match("(%d+)/(%d+)")
        if tonumber(birthMonth) == currentDate.month and tonumber(birthDay) == currentDate.day then
            TriggerClientEvent("abt-birthday:client:itshere", src, ABTresources.reward)
        end
    end
end)

RegisterNetEvent("abt-birthday:server:giveItem")
AddEventHandler("abt-birthday:server:giveItem", function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
    end
end)