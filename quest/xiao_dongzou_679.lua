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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (679, 'npc.xiao_dongzou_679');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Der Spieler von Galmair"
Title[ENGLISH] = "The Gambler from Galmair"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sage Xiao ob du um 'wenig'(1 Silber), 'normal'(10 Silber) oder 'viel' (1 Gold) Geld spielen willst."
Description[ENGLISH][1] = "Tell Xiao how much you want to play with. Use 'single'(1 silver), 'few'(10 silver) or 'many'(1 Gold) coins."
Description[GERMAN][10] = "Würfelspiel um ein Silberstück.\nSage '1', '2' ... '6' für deine Auswahl oder brich das Spiel ab mit 'Stop' oder 'Ende'."
Description[ENGLISH][10] = "Dice game for one silver coin.\nUse '1', '2' ... '6' to start or break up the game by using 'stop' or 'end'."
Description[GERMAN][20] = "Würfelspiel um zehn Silberstücks.\nSage '1', '2' ... '6' für deine Auswahl oder brich das Spiel ab mit 'Stop' oder 'Ende'."
Description[ENGLISH][20] = "Dice game for ten silver coins.\nUse '1', '2' ... '6' to start or break up the game by using 'stop' or 'end'."
Description[GERMAN][30] = "Würfelspiel um ein Goldstück.\nSage '1', '2' ... '6' für deine Auswahl oder brich das Spiel ab mit 'Stop' oder 'Ende'."
Description[ENGLISH][30] = "Dice game for one gold coin.\nUse '1', '2' ... '6' to start or break up the game by using 'stop' or 'end'."
Description[GERMAN][100] = "Sage Xiao ob du um 'wenig'(1Silber), 'normal'(10 Silber) oder 'viel' (1 Gold) Geld spielen willst."
Description[ENGLISH][100] = "Tell Xiao how much you want to play with. Use 'single'(1 silver), 'few'(10 silver) or 'many'(1 Gold) coins."
Description[GERMAN][101] = "Münzspiel um ein Silberstück.\nSage 'Kopf', 'Zahl', 'Rand' oder brich das Spiel ab mit 'Stop' oder 'Ende'."
Description[ENGLISH][101] = "Coin game for one silver coin.\nUse 'heads', 'tails', 'other' or break up the game by using 'stop' or 'end'."
Description[GERMAN][102] = "Münzspiel um zehn Silberstücke.\nSage 'Kopf', 'Zahl', 'Rand' oder brich das Spiel ab mit 'Stop' oder 'Ende'."
Description[ENGLISH][102] = "Coin game for ten silver coins.\nUse 'heads', 'tails', 'other' or break up the game by using 'stop' or 'end'."
Description[GERMAN][103] = "Münzspiel um ein Goldstück.\nSage 'Kopf', 'Zahl', 'Rand' oder brich das Spiel ab mit 'Stop' oder 'Ende'."
Description[ENGLISH][103] = "Coin game for one gold coin.\nUse 'heads', 'tails', 'other' or break up the game by using 'stop' or 'end'."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {295, 263, -6}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(295, 263, -6)} -- Xiao Dongzou

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 2


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
