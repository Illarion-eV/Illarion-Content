-- Depots

-- UPDATE common SET com_script='item.id_321_depot' WHERE com_itemid=321;

require("base.common")
require("base.lookat")

module("item.id_321_depot", package.seeall)

function LookAtItem(User, Item)
    local lookAt = base.lookat.GenerateLookAt(User, Item)
    local depotId = tonumber(Item.getData("depot"))

    if depotId == 101 then
        lookAt.description = "Cadomyr"
    elseif depotId == 102 then
        lookAt.description = "Runewick"
    elseif depotId == 103 then
        lookAt.description = "Galmair"
    elseif depotId == 104 then
        lookAt.description = base.common.GetNLS(User, "Gasthof zur Hanfschlinge", "The Hemp Necktie Inn")
    end
    
    world:itemInform(User, Item, lookAt)
end
