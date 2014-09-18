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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (IDQUEST, 'quest.truciolo_pialla_670_galmair');

local common = require("base.common")
local factions = require("base.factions")
module("quest.truciolo_pialla_670_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der Altarschnitzer"
Title[ENGLISH] = "The temple carver"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Bring 10 Apfelholz, 10 Äste und 1 Säge zu Truciolo Pialla."
Description[ENGLISH][1] = "Take ten logs of apple wood, ten boughs and one saw to Truciolo Pialla."
Description[GERMAN][2] = "Vielleicht solltest du Truciolo Pialla nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][2] = "Perhaps you should talk to Truciolo Pialla again, he is sure to have more for you to do."
Description[GERMAN][3] = "Bring 15 Naldorholzbretter, 1 Kochlöffel, 1 Satz Schnitzmesser und 5 Nadelholzscheite zu Truciolo Pialla."
Description[ENGLISH][3] = "Take fifteen naldor wood boards, one cooking spoon, one set of carving tools and five conifer wood to Truciolo Pialla."
Description[GERMAN][4] = "Vielleicht solltest du Truciolo Pialla nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][4] = "Perhaps you should talk to Truciolo Pialla again, he is sure to have more for you to do."
Description[GERMAN][5] = "Bring 10 Kirschholzbretter, 10 Holzteller, 5 Schädelstäbe und 4 große Griffe zu Truciolo Pialla."
Description[ENGLISH][5] = "Take ten cherry wood boards, ten wooden plates, five skull staffs and four large handle to Truciolo Pialla"
Description[GERMAN][6] = "Vielleicht solltest du Truciolo Pialla nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][6] = "Perhaps you should talk to Truciolo Pialla again, he is sure to have more for you to do."
Description[GERMAN][7] = "Bring 150 Pfeile, 10 Eimer, 10 Harfen und 2 Zauberstäbe zu Truciolo Pialla."
Description[ENGLISH][7] = "Take 150 arrows, ten buckets, ten harps and two wands to Truciolo Pialla"
Description[GERMAN][8] = "Du hast alle Aufgaben von Truciolo Pialla erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks of Truciolo Pialla."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {338, 268, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {338, 268, 0}
QuestTarget[3] = {338, 268, 0}
QuestTarget[5] = {338, 268, 0}
QuestTarget[7] = {338, 268, 0}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 8


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

function QuestAvailability(user, status)
    if factions.isGalmairCitizen(user) and user:getSkill(Character.carpentry) < 80 and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
