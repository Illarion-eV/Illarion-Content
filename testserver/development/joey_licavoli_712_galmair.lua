-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (712, 'quest.joey_licavoli_712_galmair');

require("base.common")
module("development.joey_licavoli_712_galmair", package.seeall)

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
Description[GERMAN][1] = "Bring Hannah Shepard bei den Feldern in Galmair den Brief von Joey Licavoli und kehr wieder zu Joey zurück, wenn du mehr Aufgaben von ihm machen willst. Die Felder sind gleich ein paar Schritte östlich von Joeys Position."
Description[ENGLISH][1] = "Take Joey Licavoli's letter to Hannah Shepard at the fields just outside Galmair. Then return to Joey if you want more tasks from him. The fields are a few steps to the east of Joey's position."
Description[GERMAN][2] = "Bring Thorgrem Silverbeard bei der Werkstatt in Galmair den Brief von Joey Licavoli und kehr wieder zu Joey zurück, wenn du mehr Aufgaben von ihm machen willst. Die Werkstatt findest du wenn du die Stadt im Westen betrittst, dann folgst du der Straße nach Südwesten bist du ein Haus mit einem gelblich-braunem Dach findest. Das ist die Werkstatt."
Description[ENGLISH][2] = "Take Joey Licavoli's letter to Thorgrem Silverbeard at the workshop in Galmair. Then return back to Joey if you want more tasks from him. You can find the workshop if you enter the city and follow the street south west until you see a building with a yellow-brown roof. That's the workshop."
Description[GERMAN][3] = "Such den Zwergen Miggs in 'Galmairs Krone', den Palast von Galmair. Der Palast lässt sich finden, wenn du die Stadt betrittst und der Straße nach Westen folgst. Miggs hält sich in der Bibliothek im Palast auf."
Description[ENGLISH][3] = "Search for the dwarf Miggs in 'Galmair's Crest', the Palace of Galmair. You can find the palace if you enter the city and follow the street to the west. Miggs can be found in the library."
Description[GERMAN][4] = "Finde Charwis Irongate und frag ihn, ob er eine Aufgabe für dich hat. Charwis Irongate hält sich am Marktplatz von Galmair auf. Der Marktplatz ist südlich des Palastes."
Description[ENGLISH][4] = "Find Charwis Irongate and ask him if he has a task for you. Charwis Irongate can be found at the market place in Galmair. The market place is south of the palace."
Description[GERMAN][5] = "Bruno Blackhole hat eine Aufgabe für dich, geh und such ihn in der Malachitmine. Die Malachitmine findest du wenn du von der Werkstatt aus nach Südosten gehst."
Description[ENGLISH][5] = "Bruno Blackhole has a task for you, go and search for him at the Malachite Mine. The Malachite Mine can be found if you follow the street to the south from the workshop."
Description[GERMAN][6] = "Gretel Goldhair hat nach dir gefragt. Such sie in der Krone Galmairs und frag sie nach einer Aufgabe."
Description[ENGLISH][6] = "Gretel Goldhair was looking for you. Search for her in Galmair's Crest and ask her for a task."
Description[GERMAN][7] = "Groktan Flintsplit hat vielleicht eine Aufgabe für dich. Such ihn in Galmair und frag was du für ihn tun kannst. Groktan Flintsplit hält sich in dem Gebäude mit dem roten Dach im Osten des Palastes auf."
Description[ENGLISH][7] = "Groktan Flintsplit probably has a task for you. Search for him in Galmair and ask him for a task. Groktan Flintsplit can be found in the building with the red roof east of the palace."
Description[GERMAN][8] = "Du hast alle Aufgaben von Joey Licavoli erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Joey Licavoli."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(425, 247, 0), position(434, 257, 0)} -- Hannah Shepard
QuestTarget[2] = {position(425, 247, 0), position(387, 273, 0)} -- Thorgrem Silverbeard
QuestTarget[3] = {position(425, 247, 0), position(374, 216, 0)} -- Miggs
QuestTarget[4] = {position(425, 247, 0), position(360, 281, 0)} -- Charwis Irongate
QuestTarget[5] = {position(425, 247, 0), position(439, 359, 0)} -- Bruno Blackhole
QuestTarget[6] = {position(425, 247, 0), position(341, 218, 0)} -- Gretel Goldhair
QuestTarget[7] = {position(425, 247, 0), position(388, 238, 0)} -- Groktan Flintsplit

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 8


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
