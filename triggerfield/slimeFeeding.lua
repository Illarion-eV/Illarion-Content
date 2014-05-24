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
-- INSERT INTO triggerfields VALUES (890,793,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (890,792,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (890,791,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (890,790,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (889,793,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (889,792,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (889,791,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (889,790,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (888,792,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (888,791,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (888,790,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (887,790,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (887,791,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (887,792,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (886,790,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (886,791,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (886,792,0,'triggerfield.slimeFeeding');
-- INSERT INTO triggerfields VALUES (887,797,0,'triggerfield.slimeFeeding');


require("base.lookat")
module("triggerfield.slimeFeeding", package.seeall)

-- 24 items. For every day of the month an own item..
SLIME_DIET_ITEMS = {
{itemId = 159, amount = 15}, --[[toad stool]]
{itemId = 52, amount = 3}, --[[bucket of water]]
{itemId = 447, amount = 3}, --[[ruby powder]]
{itemId = 21, amount = 9}, --[[coal]]
{itemId = 152, amount = 3}, --[[life root]]
{itemId = 2529, amount = 10}, --[[honey comb]]
{itemId = 252, amount = 7}, --[[raw obsidian]]
{itemId = 15, amount = 25}, --[[apple]]
{itemId = 157, amount = 26}, --[[rotten tree bark]]
{itemId = 762, amount = 3}, --[[gold crak herb]]
{itemId = 314, amount = 10}, --[[potash]]
{itemId = 456, amount = 11}, --[[snowball]]
{itemId = 133, amount = 25}, --[[sun herb]]
{itemId = 450, amount = 4}, --[[ameythst powder]]
{itemId = 1149, amount = 10}, --[[eggs]]
{itemId = 150, amount = 15}, --[[red head]]
{itemId = 259, amount = 15}, --[[grain]]
{itemId = 140, amount = 60}, --[[donf blade]]
{itemId = 762, amount = 20}, --[[coarse sand]]
{itemId = 767, amount = 10}, --[[water blossom]]
{itemId = 451, amount = 3}, --[[topaz powder]]
{itemId = 138, amount = 3}, --[[night angels blossom]]
{itemId = 256, amount = 5}, --[[raw smaragd]]
{itemId = 26, amount = 15} --[[clay]]
}

REWARD_LIST = {
{itemId = 164, amount = 1, quality = 333, data = nil}, --[[empty bottle]]
{itemId = 59, amount = 1, quality = 333, data = {potionEffectId = 59555555, filledWith = "potion", descriptionDe = "Idiotenheilmitte. Idiot's treatment", descriptionEn = "Idiotenheilmitte. Idiot's treatment"}}, --[[potion, increase int]]
{itemId = 126, amount = 1, quality = 666, data = nil}, --[[sickel]]
{itemId = 3077, amount = 25, quality = 333, data = nil}, --[[silver coin]]
{itemId = 1318, amount = 1, quality = 333, data = nil}, --[[bottle of Elven wine]]
{itemId = 446, amount = 2, quality = 333, data = nil}, --[[sapphire powder]]
{itemId = 449, amount = 2, quality = 333, data = nil}, --[[obsidian powder]]
{itemId = 452, amount = 2, quality = 333, data = nil}, --[[diamond powder]]
{itemId = 83, amount = 1, quality = 555, data = nil}, --[[topaz amulet]]
{itemId = 254, amount = 5, quality = 333, data = nil}, --[[raw diamond]]
{itemId = 3076, amount = 2678, quality = 333, data = nil}, --[[copper coins]]
{itemId = 829, amount = 1, quality = 666, data = nil}, --[[yellow hat with feather]]
{itemId = 2588, amount = 27, quality = 333, data = nil}, --[[bricks]]
{itemId = 200, amount = 22, quality = 333, data = nil}, --[[tomato]]
{itemId = 2668, amount = 1, quality = 444, data = nil} --[[poisoned simple dagger]]
}

TELEPORTER_FIELD = position(887,797,0)
WARP_BACK_POSITION = position(882,792,0)
WARP_TO_SLIME_POSITION = position(887,791,0)
SLIME_CAVE_POSITION = position(890,792,0)
REWARD_POSITION = position(887,796,0)
OLD_SLIME = 1055

FEEDING_IN_PROGRESS = false


SIGN_POSITION = position(888,797,0)

function setSign()
	
	if world:isItemOnField(SIGN_POSITION) then
		local signSlimeFeeding = world:getItemOnField(SIGN_POSITION)
		if signSlimeFeeding.id == 3081 then
			local day = world:getTime("day")
			local itemId = SLIME_DIET_ITEMS[day]["itemId"]
			local amount = SLIME_DIET_ITEMS[day]["amount"]
			base.lookat.SetSpecialName(signSlimeFeeding, "Regeln für das Füttern des alten Schleims", "Rules for feeding the old slime")
			base.lookat.SetSpecialDescription(signSlimeFeeding,"Heutiges Futter: "..world:getItemName(itemId,Player.german)..", Anzahl: "..amount.." // Beachten: Nur Gegenstandsteleporter nutzen; pro Person nur einmal im Monat füttern (Überfressungsprävention); nur vorgegebenes Futter verwenden (Nährstoffversorgungssicherstellung); niemals sollen zwei Personen gleichzeitig füttern (Unentscheidbarkeitssyndromverhinderung); KEINE FÜTTERUNG IM MAS!",
			"Today's feeding: "..world:getItemName(itemId,Player.english)..", amount: "..amount.." // Keep in mind: Use only the object teleporter; every person may feed the slime only once a month (prevention of overeating); use only the food allowed on the current day (securing of nutrient supply); two people should never ever feed simultaneously (prevention of undecidability syndrome); NO FEEDING DURING MAS!")
			world:changeItem(signSlimeFeeding)
		end
		
	end
	
end

function PutItemOnField(Item,User)
	if Item.pos ~= TELEPORTER_FIELD or world:getTime("month")==16 then
		RefuseItem(Item)
		return
	end
	
	local day = world:getTime("day")
	local neededId = SLIME_DIET_ITEMS[day]["itemId"]
	local neededAmount = SLIME_DIET_ITEMS[day]["amount"]
	
	local itemAccepted
	if Item.id == neededId and Item.number == neededAmount and FEEDING_IN_PROGRESS == false and NewMonth(User) then
		AcceptItem(Item)
		SlimeCreation()
		if base.factions.isRunewickCitizen(User) then
			base.factions.setRankpoints(User, base.factions.getRankpoints(User)+3)
		end
		User:setQuestProgress(450,world:getTime("year")*100 + world:getTime("month"))
	else
		RefuseItem(Item)
	end
	
	-- The eating, rewarding and moving back to the cave are handled in the monster script for this slime monster in the function abortRoute
end

function NewMonth(User)

	local qstStatus = User:getQuestProgress(450)
	local year = math.floor(qstStatus/100)
	local month = qstStatus - (year*100)
	
	if qstStatus == 0 or month > world:getTime("month") or year > world:getTime("year") then
		return true
	end
	return false	
end

function RefuseItem(Item)

	world:gfx(45,Item.pos)
	world:gfx(46,WARP_BACK_POSITION)
    world:createItemFromItem(Item,WARP_BACK_POSITION,true)
	world:erase(Item,Item.number)
end

function AcceptItem(Item)

	world:gfx(45,Item.pos)
	world:gfx(46,WARP_TO_SLIME_POSITION)
    world:createItemFromItem(Item,WARP_TO_SLIME_POSITION,true)
	world:erase(Item,Item.number)
end

function SlimeCreation()

    local oldSlime = world:createMonster(OLD_SLIME,SLIME_CAVE_POSITION,0)
	oldSlime:talk(Character.say, "#me fließt aus der Höhlennische und beginnt sich in Richtung des Futters zu bewegen.",
	"#me flows out from the small hole and starts to move towards the feed.")
	oldSlime.movepoints = oldSlime.movepoints - 50
	oldSlime.waypoints:addWaypoint(WARP_TO_SLIME_POSITION)
	oldSlime:setOnRoute(true)
	FEEDING_IN_PROGRESS = true
	
end
