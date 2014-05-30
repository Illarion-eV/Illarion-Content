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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (187, 'quest.fokous_onyxbrow_189_galmair');

require("base.common")
require("base.factions")
module("quest.fokous_onyxbrow_189_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Sie das Bier"
Title[ENGLISH] = "Save Da Beer"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Töte in der Zisterne 5 Ratten, Du mußt noch 5 töten."
Description[ENGLISH][1] = "Kill 5 rats in the Cistern, you still have 5 left."
Description[GERMAN][2] = "Töte in der Zisterne 5 Ratten, Du mußt noch 4 töten."
Description[ENGLISH][2] = "Kill 5 rats in the Cistern, you still have 4 left."
Description[GERMAN][3] = "Töte in der Zisterne 5 Ratten, Du mußt noch 3 töten."
Description[ENGLISH][3] = "Kill 5 rats in the Cistern, you still have 3 left."
Description[GERMAN][4] = "Töte in der Zisterne 5 Ratten, Du mußt noch 2 töten."
Description[ENGLISH][4] = "Kill 5 rats in the Cistern, you still have 2 left."
Description[GERMAN][5] = "Töte in der Zisterne 5 Ratten, Du mußt noch 1 töten."
Description[ENGLISH][5] = "Kill 5 rats in the Cistern, you still have 1 left."
Description[GERMAN][6] = "Kehre zu Fokous Onyxbrow für Deine Belohnung zurück."
Description[ENGLISH][6] = "Return to Fokous Onyxbrow for you reward."

Description[GERMAN][7] = "Kehre zurück zum Bierlieferant Quartiermeister Fokous Onyxbrow, er hat vielleicht noch eine weitere Aufgabe für Dich."
Description[ENGLISH][7] = "Check back with Beer Supply Quartermaster Fokous Onyxbrow, he may have another task for you."

Description[GERMAN][8] = "Sammle 10 Rattenfelle und bringe sie als Beweis zu Fokous Onyxbrow."
Description[ENGLISH][8] = "Collect ten rat furs and bring them to Fokous Onyxbrow as evidence."
Description[GERMAN][9] = "Vielleicht hat Fokous Onyxbrow eine weitere Aufgabe für Dich."
Description[ENGLISH][9] = "Perhaps Fokous Onyxbrow has another task to be done."

Description[GERMAN][10] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 10."
Description[ENGLISH][10] = "Kill 10 Agressive and Muskrats, you still need 10."
Description[GERMAN][11] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 9."
Description[ENGLISH][11] = "Kill 10 Agressive and Muskrats, you still need 9."
Description[GERMAN][12] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 8."
Description[ENGLISH][12] = "Kill 10 Agressive and Muskrats, you still need 8."
Description[GERMAN][13] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 7."
Description[ENGLISH][13] = "Kill 10 Agressive and Muskrats, you still need 7."
Description[GERMAN][14] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 6."
Description[ENGLISH][14] = "Kill 10 Agressive and Muskrats, you still need 6."
Description[GERMAN][15] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 5."
Description[ENGLISH][15] = "Kill 10 Agressive and Muskrats, you still need 5."
Description[GERMAN][16] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 4."
Description[ENGLISH][16] = "Kill 10 Agressive and Muskrats, you still need 4."
Description[GERMAN][17] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 3."
Description[ENGLISH][17] = "Kill 10 Agressive and Muskrats, you still need 3."
Description[GERMAN][18] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 2."
Description[ENGLISH][18] = "Kill 10 Agressive and Muskrats, you still need 2."
Description[GERMAN][19] = "Töte 10 aggressive und Bisamratten, Du benötigst noch 1."
Description[ENGLISH][19] = "Kill 10 Agressive and Muskrats, you still need 1."
Description[GERMAN][20] = "Kehre zu Fokous Onyxbrow für Deine Belohnung zurück."
Description[ENGLISH][20] = "Return to Fokous Onyxbrow for you reward."

Description[GERMAN][21] = "Kehre zurück zum Bierlieferant Quartiermeister Fokous Onyxbrow, er hat vielleicht noch eine weitere Aufgabe für Dich."
Description[ENGLISH][21] = "Check back with Beer Supply Quartermaster Fokous Onyxbrow, he may have another task for you."

Description[GERMAN][22] = "Sammle 25 Getreide von den Zisternenratten."
Description[ENGLISH][22] = "Collect 25 grain from the Cistern rats."
Description[GERMAN][23] = "Vielleicht hat Fokous Onyxbrow eine weitere Aufgabe für Dich"
Description[ENGLISH][23] = "Perhaps Fokous Onyxbrow has another task to be done."

Description[GERMAN][24] = "Töte 10 Kanalratten, Du benötigst noch 10."
Description[ENGLISH][24] = "Kill 10 Sewer Rats, you still need 10."
Description[GERMAN][25] = "Töte 10 Kanalratten, Du benötigst noch 9."
Description[ENGLISH][25] = "Kill 10 Sewer Rats, you still need 9."
Description[GERMAN][26] = "Töte 10 Kanalratten, Du benötigst noch 8."
Description[ENGLISH][26] = "Kill 10 Sewer Rats, you still need 8."
Description[GERMAN][27] = "Töte 10 Kanalratten, Du benötigst noch 7."
Description[ENGLISH][27] = "Kill 10 Sewer Rats, you still need 7."
Description[GERMAN][28] = "Töte 10 Kanalratten, Du benötigst noch 6."
Description[ENGLISH][28] = "Kill 10 Sewer Rats, you still need 6."
Description[GERMAN][29] = "Töte 10 Kanalratten, Du benötigst noch 5."
Description[ENGLISH][29] = "Kill 10 Sewer Rats, you still need 5."
Description[GERMAN][30] = "Töte 10 Kanalratten, Du benötigst noch 4."
Description[ENGLISH][30] = "Kill 10 Sewer Rats, you still need 4."
Description[GERMAN][31] = "Töte 10 Kanalratten, Du benötigst noch 3."
Description[ENGLISH][31] = "Kill 10 Sewer Rats, you still need 3."
Description[GERMAN][32] = "Töte 10 Kanalratten, Du benötigst noch 2."
Description[ENGLISH][32] = "Kill 10 Sewer Rats, you still need 2."
Description[GERMAN][33] = "Töte 10 Kanalratten, Du benötigst noch 1."
Description[ENGLISH][33] = "Kill 10 Sewer Rats, you still need 1."
Description[GERMAN][34] = "Kehre zu Fokous Onyxbrow für Deine Belohnung zurück."
Description[ENGLISH][34] = "Return to Fokous Onyxbrow for you reward."

Description[GERMAN][35] = "Kehre zurück zum Bierlieferant Quartiermeister Fokous Onyxbrow, er hat vielleicht noch eine weitere Aufgabe für Dich."
Description[ENGLISH][35] = "Check back with Beer Supply Quartermaster Fokous Onyxbrow, he may have another task for you."

Description[GERMAN][36] = "Sammle 10 Rohleder von den Pest Ratten und bringe diese zu Fokous Onyxbrow."
Description[ENGLISH][36] = "Collect 10 raw leather from the plague rats in the Cistern Storage and return them to Fokous Onyxbrow."
Description[GERMAN][37] = "Du hast alle Aufgaben von Fokous Onyxbrow erfüllt."
Description[ENGLISH][37] = "You have fulfilled all of Fokous Onyxbrow's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {348, 273, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(348, 273, 0), position(370,470,-6)}
QuestTarget[2] = {position(348, 273, 0), position(370,470,-6)}
QuestTarget[3] = {position(348, 273, 0), position(370,470,-6)}
QuestTarget[4] = {position(348, 273, 0), position(370,470,-6)}
QuestTarget[5] = {position(348, 273, 0), position(370,470,-6)} 
QuestTarget[6] = {position(348, 273, 0), position(370,470,-6)}

QuestTarget[7] = {position(348, 273, 0)}

QuestTarget[8] = {position(348, 273, 0)}
QuestTarget[9] = {position(348, 273, 0)}

QuestTarget[10] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[11] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[12] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[13] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[14] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[15] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[16] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[17] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[18] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[19] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[20] = {position(348, 273, 0), position(372, 464, -6)}

QuestTarget[21] = {position(348, 273, 0)}

QuestTarget[22] = {position(348, 273, 0)}
QuestTarget[23] = {position(348, 273, 0)}

QuestTarget[24] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[25] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[26] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[27] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[28] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[29] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[30] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[31] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[32] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[33] = {position(348, 273, 0), position(372, 464, -6)}
QuestTarget[34] = {position(348, 273, 0), position(372, 464, -6)}

QuestTarget[35] = {position(348, 273, 0)}

QuestTarget[36] = {position(348, 273, 0)}
QuestTarget[37] = {position(348, 273, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 37


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
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
    if base.factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
