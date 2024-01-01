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

local housing = require("housing.propertyList")
local gmlectern = require("gm.gm_lectern")
local treasure = require("scheduled.spawn_treasure")
local houseUtility = require("housing.utility")

local M = {}

local listAllTilesOfCategory

local persistentTiles = {}

function listAllTilesOfCategory(user, category, page)

    local title = "Persistent tiles: "..category

    local description = "Select one of the persistent tiles to teleport to it."

    local persistentTilesOfCategory = {}

    if category == "All" then
        persistentTilesOfCategory = persistentTiles
    else
        for _, persistentTile in pairs(persistentTiles) do
            if category == persistentTile.cat or category == persistentTile.more then
                table.insert(persistentTilesOfCategory, persistentTile)
            end
        end
    end

    if not page then
        page = 0
    end

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        for index = 1+(page*10), 10+(page*10) do

            local persistentTile = persistentTilesOfCategory[index]

            if index == selected then
                user:warp(persistentTile.pos)
            end
        end
        if selected == 11 then
            listAllTilesOfCategory(user, category, page+1)
        end
    end

    local dialog = SelectionDialog(title, description, callback)

    for i = 1+(page*10), 10+(page*10) do
        local persistentTile = persistentTilesOfCategory[i]
        if persistentTile then
            dialog:addOption(0, "Pos: "..tostring(persistentTile.pos).." Category: "..persistentTile.cat.." Details: "..persistentTile.more)
        end
    end

    if (((page+1)*10) + 10) < #persistentTilesOfCategory then
        dialog:addOption(0, "Next page")
    end

    user:requestSelectionDialog(dialog)

end

local function selectProperty(user)

    local title = "Persistence Tracker"

    local description = "Select a property you want to view the persistent tiles of"

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        for index, property in ipairs(housing.propertyTable) do
            if index == selected then
                listAllTilesOfCategory(user, property[1])
            end
        end
    end

    local dialog = SelectionDialog(title, description, callback)

    for _, property in ipairs(housing.propertyTable) do

        dialog:addOption(0, property[1])

    end

    user:requestSelectionDialog(dialog)
end

local function coordBelongsToHousing(coord)

    local houses = housing.properties

    for _, house in pairs(houses) do
        if coord.x >= house.lower.x and coord.x <= house.upper.x and coord.y >= house.lower.y and coord.y <= house.upper.y and coord.z >= house.lower.z and coord.z <= house.upper.z then
            return true, house.name
        end
    end

    for _, house in pairs(housing.propertyTable) do
        local deed = house[3]
        local name = house[1]

        if coord == deed then
            return true, name
        end
    end

    return false
end

local function coordBelongsToScripts(coord)

    local scriptPositions = {
        {pos = gmlectern.pos, info = "GM Lectern"},
        {pos = treasure.pos, info = "Treasure respawn tracker"}}

    for _, thePos in pairs(houseUtility.townManagmentItemPos) do
        table.insert(scriptPositions, {pos = thePos, info = "Town management tool"})
    end

    for _, thePos in pairs(scriptPositions) do
        if coord == thePos.pos then
            return true, thePos.info
        end
    end

    return false

end

local function openListOfScannedTiles(user)

    local title = "Persistent Tile Categories"

    local description = "Select what category of persistent tiles you are interested in."



    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        local category = false

        if selected == 1 then
            category = "All"
        elseif selected == 2 then
            selectProperty(user)
        elseif selected == 3 then
            category = "Scripts"
        elseif selected == 4 then
            category = "Unknown"
        end

        if category then
            listAllTilesOfCategory(user, category)
        end
    end

    local dialog = SelectionDialog(title, description, callback)

    dialog:addOption(0, "All")
    dialog:addOption(0, "Housing")
    dialog:addOption(0, "Scripts")
    dialog:addOption(0, "Unknown")

    user:requestSelectionDialog(dialog)

end

local function scanArea(user, layer)

    if not layer then
        layer = user.pos.z
    else
        layer = tonumber(layer)
    end

    local coordsToCheck = {}

    for x = 0, 1024 do
        for y  = 0, 1024 do

            local coordToCheck = position(x, y, layer)

            if world:isPersistentAt(coordToCheck) then
                local category = "Unknown"
                local details = "Unknown"

                local isHousing, propertyName = coordBelongsToHousing(coordToCheck)

                if isHousing then
                    category = "Housing"
                    details = propertyName
                end

                local isScript, info = coordBelongsToScripts(coordToCheck)

                if isScript then
                    category = "Scripts"
                    details = info
                end

                table.insert(coordsToCheck, {pos = coordToCheck, cat = category, more = details})
            end
        end
    end

    for _, coordToCheck in pairs(coordsToCheck) do
        local insertNewCoord = true
        for _, persistentTile in pairs(persistentTiles) do
            if persistentTile.pos == coordToCheck.pos then
                insertNewCoord = false --already scanned before
                break
            end
        end

        if insertNewCoord then
            table.insert(persistentTiles, coordToCheck)
        end
    end

    openListOfScannedTiles(user)

end

local function selectLayer(user)

    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local _, _, layer = string.find(input,"(%d+)")
            scanArea(user, layer)
        end
    end

    user:requestInputDialog(InputDialog("Persistence Tracker", "Input the layer you want to scan. It must be a number." ,false, 255, callback))

end

function M.listPersistenceInArea(user)

    local option1 = "View the list of already scanned tiles.(No lag)"
    local option2 = "Scan your current layer for persistent tiles(Will cause lag)"
    local option3 = "Specify a layer to scan for persistent tiles(Will cause lag)"

    local title = "Persistence Tracker"
    local description = "Since the last reload, "..#persistentTiles.." persistent tiles have been scanned and added to the list."

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            openListOfScannedTiles(user)
        elseif selected == 2 then
            scanArea(user)
        elseif selected == 3 then
            selectLayer(user)
        end
    end

    local dialog = SelectionDialog(title, description, callback)

    dialog:addOption(0, option1)
    dialog:addOption(0, option2)
    dialog:addOption(0, option3)

    user:requestSelectionDialog(dialog)
end



return M
