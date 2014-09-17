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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (71, 'quest.zerarisa_71_cadomyr');

local common = require("base.common")
local factions = require("base.factions")
module("quest.zerarisa_71_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Kap des Abschiedes"
Title[ENGLISH] = "Cape Farewell"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge zehn Forellen und bringe sie Zerarisa. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][1] = "Obtain ten trout and take them back to Zerarisa. To fish, place yourself next to the water and use a fishing rod."
Description[GERMAN][2] = "Geh zu Zerarisa, die sich am Kap des Abschiedes aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Zerarisa at Cape Farewell, she will certainly have another task for you."
Description[GERMAN][3] = "Besorge zwanzig Lachse und bringe sie Zerarisa. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][3] = "Obtain twenty salmon and take them back to Zerarisa. To fish, place yourself next to the water and use a fishing rod."
Description[GERMAN][4] = "Geh zu Zerarisa, die sich am Kap des Abschiedes aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Zerarisa at Cape Farewell, she will certainly have another task for you."
Description[GERMAN][5] = "Besorge fünf geräucherte Fische und bringe sie Zerarisa. Stelle dich vor eine Räucherhütte und benutze diese."
Description[ENGLISH][5] = "Obtain five smoked fish and take them back to Zerarisa. Stand in front of a smoke oven and use it to cook raw fish."
Description[GERMAN][6] = "Geh zu Zerarisa, die sich am Kap des Abschiedes aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Zerarisa at the Cape Farewell, she will certainly have another task for you."
Description[GERMAN][7] = "Besorge zehn Stück gegerbtes Leder und bringe sie Zerarisa. Du kannst Leder beim Händler kaufen oder du kannst Rohleder oder Fell am Spannrahmen mit einer Rasierklinge gerben."
Description[ENGLISH][7] = "Obtain ten pieces of tanned leather and take them back to Zerarisa. You can buy leather from a merchant or tan raw leather or fur with a razor on a strecher."
Description[GERMAN][8] = "Du hast alle Aufgaben von Zerarisa erfüllt. "
Description[ENGLISH][8] = "You have fulfilled all the tasks for Zerarisa."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {46, 683, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(46, 683, 0), position(42, 686, 0)} -- Angelplatz
QuestTarget[2] = {position(46, 683, 0)} 
QuestTarget[3] = {position(46, 683, 0), position(42, 686, 0)} -- Angelplatz
QuestTarget[4] = {position(46, 683, 0)} 
QuestTarget[5] = {position(46, 683, 0), position(117, 577, 0)} -- smoke oven
QuestTarget[6] = {position(46, 683, 0)} 
QuestTarget[7] = {position(46, 683, 0), position(920, 659, 0), position(911, 798, 1), position(125, 578, 0)} -- Henry Darter, Händler, Spannrahmen
QuestTarget[8] = {position(46, 683, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 8


function QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function QuestStart()
    return Start
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function QuestAvailability(user, status)
    if factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
