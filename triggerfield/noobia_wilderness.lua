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

function M.MoveToField(Character)
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(347) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(347, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Beim Überqueren der Brücke bleiben Lärm und Trubel des Hafenmarktes zurück und ein einfacher Weg führt in die Wildnis.","Crossing the bridge, the noise and commotion of the harbour market is left behind and a simple path cuts into the wilderness beyond.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "In Illarion gibt es vieles zu entdecken. Doch solltest du nicht alleine reisen, da in diesem Land auch viele gefährliche Monster leben. Auf deinen Reisen solltest du vorsichtig sein, ganz besonders, wenn du Höhlen oder Dungeons betreten möchtest. Die Karte in der oberen rechten Ecke hilft dir zwar bis zu einem gewissen Grad beim Navigieren, aber behalte trotzdem immer auch deine Umgebung im Auge. Schaut dir die Wegweiser genauer an und frage andere Charaktere.\n\nWenn du das Tutorial noch nicht abgeschlossen hast, empfehlen wir dir, umzukehren und damit fortzufahren, bevor du dich weiter wagst. Für jemanden der hier neu ist bieten die Reiche einen sicheren Ort. Dort kannst du dich etablieren, bevor du weiteres erkundest. Um dir bei der Wahl deiner neuen Heimat zu helfen, kann dir Viola Baywillow zu den drei verschiedenen Reichen einige Informationen geben.",
            "There is much to explore in Illarion but you may not want to travel alone as many hostile monsters also inhabit these lands. Take care on your travels and be especially careful when entering caves or dungeons. The map in the top right corner will help you navigate to some degree but be sure to take in your surroundings, check sign posts, and ask other characters.\n\nIf you haven't yet finished the tutorial, we recommend you turn back and continue with that before venturing further. For someone new to these lands the realms offer a much safer place to become established before exploring too far. Viola Baywillow can provide you with more information about the three realms to help you choose a new home.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
