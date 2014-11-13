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
	
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (335, 'quest.kaitza_335_wilderness');
     
local common = require("base.common")
local M = {}
     
local GERMAN = Player.german
local ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Fischen für Echsen"
Title[ENGLISH] = "Fishing For Lizards"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge zehn Forellen und bringe sie zu Kaitza. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][1] = "Obtain ten trout and take them back to Kaitza. To fish, place yourself next to the water and use a fishing rod."
Description[GERMAN][2] = "Kehre zurück zu Kaitza und frage, ob er noch eine Aufgabe für dich hat."
Description[ENGLISH][2] = "Go back to Kaitza, he will certainly have another task for you." 
Description[GERMAN][3] = "Besorge fünf Lachse und bringe sie zu Kaitza. Stelle dich ans Wasser und benutze die Angel um Fische zu fangen."
Description[ENGLISH][3] = "Obtain five salmon and take them back to Kaitza. To fish, place yourself next to the water and use a fishing rod."
Description[GERMAN][4] = "Du hast alle Aufgaben von Kaitza erfüllt."
Description[ENGLISH][4] = "You have fulfilled all the tasks for Kaitza." 


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {841, 743, 0}

   
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(841, 743, 0), position(791, 798, 0)} -- Angelpunkt
QuestTarget[2] = {position(841, 743, 0)} 
QuestTarget[3] = {position(841, 743, 0), position(791, 798, 0)} -- Angelpunkt
QuestTarget[4] = {position(841, 743, 0)} 

     
-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 4
     
     
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
