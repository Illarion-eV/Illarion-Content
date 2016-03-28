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

local M = {}

local emptyPlate = position(814, 391, -3)

local pupSpot1 = position(813, 391, -3)
local pupSpot2 = position(815, 391, -3)
local pupSpot3 = position(813, 392, -3)
local pupSpot4 = position(814, 392, -3)
local pupSpot5 = position(815, 392, -3)

local refuseFeedingField = position(816, 388, -3)
local denEntrance = position(812, 404, -3)

local feedingInProgress = false

local foxDietItems = {
    {itemId = 307}, --[[pork]]
    {itemId = 2940}, --[[raw steak]]
    {itemId = 552}, --[[venison]]
    {itemId = 553}, --[[rabbit meat]]
    {itemId = 2934}, --[[lamb]]
    {itemId = 73}, --[[trout]]
    {itemId = 355}, --[[salmon]]
    {itemId = 1209}, --[[horse mackerel]]
    {itemId = 1210}, --[[rose fish]]
}


function M.tryFeeding(Item, char)
    -- reject stuff if feeding is already started
    if feedingInProgress == true then
        world:createItemFromItem(Item, refuseFeedingField, true)
        world:erase(Item, Item.number)
        return
    end

    local itemId
    for i in pairs(foxDietItems) do
        if Item.id == foxDietItems[i]["itemId"] then
            itemId = foxDietItems[i]["itemId"]
        end
    end

    if itemId == nil then
        -- reject wrong items
        world:createItemFromItem(Item, refuseFeedingField, true)
        world:erase(Item, Item.number)
        return
    end

    if  char:getQuestProgress(559) == 0 and Item.pos == emptyPlate and Item.number >= 5 then --  doing the quest -feeding the fox pups
        --char:setQuestProgress(561, 720) -- set cooldown
        --char:setQuestProgress(559, 1)
        common.InformNLS(char, "Du hast den Welpen das richtige Futter gebracht. Sie kommen heraus um zu fressen.", "You have fed the fox pups an appropriate food and soon they appear to eat.")

        feedingInProgress = true

         --spawn 5 foxes
        local fox

        fox= world:createMonster(601, position(1,1,0), 0)
        fox:warp(denEntrance) -- hack to show model, to work around a client issue
        fox:talk(Character.say, "#me eilt zum Futterteller.",
                                    "#me hurries towards the feeding plate.")
        fox.movepoints = fox.movepoints - 5
        fox.waypoints:addWaypoint(pupSpot1)
        fox:setOnRoute(true)

        fox= world:createMonster(601, position(1,1,0), 0)
        fox:warp(denEntrance) -- hack to show model, to work around a client issue
        fox:talk(Character.say, "#me eilt zum Futterteller.",
            "#me hurries towards the feeding plate.")
        fox.movepoints = fox.movepoints - 5
        fox.waypoints:addWaypoint(pupSpot2)
        fox:setOnRoute(true)

        fox= world:createMonster(602, position(1,1,0), 0)
        fox:warp(denEntrance) -- hack to show model, to work around a client issue
        fox:talk(Character.say, "#me eilt zum Futterteller.",
            "#me hurries towards the feeding plate.")
        fox.movepoints = fox.movepoints - 10
        fox.waypoints:addWaypoint(pupSpot3)
        fox:setOnRoute(true)

        fox= world:createMonster(602, position(1,1,0), 0)
        fox:warp(denEntrance) -- hack to show model, to work around a client issue
        fox:talk(Character.say, "#me eilt zum Futterteller.",
            "#me hurries towards the feeding plate.")
        fox.movepoints = fox.movepoints - 10
        fox.waypoints:addWaypoint(pupSpot4)
        fox:setOnRoute(true)

        fox= world:createMonster(603, position(1,1,0), 0)
        fox:warp(denEntrance) -- hack to show model, to work around a client issue
        fox:talk(Character.say, "#me eilt zum Futterteller.",
            "#me hurries towards the feeding plate.")
        fox.movepoints = fox.movepoints - 20
        fox.waypoints:addWaypoint(pupSpot5)
        fox:setOnRoute(true)
    end
end

-- Called from monster script
function M.foxAbortRoute(fox)
    if fox.pos == pupSpot1 or fox.pos == pupSpot2 or fox.pos == pupSpot3 or fox.pos == pupSpot4 or fox.pos == pupSpot5 then
        fox:talk(Character.say, "#me schlingt das Futter eifrig hinunter.",
            "#me eagerly devours the feeding.")
        local feeding = world:getItemOnField(emptyPlate)
        world:erase(feeding, 1)

        fox.movepoints = fox.movepoints - 50
        fox.waypoints:addWaypoint(denEntrance)
        fox:setOnRoute(true)

    elseif fox.pos == denEntrance then
        fox:talk(Character.say, "#me versteckt sich wieder.",
            "#me hides again.")
        fox:warp(position(1,1,0)) -- hack to hide loot drop
        fox:increaseAttrib("hitpoints", -10000)
        feedingInProgress = false --xxx: should only be done after 5th fox returning
    end
end

return M
