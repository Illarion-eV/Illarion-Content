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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (685, 'god_book_685_all');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Ein Buch deines Gottes"
Title[ENGLISH] = "A book about your God"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Du kannst in einer Bücherei für 5 Goldmünzen ein Buch deines Gottes kaufen. Bitte frage in einer Bücherei bei Sir Fludnar Yednos (Runewick), Miggs (Galmair) oder Hector Valerion (Cadomyr) nach. Das Stichwort ist 'Gott'"
Description[ENGLISH][1] = "You can buy a book about your selected God for 5 gold coins. Please ask in one library Miggs (Galmair), Hector Valerion (Cadomyr) or Sir Fludnar Yednos (Runewick) for that book. The key word is 'God'."
Description[GERMAN][2] = "Gehe zu Miggs in Galmair und frage ihn, ob er dir das Buch über deinen Gott verkaufen kann. Du findest ihn in der Bücherei Das Stichwort ist 'Gott'."
Description[ENGLISH][2] = "Go to Miggs in Galmair and ask if he has the book about your God. You find him in the library. The key word is 'God'."
Description[GERMAN][3] = "Gehe zu Hector Valerion in Cadomyr und frage ihn, ob er dir das Buch über deinen Gott verkaufen kann. Du findest ihn in der Bücherei Das Stichwort ist 'Gott'."
Description[ENGLISH][3] = "Go to Hector Valerion in Cadomyr and ask if he has the book about your God. You find him in the library. The key word is 'God'."
Description[GERMAN][4] = "Gehe zu Fludnar Yednos in Runewick und frage ihn, ob er dir das Buch über deinen Gott verkaufen kann. Du findest ihn in der Bücherei Das Stichwort ist 'Gott'."
Description[ENGLISH][4] = "Go to Fludnar Yednos and ask if he has the book about your God. You find him in the library. The key word is 'God'."
Description[GERMAN][5] = "Sage Miggs in Galmair, dass du das Buch kaufst. Du benötigst 5 Gold und findest ihn in der Bücherei Das Stichwort ist 'Gott'."
Description[ENGLISH][5] = "Go to Miggs in Galmair. He will sell you the book about your God. You need 5 gold coins and find him in the library. The key word is 'God'."
Description[GERMAN][6] = "Sage Hector Valerion in Cadomyr, dass du das Buch kaufst. Du benötigst 5 Gold und findest ihn in der Bücherei Das Stichwort ist 'Gott'."
Description[ENGLISH][6] = "Go to Hector Valerion in Cadomyr. He will sell you the book about your God. You need 5 gold coins and find him in the library. The key word is 'God'."
Description[GERMAN][7] = "Sage Fludnar Yednos in Runewick, dass du das Buch kaufst. Du benötigst 5 Gold und findest ihn in der Bücherei Das Stichwort ist 'Gott'."
Description[ENGLISH][7] = "Go to Fludnar Yednos in Runewick. He will sell you the book about your God. You need 5 gold coins find him in the library. The key word is 'God'."
Description[GERMAN][18] = "Du hast bereits ein Buch deines Gottes."
Description[ENGLISH][18] = "You have already a book of your God."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {135, 620, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(374, 216, 0), position(139, 553, 0), position(959, 788, 0)} -- Miggs, Hector Valerion, Fludnar Yednos
QuestTarget[2] = {position(374, 216, 0)} -- Miggs
QuestTarget[3] = {position(139, 553, 0)} -- Hector Valerion
QuestTarget[4] = {position(959, 788, 0)} -- Fludnar Yednos
QuestTarget[5] = {position(374, 216, 0)} -- Miggs 
QuestTarget[6] = {position(139, 553, 0)} -- Hector Valerion 
QuestTarget[7] = {position(959, 788, 0)} -- Fludnar Yednos

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 8

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
