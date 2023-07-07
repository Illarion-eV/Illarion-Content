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
-- UPDATE items SET itm_script='item.id_2140_tong' WHERE itm_id=2140;

local gemcutting = require("craft.final.gemcutting")
local pottery = require("craft.final.pottery")
local metal = require("item.general.metal")
local common = require("base.common")

local M = {}

local grinder = 270
local kilns = {1240, 1241, 1242, 1243}

M.LookAtItem = metal.LookAtItem

local function checkItem(user, staticTool, dir)

    local craft
    local turn

    if not staticTool then
        return false
    end

    if staticTool.id == grinder then
        craft = "gemcutting"
        turn = true
    else
        for _, kiln in pairs(kilns) do
            if staticTool.id == kiln then
                craft = "pottery"
                turn = true
            end
        end
    end

    if turn then
        user:turn(dir)
        if craft == "gemcutting" then
            gemcutting.gemcutting:showDialog(user, staticTool)
        elseif craft == "pottery" then
            pottery.pottery:showDialog(user, staticTool)
        end

        return true
    end

    return false
end

function M.UseItem(user, sourceItem, actionstate)

    local germanKiln = world:getItemName(1240, Player.german)
    local englishKiln = world:getItemName(1240, Player.english)
    local germanGrinder = world:getItemName(grinder, Player.german)
    local englishGrinder = world:getItemName(grinder, Player.english)
    local germanText = "Du stehst nicht neben dem benötigten Werkzeug: " .. germanGrinder .." oder " .. germanKiln
    local englishText = "There is no " .. englishKiln .. " or " .. englishGrinder .. " close by to work with."
    local staticToolExists = false

    local dir = user:getFaceTo()
    local right = dir
    local left = (right - 1) % 8

    for i=1,4 do
        local staticToolRight = common.GetFrontItem(user, right)
        local staticToolLeft = common.GetFrontItem(user, left)

        local success = checkItem(user, staticToolRight, right)
        if not success then
            success = checkItem(user, staticToolLeft, left)
        end

        if success then
            staticToolExists = true
            break
        end

        right = (right + 1) % 8
        left = (left - 1) % 8

    end

    if not staticToolExists then
        common.HighInformNLS(user, germanText, englishText)
    end
end

return M

