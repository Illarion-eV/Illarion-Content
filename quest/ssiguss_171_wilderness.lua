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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (171, 'quest.ssiguss_171_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Ssiguss Waisenkinder"
Title[ENGLISH] = "Ssiguss's Orphans"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammeln Sie 20 Klumpen Lehm, 10 �sste und 10 B�ndel Getreide. Dann Ssiguss zur�ckzukehren."
Description[ENGLISH][1] = "Collect 20 clay, 10 boughs, and 10 wheat bundles. Then return to Ssiguss."
Description[GERMAN][2] = "Ssiguss hat mehr Arbeit f�r Sie."
Description[ENGLISH][2] = "Check with Ssiguss, he may have another task for you."

Description[GERMAN][3] = "Bringen Ssiguss 30 Eier."
Description[ENGLISH][3] = "Bring Ssiguss 30 eggs."
Description[GERMAN][4] = "Ssiguss hat mehr Arbeit f�r Sie."
Description[ENGLISH][4] = "Check with Ssiguss, he may have another task for you."

Description[GERMAN][5] = "Sammeln Sie 50 Forellen, nehmen sie in Ssiguss."
Description[ENGLISH][5] = "Collect 50 trout, and return to Ssiguss."
Description[GERMAN][6] = "Sie haben alle Ssiguss Aufgaben fertig!"
Description[ENGLISH][6] = "You have finished all of Ssiguss's tasks!"


local npcPos = position(564, 233, 0);

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = npcPos;

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {564, 233, 0}
QuestTarget[2] = {564, 233, 0}
QuestTarget[4] = {564, 233, 0}
QuestTarget[5] = {564, 233, 0}
QuestTarget[7] = {564, 233, 0}
QuestTarget[8] = {564, 233, 0}
QuestTarget[10] = {564, 233, 0}
QuestTarget[11] = {564, 233, 0}
QuestTarget[12] = {564, 233, 0}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 6
function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestTargets(user, status)
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end


return M