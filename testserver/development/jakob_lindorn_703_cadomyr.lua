-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (703, 'quest.jakob_lindorn_703_cadomyr');

require("base.common")
module("development.jakob_lindorn_703_cadomyr", package.seeall)

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
Description[GERMAN][1] = "Bring dem Zwergen Berri Firegold in der Werkstatt von Cadomyr den Brief von Jakob Lindorn und kehr wieder zu Jakob zurück, wenn du mehr Aufgaben von ihm machen willst. Die Werkstatt kannst du ganz leicht finden. Geh durch das Haupttor im Norden, dann biegt nach rechts ab, geht durch das Tor, nun erneut nach Norden, dann öffnest du das Tor zu deiner linken und gehst nach Norden. Die Werkstatt befindet sich beim kleinen Garten mit den ganzen Werkzeugen drauf."
Description[ENGLISH][1] = "Take Jakob Lindorn's letter to the dwarf Berri Firegold at the workshop of Cadomyr. Then return back to Jakob if you want more tasks from him. You can find the workshop really easily. Go through the main gate north from here, then turn right and follow the street, go through the gate, turn left and go through the next gate. From here you go north until you reach a building to your right with a little garden and some tools outside."
Description[GERMAN][2] = "Such Grakamesh den Ork bei Sir Reginalds Gruft und fragt ihn nach einer Aufgabe. Die Gruft ist gleich da drüben hinter mir bei dem kleinen Eingang"
Description[ENGLISH][2] = "Search for the orc Grakamesh at Sir Reginald's Tomb and ask him for a task. The tomb is right behind me at the little entrace."
Description[GERMAN][3] = "Such die Zwergendame Mirarie Bragolin und fragt sie ob du ihr helfen kannst. "
Description[ENGLISH][3] = "Search for the dwarfess Mirarie Bragolin and ask her if she needs your help."
Description[GERMAN][4] = "Finde Hassan, den königlichen Fächelwedler und frag ihn ob er eine Aufgabe für dich hat. Hassan hält sich oft in der Taverne von Cadomyr nördlich des Marktplatzes auf."
Description[ENGLISH][4] = "Find Hassan, the royal fan-waver and ask him if he has a task for you. Hassan can be often found in the tavern, north of the market place in Cadomyr."
Description[GERMAN][5] = "Die Köchin Linda Rabon hat eine Aufgabe für dich, such sie bei der Taverne in Cadomyr."
Description[ENGLISH][5] = "The cook Linda Rabon has a task for you, search for her in the tavern in Cadomyr."
Description[GERMAN][6] = "Such Zerarisa beim Kap des Abschieds und hilf ihr, wenn sie eine Aufgabe für dich hat. Das Kap findest du, wenn du der Straße nach Westen folgst, die Wegweiser sollten dich direkt zum Kap führen."
Description[ENGLISH][6] = "Search for Zerarisa at the Cape Farewell and help her if she has a task for you. You can find the Cape if you follow the street to the west, the signposts should lead you in the right direction."
Description[GERMAN][7] = "Reret Odohir, die Notarin Cadomyrs hat eine Aufgabe für dich, such sie. Du kannst sie in dem Haus nordwestlich von der Taverne finden. Es ist das Haus mit der bunten Säule davor."
Description[ENGLISH][7] = "Reret Odohir, the notary of Cadomyr has a task for you if you search for her. You can find her in the building northwest of the tavern, it's the house with the colourful pillar."
Description[GERMAN][8] = "Du hast alle Aufgaben von Jakob Lindorn erfüllt."
Description[ENGLISH][8] = "You have fulfilled all the tasks for Jakob Lindorn."

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(124, 649, 0), position(141, 582, 0)} -- Berri Firegold
QuestTarget[2] = {position(124, 649, 0), position(133, 638, 0)} -- Grakamesh
QuestTarget[3] = {position(124, 649, 0), position(128, 621, 0)} -- Mirarie Bragolin
QuestTarget[4] = {position(124, 649, 0), position(110, 574, 0)} -- Hassan
QuestTarget[5] = {position(124, 649, 0), position(46, 683, 0)}  -- Zerarisa
QuestTarget[6] = {position(124, 649, 0), position(106, 553, 0)} -- Reret Odohir
QuestTarget[7] = {position(124, 649, 0)}

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
