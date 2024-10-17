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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (520, 'quest.gorgophone_520_wilderness');

local common = require("base.common")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Das Nest der Gorgophone"
Title[ENGLISH] = "Gorgophone's Nest"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

local returnTo = {132, 80, 67, 50, 26}
local checkWith = {74, 72, 70, 68, 51, 29, 27, 81}

for i = 0, 24 do
    Description[GERMAN][1+i] = "Töte Kleine Spinnen für Gorgophone. Du musst noch "..25-i.." erledigen."
    Description[ENGLISH][1+i] = "Kill small spiders for Gorgophone.  You still need "..25-i.."."
end

for i = 0, 19 do
    Description[GERMAN][30+i] = "Töte Schreckensspinne, Grubendiener, oder Feuerspinne Spinnen für Gorgophone. Du musst noch "..20-i.." erledigen."
    Description[ENGLISH][30+i] = "Kill Dread Spiders, Pit Servants, or Fire Spiders for Gorgophone. You still need "..20-i.."."
end

for i = 0, 14 do
    Description[GERMAN][52+i] = "Töte Taranteln für Gorgophone. Du musst noch "..15-i.." erledigen."
    Description[ENGLISH][52+i] = "Kill tarantulas for Gorgophone.  You still need "..15-i.."."
end

for i = 0, 4 do
    Description[GERMAN][75+i] = "Töte Spinnenköniginnen für Gorgophone. Du musst noch "..5-i.." erledigen."
    Description[ENGLISH][75+i] = "Kill spider queens for Gorgophone. You still need "..5-i.."."
end

for i = 0, 49 do
    Description[GERMAN][82+i] = "Töte Schattenmampfer, Tarantel, Spinnenkönigin, Ritterfurcht, oder Gynkesische Witwe Spinnen für Gorgophone. Du musst noch "..50-i.." erledigen."
    Description[ENGLISH][82+i] = "Kill Shadow Munchers, Tarantulas, Spider Queens, Kings Frights, or Gynkese Widows for Gorgophone. You still need "..50-i.."."
end

for _, ret in pairs(returnTo) do
    Description[GERMAN][ret] = "Kehre zu Gorgophone zurück, du hast ihre Aufgabe erledigt."
    Description[ENGLISH][ret] = "Return to Gorgophone, you have completed her task."
end

for _, check in pairs(checkWith) do
    Description[GERMAN][check] = "Rede mit Gorgophone, sie hat villeicht eine weitere Aufgabe für dich."
    Description[ENGLISH][check] = "Check with Gorgophone, she may have another task for you."
end

Description[GERMAN][28] = "Bring 5 Wasserflaschen zu Gorgophone."
Description[ENGLISH][28] = "Collect five bottles of water for Gorgophone."
Description[GERMAN][69] = "Bringe 60 Getreidebündel zu Gorgophone."
Description[ENGLISH][69] = "Collect sixty grain bundles for Gorgophone."
Description[GERMAN][71] = "Gorgophone braucht 75 Spindeln Garn von dir."
Description[ENGLISH][71] = "Collect 75 spools of thread for Gorgophone."
Description[GERMAN][73] = "Besorge eine mindestens sehr gute heilige Voulge und bring diese zu Gorgophone."
Description[ENGLISH][73] = "Collect a divine voulge spear, of very good quality or better, for Gorgophone."
Description[GERMAN][133] = "Du hast alle Aufgaben der Gorgophone erledigt."
Description[ENGLISH][133] = "You have completed all tasks of Gorgophone."

local npcPos = position(852, 497, -6);

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = npcPos;

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
for i = 1, 132 do
  QuestTarget[i] = {npcPos};
end

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 133

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 520,
    location = {position = npcPos, radius = 200},
    queststatus = {from = 1, to = 26},
    questTitle = {german = "Das Nest der Gorgophone", english = "Gorgophone's Nest"},
    monsterName = {german = "kleine Spinnen", english = "small spiders"},
    npcName = "Gorgophone",
    monsterIds = {196} -- small spider
}
monsterQuests.addQuest{
    questId = 520,
    location = {position = npcPos, radius = 200},
    queststatus = {from = 30, to = 50},
    questTitle = {german = "Das Nest der Gorgophone", english = "Gorgophone's Nest"},
    monsterName = {german = "Schreckensspinne", english = "Dread Spider, Pit Servant and Fire Spider spiders"},
    npcName = "Gorgophone",
    monsterIds = {191, 192, 211} -- Dread Spider, Pit Servant, Fire Spider
}
monsterQuests.addQuest{
    questId = 520,
    location = {position = npcPos, radius = 200},
    queststatus = {from = 52, to = 67},
    questTitle = {german = "Das Nest der Gorgophone", english = "Gorgophone's Nest"},
    monsterName = {german = "Taranteln", english = "tarantulas"},
    npcName = "Gorgophone",
    monsterIds = {193} -- Tarantula
}
monsterQuests.addQuest{
    questId = 520,
    location = {position = npcPos, radius = 200},
    queststatus = {from = 75, to = 80},
    questTitle = {german = "Das Nest der Gorgophone", english = "Gorgophone's Nest"},
    monsterName = {german = "Spinnenköniginnen", english = "Spider Queens"},
    npcName = "Gorgophone",
    monsterIds = {195} -- Spider queen
}
monsterQuests.addQuest{
    questId = 520,
    location = {position = npcPos, radius = 200},
    queststatus = {from = 82, to = 132},
    questTitle = {german = "Das Nest der Gorgophone", english = "Gorgophone's Nest"},
    monsterName = {german = "Groß Spinnen", english = "Large spiders"},
    npcName = "Gorgophone",
    monsterIds = {193, 195, 221, 231, 232, 261} -- Tarantula, Spider Queen, Gynkese Widow, Kings Fright, Shadow Muncher,Nightmare spider
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
    if status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
