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

-- called by the server when user:learn(...) is issued by a script

--[[
Call: Character:learn(skill, movePoints, learnLimit);

skill: Name of the skill as skill key, e.g. Character.mining
movePoints: The amount of movePoints or time (1/10s), required by the action, as integer. Do NOT fill in 0, every action relevant for skillgain HAS TO take some time.
learnLimit: Maximum skill level the user can reach with the triggering action.

]]

--Learning speed - Change here if you're unhappy with the learning speed. Skillgain scales in a linear way.
local scalingFactor = 500 --Here, you can mod the learning speed. Higher value=faster

--Constants - Do not change unless you know exactly what you're doing!
local amplification = 100 --An 'abritrary' value that governs the 'resolution' of the MC function.
local damping = 0.0001
local lowerBorder = 2.5 * amplification / damping --below 2.5 % of time spent online, no additional bonus is granted
local normalMC = 4 * lowerBorder --A 'normal' player invests 4x the time (=10 %) into skill related actions
local normalAP = 50 --How many movepoints does a 'normal' action take? Default=50
--Constants - end
    
function M.learn(user, skill, actionPoints, learnLimit)

    local leadAttrib = common.GetLeadAttrib(user, skill) --reading the lead attribute
    local skillValue = user:getSkill(skill) --reading the skill points
    local minorSkill = user:getMinorSkill(skill) --reading the minor skill points; 10000=1 skill point
    local MCvalue = math.max(lowerBorder, user:getMentalCapacity()) --below 0.5% of time spent online, no additional bonus is granted

    if skillValue < learnLimit and skillValue < 100 then --you only learn when your skill is lower than the skill of the learnLimit and your skill is <100

            local skillFactor = (100 - skillValue)/100
            local MCfactor = normalMC / math.max(MCvalue, 1) --10 % of time spent online is considered "normal" -> MCfactor is 1
            local attributeFactor = common.GetAttributeBonus(leadAttrib,0.5); --0.5 to 1.5, depending on attribute, limited to 2
            local intelligenceFactor = common.GetAttributeBonus(user:increaseAttrib("intelligence", 0),0.1); --0.9 to 1.1, depending on attribute, limited to 1.2
            local actionpointFactor = actionPoints / normalAP --An action with 50 AP is "normal"
            
            local minorIncrease = scalingFactor * skillFactor * MCfactor * attributeFactor * intelligenceFactor * actionpointFactor 

            if common.Chance(minorIncrease-math.floor(minorIncrease)) then
                minorIncrease=math.floor(minorIncrease)+1
            else
                minorIncrease=math.floor(minorIncrease)
            end

            --For debugging, use the following line.
            --user:inform("Skill="..user:getSkillName(skill)..", actionPoints="..actionPoints..", skillFactor="..skillFactor..", MCfactor="..MCfactor..", attributeFactor="..attributeFactor..", intelligenceFactor="..intelligenceFactor..", actionpointFactor="..actionpointFactor..", minorIncrease="..minorIncrease..".");

            while minorIncrease > 0 do --for the rare case that an action results in two level ups, we have this loop

                local realIncrease = math.min(minorIncrease, 10000) --to prevent overflow

                if minorSkill + realIncrease < 10000 then
                    user:increaseMinorSkill(skill, realIncrease)

                else --Level up!
                
                    user:increaseMinorSkill(skill, realIncrease) --Increase the skill
                    local skillstring = user:getSkillName(skill)
                    
                    if user:getType() == 0 and user:getQuestProgress(154) ~= 1 then --Only players get an inform once

                        local callbackSkill = function() end --empty callback
                        local dialogTitle = common.GetNLS(user,"Levelaufstieg", "Level up")
                        local dialogText = common.GetNLS(user,
                        "Deine Fertigkeit '"..skillstring.."' hat sich soeben erhöht. Drücke 'C' um deine Fertigkeiten anzeigen zu lassen. Das Fähigkeitensystem Illarions basiert auf 'Learning by doing'. Dein Charakter wird also besser in dem, was er tut. Dein Charakter kann mit der Zeit von einem Anfänger im Handwerk zu einem Meister werden, wodurch er dann eine größere Vielfalt von Gegenständen besserer Qualität herstellen kann.\n\nJe mehr Handlungen du pro Zeit ausführst desto weniger lernst du von jeder Handlung. Unter dem Strich lernt aber jeder Charakter gleich viel über die Zeit. Wir haben dieses System so konstruiert, um den Spielern die Möglichkeit zu geben, so viel Zeit in Rollenspiel oder Training zu stecken wie sie möchten, ohne dass eine Art Illarion zu spielen vom Spiel bevorzugt wird.",
                        "Your skill '"..skillstring.."' just increased. Hit 'C' to review your skills. Illarion's skill system is based on 'learning by doing'. As your character practices certain actions, they begin to improve. Over time your character may develop from an apprentice crafter to a master, allowing him/her to create a larger variety of items at a higher quality. A character may also develop combat skills, improving his/her ability to weild more advanced weapons or wear exotic armour.\n\nThe more actions you do over time, the less you learn from each action. This way, it is on you how much time you want to invest on training your skills, the result after a given time will be the same. We have designed the skill system in this way to give players the opportunity to roleplay or train as much as they want without one style of playing being favoured by the game.")
                        local dialogSkill = MessageDialog(dialogTitle, dialogText, callbackSkill)
                        user:requestMessageDialog(dialogSkill)
                        user:setQuestProgress(154, 1) --Remember that we already informed the player
            
                    elseif user:getType() == 0 then

                        common.TempInformNLS(user, skillstring.." +1", skillstring.." +1")

                    end
                end

                minorIncrease = minorIncrease - 10000

            end

            user:increaseMentalCapacity(amplification * actionPoints)
    end
end


-- invoked every 10 s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function M.reduceMC(user)

    if user:idleTime() < 300 then --Has the user done any action or spoken anything within the last five minutes?
    
        user:increaseMentalCapacity(-1 * math.floor(user:getMentalCapacity() * damping + 0.5)) --reduce MC-points by 0.01 %, rounded correctly.
        local currentMC = user:getMentalCapacity()
        
        if currentMC < ((0.5/damping)-1) then --Mental Capacity cannot drop below 4999 -> Bugged player or cheater
            user:inform("Invalid mental capacity value found: "..currentMC..". Please inform a developer.")
            user:increaseMentalCapacity(normalMC-currentMC) --Reset to default value
        end
    
        --For debugging, use the following line.
        --user:inform("MC="..currentMC..", idleTime="..user:idleTime()..", MCfactor="..normalMC / math.max(lowerBorder, user:getMentalCapacity())..".");
    end
end

return M
