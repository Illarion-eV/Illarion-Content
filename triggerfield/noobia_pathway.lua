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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(333) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(333, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Abgenutztes und mit Gras überwachsenes Kopfsteinpflaster führt vom geschäftigen Pier zwischen einem ruhigen Obstgarten und einem knisternden Lagerfeuern entlang. Dahinter erreicht der Weg zu einem geöffenten Anbau eines hoch aufragenden Gebäudes.","Worn cobbles with edges overgrown by grass lead from the bustling pier, cut between a tranquil orchard and crackling campfire. Beyond the pathway leads to an open front annex of a towering building.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Achte neben der Kommunikation mit anderen Charakteren auch auf andere Dinge, die dein Charakter auf seiner Reise erlebt. Informationen können einen Hinweis auf die Umgebung geben, die dein Charakter betritt, und es kann daher erwartet werden, dass sie das Verhalten deines Charakters beeinflussen.\n\nRollenspiel ist der Kern von Illarion. Tauche ein und passe das Verhalten deines Charakters an die Welt um ihn herum und alles, was ihn beeinflusst, an. Unabhängig von den technischen Möglichkeiten und ihrer Grenzen, musst du dir die Auswirkungen auf deinen Charakter vorstellen, sowohl emotional als auch körperlich. Kämpfe bergen Risiken, Monster können beängstigend sein, Arbeit ist ermüdend, NPCs können Spitzel sein und der Tod wird nie angenehm sein.",
            "As well as communicating with other characters, be sure to note other things your character experiences on their journey. Informs can give an indication of the environment your character enters and can therefore be expected to influence the behaviour of your character.\n\nRoleplaying is the very core of Illarion. Immerse yourself, adapting the behaviour of your character to the world around them and all that influences it. Regardless of engine limits and technical possibilities, imagine the impact on your character both emotionally and physically. Fights carry risk, monsters can be scary, work is tiring, NPCs can be snitches, and death is never going to be pleasant.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
