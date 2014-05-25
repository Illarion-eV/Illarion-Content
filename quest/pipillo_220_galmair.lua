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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (220, 'quest.pipillo_220_galmair');

require("base.common")
require("base.factions")
module("quest.pipillo_220_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Buchhändler-Helfer"
Title[ENGLISH] = "Bookseller Helper"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Bitte bring Pipillo einen Apfelkuchen."
Description[ENGLISH][1] = "Please bring Pipillo an apple pie."
Description[GERMAN][2] = "Rede mit Pipillo, vielleicht hat er eine Aufgabe für dich."
Description[ENGLISH][2] = "Check with Pipillo he may have another task for you."

Description[GERMAN][3] = "Bitte bring Pipillo ein Flasche Traubensaft"
Description[ENGLISH][3] = "Please bring Pipillo a bottle of grape juice."
Description[GERMAN][4] = "Du hast alle Aufgaben für Pipillo erledigt."
Description[ENGLISH][4] = "You have completed all of Pipillo's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {412, 291, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(412, 291, 0)}
QuestTarget[2] = {position(412, 291, 0)}

QuestTarget[3] = {position(412, 291, 0)}
QuestTarget[4] = {position(412, 291, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 4


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
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
    if base.factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
