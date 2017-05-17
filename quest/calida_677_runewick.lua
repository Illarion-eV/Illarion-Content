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

-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (677, 'quest.calida_677_runewick');

local common = require("base.common")
--module("quest.calida_IDQUEST_runewick", package.seeall)
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Märchensammlung"
Title[ENGLISH] = "The Fairy Tales Collection"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

Description[GERMAN][1] = "Suche die Märchenbücher der Calida-Schwestern. Du findest sie in ganz Illarion verstreut. Komme zurück zu John Smith wenn du eins gelesen hast und beantworte eine Frage zum Inhalt.\nEs handelt sich um die folgenden Bücher:\nCadoson und Letmason\nCumunculus\nDie Schlacht um den Elsbaumwald\nDer singende Brunnen\nDer steinerne Blick \nDer zerbrochene Kranz"
Description[ENGLISH][1] = "Search the fairy tale books written by the Calida sisters. These books you may find scattered all over Illarion. Come back to John Smith once you read one and answer a related question.\nThe following books have to be found:\nBattle for the Elstree Forest\nCadoson and Letmason\nCumunculus\nThe Broken Wreath\nThe Singing Well\nThe Stone Gaze"
Description[GERMAN][2] = "Gehe zurück zu John Smith in Runewick und sage ihm, dass du ein Buch gefinden hast.\nEin Schlüsselwort ist 'Buch'\nNach zwei falschen Antworten musst du 15 Minuten warten, bis du wieder die Frage beantworten kannst.\nDie Frage wird unverändert sein. Eventuell hilft es, das Buch noch einmal zu lesen."
Description[ENGLISH][2] = "Go back to John Smith and told him you found a book.\nOne of the keywords is 'book'\nAfter two wrong answers you have to wait for 15 minutes until you can try it again.\nThe question will be the same. Meanwhile you can read the book once more."
Description[GERMAN][3] = "Beantworte John Smith's Frage zum Inhalt des Märchens. Es handelt sich um ein einfaches Wort."
Description[ENGLISH][3] = "Answer John Smith's question about the content of the fairy tale. He looks for a single simple word."
Description[GERMAN][4] = "Deine erste Antwort beinhaltete nicht das Schlüsselwort. Du hast noch einen zweiten Versuch.\nBeantworte John Smith's Frage zum Inhalt des Märchens. Es handelt sich um ein einfaches Wort."
Description[ENGLISH][4] = "The first answer did not contains the keyword. You got a second chance.\nAnswer John Smith's question about the content of the fairy tale. He looks for a single simple word."
Description[GERMAN][5] = "Die Antwort war richtig. Bedenke, dass John Smith noch eine Belohnung for dich hat."
Description[ENGLISH][5] = "Your answer was right. Please take into consideration, John Smith has a reward for you"

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {901, 808, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {901, 808, 0}
QuestTarget[2] = {901, 808, 0}
QuestTarget[3] = {901, 808, 0}
QuestTarget[4] = {901, 808, 0}
QuestTarget[5] = {901, 808, 0}

-- Insert the quest status which is reached at the end of the quest
-- the quest is designed to be extended and has no real end
FINAL_QUEST_STATUS = 99


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
return M