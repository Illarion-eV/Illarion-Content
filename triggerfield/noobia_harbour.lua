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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(339) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(339, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Wie sich Passagiere rund um das verzierte Pult versammeln werden Münzen getauscht bevor das Einschiffen auf die wartende Fähre beginnt. Auf dem Pult liegt eine vergilbte und oft gebrauchte Schriftrolle, welche in eleganter Schrift eine Reihe von Zielorten auflistet.","Coins are exchanged as passengers gather around an ornate podium before boarding the waiting ferry. A neatly scribed, albeit somewhat discoloured and well-used pell sits on the podium listing a number of destinations.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Fähren bedienen die Häfen in ganz Illarion, einschließlich der drei Reiche, aber sei dir im Klaren, dass sich diese außerhalb der Städte befinden. Sie sind ein günstiges Transportmittel für Gruppen, mit einer Gebühr von zehn Silber für die gesamte Gesellschaft. Der zahlende Charakter wählt das Ziel aus und alle berechtigten Reisenden innerhalb von fünf Feldern um das Pult haben die Möglichkeit an der Reise teilzunehmen.\n\nWenn das deine erste Fahrt vom Hafen ist, kannst du die Fähre kostenlos in das Reich deiner Wahl nehmen. Die Straßen von den Häfen können manchmal gefährlich sein, aber da du neu in diesem Land sind, wirst du sicher in die Stadt deiner Wahl gelangen. Falls du noch nicht mit ihr gesprochen hast, Viola Baywillow kannt dir weitere Informationen über die drei Reiche von Illarion geben. Bist du einem Reich beigetreten, kannst du die Entscheidung jederzeit überdenken und die Zugehörigkeit zu einem späteren Zeitpunkt auch ändern oder sogar ein Gesetzloser werden.",
            "Ferries serve harbours throughout Illarion, including the three realms, but be aware these are situated outside the main towns. They are a cheap means of transportation for groups with a fee of ten silver covering the whole party. The paying character selects the destination and all eligible travellers within five tiles of the podium will be given the option to join the voyage.\n\nIf this is your first journey from the harbour you can catch a ferry to the realm of your choice for free. The roads from the harbours can sometimes be perilous, but as you are new to these lands you will be granted safe passage to the town of your choosing. If you haven't already spoken to her, Viola Baywillow can provide you with more information about the three realms of Illarion. When you join a realm you can always change allegiance at a later date, or even become an outlaw.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
