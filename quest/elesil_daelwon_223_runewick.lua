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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (223, 'quest.elesil_daelwon_223_runewick');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Untersuche Runewick"
Title[ENGLISH] = "Investigate Runewick"
-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Lies die Verfassung Runewicks, die in der Bücherei der Stadt ausliegt.\nSchau dir die Regale im Erdgeschoss links an."
Description[ENGLISH][1] = "Read the constitution of Runewick. The book can be found in the library of the town. Have a look to the bookshelves in the ground floor left of the entrance."
Description[GERMAN][2] = "Kehre zu Elesil Daelwon zurück."
Description[ENGLISH][2] = "Return to Elesil Daelwon."
Description[GERMAN][3] = "Gehe zu Elesil Daelwon am Eingang Runewicks. Sie hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][3] = "Go back to Elesil Daelwon by the entrance of Runewick, she will certainly have another task for you."
Description[GERMAN][4] = "Geh zum Hospital, zur Insel des Erzmagiers und dem Abenteuerstein am Stadthafen."
Description[ENGLISH][4] = "Go to the hospital, the isle of the Archmage, and the adventurer stone in the town harbour."
Description[GERMAN][5] = "Kehre zu Elesil Daelwon zurück."
Description[ENGLISH][5] = "Return to Elesil Daelwon."
Description[GERMAN][6] = "Gehe zu Elesil Daelwon am Eingang Runewicks. Sie hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][6] = "Go back to Elesil Daelwon by the entrance of Runewick, she will certainly have another task for you."
Description[GERMAN][7] = "Besorge zwanzig Naldorbretter und bringe sie zu Elesil Daelwon. Du kannst sie von einem Händler kaufen oder mit einer Säge an einem Sägebock aus Naldorholz herstellen."
Description[ENGLISH][7] = "Produce twenty naldor boards and bring them to Elesil Daelwon. You can buy them from a merchant, or produce them by using a saw at a sawbuck from naldor logs."
Description[GERMAN][8] = "Gehe zu Elesil Daelwon am Eingang Runewicks. Sie hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][8] = "Go back to Elesil Daelwon by the entrance of Runewick, she will certainly have another task for you."
Description[GERMAN][9] = "Gehe nach Westen zur Lunordbrücke und zum Hafen von Runewick. Von dort gehe nach Nordosten zur fröhlichen Lichtung und zum Schattentor."
Description[ENGLISH][9] = "Go west to the Lunord Bridge and the harbour of Runewick. Then turn north east to the Merryglade and the Shadow Gate."
Description[GERMAN][10] = "Kehre zu Elesil Daelwon zurück."
Description[ENGLISH][10] = "Return to Elesil Daelwon."
Description[GERMAN][11] = "Gehe zu Elesil Daelwon am Eingang Runewicks. Sie hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][11] = "Go back to Elesil Daelwon by the entrance of Runewick, she will certainly have another task for you."
Description[GERMAN][12] = "Besuche das Hemp Necktie Inn, den Königinnenpalast in Cadomyr und die Residenz des Dons in Galmair."
Description[ENGLISH][12] = "Go to the Hemp Necktie Inn, the Queen's palace in Cadomyr, and the Don's residence in Galmair."
Description[GERMAN][13] = "Kehre zu Elesil Daelwon zurück."
Description[ENGLISH][13] = "Return to Elesil Daelwon."
Description[GERMAN][14] = "Gehe zu Elesil Daelwon am Eingang Runewicks. Sie hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][14] = "Go back to Elesil Daelwon by the entrance of Runewick, she will certainly have another task for you."
Description[GERMAN][15] = "Besorge zwanzig Eisenbarren und bringe sie zu Elesil Daelwon. Du kannst sie von einem Händler kaufen oder an einem Rennofen aus Kohle und Erz schmelzen, wenn du vor ihm stehst. Du kannst Rennöfen in Galmair oder Cadomyr finden."
Description[ENGLISH][15] = "Obtain twenty iron ingots and bring them to Elesil Daelwon. You can buy them from a merchant or melt iron ore and coal by using crucible-pincers in your hand while standing in front of a bloomery. You can find a bloomery in Galmair or Cadomyr."
Description[GERMAN][16] = "Gehe zu Elesil Daelwon am Eingang Runewicks. Sie hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][16] = "Go back to Elesil Daelwon by the entrance of Runewick, she will certainly have another task for you."
Description[GERMAN][17] = "Besorge einen Zauberstab sowie eine Flasche Elfenwein und bring sie zu Elesil Daelwon. Du kannst sie von einem Händler kaufen oder als Schreiner oder Brauer selber herstellen."
Description[ENGLISH][17] = "Obtain a wand and a bottle of elven wine and bring them to Elesil Daelwon. You can buy them from a merchant or produce them as carpenter and brewer respectively."
Description[GERMAN][18] = "Du hast alle Aufgaben von Elesil Daelwon erledigt."
Description[ENGLISH][18] = "You have fulfilled all the tasks for Elesil Daelwon."


