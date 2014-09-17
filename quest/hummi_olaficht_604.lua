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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (604, 'quest.hummi_olaficht_604');

local common = require("base.common")
module("quest.hummi_olaficht_604", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Finde Elesil Daelwon in Runewick"
Title[ENGLISH] = "Find Elesil Daelwon in Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde Elesil Daelwon beim Teleporter in Runewick and sprich mit ihr."
Description[ENGLISH][1] = "Find Elesil Daelwon at the teleporter in Runewick and talk to her."
Description[GERMAN][2] = "Da kannst nun mit Elesil sprechen. Frage nach 'Hilfe' wenn du nicht weißt, wonach du fragen sollst!\nDu kannst auch zurück zu Hummi gehen, um deine Belohnung abzuholen und später nochmals vorbei kommen. Elesil hat nämlich auch mindestens eine Aufgabe für dich."
Description[ENGLISH][2] = "You can talk with Elesil now. Ask for 'help' if you do not know what to say!\nYou can also go back to Hummi to collect your reward and come back later. Elesil also has at least one task for you."
Description[GERMAN][3] = "Hast du bereits nach den beiden anderen NPCs die Hummi erwähnt hat gefragt und sie auch besucht? Frizza and Iradona? Wenn nein, dann solltest du das jetzt tun. Wenn ja, dann hat Hummi einen zusätzlichen Auftrag für dich."
Description[ENGLISH][3] = "Have you already asked for and visited the two other NPCs, Frizza and Iradona, that Hummi mentions? If not, you should do it now. If you have already visited them, Hummi has an additional task for you."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {681, 318, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(839, 816, 0)} -- Elesil
QuestTarget[2] = {position(681, 318, 0)} -- Hummi

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 3


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
