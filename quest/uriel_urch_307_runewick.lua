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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (307, 'quest.uriel_urch_307_runewick');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Geschichten und Schwerter"
Title[ENGLISH] = "Tales and Swords"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Besorge einen Bierkrug und bringe ihn Uriel. Du kannst einen Bierkrug vom Händler kaufen oder fülle Bier aus einer Flasche in einen leeren Krug. Bier kann man mit einen Kochlöffel am Weinfass herstellen."
Description[ENGLISH][1] = "Get a mug of beer and take it to Uriel. You can buy a mug of beer from a merchant or pour beer from a bottle into a mug. You can brew beer using a cooking spoon at a wine barrel."
Description[GERMAN][2] = "Frag doch Uriel nach seiner Geschichte."
Description[ENGLISH][2] = "Ask Uriel for his story."
Description[GERMAN][3] = "Besorge noch einen Bierkrug und bringe ihn Uriel. Du kannst einen Bierkrug vom Händler kaufen oder fülle Bier aus einer Flasche in einen leeren Krug. Bier kann man am Weinfass herstellen."
Description[ENGLISH][3] = "Get a mug of beer and take it to Uriel. You can buy a mug of beer from a merchant or pour beer from a bottle into a mug. You can brew beer using a cooking spoon at a wine barrel."
Description[GERMAN][4] = "Frag doch Uriel nach seiner Geschichte."
Description[ENGLISH][4] = "Ask Uriel for his story."
Description[GERMAN][5] = "Besorge noch einen Bierkrug und bringe ihn Uriel. Du kannst einen Bierkrug vom Händler kaufen oder fülle Bier aus einer Flasche in einen leeren Krug. Bier kann man am Weinfass herstellen."
Description[ENGLISH][5] = "Get a mug of beer and take it to Uriel. You can buy a mug of beer from a merchant or pour beer from a bottle into a mug. You can brew beer using a cooking spoon at a wine barrel."
Description[GERMAN][6] = "Spreche Uriel noch einmal an."
Description[ENGLISH][6] = "Talk to Uriel once more."
Description[GERMAN][7] = "Du hast Uriel Bier gebracht und seiner Geschichte gelauscht. Danke dafür."
Description[ENGLISH][7] = "You have brought beer to Uriel and have listened his story. Thanks for that."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {902, 773, 0}



-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(902, 773, 0), position(899, 772, 0), position (906, 841, 0)}
QuestTarget[2] = {position(902, 773, 0)} 
QuestTarget[3] = {position(902, 773, 0), position(899, 772, 0), position (906, 841, 0)} 
QuestTarget[4] = {position(902, 773, 0)} 
QuestTarget[5] = {position(902, 773, 0), position(899, 772, 0), position (906, 841, 0)} 
QuestTarget[6] = {position(902, 773, 0)} 
QuestTarget[7] = {position(902, 773, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 7


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
    if factions.isRunewickCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
