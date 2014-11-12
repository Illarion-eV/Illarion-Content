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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (529, 'quest.Akaltuts_Chamber_529_dungeon');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Kammer von Akaltut V"
Title[ENGLISH] = "Akaltut's Chamber V"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammle zwei Drowschwerter und bringe sie zum Defensor Animus."
Description[ENGLISH][1] = "Collect two drow blades for Defensor Animus."
Description[GERMAN][2] = "Der Defensor Infirmo hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][2] = "The Defensor Infirmo may have a task for you."

Description[GERMAN][3] = "Finde den entlaufenen Höllenhund für Defensor Infirmo und bringe ihn zur Grube zurück."
Description[ENGLISH][3] = "Find the loose Hellhound and return it to the animal pit for Defensor Infirmo."
Description[GERMAN][4] = "Kehre zu Defensor Infimo zurück um deine Belohnung zu erhalten."
Description[ENGLISH][4] = "Return to Defensor Infirmo for your reward."
Description[GERMAN][5] = "Der Defensor Diluo hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][5] = "The Defensor Diluo may have a task for you."

Description[GERMAN][6] = "Sammle vier Himmelsschilder und bringe sie zum Defensor Diluo."
Description[ENGLISH][6] = "Collect four shield of the sky for Defensor Diluo."
Description[GERMAN][7] = "Der Defensor Transfodio hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][7] = "The Defensor Transfodio may have a task for you."

Description[GERMAN][8] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 18."
Description[ENGLISH][8] = "Kill drow for Defensor Transfodio. You still need 18."
Description[GERMAN][9] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 17."
Description[ENGLISH][9] = "Kill drow for Defensor Transfodio. You still need 17."
Description[GERMAN][10] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 16."
Description[ENGLISH][10] = "Kill drow for Defensor Transfodio. You still need 16."
Description[GERMAN][11] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 15."
Description[ENGLISH][11] = "Kill drow for Defensor Transfodio. You still need 15."
Description[GERMAN][12] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 14."
Description[ENGLISH][12] = "Kill drow for Defensor Transfodio. You still need 14."
Description[GERMAN][13] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 13."
Description[ENGLISH][13] = "Kill drow for Defensor Transfodio. You still need 13."
Description[GERMAN][14] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 12."
Description[ENGLISH][14] = "Kill drow for Defensor Transfodio.  You still need 12."
Description[GERMAN][15] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 11."
Description[ENGLISH][15] = "Kill drow for Defensor Transfodio.  You still need 11."
Description[GERMAN][16] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 10."
Description[ENGLISH][16] = "Kill drow for Defensor Transfodio. You still need 10."
Description[GERMAN][17] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 9."
Description[ENGLISH][17] = "Kill drow for Defensor Transfodio. You still need 9."
Description[GERMAN][18] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 8."
Description[ENGLISH][18] = "Kill drow for Defensor Transfodio. You still need 8."
Description[GERMAN][19] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 7."
Description[ENGLISH][19] = "Kill drow for Defensor Transfodio. You still need 7."
Description[GERMAN][20] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 6."
Description[ENGLISH][20] = "Kill drow for Defensor Transfodio. You still need 6."
Description[GERMAN][21] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 5."
Description[ENGLISH][21] = "Kill drow for Defensor Transfodio. You still need 5."
Description[GERMAN][22] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 4."
Description[ENGLISH][22] = "Kill drow for Defensor Transfodio. You still need 4."
Description[GERMAN][23] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 3."
Description[ENGLISH][23] = "Kill drow for Defensor Transfodio. You still need 3."
Description[GERMAN][24] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 2."
Description[ENGLISH][24] = "Kill drow for Defensor Transfodio. You still need 2."
Description[GERMAN][25] = "Töte Drow für den Defensor Transfodio. Du benötigst noch 1."
Description[ENGLISH][25] = "Kill drow for Defensor Transfodio. You still need 1."
Description[GERMAN][26] = "Kehre zurück zum Defensor Transfodio. Du hast seinen Test bestanden."
Description[ENGLISH][26] = "Report back to Defensor Transfodio, you have finished his test."

Description[GERMAN][27] = "Der Defensor Volnus hat vielleicht eine Aufgabe für dich."
Description[ENGLISH][27] = "The Defensor Volnus may have a task for you."

Description[GERMAN][28] = "Du hast den fünften Teil der Prüfung bestanden."
Description[ENGLISH][28] = "You have finished part five of the testing."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 28


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
