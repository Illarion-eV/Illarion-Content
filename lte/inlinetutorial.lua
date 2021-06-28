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
            Character:inform("[Tutorial] Dein Charakter ist verletzt. Der rote Balken zeigt dir die Trefferpunkte deines Charakters. Eine Rast wird die Gesundheit deines Charakters verbessern.","[Tutorial] Your character is hurt. The red bar indicates the hitpoints of your character. A rest is recommended to restore health.")
            Character:setQuestProgress(326,1)
        end

        --Low on food
        if Character:increaseAttrib("foodlevel",0) < 10000 and Character:getQuestProgress(327) == 0 then
            Character:inform("[Tutorial] Dein Charakter wird hungrig. Der gelbe Balken zeigt dir die Ausdauer deines Charakters. Du solltest etwas essen, z.B. Früchte.","[Tutorial] Your character is getting hungry. The yellow bar indicates the stamina level of your character. You better eat something, for example fruits.")
            Character:setQuestProgress(327,1)
        end

        --Agressive monster nearby
        if Character:getQuestProgress(328) == 0 and not areas.PointInArea(Character.pos,"trollshaven") then --Orchard rat covered by other message
            local monsters = world:getMonstersInRangeOf(Character.pos, 5)
            if (#monsters > 0) then
                for i, monster in pairs(monsters) do
                    if not common.IsMonsterDocile(monster:getMonsterType()) then
                        Character:inform("[Tutorial] Ein Monster! Du kannst es mit einem Rechtsklick angreifen. Um in den Nahkampf zu gehen, bewege dich zu dem Monster.","[Tutorial] A monster! You can attack it with a right click. For engaging in melee, move close to it.")
                        Character:setQuestProgress(328,1)
                        break
                    end
                end
            end
        end

        --First encounter
        if Character:getQuestProgress(329) == 0 and not areas.PointInArea(Character.pos,"trollshaven") then --Not near the noob spawn to avoid spamming the player
            local dudes = world:getPlayersInRangeOf(Character.pos, 5)
            if (#dudes > 1) then
                Character:inform("[Tutorial] Du bemerkst eine Gestalt in der Ferne, die ihren Geschäften nachgeht. Da du erst vor kurzem angekommen bist überrascht es nicht, dass du du die Person auch beim Näherkommen nicht erkennen wirst.","[Tutorial] You notice a figure in the distance going about their business. Having only recently arrive it can come as no surprise you do not recognise them as the two of you draw closer.")
                local callbackDudes = function() end --empty callback
                local dialogText = common.GetNLS(Character,"Vielleicht möchtest du dich einem anderen Charakter vorstellen oder anderen durch dein Rollenspiel eine Aktion vermitteln. Zusätzlich zu normalen Sprechen kann dein Charakter auch schreien oder flüstern indem du dem Text #s bzw. #w voranstellst. Mit #me rufst ein Emote auf, mit dem du das Erscheinungsbild deines Charakters vermitteln oder eine Handlung deines Charakters beschreiben kannst. Mit #o werden Nachrichten außerhalb deiner Charakterrolle verwendet. Diese sollten jedoch auf ein Minimum beschränkt bleiben, um die Spielatmosphäre nicht zu stören. Wenn sich dein Charakter innerhalb von zwei Feldern einem anderen vorgestellt hat, kannst du #i verwenden, damit der andere den Namen deines Charakters sich merken und dich in Zukunft wieder erkennen kann.","You may want to introduce yourself to another character, or perhaps convey some other action through your role play. In addition to talking normally, your character can shout by prefixing your text with #s or whisper (within two tiles) by prefixing with #w. #me invokes an emote, allowing you to convey the appearance or describe an action of your character. #o is used for out of character messages, but these should be kept to a minimum to avoid breaking the immersion. Once you have introduced your character to another within two tiles, #i  can be used to display your character's name so they will recognise you in future.")
                local dialogTitle = common.GetNLS(Character,"Tutorial","Tutorial")
                local dialogDudes = MessageDialog(dialogTitle, dialogText, callbackDudes)
                Character:requestMessageDialog(dialogDudes)
                Character:setQuestProgress(329,1)
            end
        end
    end

    inlineTutorial.nextCalled=10 --One second
    return true --bailing out in any case

end

function M.removeEffect(inlineTutorial, Character)

    Character:inform("[Tutorial] Es werden keine weiteren Tutorialnachrichten angezeigt.","[Tutorial] No further tutorial messages will be shown.")

end

return M
