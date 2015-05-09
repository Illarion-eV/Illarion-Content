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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (820, 'quest.florain_dreyndel_820_runewick');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Ein guter Anfang in Runewick"
Title[ENGLISH] = "A good beginning in Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zu Daniel Brock und frag ihn nach einer Aufgabe. Du findest ihn im Handwerkshaus auf dem Marktplatz. Du brauchst seine Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][1] = "Go to Daniel Brock and ask him for a task. You can find him in the crafter's house in the market place. You don't have to finish his tasks before you come back to me for another job."
Description[GERMAN][2] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][2] = "Go back to Florain if you need more tasks."
Description[GERMAN][3] = "Gehe zu Judith Tanner und frag sie nach einer Aufgabe. Du findest sie in der Schneiderei am Marktplatz. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][3] = "Go to Judith Tanner and ask her for a task. You can find here at the tailor shop in the market place. You don't have to finish her tasks before you come back to me for another job."
Description[GERMAN][4] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][4] = "Go back to Florain if you need more tasks."
Description[GERMAN][5] = "Gehe zu Zassaria Riverbank und frag sie nach einer Aufgabe. Du findest sie am Hafen. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][5] = "Go to Zassaria Riverbank and ask her for a task. She can be found at the harbour. Zassaria is a lizard, so you can't miss her. You don't have to finish her tasks before you come back to me for another job."
Description[GERMAN][6] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][6] = "Go back to Florain if you need more tasks."
Description[GERMAN][7] = "Gehe zu Neiran El Nayale und frag ihn nach einer Aufgabe. Du findest ihn im Büro der Stadtverwaltung auf der oberen Etage der Bibliothek. Du brauchst seine Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][7] = "Go to Neiran El Nayale and ask him for a task. He can be found in the office of town management on the upper level of the library. You don't have to finish his tasks before you come back to me for another job."
Description[GERMAN][8] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][8] = "Go back to Florain if you need more tasks."
Description[GERMAN][9] = "Gehe zu Baldo Proudtoe und frag ihn nach einer Aufgabe. Du findest ihn in seinem Garten südlich der Äcker. Du brauchst seine Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][9] = "Go to Baldo Proudtoe and ask him for a task. He can be found in his garden south of the fields. You don't have to finish his tasks before you come back to me for another job."
Description[GERMAN][10] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][10] = "Go back to Florain if you need more tasks."
Description[GERMAN][11] = "Gehe zu Nana Winterbutter und frag sie nach einer Aufgabe. Sie ist gleich in Yewdale zu finden. Sie wird wohl am Feuer vor ihrem Haus sitzen und kochen. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][11] = "Go to Nana Winterbutter and ask her for a task. She can be found in Yewdale. She will be sitting cooking at the fire in front of her house. You don't have to finish her tasks before you come back to me for another job."
Description[GERMAN][12] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][12] = "Go back to Florain if you need more tasks."
Description[GERMAN][13] = "Gehe zu Madeline Clarbelis und frag sie nach einer Aufgabe. Sie ist im Haus der Erde zu finden. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][13] = "Go to Madeline Clarbelis and ask her for a task. She can be found in the House of Earth. You don't have to finish her tasks before you come back to me for another job." 
Description[GERMAN][14] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][14] = "Go back to Florain if you need more tasks."
Description[GERMAN][15] = "Gehe zu Uriel Urch und frag ihn nach einer Aufgabe. Er ist auf der Feuerinsel. Du brauchst seine Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][15] = "Go to Uriel Urch and ask him for a task. He can be found on the Island of Fire. You don't have to finish his tasks before you come back to me for another job."
Description[GERMAN][16] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][16] = "Go back to Florain if you need more tasks."
Description[GERMAN][17] = "Gehe zu Lilith Needlehand und frag sie nach einer Aufgabe. Sie ist auf der Marktplatzinsel zu finden. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][17] = "Go to Lilith Needlehand and ask her for a task. She can be found on the island with the market place on it. You don't have to finish her tasks before you come back to me for another job."
Description[GERMAN][18] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][18] = "Go back to Florain if you need more tasks."
Description[GERMAN][19] = "Phillibald hat nach dir gefragt. Du findest ihn in einem der Räume auf dem Martkplatz. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][19] = "Phillibald was looking for you. You can find him in one of the rooms on the market place. You don't have to finish his tasks before you come back to me for another job."
Description[GERMAN][20] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][20] = "Go back to Florain if you need more tasks."
Description[GERMAN][21] = "Gehe zu Cilivren Itiireae und frag sie nach einer Aufgabe. Sie kann südlich der Felder gefunden werden. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][21] = "See Cilivren Itiireae and ask her for a task.  She can be found south of the fields. You don't have to finish her tasks before you come back to me for another job."
Description[GERMAN][22] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][22] = "Go back to Florain if you need more tasks."
Description[GERMAN][23] = "Gehe zu Nadime und frag sie nach einer Aufgabe. Du kannst sie auf dem Martplatz finden. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][23] = "Go to Nadime and ask her for a task. You can find her at the market place. You don't have to finish her tasks before you come back to me for another job."
Description[GERMAN][24] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][24] = "Go back to Florain if you need more tasks."
Description[GERMAN][25] = "Gehe zu Alwin und frag ihn nach einer Aufgabe. Du kannst ihn am Ufer in Yewdale find. Du brauchst ihre Aufgabe nicht zu erfüllen, wenn sie dir nicht behagt. Komm dann einfach hierher zurück, um eine weitere Aufgabe zu bekommen."
Description[ENGLISH][25] = "Go to Alwin and ask him for a task. You can find him in Yewdale. You don't have to finish her tasks before you come back to me for another job."
Description[GERMAN][26] = "Florain Dreyndel kannn dir nun nicht mehr weiterhelfen. Frage einfach jeden, den du triffst nach Aufgaben und du wirst gut zurecktkommen."
Description[ENGLISH][26] = "Florain Dreyndel cannot help you any further now. Just ask everyone you meet for tasks and you will get around just fine."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {929, 819, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(959, 825, 0)} -- Daniel
QuestTarget[2] = {position(929, 819, 0)} -- Florain
QuestTarget[3] = {position(950, 818, 0)} -- Judith
QuestTarget[4] = {position(929, 819, 0)} -- Florain
QuestTarget[5] = {position(910, 849, 1)} -- Zassaria
QuestTarget[6] = {position(929, 819, 0)} -- Florain
QuestTarget[7] = {position(944, 784, 1)} -- Neiran
QuestTarget[8] = {position(929, 819, 0)} -- Florain
QuestTarget[9] = {position(868, 861, 0)} -- Baldo
QuestTarget[10] = {position(929, 819, 0)} -- Florain
QuestTarget[11] = {position(791, 798, 0)} -- Nana
QuestTarget[12] = {position(929, 819, 0)} -- Florain
QuestTarget[13] = {position(903, 757, 0)} -- Madeline
QuestTarget[14] = {position(929, 819, 0)} -- Florain
QuestTarget[15] = {position(940, 766, 0)} -- Uriel
QuestTarget[16] = {position(929, 819, 0)} -- Florain
QuestTarget[17] = {position(940, 817, 0)} -- Lilith
QuestTarget[18] = {position(929, 819, 0)} -- Florain
QuestTarget[19] = {position(960, 831, 1)} -- Phillibald
QuestTarget[20] = {position(929, 819, 0)} -- Florain
QuestTarget[21] = {position(843, 844, 0)} -- Cilivren
QuestTarget[22] = {position(929, 819, 0)} -- Florain
QuestTarget[23] = {position(949, 822, 0)} -- Nadime
QuestTarget[24] = {position(929, 819, 0)} -- Florain
QuestTarget[25] = {position(759, 819, 0)} -- Alwin

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 26


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
