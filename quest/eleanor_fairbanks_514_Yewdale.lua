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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (514, 'quest.eleanor_fairbanks_514_yewdale');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Ein Gute Tat für Oldra"
Title[ENGLISH] = "A Good Deed for Oldra"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Beschaffe einen neue Löffel für Eleanor Fairbanks. Du findest einen auf dem Marktplatz im Runewick."
Description[ENGLISH][1] = "Pick up a new wooden spoon for Eleanor Fairbanks. You can find one in the Marketplace in Runewick."
Description[GERMAN][2] = "Geh zu Eleanor. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Eleanor, she certainly has another task for you."

Description[GERMAN][3] = "Eleanor braucht Kohl, um ihren Eintopf fertig zu kochen. Das Rezept benötigt noch fünfundzwanzig Kohlköpfe. Du kannst Kohl auf dem Marktplatz in Runewick kaufen oder deinen eigenen anbauen."
Description[ENGLISH][3] = "Eleanor needs cabbages to finish making her stew. The recipe calls for twenty five more. You can find cabbages in the Runewick market or you can grow your own."
Description[GERMAN][4] = "Geh zu Eleanor. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Eleanor, she certainly has another task for you."

Description[GERMAN][5] = "Eleanor hat kein Feuerholz mehr. Bring ihr zwanzig Scheite Naldorholz damit sie den Eintopf fertig kochen kann. Verwende das Beil das sie dir gab und geh zu einem Naldorbaum um Holz zu hacken."
Description[ENGLISH][5] = "Eleanor is out of firewood. Bring her twenty naldor logs so that she can cook the stew. Use the hatchet she gave you and go find a naldor tree to chop down."
Description[GERMAN][6] = "Geh zu Eleanor. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Eleanor, she certainly has another task for you."

Description[GERMAN][7] =  "Es scheint, ein paar von Eleanors Schüsseln sind verschwunden. Sie könnte zehn Stück gebrauchen. Geh auf den Marktplatz in Runewick und hole einige für sie."
Description[ENGLISH][7] = "It seems a few of Eleanora's bowls have gone missing. She could use ten more. Go to the market place in Runewick and retrieve some for her."

Description[GERMAN][8] = "Du hast alle Aufgaben für Eleanor Fairbanks erledigt."
Description[ENGLISH][8] = "You have finished all the tasks for Eleanor Fairbanks."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {798, 793, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(798, 793, 0), position(939, 826, 0)}
QuestTarget[2] = {position(798, 793, 0), position(939, 826, 0)}
QuestTarget[3] = {position(798, 793, 0), position(939, 822, 0)}
QuestTarget[4] = {position(798, 793, 0), position(939, 822, 0)}
QuestTarget[5] = {position(798, 793, 0), position(945, 829, 0)}
QuestTarget[6] = {position(798, 793, 0), position(945, 829, 0)}
QuestTarget[7] = {position(798, 793, 0), position(945, 829, 0)}
QuestTarget[8] = {position(798, 793, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 8

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
