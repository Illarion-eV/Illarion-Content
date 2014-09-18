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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (125, 'quest.alexis_dostas_125_cadomyr');

local common = require("base.common")
module("quest.alexis_dostas_125_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die königlichen Stallungen"
Title[ENGLISH] = "The Royal Stables"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge zehn Bündel Getreide und bringe sie Alexis. Du kannst Getreide auf einem Feld anbauen und mit einer Sense ernten oder die Getreidebündel bei einem Händler kaufen."
Description[ENGLISH][1] = "Obtain ten bundles of grain and take them to Alexis. You can grow grain on a field and harvest it with a scythe or buy the bundles of grain from a merchant."
Description[GERMAN][2] = "Geh zu Alexis Dostas, der sich in den Stallungen von Cadomyr aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Alexis Dostas in the stables of Cadomyr, he is certain to have another task for you."
Description[GERMAN][3] = "Besorge zehn Karotten und bringe sie Alexis. Du kannst Karotten auf einem Feld anbauen und mit einer Sichel ernten oder die Karotten bei einem Händler kaufen."
Description[ENGLISH][3] = "Obtain ten carrots and take them to Alexis. You can grow carrots on a field and harvest them with a sickle or buy the carrots from a merchant."
Description[GERMAN][4] = "Du hast alle Aufgaben von Alexis Dostas erfüllt."
Description[ENGLISH][4] = "You have fulfilled all the tasks for Alexis Dostas."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {141, 637, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(141, 637, 0), position(847, 828, 0), position(911, 798, 1), position(430, 261, 0), position(361, 266,0)} -- felder, händler
QuestTarget[2] = {position(141, 637, 0)} 
QuestTarget[3] = {position(141, 637, 0), position(847, 828, 0), position(911, 798, 1), position(430, 261, 0), position(361, 266,0)} -- felder, händler
QuestTarget[4] = {position(141, 637, 0)} 


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 4


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