--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

local mapStands = {
    {base = Item.mapStandEast, options = {Item.mapOfGobaithEast, Item.mapOfIllarionEast, Item.mapOfTheMainlandEast, Item.anatomyOfTheTorsoEast}},
    {base = Item.mapStandNorth, options = {Item.mapOfGobaithNorth, Item.mapOfIllarionNorth, Item.mapOfTheMainlandNorth, Item.anatomyOfTheTorsoNorth}}
}

function M.UseItem(user, mapStand)

    local selectedMapStands

    for _, selection in pairs(mapStands) do --First we determine whether to use the eastern or northern selection based on existing graphic
        if mapStand.id == selection.base then
            selectedMapStands = selection
            break
        end

        for _, option in pairs(selection.options) do
            if mapStand.id == option then
                selectedMapStands = selection
                break
            end
        end

        if selectedMapStands then
            break
        end
    end

    if not selectedMapStands then
        debug("No selected map stands found for item with map stand script attached. Item ID: "..tostring(mapStand.id))
        return
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex()

        if index == 0 then
            --set to base map
            world:swap(mapStand, selectedMapStands.base, 233)
        else
            if selectedMapStands.options[index] then
                world:swap(mapStand, selectedMapStands.options[index], 233)
            end
        end
    end

    local dialogText = common.GetNLS(user,"Wähle, was du mit dem Kartenständer tun möchtest.","Select what to do with the map stand.")
    local dialogTitle = common.GetNLS(user,"Kartenständer","Map Stand")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)
    dialog:setCloseOnMove()
    dialog:addOption(0,common.GetNLS(user,"Rolle die Karte auf","Roll it up"))

    for i = 1, #selectedMapStands.options do
        local commonMap = world:getItemStatsFromId(selectedMapStands.options[i])
        dialog:addOption(0, common.GetNLS(user, commonMap.German, commonMap.English))
    end

    user:requestSelectionDialog(dialog)

end

function M.LookAtItem(User,Item)
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

return M
