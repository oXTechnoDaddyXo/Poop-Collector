local Core = exports.vorp_core:GetCore()
local Inventory = exports.vorp_inventory:vorp_inventoryApi()

local validTypes = {
    horse_poop = true,
    cow_poop = true
}

RegisterServerEvent("poop:collect")
AddEventHandler("poop:collect", function(poopType)
    local _source = source
    local user = Core.getUser(_source)
    if not user then return end

    if not validTypes[poopType] then return end

    Inventory.addItem(_source, poopType, 1)

    local label = "Kot"
    if poopType == "horse_poop" then
        label = "Pferdemist"
    elseif poopType == "cow_poop" then
        label = "Kuhmist"
    end

    TriggerClientEvent("vorp:TipRight", _source, "Du hast "..label.." gesammelt 💩", 3000)
end)