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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(338) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(338, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Eine aufgeweckte und fleißige Halblingsdame fängt eifrig jeden, der verloren aussieht, mit fröhlicher Begrüßung ab. Aus einem verwitterten Koffer voller Pergamente verteilt sie Fahrkarten und führt Neuankömmlinge zu wartenden Fähren.","A bright and industrious halfling eagerly intercepts any who look lost with cheerful greetings. With a weathered trunk overflowing with parchments, she hands out tickets and ushers newcomers towards waiting ferries.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Sprich mit Viola Baywillow, um mehr über die drei Reiche von Illarion zu erfahren. Sie kann Informationen über die Anführer, Schutzgötter, Motive, Handwerke und Landschaften der Reiche Auskunft geben, um dir bei der Entscheidung zu helfen, welches Reich am besten zu deinem Charakter passt. Denke jedoch daran, dass Illarion eine dynamische Welt ist und Aspekte wie Gesetze und Politik sich durch den Einfluss von Spielercharakteren schnell ändern können. Mach dir keine Sorgen, wenn du feststellst, dass dein neues Zuhause nicht deinen Wünschen entspricht. Du kannst deine Zugehörigkeit zu einem späteren Zeitpunkt wieder ändern oder sogar ein Gesetzloser werden, indem du mit einem Notar darüber sprichst.\n\nWenn du dich für Cadomyr, Galmair oder Runewick entschieden hast, folge der Straße nach Westen zum Hafen und nimm eine Fähre in das Reich deiner Wahl. Diese erste Fahrt ist kostenlos und du erhälst sichere Fahrt ins Stadtzentrum, wo dir das Tutorial weiterhin hilft, dich in deinem neuen Zuhause zurechtzufinden. Wenn du dich noch nicht bereit fühlst, eine Wahl zu treffen, kannst du auch Troll's Haven und alles, was es zu bieten hat, erkunden.",
            "Talk to Viola Baywillow to learn more of the three realms of Illarion. She can provide information on the leaders, patron gods, motives, crafts, and landscapes of the realms to help you decide which might best suit your character. Remember though, Illarion is a dynamic world and aspects such as laws and politics can rapidly change through the influence of player characters. Don't worry if you find your new home isn't to your liking, you can always change allegiance at a later date, or even become an outlaw by speaking to the Notary.\n\nOnce you have decided to join Cadomyr, Galmair, or Runewick, follow the road west to the harbour and catch a ferry to the realm of your choice. This first journey is free and you will be granted safe passage to the centre of town where the tutorial will continue to help you find your way around your new home. If you do not feel ready to make this choice just yet you are free to explore Troll's Haven and all it has to offer.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
