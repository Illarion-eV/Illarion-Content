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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (151, 'quest.ioannes_faber_151_cadomyr');
     
local common = require("base.common")
local factions = require("base.factions")
local M = {}
     
local GERMAN = Player.german
local ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Schatzkammer Cadomyrs"
Title[ENGLISH] = "Cadomyr Treasury"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Spende Gegenstände oder Münzen für die Schatzkammer Cadomyrs. Lege dafür den Gegenstand auf das markierte Feld neben dem Thron von Königin Rosaline Edwards."
Description[ENGLISH][1] = "Donate items or coins for Cadomyr Treasury. Put the item on the bordered area next to throne of queen Rosaline Edwards."
Description[GERMAN][2] = "Kehre zu Ioannes Faber zurück."
Description[ENGLISH][2] = "Return to Ioannes Faber."
Description[GERMAN][3] = "Du hast schon einmal für Cadomyr gespendet. Dies sollte dich aber nicht davon abhalten, weiter Gegenstände oder Münzen für deine Stadt zu spenden."
Description[ENGLISH][3] = "You have already donated to Cadomyr. But you can still donate more items or coins for your town."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {129, 529, 0}


 
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(116, 520, 0)} 
QuestTarget[2] = {position(129, 529, 0)}
QuestTarget[3] = {position(129, 529, 0), position(116, 520, 0)}
     
-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 3
     
     
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
    if factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
