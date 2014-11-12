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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (4, 'quest.eugene_burton_4_wildness');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der Wilderer"
Title[ENGLISH] = "The Poacher"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe in den Elsbaumwald östlich von Eugene und jage sechs Schweine. Bringe ihm dann mindestens drei Stücke Schweinefleisch. Um zu Jagen nimm eine Waffe in die Hand und greife die Schweine an."
Description[ENGLISH][1] = "Go into the Elstree forest, east of Eugene, and kill six pigs. Collect the pork you find and bring back to Eugene at least three pieces. To hunt, make sure you have a weapon in your hand and attack the pigs."
Description[GERMAN][2] = "Jage noch fünf Schweine im Elsbaumwald."
Description[ENGLISH][2] = "Kill five more pigs in the Elstree forest."
Description[GERMAN][3] = "Jage noch vier Schweine im Elsbaumwald."
Description[ENGLISH][3] = "Kill four more pigs in the Elstree forest."
Description[GERMAN][4] = "Jage noch drei Schweine im Elsbaumwald."
Description[ENGLISH][4] = "Kill three more pigs in the Elstree forest."
Description[GERMAN][5] = "Jage noch zwei Schweine im Elsbaumwald."
Description[ENGLISH][5] = "Kill two more pigs in the Elstree forest."
Description[GERMAN][6] = "Jage noch ein Schweine im Elsbaumwald."
Description[ENGLISH][6] = "Kill one more pig in the Elstree forest."
Description[GERMAN][7] = "Kehre zu Eugene Burton zurück und bringe ihm mindestens drei Stück Schweinefleisch. Sollte dir das Glück nicht hold gewesen sein, töte noch ein paar Schweine um an mehr Schweinefleisch zu kommen."
Description[ENGLISH][7] = "Return to Eugene Burton with at least three pieces of pork."
Description[GERMAN][8] = "Gehe zu Eugene Burton, der sich am westlichen Rand des Elsbaumwaldes aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Return to Eugene Burton on the western side of the Elstree forest, he certainly has another task for you."
Description[GERMAN][9] = "Gehe in den Elsbaumwald östlich von Eugene und jage zwölf Rinder. Bringe ihm dann sechs Steaks. Um zu Jagen nehme eine Waffe in die Hand und greife die Kühe an."
Description[ENGLISH][9] = "Go into the Elstree forest east of Eugene and kill twelve cows or bulls. Eugene is looking for 6 cuts of premium steak. Be sure to have a weapon in hand to kill more effectively!"
Description[GERMAN][10] = "Jage noch elf Kühe im Elsbaumwald."
Description[ENGLISH][10] = "First one down, keep going you have eleven cows left."
Description[GERMAN][11] = "Jage noch zehn Kühe im Elsbaumwald."
Description[ENGLISH][11] = "Two steaks if you are lucky, otherwise, press on! Ten cows left."
Description[GERMAN][12] = "Jage noch neun Kühe im Elsbaumwald."
Description[ENGLISH][12] = "The work is hard but at least there is plenty of leather, nine cows left."
Description[GERMAN][13] = "Jage noch acht Kühe im Elsbaumwald."
Description[ENGLISH][13] = "Four animals dead but how many steaks?. Eight cows left."
Description[GERMAN][14] = "Jage noch sieben Kühe im Elsbaumwald."
Description[ENGLISH][14] = "Another one falls but more steak is needed. Seven cows left."
Description[GERMAN][15] = "Jage noch sechs Kühe im Elsbaumwald."
Description[ENGLISH][15] = "Keep up the hard work! Six cows left."
Description[GERMAN][16] = "Jage noch fünf Kühe im Elsbaumwald."
Description[ENGLISH][16] = "Don't stop now! Five cows left."
Description[GERMAN][17] = "Jage noch vier Kühe im Elsbaumwald."
Description[ENGLISH][17] = "With any luck you are making progress. Four cows left."
Description[GERMAN][18] = "Jage noch drei Kühe im Elsbaumwald."
Description[ENGLISH][18] = "The work doesn't get any easier but there is a task to complete. Three cows left."
Description[GERMAN][19] = "Jage noch zwei Kühe im Elsbaumwald."
Description[ENGLISH][19] = "The steaks should be stacking up now. Two cows left."
Description[GERMAN][20] = "Jage noch eine Kuh im Elsbaumwald."
Description[ENGLISH][20] = "Stay focused and tend to your work. One cow left."
Description[GERMAN][21] = "Kehre zu Eugene Burton zurück und bringe ihm zwölf Steaks."
Description[ENGLISH][21] = "If Nargun favored you, twelve premium cuts of steak should be in your possession, and you should go back to Eugene, otherwise keep hunting!"
Description[GERMAN][22] = "Gehe zu Eugene Burton, der sich am westlichen Rand des Elsbaumwaldes aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][22] = "Return to Eugene Burton on the western side of the Elstree forest, he certainly has another task for you."
Description[GERMAN][23] = "Gehe in den Elsbaumwald östlich von Eugene und töte sechs Wölfe. Nimm dazu eine Waffe in die Hand und greife die Wölfe an."
Description[ENGLISH][23] = "Go into the Elstree forest east of Eugene and hunt 6 wolves. To hunt take a weapon in your hand and attack the wolves."
Description[GERMAN][24] = "Töte noch fünf Wölfe im Elsbaumwald."
Description[ENGLISH][24] = "Kill five more wolves in the Elstree forest."
Description[GERMAN][25] = "Töte noch vier Wölfe im Elsbaumwald."
Description[ENGLISH][25] = "Kill four more wolves in the Elstree forest."
Description[GERMAN][26] = "Töte noch drei Wölfe im Elsbaumwald."
Description[ENGLISH][26] = "Kill three more wolves in the Elstree forest."
Description[GERMAN][27] = "Töte noch zwei Wölfe im Elsbaumwald."
Description[ENGLISH][27] = "Kill two more wolves in the Elstree forest."
Description[GERMAN][28] = "Töte noch einen Wolf im Elsbaumwald."
Description[ENGLISH][28] = "Kill one more wolf in the Elstree forest."
Description[GERMAN][29] = "Kehre zu Eugene Burton zurück."
Description[ENGLISH][29] = "Return to Eugene Burton."
Description[GERMAN][30] = "Gehe zu Eugene Burton, der sich am westlichen Rand des Elsbaumwaldes aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][30] = "Return to Eugene Burton on the western side of the Elstree forest, he certainly has another task for you."
Description[GERMAN][31] = "Gehe in den Elsbaumwald östlich von Eugene und töte einen Elfen-Jäger. Nimm dazu eine Waffe in die Hand und greife den Elfen-Jäger an."
Description[ENGLISH][31] = "Go into the Elstree forest east of Eugene and kill an Elven Hunter. Be sure to have a weapon in your hand before attacking the elf."
Description[GERMAN][32] = "Kehre zu Eugene Burton zurück."
Description[ENGLISH][32] = "Return to Eugene Burton."
Description[GERMAN][33] = "Du hast alle Aufgaben von Eugene Burton erfüllt."
Description[ENGLISH][33] = "You have fulfilled all tasks for Eugene Burton."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {693, 493, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(789, 483, 0), position(766, 459, 0)} 
QuestTarget[2] = {position(789, 483, 0), position(766, 459, 0)} --Wald
QuestTarget[3] = {position(789, 483, 0), position(766, 459, 0)} 
QuestTarget[4] = {position(789, 483, 0), position(766, 459, 0)}
QuestTarget[5] = {position(789, 483, 0), position(766, 459, 0)} 
QuestTarget[6] = {position(789, 483, 0), position(766, 459, 0)}
QuestTarget[7] = {position(693, 493, 0)} --Eugene
QuestTarget[8] = {position(693, 493, 0)} --Eugene
QuestTarget[9] = {position(766, 459, 0)} 
QuestTarget[10] = {position(766, 459, 0)}
QuestTarget[11] = {position(766, 459, 0)} 
QuestTarget[12] = {position(766, 459, 0)}
QuestTarget[13] = {position(766, 459, 0)} 
QuestTarget[14] = {position(766, 459, 0)} 
QuestTarget[15] = {position(766, 459, 0)} 
QuestTarget[16] = {position(766, 459, 0)}
QuestTarget[17] = {position(766, 459, 0)} 
QuestTarget[18] = {position(766, 459, 0)}
QuestTarget[19] = {position(766, 459, 0)} 
QuestTarget[20] = {position(766, 459, 0)} 
QuestTarget[21] = {position(693, 493, 0)} --Eugene
QuestTarget[22] = {position(693, 493, 0)} --Eugene
QuestTarget[23] = {position(776, 526, 0)}
QuestTarget[24] = {position(776, 526, 0)} 
QuestTarget[25] = {position(776, 526, 0)}
QuestTarget[26] = {position(776, 526, 0)} 
QuestTarget[27] = {position(776, 526, 0)} 
QuestTarget[28] = {position(776, 526, 0)} 
QuestTarget[29] = {position(693, 493, 0)} --Eugene 
QuestTarget[30] = {position(693, 493, 0)} --Eugene 
QuestTarget[31] = {position(803, 441, 0)}
QuestTarget[32] = {position(693, 493, 0)} --Eugene 
QuestTarget[33] = {position(693, 493, 0)} --Eugene


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 33


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
