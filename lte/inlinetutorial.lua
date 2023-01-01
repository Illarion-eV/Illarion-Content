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
-- Long Time Effect Script: Inline Tutorial
-- Effect ID: 13

local common = require("base.common")
local areas = require("content.areas")
local tutorial = require("content.tutorial")

local M = {}

function M.addEffect(inlineTutorial, Character)
end

function M.callEffect(inlineTutorial,Character)

    if Character:getQuestProgress(325) == 2 then --Declined tutorial
        return false --removing the effect
    end

    if Character:getQuestProgress(325) == 1 then --Accepted tutorial
        --Low on health
        if Character:increaseAttrib("hitpoints",0) < 2000 and Character:getQuestProgress(326) == 0 then
            Character:inform(tutorial.getTutorialInformDE("hitpoints"),tutorial.getTutorialInformEN("hitpoints"))
            Character:setQuestProgress(326,1)
        end

        --Low on food
        if Character:increaseAttrib("foodlevel",0) < 10000 and Character:getQuestProgress(327) == 0 then
            Character:inform(tutorial.getTutorialInformDE("foodlevel"),tutorial.getTutorialInformEN("foodlevel"))
            Character:setQuestProgress(327,1)
        end

        --Agressive monster nearby
        if Character:getQuestProgress(328) == 0 and not areas.PointInArea(Character.pos,"trollshaven") then --Orchard rat covered by other message below
            local monsters = world:getMonstersInRangeOf(Character.pos, 5)
            if (#monsters > 0) then
                for i, monster in pairs(monsters) do
                    if not common.IsMonsterDocile(monster:getMonsterType()) then
                        Character:inform(tutorial.getTutorialInformDE("monsters"),tutorial.getTutorialInformEN("monsters"))
                        Character:setQuestProgress(328,1)
                        break
                    end
                end
            end
        end

        --Orchard rat
        if Character:getQuestProgress(354) == 0 and areas.PointInArea(Character.pos,"trollshaven") then
            local monsters = world:getMonstersInRangeOf(Character.pos, 5)
            if (#monsters > 0) then
                for i, monster in pairs(monsters) do
                    if monster:getMonsterType() == 1111 then
                        tutorial.tutorialDialog(Character,354,"orchard rat")
                        break
                    end
                end
            end
        end

        --First encounter
        if Character:getQuestProgress(329) == 0 and not areas.PointInArea(Character.pos,"trollshaven") then --Not near the noob spawn to avoid spamming the player
            local dudes = world:getPlayersInRangeOf(Character.pos, 5)
            if (#dudes > 1) then
                tutorial.tutorialDialog(Character,329,"first encounter")
            end
        end

        --Housing
        if Character:getQuestProgress(359) == 0 then
            if common.GetFrontItemID(Character) == 3772 or common.GetFrontItemID(Character) == 3773 then
                tutorial.tutorialDialog(Character,359,"housing")
            end
        end

    end

    inlineTutorial.nextCalled=10 --One second
    return true --bailing out in any case

end

function M.removeEffect(inlineTutorial, Character)

    Character:inform(tutorial.getTutorialInformDE("end"),tutorial.getTutorialInformEN("end"))

end

return M
