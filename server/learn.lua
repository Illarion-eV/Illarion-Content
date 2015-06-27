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
local lowerBorder = 0.5 * amplification / damping --below 0.5% of time spent online, no additional bonus is granted
local normalMC = 10 * lowerBorder --A 'normal' player invests 10x the time (=5%) into skill related actions
local normalAP = 50 --How many movepoints does a 'normal' action take? Default=50
--Constants - end
    
function M.learn(user, skill, actionPoints, learnLimit)

    local leadAttrib = common.GetLeadAttrib(user, skill) --reading the lead attribute
    local skillValue = user:getSkill(skill) --reading the skill points
    local minorSkill = user:getMinorSkill(skill) --reading the minor skill points; 10000=1 skill point
    local MCvalue = math.max(lowerBorder, user:getMentalCapacity()) --below 0.5% of time spent online, no additional bonus is granted

    if skillValue < learnLimit and skillValue < 100 then --you only learn when your skill is lower than the skill of the learnLimit and your skill is <100

        local chanceForSkillGain = 100 - skillValue

        if math.random(0, 99) < chanceForSkillGain then --Success?

            local MCfactor = normalMC / math.max(MCvalue, 1) --5% of time spent online is considered "normal" -> MCfactor is 1
            local attributeFactor = common.GetAttributeBonus(leadAttrib,0.5); --0.5 to 1.5, depending on attribute, limited to 2
            local intelligenceFactor = common.GetAttributeBonus(user:increaseAttrib("intelligence", 0),0.1); --0.9 to 1.1, depending on attribute, limited to 1.2
            local actionpointFactor = actionPoints / normalAP --An action with 50AP is "normal"
            local minorIncrease = math.floor(scalingFactor * attributeFactor * intelligenceFactor * actionpointFactor * MCfactor)

            --For debugging, use the following line.
            --user:inform("Skill="..user:getSkillName(skill)..", actionPoints="..actionPoints..", MCfactor="..MCfactor..", attributeFactor="..attributeFactor..", intelligenceFactor="..intelligenceFactor..", actionpointFactor="..actionpointFactor..", minorIncrease="..minorIncrease..".");

            while minorIncrease > 0 do --for the rare case that an action results in two level ups, we have this loop

                local realIncrease = math.min(minorIncrease, 10000) --to prevent overflow

                if minorSkill + realIncrease < 10000 then
                    user:increaseMinorSkill(skill, realIncrease) --Minimum of 10 actions of 50 AP for a swirlie at 5% activity

                else --Level up!
                    user:increaseMinorSkill(skill, realIncrease) --Increase the skill

                    if user:getType() == 0 and user:getQuestProgress(154) ~= 1 then --Only players get an inform once

                        local skillstring = user:getSkillName(skill)
                        common.InformNLS(user, "[Levelaufstieg] Deine Fertigkeit '"..skillstring.."' hat sich soeben erhöht. Drücke 'C' um deine Fertigkeiten anzeigen zu lassen.", "[Level up] Your skill '"..skillstring.."' just increased. Hit 'C' to review your skills.")
                        user:setQuestProgress(154, 1) --Remember that we already informed the player

                    elseif user:getType() == 0 then

                        local skillstring = user:getSkillName(skill)
                        common.TempInformNLS(user, skillstring.." +1", skillstring.." +1")

                    end
                end

                minorIncrease = minorIncrease - 10000

            end

        end
        user:increaseMentalCapacity(amplification * actionPoints)
    end
end


-- invoked every 10 s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function M.reduceMC(user)

    if user:idleTime() < 300 then --Has the user done any action or spoken anything within the last five minutes?
    
        user:increaseMentalCapacity(-1 * math.floor(user:getMentalCapacity() * damping + 0.5)) --reduce MC-points by 0.01%, rounded correctly.
        
        if user:getMentalCapacity() < ((0.5/damping)-1) then --Mental Capacity cannot drop below 4999 -> Bugged player or cheater
            user:increaseMentalCapacity(normalMC) --This is default for new players.
        end
    
        --For debugging, use the following line.
        --user:inform("MC="..user:getMentalCapacity()..", idleTime="..user:idleTime()..".");
    end
end

return M
