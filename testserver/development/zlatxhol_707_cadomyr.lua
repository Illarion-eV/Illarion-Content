-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (707, 'quest.zlatxhol_707_cadomyr');

require("base.common")
module("development.zlatxhol_707_cadomyr", package.seeall)

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
Description[GERMAN][1] = "Sammel 30 Klumpen Lehm beim Fluss im Westen der Stadt für Zlatxhol."
Description[ENGLISH][1] = "Collect 30 clumps of clay at the river on the west side of the city for zlatxhol."
Description[GERMAN][3] = "Stell 15 Ziegel für Zlatxhol her."
Description[ENGLISH][3] = "Produce 15 bricks for Zlatxhol."
Description[GERMAN][5] = "Sammel zehn Haufen groben Sand, geh zum Sieb in der Werkstatt und mach daraus Quarzsand und zeig anschließend den Sand Zlatxhol."
Description[ENGLISH][5] = "Collect ten piles coarse sand, go to the sieve in the workshop and turn these to quartzsand and show the result to Zlatxhol."
Description[GERMAN][7] = "Mach ein Feuer mit dem Holz und dem Beil das dir Zlatxhol gegeben hat und mach dann zusammen mit dem Quarzsand am Glassschmelzofen zehn Glasbblöcke daraus."
Description[ENGLISH][7] = "Make a fire with the wood and the hatchet which Zlatxhol gave you and make together with the quartzsand at the glass melting oven ten glass ingots."
Description[GERMAN][9] = "Stell fünf leere Flaschen für Zlatxhol her und zeig ihm die Flaschen."
Description[ENGLISH][9] = "Produce five empty bottles for Zlatxhol and show him the bottles."
Description[GERMAN][10] = "Du hast alle Aufgaben von Zlatxhol erfüllt."
Description[ENGLISH][10] = "You have fulfilled all tasks of Zlatxhol."


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
