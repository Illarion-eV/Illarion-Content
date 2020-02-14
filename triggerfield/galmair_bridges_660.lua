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
-- INSERT INTO triggerfields VALUES (498,201,0,'triggerfield.galmair_bridges2_660');
-- INSERT INTO triggerfields VALUES (497,201,0,'triggerfield.galmair_bridges2_660');
-- INSERT INTO triggerfields VALUES (496,207,0,'triggerfield.galmair_bridges2_660');

local common = require("base.common")
local factions = require("base.factions")
local deathaftertime = require("lte.deathaftertime")
local longterm_cooldown = require("lte.longterm_cooldown")
local character = require("base.character")

local M = {}

local monster = {} ---monster, numbers are archers -> excluded currently
monster[1]={1,2,3,4,5}; --human
monster[2]={11,12,13,14}; --dwarf 15
monster[3]={21,22,23,24}; --halfling 25
monster[4]={31,32,33,34}; --elf 35
monster[5]={41,42,43,45}; --orc 44
monster[6]={51,52,53,54,55}; -- lizard
monster[7]={91,92,93,95,791,792}; -- troll 94,802,795,796
monster[8]={101,102,103,104,106,151,152,171,172,173}; -- mummy
monster[9]={111,112,113,114,115}; --skeleton
monster[10]={573,574,576,577,578}; --rats 575
monster[11]={891,892,893,901,902,903}; --Imp
monster[12]={782,783}; --golden skeleton 784
monster[13]={301,303,304,305,306}; --golem
monster[14]={851,852,853,861,862,863,871,872,873,881,882,883}; --hellhound
monster[15]={62,63,64,65,66}; -- drow 61,65
monster[16]={201,202,203,204}; --demon skeleton 205

local shutup
local luckybunch

function M.setAmbush(ambushName, ambushState)
    if ambushState ~= true then
        ambushState = false
    end
    ScriptVars:set(ambushName,tostring(ambushState))
    ScriptVars:save()
end

function M.isAmbush(ambushName)
    local foundValue, value = ScriptVars:find(ambushName)
    if value == "true" then
        return true
    else
        return false
    end
end

function M.setLastAmbush(ambushName)
    local currentTime = common.GetCurrentTimestamp()
    local scriptVar = ambushName.."Last"
    ScriptVars:set(scriptVar,tostring(currentTime))
    ScriptVars:save()
end

function M.getTimeSinceLastAmbush(ambushName)
    local currentTime = common.GetCurrentTimestamp()
    local scriptVar = ambushName.."Last"
    local foundValue, value = ScriptVars:find(scriptVar)
    local lastTime = tonumber(value)
    if common.IsNilOrEmpty(lastTime) then
        lastTime = 0
    end
    return currentTime - lastTime
end

function M.triggerAmbush(char, monsterPositions)
    if char:getType() ~= Character.player then --Monsters will be ingored
        return false
    end
    if char:getQuestProgress(660) ~= 0 then --lte check
        return false
    end

    local chance
    if factions.getMembership(char) == 3 then --set chance for Galmairians and non-Galmairians
        chance = 20
        else
        chance = 5
    end

    local fighter = false
    if (char:getSkill(Character.punctureWeapons)>=40) or (char:getSkill(Character.distanceWeapons)>=40) or (char:getSkill(Character.slashingWeapons)>=40) or (char:getSkill(Character.concussionWeapons)>=40) or (char:getSkill(Character.wrestling)>=40) then --check if we have a fighter
        fighter = true
    end
    if math.random(1,100)< chance  and char:increaseAttrib("hitpoints",0)>8000 then --Chance of 1% and Hitpoints above 8000
        if factions.getMembership(char) ~= 3 and (char:getSkill(Character.parry)<=30) or  factions.getMembership(char) ~= 3 and not fighter  then --Newbie and non-fighter protection for non-Galmairian
            return false
        end

        local level
        if (char:getSkill(Character.parry)<=80) then --check of skills of fighter
            level = math.random(1,11) --selection of lower monsters for average fighter
        else
            level = math.random(1,16) --selection of all monsters for good fighter
        end
        
        local enemy
        for i=1, #monsterPositions do
            enemy = monster[level][math.random(1,#monster[level])]
            world:gfx(41,monsterPositions[i])
            world:createMonster(enemy,monsterPositions[i],0);
        end
        char:inform("Oh nein, ein Hinterhalt!", "Oh no, an ambush!") --message for player
        char:setQuestProgress(660,math.random(300,600)) --lte set
        return true
    else
        return false
    end
end

function M.fightAmbush(char)
    local luckybunch = false
    local hero = world:getPlayersInRangeOf(char.pos, 20); --lets see if there is a player around
    for i,player in ipairs(hero) do
        if factions.getMembership(player) == 3 then --check if galmairians are there
            luckybunch = true --if non-galmairians are together with galmairians
        end
    end
    
    if luckybunch then
        local monsters = world:getMonstersInRangeOf(char.pos, 35); --get all monster in player range
        for i,mon in ipairs(monsters) do
            character.DeathAfterTime(mon,math.random(5,10),0,33,true) --kill all monsters
        end
    end
    
    for i,player in ipairs(hero) do
        if factions.getMembership(player) == 3 then --check if galmairians are there
            player:inform("Bevor du auch noch reagieren kannst, schießen Pfeile an dir vorbei und töten deine Widersacher. Du blickst in die Richtung von wo die Pfeile kamen und siehst die Wachen von Galmair dir mit ihren Armbrüsten zuwinken. Gut, dass du dem Don deine Steuern zahlst und er dich beschützt!","Even before you are able to react, arrows shoot around you and take down your enemies. You look to the direction the arrows originated from and see guards of Galmair waving to you with their crossbows. Good, you have paid your taxes to the Don and he protects you!")    --praise the don message for the player
        elseif luckybunch then -- glamairians are here...lucky you
            player:inform("Bevor du auch noch reagieren kannst, schießen Pfeile an dir vorbei und töten deine Widersacher. Du blickst in die Richtung von wo die Pfeile kamen und siehst die Wachen von Galmair euch mit ihren Armbrüsten zuwinken. Gut, dass du jemanden dabei hattest, der dem Don Steuern zahlst und daher beschützt wird vom Don!", "Even before you are able to react, arrows shoot around you and take down your enemies. You look to the direction the arrows originated from and see guards of Galmair waving to you with their crossbows. Good, you have someone with you who has paid taxes to the Don and is thus protected by the Don!")    --wäähh wrong faction but together with friends message for the player
        else -- no galmairians are here...bad luck
            player:inform("Du wirfst einen Blick zurück zur Stadt von Galmair und siehst die Wachen dort wie sie dich und dein Schicksal beobachten. Was, wenn du nur dem Don deine Steuern zahlen würdest?", "You look back to the town of Galmair and see guards watching your fate. What if you had only paid your taxes to the Don?")    --wäähh wrong faction message for the player
         end
        player:setQuestProgress(660,math.random(300,600)) --lte set for all players around
    end
end

return M
