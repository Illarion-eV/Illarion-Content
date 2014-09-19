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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (104, 'quest.arenius_batavius_104_cadomyr');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der fehlgeleitete Kreuzzug"
Title[ENGLISH] = "The Errant Crusade"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge sechs weiße Stoffbahnen und bringe sie Arenius. Du kannst sie bei einem Händler kaufen oder mit einer Schere in der Hand am Webstuhl herstellen."
Description[ENGLISH][1] = "Produce six bolts of white cloth and bring them to Arenius. You can buy them from a merchant or produce them by using a needle in your hand, whilst standing in front of a weaving loom."
Description[GERMAN][2] = "Gehe zu Arenius Batavius, der sich am Gasthaus 'Seeufer' in Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Arenius Batavius next to the Inn 'Lakeshore' in Cadomyr, he will certainly have another task for you."
Description[GERMAN][3] = "Gehe in den Unterschlupf des Kults der Salavesh und töte sechs Mumien und bringe Arenius die Eingeweide einer Mumie. Nimm dazu eine Waffe in die Hand und greife die Mumien an."
Description[ENGLISH][3] = "Go into the stronghold of the Cult of Salavesh and kill six mummies. Then bring Arenius the entrails of one mummy. Take a weapon in your hand and attack the mummies."
Description[GERMAN][4] = "Töte noch 5 Mumien."
Description[ENGLISH][4] = "Kill 5 mummies."
Description[GERMAN][5] = "Töte noch 4 Mumien."
Description[ENGLISH][5] = "Kill 4 mummies."
Description[GERMAN][6] = "Töte noch 3 Mumien."
Description[ENGLISH][6] = "Kill 3 mummies."
Description[GERMAN][7] = "Töte noch 2 Mumien."
Description[ENGLISH][7] = "Kill 2 mummies."
Description[GERMAN][8] = "Töte noch eine Mumie."
Description[ENGLISH][8] = "Kill one mummy."
Description[GERMAN][9] = "Kehre zu Arenius Batavius zurück und bringe ihm die Eingeweide einer Mumie."
Description[ENGLISH][9] = "Return to Arenius Batavius and bring him the entrails of on mummy."
Description[GERMAN][10] = "Gehe zu Arenius Batavius, der sich am Gasthaus 'Seeufer' in Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][10] = "Go back to Arenius Batavius next to the Inn 'Lakeshore' in Cadomyr, he will certainly have another task for you."
Description[GERMAN][11] = "Gehe in den Unterschlupf des Kults der Salavesh und töte zwölf Skelette. Nimm dazu eine Waffe in die Hand und greife die Skelette an."
Description[ENGLISH][11] = "Go into the stronghold of the Cult of Salavesh and kill twelve skeletons. Take a weapon in your hand and attack the skeletons."
Description[GERMAN][12] = "Töte noch 11 Skelette."
Description[ENGLISH][12] = "Kill 11 skeletons."
Description[GERMAN][13] = "Töte noch 10 Skelette."
Description[ENGLISH][13] = "Kill 10 skeletons."
Description[GERMAN][14] = "Töte noch 9 Skelette."
Description[ENGLISH][14] = "Kill 9 skeletons."
Description[GERMAN][15] = "Töte noch 8 Skelette."
Description[ENGLISH][15] = "Kill 8 skeletons."
Description[GERMAN][16] = "Töte noch 7 Skelette."
Description[ENGLISH][16] = "Kill 7 skeletons."
Description[GERMAN][17] = "Töte noch 6 Skelette."
Description[ENGLISH][17] = "Kill 6 skeletons."
Description[GERMAN][18] = "Töte noch 5 Skelette."
Description[ENGLISH][18] = "Kill 5 skeletons."
Description[GERMAN][19] = "Töte noch 4 Skelette."
Description[ENGLISH][19] = "Kill 4 skeletons."
Description[GERMAN][20] = "Töte noch 3 Skelette."
Description[ENGLISH][20] = "Kill 3 skeletons."
Description[GERMAN][21] = "Töte noch 2 Skelette."
Description[ENGLISH][21] = "Kill 2 skeletons."
Description[GERMAN][22] = "Töte noch ein Skelett."
Description[ENGLISH][22] = "Kill one skeleton."
Description[GERMAN][23] = "Kehre zu Arenius Batavius zurück."
Description[ENGLISH][23] = "Return to Arenius Batavius."
Description[GERMAN][24] = "Kehre zu Arenius Batavius zurück."
Description[ENGLISH][24] = "Return to Arenius Batavius."
Description[GERMAN][25] = "Gehe zu Arenius Batavius, der sich am Gasthaus 'Seeufer' in Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][25] = "Go back to Arenius Batavius next to the Inn 'Lakeshore' in Cadomyr, he will certainly have another task for you."
Description[GERMAN][26] = "Gehe in den Unterschlupf des Kults der Salavesh und töte zwei menschliche Nekromanten. Nimm dazu eine Waffe in die Hand und greife die Nekromanten an."
Description[ENGLISH][26] = "Go into the stronghold of the Cult of Salavesh and kill two human necromancer. Take a weapon in your hand and attack the human necromancer."
Description[GERMAN][27] = "Töte noch einen menschlichen Nekromanten."
Description[ENGLISH][27] = "Kill one human necromancer."
Description[GERMAN][28] = "Kehre zu Arenius Batavius zurück."
Description[ENGLISH][28] = "Return to Arenius Batavius."
Description[GERMAN][29] = "Gehe zu Arenius Batavius, der sich am Gasthaus 'Seeufer' in Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][29] = "Go back to Arenius Batavius next to the Inn 'Lakeshore' in Cadomyr, he will certainly have another task for you."
Description[GERMAN][30] = "Gehe in den Unterschlupf des Kults der Salavesh und töte ein Dämonenskelett. Nimm dazu eine Waffe in die Hand und greife das Dämonenskelett an. Vielleicht brauchst du auch die Hilfe deiner Freunde um so ein schreckliches Monster zu töten."
Description[ENGLISH][30] = "Go into the stronghold of the Cult of Salavesh and kill a demon skeleton. Take a weapon in your hand and attack the demon skeleton. NOTE: You might need help from friends."
Description[GERMAN][31] = "Kehre zu Arenius Batavius zurück."
Description[ENGLISH][31] = "Return to Arenius Batavius."
Description[GERMAN][32] = "Gehe zu Arenius Batavius, der sich am Gasthaus 'Seeufer' in Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][32] = "Go back to Arenius Batavius next to the Inn 'Lakeshore' in Cadomyr, he will certainly have another task for you."
Description[GERMAN][33] = "Gehe in den Unterschlupf des Kults der Salavesh und töte den antiken Feuerdrachen. Nimm dazu eine Waffe in die Hand und greife den antiken Feuerdrachen an. Vielleicht brauchst du auch die Hilfe deiner Freunde um so ein schreckliches Monster zu töten."
Description[ENGLISH][33] = "Go into the stronghold of the Cult of Salavesh and kill the ancient fire dragon. Take a weapon in your hand and attack the ancient fire dragon. NOTE: You might need help from friends."
Description[GERMAN][34] = "Kehre zu Arenius Batavius zurück."
Description[ENGLISH][34] = "Return to Arenius Batavius."
Description[GERMAN][35] = "Du hast alle Aufgaben von Arenius Batavius erfüllt."
Description[ENGLISH][35] = "You have fulfilled all tasks for Arenius Batavius."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {86, 586, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(86, 586, 0), position(113, 611, 0), position(141, 576, 0)} 
QuestTarget[2] = {position(86, 586, 0)}
QuestTarget[3] = {position(670, 408, -3)} 
QuestTarget[4] = {position(670, 408, -3)}
QuestTarget[5] = {position(670, 408, -3)} 
QuestTarget[6] = {position(670, 408, -3)}
QuestTarget[7] = {position(670, 408, -3)} 
QuestTarget[8] = {position(670, 408, -3)}
QuestTarget[9] = {position(86, 586, 0)} 
QuestTarget[10] = {position(86, 586, 0)}
QuestTarget[11] = {position(670, 408, -3)} 
QuestTarget[12] = {position(670, 408, -3)}
QuestTarget[13] = {position(670, 408, -3)} 
QuestTarget[14] = {position(670, 408, -3)} 
QuestTarget[15] = {position(670, 408, -3)} 
QuestTarget[16] = {position(670, 408, -3)}
QuestTarget[17] = {position(670, 408, -3)} 
QuestTarget[18] = {position(670, 408, -3)}
QuestTarget[19] = {position(670, 408, -3)} 
QuestTarget[20] = {position(670, 408, -3)} 
QuestTarget[21] = {position(670, 408, -3)} 
QuestTarget[22] = {position(670, 408, -3)} 
QuestTarget[23] = {position(86, 586, 0)}
QuestTarget[24] = {position(86, 586, 0)}
QuestTarget[25] = {position(86, 586, 0)}
QuestTarget[26] = {position(670, 408, -3)} 
QuestTarget[27] = {position(670, 408, -3)} 
QuestTarget[28] = {position(86, 586, 0)}
QuestTarget[29] = {position(86, 586, 0)} 
QuestTarget[30] = {position(670, 408, -3)} 
QuestTarget[31] = {position(86, 586, 0)}
QuestTarget[32] = {position(86, 586, 0)}
QuestTarget[33] = {position(688, 392, -3)} 
QuestTarget[34] = {position(86, 586, 0)}
QuestTarget[35] = {position(86, 586, 0)}


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 35


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
