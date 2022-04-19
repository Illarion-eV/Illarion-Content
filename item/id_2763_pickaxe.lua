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
-- mining mit Spitzhacke

-- UPDATE items SET itm_script='item.id_2763_pickaxe' WHERE itm_id=2763;

-- UPDATE items SET com_agingspeed = 255, com_objectafterrot = 1246 WHERE itm_id = 1246;
-- UPDATE items SET com_agingspeed =  10, com_objectafterrot = 1246 WHERE itm_id = 915;

-- UPDATE items SET com_agingspeed = 255, com_objectafterrot = 1245 WHERE itm_id = 1245;
-- UPDATE items SET com_agingspeed =  10, com_objectafterrot = 1245 WHERE itm_id = 1254;

-- UPDATE items SET com_agingspeed = 255, com_objectafterrot = 232  WHERE itm_id = 232;
-- UPDATE items SET com_agingspeed =  10, com_objectafterrot = 232  WHERE itm_id = 233;

-- UPDATE items SET com_agingspeed = 255, com_objectafterrot = 914  WHERE itm_id = 914;
-- UPDATE items SET com_agingspeed =  10, com_objectafterrot = 914  WHERE itm_id = 1265;

-- UPDATE items SET com_agingspeed = 255, com_objectafterrot = 1273 WHERE itm_id = 1273;
-- UPDATE items SET com_agingspeed =  10, com_objectafterrot = 1273 WHERE itm_id = 1257;

-- UPDATE items SET com_agingspeed = 255, com_objectafterrot = 1276 WHERE itm_id = 1276;
-- UPDATE items SET com_agingspeed =  10, com_objectafterrot = 1276 WHERE itm_id = 1278;

-- UPDATE items SET com_agingspeed = 255, com_objectafterrot = 1250 WHERE itm_id = 1250;
-- UPDATE items SET com_agingspeed =  10, com_objectafterrot = 1250 WHERE itm_id = 1251;

local common = require("base.common")
local shared = require("craft.base.shared")
local treasure = require("item.base.treasure")
local mining = require("craft.gathering.mining")
local metal = require("item.general.metal")
local transformation_dog = require("alchemy.teaching.transformation_dog")
local glyphmagic = require("magic.glyphmagic")
local gathering = require("craft.base.gathering")

local M = {}

M.LookAtItem = metal.LookAtItem

-- @return  True if found a treasure.
local function DigForTreasure(user)
    local TargetPos = common.GetFrontPosition(user);
    local groundTile = world:getField(TargetPos):tile();
    local groundType = common.GetGroundType(groundTile);

    if groundType == common.GroundType.rocks then
        return treasure.performDiggingForTreasure(user, TargetPos, {
            maximalLevel = (user:getSkill(Character.mining) / 10) + 1,
            msgDiggingOut = {
                de = "Du schwingst deine Spitzhacke gegen den steinigen Boden und stößt auf etwas das noch " ..
                        "härter ist als der Boden. Das muss er sein! Der Schatz. Noch einmal graben und der " ..
                        "grenzenlose Reichtum ist dein!",
                en = "You swing your pick-axe against the stony ground and hit something that is even harder " ..
                        "then the ground. That must it be! The treasure! Another swing and it is yours!"
            }}
        )
    end
    return false;
end

function M.UseItem(user, SourceItem, ltstate)

    if common.isBroken(SourceItem) then
        common.HighInformNLS(user,"Deine Spitzhacke ist kaputt.","Your pick-axe is broken.")
        return
    end

    if shared.hasTool(user, 2763) == false then
        common.HighInformNLS(user,"Du musst die Spitzhacke in der Hand halten.","You need to hold the pick-axe in your hand.")
        return
    end

    if glyphmagic.removeGlyphForge(user) then
        return
    end

    if not common.FitForWork( user ) then -- check minimal food points
        return
    end

    -- check for alchemy scroll
    if transformation_dog.DigForTeachingScroll(user) then
        return
    end

    if DigForTreasure(user) then
        return;
    end

    local oreList = mining.oreList

    local rock = gathering.getDepletableResource(user, oreList)
    if not rock then
        common.HighInformNLS(user,
        "Du musst neben einem Felsen stehen um Bergbau zu betreiben.",
        "You have to stand next to a rock to mine.");
        return
    end

    mining.StartGathering(user, rock, ltstate);
end

return M

