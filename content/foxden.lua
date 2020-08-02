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
local scheduledFunction = require("scheduled.scheduledFunction")

local M = {}

local FEED_REPETITION = 300

local emptyPlate = position(814, 391, -3)

local pupSpot1 = position(813, 391, -3)
local pupSpot2 = position(815, 392, -3)
local pupSpot3 = position(813, 392, -3)
local pupSpot4 = position(814, 392, -3)
local motherSpot = position(815, 391, -3)

local posFlute = position(811, 392, -3)
local posRope1 = position(817, 399, -3)
local posRope2 = position(812, 395, -3)
local posBones1 = position(811, 398, -3)
local posBones2 = position(814, 399, -3)
local posBones3 = position(816, 397, -3)


local refuseFeedingField = position(816, 388, -3)
local denEntrance = position(812, 402, -3)

local feedingInProgress = false
local feedTime = 0
local feededFoxes = 0

local foxDietItems = {
    307, --[[pork]]
    2940, --[[raw steak]]
    552, --[[venison]]
    553, --[[rabbit meat]]
    2934, --[[lamb]]
    73, --[[trout]]
    355, --[[salmon]]
    1209, --[[horse mackerel]]
    1210 --[[rose fish]]
}

local function isFeeding()
    local foundValue, value = ScriptVars:find("foxFeeding")
    if foundValue then
        local lastFeed = tonumber(value)
        if not common.IsNilOrEmpty(lastFeed) then
            local currentTime = common.GetCurrentTimestamp()
            if currentTime - lastFeed < FEED_REPETITION then
                return true
            end
        end
    end
    return false
end

local function setFeeding(isFeed)
    local currentTime = common.GetCurrentTimestamp()

    if isFeed then
        ScriptVars:set("foxFeeding",tostring(currentTime))
    else
        ScriptVars:set("foxFeeding","0")
    end
    ScriptVars:save()
end

local function returnFox()
    local foxes =  world:getMonstersInRangeOf(denEntrance,16)
    
    if #foxes ~= 0 then
        for _,fox in ipairs(foxes) do
            fox:talk(Character.say, "#me schaut sich erschrocken um und rennt zurück.",
                "#me gets frightened and runs back.")
            fox.movepoints = fox.movepoints - 0
            fox.waypoints:addWaypoint(denEntrance)
            fox:setOnRoute(true)
        end
        scheduledFunction.registerFunction(10, function() returnFox() end)
    else
        setFeeding(false)
        feededFoxes = 0
    end
end

local function createMotherFox()
    local fox
    fox= world:createMonster(603, position(1,1,0), 0)
    fox:warp(denEntrance) -- hack to show model, to work around a client issue
    fox:talk(Character.say, "#me eilt sichernd zum Futterteller.",
        "#me hurries towards the feeding plate, looking out for any danger on the way.")
    fox.movepoints = fox.movepoints - 0
    fox.waypoints:addWaypoint(motherSpot)
    fox:setOnRoute(true)
    feededFoxes = 1
    scheduledFunction.registerFunction(25, function() returnFox() end)

end

local function createPupFox()
    local fox
    fox= world:createMonster(601, position(1,1,0), 0)
    fox:warp(denEntrance) -- hack to show model, to work around a client issue
    fox.movepoints = fox.movepoints - 0
    fox:talk(Character.say, "#me eilt zum Futterteller.",
                                "#me hurries towards the feeding plate.")
    fox.waypoints:addWaypoint(pupSpot1)
    fox:setOnRoute(true)

    fox= world:createMonster(601, position(1,1,0), 0)
    fox:warp(denEntrance) -- hack to show model, to work around a client issue
    fox.movepoints = fox.movepoints - 10
    fox:talk(Character.say, "#me rennt los.",
        "#me starts running.")
    fox.waypoints:addWaypoint(posFlute)
    fox.waypoints:addWaypoint(pupSpot2)
    fox:setOnRoute(true)

    fox= world:createMonster(601, position(1,1,0), 0)
    fox:warp(denEntrance) -- hack to show model, to work around a client issue
    fox.movepoints = fox.movepoints - 10
    fox:talk(Character.say, "#me fiept.",
        "#me whimpers.")
    fox.waypoints:addWaypoint(posRope1)
    fox.waypoints:addWaypoint(posRope2)
    fox.waypoints:addWaypoint(pupSpot3)
    fox:setOnRoute(true)

    fox= world:createMonster(601, position(1,1,0), 0)
    fox:warp(denEntrance) -- hack to show model, to work around a client issue
    fox.movepoints = fox.movepoints - 30
    fox:talk(Character.say, "#me gähnt.",
        "#me yawns.")
    fox.waypoints:addWaypoint(posBones1)
    fox.waypoints:addWaypoint(posBones2)
    fox.waypoints:addWaypoint(posBones3)
    fox.waypoints:addWaypoint(pupSpot4)
    fox:setOnRoute(true)
    
    feededFoxes = feededFoxes + 4
