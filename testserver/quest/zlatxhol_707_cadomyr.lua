-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (707, 'quest.zlatxhol_707_cadomyr');

require("base.common")
module("quest.zlatxhol_707_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Glasblasen und Ziegelmachen"
Title[ENGLISH] = "Glass blowing and brick making"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Klumpen Lehm beim Fluss im Westen der Stadt für Zlatxhol in der Werkstatt von Cadomyr. Um den Lehm zu sammeln, musst du die Schaufel in die Hand nehmen und an einer Stelle, wo es Dreck nahe am Wasser gibt, graben."
Description[ENGLISH][1] = "Collect ten clumps of clay at the river on the west side of the city for Zlatxhol in the workshop of Cadomyr. You can collect the clay if you take the shovel in your hand and use it on a spot where there is dirt next to the water."
Description[GERMAN][2] = "Geh zu Zlatxhol in der Werkstatt von Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Zlatxhol in the workshop of Cadomyr, he is sure to have another task for you."
Description[GERMAN][3] = "Stell zehn Ziegel am Glasschmelzofen für Zlatxhol in Cadomyr her. Um ungebrannte Ziegel herzustellen, musst du die Ziegelform in die Hand nehmen und den Ofen benutzen. Anschließend wiederholst du das ganze und erhältst gebrannte Ziegel."
Description[ENGLISH][3] = "Produce ten bricks in the glass melting oven for Zlatxhol in Cadomyr. To produce the bricks, you have to take the brick mould in your hand and use the oven. First of all you will produce unfired bricks, then you repeat the action again to produce fired bricks."
Description[GERMAN][4] = "Geh zu Zlatxhol in der Werkstatt von Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Zlatxhol in the workshop of Cadomyr, he is sure to have another task for you."
Description[GERMAN][5] = "Sammel zehn Haufen groben Sand. Geh zum Sieb in der Werkstatt und mach daraus Quarzsand und zeig anschließend den Sand Zlatxhol in der Werkstatt von Cadomyr. Groben Sand findet man unter Steinen in der Wüste, wenn man mit der großen Schaufel gräbt. Hat man erst etwas groben Sand, kann man mit der Holzkelle am Sieb Quarzsand herstellen. Dazu musst du das Sieb benutzen während du die Kelle in der Hand hältst."
Description[ENGLISH][5] = "Collect ten piles coarse sand and go to the sieve in the workshop to turn these into quartz sand, and show the result to Zlatxhol in the workshop of Cadomyr. You can dig coarse sand in the desert around stones with the big shovel Zlatxhol gave you before. Once you have enough coarse sand, you can use the wooden shovel to sieve the quartz sand. To produce quartz sand take the wooden shovel in your hand and use the sieve whilst standing in front of it."
Description[GERMAN][6] = "Geh zu Zlatxhol in der Werkstatt von Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go to Zlatxhol in the workshop of Cadomyr, he is sure to have another task for you."
Description[GERMAN][7] = "Stell zehn Glasblöcke für Zlatxhol in der Werkstatt von Cadomyr her. Um Glasblöcke herzustellen brauchst du Quarzsand, hast du diesen brauchst du noch Asche. Asche lässt sich produzieren, indem du Holzscheite an einem Feuer verbrennst. Zuerst leg einen Holzscheit auf den Boden, anschließend benutzt du diesen einmal. Daraufhin benutzt du das Feuer um aus den restlichen Scheiten in deinem Inventar Asche herzustellen. Hast du die Asche und den Sand, musst du zum Glasschmelzofen. Dort angekommen nimmst du das Glasblasrohr in die Hand und benutzt den Ofen um Glasblöcke herzustellen." 
Description[ENGLISH][7] = "Produce ten glass ingots for Zlatxhol in the workshop of Cadomyr. To produce glass ingots you need quartz sand and ash. To produce ash place one wooden log on the ground, then use it. Once the fire is lit, wait for the fire to turn the remaining logs in your inventory to ash. When you have enough ash and quartz sand, go to the glass melting oven, take the glass blowing pipe in your hand and use the oven."
Description[GERMAN][8] = "Geh zu Zlatxhol in der Werkstatt von Cadomyr, er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go to Zlatxhol in the workshop of Cadomyr, he is sure to have another task for you."
Description[GERMAN][9] = "Stell fünf leere Flaschen mit den Glasblöcken für Zlatxhol her und zeig ihm die Flaschen. Um die Flaschen herzustellen nimmst du das Glasblasrohr in die Hand und benutzt dieses während du vor dem Glasschmelzofen stehst."
Description[ENGLISH][9] = "Produce five empty bottles from glass ingots using the glass blowing pipe at the glass melting oven and show them to Zlatxhol. To produce the bottles go to the glass melting oven and take the glass blowing pipe in your hand and then use it."
Description[GERMAN][10] = "Du hast alle Aufgaben von Zlatxhol erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Zlatxhol."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(142, 589, 0), position(84, 612, 0)} -- Clay
QuestTarget[2] = {position(142, 589, 0)} 
QuestTarget[3] = {position(142, 589, 0), position(142, 587, 0)} -- Glass melting oven
QuestTarget[4] = {position(142, 589, 0)} 
QuestTarget[5] = {position(142, 589, 0), position(128, 654, 0), position(143, 592, 0)} -- sand and sieve
QuestTarget[6] = {position(142, 589, 0)} 
QuestTarget[7] = {position(142, 589, 0), position(142, 587, 0)} -- Glass melting oven
QuestTarget[8] = {position(142, 589, 0)} 
QuestTarget[9] = {position(142, 589, 0), position(142, 587, 0)} -- Glass melting oven
QuestTarget[10] = {position(142, 589, 0)} 

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

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end
