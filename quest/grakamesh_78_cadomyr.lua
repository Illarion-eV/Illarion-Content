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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (78, 'quest.grakamesh_78_cadomyr');

local common = require("base.common")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Sir Reginalds Gruft"
Title[ENGLISH] = "Sir Reginald's Tomb"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe hinunter in Sir Reginalds Gruft und töte 10 Mumien. Nimm dazu am besten die Fackel als Lichtquelle und eine Waffe in die Hand."
Description[ENGLISH][1] = "Go down into Sir Reginald's Tomb and kill ten mummies. Take the torch or another weapon in your hand."
Description[GERMAN][2] = "Töte noch 9 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][2] = "Kill 9 mummies in Sir Reginald's Tomb."
Description[GERMAN][3] = "Töte noch 8 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][3] = "Kill 8 mummies in Sir Reginald's Tomb."
Description[GERMAN][4] = "Töte noch 7 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][4] = "Kill 7 mummies in Sir Reginald's Tomb."
Description[GERMAN][5] = "Töte noch 6 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][5] = "Kill 6 mummies in Sir Reginald's Tomb."
Description[GERMAN][6] = "Töte noch 5 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][6] = "Kill 5 mummies in Sir Reginald's Tomb."
Description[GERMAN][7] = "Töte noch 4 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][7] = "Kill 4 mummies in Sir Reginald's Tomb."
Description[GERMAN][8] = "Töte noch 3 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][8] = "Kill 3 mummies in Sir Reginald's Tomb."
Description[GERMAN][9] = "Töte noch 2 Mumien in Sir Reginalds Gruft."
Description[ENGLISH][9] = "Kill 2 mummies in Sir Reginald's Tomb."
Description[GERMAN][10] = "Töte noch eine Mumie in Sir Reginalds Gruft."
Description[ENGLISH][10] = "Kill one mummy in Sir Reginald's Tomb."
Description[GERMAN][11] = "Kehre zu Grakamesh zurück."
Description[ENGLISH][11] = "Return to Grakamesh."
Description[GERMAN][12] = "Gehe zu Grakamesh, der sich bei Sir Reginalds Gruft in Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Go back to Grakamesh next to Sir Reginald's Tomb in Cadomyr, he will certainly have another task for you."
Description[GERMAN][13] = "Gehe hinunter in Sir Reginalds Gruft und töte fünf Schleime. Nimm dazu am besten die Fackel und eine Waffe in die Hand."
Description[ENGLISH][13] = "Go down into Sir Reginald's Tomb and kill five slimes. Take the torch and a weapon in your hands."
Description[GERMAN][14] = "Töte noch 4 Schleime in Sir Reginalds Gruft."
Description[ENGLISH][14] = "Kill 4 slimes in Sir Reginald's Tomb."
Description[GERMAN][15] = "Töte noch 3 Schleime in Sir Reginalds Gruft."
Description[ENGLISH][15] = "Kill 3 slimes in Sir Reginald's Tomb."
Description[GERMAN][16] = "Töte noch 2 Schleime in Sir Reginalds Gruft."
Description[ENGLISH][16] = "Kill 2 slimes in Sir Reginald's Tomb."
Description[GERMAN][17] = "Töte noch einen Schleim in Sir Reginalds Gruft."
Description[ENGLISH][17] = "Kill one slime in Sir Reginald's Tomb."
Description[GERMAN][18] = "Kehre zu Grakamesh zurück."
Description[ENGLISH][18] = "Return to Grakamesh."
Description[GERMAN][19] = "Gehe zu Grakamesh, der sich bei Sir Reginalds Gruft in Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][19] = "Go back to Grakamesh next to Sir Reginald's Tomb in Cadomyr, he will certainly have another task for you."
Description[GERMAN][20] = "Töte das Skelett in Sir Reginalds Grabkammer. Nimm dazu am Besten eine Waffe in die Hand."
Description[ENGLISH][20] = "Go down into Sir Reginald's Tomb and kill the skeleton. Take a weapon for this task."
Description[GERMAN][21] = "Kehre zu Grakamesh zurück."
Description[ENGLISH][21] = "Return to Grakamesh."
Description[GERMAN][22] = "Du hast alle Aufgaben von Grakamesh erfüllt."
Description[ENGLISH][22] = "You have fulfilled all tasks for Grakamesh."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {133, 638, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(131, 638, 0)} 
QuestTarget[2] = {position(131, 638, 0)} 
QuestTarget[3] = {position(131, 638, 0)} 
QuestTarget[4] = {position(131, 638, 0)}
QuestTarget[5] = {position(131, 638, 0)} 
QuestTarget[6] = {position(131, 638, 0)}
QuestTarget[7] = {position(131, 638, 0)} 
QuestTarget[8] = {position(131, 638, 0)} 
QuestTarget[9] = {position(131, 638, 0)} 
QuestTarget[10] = {position(131, 638, 0)}
QuestTarget[11] = {position(133, 638, 0)} 
QuestTarget[12] = {position(133, 638, 0)}
QuestTarget[13] = {position(131, 638, 0)} 
QuestTarget[14] = {position(131, 638, 0)} 
QuestTarget[15] = {position(131, 638, 0)} 
QuestTarget[16] = {position(131, 638, 0)}
QuestTarget[17] = {position(131, 638, 0)} 
QuestTarget[18] = {position(133, 638, 0)}
QuestTarget[19] = {position(133, 638, 0)} 
QuestTarget[20] = {position(131, 638, 0), position(157, 668, -4)} 
QuestTarget[21] = {position(133, 638, 0)} 
QuestTarget[22] = {position(133, 638, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 22

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 78,
    location = {position = position(135, 655, -4), radius = 50},
    queststatus = {from = 1, to = 11},
    questTitle = {german = "Sir Reginalds Gruft I", english = "Sir Reginald's Tomb I"},
    monsterName = {german = "Mumien", english = "mummies"},
    npcName = "Grakamesh",
    raceIds = {10} -- all mummies
}
monsterQuests.addQuest{
    questId = 78,
    location = {position = position(135, 655, -4), radius = 50},
    queststatus = {from = 13, to = 18},
    questTitle = {german = "Sir Reginalds Gruft II", english = "Sir Reginald's Tomb II"},
    monsterName = {german = "Schleime", english = "slimes"},
    npcName = "Grakamesh",
    raceIds = {61} -- all slimes
}
monsterQuests.addQuest{
    questId = 78,
    location = {position = position(135, 655, -4), radius = 50},
    queststatus = {from = 20, to = 21},
    questTitle = {german = "Sir Reginalds Gruft III", english = "Sir Reginald's Tomb III"},
    monsterName = {german = "das Geisterskelett", english = "the ghosts skeleton"},
    npcName = "Grakamesh",
    monsterIds = {115} -- ghost skeleton
}

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
