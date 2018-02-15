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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (72, 'quest.ehrom_goldhammer_72_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Der Schmuggler"
Title[ENGLISH] = "The Smuggler"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge fünf Kupferkelche und bringe diese Ehrom."
Description[ENGLISH][1] = "Collect five copper goblets and bring them to Ehrom."
Description[GERMAN][2] = "Geh zu Ehrom Goldhammer. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Ehrom Goldhammer, he certainly has another task for you."
Description[GERMAN][3] = "Besorge zwei Zwergen-Prunkrüstungen und bringe diese zu Ehrom."
Description[ENGLISH][3] = "Collect two dwarven state armours and bring them to Ehrom."
Description[GERMAN][4] = "Geh zu Ehrom Goldhammer. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Ehrom Goldhammer, he certainly has another task for you."
Description[GERMAN][5] = "Besorge fünf schwarze Priesterroben und bringe diese zu Ehrom."
Description[ENGLISH][5] = "Collect five black priest robes and bring them to Ehrom."
Description[GERMAN][6] = "Geh zu Ehrom Goldhammer. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Ehrom Goldhammer, he certainly has another task for you."
Description[GERMAN][7] = "Besorge einen Stab der Luft und bringe diesen zu Ehrom."
Description[ENGLISH][7] = "Collect a wand of air and bring it to Ehrom."
Description[GERMAN][8] = "Du hast alle Aufgaben von Ehrom erfüllt."
Description[ENGLISH][8] = "You have fulfilled all of Ehrom's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {628, 288, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(628, 288, 0)} 
QuestTarget[2] = {position(628, 288, 0)} 
QuestTarget[3] = {position(628, 288, 0)} 
QuestTarget[4] = {position(628, 288, 0)} 
QuestTarget[5] = {position(628, 288, 0)} 
QuestTarget[6] = {position(628, 288, 0)} 
QuestTarget[7] = {position(628, 288, 0)} 
QuestTarget[8] = {position(628, 288, 0)} 

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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
