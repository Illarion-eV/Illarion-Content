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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (703, 'quest.jakob_lindorn_703_cadomyr');

require("base.common")
require("base.factions")
module("quest.jakob_lindorn_703_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Willkommen in Cadomyr"
Title[ENGLISH] = "Welcome to Cadomyr"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Such Berri Firegold in der Werkstatt von Cadomyr und frag ihn nach einer Aufgabe. Solltest du weitere Aufgaben von Jakob erledigen wollen, kehr später zu ihm zurück. Die Werkstatt kannst du ganz leicht finden. Geh durch das Haupttor im Norden, dann bieg nach rechts ab, geh durch das Tor, nun erneut nach Norden, dann öffnest du das Tor zu deiner linken und gehst nach Norden. Die Werkstatt befindet sich beim kleinen Garten mit den Werkzeugen darin."
Description[ENGLISH][1] = "Search for the dwarf Berri Firegold at the workshop in Cadomyr. Then return back to Jakob if you want more tasks from him. You can find the workshop really easily. Go through the main gate north from here, then turn right and follow the street, go through the gate, turn left and go through the next gate. From here you go north until you reach a building to your right with a little garden and some tools outside."
Description[GERMAN][2] = "Geh zu Jakob Lindorn beim Teleporter in Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Jakob Lindorn at the teleporter of Cadomyr, he is sure to have another task for you."
Description[GERMAN][3] = "Such Grakamesh den Ork bei Sir Reginalds Gruft und frag ihn nach einer Aufgabe. Die Gruft ist gleich hinter Jakob bei dem kleinen Eingang."
Description[ENGLISH][3] = "Search for the orc Grakamesh at Sir Reginald's Tomb and ask him for a task. The tomb is right behind Jakob at the little entrace."
Description[GERMAN][4] = "Geh zu Jakob Lindorn beim Teleporter in Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Jakob Lindorn at the teleporter of Cadomyr, he is sure to have another task for you."
Description[GERMAN][5] = "Such die Zwergendame Mirarie Bragolin und frag sie, ob du ihr helfen kannst. Mirarie Bragolin ist beim Tor kurz vor dem Marktplatz."
Description[ENGLISH][5] = "Search for the dwarfess Mirarie Bragolin and ask her if she needs your help. Mirarie Bragolin is at the inner gate, shortly before the marketplace."
Description[GERMAN][6] = "Geh zu Jakob Lindorn beim Teleporter in Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Jakob Lindorn at the teleporter of Cadomyr, he is sure to have another task for you."
Description[GERMAN][7] = "Finde Hassan, den königlichen Fächelwedler und frag ihn, ob er eine Aufgabe für dich hat. Hassan hält sich oft in der Taverne von Cadomyr nördlich des Marktplatzes auf."
Description[ENGLISH][7] = "Find Hassan, the royal fan-waver and ask him if he has a task for you. Hassan can be often found in the tavern, north of the marketplace in Cadomyr."
Description[GERMAN][8] = "Geh zu Jakob Lindorn beim Teleporter in Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go to Jakob Lindorn at the teleporter of Cadomyr, he is sure to have another task for you."
Description[GERMAN][9] = "Die Köchin Linda Rabon hat eine Aufgabe für dich. Such sie bei der Taverne in Cadomyr."
Description[ENGLISH][9] = "The cook Linda Rabon has a task for you, search for her in the tavern in Cadomyr."
Description[GERMAN][10] = "Geh zu Jakob Lindorn beim Teleporter in Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][10] = "Go to Jakob Lindorn at the teleporter of Cadomyr, he is sure to have another task for you."
Description[GERMAN][11] = "Such Zerarisa beim Kap des Abschieds und hilf ihr, wenn sie eine Aufgabe für dich hat. Das Kap findest du, wenn du der Straße nach Westen folgst. Die Wegweiser sollten dich direkt zum Kap führen."
Description[ENGLISH][11] = "Search for Zerarisa at Cape Farewell and help her if she has a task for you. You can find the Cape if you follow the street to the west, the signposts should lead you in the right direction."
Description[GERMAN][12] = "Geh zu Jakob Lindorn beim Teleporter in Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Go to Jakob Lindorn at the teleporter of Cadomyr, he is sure to have another task for you."
Description[GERMAN][13] = "Reret Odohir, die Notarin Cadomyrs hat eine Aufgabe für dich. Such sie. Du kannst sie in dem Haus nordwestlich von der Taverne finden. Es ist das Haus mit der bunten Säule davor."
Description[ENGLISH][13] = "Reret Odohir, the notary of Cadomyr, has a task for you if you search for her. You can find her in the building northwest of the tavern, it's the house with the colourful pillar."
Description[GERMAN][14] = "Geh zu Jakob Lindorn beim Teleporter in Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][14] = "Go to Jakob Lindorn at the teleporter of Cadomyr, he is sure to have another task for you."
Description[GERMAN][15] = "Such Evera in das Tor und hilf ihr, wenn sie eine Aufgabe für dich hat."
Description[ENGLISH][15] = "Search for Evera inside the gate and help her if she has a task for you."
Description[GERMAN][16] = "Du hast alle Aufgaben von Jakob Lindorn erfüllt."
Description[ENGLISH][16] = "You have fulfilled all the tasks for Jakob Lindorn."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {124, 649, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(124, 649, 0), position(141, 582, 0)} -- Berri Firegold
QuestTarget[2] = {position(124, 649, 0)}
QuestTarget[3] = {position(124, 649, 0), position(133, 638, 0)} -- Grakamesh
QuestTarget[4] = {position(124, 649, 0)}
QuestTarget[5] = {position(124, 649, 0), position(128, 621, 0)} -- Mirarie Bragolin
QuestTarget[6] = {position(124, 649, 0)}
QuestTarget[7] = {position(124, 649, 0), position(110, 574, 0)} -- Hassan
QuestTarget[8] = {position(124, 649, 0)}
QuestTarget[9] = {position(124, 649, 0), position(116, 576, 0)} -- Linda Rabon
QuestTarget[10] = {position(124, 649, 0)}
QuestTarget[11] = {position(124, 649, 0), position(46, 683, 0)}  -- Zerarisa
QuestTarget[12] = {position(124, 649, 0)}
QuestTarget[13] = {position(124, 649, 0), position(106, 553, 0)} -- Reret Odohir
QuestTarget[14] = {position(124, 649, 0)}
QuestTarget[15] = {position(124, 649, 0), position(139, 622, 0)} -- Evera
QuestTarget[16] = {position(124, 649, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 16


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
