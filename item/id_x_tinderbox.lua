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
-- tinderbox
-- light a fire

local common = require("base.common")

local M = {}

local WoodIds = {544,543,2560,3};

local IsWood
local LightFire

function M.UseItem(User, SourceItem)

    -- item in hand?
    if not common.IsItemInHands(SourceItem) then
        common.InformNLS(User,
            "Du musst die Zunderbüchse in die Hand nehmen.",
            "You have to hold the tinderbox in your hands.");
        return;
    end

    local frontPos = common.GetFrontPosition(User);

    -- check front position for proper ground tile
    local groundType = common.GetGroundType(world:getField(frontPos).tile);
    if groundType == common.GroundType.water or groundType == common.GroundType.unknown then
        common.InformNLS(User,
            "Auf diesem Untergrund kannst du kein Feuer machen.",
            "You can't light a fire on this ground.");
        return;
    end

    -- check front position for wood, a kettle or if it's clear
    local foundWood = false;
    local frontItem
    local posOkay
    if world:isItemOnField(frontPos) then
        frontItem = common.GetFrontItem(User);
        if frontItem and frontItem.id == 2488 then -- a kettle
            posOkay = true;
        elseif IsWood(frontItem) then
            foundWood = true;
            posOkay = true;
        else
            frontItem = nil;
            posOkay = false;
        end
    end
    if not posOkay or world:isCharacterOnField(frontPos) then
        common.InformNLS(User,
            "Du kannst nur unter einem Kessel oder an einer freien Stelle ein Feuer machen.",
            "You have to light a fire beneath a kettle or at a clear place.");
        return;
    end
    -- check for and remove wood
    if foundWood then
        -- already found wood in front
        world:erase(frontItem, 1);
        LightFire(User, frontPos);
        if frontItem.number > 0 then
            -- there was more than one wood item, so put the rest on top
            world:createItemFromId(frontItem.id,frontItem.number,frontPos,true,333,nil);
            -- and erase the rest
            world:erase(frontItem,frontItem.number);
        end
        --wildfires disabled
        --tryWildfire(User, SourceItem);
        return;
    end

    -- first check the hand slot
    local woodItem = common.GetTargetItem(User, SourceItem);
    if IsWood(woodItem) then
        world:erase(woodItem, 1);
        foundWood = true;
    else
        -- no wood in hand, so check the belt
        local woodIndex = 0;
        local woodNum = 0;
        while ( woodNum == 0 and woodIndex < #WoodIds ) do
            woodIndex = woodIndex + 1;
            woodNum = User:countItemAt("all", WoodIds[woodIndex]);
        end
        if woodNum > 0 then
            User:eraseItem(WoodIds[woodIndex],1);
            foundWood = true;
        end
    end
    if foundWood then
        -- light fire
        LightFire(User, frontPos);
        -- wildfires disabled
        --tryWildfire(User, SourceItem);
    else
        common.InformNLS(User,
            "Für ein Feuer brauchst du Holz.",
            "For a fire you need wood.");
    end
end

function IsWood(item)
    if not item then
        return false;
    end

    if item.id == 0 then
        return false;
    end

    for _,id in pairs(WoodIds) do
        if id == item.id then
            return true;
        end
    end

    return false;
end

function LightFire(User, frontPos)
    world:createItemFromId(12,1,frontPos,true,333,nil); -- the fire
    common.InformNLS(User,
        "Du entzündest ein Feuer.",
        "You light a fire.");
end

return M

