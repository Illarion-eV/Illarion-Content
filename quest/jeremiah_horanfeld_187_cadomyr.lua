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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (187, 'quest.jeremiah_horanfeld_187_cadomyr');

require("base.common")
require("base.factions")
module("quest.jeremiah_horanfeld_187_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Schädlingswächter"
Title[ENGLISH] = "Vermin Monitor"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Töte in der Zisterne fünf Ratten, Du musst noch fünf töten."
Description[ENGLISH][1] = "Kill five rats in the Cistern, you still have five left."
Description[GERMAN][2] = "Töte in der Zisterne fünf Ratten, Du musst noch vier töten."
Description[ENGLISH][2] = "Kill five rats in the Cistern, you still have four left."
Description[GERMAN][3] = "Töte in der Zisterne fünf Ratten, Du musst noch drei töten."
Description[ENGLISH][3] = "Kill five rats in the Cistern, you still have three left."
Description[GERMAN][4] = "Töte in der Zisterne fünf Ratten, Du musst noch zwei töten."
Description[ENGLISH][4] = "Kill five rats in the Cistern, you still have two left."
Description[GERMAN][5] = "Töte in der Zisterne fünf Ratten, Du musst noch eine töten."
Description[ENGLISH][5] = "Kill five rats in the Cistern, you still have one left."
Description[GERMAN][6] = "Kehre zu Jeremiah Horanfeld für Deine Belohnung zurück."
Description[ENGLISH][6] = "Return to Jeremiah Horanfeld for you reward."

Description[GERMAN][7] = "Gehe zurück zum Schädlingswächter Jeremiah Horanfeld, er hat vielleicht noch eine weitere Aufgabe für Dich."
Description[ENGLISH][7] = "Check back with Vermin Monitor Jeremiah Horanfeld, he may have another task for you."

Description[GERMAN][8] = "Sammle zehn Rattenfelle und bringe sie als Beweis zu Jeremiah Horanfeld."
Description[ENGLISH][8] = "Collect ten rat furs and bring them to Jeremiah Horanfeld as evidence."
Description[GERMAN][9] = "Vielleicht hat Jeremiah Horanfeld eine weitere Aufgabe für Dich."
Description[ENGLISH][9] = "Perhaps Jeremiah Horanfeld has another task to be done."

Description[GERMAN][10] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch zehn."
Description[ENGLISH][10] = "Kill ten Agressive and Muskrats, you still need ten."
Description[GERMAN][11] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch neun."
Description[ENGLISH][11] = "Kill ten Agressive and Muskrats, you still need nine."
Description[GERMAN][12] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch acht."
Description[ENGLISH][12] = "Kill ten Agressive and Muskrats, you still need eight."
Description[GERMAN][13] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch sieben."
Description[ENGLISH][13] = "Kill ten Agressive and Muskrats, you still need seven."
Description[GERMAN][14] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch sechs."
Description[ENGLISH][14] = "Kill ten Agressive and Muskrats, you still need six."
Description[GERMAN][15] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch fünf."
Description[ENGLISH][15] = "Kill ten Agressive and Muskrats, you still need five."
Description[GERMAN][16] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch vier."
Description[ENGLISH][16] = "Kill ten Agressive and Muskrats, you still need four."
Description[GERMAN][17] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch drei."
Description[ENGLISH][17] = "Kill ten Agressive and Muskrats, you still need three."
Description[GERMAN][18] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch zwei."
Description[ENGLISH][18] = "Kill ten Agressive and Muskrats, you still need two."
Description[GERMAN][19] = "Töte zehn aggressive Ratten und Bisamratten, Du benötigst noch eine."
Description[ENGLISH][19] = "Kill ten Agressive and Muskrats, you still need one."
Description[GERMAN][20] = "Kehre zu Jeremiah Horanfeld für Deine Belohnung zurück."
Description[ENGLISH][20] = "Return to Jeremiah Horanfeld for you reward."

Description[GERMAN][21] = "Gehe zurück zum Schädlingswächter Jeremiah Horanfeld, er hat vielleicht noch eine weitere Aufgabe für Dich."
Description[ENGLISH][21] = "Check back with Vermin Monitor Jeremiah Horanfeld, he may have another task for you."

Description[GERMAN][22] = "Sammle 25 Haufen Pottasche von den Ratten der Zisterne."
Description[ENGLISH][22] = "Collect 25 piles of potash from the Cistern rats."
Description[GERMAN][23] = "Vielleicht hat Jeremiah Horanfeld eine weitere Aufgabe für Dich."
Description[ENGLISH][23] = "Perhaps Jeremiah Horanfeld has another task to be done."

Description[GERMAN][24] = "Töte zehn Kanalratten, Du benötigst noch zehn."
Description[ENGLISH][24] = "Kill ten Sewer Rats, you still need ten."
Description[GERMAN][25] = "Töte zehn Kanalratten, Du benötigst noch neun."
Description[ENGLISH][25] = "Kill ten Sewer Rats, you still need nine."
Description[GERMAN][26] = "Töte zehn Kanalratten, Du benötigst noch acht."
Description[ENGLISH][26] = "Kill ten Sewer Rats, you still need eight."
Description[GERMAN][27] = "Töte zehn Kanalratten, Du benötigst noch sieben."
Description[ENGLISH][27] = "Kill ten Sewer Rats, you still need seven."
Description[GERMAN][28] = "Töte zehn Kanalratten, Du benötigst noch sechs."
Description[ENGLISH][28] = "Kill ten Sewer Rats, you still need six."
Description[GERMAN][29] = "Töte zehn Kanalratten, Du benötigst noch fünf."
Description[ENGLISH][29] = "Kill ten Sewer Rats, you still need five."
Description[GERMAN][30] = "Töte zehn Kanalratten, Du benötigst noch vier."
Description[ENGLISH][30] = "Kill ten Sewer Rats, you still need four."
Description[GERMAN][31] = "Töte zehn Kanalratten, Du benötigst noch drei."
Description[ENGLISH][31] = "Kill ten Sewer Rats, you still need three."
Description[GERMAN][32] = "Töte zehn Kanalratten, Du benötigst noch zwei."
Description[ENGLISH][32] = "Kill ten Sewer Rats, you still need two."
Description[GERMAN][33] = "Töte zehn Kanalratten, Du benötigst noch eine."
Description[ENGLISH][33] = "Kill ten Sewer Rats, you still need one."
Description[GERMAN][34] = "Kehre zu Jeremiah Horanfeld für Deine Belohnung zurück."
Description[ENGLISH][34] = "Return to Jeremiah Horanfeld for you reward."

Description[GERMAN][35] = "Gehe zurück zum Schädlingswächter Jeremiah Horanfeld, er hat vielleicht noch eine weitere Aufgabe für Dich."
Description[ENGLISH][35] = "Check back with Vermin Monitor Jeremiah Horanfeld, he may have another task for you."

Description[GERMAN][36] = "Sammle zehn Stücke Rohleder von den Pest Ratten in der Zisternenhöhle und bringe diese zu Jeremiah Horanfeld."
Description[ENGLISH][36] = "Collect pieces of raw leather from the plague rats in the Cistern Cave and return them to Jeremiah Horanfeld."
Description[GERMAN][37] = "Du hast alle Aufgaben von Jeremiah Horanfeld erfüllt."
Description[ENGLISH][37] = "You have fulfilled all of Jeremiah Horanfeld's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {104, 600, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[2] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[3] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[4] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[5] = {position(104, 600, 0), position(125,565,-6)} 
QuestTarget[6] = {position(104, 600, 0), position(125,565,-6)}

QuestTarget[7] = {position(104, 600, 0)}

QuestTarget[8] = {position(104, 600, 0)}
QuestTarget[9] = {position(104, 600, 0)}

QuestTarget[10] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[11] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[12] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[13] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[14] = {position(104, 600, 0), position(125,565,-6)} 
QuestTarget[15] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[16] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[17] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[18] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[19] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[20] = {position(104, 600, 0), position(125,565,-6)} 

QuestTarget[21] = {position(104, 600, 0)}

QuestTarget[22] = {position(104, 600, 0)}
QuestTarget[23] = {position(104, 600, 0)}

QuestTarget[24] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[25] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[26] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[27] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[28] = {position(104, 600, 0), position(125,565,-6)} 
QuestTarget[29] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[30] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[31] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[32] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[33] = {position(104, 600, 0), position(125,565,-6)}
QuestTarget[34] = {position(104, 600, 0), position(125,565,-6)} 

QuestTarget[35] = {position(104, 600, 0)}

QuestTarget[36] = {position(104, 600, 0)}
QuestTarget[37] = {position(104, 600, 0)}

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
    if base.factions.isCadomyrCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
