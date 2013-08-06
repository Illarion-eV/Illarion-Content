-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (4, 'quest.eugene_burton_4_wildness');

require("base.common")
module("quest.eugene_burton_4_wildness", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der Wilderer"
Title[ENGLISH] = "The Poacher"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe in den Elsbaumwald östlich von Eugene und jage sechs Schweine. Bringe ihn dann sechs Stücke Schweinefleisch. Um zu Jagen nehme eine Waffe in die Hand und greife die Schweine an."
Description[ENGLISH][1] = "Go into the Elstree forest east of Eugene and hunt six pigs. Then bring Eugene six slice of pork. To hunt take a weapon in your hand and attack the pigs."
Description[GERMAN][2] = "Jage noch 5 Schweine im Elsbaumwald."
Description[ENGLISH][2] = "Hunt 5 pigs in the Elstree forest."
Description[GERMAN][3] = "Jage noch 4 Schweine im Elsbaumwald."
Description[ENGLISH][3] = "Hunt 4 pigs in the Elstree forest."
Description[GERMAN][4] = "Jage noch 3 Schweine im Elsbaumwald."
Description[ENGLISH][4] = "Hunt 3 pigs in the Elstree forest."
Description[GERMAN][5] = "Jage noch 2 Schweine im Elsbaumwald."
Description[ENGLISH][5] = "Hunt 2 pigs in the Elstree forest."
Description[GERMAN][6] = "Jage noch ein Schweine im Elsbaumwald."
Description[ENGLISH][6] = "Hunt one pig in the Elstree forest."
Description[GERMAN][7] = "Kehre zu Eugene Burton zurück und bringe ihn sechsmal Schweinefleisch."
Description[ENGLISH][7] = "Return to Eugene Burton and bring him six slice of pork."
Description[GERMAN][8] = "Gehe zu Eugene Burton, der am westlichen Rand des Elsbaumwaldes aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][8] = "Go back to Eugene Burton in the west of the Elstree forest, he certainly have another task for you."
Description[GERMAN][9] = "Gehe in den Elsbaumwald östlich von Eugene und jage zwölf Rinder. Bringe ihn dann zwölf Steaks. Um zu Jagen nehme eine Waffe in die Hand und greife die Kühe an."
Description[ENGLISH][9] = "Go into the Elstree forest east of Eugene and hunt twelve bulls. Then bring Eugene twelve steaks. To hunt take a weapon in your hand and attack the bulls."
Description[GERMAN][10] = "Jage noch 11 Kühe im Elsbaumwald."
Description[ENGLISH][10] = "Hunt 11 bulls in the Elstree forest."
Description[GERMAN][11] = "Jage noch 10 Kühe im Elsbaumwald."
Description[ENGLISH][11] = "Hunt 10 bulls in the Elstree forest."
Description[GERMAN][12] = "Jage noch 9 Kühe im Elsbaumwald."
Description[ENGLISH][12] = "Hunt 9 bulls in the Elstree forest."
Description[GERMAN][13] = "Jage noch 8 Kühe im Elsbaumwald."
Description[ENGLISH][13] = "Hunt 8 bulls in the Elstree forest."
Description[GERMAN][14] = "Jage noch 7 Kühe im Elsbaumwald."
Description[ENGLISH][14] = "Hunt 7 bulls in the Elstree forest."
Description[GERMAN][15] = "Jage noch 6 Kühe im Elsbaumwald."
Description[ENGLISH][15] = "Hunt 6 bulls in the Elstree forest."
Description[GERMAN][16] = "Jage noch 5 Kühe im Elsbaumwald."
Description[ENGLISH][16] = "Hunt 5 bulls in the Elstree forest."
Description[GERMAN][17] = "Jage noch 4 Kühe im Elsbaumwald."
Description[ENGLISH][17] = "Hunt 4 bulls in the Elstree forest."
Description[GERMAN][18] = "Jage noch 3 Kühe im Elsbaumwald."
Description[ENGLISH][18] = "Hunt 3 bulls in the Elstree forest."
Description[GERMAN][19] = "Jage noch 2 Kühe im Elsbaumwald."
Description[ENGLISH][19] = "Hunt 2 bulls in the Elstree forest."
Description[GERMAN][20] = "Jage noch eine Kuh im Elsbaumwald."
Description[ENGLISH][20] = "Hunt one bull in the Elstree forest."
Description[GERMAN][21] = "Kehre zu Eugene Burton zurück und bringe ihn zwölf Steaks."
Description[ENGLISH][21] = "Return to Eugene Burton and bring him twelve steaks."
Description[GERMAN][22] = "Gehe zu Eugene Burton, der am westlichen Rand des Elsbaumwaldes aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][22] = "Go back to Eugene Burton in the west of the Elstree forest, he certainly have another task for you."
Description[GERMAN][23] = "Gehe in den Elsbaumwald östlich von Eugene und töte sechs Wölfe. Nehme dazu eine Waffe in die Hand und greife die Wölfe an."
Description[ENGLISH][23] = "Go into the Elstree forest east of Eugene and kill six wolves. Then bring Eugene twelve steaks. To hunt take a weapon in your hand and attack the wolves."
Description[GERMAN][24] = "Töte noch 5 Wölfe im Elsbaumwald."
Description[ENGLISH][24] = "Kill 5 wolves in the Elstree forest."
Description[GERMAN][25] = "Töte noch 4 Wölfe im Elsbaumwald."
Description[ENGLISH][25] = "Kill 4 wolves in the Elstree forest."
Description[GERMAN][26] = "Töte noch 3 Wölfe im Elsbaumwald."
Description[ENGLISH][26] = "Kill 3 wolves in the Elstree forest."
Description[GERMAN][27] = "Töte noch 2 Wölfe im Elsbaumwald."
Description[ENGLISH][27] = "Kill 2 wolves in the Elstree forest."
Description[GERMAN][28] = "Töte noch einen Wolf im Elsbaumwald."
Description[ENGLISH][28] = "Kill one wolf in the Elstree forest."
Description[GERMAN][29] = "Kehre zu Eugene Burton zurück."
Description[ENGLISH][29] = "Return to Eugene Burton."
Description[GERMAN][30] = "Gehe zu Eugene Burton, der am westlichen Rand des Elsbaumwaldes aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][30] = "Go back to Eugene Burton in the west of the Elstree forest, he certainly have another task for you."
Description[GERMAN][31] = "Gehe in den Elsbaumwald östlich von Eugene und töte einen Elfen. Nehme dazu eine Waffe in die Hand und greife den Elfen an."
Description[ENGLISH][31] = "Go into the Elstree forest east of Eugene and kill an elf. To hunt take a weapon in your hand and attack the elf."
Description[GERMAN][32] = "Kehre zu Eugene Burton zurück."
Description[ENGLISH][32] = "Return to Eugene Burton."
Description[GERMAN][33] = "Du hast alle Aufgaben von Eugene Burton erfüllt."
Description[ENGLISH][33] = "You have fulfilled all tasks for Eugene Burton."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(789, 483, 0), position(766, 459, 0)} 
QuestTarget[2] = {position(789, 483, 0), position(766, 459, 0)} --Wald
QuestTarget[3] = {position(789, 483, 0), position(766, 459, 0)} 
QuestTarget[4] = {position(789, 483, 0), position(766, 459, 0)}
QuestTarget[5] = {position(789, 483, 0), position(766, 459, 0)} 
QuestTarget[6] = {position(789, 483, 0), position(766, 459, 0)}
QuestTarget[7] = {position(693, 493, 0)} --Eugene
QuestTarget[8] = {position(693, 493, 0)} --Eugene
QuestTarget[9] = {position(766, 459, 0)} 
QuestTarget[10] = {position(766, 459, 0)}
QuestTarget[11] = {position(766, 459, 0)} 
QuestTarget[12] = {position(766, 459, 0)}
QuestTarget[13] = {position(766, 459, 0)} 
QuestTarget[14] = {position(766, 459, 0)} 
QuestTarget[15] = {position(766, 459, 0)} 
QuestTarget[16] = {position(766, 459, 0)}
QuestTarget[17] = {position(766, 459, 0)} 
QuestTarget[18] = {position(766, 459, 0)}
QuestTarget[19] = {position(766, 459, 0)} 
QuestTarget[20] = {position(766, 459, 0)} 
QuestTarget[21] = {position(693, 493, 0)} --Eugene
QuestTarget[22] = {position(693, 493, 0)} --Eugene
QuestTarget[23] = {position(776, 494, 0)}
QuestTarget[24] = {position(776, 494, 0)} 
QuestTarget[25] = {position(776, 494, 0)}
QuestTarget[26] = {position(776, 494, 0)} 
QuestTarget[27] = {position(776, 494, 0)} 
QuestTarget[28] = {position(776, 494, 0)} 
QuestTarget[29] = {position(693, 493, 0)} --Eugene 
QuestTarget[30] = {position(693, 493, 0)} --Eugene 
QuestTarget[31] = {position()}
QuestTarget[32] = {position(693, 493, 0)} --Eugene 
QuestTarget[33] = {position(693, 493, 0)} --Eugene


-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 33


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