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
local factions = require("base.factions")
local introduction = require("lte.introduction")

local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Einführung"
Title[ENGLISH] = "Introduction"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "GERMAN und die drei Tempel deines Reiches."
Description[ENGLISH][1] = "Set out and explore your realm. Find another character and talk to him/her. Did you already make up a background for your character? Who were his/her parents, what does he/she like most? What is his/her profession? You'll easily tell apart characters from NPCs as the latter do not move and respond immediatly on the keyword 'help' with a list of commands. NPCs can also be used with a double click to access a menu of basic triggers. Some NPCs issue quests, those have a question mark (?) above their head.\n\nAlso, explore your home city. Interesting sites are marked with an orange symbol on your map. You should visit:\n\nThe central depot where you can store your goods.\n\nThe market where you can sell or buy commodities.\n\nThe workshop where all the crafts of your home city are performed.\n\nThe pillar of resurrection where the fallen rise from Cherga's Realm of Death.\n\nThe money changer who can provide you with change.\n\nThe notary where you can see your rank within society and modify your faction settings.\n\nThe treasurer who will accept donations for the realm's treasury.\n\nYour faction's leader who governs the realm..\n\nThe town guard that protects the city from hostile creatures.\n\nThe teleporter that can bring you magically to other cities.\n\nThe three temples of your realm."
Description[GERMAN][2] = "GERMAN DONE"
Description[ENGLISH][2] = "You finished the introduction. Have fun!"

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 2

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

    local waypoint, waypointRadius, informTextG, informTextE, dialogTextG, dialogTextE = introduction.init(user)

    -- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
    local QuestTarget = {}

    QuestTarget[1] = waypoint
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
return M
