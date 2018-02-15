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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (716, 'quest.thomas_weste_716_runewick');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Adrons Braukunstschule"
Title[ENGLISH] = "Adron's Brewery School"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Pflücke sechsig Äpfel und bring diese zu Thomas Weste bei der Küche von Runewick. Gehe dazu weit nach Westen über zwei gorße Brücken. Benutze den Apfelbaum um zu ernten."
Description[ENGLISH][1] = "Pick sixty apples and take them to Thomas Weste at the kitchen in Runewick. You'll find apple trees far west behind the second large bridge. Use the apple tree to get the apples." 
Description[GERMAN][2] = "Geh zu Thomas Weste bei der Küche von Runewick. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go to Thomas Weste at the kitchen in Runewick, he is sure to have another task for you."
Description[GERMAN][3] = "Schöpfe zehn Eimer Wasser und bring diese zu Thomas Weste bei der Küche von Runewick. Dazu nimmst du die Eimer in die Hand und benutzt sie, während du vor einem Brunnen stehst. Der nächste Brunnen steht vor der Küche."
Description[ENGLISH][3] = "Fill ten buckets with water and take them to Thomas Weste at the kitchen in Runewick. Fill the buckets by using the buckets in your hand, whilst standing in front of a well. The closest well is in front of the kitchen."
Description[GERMAN][4] = "Geh zu Thomas Weste bei der Küche von Runewick. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][4] = "Go to Thomas Weste at the kitchen in Runewick, he is sure to have another task for you."
Description[GERMAN][5] = "Braue zehn Flaschen Cider für Thomas Weste bei der Küche von Runewick. Dazu musst du den Kochlöffel benutzen und am Braufass stehen."
Description[ENGLISH][5] = "Brew ten bottles of cider for Thomas Weste at the kitchen of Runewick. To brew you need to stand facing the wine barrel and use the cooking spoon."
Description[GERMAN][6] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Laiens. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 10 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][6] = "Your current rank at Adron's Brewery School of Runewick is Layman. Return to Thomas Weste at the kitchen of Runewick once you reached Level 10 in Brewing."
Description[GERMAN][7] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Anfängers. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 20 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][7] = "Your current rank at Adron's Brewery School of Runewick is Novice. Return to Thomas Weste at the kitchen of Runewick once you reached Level 20 in Brewing."
Description[GERMAN][8] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Lehrlings. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 30 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][8] = "Your current rank at Adron's Brewery School of Runewick is Apprentice. Return to Thomas Weste at the kitchen of Runewick once you reached Level 30 in Brewing."
Description[GERMAN][9] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Initiatens. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 40 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][9] = "Your current rank at Adron's Brewery School of Runewick is Initiate. Return to Thomas Weste at the kitchen of Runewick once you reached Level 40 in Brewing."
Description[GERMAN][10] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Gesellens. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 50 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][10] = "Your current rank at Adron's Brewery School of Runewick is Journeyman. Return to Thomas Weste at the kitchen of Runewick once you reached Level 50 in Brewing."
Description[GERMAN][11] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Spezialistens. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 60 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][11] = "Your current rank at Adron's Brewery School of Runewick is Specialist. Return to Thomas Weste at the kitchen of Runewick once you reached Level 60 in Brewing."
Description[GERMAN][12] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Expertens. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 70 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][12] = "Your current rank at Adron's Brewery School of Runewick is Expert. Return to Thomas Weste at the kitchen of Runewick once you reached Level 70 in Brewing."
Description[GERMAN][13] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Adeptens. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 80 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][13] = "Your current rank at Adron's Brewery School of Runewick is Adept. Return to Thomas Weste at the kitchen of Runewick once you reached Level 80 in Brewing."
Description[GERMAN][14] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Artisanens. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 90 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][14] = "Your current rank at Adron's Brewery School of Runewick is Artisan. Return to Thomas Weste at the kitchen of Runewick once you reached Level 90 in Brewing."
Description[GERMAN][15] = "Dein derzeitiger Rang in Adrons Braukunstschule zu Runewick ist der eines Meisters. Gehe zu Thomas Weste bei der Küche von Runewick sobald du Level 100 in der Fertigkeit Brauen erreicht hast."
Description[ENGLISH][15] = "Your current rank at Adron's Brewery School of Runewick is Master. Return to Thomas Weste at the kitchen of Runewick once you reached Level 100 in Brewing."
Description[GERMAN][16] = "Gratulation, du bist nun ein wahrer Großmeister Adrons Braukunstschule zu Runewick."
Description[ENGLISH][16] = "Congratulations, you are now a true Grandmaster of Adron's Brewery School."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {954, 842, 0}


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(954, 842, 0), position(792, 818, 0)} -- apple tree
QuestTarget[2] = {position(954, 842, 0)}
QuestTarget[3] = {position(954, 842, 0), position(948, 823, 0)} -- well
QuestTarget[4] = {position(954, 842, 0)}
QuestTarget[5] = {position(954, 842, 0), position(959, 835, 0), position(960, 835, 0)} -- wine barrel
QuestTarget[6] = {position(954, 842, 0)} 
QuestTarget[7] = {position(954, 842, 0)} 
QuestTarget[8] = {position(954, 842, 0)} 
QuestTarget[9] = {position(954, 842, 0)} 
QuestTarget[10] = {position(954, 842, 0)} 
QuestTarget[11] = {position(954, 842, 0)} 
QuestTarget[12] = {position(954, 842, 0)} 
QuestTarget[13] = {position(954, 842, 0)} 
QuestTarget[14] = {position(954, 842, 0)} 
QuestTarget[15] = {position(954, 842, 0)} 

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
