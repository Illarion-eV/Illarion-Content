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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (113, 'quest.bathelor_113_wilderness');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Feuer und Flamme"
Title[ENGLISH] = "A spark to a flame"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zu jeden einzelnen Schrein der Fünf in ihren Tempel."
Description[ENGLISH][1] = "Go to each of the shrines in the Temple of the Five."
Description[GERMAN][2] = "Du hast jeden der Schreine der Fünf in ihrem Tempel besucht. Gehe zu Bathelor und berichte ihm."
Description[ENGLISH][2] = "You visited every shrine. Go back to Bathelor."
Description[GERMAN][3] = "Geh zu Bathelor, am Lagerfeuer westlich des Tempels der Fünf. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][3] = "Go back to Bathelor at the campfire, west of the Temple of the Five, he is sure to have another task for you."
Description[GERMAN][4] = " Besorge zehn Scheite Naldorholz und bring sie Bathelor. Fälle hierfür einen Naldorbaum mit einen Beil."
Description[ENGLISH][4] = "Obtain ten logs of naldor wood and bring them to Bathelor. You can cut down a naldor tree with a hatchet."
Description[GERMAN][5] = "Du hast alle Aufgaben von Bathelor erfällt. Lobet Brágon!"
Description[ENGLISH][5] = "You have fulfilled all the tasks for Bathelor. Praise Brágon!"

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {519, 128, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(549, 138, 0), position(551, 133, 0), position(556, 135, 0), position(556, 141, 0), position(551, 143, 0), position(519, 128, 0)} -- Shrines
QuestTarget[2] = {position(519, 128, 0)} 
QuestTarget[3] = {position(519, 128, 0)} 
QuestTarget[4] = {position(519, 128, 0), position(511, 119, 0)} -- tree
QuestTarget[5] = {position(519, 128, 0)} 


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 5


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

return M
