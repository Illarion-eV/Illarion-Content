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
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Märchensammlung"
Title[ENGLISH] = "The Fairy Tales Collection"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
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

-- QuestID: 684 = 1    Cumunculus
-- QuestID: 684 = 2    Cadoson and Letmason
-- QuestID: 684 = 3    Battle for the Elstree Forest
-- QuestID: 684 = 4    The Stone Gaze
-- QuestID: 684 = 5    The Broken Wreath
-- QuestID: 684 = 6    The Singing Well
local TaleSpecific = {}
TaleSpecific[GERMAN] = {}
TaleSpecific[ENGLISH] = {}
TaleSpecific[GERMAN][1] = " Er wollte wissen, wie Enchanta das zweite Mal Cumunculus schützte."
TaleSpecific[ENGLISH][1] = " He wanted to know how Enchanta saved Cumunculus the second time."
TaleSpecific[GERMAN][2] = " Er wollte wissen, was die Brüder im Kantabi Delta fanden."
TaleSpecific[ENGLISH][2] = " He wanted to know what the brotheres found in the Kantabi delta."
TaleSpecific[GERMAN][3] = " Er wollte wissen, wohin die Feen Magier schickten."
TaleSpecific[ENGLISH][3] = " He wanted to know to know to where the fairies sent mages."
TaleSpecific[GERMAN][4] = " Er wollte wissen, wie die besondere Blume aussah."
TaleSpecific[ENGLISH][4] = " He wanted to know how the special flower looked like."
TaleSpecific[GERMAN][5] = " Er wollte wissen, wo das Paar Schutz vor dem Wüten der Götter fand."
TaleSpecific[ENGLISH][5] = " He wanted to know where the couple found shelter from the ravage of the Gods."
TaleSpecific[GERMAN][6] = " Er wollte wissen, was Großvater in seiner Mine abbaute."
TaleSpecific[ENGLISH][6] = " He wanted to know what mined grandfather."

local TaleLocation = {}
TaleLocation[GERMAN] = {}
TaleLocation[ENGLISH] = {}
TaleLocation[GERMAN][1] = "Du hast das Buch in einem Keller einer verlassenen Farm gesehen."
TaleLocation[ENGLISH][1] = "You saw the book in the basement of an abandoned Farm."
TaleLocation[GERMAN][2] = "Du hast das Buch in der Nähe von Königin Rosali Edwards gesehen."
TaleLocation[ENGLISH][2] = "You saw the book near Queen Rosali Edwards."
TaleLocation[GERMAN][3] = "Du hast das Buch bei John Smith gesehen."
TaleLocation[ENGLISH][3] = "You saw the book near John Smith."
TaleLocation[GERMAN][4] = "Du hast das Buch in einer großen Taverne gesehen."
TaleLocation[ENGLISH][4] = "You saw the book in a huge tavern."
TaleLocation[GERMAN][5] = "Du hast das Buch mitten im Nordwald gesehen."
TaleLocation[ENGLISH][5] = "You saw the book in the middle of the northern forest."
TaleLocation[GERMAN][6] = "Du hast das Buch über dem Labor Galmairs gesehen."
TaleLocation[ENGLISH][6] = "You saw the book over the labratory of Galmair."



-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {960, 831, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {960, 831, 0}
QuestTarget[2] = {960, 831, 0}
QuestTarget[3] = {960, 831, 0}
QuestTarget[4] = {960, 831, 0}
QuestTarget[5] = {960, 831, 0}

-- Insert the quest status which is reached at the end of the quest
-- the quest is designed to be extended and has no real end
local FINAL_QUEST_STATUS = 99


function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""
    local currentBook = user:getQuestProgress(684)

    if status == 2 then
        german = german .. "\n" .. TaleLocation[GERMAN][currentBook]
        english = english .. "\n" .. TaleLocation[ENGLISH][currentBook]
    end
    if status == 3 or status == 4 then
        german = german .. TaleSpecific[GERMAN][currentBook] .. "\n" .. TaleLocation[GERMAN][currentBook]
        english = english .. TaleSpecific[ENGLISH][currentBook] .. "\n" .. TaleLocation[ENGLISH][currentBook]
    end

    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return Start
end

function M.QuestTargets(user, status)
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end


return M
