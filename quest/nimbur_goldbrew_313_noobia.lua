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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (313, 'quest.nimbur_goldhand_313_noobia');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Tutorial II - Sammeln, Herstellen und Kämpfen"
Title[ENGLISH] = "Tutorial II - Gathering, Crafting and Fighting"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Sprich mit Nimbur Goldbrew. \n\nUm mit dem Zwerg zu sprechen, aktiviere die Chatbox, indem du darauf klickst oder 'Enter' drückst. Schreibe 'Hallo' um ihn zu grüßen und dann klick erneut 'Enter'. Alternativ kannst du NPCs auch doppel-klicken, um Basisgesprächsoptionen zu aktivieren. Alle NPCs reagieren auf bestimmte Stichworte, wenn du im Radius von zwei Feldern um sie herumstehst. \n\nFalls du nicht weißt wie du mit einem NPC kommunizieren sollst, frag nach 'Hilfe', um eine Liste mit empfohlenen Kommandos zu erhalten."
Description[ENGLISH][1] = "Speak to Nimbur Goldbrew. \n\nTo speak to the dwarf, activate the chat box if necessary by clicking on it or by using the 'Return' key, type 'Hello' to greet him, and hit 'Return'. Alternatively you can double click on any NPC to activate basic talk options. All NPCs react to certain keywords if you are standing within two tiles. \n\nIf you get stuck trying to communicate with an NPC, asking for 'help' will provide you with a list of recommended commands."
Description[GERMAN][2] = "Pflücke sechs Äpfel in Obstgarten. Um Äpfel zu pflücken, musst du vor einem Apfelbaum stehen und ihn durch Doppelklick benutzen oder drücke die Leertaste. \n\nKehre mit den Äpfeln, die du gesammelt hast, zu Nimbur Goldbrew zurück."
Description[ENGLISH][2] = "Pick six apples from the orchard. To collect some apples stand in front of an apple tree and double click with your mouse or press the space bar. \n\nReturn to Nimbur Goldbrew with the apples you have collected."
Description[GERMAN][3] = "Stell dich vor das Weinfass zwischen den beiden Tischen. Du musst den Kochlöffel in einem der Handslots deines Inventars ausrüsten. Doppelklick den Kochlöffel oder das Fass, um das Handwerksmenü zum Brauen zu öffnen. \n\nxxx \n\nGehe zurück zu Nimbur Goldbrew mit den Flaschen mit Cider, die du gebraut hast."
Description[ENGLISH][3] = "Stand in front of the wine barrel set between the two tables. You will need to equip the cooking spoon in one of the hand slots of your inventory. Double click on the spoon or barrel to bring up the crafting menu for brewing. \n\nAs you are only starting out, you will likely only have soft liquors listed on your brewing menu. Open the 'Soft Liquors' category by clicking the prefixing arrow head and click 'Bottle of Cider' to select it. In this instance only one bottle of cider is required, but you can adjust the number of items to be produced using the '-' and '+' buttons. Start production by clicking the 'Produce' button. A progress bar will indicate how long until production is complete and your finished bottle of cider will appear in your bag once complete. \n\nReturn to Nimbur Goldbrew with the bottle of cider you have brewed."
Description[GERMAN][4] = "Du hast die Tutorial-Quests abgeschlossen. \n\nAllerdings kann Viola Baywillow dir viel mehr über Illarion und die Reiche erzählen."
Description[ENGLISH][4] = "You have completed the tutorial quests. \n\nViola Baywillow can tell you lots more about Illarion and the realms though."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {706, 297, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[2] = {position(707, 294, 0), position(706, 297, 0)}
QuestTarget[3] = {position(710, 301, 0), position(706, 297, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 4


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
