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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (111, 'quest.beror_oakaxe_111_cadomyr');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Eine Frage der Ehre"
Title[ENGLISH] = "A Question of Honour"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Lies die Sitten, die auf dem Monument von Sir Reginald Edwards vor dem Palast von Cadomyr stehen. Betrachte hierf�r die Statue. Kehre dann zu Beror zur�ck."
Description[ENGLISH][1] = "Read the customs on Sir Reginald's statue in front of the palace of Cadomyr. Behold the statue therefor. Then return to Beror."
Description[GERMAN][2] = "Kehre zu Beror zur�ck."
Description[ENGLISH][2] = "Return to Beror."
Description[GERMAN][3] = "Geh zu Beror Oakaxe, der sich in der Stube des Wachtmeisters von Cadomyr aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][3] = "Go back to Beror Oakaxe in the Sergeant Store of Cadomyr, he will certainly have another task for you."
Description[GERMAN][4] = "Geh zum Notarb�ro, dem Palast und dem Tor. Kehre dann zu Beror zur�ck."
Description[ENGLISH][4] = "Go to the notary's office, the palace and the gate. Then return to Beror."
Description[GERMAN][5] = "Kehre zu Beror zur�ck."
Description[ENGLISH][5] = "Return to Beror."
Description[GERMAN][6] = "Geh zu Beror Oakaxe, der sich in der Stube des Wachtmeisters von Cadomyr aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][6] = "Go back to Beror Oakaxe in the Sergeant Store of Cadomyr, he will certainly have another task for you"
Description[GERMAN][7] = "Besorge zwanzig Ziegelsteine und bringe sie Beror. Du kannst sie bei einem H�ndler kaufen oder mit einer Zange am Brennofen herstellen."
Description[ENGLISH][7] = "Produce twenty bricks and bring them to Beror. You can buy them from a merchant, or produce them by using a kiln when you have a pair of tongs in your hand."
Description[GERMAN][8] = "Geh zu Beror Oakaxe, der sich im in der Stube des Wachtmeisters von Cadomyr aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][8] = "Go back to Beror Oakaxe in the Sergeant Store of Cadomyr, he will certainly have another task for you."
Description[GERMAN][9] = "Geh zum Grundstein der Aufrichtigkeit, dem Blutkreis, der n�rdlichen Br�cke �ber den Kantabifluss und zur Ostgrenze. Kehre dann zu Beror zur�ck."
Description[ENGLISH][9] = "Go to Cornerstone of Candour, the Circle of Blood, the northern bridge over the Kantabi River and the eastern border. Then return to Beror."
Description[GERMAN][10] = "Kehre zu Beror zur�ck."
Description[ENGLISH][10] = "Return to Beror."
Description[GERMAN][11] = "Geh zu Beror Oakaxe, der sich in der Stube des Wachtmeisters von Cadomyr aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][11] = "Go back to Beror Oakaxe in the Sergeant Store of Cadomyr, he will certainly have another task for you."
Description[GERMAN][12] = "Geh zu dem Gasthof zur Hanfschlinge, dem Versteck des Dons in Galmair und in die Kammer des Erzmagiers in Runewick. Kehre dann zu Beror zur�ck."
Description[ENGLISH][12] = "Go to the Hemp Necktie Inn, the Don's hideout in Galmair and the Archmage's chamber in Runewick. Then return to Beror."
Description[GERMAN][13] = "Kehre zu Beror zur�ck."
Description[ENGLISH][13] = "Return to Beror."
Description[GERMAN][14] = "Geh zu Beror Oakaxe, der sich in der Stube des Wachtmeisters von Cadomyr aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][14] = "Go back to Beror Oakaxe in the Sergeant Store of Cadomyr, he will certainly have another task for you."
Description[GERMAN][15] = "Besorge zwanzig Naldorholzbretter und bringe sie Beror. Du kannst sie bei einem H�ndler kaufen oder s�ge Naldorholz mit der S�ge in der Hand bei der Werkbank zu Brettern. Werkb�nke findest du in Runewick oder Galmair."
Description[ENGLISH][15] = "Produce twenty naldor wood boards and bring them to Beror. You can buy them from a merchant or saw naldor wood into boards by using a workbench as you stand in front of it, with the saw in your hand. You can find workbenches in Runewick or Galmair."
Description[GERMAN][16] = "Geh zu Beror Oakaxe, der sich in der Stube des Wachtmeisters von Cadomyr aufh�lt. Er hat bestimmt noch eine Aufgabe f�r dich."
Description[ENGLISH][16] = "Go back to Beror Oakaxe in the Sergeant Store of Cadomyr, he will certainly have another task for you."
Description[GERMAN][17] = "Besorge ein Eisvogelamulett, einen Erzmagierring und eine Vase und bringe sie Beror. Du kannst sie als Goldschmied bzw. Glasbl�ser herstellen. Dazu nimmst du den Feinschmiedhammer in die Hand und benutzt ihn, w�hrend du vor einem Amboss stehst und das Glasblasrohr, w�hrend du vor einem Glasschmelzofen stehst."
Description[ENGLISH][17] = "Produce a charm of the icebird and a vase and bring them to Beror. You can produce them as goldsmith and glass blower respectively. Therefor use the finesmithing hammer in your hand, while standing in front of an anvil or use the glass blow pipe in your hand, while standing in front of an glass melting oven."
Description[GERMAN][18] = "Du hast alle Aufgaben von Beror Oakaxe erf�llt."
Description[ENGLISH][18] = "You have fulfilled all the tasks for Beror Oakaxe."


-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {135, 620, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(135, 620, 0), position(125, 566, 0)} -- statue
QuestTarget[2] = {position(135, 620, 0)}
QuestTarget[3] = {position(135, 620, 0)}
QuestTarget[4] = {position(135, 620, 0), position(107, 556, 0), position(122, 544, 0), position(118, 623, 0)} -- notary's office, the palace and the gate
QuestTarget[5] = {position(135, 620, 0)}
QuestTarget[6] = {position(135, 620, 0)}
QuestTarget[7] = {position(135, 620, 0), position(123, 614, 0), position(143, 586, 0)} -- H�ndler, Schmelzofen
QuestTarget[8] = {position(135, 620, 0)}
QuestTarget[9] = {position(135, 620, 0), position(136, 696, 0), position(261, 678, 0), position(236, 439, 0), position(471, 795, 0)} --Cornerstone of Candour, the Circle of Blood, the northern bridge and the eastern border
QuestTarget[10] = {position(135, 620, 0)}
QuestTarget[11] = {position(135, 620, 0)}
QuestTarget[12] = {position(135, 620, 0), position(698, 314, 0), position(347, 229, 0), position(1002, 813, 0)} -- Hanfschlinge, Galmair, Runewick
QuestTarget[13] = {position(135, 620, 0)}
QuestTarget[14] = {position(135, 620, 0)}
QuestTarget[15] = {position(135, 620, 0), position(945, 829, 0), position(957, 823, 0), position(367, 277, 0), position(382, 269, 0)} --H�ndler, Werkbank
QuestTarget[16] = {position(135, 620, 0)}
QuestTarget[17] = {position(135, 620, 0), position(125, 603, 0), position(143, 586, 0), position(138, 589, 0)} --H�ndler, Schmelzofen, Amboss
QuestTarget[18] = {position(135, 620, 0)}


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 18


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
    if factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
