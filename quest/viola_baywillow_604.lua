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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (604, 'quest.viola_baywillow_604');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Finde Elesil Daelwon in Runewick"
Title[ENGLISH] = "Find Elesil Daelwon in Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Elesil Daelwon direkt hinter der Brücke, die nach Runewick führt, und rede mit ihr."
Description[ENGLISH][1] = "Find Elesil Daelwon immediately as you cross the bridge into Runewick and talk to her."
Description[GERMAN][2] = "Rede mit Elesil Daelwon, wenn du mehr über Runewick erfahren möchtest. Bitte einfach um 'Hilfe', wenn du nicht weißt, was du sagen sollst. \nDu kannst auch zu Viola Baywillow in Trollshaven zurückkehren, um deine Belohnung abzuholen."
Description[ENGLISH][2] = "Talk to Elesil any time you would like to learn more about Runewick. Just ask for 'help' if you do not know what to say.\nYou can also return to Viola Baywillow in Troll's Haven to collect your reward."
Description[GERMAN][3] = "Hast du schon Frizza und Iradona, die Informanten der anderen beiden Reiche besucht? Falls nicht, solltest du Viola Baywillow in Trollshaven fragen, wo sie zu finden sind, damit du sie aufsuchen kannst, um mehr über Cadomyr und Galmair zu erfahren."
Description[ENGLISH][3] = "Have you already visited the other two Realm Informants, Frizza and Iradona? If not, you should find out where they are from Viola Baywillow in Troll's Haven so that you can visit them to learn all about Cadomyr and Galmair."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {693, 292, 0}
 

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(894, 817, 0)} -- Elesil
QuestTarget[2] = {position(693, 292, 0)} -- Viola

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

return M
