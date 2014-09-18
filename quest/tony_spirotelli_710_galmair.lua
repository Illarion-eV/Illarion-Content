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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (710, 'quest.tony_spirotelli_710_galmair');

local common = require("base.common")
local factions = require("base.factions")
module("quest.tony_spirotelli_710_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Schreinerhandwerk"
Title[ENGLISH] = "The carpentry craft"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Apfelholzbretter und zeig diese Tony Spirotelli in der Werkstatt von Galmair. Sammel erstmal mit dem Beil an einem Apfelbaum zehn Apfelholzscheite. Dazu nimmst du das Beil in die Hand und benutzt es, während du vor einem Apfelbaum stehst. Hast du das erstmal gemacht, geh zurück zur Werkstatt und säge die Scheite, mit der Säge in der Hand, bei der Werkbank, neben Tony, zu Brettern."
Description[ENGLISH][1] = "Collect ten applewood boards for Tony Spirotelli in the workshop of Galmair. You should start by collecting ten applewood using the hatchet in your hand whilst standing in front of an apple tree. Once you have the applewood you can saw it into boards in the workshop by using the workbench as you stand in front of it, with the saw in your hand."
Description[GERMAN][2] = "Geh zu Tony Spirotelli in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Tony Spirotelli in the workshop of Galmair, he is sure to have another task for you."
Description[GERMAN][3] = "Stell zehn Teller für Tony Spirotelli, in der Werkstatt von Galmair, her. Um die Teller herzustellen, brauchst du Apfelholzbretter. Hast du diese, nimmst du den Hobel in die Hand und benutzt ihn, während du vor einer Werkbank stehst."
Description[ENGLISH][3] = "Produce ten plates for Tony Spirotelli in the workshop of Galmair. To produce the plates you need applewood boards. Once you have them take the plane in your hand and use it whilst standing in front of the workbench."
Description[GERMAN][4] = "Geh zu Tony Spirotelli in der Werkstatt von Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Tony Spirotelli in the workshop of Galmair, he is sure to have another task for you."
Description[GERMAN][5] = "Stell 25 Nägel und Keile für Tony Spirotelli, in der Werkstatt von Galmair, her. Um die Nägel und Keile herzustellen, brauchst du Äste und Nägel. Nägel können von Schmieden hergestellt werden. Äste findest du manchmal beim Fällen von Apfelbäumen. Hast du erstmal fünf Äste gefunden, kehr zur Werkstatt zurück und fertige, mit dem Schnitzmesser in der Hand, bei der Werkbank 25 Nägel und Keile."
Description[ENGLISH][5] = "Produce twenty five pins and cotters for Tony Spirotelli in the workshop of Galmair. To produce the pins and cotters you need five boughs and some pins first of all, you can get boughs whilst chopping down an apple tree. Pins can be made by a smith. Once you have the boughs return to the workshop and produce twenty five pins and cotters using the carving tools in your hand, whilst at the workbench."
Description[GERMAN][6] = "Du hast alle Aufgaben von Tony Spirotelli erfüllt."
Description[ENGLISH][6] = "You have fulfilled all the tasks for Tony Spirotelli."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {383, 269, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(383, 269, 0), position(436, 250, 0)} -- Apple tree
QuestTarget[2] = {position(383, 269, 0)} 
QuestTarget[3] = {position(383, 269, 0), position(381, 269, 0)} -- Work bench
QuestTarget[4] = {position(383, 269, 0)} 
QuestTarget[5] = {position(383, 269, 0), position(381, 269, 0)} -- Work bench
QuestTarget[6] = {position(383, 269, 0)} 

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 6


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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
