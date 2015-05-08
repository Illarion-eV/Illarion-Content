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

-- This handles everything needed to control the quest of feeding the Old Slime in Runewick.

local factions = require("base.factions")
local scheduledFunction = require("scheduled.scheduledFunction")
local lookat = require("base.lookat")

local M = {}

local oldSlimeId = 616

local blockedLever = 434
local normalLever = 435
local leverPosition = position(895, 774, 0)

local teleportPlatform = position(894, 775, 0)
local refuseFeedingField = position(894, 779, 0)
local acceptFeedingField = position(887, 775, 0)
local caveEntrance = position(890, 770, 0)
local rewardPosition = position(893, 776, 0)

local feedingInProgress = false

local slimeDietItems = {
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
{itemId = 726, amount = 20}, --[[coarse sand]]
{itemId = 767, amount = 10}, --[[water blossom]]
{itemId = 451, amount = 3}, --[[topaz powder]]
{itemId = 138, amount = 3}, --[[night angels blossom]]
{itemId = 256, amount = 5}, --[[raw smaragd]]
{itemId = 26, amount = 15} --[[clay]]
}

local rewardList = {
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

function M.setSignText(signSlimeFeeding)
	
	local day = world:getTime("day")
    local itemId = slimeDietItems[day]["itemId"]
    local amount = slimeDietItems[day]["amount"]
    lookat.SetSpecialName(signSlimeFeeding, "Regeln für das Füttern des alten Schleims", "Rules for feeding the old slime")
    lookat.SetSpecialDescription(signSlimeFeeding,"Heutiges Futter: "..world:getItemName(itemId,Player.german)..", Anzahl: "..amount.." // Beachten: Nur Gegenstandsteleporter nutzen; pro Person nur einmal im Monat füttern (Überfressungsprävention); nur vorgegebenes Futter verwenden (Nährstoffversorgungssicherstellung); niemals sollen zwei Personen gleichzeitig füttern (Unentscheidbarkeitssyndromverhinderung); KEINE FÜTTERUNG IM MAS!",
    "Today's feeding: "..world:getItemName(itemId,Player.english)..", amount: "..amount.." // Keep in mind: Use only the object teleporter; every person may feed the slime only once a month (prevention of overeating); use only the food allowed on the current day (securing of nutrient supply); two people should never ever feed simultaneously (prevention of undecidability syndrome); NO FEEDING DURING MAS!")
	
end

local function newMonth(user)

	local questStatus = user:getQuestProgress(450)
	local year = math.floor(questStatus/100)
	local month = questStatus - (year*100)
	
	if questStatus == 0 or month < world:getTime("month") or year < world:getTime("year") then
		return true
	end
	return false	
end

local function checkFeeding(user)

    local feeding
    if world:isItemOnField(teleportPlatform) then
        feeding = world:getItemOnField(teleportPlatform)
    else
        return false, nil
    end
    
    local day = world:getTime("day")
	local neededId = slimeDietItems[day]["itemId"]
	local neededAmount = slimeDietItems[day]["amount"]
    
    if feeding.id == neededId and feeding.number == neededAmount and feedingInProgress == false and newMonth(user) then
        return true, feeding
    else
        return false, feeding
    end

end

-- Called from the reload script (also used by the function useLever)
function M.resetLever()
    if world:isItemOnField(leverPosition) then
        lever = world:getItemOnField(leverPosition)
        lever.id = normalLever
        world:changeItem(lever)
    end
end

-- Called from lever item script
function M.useLever(user, sourceItem)

    if sourceItem.id == blockedLever then
        user:inform("Der Hebel scheint blockiert. Du kannst ihn nicht bewegen.", "The lever seems blocked. You cannot move it.")
        return
    end
    
    local feedingAccepted, feedingItem = checkFeeding(user)
    if not feedingAccepted then
        if feedingItem then
            M.refuseItem(feedingItem)
        end
    else
        world:gfx(45, feedingItem.pos)
        world:gfx(46, acceptFeedingField)
        world:createItemFromItem(feedingItem, acceptFeedingField,true)
        world:erase(feedingItem, feedingItem.number)
        if factions.isRunewickCitizen(user) then
			factions.setRankpoints(user, factions.getRankpoints(user)+3)
		end
        user:setQuestProgress(450, world:getTime("year")*100 + world:getTime("month"))
        feedingInProgress = true
        local oldSlime = world:createMonster(oldSlimeId, caveEntrance, 0)
        oldSlime:talk(Character.say, "#me fließt aus der Höhlennische und beginnt sich in Richtung des Futters zu bewegen.",
        "#me flows out from the small hole and starts to move towards the feed.")
        oldSlime.movepoints = oldSlime.movepoints - 50
        oldSlime.waypoints:addWaypoint(acceptFeedingField)
        oldSlime:setOnRoute(true)
    end
    sourceItem.id = blockedLever
    world:changeItem(sourceItem)
    
    scheduledFunction.registerFunction(2, function() M.resetLever() end)
end

-- Called from triggerfield script
function M.warpCharacterAway(user)
    if user:getType() == Character.player or user:getMonsterType() ~= oldSlimeId then
        world:gfx(45,user.pos)
        user:warp(refuseFeedingField)
        world:gfx(46,refuseFeedingField)
    end
end

-- Called from triggerfield script (also by useLever function in this script)
function M.refuseItem(refusedItem)
    
    world:gfx(45,refusedItem.pos)
    world:gfx(46,refuseFeedingField)
    world:createItemFromItem(refusedItem,refuseFeedingField,true)
    world:erase(refusedItem,refusedItem.number)

end

-- Called from monster script of old slime
function M.oldSlimeAbortRoute(oldSlime)

    if oldSlime.pos == acceptFeedingField then
        if world:isItemOnField(acceptFeedingField) then
            oldSlime:talk(Character.say, "#mes schleimige Masse gleitet über das Futter und absorbiert es. Sein Körper wabbelt kurz ein Objekt tritt aus diesem raus, welches über die Ansperrung kataplutiert.",
                "#me's slimy mass flows over the feed and absorbs it. Its body wobbles for a short period of time and an object emerges from it, which is catapulted over the boundary.")
            local feeding = world:getItemOnField(acceptFeedingField)
            world:erase(feeding, feeding.number)
            local reward = rewardList[Random.uniform(1, #rewardList)]
            world:createItemFromId(rewardList.itemId, rewardList.amount, rewardPosition, true, rewardList.quality, rewardList.data)
            oldSlime.movepoints = oldSlime.movepoints -50
        end
        oldSlime.waypoints:addWaypoint(caveEntrance)
        oldSlime:setOnRoute(true)

    elseif oldSlime.pos == caveEntrance then
        oldSlime:talk(Character.say, "#me fließt in die Höhlennische zurück.", "#me flows back into the small hole.")
        oldSlime:increaseAttrib("hitpoints", -10000)
        feedingInProgress = false
    end
    
end

return M