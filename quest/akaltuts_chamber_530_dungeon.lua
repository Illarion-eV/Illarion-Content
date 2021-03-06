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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (530, 'quest.Akaltuts_Chamber_530_dungeon');

local common = require("base.common")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Kammer von Akaltut VI"
Title[ENGLISH] = "Akaltut's Chamber VI"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 20."
Description[ENGLISH][1] = "Kill drow for Defensor Volnus.  You still need 20."
Description[GERMAN][2] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 19."
Description[ENGLISH][2] = "Kill drow for Defensor Volnus.  You still need 19."
Description[GERMAN][3] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 18."
Description[ENGLISH][3] = "Kill drow for Defensor Volnus. You still need 18."
Description[GERMAN][4] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 17."
Description[ENGLISH][4] = "Kill drow for Defensor Volnus. You still need 17."
Description[GERMAN][5] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 16."
Description[ENGLISH][5] = "Kill drow for Defensor Volnus. You still need 16."
Description[GERMAN][6] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 15."
Description[ENGLISH][6] = "Kill drow for Defensor Volnus. You still need 15."
Description[GERMAN][7] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 14."
Description[ENGLISH][7] = "Kill drow for Defensor Volnus. You still need 14."
Description[GERMAN][8] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 13."
Description[ENGLISH][8] = "Kill drow for Defensor Volnus. You still need 13."
Description[GERMAN][9] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 12."
Description[ENGLISH][9] = "Kill drow for Defensor Volnus.  You still need 12."
Description[GERMAN][10] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 11"
Description[ENGLISH][10] = "Kill drow for Defensor Volnus.  You still need 11."
Description[GERMAN][11] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 10."
Description[ENGLISH][11] = "Kill drow for Defensor Volnus. You still need 10."
Description[GERMAN][12] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 9."
Description[ENGLISH][12] = "Kill drow for Defensor Volnus. You still need 9."
Description[GERMAN][13] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 8."
Description[ENGLISH][13] = "Kill drow for Defensor Volnus. You still need 8."
Description[GERMAN][14] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 7."
Description[ENGLISH][14] = "Kill drow for Defensor Volnus. You still need 7."
Description[GERMAN][15] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 6."
Description[ENGLISH][15] = "Kill drow for Defensor Volnus. You still need 6."
Description[GERMAN][16] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 5."
Description[ENGLISH][16] = "Kill drow for Defensor Volnus. You still need 5."
Description[GERMAN][17] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 4."
Description[ENGLISH][17] = "Kill drow for Defensor Volnus. You still need 4."
Description[GERMAN][18] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 3."
Description[ENGLISH][18] = "Kill drow for Defensor Volnus. You still need 3."
Description[GERMAN][19] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 2."
Description[ENGLISH][19] = "Kill drow for Defensor Volnus. You still need 2."
Description[GERMAN][20] = "T�te Drow f�r den Defensor Volnus. Du ben�tigst noch 1."
Description[ENGLISH][20] = "Kill drow for Defensor Volnus. You still need 1."
Description[GERMAN][21] = "Kehre zur�ck zum Defensor Volnus. Du hast seinen Test bestanden."
Description[ENGLISH][21] = "Report back to Defensor Volnus, you have finished his test."

Description[GERMAN][22] = "Der Defensor Extremus hat vielleicht eine Aufgabe f�r dich."
Description[ENGLISH][22] = "The Defensor Extremus may have a task for you."

Description[GERMAN][23] = "T�te Drow F�hrer f�r den Defensor Extremus. Du ben�tigst noch drei."
Description[ENGLISH][23] = "Kill drow leaders for Defensor Extremus.  You still need three."
Description[GERMAN][24] = "T�te Drow F�hrer f�r den Defensor Extremus. Du ben�tigst noch zwei."
Description[ENGLISH][24] = "Kill drow leaders for Defensor Extremus.  You still need two."
Description[GERMAN][25] = "T�te Drow F�hrer f�r den Defensor Extremus. Du ben�tigst noch einen."
Description[ENGLISH][25] = "Kill drow leaders for Defensor Extremus.  You still need one."
Description[GERMAN][26] = "Kehre zur�ck zum Defensor Extremus. Du hast seinen Test bestanden."
Description[ENGLISH][26] = "Report back to Defensor Extremus, you have finished his test."

Description[GERMAN][27] = "Du hast alle Pr�fungen der Defensoren bestanden."
Description[ENGLISH][27] = "You have passed all the tests of the Defensors."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 27

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 530,
    location = {position = position(470, 802, -9), radius = 100},
    queststatus = {from = 1, to = 21},
    questTitle = {german = Title[GERMAN], english = Title[ENGLISH]},
    monsterName = {german = "Dunkelelfen", english = "drows"},
    npcName = "Defensor Volnus",
    monsterGroupIds = {6} -- all drows
}
monsterQuests.addQuest{
    questId = 530,
    location = {position = position(470, 802, -9), radius = 100},
    queststatus = {from = 23, to = 26},
    questTitle = {german = Title[GERMAN], english = Title[ENGLISH]},
    monsterName = {german = "Dunkelelfen-Anf�hrer", english = "drow leaders"},
    npcName = "Defensor Extremus",
    monsterIds = {65} -- drow leader
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

function M.QuestAvailability(user, status)
    return Player.questAvailable
end

return M
