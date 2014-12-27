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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (77, 'quest.miggs_77_galmair');

local common = require("base.common")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Kanalisation von Galmair"
Title[ENGLISH] = "Galmair Sewers"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe hinunter in die Kanalisation und töte 10 Schleime. Nimm die Fackel für etwas Licht mit und halte eine Waffe bereit."
Description[ENGLISH][1] = "Go down into the sewers and kill ten slimes. Take the torch for light but keep a weapon handy in the other."
Description[GERMAN][2] = "Töte noch 9 Schleime in die Kanalisation."
Description[ENGLISH][2] = "Kill 9 more slimes in the sewers."
Description[GERMAN][3] = "Töte noch 8 Schleime in die Kanalisation."
Description[ENGLISH][3] = "Kill 8 more slimes in the sewers."
Description[GERMAN][4] = "Töte noch 7 Schleime in die Kanalisation."
Description[ENGLISH][4] = "Kill 7 more slimes in the sewers."
Description[GERMAN][5] = "Töte noch 6 Schleime in die Kanalisation."
Description[ENGLISH][5] = "Kill 6 more slimes in the sewers."
Description[GERMAN][6] = "Töte noch 5 Schleime in die Kanalisation."
Description[ENGLISH][6] = "Kill 5 more slimes in the sewers."
Description[GERMAN][7] = "Töte noch 4 Schleime in die Kanalisation."
Description[ENGLISH][7] = "Kill 4 more slimes in the sewers."
Description[GERMAN][8] = "Töte noch 3 Schleime in die Kanalisation."
Description[ENGLISH][8] = "Kill 3 more slimes in the sewers."
Description[GERMAN][9] = "Töte noch 2 Schleime in die Kanalisation."
Description[ENGLISH][9] = "Kill 2 more slimes in the sewers."
Description[GERMAN][10] = "Töte noch einen Schleim in die Kanalisation."
Description[ENGLISH][10] = "Kill 1 more slime in the sewers."
Description[GERMAN][11] = "Kehre zu Miggs zurück."
Description[ENGLISH][11] = "Return to Miggs."
Description[GERMAN][12] = "Gehe zu Miggs, der sich in der Bibliothek von Galmair aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Go back to Miggs in the library of Galmair, he certainly has another task for you."
Description[GERMAN][13] = "Gehe hinunter in die Kanalisation und töte fünf Mumien. Nimm die Fackel für etwas Licht mit und halte eine Waffe bereit."
Description[ENGLISH][13] = "Go down into the sewers and kill five mummies. Take this torch for light but keep a weapon ready."
Description[GERMAN][14] = "Töte noch 4 Mumien in die Kanalisation."
Description[ENGLISH][14] = "Kill 4 more mummies in the sewers."
Description[GERMAN][15] = "Töte noch 3 Mumien in die Kanalisation."
Description[ENGLISH][15] = "Kill 3 more mummies in the sewers."
Description[GERMAN][16] = "Töte noch 2 Mumien in die Kanalisation."
Description[ENGLISH][16] = "Kill 2 more mummies in the sewers."
Description[GERMAN][17] = "Töte noch eine Mumie in die Kanalisation."
Description[ENGLISH][17] = "Kill 1 more mummy in the sewers."
Description[GERMAN][18] = "Kehre zu Miggs zurück."
Description[ENGLISH][18] = "Return to Miggs."
Description[GERMAN][19] = "Gehe zu Miggs, der sich in der Bibliothek von Galmair aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][19] = "Go back to Miggs in the library of Galmair, he certainly has another task for you."
Description[GERMAN][20] = "Töte den Halblingdieb in der Kanalisation. Nimm die Fackel für etwas Licht mit und halte eine Waffe bereit."
Description[ENGLISH][20] = "Go down into the sewers and kill that halfling thief. Take this torch for light but keep a weapon ready."
Description[GERMAN][21] = "Kehre zu Miggs zurück."
Description[ENGLISH][21] = "Return to Miggs."
Description[GERMAN][22] = "Du hast alle Aufgaben von Miggs erfüllt."
Description[ENGLISH][22] = "You have fulfilled all tasks for Miggs."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {374, 216, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(303, 338, -6)} 
QuestTarget[2] = {position(303, 338, -6)} 
QuestTarget[3] = {position(303, 338, -6)} 
QuestTarget[4] = {position(303, 338, -6)}
QuestTarget[5] = {position(303, 338, -6)} 
QuestTarget[6] = {position(303, 338, -6)}
QuestTarget[7] = {position(303, 338, -6)} 
QuestTarget[8] = {position(303, 338, -6)} 
QuestTarget[9] = {position(303, 338, -6)} 
QuestTarget[10] = {position(303, 338, -6)}
QuestTarget[11] = {position(374, 216, 0)} 
QuestTarget[12] = {position(374, 216, 0)}
QuestTarget[13] = {position(303, 338, -6)} 
QuestTarget[14] = {position(303, 338, -6)} 
QuestTarget[15] = {position(303, 338, -6)} 
QuestTarget[16] = {position(303, 338, -6)}
QuestTarget[17] = {position(303, 338, -6)} 
QuestTarget[18] = {position(374, 216, 0)}
QuestTarget[19] = {position(374, 216, 0)} 
QuestTarget[20] = {position(293, 328, -6)} 
QuestTarget[21] = {position(374, 216, 0)} 
QuestTarget[22] = {position(374, 216, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 22

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 77,
    location = {position = position(298, 352, -6), radius = 65},
    queststatus = {from = 1, to = 11},
    questTitle = {german = "Die Kanalisation von Galmair I", english = "Galmair Sewers I"},
    monsterName = {german = "Schleime", english = "slimes"},
    npcName = "Miggs",
    raceIds = {61} -- all slimes
}
monsterQuests.addQuest{
    questId = 77,
    location = {position = position(298, 352, -6), radius = 65},
    queststatus = {from = 13, to = 18},
    questTitle = {german = "Die Kanalisation von Galmair II", english = "Galmair Sewers II"},
    monsterName = {german = "stinkige Gullimumien", english = "smelly sewer mummies"},
    npcName = "Miggs",
    raceIds = {10} -- all mummies
}
monsterQuests.addQuest{
    questId = 77,
    location = {position = position(298, 352, -6), radius = 65},
    queststatus = {from = 20, to = 21},
    questTitle = {german = "Die Kanalisation von Galmair III", english = "Galmair Sewers III"},
    monsterName = {german = "den Halblingsdieb", english = "the halfling thief"},
    npcName = "Miggs",
    monsterIds = {23} -- halfling thieves
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
