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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (705, 'quest.lilli_gallfing_705_cadomyr');

require("base.common")
require("base.factions")
module("quest.lilli_gallfing_705_cadomyr", package.seeall)

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
Description[GERMAN][1] = "Sammel 20 Wollballen für Lilli Gallfing in der Werkstatt von Cadomyr. Schafe kannst du westlich von Cadomyr finden. Du kannst die Schafe scheren, indem du die Schere in die Hand nimmst und diese benutzt wenn ein Schaf neben dir steht."
Description[ENGLISH][1] = "Collect twenty bales of wool for Lilli Gallfing in the workshop of Cadomyr. You can find sheep west of Cadomyr. You can collect wool if you stand next to a sheep and use the scissors whilst holding them in your hand."
Description[GERMAN][2] = "Geh zu Lilli Gallfing in der Werkstatt von Cadomyr, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Lilli Gallfing in the workshop of Cadomyr, she is sure to have another task for you."
Description[GERMAN][3] = "Bring Lilli Gallfing in der Werkstatt von Cadomyr fünf Garnrollen und zwei Rollen grauen Stoff. Den Stoff kannst du am Webstuhl herstellen und die Garnrollen am Spinnrad. Für beides brauchst du unterschiedliche Mengen an Wolle."
Description[ENGLISH][3] = "Take Lilli Gallfing in the workshop of Cadomyr five spools of thread and two bolts of grey cloth. You can produce the cloth at the loom. The thread can be produced at the spinning wheel, you'll need different amounts of wool to produce them both."
Description[GERMAN][4] = "Geh zu Lilli Gallfing in der Werkstatt von Cadomyr, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Lilli Gallfing in the workshop of Cadomyr, she is sure to have another task for you."
Description[GERMAN][5] = "Schneidere ein graues Gewand am Schneidertisch für Lilli Gallfing in der Werkstatt von Cadomyr. Um das Gewand herzustellen musst du die Nadel in die Hand nehmen und diese benutzen wenn du vor einem Schneidertisch stehst. Der Schneidertisch befindet sich in der Werkstatt."
Description[ENGLISH][5] = "Tailor one grey dress at the tailoring table for Lilli Gallfing in the workshop of Cadomyr. To produce the dress you have to take the needle in your hand and use it, whilst standing in front of the tailoring table. Der Schneidertisch befindet sich in der Werkstatt."
Description[GERMAN][6] = "Geh zu Lilli Gallfing in der Werkstatt von Cadomyr, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Lilli Gallfing in the workshop of Cadomyr, she is sure to have another task for you."
Description[GERMAN][7] = "Stell fünf Eimer mit roter Farbe für Lilli Gallfing in der Werkstatt von Cadomyr her. Um die rote Farbe herzustellen musst du ein Feuer machen, dafür plazierst du das Holz vor dir auf dem Boden und benutzt dieses. Anschließend nimmst du den Mörser in die Hand und benutzt diesen."
Description[ENGLISH][7] = "Produce five buckets of red dye for Lilli Gallfing in the workshop of Cadomyr. To produce red dye you first have to make a fire, for this you have to place the wood on the ground and use it. Once you have done that take the mortar in your hand and use it whilst standing in front of the fire."
Description[GERMAN][8] = "Geh zu Lilli Gallfing in der Werkstatt von Cadomyr, sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go to Lilli Gallfing in the workshop of Cadomyr, she is sure to have another task for you."
Description[GERMAN][9] = "Färbe fünf Rollen roten Stoff bei dem schwarzen Fass in der Schneiderei von Cadomyr für Lilli Gallfing die sich in der Werkstatt von Cadomyr aufhält. Um die Stoffe herzustellen musst du den Färberstab in die Hand nehmen. Anschließend benutzt du das schwarze Fass während du die Eimer mit Farbe und den grauen Stoff in deinem Inventar hast."
Description[ENGLISH][9] = " Dye five bolts of cloth red for Lilli Gallfing in the workshop of Cadomyr, using the black barrel in the workshop. To dye the cloth you have to take the dyeing rod in your hand and use the black barrel whilst having red dye and grey cloth in your inventory."
Description[GERMAN][10] = "Du hast alle Aufgaben von Lilli Gallfing erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Lilli Gallfing."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {135, 576, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(135, 576, 0), position(63, 654, 0)} -- Sheeps
QuestTarget[2] = {position(135, 576, 0)} 
QuestTarget[3] = {position(135, 576, 0), position(134, 572, 0), position(141, 575, 0)} -- Spinning wheel and loom
QuestTarget[4] = {position(135, 576, 0)} 
QuestTarget[5] = {position(135, 576, 0), position(137, 572, 0)} -- Tailoring table
QuestTarget[6] = {position(135, 576, 0)} 
QuestTarget[7] = {position(135, 576, 0), position(128, 575, 0)} -- Camp fire
QuestTarget[8] = {position(135, 576, 0)}
QuestTarget[9] = {position(135, 576, 0), position(130, 575, 0), position(141, 574, 0)} -- Barrels
QuestTarget[10] = {position(135, 576, 0)}

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
    if base.factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
