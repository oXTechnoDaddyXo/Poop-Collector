local Core = exports.vorp_core:GetCore()

local poopTypes = {
    [`p_horsepoop02x`] = "horse_poop",
    [`p_cowpatty01x`] = "cow_poop"
}

local prompt
local promptGroup = GetRandomIntInRange(0, 0xffffff)

Citizen.CreateThread(function()
    prompt = PromptRegisterBegin()
    PromptSetControlAction(prompt, 0x760A9C6F) -- G Taste
    PromptSetText(prompt, CreateVarString(10, "LITERAL_STRING", "Kot aufsammeln"))
    PromptSetEnabled(prompt, false)
    PromptSetVisible(prompt, false)
    PromptSetStandardMode(prompt, true)
    PromptSetGroup(prompt, promptGroup)
    PromptRegisterEnd(prompt)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local foundObject = nil
        local foundType = nil

        for model, itemName in pairs(poopTypes) do
            local object = GetClosestObjectOfType(coords, 2.0, model, false, false, false)

            if object ~= 0 then
                foundObject = object
                foundType = itemName
                break
            end
        end

        if foundObject then
            PromptSetActiveGroupThisFrame(promptGroup, CreateVarString(10, "LITERAL_STRING", "Kot"))

            PromptSetEnabled(prompt, true)
            PromptSetVisible(prompt, true)

            if PromptHasStandardModeCompleted(prompt) then
                CollectPoop(foundObject, foundType)
            end
        else
            PromptSetEnabled(prompt, false)
            PromptSetVisible(prompt, false)
        end
    end
end)

function CollectPoop(object, poopType)
    local playerPed = PlayerPedId()

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CROUCH_INSPECT", 3000, true)
    Wait(3000)
    ClearPedTasks(playerPed)

    TriggerServerEvent("poop:collect", poopType)

    DeleteObject(object)
end