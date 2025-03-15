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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (521, 'quest.scavangerhunt_521_wilderness');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Das Zauberauge der Pein"
Title[ENGLISH] = "The Magical Torturous Eye"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis sollte nahe der Spinne Gorgophone zu finden sein."
Description[ENGLISH][1] = "Find the Magical Torturous Eye. The next skull with a clue should be found near the spider Gorgophone."
Description[GERMAN][2] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis ist nahe eines roten Brutb�ndels im Nordosten der H�hle."
Description[ENGLISH][2] = "Find the Magical Torturous Eye. The next skull with a clue should be near a red egg sac all alone in the North East of the cave."
Description[GERMAN][3] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis ist im S�dwesten der H�hle bei einem gro�en T�mpel."
Description[ENGLISH][3] = "Find the Magical Torturous Eye. The next skull with a clue should be in the Southwest of the cave at a large lake."
Description[GERMAN][4] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis ist im Osten naher einer gro�en Wasser- oder Schlammpf�tze mit vielen Totensch�deln."
Description[ENGLISH][4] = "Find the Magical Torturous Eye. The next skull with a clue should be in the east, close to a large puddle of water or mud with many skulls."
Description[GERMAN][5] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis sollte irgendwo am H�hleneingang sein."
Description[ENGLISH][5] = "Find the Magical Torturous Eye. The next skull with a clue should be close to the cave entrance."
Description[GERMAN][6] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis ist im Norden der H�hle. Wohl ein Totenkopf der im Wasser liegt."
Description[ENGLISH][6] = "Find the Magical Torturous Eye. The next skull with a clue should be in the North of the cave. Probably a Skull sitting in water."
Description[GERMAN][7] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis ist im  Nordwesten nahe eines Warnschildes versteckt."
Description[ENGLISH][7] = "Find the Magical Torturous Eye. The next skull with a clue should be in the Northwest, near an evil sign."
Description[GERMAN][8] = "Finde das Zauberauge der Pein. Der n�chste Sch�del mit einem Hinweis ist nicht weit von hier. Wohl auf schlammigen Untergrund."
Description[ENGLISH][8] = "Find the Magical Torturous Eye. The next skull with a clue is not far from here, probably on muddy ground."
Description[GERMAN][9] = "Finde das Zauberauge der Pein. T�te die W�chterspinne und hole das Zauberauge aus dem Versteck."
Description[ENGLISH][9] = "Find the Magical Torturous Eye. Kill the guard spider and retrieve the Torturous Eye of the hiding place."
Description[GERMAN][10] = "Du hast das Zauberauge der Pein gefunden! Zeige es ihrem Besitzer."
Description[ENGLISH][10] = "You found the Magical Torturous Eye! Show it to its owner."
Description[GERMAN][11] = "Du besitzt das Zauberauge der Pein."
Description[ENGLISH][11] = "You own the Magical Torturous Eye."

local npcPos = position(905, 515, -6);

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = npcPos;

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[8] = position(839, 455, -6);
QuestTarget[9] = position(845, 464, -6);
QuestTarget[10] = {npcPos};

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 11

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
