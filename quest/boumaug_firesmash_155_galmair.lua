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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (155, 'quest.boumaug_firesmash_155_galmair');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "als Wache Galmair´s"
Title[ENGLISH] = "As a Galmair Guard"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Lies die Regeln auf den Statuen des Dons die vor Galmairs Krone stehen. Danach kehre zu Boumaug zurück."
Description[ENGLISH][1] = "Read the rules on the Don's statues in front of the Crest of Galmair. Then return to Boumaug."
Description[GERMAN][2] = "Kehre zu Boumaug zurück."
Description[ENGLISH][2] = "Return to Boumaug."
Description[GERMAN][3] = "Gehe zu Boumaug Firesmash am Osttor Galmairs. Er hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][3] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][4] = "Geh zum Notarbüro, dem Crest und dem Tor. Kehre dann zu Boumaug zurück."
Description[ENGLISH][4] = "Go to the notary's office, the Crest and the gate. Then return to Boumaug."
Description[GERMAN][5] = "Kehre zu Boumaug zurück."
Description[ENGLISH][5] = "Return to Boumaug."
Description[GERMAN][6] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[ENGLISH][6] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][7] = "Produziere zwanzig Steinblöcke und bringe sie zu Boumaug. Du kannst sie von einem Händler kaufen oder mit einem Meißel in der Hand aus unbehauenen Steinen herstellen."
Description[ENGLISH][7] = "Produce twenty stone blocks and bring them to Boumaug. You can buy them from a merchant, or produce them by using a chisel while holding raw stone."
Description[GERMAN][8] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[ENGLISH][8] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][9] = "Gehe zur Schwarzlochmine, dem Nordhafen, der schwarzen Brücke und der östlichen Brücke bei den Bienenkörben. Danach kehre zu Boumaug zurück."
Description[ENGLISH][9] = "Go to the Dark Hole mine, north harbour, the Black Bridge, and the eastern bridge at the beehives. Then return to Boumaug."
Description[GERMAN][10] = "Kehre zu Boumaug zurück."
Description[ENGLISH][10] = "Return to Boumaug."
Description[GERMAN][11] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[ENGLISH][11] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][12] = "Besuche das Hemp Necktie Inn, den Königinnenpalast in Cadomyr und die Kammer des Erzmagiers in Runewick. Danach kehre zu Boumaug zurück."
Description[ENGLISH][12] = "Go to the Hemp Necktie Inn, the Queen's palace in Cadomyr and the Archmage's chamber in Runewick. Then return to Boumaug."
Description[GERMAN][13] = "Kehre zu Boumaug zurück."
Description[ENGLISH][13] = "Return to Boumaug."
Description[GERMAN][14] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[ENGLISH][14] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][15] = "Produziere 20 Ballen grauen Stoff und bringe sie zu Boumaug. Du kannst sie von einem Händler kaufen oder mit einer Nadel in der Hand aus Wolle auf einem Webstuhl weben, wenn Du vor ihm stehst. Du kannst Webstühle in Runewick oder Cadomyr finden."
Description[ENGLISH][15] = "Produce twenty gray cloth and bring them to Boumaug. You can buy them from a merchant or weave wool into cloth by using a loom as you stand in front of it, with a needle in your hand. You can find looms in Runewick or Cadomyr."
Description[GERMAN][16] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[ENGLISH][16] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][17] = "-"
Description[ENGLISH][17] = "Produce a rapier and a bottle of elven wine and bring them to Boumaug. You can produce them as weaponsmith and cook respectively. Therefore use the hammer in your hand, while standing in front of an anvil or use the cooking spoon in your hand, while standing in front of a brewing barrel."
Description[GERMAN][18] = "-."
Description[ENGLISH][18] = "You have fulfilled all the tasks for Boumaug Firesmash."


-- These all need to change.

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {408, 247, 0} 

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(408, 247, 0), position(125, 566, 0)} -- statue
QuestTarget[2] = {position(405, 247, 0)} 
QuestTarget[3] = {position(405, 247, 0)} 
QuestTarget[4] = {position(405, 247, 0), position(404, 267, 1), position(385, 333, 0), position(348, 229, 0)} -- notary's office, the Don and the south gate
QuestTarget[5] = {position(405, 247, 0)} 
QuestTarget[6] = {position(405, 247, 0)} 
QuestTarget[7] = {position(405, 247, 0)} 
QuestTarget[8] = {position(405, 247, 0)} 
QuestTarget[9] = {position(405, 247, 0), position(417, 188, 0), position(447, 121, 0), position(497, 201, 0), position(628, 270, 0)} --Black hole mine, north harbour, black bridge, and Lake of life area
QuestTarget[10] = {position(405, 247, 0)}
QuestTarget[11] = {position(405, 247, 0)} 
QuestTarget[12] = {position(405, 247, 0), position(698, 314, 0), position(347, 229, 0), position(1002, 813, 0)} -- Hanfschlinge,Galmair,Runewick
QuestTarget[13] = {position(405, 247, 0)} 
QuestTarget[14] = {position(405, 247, 0)} 
QuestTarget[15] = {position(405, 247, 0), position(945, 829, 0), position(957, 823, 0), position(367, 277, 0), position(382, 269, 0)} --händler,werkbank
QuestTarget[16] = {position(405, 247, 0)} 
QuestTarget[17] = {position(405, 247, 0), position(125, 603, 0), position(143, 586, 0), position(138, 589, 0)} --händler,Schmelzofen,amboss
QuestTarget[18] = {position(405, 247, 0)} 


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

return M
