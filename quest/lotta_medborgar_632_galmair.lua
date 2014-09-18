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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (632, 'quest.lotta_medborgar_632_galmair');

local common = require("base.common")
module("quest.lotta_medborgar_632_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Don Valerio Guilianni in Galmair"
Title[ENGLISH] = "Find Don Valerio Guilianni in Galmair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Don Valerio Guilianni und bringe ihm dein Geschenk."
Description[ENGLISH][1] = "Find Don Valerio Guilianni and take him your gift."
Description[GERMAN][2] = "Du weiﬂt nun wo Don Valerio Guilianni zu finden ist."
Description[ENGLISH][2] = "You now know where you can find Don Valerio Guilianni."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {393, 326, -5}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(337, 215, 0)} -- Don (It might confuse a newbie because the lower levels of Galmair are not on the same spot as the surface level)

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 2


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
