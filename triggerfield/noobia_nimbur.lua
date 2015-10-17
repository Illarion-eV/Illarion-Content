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
-- INSERT INTO triggerfields VALUES (41,74,100,'triggerfield.noobia_nimbur');
-- INSERT INTO triggerfields VALUES (40,74,100,'triggerfield.noobia_nimbur');
-- INSERT INTO triggerfields VALUES (39,74,100,'triggerfield.noobia_nimbur');
-- INSERT INTO triggerfields VALUES (38,74,100,'triggerfield.noobia_nimbur');

local common = require("base.common")

local M = {}

function M.MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
    local find = Character.effects:find(13) --Noob effect
    if find then --Is this even a noob?
        local value = Character:getQuestProgress(313)
        if (value == 0) then --Didn't visit the triggerfield yet
            Character:setQuestProgress(313, 1) --player passed the triggerfield

            local callbackNewbie = function() end --empty callback
            local dialogText = common.GetNLS(Character,
                "An dieser Station wird dir beigebracht, wie man einem Handwerk nachgeht. Nimbur Goldhand ist ein sehr begabter Artisan, der die nötigen Kenntnisse vermittelt, die du benötigst, um die Laufbahn des Handwerkers einzuschlagen. Handwerke erfordern ebenso wie das Sammeln von Ressourcen ein Handwerkzeug und einen Arbeitsplatz sowie die nötigen Rohstoffe.\n\nMassenproduktion wird dir nicht dabei helfen, ein Handwerk zu meistern, denn du wirst immer weniger lernen, je mehr Handlungen du ohne Rast durchführst. Du kannst deine Zeit also auch mit anderen Aktivitäten im Spiel verbringen, ohne davon einen Nachteil zu haben.",
                "At this station, you will learn how to craft items. Nimbur Goldhand is a very skilled artisan who can teach you the necessary steps to get started with a crafting profession.\n\nCrafting requires a hand tool, just like gathering, and a static tool. You also need the necessary resources.\n\nYou don't need mass production to master a craft as you will learn less and less the more actions you do over time. It is just as beneficial to spend a greater proportion of your time involved in other game activities.")
            local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
            Character:requestMessageDialog(dialogNewbie)
        end
    end
end

return M
