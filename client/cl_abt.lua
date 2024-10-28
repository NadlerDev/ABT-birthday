local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = false

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    TriggerServerEvent("abt-birthday:server:checkBirthday")
end)

RegisterNetEvent("abt-birthday:client:ABTopenUI", function()
    if isLoggedIn then
        toggleVisible(true)
    else
        print("[ABT_DEBUG] Player Undefined, please reconnect.")
    end
end)

RegisterNUICallback('ABTcloseUI', function()
    toggleVisible(false)
end)

function toggleVisible(visible)
    SetNuiFocus(visible, visible)
    SendNUIMessage({ visible = visible })
end

RegisterCommand("birthday", function()
    TriggerEvent('abt-birthday:client:ABTopenUI')
end, false)

RegisterNUICallback('submitBirthday', function(data)
    local birthday = data.birthday
    TriggerServerEvent('abt-birthday:server:saveBirthday', birthday)
    print("[ABT_DEBUG] Submitting birthday:", birthday)
end)

RegisterNetEvent("abt-birthday:client:itshere")
AddEventHandler("abt-birthday:client:itshere", function(reward)
    local reward = ABTresources.reward
    print("[ABT_DEBUG] Happy Birthday!")
    SendNUIMessage({ itstime = true, reward = reward })
    TriggerServerEvent("abt-birthday:server:giveItem", reward, 1)
end)

-- DELETE
RegisterCommand("testBirthday", function()
    TriggerEvent("abt-birthday:client:itshere", src, ABTresources.reward)
end)
