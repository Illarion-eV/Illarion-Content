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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (501, 'quest.ssalva_501_wilderness');

local common = require("base.common")
local factions = require("base.factions")
local monsterQuests = require("monster.base.quests")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Zzarn'K'Ska von Zelphia"
Title[ENGLISH] = "Zzarn'K'Ska of Zelphia"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde den Eingang zum Verlies des Sees des Lebens und berichte Ssalva davon."
Description[ENGLISH][1] = "Find the entrance to the Lake of Life Dungeon and tell Ssalva of it."
Description[GERMAN][2] = "Kehre zu Ssalva zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][2] = "Return to Ssalva, you have finished her task."

Description[GERMAN][3] = "Rede mit Ssalva, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][3] = "Check with Ssalva, she may have another task for you."

Description[GERMAN][4] = "Erforsche das Verlies des Sees des Lebens und finde die zweite große Insel bevor du zu Ssalva zurückkehrst um zu berichten."
Description[ENGLISH][4] = "Explore the Lake of Life Dungeon and find the second major island before reporting back to Ssalva."
Description[GERMAN][5] = "Kehre zu Ssalva zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][5] = "Return to Ssalva, you have finished her task."

Description[GERMAN][6] = "Rede mit Ssalva, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][6] = "Check with Ssalva, she may have another task for you."

Description[GERMAN][7] = "Zähle die Brücken des im Untergrund liegenden Sees des Lebens und berichte die Zahl an Salva"
Description[ENGLISH][7] = "Count the bridges in the Underground Lake of Life and give the number to Ssalva."

Description[GERMAN][8] = "Rede mit Ssalva, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][8] = "Check with Ssalva, she may have another task for you."

Description[GERMAN][9] = "Finde die Opferstelle im See des Lebens und opfere dort eine Wasserblüte für Tanora. Danach kehre zu Ssalva zurück um ihr zu berichten und um weitere Anweisungen zu erhalten."
Description[ENGLISH][9] = "Find the offering plate in the Lake of Life and leave an offering of one waterblossom for Tanora.  After doing so, report back to Ssalva for further instructions."
Description[GERMAN][10] = "Kehre zu Ssalva zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][10] = "Return to Ssalva, you have finished her task."

Description[GERMAN][11] = "Rede mit Ssalva, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][11] = "Check with Ssalva, she may have another task for you."

Description[GERMAN][12] = "Sammle 5 Fische jeder Art (Lachs, Forelle, Stachelmakrele und Rotbarsch), 20 Eier, eine Eiercremetorte & 2 Fischsuppen. Finde Zenia und tausche die Gegenstände gegen Informationen und berichte diese an Ssalva."
Description[ENGLISH][12] = "Gather five of each fish (trout, salmon, horse mackerel, and rose fish), 20 eggs, one custard pie, two fish soups. Find Zenia and exchange the items for some information and report back to Ssalva."
Description[GERMAN][13] = "Kehre zu Ssalva zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][13] = "Return to Ssalva, you have finished her task."

Description[GERMAN][14] = "Rede mit Ssalva, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][14] = "Check with Ssalva, she may have another task for you."

