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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(332) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(332, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Die Wärme eines knisterndes Feuers ist einladend und mit den alten darum gelegten Baumstämmen bietet sich eine einfache Gelegenheit zum Rasten und eine Pause einzulegen. Funken der leuchtenden Glut fallen auf den zerstoßenen Boden, abgetreten von den vielen Reisenden, die sich Geschichten erzählen, während sie sich hier eine Weile ausruhen.","Old logs drawn around the inviting warmth of a crackling fire offer a simple place for respite. Sparks from the glowing embers fall to the scuffed ground, worn bare by many a traveller sharing tales as they rest a while.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Den Charakteren, denen du in Illarion begegnen wirst, haben alle ihre eigene Persönlichkeit mit Stärken und Schwächen, die von ihrer Vergangenheit geprägt und von persönlichen Zielen angetrieben werden. Interagiere mit ihnen und entdecke ihre Geschichten, während du deine eigenen erschaffst. Gemeinsam schreibt ihr die Zukunft von Illarion. Wenn du dich mit anderen an einem Lagerfeuer versammelst, um Geschichten über epische Abenteuer zu erzählen oder einfach nur den neuesten Klatsch zu erfahren, wirst du Teil ihrer Geschichte, genauso wie sie deine beeinflussen. Egal, ob eure Charaktere in Zukunft zu Freunden oder Feinden werden, kooperatives Rollenspiel sorgt dafür, dass wir miteinander und nicht gegeneinander spielen.",
            "The characters that you will encounter in Illarion all have their own personality with strengths and flaws, shaped by their past and driven by personal goals. Interact with them and discover their stories as you create your own, together you will write the future of Illarion. As you gather around a campfire to share tales of epic adventures or simply catch up on the latest gossip you become part of their story, just as they influence yours. Whether your characters become friends or foe in the future, cooperative roleplay ensures we play with each other, not against each other.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
