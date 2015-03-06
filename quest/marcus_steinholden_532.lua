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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (532, 'quest.marcus_steinholden_532');

local common = require("base.common")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Kampf in Akaltuts Kammern"
Title[ENGLISH] = "Akaltut's Chambers Boss Fight"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Töte Drow für  Marcus. Du benötigst noch 20."
Description[ENGLISH][1] = "Kill drow for Marcus. You still need 20."
Description[GERMAN][2] = "Töte Drow für  Marcus. Du benötigst noch 19."
Description[ENGLISH][2] = "Kill drow for Marcus. You still need 19."
Description[GERMAN][3] = "Töte Drow für  Marcus. Du benötigst noch 18."
Description[ENGLISH][3] = "Kill drow for Marcus. You still need 18."
Description[GERMAN][4] = "Töte Drow für  Marcus. Du benötigst noch 17."
Description[ENGLISH][4] = "Kill drow for Marcus. You still need 17."
Description[GERMAN][5] = "Töte Drow für  Marcus. Du benötigst noch 16."
Description[ENGLISH][5] = "Kill drow for Marcus. You still need 16."
Description[GERMAN][6] = "Töte Drow für  Marcus. Du benötigst noch 15."
Description[ENGLISH][6] = "Kill drow for Marcus. You still need 15."
Description[GERMAN][7] = "Töte Drow für  Marcus. Du benötigst noch 14."
Description[ENGLISH][7] = "Kill drow for Marcus. You still need 14."
Description[GERMAN][8] = "Töte Drow für  Marcus. Du benötigst noch 13."
Description[ENGLISH][8] = "Kill drow for Marcus. You still need 13."
Description[GERMAN][9] = "Töte Drow für  Marcus. Du benötigst noch 12."
Description[ENGLISH][9] = "Kill drow for Marcus. You still need 12."
Description[GERMAN][10] = "Töte Drow für  Marcus. Du benötigst noch 11"
Description[ENGLISH][10] = "Kill drow for Marcus. You still need 11."
Description[GERMAN][11] = "Töte Drow für  Marcus. Du benötigst noch 10."
Description[ENGLISH][11] = "Kill drow for Marcus. You still need 10."
Description[GERMAN][12] = "Töte Drow für  Marcus. Du benötigst noch 9."
Description[ENGLISH][12] = "Kill drow for Marcus. You still need 9."
Description[GERMAN][13] = "Töte Drow für  Marcus. Du benötigst noch 8."
Description[ENGLISH][13] = "Kill drow for Marcus. You still need 8."
Description[GERMAN][14] = "Töte Drow für  Marcus. Du benötigst noch 7."
Description[ENGLISH][14] = "Kill drow for Marcus. You still need 7."
Description[GERMAN][15] = "Töte Drow für  Marcus. Du benötigst noch 6."
Description[ENGLISH][15] = "Kill drow for Marcus. You still need 6."
Description[GERMAN][16] = "Töte Drow für  Marcus. Du benötigst noch 5."
Description[ENGLISH][16] = "Kill drow for Marcus. You still need 5."
Description[GERMAN][17] = "Töte Drow für  Marcus. Du benötigst noch 4."
Description[ENGLISH][17] = "Kill drow for Marcus. You still need 4."
Description[GERMAN][18] = "Töte Drow für  Marcus. Du benötigst noch 3."
Description[ENGLISH][18] = "Kill drow for Marcus. You still need 3."
Description[GERMAN][19] = "Töte Drow für  Marcus. Du benötigst noch 2."
Description[ENGLISH][19] = "Kill drow for Marcus. You still need 2."
Description[GERMAN][20] = "Töte Drow für  Marcus. Du benötigst noch 1."
Description[ENGLISH][20] = "Kill drow for Marcus. You still need 1."
Description[GERMAN][21] = "Kehre zurück zum Marcus. Du hast seine Aufgabe erledigt."
Description[ENGLISH][21] = "Report back to Marcus, you have finished his task."

Description[GERMAN][22] = "Marcus hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][22] = "Marcus may have a task for you."

Description[GERMAN][23] = "Töte Akaltut für Marcus. Er verspricht eine wertvolle Belohnung falls du es schaffst."
Description[ENGLISH][23] = "Kill Akaltut for Marcus. He promises a great reward if you manage it."
Description[GERMAN][24] = "Kehre zu Marcus zurück. Du hast Akaltut für ihn erledigt."
Description[ENGLISH][24] = "Report back to Marcus, you have vanquished Akaltut for him."

Description[GERMAN][25] = "Du hast alle Aufgaben für Marcus erledigt."
Description[ENGLISH][25] = "You have completed all tasks for Marcus."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 25

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 532,
    location = {position = position(480, 897, -9), radius = 50},
    queststatus = {from = 1, to = 21},
    questTitle = {german = Title[GERMAN], english = Title[ENGLISH]},
    monsterName = {german = "Dunkelelfen", english = "drows"},
    npcName = "Marcus Steinholden",
    monsterGroupIds = {6} -- all drows
}
monsterQuests.addQuest{
    questId = 532,
    location = {position = position(480, 897, -9), radius = 50},
    queststatus = {from = 23, to = 24},
    questTitle = {german = Title[GERMAN], english = Title[ENGLISH]},
    monsterName = {german = "Akaltut", english = "Akaltut"},
    npcName = "Marcus Steinholden",
    monsterIds = {1141} -- Akaltut
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
