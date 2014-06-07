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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (188, 'quest.cilivren_itiireae_188_runewick');

require("base.common")
require("base.factions")
module("quest.cilivren_itiireae_188_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Rette die Äcker"
Title[ENGLISH] = "Save The Field"

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
Description[GERMAN][6] = "Kehre zu Cilivren Itiireae für Deine Belohnung zurück."
Description[ENGLISH][6] = "Return to Cilivren Itiireae for your reward."

Description[GERMAN][7] = "Kehre zurück zur Bereichswächterin Cilivren Itiireae, sie hat möglicherweise noch eine Aufgabe für Dich."
Description[ENGLISH][7] = "Check back with Field Guardian Cilivren Itiireae, she may have another task for you."

Description[GERMAN][8] = "Sammle zehn Rattenfelle und bringe sie zu Cilivren Itiireae."
Description[ENGLISH][8] = "Collect ten rat furs and bring them to Cilivren Itiireae."
Description[GERMAN][9] = "Vielleicht hat Cilivren Itiireae eine weitere Aufgabe für Dich."
Description[ENGLISH][9] = "Perhaps Cilivren Itiireae has another task to be done."

Description[GERMAN][10] = "Töte in der Zisterne zehn Ratten, Du musst noch zehn töten."
Description[ENGLISH][10] = "Kill ten rats in the Cistern, you still have ten left."
Description[GERMAN][11] = "Töte in der Zisterne zehn Ratten, Du musst noch neun töten."
Description[ENGLISH][11] = "Kill ten rats in the Cistern, you still have nine left."
Description[GERMAN][12] = "Töte in der Zisterne zehn Ratten, Du musst noch acht töten."
Description[ENGLISH][12] = "Kill ten rats in the Cistern, you still have eight left."
Description[GERMAN][13] = "Töte in der Zisterne zehn Ratten, Du musst noch sieben töten."
Description[ENGLISH][13] = "Kill ten rats in the Cistern, you still have seven left."
Description[GERMAN][14] = "Töte in der Zisterne zehn Ratten, Du musst noch sechs töten."
Description[ENGLISH][14] = "Kill ten rats in the Cistern, you still have six left."
Description[GERMAN][15] = "Töte in der Zisterne zehn Ratten, Du musst noch fünf töten."
Description[ENGLISH][15] = "Kill ten rats in the Cistern, you still have five left."
Description[GERMAN][16] = "Töte in der Zisterne zehn Ratten, Du musst noch vier töten."
Description[ENGLISH][16] = "Kill ten rats in the Cistern, you still have four left."
Description[GERMAN][17] = "Töte in der Zisterne zehn Ratten, Du musst noch drei töten."
Description[ENGLISH][17] = "Kill ten rats in the Cistern, you still have three left."
Description[GERMAN][18] = "Töte in der Zisterne zehn Ratten, Du musst noch zwei töten."
Description[ENGLISH][18] = "Kill ten rats in the Cistern, you still have two left."
Description[GERMAN][19] = "Töte in der Zisterne zehn Ratten, Du musst noch eine töten."
Description[ENGLISH][19] = "Kill ten rats in the Cistern, you still have one left."
Description[GERMAN][20] = "Kehre zu Cilivren Itiireae für Deine Belohnung zurück."
Description[ENGLISH][20] = "Return to Cilivren Itiireae for your reward."

Description[GERMAN][21] = "Kehre zurück zur Bereichswächterin Cilivren Itiireae, sie hat möglicherweise noch eine Aufgabe für Dich."
Description[ENGLISH][21] = "Check back with Field Guardian Cilivren Itiireae, she may have another task for you."

Description[GERMAN][22] = "Sammle fünfzehn Rattenfelle und bringe sie zu Cilivren Itiireae."
Description[ENGLISH][22] = "Collect fifteen rat furs and bring them to Cilivren Itiireae."
Description[GERMAN][23] = "Vielleicht hat Cilivren Itiireae eine weitere Aufgabe für Dich."
Description[ENGLISH][23] = "Perhaps Cilivren Itiireae has another task to be done."

Description[GERMAN][24] = "Töte in der Zisterne zehn Ratten, Du musst noch zehn töten."
Description[ENGLISH][24] = "Kill ten rats in the Cistern, you still have ten left."
Description[GERMAN][25] = "Töte in der Zisterne zehn Ratten, Du musst noch neun töten."
Description[ENGLISH][25] = "Kill ten rats in the Cistern, you still have nine left."
Description[GERMAN][26] = "Töte in der Zisterne zehn Ratten, Du musst noch acht töten."
Description[ENGLISH][26] = "Kill ten rats in the Cistern, you still have eight left."
Description[GERMAN][27] = "Töte in der Zisterne zehn Ratten, Du musst noch sieben töten."
Description[ENGLISH][27] = "Kill ten rats in the Cistern, you still have seven left."
Description[GERMAN][28] = "Töte in der Zisterne zehn Ratten, Du musst noch sechs töten."
Description[ENGLISH][28] = "Kill ten rats in the Cistern, you still have six left."
Description[GERMAN][29] = "Töte in der Zisterne zehn Ratten, Du musst noch fünf töten."
Description[ENGLISH][29] = "Kill ten rats in the Cistern, you still have five left."
Description[GERMAN][30] = "Töte in der Zisterne zehn Ratten, Du musst noch vier töten."
Description[ENGLISH][30] = "Kill ten rats in the Cistern, you still have four left."
Description[GERMAN][31] = "Töte in der Zisterne zehn Ratten, Du musst noch drei töten."
Description[ENGLISH][31] = "Kill ten rats in the Cistern, you still have three left."
Description[GERMAN][32] = "Töte in der Zisterne zehn Ratten, Du musst noch zwei  töten."
Description[ENGLISH][32] = "Kill ten rats in the Cistern, you still have two left."
Description[GERMAN][33] = "Töte in der Zisterne zehn Ratten, Du musst noch eine töten."
Description[ENGLISH][33] = "Kill ten rats in the Cistern, you still have one left."
Description[GERMAN][34] = "Kehre zu Cilivren Itiireae für Deine Belohnung zurück."
Description[ENGLISH][34] = "Return to Cilivren Itiireae for your reward."

Description[GERMAN][35] = "Kehre zurück zur Bereichswächterin Cilivren Itiireae, sie hat möglicherweise noch eine Aufgabe für Dich."
Description[ENGLISH][35] = "Check back with Field Guardian Cilivren Itiireae, she may have another task for you."

Description[GERMAN][36] = "Töte in der Zisterne den Rattenmenschen"
Description[ENGLISH][36] = "Kill the Ratman boss in the Cistern."
Description[GERMAN][37] = "Kehre zu Cilivren Itiireae für Deine Belohnung zurück."
Description[ENGLISH][37] = "Return to Cilivren Itiireae for your reward."

Description[GERMAN][38] = "Du hast alle Aufgaben von Cilivren Itiireae erfüllt."
Description[ENGLISH][38] = "You have fulfilled all of Cilivren Itiireae's tasks."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {843, 844, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there

QuestTarget = {}
QuestTarget[1] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[2] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[3] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[4] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[5] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[6] = {position(843, 844, 0), position(832,832,-3)}
QuestTarget[7] = {position(843, 844, 0)}
QuestTarget[8] = {position(843, 844, 0)}
QuestTarget[9] = {position(843, 844, 0)}
QuestTarget[10] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[11] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[12] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[13] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[14] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[15] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[16] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[17] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[18] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[19] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[20] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[21] = {position(843, 844, 0)}
QuestTarget[22] = {position(843, 844, 0)}
QuestTarget[23] = {position(843, 844, 0)}
QuestTarget[24] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[25] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[26] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[27] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[28] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[29] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[30] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[31] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[32] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[33] = {position(843, 844, 0), position(840,840,-6)}
QuestTarget[34] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[35] = {position(843, 844, 0)}
QuestTarget[36] = {position(843, 844, 0), position(840,840,-6)} 
QuestTarget[37] = {position(843, 844, 0)}
QuestTarget[38] = {position(843, 844, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 38


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
    if base.factions.isRunewickCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end
