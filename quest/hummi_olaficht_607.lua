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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (607, 'quest.hummi_olaficht_607');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Der mächtige Turniergewinner"
Title[ENGLISH] = "The mighty tournament champion"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Tronuk und frage ihn nach 'Geschichte' um den Namen des Gewinners zu erfahren. Hinweis: Er kann in der Nähe von Cadomyr gefunden werden."
Description[ENGLISH][1] = "Find Tronuk and ask him about a 'story' in order to get the name of the tournament winner. Hint: He can be found close to Cadomyr."
Description[GERMAN][2] = "Du hast Tronuk gefunden. Nun wähle eine seiner beiden Geschichten. Höre dir die ganze Geschichte an. Du wirst eine Information erhalten, sobald du fertig bist.\nFalls du die falsche Geschichte gewählt hast wirst du dir die andere auch anhören müssen."
Description[ENGLISH][2] = "You found Tronuk. Now, choose one of his two stories. Listen the whole story. You will receive an information as soon as you are done.\nYou might also have to listen to the second story if you chose the wrong one."
Description[GERMAN][3] = "Du weißt nun den Namen. Wenn du zurück bei Hummi bist, nenne ihm den Namen des Orks, der gewonnen hat. Der Name beginnt mit einem 'J'. Du kannst dir zur Not die Geschichte mittels 'Turnier' nochmals anhören."
Description[ENGLISH][3] = "You know the name now. When you get back to Hummi, tell him the name of the orc who won. The name starts with a 'J'. If necessary, you can listen to the story another time by saying 'tournament'."
Description[GERMAN][4] = "Du weißt nun den Namen. Wenn du zurück bei Hummi bist, nenne ihm den Namen des Orks, der gewonnen hat. Der Name beginnt mit einem 'J'. Du kannst dir zur Not die Geschichte mittels 'Turnier' nochmals anhören."
Description[ENGLISH][4] = "You know the name now. When you get back to Hummi, tell him the name of the orc who won. The name starts with a 'J'. If necessary, you can listen to the story another time by saying 'tournament'."
Description[GERMAN][5] = "Hummi hat keine anderen Aufgaben für dich. Lediglich mehr Informationen. Aber suche nach weiteren Aufgaben bei anderen NPCs."
Description[ENGLISH][5] = "Hummi does not have any other quests for you, just more information. However, you can look for other NPCs with quests for you."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {681, 318, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(164, 621, 0)} -- Tronruk
QuestTarget[2] = {position(164, 621, 0)} -- Tronruk
QuestTarget[3] = {position(681, 318, 0)} -- Hummi
QuestTarget[4] = {position(681, 318, 0)} -- Hummi

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 5


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
