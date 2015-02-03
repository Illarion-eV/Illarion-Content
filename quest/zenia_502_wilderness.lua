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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (502, 'quest.zenia_502_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Preise Zelphia"
Title[ENGLISH] = "Praise Zelphia"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Opfere das Seil der Mutter am Altar (benutzen), um deine Ergebenheit und Bereitschaft, ihrer Dienerin Zenia zu helfen, zu zeigen."
Description[ENGLISH][1] = "Show the rope to the Mother by praying (using) the altar, to show your devotion and willingness to help her servant Zenia."
Description[GERMAN][2] = "Kehre zu Zenia zurück. Du hast ihre Aufgabe erledigt."
Description[ENGLISH][2] = "Return to Zenia, you have finished her task."

Description[GERMAN][3] = "Rede mit Zenia, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][3] = "Check with Zenia, she may have another task for you."

Description[GERMAN][4] = "Sammle 10 Bretter, um Zenia dabei zu helfen, das Material für das Floß zu sammeln."
Description[ENGLISH][4] = "Collect 10 logs for Zenia to help her and gather supplies for your raft."
Description[GERMAN][5] = "Rede mit Zenia, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][5] = "Check with Zenia, she may have another task for you."

Description[GERMAN][6] = "Sammle 20 Batzen Schlamm, um Zenia dabei zu helfen, das Material für das Floß zu sammeln."
Description[ENGLISH][6] = "Collect 20 shovels full of mud for Zenia to help her and gather supplies for your raft."
Description[GERMAN][7] = "Rede mit Zenia, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][7] = "Check with Zenia, she may have another task for you."

Description[GERMAN][8] = "Bringe alle Dinge für den Floßbau zum Altar und erbitte den Beistand der Mutter."
Description[ENGLISH][8] = "Take all materials to the altar and pray to the Mother for help with your raft."

Description[GERMAN][9] = "Mit Hilfe der Mutter ist es dir gelungen, ein Floß zu bauen und die Insel zu verlassen. Zenia kann dir sicher helfen, falls du wieder hier an Land gespült wirst."
Description[ENGLISH][9] = "With the help of the Mother you have successfully built a raft and left the island.  Zenia may be able to assist should you land there again."

Description[GERMAN][10] = "Du musst nochmals mit deinen Gaben am Altar beten, um Hilfe für dein Floß zu erhalten."
Description[ENGLISH][10] = "You must pray again at the altar with your offering to summon your raft."

Description[GERMAN][11] = "Du hast alle Aufgaben erfüllt."
Description[ENGLISH][11] = "You have finished all tasks."

local npcPos = position(760, 339, -9);

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = npcPos;

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
for i = 1, 11 do
  QuestTarget[i] = {npcPos};
end
-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 11


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
    if status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