-- These all need to change.

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {894, 817, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(961, 784, 0)} -- bookshelf
QuestTarget[2] = {position(894, 817, 0)}
QuestTarget[3] = {position(894, 817, 0)}
QuestTarget[4] = {position(916, 769, 0), position(951, 788, 1), position(998, 822, 0), position(914, 858, 0)} -- hospital, Archmage isle, Harbour
QuestTarget[5] = {position(894, 817, 0)}
QuestTarget[6] = {position(894, 817, 0)}
QuestTarget[7] = {position(894, 817, 0)}, position(959, 823, 0)
QuestTarget[8] = {position(894, 817, 0)}
QuestTarget[9] = {position(843, 820, 0), position(736, 809, 0), position(845, 729, 0), position(910, 699, 0)} --Lunord Bridge, Runewick harbour, Merryglade, Shadow Gate
QuestTarget[10] = {position(894, 817, 0)}
QuestTarget[11] = {position(894, 817, 0)}
QuestTarget[12] = {position(894, 817, 0), position(696, 314, 0), position(122, 530, 0), position(347, 229, 0)} -- Hemp Necktie Inn,Cadomyr,Galmair
QuestTarget[13] = {position(894, 817, 0)}
QuestTarget[14] = {position(894, 817, 0)}
QuestTarget[15] = {position(894, 817, 0), position(123, 614, 0), position(143, 590, 0), position(369, 279, 0), position(387, 276, 0)} --Merchant,Bloomery
QuestTarget[16] = {position(894, 817, 0)}
QuestTarget[17] = {position(894, 817, 0), position(945, 829, 0), position(939, 826, 0), position(957, 823, 0), position(960, 836, 0)} --Merchant, tools
QuestTarget[18] = {position(894, 817, 0)}


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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

-- Other quest related functions
function M.readBook(user,bookID)
    local constitutionBookID = 349
    if user:getQuestProgress(223) == 1 and bookID == constitutionBookID then
        user:setQuestProgress(223,2)
        user:setQuestProgress(620,1)
        common.InformNLS(user, "Quest Untersuche Runewick - Du hast die Verfassung Runewicks gefunden. Lies sie und kehre zu Elesil Daelwon zurück.",
                                "Quest Investigation Runewick - You found the constitution of Runewick. Read it and return to Elesil Daelwon.")
        common.InformNLS(user, "[Neuer Quest: Finde Numilia Irunnleh] Du wunderst dich, dass in einigen weiteren Schränken weitere offensichtlich verschiedene Fassungen der Verfassung stehen. Vielleicht fragst du Numilia Irunnleh mal deshalb.",
                                "[New quest: Find Numilia Irunnleh] You are curious since there are further, obviously different versions of the constitution in the bookshelves around. Maybe Numilia Irunnleh has an aswer for you.")
    end
end

return M
