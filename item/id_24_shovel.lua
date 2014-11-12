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
-- UPDATE items SET itm_script='item.id_24_shovel' WHERE itm_id=24;

local common = require("base.common")
local treasure = require("base.treasure")
local transformation_dog = require("alchemy.teaching.transformation_dog")
local claydigging = require("content.gatheringcraft.claydigging")
local sanddigging = require("content.gatheringcraft.sanddigging")
local metal = require("item.general.metal")

local M = {}

M.LookAtItem = metal.LookAtItem

function getSandPit(User)
	local SAND_PIT = 1208;
	local pitItem = common.GetFrontItem(User);
	if (pitItem ~= nil and pitItem.id == SAND_PIT) then
		return pitItem;
	end
	pitItem = common.GetItemInArea(User.pos, SAND_PIT);
	return pitItem;
end

function getClayPit(User)
	local CLAY_PIT = 1206;
	local pitItem = common.GetFrontItem(User);
	if (pitItem ~= nil and pitItem.id == CLAY_PIT) then
		return pitItem;
	end
	pitItem = common.GetItemInArea(User.pos, CLAY_PIT);
	return pitItem;
end

function M.UseItem(User, SourceItem, ltstate)

	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~=24 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 24 ) then
			common.HighInformNLS( User,
			"Du musst die Schaufel in der Hand haben!",
			"You have to hold the shovel in your hand!" );
			return
		end
	end

	if not common.FitForWork( User ) then -- check minimal food points
		return
	end
	
	-- check for alchemy scroll
	if transformation_dog.DigForTeachingScroll(User) then
		return
	end

	-- check for treasure
	if DigForTreasure(User) then
		return;
	end

	local pitItem

	-- check for sand pit
	pitItem = getSandPit(User);
	if (pitItem ~= nil) then
		sanddigging.StartGathering(User, pitItem, ltstate);
		return;
	end

	-- check for clay pit
	pitItem = getClayPit(User);
	if (pitItem ~= nil) then
		claydigging.StartGathering(User, pitItem, ltstate);
		return;
	end

	-- inform the user that he digs for nothing
	DigForNothing(User);

end

-- @return  True if found a treasure.
function DigForTreasure(User)
	local TargetPos = common.GetFrontPosition(User);
	local groundTile = world:getField( TargetPos ):tile();
	local groundType = common.GetGroundType( groundTile );

	if (groundType ~= common.GroundType.rocks) and
			treasure.DigForTreasure( User, TargetPos, (User:getSkill(Character.mining)/10)+1,
			common.GetNLS( User,
				"Du gräbst mit deiner Schaufel in den Boden und stößt auf etwas hartes, von dem ein hölzerner Klang ausgeht. Noch einmal graben und du hältst den Schatz in deinen Händen.",
				"You dig with your shovel into the ground and hit suddenly something hard and wooden sounding. You only have to dig another time to get the treasure." ),
			false ) then
		return true;
	end
	return false;
end

function DigForNothing(User)
	local TargetPos = common.GetFrontPosition(User);
	local groundTile = world:getField( TargetPos ):tile();
	local groundType = common.GetGroundType( groundTile );

	if ( groundType == common.GroundType.field ) then
		common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Ackerboden, doch findest du hier gar nichts.",
			"You dig a small hole into the farming ground. But you find nothing.");
	elseif ( groundType == common.GroundType.sand ) then
		common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Sand, doch findest du hier gar nichts.",
			"You dig a small hole into the sand. But you find nothing.");
	elseif ( groundType == common.GroundType.dirt ) then
		common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Dreck, doch findest du hier gar nichts.",
			"You dig a small hole into the dirt. But you find nothing.");
	elseif ( groundType == common.GroundType.forest ) then
		common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Waldboden, doch findest du hier gar nichts.",
			"You dig a small hole into the forest ground. But you find nothing.");
	elseif ( groundType == common.GroundType.grass ) then
		common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in die Wiese, doch findest du hier gar nichts.",
			"You dig a small hole into the grass. But you find nothing.");
	elseif ( groundType == common.GroundType.rocks ) then
		common.HighInformNLS( User,
			"Der Boden besteht hier aus solidem Stein. Mit einer Schaufel hast du eindeutig das falsche Werkzeug.",
			"The ground here is heavy stone. With a shovel you have the wrong tool here for sure.");
	elseif ( groundType == common.GroundType.water ) then
		common.HighInformNLS( User,
			"Im Wasser mit einer Schaufel zu graben geht zwar relativ leicht, doch der Effekt ist recht gering.",
			"To dig with a shovel in the water is pretty easy. But sadly there is no effect in doing this.");
	else
		common.HighInformNLS(User,
			"Du versuchst an dieser Stelle zu graben, findest aber nichts.",
			"You attempt to dig here, but you don't find anything.");
	end

end

return M

