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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (500, 'quest.melanie_meadowlark_500_wilderness');

local common = require("base.common")
local factions = require("base.factions")
module("quest.melanie_meadowlark_500_wilderness", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Elstree Waldläuferin"
Title[ENGLISH] = "Elstree Ranger"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sammel zehn Honigwaben und bringe diese zu Melanie."
Description[ENGLISH][1] = "Collect ten honeycombs and bring them to Melanie."
Description[GERMAN][2] = "Geh zu Melanie. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][2] = "Go back to Melanie, she certainly has another task for you."

Description[GERMAN][3] = "Töte Wildschweine für Melanie. Du brauchst noch zehn."
Description[ENGLISH][3] = "Kill forest pigs for Melanie. You still need ten."
Description[GERMAN][4] = "Töte Wildschweine für Melanie. Du brauchst noch neun."
Description[ENGLISH][4] = "Kill forest pigs for Melanie. You still need nine."
Description[GERMAN][5] = "Töte Wildschweine für Melanie. Du brauchst noch acht."
Description[ENGLISH][5] = "Kill forest pigs for Melanie. You still need eight."
Description[GERMAN][6] = "Töte Wildschweine für Melanie. Du brauchst noch sieben."
Description[ENGLISH][6] = "Kill forest pigs for Melanie. You still need seven."
Description[GERMAN][7] = "Töte Wildschweine für Melanie. Du brauchst noch sechs."
Description[ENGLISH][7] = "Kill forest pigs for Melanie. You still need six."
Description[GERMAN][8] = "Töte Wildschweine für Melanie. Du brauchst noch fünf."
Description[ENGLISH][8] = "Kill forest pigs for Melanie. You still need five."
Description[GERMAN][9] = "Töte Wildschweine für Melanie. Du brauchst noch vier."
Description[ENGLISH][9] = "Kill forest pigs for Melanie. You still need vier."
Description[GERMAN][10] = "Töte Wildschweine für Melanie. Du brauchst noch drei."
Description[ENGLISH][10] = "Kill forest pigs for Melanie. You still need three."
Description[GERMAN][11] = "Töte Wildschweine für Melanie. Du brauchst noch zwei."
Description[ENGLISH][11] = "Kill forest pigs for Melanie. You still need two."
Description[GERMAN][12] = "Töte Wildschweine für Melanie. Du brauchst noch eine."
Description[ENGLISH][12] = "Kill forest pigs for Melanie. You still need one."
Description[GERMAN][13] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][13] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][14] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][14] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][15] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][15] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][16] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][16] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][17] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][17] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][18] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][18] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][19] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][19] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][20] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][20] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][21] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][21] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][22] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][22] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][23] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][23] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][24] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][24] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][25] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][25] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][26] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][26] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][27] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][27] = "Report back to Melanie that you have corrected the forest pig population."
Description[GERMAN][28] = "Berichte Melanie, dass du den Bestand von Wildschweinen korrigiert hast."
Description[ENGLISH][28] = "Report back to Melanie that you have corrected the forest pig population."

Description[GERMAN][29] = "Geh zu Melanie. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][29] = "Go back to Melanie, she certainly has another task for you."
Description[GERMAN][30] = "Melanie bat dich darum, Narguns Altar auf selsame Vorkommnisse zu überprüfen."
Description[ENGLISH][30] = "Melanie asked you to check for disturbances at the Altar of Nargun."
Description[GERMAN][31] = "Berichte Mealnie über die Vorkommnisse an Narguns Altar."
Description[ENGLISH][31] = "Report back to Melanie about the disturbances at the Altar of Nargun."

Description[GERMAN][32] = "Geh zu Melanie. Sie hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][32] = "Go back to Melanie, she certainly has another task for you."
Description[GERMAN][33] = "Sammel zwanzig Flammenkelchblüten und bringe diese zu Melanie."
Description[ENGLISH][33] = "Collect twenty flamegoblet blossoms and bring them to Melanie."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {816, 440, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(816, 440, 0)}
QuestTarget[2] = {position(816, 440, 0)}

QuestTarget[3] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[4] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[5] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[6] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[7] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[8] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[9] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[10] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[11] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[12] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[13] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[14] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[15] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[16] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[17] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[18] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[19] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[20] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[21] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[22] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[23] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[24] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[25] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[26] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[27] = {position(816, 440, 0), position(786, 474, 0)}
QuestTarget[28] = {position(816, 440, 0)}

QuestTarget[29] = {position(816, 440, 0)}
QuestTarget[30] = {position(816, 440, 0), position(773,444,0)}
QuestTarget[31] = {position(816, 440, 0)}

QuestTarget[32] = {position(816, 440, 0)}
QuestTarget[33] = {position(816, 440, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 34


function QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function QuestStart()
    return Start
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function QuestAvailability(user, status)
    if status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
