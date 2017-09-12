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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (714, 'quest.francine_leonard_714_runewick');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Der Liga der Köche und Bäcker Runewicks"
Title[ENGLISH] = "The Baker and Cook League of Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

Description[GERMAN][1] = "Schöpfe zehn Eimer Wasser und bring diese zu Francine Leonard in der Küche von Runewick. Dazu nimmst du die Eimer in die Hand und benutzt sie, während du vor einem Brunnen stehst. Der nächste Brunnen steht vor der Küche."
Description[ENGLISH][1] = "Fill ten buckets with water and take them to Francine Leonard at the kitchen in Runewick. Fill the buckets by using the buckets in your hand, whilst standing in front of a well. The next well is in front of the kitchen." 
Description[GERMAN][2] = "Geh zu Francine Leonard in der Küche von Runewick. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Francine Leonard at the kitchen in Runewick, she is sure to have another task for you."
Description[GERMAN][3] = "Mahle zehn Säcke Mehl für Francine Leonard an der Mühle vor Runewicks Küche. Um das Getreide zu mahlen, musst du die Holzkelle in die Hand nehmen und die Mühle benutzen, wenn du vor ihr stehst."
Description[ENGLISH][3] = "Grind ten sacks of flour for Francine Leonard at the mill in front of Runewick's kitchen. To grind the grain you have to take the wooden shovel in your hand and use the mill."
Description[GERMAN][4] = "Geh zu Francine Leonard in der Küche von Runewick. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Francine Leonard at the kitchen in Runewick, she is sure to have another task for you."
Description[GERMAN][5] = "Backe zehn Brötchen für Francine Leonard in der Küche von Runewick. Für die Brötchen musst du den Brotschieber benutzen und am Backofen stehen."
Description[ENGLISH][5] = "Bake ten bread rolls for Francine Leonard at the kitchen of Runewick. To bake you need to stand facing the baking oven and use the peel."
Description[GERMAN][6] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Laiens. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 10 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][6] = "Your current rank with the League of Cooking and Baking of Runewick is Layman. Return to Francine Leonard at the kitchen of Runewick once you reached Level 10 in Cooking and Baking."
Description[GERMAN][7] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Anfängers. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 20 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][7] = "Your current rank with the League of Cooking and Baking of Runewick is Novice. Return to Francine Leonard at the kitchen of Runewick once you reached Level 20 in Cooking and Baking."
Description[GERMAN][8] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Lehrlings. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 30 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][8] = "Your current rank with the League of Cooking and Baking of Runewick is Apprentice. Return to Francine Leonard at the kitchen of Runewick once you reached Level 30 in Cooking and Baking."
Description[GERMAN][9] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Initiatens. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 40 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][9] = "Your current rank with the League of Cooking and Baking of Runewick is Initiate. Return to Francine Leonard at the kitchen of Runewick once you reached Level 40 in Cooking and Baking."
Description[GERMAN][10] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Gesellens. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 50 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][10] = "Your current rank with the League of Cooking and Baking of Runewick is Journeyman. Return to Francine Leonard at the kitchen of Runewick once you reached Level 50 in Cooking and Baking."
Description[GERMAN][11] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Spezialistens. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 60 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][11] = "Your current rank with the League of Cooking and Baking of Runewick is Specialist. Return to Francine Leonard at the kitchen of Runewick once you reached Level 60 in Cooking and Baking."
Description[GERMAN][12] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Expertens. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 70 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][12] = "Your current rank with the League of Cooking and Baking of Runewick is Expert. Return to Francine Leonard at the kitchen of Runewick once you reached Level 70 in Cooking and Baking."
Description[GERMAN][13] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Adeptens. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 80 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][13] = "Your current rank with the League of Cooking and Baking of Runewick is Adept. Return to Francine Leonard at the kitchen of Runewick once you reached Level 80 in Cooking and Baking."
Description[GERMAN][14] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Artisanens. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 90 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][14] = "Your current rank with the League of Cooking and Baking of Runewick is Artisan. Return to Francine Leonard at the kitchen of Runewick once you reached Level 90 in Cooking and Baking."
Description[GERMAN][15] = "Dein derzeitiger Rang in der Liga der Köche und Bäcker von Runewick ist der eines Meisters. Gehe zu Francine Leonard in der Küche von Runewick sobald du Level 100 in der Fertigkeit Kochen und Backen erreicht hast."
Description[ENGLISH][15] = "Your current rank with the League of Cooking and Baking of Runewick is Master. Return to Francine Leonard at the kitchen of Runewick once you reached Level 100 in Cooking and Baking."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister der Liga der Köche und Bäcker von Runewick."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of the League of Cooking and Baking of Runewick."



-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {959, 842, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(959, 842, 0), position(948, 823, 0)} -- well
QuestTarget[2] = {position(959, 842, 0)}
QuestTarget[3] = {position(959, 842, 0), position(951, 842, 0)} -- mill
QuestTarget[4] = {position(959, 842, 0)}
QuestTarget[5] = {position(959, 842, 0), position(961, 835, 0), position(963, 837, 0)} -- baking oven
QuestTarget[6] = {position(959, 842, 0)} 
QuestTarget[7] = {position(959, 842, 0)} 
QuestTarget[8] = {position(959, 842, 0)} 
QuestTarget[9] = {position(959, 842, 0)} 
QuestTarget[10] = {position(959, 842, 0)} 
QuestTarget[11] = {position(959, 842, 0)} 
QuestTarget[12] = {position(959, 842, 0)} 
QuestTarget[13] = {position(959, 842, 0)} 
QuestTarget[14] = {position(959, 842, 0)} 
QuestTarget[15] = {position(959, 842, 0)} 

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 16


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

function M.QuestAvailability(user, status)
    if factions.isRunewickCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
