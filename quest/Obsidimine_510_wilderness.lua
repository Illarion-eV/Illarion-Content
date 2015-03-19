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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (510, 'quest.obsidimine_510_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Höhlenforscher"
Title[ENGLISH] = "Spelunker"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = ""
Description[ENGLISH][1] = "Bring Obsidimine two bottles of beer."
Description[GERMAN][2] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][3] = ""
Description[ENGLISH][3] = "Kill two hell hounds at the volcano's base for Obsidimine. You still need two."
Description[GERMAN][4] = ""
Description[ENGLISH][4] = "Kill two hell hounds at the volcano's base for Obsidimine. You still need one."
Description[GERMAN][5] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][5] = "Return to Obsidimine."
Description[GERMAN][6] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][7] = ""
Description[ENGLISH][7] = "Obsidimine would like you to kill the troll known as the Firespitter so that he may explore the mountain more."
Description[GERMAN][8] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][8] = "Return to Obsidimine."
Description[GERMAN][9] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][9] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][10] = "."
Description[ENGLISH][10] = "Locate all the levels of the volcano and dragon cave and report back to Obsidimine. (All levels must be visited. Hint there are five checkpoints.)"
Description[GERMAN][11] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][11] = "Return to Obsidimine."
Description[GERMAN][12] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][13] = ""
Description[ENGLISH][13] = "Search all the vases in the lower levels and find a dragon gem of every colour for Obsidimine."
Description[GERMAN][14] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][14] = "Return to Obsidimine."
Description[GERMAN][15] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][15] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][16] = ""
Description[ENGLISH][16] = "Check the tombstones in the caverns below and find out which dragon was know as the 'Bunny Eater'."
Description[GERMAN][17] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][17] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][18] = ""
Description[ENGLISH][18] = "Check the hedge maze below for a vision about what happened to Eme."
Description[GERMAN][19] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][19] = "Return to Obsidimine."
Description[GERMAN][20] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][20] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][21] = ""
Description[ENGLISH][21] = "Search the coffins below for some evidence of Eme's demise."
Description[GERMAN][22] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][22] = "Return to Obsidimine."
Description[GERMAN][23] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][23] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][24] = ""
Description[ENGLISH][24] = "Obsidimine believe Eme dropped a family locket in a barrel or chest in the caverns below. Find it for him."
Description[GERMAN][25] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][25] = "Return to Obsidimine."
Description[GERMAN][26] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][26] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][27] = ""
Description[ENGLISH][27] = "Search the lute in the lower dragons lair and take one of the golden strings from it for Obsidimine offering to Irmorom."
Description[GERMAN][28] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][28] = "Return to Obsidimine."
Description[GERMAN][29] = "Geh zu Obsidimine. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][29] = "Go back to Obsidimine he will surely have another task for you."
Description[GERMAN][30] = ""
Description[ENGLISH][30] = "Kill the Dragon of Death so that Obsidimine may have peace over Eme's death."
Description[GERMAN][31] = "Kehre zu Obsidimine zurück."
Description[ENGLISH][31] = "Return to Obsidimine."
Description[GERMAN][32] = ""
Description[ENGLISH][32] = "You have completed all tasks for Obsidimine."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {809, 676, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(809, 676, 0)} -- npc
QuestTarget[2] = {position(809, 676, 0)} 
QuestTarget[3] = {position(809, 676, 0), position(805, 632, 0)} -- volcano base
QuestTarget[4] = {position(809, 676, 0), position(805, 632, 0)} -- volcano base
QuestTarget[5] = {position(809, 676, 0)}  
QuestTarget[6] = {position(809, 676, 0)}  
QuestTarget[7] = {position(809, 676, 0), position(826, 643, 2)} -- Upper level of volcano
QuestTarget[8] = {position(809, 676, 0)} 
QuestTarget[9] = {position(809, 676, 0)} 
QuestTarget[10] = {position(809, 676, 0), position(826, 643, 2), position(821, 661, 1), position(657, 701, -3), position(822, 622, -3), position(668, 658, -6)} --checkpoints for looking at all levels
QuestTarget[11] = {position(809, 676, 0)}  
QuestTarget[12] = {position(809, 676, 0)}
QuestTarget[13] = {position(809, 676, 0)} 
QuestTarget[14] = {position(809, 676, 0)} 
QuestTarget[15] = {position(809, 676, 0)}
QuestTarget[16] = {position(809, 676, 0)} 
QuestTarget[17] = {position(809, 676, 0)} 
QuestTarget[18] = {position(809, 676, 0)} 
QuestTarget[19] = {position(809, 676, 0)}
QuestTarget[20] = {position(809, 676, 0)}
QuestTarget[21] = {position(809, 676, 0)}
QuestTarget[22] = {position(809, 676, 0)}
QuestTarget[23] = {position(809, 676, 0)}
QuestTarget[24] = {position(809, 676, 0)}
QuestTarget[25] = {position(809, 676, 0)}
QuestTarget[26] = {position(809, 676, 0)}
QuestTarget[27] = {position(809, 676, 0), position(701, 614, -6)}
QuestTarget[28] = {position(809, 676, 0)}
QuestTarget[29] = {position(809, 676, 0)}
QuestTarget[30] = {position(809, 676, 0)}
QuestTarget[31] = {position(809, 676, 0)}
QuestTarget[32] = {position(809, 676, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 32

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 510,
    location = {position = position(805, 632, 0), radius = 50},
    queststatus = {from = 3, to = 5},
    questTitle = {german = "Höhlenforscher II", english = "Spelunker II"},
    monsterName = {german = "Höllenhund", english = "hell hound"},
    npcName = "Obsidimine",
    monsterIds = {861, 883} -- bloodsniffer and crippled ghost beast
}
monsterQuests.addQuest{
    questId = 510,
    location = {position = position(826, 643, 2), radius = 100},
    queststatus = {from = 7, to = 8},
    questTitle = {german = "Höhlenforscher III", english = "Spelunker III"},
    monsterName = {german = "Feuerspeier", english = "firespitter"},
    npcName = "Obsidimine",
    monsterIds = {795} -- Firespitter
}
monsterQuests.addQuest{
    questId = 510,
    location = {position = position(686, 635, -6), radius = 50},
    queststatus = {from = 30, to = 31},
    questTitle = {german = "Höhlenforscher XI", english = "Spelunker XI"},
    monsterName = {german = "Todesdrachen", english = "Dragon of Death"},
    npcName = "Obsidimine",
    monsterIds = {1123} -- dragon of death
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
    if factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
