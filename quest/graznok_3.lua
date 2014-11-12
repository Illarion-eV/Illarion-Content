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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (3, 'quest.graznok_3');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der feige Ork"
Title[ENGLISH] = "The Craven Orc"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Bringe dem Ork Graznok eine Fackel."
Description[ENGLISH][1] = "Take a torch to the orc Graznok."
Description[GERMAN][2] = "Graznok kann deine Hilfe gebrauchen. Geh zu ihm und frage, ob er eine Aufgabe für dich hat."
Description[ENGLISH][2] = "Graznok could use some help. Go and ask if he has a task for you."
Description[GERMAN][3] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Lumpenmanns' zu töten. Du musst noch 5 Mumien erschlagen."
Description[ENGLISH][3] = "Graznok told you to kill some 'ragmen' in Ingruk's Cave. You still have to smash five mummies."
Description[GERMAN][4] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Lumpenmanns' zu töten. Du musst noch 4 Mumien erschlagen."
Description[ENGLISH][4] = "Graznok told you to kill some 'ragmen' in Ingruk's Cave. You still have to smash four mummies."
Description[GERMAN][5] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Lumpenmanns' zu töten. Du musst noch 3 Mumien erschlagen."
Description[ENGLISH][5] = "Graznok told you to kill some 'ragmen' in Ingruk's Cave. You still have to smash three mummies."
Description[GERMAN][6] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Lumpenmanns' zu töten. Du musst noch 2 Mumien erschlagen."
Description[ENGLISH][6] = "Graznok told you to kill some 'ragmen' in Ingruk's Cave. You still have to smash two mummies."
Description[GERMAN][7] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Lumpenmanns' zu töten. Du musst noch eine Mumie erschlagen."
Description[ENGLISH][7] = "Graznok told you to kill some 'ragmen' in Ingruk's Cave. You still have to smash one mummy."
Description[GERMAN][8] = "Gehe zu Graznok und berichte ihm, dass du die 'Lumpenmanns' erschlagen hast."
Description[ENGLISH][8] = "Go back to Graznok and tell him that you smashed those 'ragmen'."
Description[GERMAN][9] = "Graznok kann deine Hilfe gebrauchen. Geh zu ihm und frage, ob er eine Aufgabe für dich hat."
Description[ENGLISH][9] = "Graznok could use some help. Go and ask if he has a task for you."
Description[GERMAN][10] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 10 Skelette erschlagen."
Description[ENGLISH][10] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash ten skeletons."
Description[GERMAN][11] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 9 Skelette erschlagen."
Description[ENGLISH][11] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash nine skeletons."
Description[GERMAN][12] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 8 Skelette erschlagen."
Description[ENGLISH][12] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash eight skeletons."
Description[GERMAN][13] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 7 Skelette erschlagen."
Description[ENGLISH][13] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash seven skeletons."
Description[GERMAN][14] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 6 Skelette erschlagen."
Description[ENGLISH][14] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash six skeletons."
Description[GERMAN][15] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 5 Skelette erschlagen."
Description[ENGLISH][15] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash five skeletons."
Description[GERMAN][16] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 4 Skelette erschlagen."
Description[ENGLISH][16] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash four skeletons."
Description[GERMAN][17] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 3 Skelette erschlagen."
Description[ENGLISH][17] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash three skeletons."
Description[GERMAN][18] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch 2 Skelette erschlagen."
Description[ENGLISH][18] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash two skeletons."
Description[GERMAN][19] = "Du hast von Graznok die Aufgabe erhalten, in Igruks Höhle 'Knochenmanns' zu töten. Du musst noch ein Skelett erschlagen."
Description[ENGLISH][19] = "Graznok told you to kill some 'bonemen' in Ingruk's Cave. You still have to smash one skeleton."
Description[GERMAN][20] = "Gehe zu Graznok und berichte ihm, dass du die 'Knochenmanns' erschlagen hast."
Description[ENGLISH][20] = "Go back to Graznok and tell him that you smashed those 'bonemen'."
Description[GERMAN][21] = "Du hast Graznok geholfen, Ingruks Höhle etwas weniger furchteinflößend zu machen. Jetzt traut er sich, sie seinem Klan zu zeigen. Gut gemacht!"
Description[ENGLISH][21] = "You have helped Graznok by making Ingruk's Cave a bit less scary. Now he finally dares to lead his clan into it. Well done!"


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {672, 449, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(672, 449, 0)}
QuestTarget[2] = {position(672, 449, 0)}
QuestTarget[3] = {position(668, 446, 0)}
QuestTarget[4] = {position(668, 446, 0)}
QuestTarget[5] = {position(668, 446, 0)}
QuestTarget[6] = {position(668, 446, 0)}
QuestTarget[7] = {position(668, 446, 0)}
QuestTarget[8] = {position(672, 449, 0)}
QuestTarget[9] = {position(672, 449, 0)}
QuestTarget[10] = {position(668, 446, 0)}
QuestTarget[11] = {position(668, 446, 0)}
QuestTarget[12] = {position(668, 446, 0)}
QuestTarget[13] = {position(668, 446, 0)}
QuestTarget[14] = {position(668, 446, 0)}
QuestTarget[15] = {position(668, 446, 0)}
QuestTarget[16] = {position(668, 446, 0)}
QuestTarget[17] = {position(668, 446, 0)}
QuestTarget[18] = {position(668, 446, 0)}
QuestTarget[19] = {position(668, 446, 0)}
QuestTarget[20] = {position(672, 449, 0)}


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 21


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
