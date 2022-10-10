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
local gems = require("base.gems")
local magicsmith = require("base.magicsmith")
local common = require("base.common")
local lookat = require("base.lookat")
local vision = require("content.vision")

-- UPDATE items SET itm_script='item.magicgems' WHERE itm_id IN (3520, 3523, 3521, 3524, 3522, 3519, 3525);

local M = {}

function M.MoveItemBeforeMove(user, source, target)

    local amount = tostring(target.number)
    local id = tostring(target.id)
    local level = tostring(target:getData("gemLevel")) or 1
    local name = tostring(user.name)
    local gemPos = tostring(target.pos)
    local userPos = tostring(user.pos)


    if not target.inside and user.pos == target.pos and source.inside or not target.inside and user.pos ~= target.pos then
        log(amount.." magic gems of ID "..id.." and rank "..level.." have been moved to a tile by player "..name..". Position of gem: "..gemPos.." Position of player: "..userPos)
    elseif not source.inside then
        log(amount.." magic gems of ID "..id.." and rank "..level.." have been picked up by player "..name.." from a tile. Position of gem: "..gemPos.." Position of player: "..userPos)
    end
    return true
end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)

    local data = {}
    data.gemLevel = tonumber(item:getData(gems.levelDataKey)) or 1 --If the gem has no level set, it's 1 by default.

    lookAt = gems.lookAtFilter(user, lookAt, data)

    return lookAt
end

function M.UseItem(User, SourceItem, ltstate)
    local TargetItemEvilRock = common.GetItemInArea(User.pos, 2805);
    local AmountDarkColumnEvilrock = #vision.darkColumnEvilrock
    if TargetItemEvilRock ~= nil then
        for i = 1,AmountDarkColumnEvilrock do
            if TargetItemEvilRock.pos == vision.darkColumnEvilrock[i] then
                common.TurnTo(User,TargetItemEvilRock.pos); -- turn if necessary
                vision.UseDarkColumns(User,TargetItemEvilRock,ltstate)
                return
            end
        end
    end

    magicsmith.handleSocketing(User, SourceItem)
end

return M

