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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (674, 'quest.alberto_dicker_674_runewick');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Die Bilder Alberto Dickers"
Title[ENGLISH] = "The Pictures Alberto Dickers"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
-- 1: say what's wrong with the picture
-- 2: talk to Raban
-- 3: talk to Numilia
-- 4: talk to Halfhung Brian
-- 5: talk to Numilia
-- 100: find 5 pictures
-- 105: talk to Numilia
-- 201: talk to Miggs (Galmair only)
-- 202: talk to Anthar (Cadomyr only)
-- 203: End

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
-- Quests
Description[GERMAN][1] = "Schau dir das Bild des Hahnes genau an. Sage Numila Irunnleh was nicht stimmt. Du kannst in der Bücherei über den Maler nachlesen, dort findest du die Antwort."
Description[ENGLISH][1] = "See over the picture of the rooster. Tell Numila Irunnleh what is maybe not right. You find in the library a book about the painter. It contains hints for your answer."
Description[GERMAN][2] = "Gehe zu Rabans Hain im Nordwald und sprich mit Raban."
Description[ENGLISH][2] = "Go to Rabans Hain in the northern forest and talk to Raban."
Description[GERMAN][3] = "Kehre zu Numila Irunnleh zurück und sprich mit ihr."
Description[ENGLISH][3] = "Go back to Numila Irunnleh zurück and talk to her."
Description[GERMAN][4] = "Befrage den Besitzer der Taverne zur Hanfschlinge nach dem Verbleib des Bildes 'Oldras Altar'."
Description[ENGLISH][4] = "Interview the owner of the Hempty Neckty Inn whereabout the pichture 'Oldras Shrine'."
Description[GERMAN][5] = "Kehre zu Numila Irunnleh zurück und sprich mit ihr."
Description[ENGLISH][5] = "Go back to Numila Irunnleh zurück and talk to her."
Description[GERMAN][100] = "Finde 5 weitere Bilder des Malers. Zwei in Cadomyr, eins in Galmair und zwei in Runewick."
Description[ENGLISH][100] = "Find 5 more pictures of the painter. Two in Cadomyr, one in Galmair and two in Runewick."
Description[GERMAN][105] = "Du hast alle Bilder gefunden. Kehre zu Numila Irunnleh zurück."
Description[ENGLISH][105] = "You found all pictures. Go back to Numila Irunnleh."
Description[GERMAN][201] = "Gehe zu Miggs und berichte ihm von dem kopierten Bild."
Description[ENGLISH][201] = "Go to Miggs and report about the copied picture."
Description[GERMAN][202] = "Gehe zu Anthar Vilicon und berichte ihm von dem kopierten Bild."
Description[ENGLISH][202] = "Go to Anthar Vilicon and report about the copied picture."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {970, 787, 1} -- Numilia

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {970, 787, 1} -- Numilia
QuestTarget[2] = {819, 104, 0} -- Raban
QuestTarget[3] = {970, 787, 1} -- Numilia
QuestTarget[4] = {696, 317, 0} -- Halfhung Brian
QuestTarget[5] = {970, 787, 1} -- Numilia
QuestTarget[105] = {970, 787, 1} -- Numilia
QuestTarget[201] = {374, 216, 0} -- Miggs
QuestTarget[202] = {117, 528, 0} -- Anthar


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 203


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
