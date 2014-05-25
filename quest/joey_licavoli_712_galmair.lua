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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (712, 'quest.joey_licavoli_712_galmair');

require("base.common")
require("base.factions")
module("quest.joey_licavoli_712_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Willkommen in Galmair"
Title[ENGLISH] = "Welcome to Galmair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Suche Hannah Shepard bei den Feldern außerhalb von Galmair und frag sie nach einer Aufgabe. Solltest du weitere Aufgaben von Joey erledigen wollen, kehr später zu ihm zurück. Die Felder sind gleich ein paar Schritte östlich von Joeys Position."
Description[ENGLISH][1] = "Search for Hannah Shepard at the fields just outside Galmair. Then return back to Joey if you want more tasks from him. The fields are a few steps to the east of Joey's position."
Description[GERMAN][2] = "Geh zu Joey Licavoli beim Teleporter in Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Joey Licavoli at the teleporter of Galmair, he is sure to have another task for you."
Description[GERMAN][3] = "Suche Thorgrem Silverbeard, den Zwergen, in der Werkstatt von Galmair und frag ihn nach einer Aufgabe. Die Werkstatt findest du, wenn du die Stadt im Westen betrittst. Dann folgst du der Straße nach Südwesten, bis du ein Haus mit einem gelblich-braunem Dach findest. Das ist die Werkstatt."
Description[ENGLISH][3] = "Search for the dwarf Thorgrem Silverbeard at the workshop in Galmair and ask him for a task. You can find the workshop if you enter the city and follow the street south west until you see a building with a yellow-brown roof. That's the workshop."
Description[GERMAN][4] = "Geh zu Joey Licavoli beim Teleporter in Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Joey Licavoli at the teleporter of Galmair, he is sure to have another task for you."
Description[GERMAN][5] = "Suche den Zwergen Miggs in 'Galmairs Krone', dem Palast von Galmair. Den Palast findest du, wenn du die Stadt betrittst und der Straße nach Westen folgst. Miggs hält sich in der Bibliothek im Palast auf."
Description[ENGLISH][5] = "Search for the dwarf Miggs in 'Galmair's Crest', the Palace of Galmair. You can find the palace if you enter the city and follow the street to the west. Miggs can be found in the library."
Description[GERMAN][6] = "Geh zu Joey Licavoli beim Teleporter in Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Joey Licavoli at the teleporter of Galmair, he is sure to have another task for you."
Description[GERMAN][7] = "Finde Charwis Irongate und frag ihn, ob er eine Aufgabe für dich hat. Charwis Irongate hält sich am Marktplatz von Galmair auf. Der Marktplatz ist südlich des Palastes."
Description[ENGLISH][7] = "Find Charwis Irongate and ask him if he has a task for you. Charwis Irongate can be found at the marketplace in Galmair. The marketplace is south of the palace."
Description[GERMAN][8] = "Geh zu Joey Licavoli beim Teleporter in Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go to Joey Licavoli at the teleporter of Galmair, he is sure to have another task for you."
Description[GERMAN][9] = "Bruno Blackhole hat eine Aufgabe für dich. Geh und suche ihn in der Malachitmine. Die Malachitmine findest du, wenn du von der Werkstatt aus nach Süden gehst, daraufhin die Brücke überquerst und anschließend nach Südosten gehst."
Description[ENGLISH][9] = "Bruno Blackhole has a task for you, go and search for him at the Malachite Mine. The Malachite Mine can be found if you follow the street to the south from the workshop."
Description[GERMAN][10] = "Geh zu Joey Licavoli beim Teleporter in Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][10] = "Go to Joey Licavoli at the teleporter of Galmair, he is sure to have another task for you."
Description[GERMAN][11] = "Gretel Goldhair hat nach dir gefragt. Suche sie im Thronsaal in der Krone Galmairs und frag sie nach einer Aufgabe."
Description[ENGLISH][11] = "Gretel Goldhair was looking for you. Search for her in the throne room in Galmair's Crest and ask her for a task."
Description[GERMAN][12] = "Geh zu Joey Licavoli beim Teleporter in Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Go to Joey Licavoli at the teleporter of Galmair, he is sure to have another task for you."
Description[GERMAN][13] = "Groktan Flintsplit hat vielleicht eine Aufgabe für dich. Suche ihn im Haus des Schuldeneintreibers und frag, was du für ihn tun kannst. Groktan Flintsplit hält sich in dem Gebäude mit dem roten Ziegeldachach im Osten des Palastes auf."
Description[ENGLISH][13] = "Groktan Flintsplit probably has a task for you. Search for him in the house of the debt-collector and ask him for a task. Groktan Flintsplit can be found in the building with the red roof east of the palace."
Description[GERMAN][14] = "Geh zu Joey Licavoli beim Teleporter in Galmair. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][14] = "Go to Joey Licavoli at the teleporter of Galmair, he is sure to have another task for you."
Description[GERMAN][15] = "Pipillo hat nach dir gefragt. Suche er in der Herberge und frag er nach einer Aufgabe."
Description[ENGLISH][15] = "Pipillo was looking for you. Search for him in the Inn and ask him for a task."
Description[GERMAN][16] = "Du hast alle Aufgaben von Joey Licavoli erfüllt."
Description[ENGLISH][16] = "You have fulfilled all the tasks for Joey Licavoli."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {425, 247, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(425, 247, 0), position(434, 257, 0)} -- Hannah Shepard
QuestTarget[2] = {position(425, 247, 0)}
QuestTarget[3] = {position(425, 247, 0), position(387, 273, 0)} -- Thorgrem Silverbeard
QuestTarget[4] = {position(425, 247, 0)}
QuestTarget[5] = {position(425, 247, 0), position(374, 216, 0)} -- Miggs
QuestTarget[6] = {position(425, 247, 0)}
QuestTarget[7] = {position(425, 247, 0), position(360, 281, 0)} -- Charwis Irongate
QuestTarget[8] = {position(425, 247, 0)}
QuestTarget[9] = {position(425, 247, 0), position(439, 359, 0)} -- Bruno Blackhole
QuestTarget[10] = {position(425, 247, 0)}
QuestTarget[11] = {position(425, 247, 0), position(341, 218, 0)} -- Gretel Goldhair
QuestTarget[12] = {position(425, 247, 0)}
QuestTarget[13] = {position(425, 247, 0), position(388, 238, 0)} -- Groktan Flintsplit
QuestTarget[14] = {position(425, 247, 0)}
QuestTarget[13] = {position(425, 247, 0), position(412, 291, 0)} -- Pipillo
QuestTarget[14] = {position(425, 247, 0)}

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
    if base.factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
