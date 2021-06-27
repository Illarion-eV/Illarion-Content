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

    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(330) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(330, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Am Ende des Piers steht ein Mann mit wachsamen Augen und schreibt unermüdlich in sein ledergebundenes Buch. Zu seinen freundlichen Grüßen und Ratschlägen für Neuankömmlinge erteilt er ungeduldigen Kaufleuten oder ungestümen Seeleuten auch strenge Verweise.","A sharp-eyed man at the end of the pier diligently writes in a leather-bound journal. Between offering friendly greetings and advice to newcomers, he issues stern repremands to impatient merchants or unruly sailors.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "In Illarion wirst du vielen Nicht-Spieler-Charakteren (NPCs) begegnen, die Funktionen wie Quests, Dienste und Handel unterstützen. Wenn du mit dem Mauszeiger über einen Charakter fährst, siehst du dessen Namen und Gesundheitszustand. Die Namen von NPCs und Spieler-Charakteren sind gelb, während Monsternamen rot sind.\n\nUm mit dem Mann zu sprechen, aktivierst du ggf. die Chat-Box, indem du darauf klickst oder die 'Enter'-Taste verwendest. Gib 'Hallo' ein, um ihn zu begrüßen und drück 'Enter'. Alternativ kannst du auf einen beliebigen NPC doppelklicken, um grundlegende Gesprächsoptionen zu aktivieren. Alle NPCs reagieren auf bestimmte Schlüsselwörter, wenn du innerhalb von zwei Feldern bei ihnen stehst. Wenn du bei der Kommunikation mir einem NPC nicht weiterkommst, kannst du um 'Hilfe' fragen und erhältst eine Liste von empfohlenen Befehlseingaben.\n\nBefolge den Rat von Henry Cunnigan um zu lernen wie du dich ausrüsten und wie du Gegenstände benutzen kannst. Wenn du unsicher sein solltest, was du für eine Quest als nächstes tun musst, kannst du das Questprotokoll benutzen, indem du 'Q' drückst oder auf das Schriftrollen-Symbol in der unteren rechten Ecke des Fensters klickst.",
            "Throughout Illarion you will encounter many non-player characters (NPCs) which support functions such as quests, services, and trade. If you hover your mouse pointer over a character you will see their name and health status. NPC and player character names are yellow, while monster names are red.\n\nTo speak to the man, activate the chat box if necessary by clicking on it or by using the 'Return' key, type 'Hello' to greet him, and hit 'Return'. Alternatively you can double click on any NPC to activate basic talk options. All NPCs react to certain keywords if you are standing within two tiles. If you get stuck trying to communicate with an NPC, asking for 'help' will provide you with a list of recommended commands.\n\nFollow Henry Cunnigan's advice to learn how to equip and use items. If you are ever unsure what you need to do next for a quest, you can find the quest log by pressing 'Q' or clicking on the scroll icon in the bottom right corner of the window.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
