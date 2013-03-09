-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (709, 'quest.seleseth_709_galmair');

require("base.common")
module("development.seleseth_709_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Das Edelsteinschleifen und Ziegelmachen"
Title[ENGLISH] = "Gem grinding and brick making"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel 30 Klumpen Lehm beim See im Westen der Stadt für Seleseth. Um den Lehm zu sammeln, musst du die Schauefel in die Hand nehmen und an einer Stelle, wo es Dreck nahe am Wasser gibt, graben."
Description[ENGLISH][1] = "Collect thirty clumps of clay at the lake on the west side of the city for Seleseth. You can collect the clay if you take the shovel in your hand and use it on a spot where there is dirt next to the water."
Description[GERMAN][2] = "Geh zu Seleseth. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Seleseth, he is sure to have another task for you."
Description[GERMAN][3] = "Stell 15 Ziegel am Glassschmelzofen für Seleseth in Galmair her. Um die Ziegel herzustellen, musst du die Ziegelform in die Hand nehmen und den Ofen benutzen. Dann stellst du ungebrannte Ziegel her. Anschließend wiederholst du das ganze und hast gebrannte Ziegel."
Description[ENGLISH][3] = "Produce fifteen bricks in the glass melting oven for Seleseth in Galmair. To produce the bricks, you have to take the brick mould in your hand and use the glass melting oven. First of all you will produce unfired bricks, then you need to repeat the action again to produce fired bricks."
Description[GERMAN][4] = "Geh zu Seleseth. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go back to Seleseth, he is sure to have another task for you."
Description[GERMAN][5] = "Schleif zehn Amethysten für Seleseth mit der Zange am Edelsteinschleifer. Um den Edelsteinschleifer zu benutzen, brauchst du rohe Edelsteine und eine Zange in der Hand. Rohe Edelsteine findet man beim schürfen in der Mine."
Description[ENGLISH][5] = "Grind ten amethysts for Seleseth using the tongs he gave you at the gem grinder. You can use the gem grinder if you have raw gems and hold the tongs in your hand. You can find raw gems in the mines whilst mining."
Description[GERMAN][6] = "Geh zu Seleseth. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Go back to Seleseth, he is sure to have another task for you."
Description[GERMAN][7] = "Geh erneut zum Edelsteinschleifer und mach für Seleseth zwei Beutel Amethyststaub aus den acht geschliffenen Amethysten."
Description[ENGLISH][7] = "Go once again to the gem grinder and produce two bags of amethyst powder by grinding eight of the ground amethysts you produced."
Description[GERMAN][8] = "Geh zu Seleseth. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go back to Seleseth, he is sure to have another task for you."
Description[GERMAN][9] = "Stell für Seleseth aus den zehn rohen Steinen 20 kleine Steine her. Um kleine Steine herzustellen, musst du den Meisel in die Hand nehmen und rohe Steine bei dir haben. Anschließend benutz du den Meisel, um aus den rohen Steinen Steinquader zu machen. Aus den gewonnen Steinquadarn lassen sich kleine Steine herstellen, wenn man die Prozedur wiederholt. Rohe Steine lassen sich in der Mine als Nebenprodukt beim Abbau finden. Die kleinen Steine können mit einer Schleuder in der Hand als Waffe genutzt werden."
Description[ENGLISH][9] = "Produce twenty small stones from the ten raw stones for Seleseth. To produce the small stones you need to take the chisel in your hand and use it whilst you have raw stones in your inventory. Once you have made stone blocks you repeat the process again to make small stones. You can find raw stones whilst mining. Furthermore you can use the small stones together with a sling as a weapon."
Description[GERMAN][10] = "Du hast alle Aufgaben von Seleseth erfüllt."
Description[ENGLISH][10] = "You have fulfilled all the tasks for Seleseth."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(387, 277, 0), position(292, 285, 0)} -- Clay
QuestTarget[2] = {position(387, 277, 0)} 
QuestTarget[3] = {position(387, 277, 0), position(385, 270, 0)} -- Glass melting oven
QuestTarget[4] = {position(387, 277, 0)} 
QuestTarget[5] = {position(387, 277, 0), position(387, 279, 0)} -- gem grinder
QuestTarget[6] = {position(387, 277, 0)} 
QuestTarget[7] = {position(387, 277, 0), position(387, 279, 0)} -- gem grinder
QuestTarget[8] = {position(387, 277, 0)} 
QuestTarget[9] = {position(387, 277, 0)} -- Workshop

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
