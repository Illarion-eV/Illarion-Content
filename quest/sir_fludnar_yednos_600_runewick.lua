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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (600, 'quest.sir_fludnar_yednos_600_runewick');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Ork-Forscher"
Title[ENGLISH] = "Orc-Researcher"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][11] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Zeitalter'."
Description[ENGLISH][11] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'age'."
Description[GERMAN][12] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Unterstützung'."
Description[ENGLISH][12] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'support'."
Description[GERMAN][13] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Vernichter'."
Description[ENGLISH][13] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'Purge'."
Description[GERMAN][14] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'bemerkt'."
Description[ENGLISH][14] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'realized/realised'."
Description[GERMAN][15] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Sonne'."
Description[ENGLISH][15] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'Sun'."
Description[GERMAN][16] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Wiedergutmachung'."
Description[ENGLISH][16] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'remedy'."
Description[GERMAN][17] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Verbindung'."
Description[ENGLISH][17] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'relationship'."
Description[GERMAN][18] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Sommer'."
Description[ENGLISH][18] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'Summer'."
Description[GERMAN][19] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'beten'."
Description[ENGLISH][19] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'pray'."
Description[GERMAN][20] = "Finde Nobarg bei der Kapelle der Fünf im südwestlichen Teil der Karte. Numila Irunnleh in Runewick und Ruzuss in Cadomyr können dir dabei helfen diese zu finden. Wenn du Nobarg gefunden hast, stelle ihm die Frage, die dir Sir Fludnar Yednos gestellt hat. Bedenke, ohne Nobarg kannst du diese Aufgabe nicht lösen. Dein Schlüsselwort für Nobarg lautet: 'Ewigkeit'."
Description[ENGLISH][20] = "Find Nobarg at the Chapel of the Five in the southwestern part of the map. Numila Irunnleh in Runewick and Ruzuss in Cadomyr can help you to find it. When you have found Nobarg you have to ask him the question, which you received from Sir Fludnar Yednos. Consider, you are not able to proceed from here without help from Nobarg. Your keyword for Nobarg is: 'Eternity'."

Description[GERMAN][21] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Eintracht'."
Description[ENGLISH][21] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'Concord'."
Description[GERMAN][22] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'trösten'."
Description[ENGLISH][22] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'comfort'."
Description[GERMAN][23] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Vernichter'."
Description[ENGLISH][23] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'purge'."
Description[GERMAN][24] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Zwietracht'."
Description[ENGLISH][24] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'Discord'."
Description[GERMAN][25] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Sonnenmacher'."
Description[ENGLISH][25] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'sunmaker'."
Description[GERMAN][26] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Drachen'."
Description[ENGLISH][26] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'Dragon'."
Description[GERMAN][27] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Feuer'."
Description[ENGLISH][27] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'fire'."
Description[GERMAN][28] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Stark'."
Description[ENGLISH][28] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'Strong'."
Description[GERMAN][29] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'leben'."
Description[ENGLISH][29] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'live'."
Description[GERMAN][30] = "Überbringe nun die Antwort zu Sir Fludnar Yednos. Dein Stichwort lautet 'Flamme'."
Description[ENGLISH][30] = "Deliver the answer to Sir Fludnar Yednos. Your keyword is 'Flame'."

Description[GERMAN][40] = "Deine Aufgabe für Sir Fludnar Yednos ist beendet."
Description[ENGLISH][40] = "Your task for Sir Fludnar Yednos is over."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {896, 757, 1}



-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[11] = {position(475, 795, 0)} -- Nobarg
QuestTarget[12] = {position(475, 795, 0)} -- Nobarg
QuestTarget[13] = {position(475, 795, 0)} -- Nobarg
QuestTarget[14] = {position(475, 795, 0)} -- Nobarg
QuestTarget[15] = {position(475, 795, 0)} -- Nobarg
QuestTarget[16] = {position(475, 795, 0)} -- Nobarg
QuestTarget[17] = {position(475, 795, 0)} -- Nobarg
QuestTarget[18] = {position(475, 795, 0)} -- Nobarg
QuestTarget[19] = {position(475, 795, 0)} -- Nobarg
QuestTarget[20] = {position(475, 795, 0)} -- Nobarg
QuestTarget[21] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[22] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[23] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[24] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[25] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[26] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[27] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[28] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[29] = {position(896, 757, 1)} -- Sir Fludnar Yednos
QuestTarget[30] = {position(896, 757, 1)} -- Sir Fludnar Yednos


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 40


function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

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