Description[GERMAN][15] = "Töte der Renegat für Ssalva. Du musst noch 15 erledigen."
Description[ENGLISH][15] = "Kill renegades for Ssalva. You still need 15."
Description[GERMAN][16] = "Töte der Renegat für Ssalva. Du musst noch 14 erledigen."
Description[ENGLISH][16] = "Kill renegades for Ssalva. You still need 14."
Description[GERMAN][17] = "Töte der Renegat für Ssalva. Du musst noch 13 erledigen."
Description[ENGLISH][17] = "Kill renegades for Ssalva. You still need 13."
Description[GERMAN][18] = "Töte der Renegat für Ssalva. Du musst noch 12 erledigen."
Description[ENGLISH][18] = "Kill renegades for Ssalva. You still need 12."
Description[GERMAN][19] = "Töte der Renegat für Ssalva. Du musst noch 11 erledigen."
Description[ENGLISH][19] = "Kill renegades for Ssalva. You still need 11."
Description[GERMAN][20] = "Töte der Renegat für Ssalva. Du musst noch 10 erledigen."
Description[ENGLISH][20] = "Kill renegades for Ssalva. You still need 10."
Description[GERMAN][21] = "Töte der Renegat für Ssalva. Du musst noch 9 erledigen."
Description[ENGLISH][21] = "Kill renegades for Ssalva. You still need 9."
Description[GERMAN][22] = "Töte der Renegat für Ssalva. Du musst noch 8 erledigen."
Description[ENGLISH][22] = "Kill renegades for Ssalva. You still need 8."
Description[GERMAN][23] = "Töte der Renegat für Ssalva. Du musst noch 7 erledigen."
Description[ENGLISH][23] = "Kill renegades for Ssalva. You still need 7."
Description[GERMAN][24] = "Töte der Renegat für Ssalva. Du musst noch 6 erledigen."
Description[ENGLISH][24] = "Kill renegades for Ssalva. You still need 6."
Description[GERMAN][25] = "Töte der Renegat für Ssalva. Du musst noch 5 erledigen."
Description[ENGLISH][25] = "Kill renegades for Ssalva. You still need 5."
Description[GERMAN][26] = "Töte der Renegat für Ssalva. Du musst noch 4 erledigen."
Description[ENGLISH][26] = "Kill renegades for Ssalva. You still need 4."
Description[GERMAN][27] = "Töte der Renegat für Ssalva. Du musst noch 3 erledigen."
Description[ENGLISH][27] = "Kill renegades for Ssalva. You still need 3."
Description[GERMAN][28] = "Töte der Renegat für Ssalva. Du musst noch 2 erledigen."
Description[ENGLISH][28] = "Kill renegades for Ssalva. You still need 2."
Description[GERMAN][29] = "Töte der Renegat für Ssalva. Du musst noch 1 erledigen."
Description[ENGLISH][29] = "Kill renegades for Ssalva. You still need 1."
Description[GERMAN][30] = "Kehre zu Ssalva zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][30] = "Return to Ssalva, you have finished her task."

Description[GERMAN][31] = "Rede mit Ssalva, sie hat vielleicht eine weitere Aufgabe für dich."
Description[ENGLISH][31] = "Check with Ssalva, she may have another task for you."

Description[GERMAN][32] = "Töte den Anführer der Echsen- Tempelgarde und brich die Moral der Extremistengruppe."
Description[ENGLISH][32] = "Kill the lizard temple warrior leader and break the morale of the extremist group."

Description[GERMAN][33] = "Kehre zu Ssalva zurück, du hast ihre Aufgabe erledigt."
Description[ENGLISH][33] = "Return to Ssalva, you have finished her task."

Description[GERMAN][34] = "Du hast alle Aufgaben der Ssalva erledigt."
Description[ENGLISH][34] = "You have completed all tasks of Ssalva."

local npcPos = position(567, 230, -0);

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = npcPos;

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
for i = 1, 34 do
  QuestTarget[i] = {npcPos};
end

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 34

-- Register the monster kill parts of the quest.
monsterQuests.addQuest{
    questId = 501,
    locations = {
        {position = position(748, 245, -9), radius = 150},
        {position = position(557, 263, 0), radius = 25}
    },
    queststatus = {from = 15, to = 30},
    questTitle = {german = "", english = "Zzarn'K'Ska of Zelphia"},
    monsterName = {german = "", english = "Lizards"},
    npcName = "Ssalva",
    monsterIds = {51,52,53,54,55} -- all lizards
}
monsterQuests.addQuest{
    questId = 501,
    location = {position =  position(557, 263, 0), radius = 25},
    queststatus = {from = 32, to = 33},
    questTitle = {german = "", english = "Zzarn'K'Ska of Zelphia"},
    monsterName = {german = "", english = "Lizard Templar Warrior"},
    npcName = "Ssalva",
    monsterIds = {52} -- Lizard Templar Warrior
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

function M.QuestAvailability(user, status)
    if status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
