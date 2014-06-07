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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (715, 'quest.judith_tanner_715_runewick');

require("base.common")
require("base.factions")
module("quest.judith_tanner_715_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Schneiderhandwerk"
Title[ENGLISH] = "The tailoring craft"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

Description[GERMAN][1] = "Sammel 20 Wollballen für Judith Tanner im Untergeschoss des Feuerturms. Schafe kannst du im Wald von Runewick finden. Du kannst die Schafe scheren, indem du die Schere in die Hand nimmst und diese benutzt, wenn ein Schaf neben dir steht."
Description[ENGLISH][1] = "Collect twenty bales of wool for Judith Tanner in the basement of the Fire Tower. You can find sheep in the forest just outside Runewick. You can collect wool if you stand next to a sheep and use the scissors, whilst holding them in your hand."
Description[GERMAN][2] = "Geh zu Judith Tanner, die sich im Untergeschoss des Feuerturms aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Judith Tanner in the basement of the Fire Tower, she is sure to have another task for you."
Description[GERMAN][3] = "Bring Judith Tanner im Untergeschoss des Feuerturms fünf Garnrollen und zwei Rollen grauen Stoff. Den Stoff kannst du am Webstuhl herstellen und die Garnrollen am Spinnrad. Für beides brauchst du unterschiedliche Mengen an Wolle."
Description[ENGLISH][3] = "Take two bolts of grey cloth and five spools of thread to Judith Tanner in the basement of the Fire Tower. You can produce the cloth at the loom. The thread can be produced at the spinning wheel. you'll need different amounts of wool to produce each item."
Description[GERMAN][4] = "Geh zu Judith Tanner, die sich im Untergeschoss des Feuerturms aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Judith Tanner in the basement of the Fire Tower, she is sure to have another task for you."
Description[GERMAN][5] = "Schneidere ein graues Gewand am Schneidertisch für Judith Tanner im Untergeschoss des Feuerturms. Um das Gewand herzustellen, musst du die Nadel in die Hand nehmen und diese benutzen, wenn du vor einem Schneidertisch stehst. Der Schneidertisch befindet sich neben Judith."
Description[ENGLISH][5] = "Tailor one grey dress at the tailoring table for Judith Tanner in the basement of the Fire Tower. To produce the dress you have to take the needle in your hand and use it, whilst standing in front of the tailoring table. The tailoring table is right next to Judith."
Description[GERMAN][6] = "Geh zu Judith Tanner, die sich im Untergeschoss des Feuerturms aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Judith Tanner in the basement of the Fire Tower, she is sure to have another task for you."
Description[GERMAN][7] = "Stell fünf Eimer mit roter Farbe für Judith Tanner im Untergeschoss des Feuerturms her. Um die rote Farbe herzustellen, musst du ein Feuer machen. Dafür plazierst du das Holz vor dir auf dem Boden und benutzt dieses. Anschließend nimmst du den Mörser in die Hand und benutzt diesen. Platzier die Eimer und die Kirschen in deinem Gürtel während du die Farbe machst."
Description[ENGLISH][7] = "Produce five buckets of red dye for Judith Tanner in the basement of the Fire Tower. To produce red dye you have to make a fire by placing wood on the ground and using it. Once you have done that take the mortar in your hand and use it, whilst standing in front of the fire. Place the buckets and the cherrys in your belt while producing the dye."
Description[GERMAN][8] = "Geh zu Judith Tanner, die sich im Untergeschoss des Feuerturms aufhält. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go back to Judith Tanner in the basement of the Fire Tower, she is sure to have another task for you."
Description[GERMAN][9] = "Färbe fünf Rollen roten Stoff bei dem schwarzen Fass in der Schneiderei von Runewick für Judith Tanner, die sich im Untergeschoss des Feuerturms aufhält. Um die Stoffe herzustellen, musst du den Färberstab in die Hand nehmen. Anschließend benutzt du das schwarze Fass, während du die Eimer mit Farbe und den grauen Stoff in deinem Inventar hast."
Description[ENGLISH][9] = "Dye five bolts of cloth red for Judith Tanner in the basement of the Fire Tower, using the black barrel. To dye the cloth you have to take the dyeing rod in your hand and use the black barrel whilst having red dye and grey cloth in your inventory."
Description[GERMAN][10] = "Du hast alle Aufgaben von Judith Tanner erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Judith Tanner."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {905, 780, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(905, 780, 0), position(860, 768, 0)} -- Sheeps
QuestTarget[2] = {position(905, 780, 0)} 
QuestTarget[3] = {position(905, 780, 0), position(911, 782, 0), position(911, 781, 0)} -- Spinning wheel and loom
QuestTarget[4] = {position(905, 780, 0)}
QuestTarget[5] = {position(905, 780, 0), position(901, 779, 0)} -- Tailoring table
QuestTarget[6] = {position(905, 780, 0)} 
QuestTarget[7] = {position(905, 780, 0), position(886, 795, 0)} -- Camp fire
QuestTarget[8] = {position(905, 780, 0)}
QuestTarget[9] = {position(905, 780, 0), position(909, 778, 0)} -- Barrels
QuestTarget[10] = {position(905, 780, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 10


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
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
    if base.factions.isRunewickCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