end

function M.tryFeeding(Item, char)
    -- reject stuff if feeding is already started
    if feededFoxes > 0 then
        world:createItemFromItem(Item, refuseFeedingField, true)
        world:erase(Item, Item.number)
        common.InformNLS(char, "Wart am Besten ab, bis alle gefressen haben, bevor du erneut fütterst.", "Wait until all cubs have eaten before you try to feed them again.")
        return
    end

    if isFeeding() == true then
        world:createItemFromItem(Item, refuseFeedingField, true)
        world:erase(Item, Item.number)
        common.InformNLS(char, "Gerade wurde gefüttert. Warte noch etwas.", "The cubs were already fed recently. Please wait a few minutes before trying again.")
        return
    end
    
    if not common.isInList(Item.id,foxDietItems) then
        -- reject wrong items
        world:createItemFromItem(Item, refuseFeedingField, true)
        world:erase(Item, Item.number)
         common.InformNLS(char, "So was fressen Füchse nicht.", "Foxes don't eat that.")
       return
    end

    if Item.number < 5 then
        -- reject not enough items
        world:createItemFromItem(Item, refuseFeedingField, true)
        world:erase(Item, Item.number)
         common.InformNLS(char, "Das reicht nicht für fünf Füchse.", "That's not enough for five foxes.")
       return
    end

    if char:getQuestProgress(561) ~= 0 then
        -- reject don't feed agin, time
        world:createItemFromItem(Item, refuseFeedingField, true)
        world:erase(Item, Item.number)
         common.InformNLS(char, "Keiner interessiert sich für das Futter. Wart bis die Welpen wieder hungrig sind.", "None of the cubs seem interested in the food you presented. Maybe they just aren't hungry enough yet.")
       return
    end

    if  char:getQuestProgress(561) == 0 and Item.pos == emptyPlate and Item.number >= 5 then --  doing the quest -feeding the fox pups
        char:setQuestProgress(561, 72) -- set cooldown (6 hours)
        common.InformNLS(char, "Du hast den Welpen das richtige Futter gebracht. Sie kommen heraus um zu fressen.", "You have presented the fox cubs with the appropriate type of food.")

         --spawn mother fox
        setFeeding(true)
        createMotherFox()
        feedTime = 20

    end
end

-- Called from monster script
function M.foxAbortRoute(fox)
    if fox.pos == pupSpot1 or fox.pos == pupSpot2 or fox.pos == pupSpot3 or fox.pos == pupSpot4 or fox.pos == motherSpot then
        if feedTime == 20 then -- mother fox
            common.TurnTo(fox,emptyPlate)
            fox:talk(Character.say, "#me schnüffelt am Futter, bellt und kaut an einem Stück.",
                "#me sniffs at the food, barks once and then chews on one piece.")
            local feeding = world:getItemOnField(emptyPlate)
            world:erase(feeding, 1)
            createPupFox()

            fox.movepoints = fox.movepoints - 260
            fox.waypoints:addWaypoint(denEntrance)
            fox:setOnRoute(true)
        
        else
            common.TurnTo(fox,emptyPlate)
            fox:talk(Character.say, "#me schlingt das Futter eifrig hinunter.",
                "#me eagerly devours the food.")
            local feeding = world:getItemOnField(emptyPlate)
            world:erase(feeding, 1)

            fox.movepoints = fox.movepoints - feedTime
            fox.waypoints:addWaypoint(denEntrance)
            fox:setOnRoute(true)
        end
        feedTime = feedTime + 10

    elseif fox.pos == denEntrance then
        fox:talk(Character.say, "#me versteckt sich wieder.",
            "#me hides again.")
        fox:warp(position(1,1,0)) -- hack to hide loot drop
        fox:increaseAttrib("hitpoints", -10000)
        feededFoxes = feededFoxes - 1
    end
end

return M
