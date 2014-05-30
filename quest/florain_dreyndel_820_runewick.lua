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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (820, 'quest.florain_dreyndel_820_runewick');

require("base.common")
module("quest.florain_dreyndel_820_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Ein guter Anfang in Runewick"
Title[ENGLISH] = "A good beginning in Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zu Daniel Brock und frag ihn nach einer Aufgabe. Er ist im Turm der Luft zu finden.\n Von Florain aus, einfach über die lange Brücke nach Osten und durch das blaue Portal gehen. Am Marktplatz angekommen, ist der Turm der Luft das Gebäude im Süden. Dort einfach eine Etage nach unten und durch die Tür gehen."
Description[ENGLISH][1] = "Go to Daniel Brock and ask him for a task. \n From Florain's position just go over the long bridge to the east and through the blue portal. When you arrived on the marketplace, the tower of air is the building to the south. There just go one floor down and through the door."
Description[GERMAN][2] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][2] = "Go back to Florain if you need more tasks."
Description[GERMAN][3] = "Gehe zu Judith Tanner und frag sie nach einer Aufgabe. Sie ist im Turm des Feuers zu finden.\n Vom Marktplatz aus einfach in das Gebäude im Norden gehen, dem Turm des Feuers, und gleich nach dem Betreten nach links um ins Untergeschoss zu gelanden. Dort direkt durch die Tür rechts von der kleinen Taverne gehen."
Description[ENGLISH][3] = "Go to Judith Tanner and ask her for a task. She can be found in the tower of fire.\n From the marketplace just go to the building in the north, the tower of fire, and after entering to the left to go down one floor. There just go through the door on the right of the small tavern."
Description[GERMAN][4] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][4] = "Go back to Florain if you need more tasks."
Description[GERMAN][5] = "Gehe zu Zassaria Riverbank und frag sie nach einer Aufgabe. Sie ist auf dem Marktplatz von Runewick zu finden.\n Von Florain aus, einfach über die lange Brücke nach Osten gehen und am Ende durch das blaue Portal. Zassaria ist eine Echse, du kannst sie also nicht verpassen."
Description[ENGLISH][5] = "Go to Zassaria Riverbank and ask her for a task. She can be found on Runewick's marketplace.\n From Florain's position just go over the long bridge to the east and through the blue portal at the end of the path. Zassaria is a lizard, so you can't miss her."
Description[GERMAN][6] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][6] = "Go back to Florain if you need more tasks."
Description[GERMAN][7] = "Gehe zu Neiran El Nayale und frag ihn nach einer Aufgabe. Er ist im Turm des Feuers im Obergeschoss zu finden.\n Gehe vom Marktplatz nach Norden in den Turm des Feuers, dort rechts durch die Tür und die Treppe nach oben. Dort gehe durch die Tür im Süden."
Description[ENGLISH][7] = "Go to Neiran El Nayale and ask him for a task. He can be found on the upper floor of the tower of fire.\n From the marketplace go to the north into the tower of fire and there through the door to the right and up the stairs. There go through the door to the south."
Description[GERMAN][8] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][8] = "Go back to Florain if you need more tasks."
Description[GERMAN][9] = "Gehe zu Baldo Proudtoe und frag ihn nach einer Aufgabe. Er kann in den Gärten Runewicks gefunden werden.\n Die Gärten Runewicks können gefunden werden, indem man auf dem Runewick Marktplatz durch das rote Portal geht."
Description[ENGLISH][9] = "Go to Baldo Proudtoe and ask him for a task. He can be found in the gardens of Runewick.\n The gardens of Runewick can be found through the red portal from Runewick's marketplace."
Description[GERMAN][10] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][10] = "Go back to Florain if you need more tasks."
Description[GERMAN][11] = "Gehe zu Nana Winterbutter und frag sie nach einer Aufgabe. Sie ist gleich nördlich von Florain in Yewdale zu finden. Sie wird wohl am Feuer vor ihrem Haus sitzen und kochen."
Description[ENGLISH][11] = "Go to Nana Winterbutter and ask her for a task. She can be found to the north of Florain in Yewdale. She will be sitting cooking at the fire in front of her house."
Description[GERMAN][12] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][12] = "Go back to Florain if you need more tasks."
Description[GERMAN][13] = "Gehe zu Madeline Clarbelis und frag sie nach einer Aufgabe. Sie ist im Turm der Erde. Der Turm der Erde kann vom Runewick Marktplatz erreicht werden, indem man durch den Turm des Feuers im Norden geht und diesen zum Osten hin verlässt. Madeline wird in ihre Bücher vertieft sein."
Description[ENGLISH][13] = "Go to Madeline Clarbelis and ask her for a task. She can be found in the Tower of Earth. The Tower of Earth can be reached from Runewick's marketplace, if you go through the Tower of Fire to the north and leave it to the east. Madeline will be reading her books."
Description[GERMAN][14] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][14] = "Go back to Florain if you need more tasks."
Description[GERMAN][15] = "Gehe zu Uriel Urch und frag ihn nach einer Aufgabe. Er kann im Turm des Feuers gefunden werden, dem Gebäude nödlich vom Runewick Marktplatz. Dort sitzt er im Untergeschoss an einem Tisch und lässt sich von Rose Deepdelver mit Bier versorgen."
Description[ENGLISH][15] = "Go to Uriel Urch and ask him for a task. He can be found in the Tower of Fire, the building to the north of the Runewick's marketplace. He will be sitting at a table in the basement where Rose Deepdelver will be serving him beer."
Description[GERMAN][16] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][16] = "Go back to Florain if you need more tasks."
Description[GERMAN][17] = "Gehe zu Lilith Needlehand und frag sie nach einer Aufgabe. Sie ist im Untergeschoss vom Turm des Feuers, das Gebäude nördlich des Marktplatzes von Runewick. Sie ist in ihrer Werkstatt zu finden, gleich um die Ecke von Uriel Urch."
Description[ENGLISH][17] = "Go to Lilith Needlehand and ask her for a task. She can be found in the basement of the Tower of Fire, the building to the north of Runewick's marketplace. She will be in her workshop right around the corner from Uriel Urch."
Description[GERMAN][18] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][18] = "Go back to Florain if you need more tasks."
Description[GERMAN][19] = "Phillibald hat nach dir gefragt. Suche er in der  Bibliothek der Luft und frag er nach einer Aufgabe."
Description[ENGLISH][19] = "Phillibald was looking for you. Search for him in the Library of Air and ask him for a task."
Description[GERMAN][20] = "Gehe zu Florain zurück, wenn du weitere Aufgaben benötigst."
Description[ENGLISH][20] = "Go back to Florain if you need more tasks."
Description[GERMAN][21] = "Gehe zu Cilivren Itiireae und frag sie nach einer Aufgabe. Sie kann südlich der Felder gefunden werden."
Description[ENGLISH][21] = "See Cilivren Itiireae and ask her for a task.  She can be found south of the fields."
Description[GERMAN][22] = "Florain Dreyndel kannn dir nun nicht mehr weiterhelfen. Frage einfach jeden, den du triffst nach Aufgaben und du wirst gut zurecktkommen."
Description[ENGLISH][22] = "Florain Dreyndel cannot help you any further now. Just ask everyone you meet for tasks and you will get around just fine."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {833, 815, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(904, 827, 0)} -- Daniel
QuestTarget[2] = {position(833, 815, 0)} -- Florain
QuestTarget[3] = {position(905, 780, 0)} -- Judith
QuestTarget[4] = {position(833, 815, 0)} -- Florain
QuestTarget[5] = {position(900, 800, 1)} -- Zassaria
QuestTarget[6] = {position(833, 815, 0)} -- Florain
QuestTarget[7] = {position(897, 781, 2 )} -- Neiran
QuestTarget[8] = {position(833, 815, 0)} -- Florain
QuestTarget[9] = {position(941, 790, 0)} -- Baldo
QuestTarget[10] = {position(833, 815, 0)} -- Florain
QuestTarget[11] = {position(791, 798, 0)} -- Nana
QuestTarget[12] = {position(833, 815, 0)} -- Florain
QuestTarget[13] = {position(951, 766, 1)} -- Madeline
QuestTarget[14] = {position(833, 815, 0)} -- Florain
QuestTarget[15] = {position(902, 773, 0)} -- Uriel
QuestTarget[16] = {position(833, 815, 0)} -- Florain
QuestTarget[17] = {position(893, 756, 0)} -- Lilith
QuestTarget[18] = {position(833, 815, 0)} -- Florain
QuestTarget[19] = {position(901, 831, 1)} -- Phillibald
QuestTarget[20] = {position(833, 815, 0)} -- Florain
QuestTarget[21] = {position(843, 844, 0)} -- Cilivren
QuestTarget[22] = {position(833, 815, 0)} -- Florain

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 22


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
