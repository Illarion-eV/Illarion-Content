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
-- UPDATE items SET itm_script='item.id_6_scissors' WHERE itm_id IN (6);

local common = require("base.common")
local spinning = require("craft.intermediate.spinning")
local weaving = require("craft.intermediate.weaving")
local woolcutting = require("craft.gathering.woolcutting")
local silkcutting = require("craft.gathering.silkcutting")
local metal = require("item.general.metal")
local petsystem = require("petsystem.base")

local M = {}

M.LookAtItem = metal.LookAtItem

local function getButterfly(User)

    local BUTTERFLIES = {3634, 3635, 3636, 3637}
    local foundItem
    local frontItem = common.GetFrontItem(User)
    
    for i, butterfly in pairs(BUTTERFLIES) do
        if (frontItem ~= nil and frontItem.id == butterfly) then
            foundItem = frontItem
            break
        end
    end

    if not foundItem then
        for i, butterfly in pairs(BUTTERFLIES) do
            foundItem = common.GetItemInArea(User.pos, butterfly)
            if foundItem then
                break
            end
        end
    end
    
    return foundItem
    
end

local function getLoom(User)

    local LOOM = 169;
    local item = common.GetFrontItem(User);
    if (item ~= nil and item.id == LOOM) then
        return item;
    end
    item = common.GetItemInArea(User.pos, LOOM);
    return item;
end

local function getWheel(User)

    local WHEEL = 171;
    local item = common.GetFrontItem(User);
    if (item ~= nil and item.id == WHEEL) then
        return item;
    end
    item = common.GetItemInArea(User.pos, WHEEL);
    return item;
end

local function getSheep(User)
    local targetCharacter = common.GetFrontCharacter(User);
    -- check for sheep in front
    if (targetCharacter ~= nil and targetCharacter:getRace()==18) then
        return targetCharacter;
    end
    -- look for a nearby sheep
    for x=-1,1 do
        for y=-1,1 do
            local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
            if ( world:isCharacterOnField(pos) ) then
                targetCharacter = world:getCharacterOnField(pos);
                if ( targetCharacter:getRace() == 18 ) then
                    return targetCharacter;
                end
            end
        end
    end
    return nil;
end


function M.UseItem(User, SourceItem, ltstate)

    local target;
 
    --check for butterflies
    target = getButterfly(User)
    if (target ~= nil) then
        silkcutting.StartGathering(User, target, ltstate)
        return
    end
 
    -- check for sheep
    target = getSheep(User);
    if (target ~= nil) then
        woolcutting.StartGathering(User, target, ltstate);
        return;
    end

    -- check for spinning wheel
    target = getWheel(User);
    if (target ~= nil) then
        spinning.spinning:showDialog(User, SourceItem)
        return;
    end

    -- check for loom
    target = getLoom(User);
    if (target ~= nil) then
        weaving.weaving:showDialog(User, SourceItem)
        return;
    end

    -- there is nothing to work with
    common.HighInformNLS( User,
    "Du brauchst entweder ein Schaf, um es zu scheren, oder musst vor einem Spinnrad oder Webstuhl stehen. Ein Schmetterlingsschwarm in der Nähe könnte auf die seltenen Seidenspinnderaupen hindeuten.",
    "You need either a sheep for shearing it, or need to stand in front of a spinning wheel or loom. A swarm of butterflies nearby could indicate the presence of rare silkworms." );
end

return M