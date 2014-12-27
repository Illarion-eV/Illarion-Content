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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (79, 'quest.myrthe_mildthorn_79_runewick');
     
local common = require("base.common")
local monsterQuests = require("monster.base.quests")
local M = {}
     
local GERMAN = Player.german
local ENGLISH = Player.english
     
-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Eine Höhle im Wald"
Title[ENGLISH] = "A Cave in the Woods"
     
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 10 Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][1] = "Go to the cave in the woods and kill ten wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][2] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 9 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][2] = "Go to the cave in the woods and kill nine more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][3] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 8 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][3] = "Go to the cave in the woods and kill eight more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][4] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 7 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][4] = "Go to the cave in the woods and kill seven more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][5] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 6 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][5] = "Go to the cave in the woods and kill six more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][6] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 5 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][6] = "Go to the cave in the woods and kill five more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][7] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 4 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][7] = "Go to the cave in the woods and kill four more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][8] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 3 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][8] = "Go to the cave in the woods and kill three more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][9] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 2 weitere Wölfe. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][9] = "Go to the cave in the woods and kill two more wolves in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][10] = "Gehe zur Höhle im Wald und töte in ihrer Nähe einen weiteren Wolf. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][10] = "Go to the cave in the woods and kill one more wolf in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][11] = "Kehre zurück zu Myrthe Mildthorn und berichte ihr von den Wölfen."
Description[ENGLISH][11] = "Return to Myrthe Mildthorn and tell her about the wolves."
Description[GERMAN][12] = "Kehre zurück zu Myrthe Mildthorn und frage, ob sie noch eine Aufgabe für dich hat."
Description[ENGLISH][12] = "Go back to Myrthe Mildthorn, she is sure to have another task for you." 
Description[GERMAN][13] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 5 Hunde. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][13] = "Go to the cave in the woods and kill five dogs in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][14] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 4 weitere Hunde. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][14] = "Go to the cave in the woods and kill four more dogs in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][15] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 3 weitere Hunde. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][15] = "Go to the cave in the woods and kill three more dogs in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][16] = "Gehe zur Höhle im Wald und töte in ihrer Nähe 2 weitere Hunde. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][16] = "Go to the cave in the woods and kill two more dogs in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][17] = "Gehe zur Höhle im Wald und töte in ihrer Nähe einen weiteren Hund. Kehre anchließend zu Myrthe Mildthorn zurück."
Description[ENGLISH][17] = "Go to the cave in the woods and kill one more dog in or near it. Return to Myrthe Mildthorn when you are done."
Description[GERMAN][18] =  "Kehre zurück zu Myrthe Mildthorn und berichte ihr von den Hunden."
Description[ENGLISH][18] = "Return to Myrthe Mildthorn and tell her about the dogs."
Description[GERMAN][19] = "Kehre zurück zu Myrthe Mildthorn und frage, ob sie noch eine Aufgabe für dich hat."
Description[ENGLISH][19] = "Go back to Myrthe Mildthorn, she is sure to have another task for you." 
Description[GERMAN][20] = "Gehe in den Wald und sucht die Spinne. Wenn man bedenkt dass Myrthe ein halbling ist wird diese riesige Spinne vielleicht doch nicht so groß sein. Bedenke dass Spinnen sich auch etwas weiter nördlich zu suchen."
Description[ENGLISH][20] = "Go to woods and search for the spider. Considering Myrthe is a halfing this giant spider might not be that big. Keep in mind that spiders move about so you should probably search north of the web as well."
Description[GERMAN][21] = "Du hast alle Aufgaben von Myrthe Mildthorn erfüllt."
Description[ENGLISH][21] = "You have fulfilled all the tasks for Myrthe Mildthorn." 


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {785, 748, 0}

 
-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[2] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[3] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[4] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[5] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[6] = {position(784, 772, 0), position (782, 711, 0)} -- Cave 
QuestTarget[7] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[8] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[9] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[10] = {position(784, 772, 0), position (782, 711, 0)} -- Cave
QuestTarget[11] = {position(784, 772, 0)}
QuestTarget[12] = {position(784, 772, 0)}
QuestTarget[13] = {position(784, 772, 0), position (753, 713, 0)} -- Cave
QuestTarget[14] = {position(784, 772, 0), position (753, 713, 0)} -- Cave
QuestTarget[15] = {position(784, 772, 0), position (753, 713, 0)} -- Cave
QuestTarget[16] = {position(784, 772, 0), position (753, 713, 0)} -- Cave
QuestTarget[17] = {position(784, 772, 0), position (753, 713, 0)} -- Cave
QuestTarget[18] = {position(784, 772, 0)}
QuestTarget[19] = {position(784, 772, 0)}
QuestTarget[20] = {position(785, 748, 0)}
QuestTarget[21] = {position(785, 748, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 22

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 79,
    location = {position = position(774, 711, 0), radius = 40},
    queststatus = {from = 1, to = 11},
    questTitle = {german = "Eine Höhle im Wald I", english = "A cave in the Woods I"},
    monsterName = {german = "Wölfe", english = "wolves"},
    npcName = "Myrthe Mildthorn",
    raceIds = {39} -- all wolves
}
monsterQuests.addQuest{
    questId = 79,
    location = {position = position(774, 711, 0), radius = 40},
    queststatus = {from = 13, to = 18},
    questTitle = {german = "Eine Höhle im Wald II", english = "A cave in the Woods II"},
    monsterName = {german = "Hunde", english = "dogs"},
    npcName = "Myrthe Mildthorn",
    raceIds = {58} -- all dogs
}
monsterQuests.addQuest{
    questId = 79,
    location = {position = position(774, 711, 0), radius = 40},
    queststatus = {from = 20, to = 21},
    questTitle = {german = "Eine Höhle im Wald III", english = "A cave in the Woods III"},
    monsterName = {german = "die Spinne", english = "the spider"},
    npcName = "Myrthe Mildthorn",
    raceIds = {19} -- all spiders
}
     
function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end
     
function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""
     
    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return Start
end
     
function M.QuestTargets(user, status)
    return QuestTarget[status]
end
     
function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

return M
