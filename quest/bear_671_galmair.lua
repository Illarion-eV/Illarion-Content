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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (671, 'quest.bear_671_galmair');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Der verfressene Bär"
Title[ENGLISH] = "The greedy bear"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
-- Quest 1
Description[GERMAN][1] = "Bring 10 Getreide, 10 Äpfel und 1 Eimer voll Wasser zu Grijas Kokotte."
Description[ENGLISH][1] = "Take ten grain, ten apples and a bucket of water to Grijas Kokotte."
Description[GERMAN][2] = "Bring 5 Äpfel zum Bären."
Description[ENGLISH][2] = "Take five apples to the bear."
Description[GERMAN][3] = "Vielleicht solltest du Grijas Kokotte nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][3] = "Perhaps you should talk to Grijas Kokotte again, he is sure to have more for you to do."
-- Quest 2
Description[GERMAN][4] = "Bring 15 Zwiebeln, 1 Kochlöffel, 1 Holzkelle und 5 Steaks zu Grijas Kokotte."
Description[ENGLISH][4] = "Take fifteen onion, one cooking spoon, one wooden shovel and five steaks to Grijas Kokotte."
Description[GERMAN][5] = "Bring 1 Steak zum Bären."
Description[ENGLISH][5] = "Take one steak to the bear."
Description[GERMAN][6] = "Vielleicht solltest du Grijas Kokotte nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][6] = "Perhaps you should talk to Grijas Kokotte again, he is sure to have more for you to do."
-- Quest 3
Description[GERMAN][7] = "Bring 10 Tomaten, 10 Säckchen Mehl, 5 Würste und 4 Brote zu Grijas Kokotte."
Description[ENGLISH][7] = "Take ten tomatoes, ten lots of flour, five sausages and four loaves of bread to Grijas Kokotte"
Description[GERMAN][8] = "Bring 1 Wurst und 1 Brot zum Bären."
Description[ENGLISH][8] = "Take one sausage and a loaf of bread to the bear."
Description[GERMAN][9] = "Vielleicht solltest du Grijas Kokotte nochmal ansprechen, er hat sicher noch mehr für dich zu tun."
Description[ENGLISH][9] = "Perhaps you should talk to Grijas Kokotte again, he is sure to have more for you to do."
-- Quest 4
Description[GERMAN][10] = "Bring 15 Brötchen, 10 Zwiebelsuppen, 10 Fischgerichte und 2 Apfelkuchen zu Grijas Kokotte."
Description[ENGLISH][10] = "Take fifteen bread rolls, ten bowls of onion soup, ten fish dishes and two apple pies to Grijas Kokotte"
Description[GERMAN][11] = "Bring 1 Apfelkuchen zum Bären."
Description[ENGLISH][11] = "Take an apple pie to the bear."
-- Quest 5 - repeated
Description[GERMAN][12] = "Grijas Kokotte weiß immer, was der Bär gerade mag."
Description[ENGLISH][12] = "Grijas Kokotte knows what the bear wants today."
Description[GERMAN][13] = "Bring 1 Lachs zum Bären."
Description[ENGLISH][13] = "Take a salmon to the bear."
Description[GERMAN][14] = "Bring 1 Keks zum Bären."
Description[ENGLISH][14] = "Take a cookie to the bear."
Description[GERMAN][15] = "Bring 1 Honig zum Bären."
Description[ENGLISH][15] = "Take a honeycomb to the bear."
Description[GERMAN][16] = "Bring 1 Schinken zum Bären."
Description[ENGLISH][16] = "Take a ham to the bear."
Description[GERMAN][17] = "Bring 1 Möhre zum Bären."
Description[ENGLISH][17] = "Take a carrot to the bear."
Description[GERMAN][18] = "Bring 1 Eimer Wasser zum Bären."
Description[ENGLISH][18] = "Take a bucket of water to the bear."
Description[GERMAN][19] = "Bring 1 Kirschkuchen zum Bären."
Description[ENGLISH][19] = "Take a cherry cake to the bear."
Description[GERMAN][20] = "Besuch den Bären."
Description[ENGLISH][20] = "Visit the bear."



-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {334, 260, 0}
QuestTarget[2] = {275, 260, 0}
QuestTarget[4] = {334, 260, 0}
QuestTarget[5] = {275, 260, 0}
QuestTarget[7] = {334, 260, 0}
QuestTarget[8] = {275, 260, 0}
QuestTarget[10] = {334, 260, 0}
QuestTarget[11] = {275, 260, 0}
QuestTarget[13] = {275, 260, 0}
QuestTarget[14] = {275, 260, 0}
QuestTarget[15] = {275, 260, 0}
QuestTarget[16] = {275, 260, 0}
QuestTarget[17] = {275, 260, 0}
QuestTarget[18] = {275, 260, 0}
QuestTarget[19] = {275, 260, 0}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 20


function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestTargets(user, status)
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end


return M
