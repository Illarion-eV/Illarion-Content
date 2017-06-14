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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (515, 'quest.aelfinn_515_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Rette Milly!"
Title[ENGLISH] = "Rescue Milly!"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Aelfinn braucht deine Hilfe. Sieh nach ob du den Eingang in das Versteck der Kultisten findest. Überprüfe das Lager der Orcs im Norden."
Description[ENGLISH][1] = "Aelfinn needs your help. See if you can find the entrance to the cultists lair. Check within the encampment of orcs to the north."
Description[GERMAN][2] = "Du hast den Eingang gefunden. Kehre zu Aelfinn zurück."
Description[ENGLISH][2] = "You have found the entrance. Return to Aelfinn."
Description[GERMAN][3] = "Geh zu Aelfinn. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][3] = "Go back to Aelfinn, he certainly has another task for you."

Description[GERMAN][4] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch zehn."
Description[ENGLISH][4] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need ten."
Description[GERMAN][5] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch neun."
Description[ENGLISH][5] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need nine."
Description[GERMAN][6] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch acht."
Description[ENGLISH][6] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need eight."
Description[GERMAN][7] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch sieben."
Description[ENGLISH][7] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need seven."
Description[GERMAN][8] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch sechs."
Description[ENGLISH][8] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need six."
Description[GERMAN][9] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst fünf."
Description[ENGLISH][9] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need five."
Description[GERMAN][10] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch vier."
Description[ENGLISH][10] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need four."
Description[GERMAN][11] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch drei."
Description[ENGLISH][11] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need three."
Description[GERMAN][12] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst zwei."
Description[ENGLISH][12] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need two."
Description[GERMAN][13] = "Um Milly suchen zu können, musst du zehn Orks töten. Kehre zu Aelfinn zurück, wenn du fertig bist. Du brauchst noch eine"
Description[ENGLISH][13] = "In order to find Milly, you need to kill ten orcs so you can search for her safely. Return to Aelfinn when you are finished. You still need one."
Description[GERMAN][14] = "Du hast zehn Orks getötet. Kehre zurück zu Aelfinn."
Description[ENGLISH][14] = "You have killed ten orcs. Return to Aelfinn."
Description[GERMAN][15] = "Geh zu Aelfinn. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][15] = "Go back to Aelfinn, he certainly has another task for you."


Description[GERMAN][16] = "Suche in der Dragorog Kultisten Höhle nach Milly. Sie muss da irgendwo sein. Wenn du sie gefunden hast, bringe sie sicher zu Aelfinn zurück."
Description[ENGLISH][16] = "Search the Dragorog cultist's lair for Milly. She has to be in there somewhere. When you find her, return her to Aelfinn safely."
Description[GERMAN][17] = "Du hast Milly gefunden. Kehre zu Aelfinn zurück und teile ihm die bedauerliche Nachricht mit."
Description[ENGLISH][17] = "You have found Milly. Return to Aelfinn and tell him the regrettable news."
Description[GERMAN][18] = "Geh zu Aelfinn. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][18] = "Go back to Aelfinn, he certainly has another task for you."

Description[GERMAN][19] = "Die Kultisten müssen gestoppt werden. Übe Rache für Millys Tod und töte den Ork-Schamanen."
Description[ENGLISH][19] = "The cultists must be stopped. Seek revenge for Milly's death and kill the orc shaman."
Description[GERMAN][20] = "Du hast den Ork-Schamanen getötet. Kehrt zu Aelfinn zurück und lasst es ihn wissen."
Description[ENGLISH][20] = "You have killed the orc shaman. Return to Aelfinn and let him know."
Description[GERMAN][21] = "Geh zu Aelfinn. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][21] = "Go back to Aelfinn, he certainly has another task for you."

Description[GERMAN][22] = "Aelfinn hat festgestellt, dass es einen bedeutenderen Unhold gibt, die den Dragorog Cult führt. Geh und reinige die Höhle von dem Bösen und zerschlage diese unheilige Sekte."
Description[ENGLISH][22] = "Aelfinn has determined that there is a greater darkness running the Dragorog cult. Go cleanse the cave of this evil and put an end to the unholy sect."
Description[GERMAN][23] = "Du hast den dunklen Paladin getötet. Zurück zu Aelfinn."
Description[ENGLISH][23] = "You have killed the dark paladin. Return to Aelfinn."

Description[GERMAN][24] = "Du hast alle Aufgaben für Aelfinn Russ erledigt."
Description[ENGLISH][24] = "You have finished all tasks for Aelfinn."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {353, 532, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[2] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[3] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[4] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[5] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[6] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[7] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[8] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[9] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[10] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[11] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[12] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[13] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[14] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[15] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[16] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[17] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[18] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[19] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[20] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[21] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[22] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[23] = {position(353, 532, 0), position(372, 476, 1)}
QuestTarget[24] = {position(353, 532, 0)}


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 24

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 515,
    location = {position = position(410, 460, 2), radius = 60},
    queststatus = {from = 4, to = 14},
    questTitle = {german = "Rette Miley! II", english = "Rescue Milly! II"},
    monsterName = {german = "Ork, Diebe, Jäger, und Krieger", english = "Orcs, Thieves, Hunters, and Warrior"},
    npcName = "Aelfinn",
    monsterGroupIds = {4} -- all orcs
}

monsterQuests.addQuest{
    questId = 515,
    location = {position = position(410, 460, 2), radius = 60},
    queststatus = {from = 19, to = 20},
    questTitle = {german = "Rette Miley! IV", english = "Rescue Milly! IV"},
    monsterName = {german = "Ork-Schamanen", english = "Orc Shaman"},
    npcName = "Aelfinn",
    monsterIds = {45} -- Orc Shaman
}

monsterQuests.addQuest{
    questId = 515,
    location = {position = position(410, 460, 2), radius = 60},
    queststatus = {from = 22, to = 23},
    questTitle = {german = "Rette Miley! V", english = "Rescue Milly! V"},
    monsterName = {german = "dunklen Paladin", english = "Dark Paladin"},
    npcName = "Aelfinn",
    monsterIds = {7} -- Human Necromancer
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
