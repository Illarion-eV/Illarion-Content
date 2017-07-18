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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (160, 'quest.decius_cerasus_160_runewick');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Im Dienste Runewicks"
Title[ENGLISH] = "For Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Ein neuer Novize wird bald in unsere Reihen aufgenommen. Bringe Decius Cerasus eine Novizenrobe. Aber beeile dich, sie muss bis zur Zeremonie da sein."
Description[ENGLISH][1] = "A new novice will be accepted into our ranks soon. Please bring Decius Cerasus a novice robe. But hurry, it must be here for the ceremony."

Description[GERMAN][2] = "Unsere alchemistischen Vorräte gehen zur Neige. Bringe Decius Cerasus 5 leere Flaschen."
Description[ENGLISH][2] = "Our alchemistical resources are dwindling. Please bring Decius Cerasus five empty bottles."

Description[GERMAN][3] = "Bei der letzten Feier zur Ehren Adrons sind ein paar Gläser zu Bruch gegangen. Bringe Decius Cerasus 5 Glaskrüge."
Description[ENGLISH][3] = "During the last celebration to honour Adron some glasses were broken. Please bring Decius Cerasus five glass mugs."

Description[GERMAN][4] = "Unser Erzmagier arbeitet bis spät in die Nacht. Deshalb benötigt er einen Kerzenhalter. Bringe Decius Cerasus einen."
Description[ENGLISH][4] = "Our Archmage works late into the night. That's why he needs a candlestick. Please bring Decius Cerasus one."

Description[GERMAN][5] = "Unser Erzmagier hat einen neuen Kerzenhalter bekommen. Bringe Decius Cerasus zehn Kerzen dafür."
Description[ENGLISH][5] = "Our Archmage got a new candlestick. Now he needs ten candles for it. Please bring Decius Cerasus ten candles."

Description[GERMAN][6] = "Für unsere Bibliothek werden immer neue Bücher und Schriftrollen geschrieben. Deshalb wurde bei Decius Cerasus noch eine Schreibfeder bestellt. Bringe Decius Cerasus eine."
Description[ENGLISH][6] = "There are always new books and scrolls written for our library. Therefore Decius Cerasus received an order for a quill. Bringe Decius Cerasus one."

Description[GERMAN][7] = "Leider hatten wir bei dem letzten Fest keine Musik. Bringe Decius Cerasus doch bitte eine Laute, für den Musiker sorgt er."
Description[ENGLISH][7] = "Sadly, our last feast lacked music. Please bring Decius Cerasus a lute, to take care of the musician."

Description[GERMAN][8] = "Unser erleuchteter Erzmagier möchte einen verdienten Schüler einen neuen Zauberstab überreichen. Bringe Decius Cerasus einen."
Description[ENGLISH][8] = "Our enlightened Archmage wishes to give a pupil a well-deserved new wand. Bring Decius Cerasus one."

Description[GERMAN][9] = "Eine sehr dringende und etwas aufwendigere Bestellung unseres Erzmagiers. Bringe Decius Cerasus einen feinen Zauberhut."
Description[ENGLISH][9] = "A very urgent and quite elaborate order by our Archmage. Bring Decius Cerasus a fine wizard hat."

Description[GERMAN][10] = "Decius Cerasus braucht eine Rubinkette."
Description[ENGLISH][10] = "Decius Cerasus need a ruby amulet."

Description[GERMAN][11] = "Heute benötigt Decius Cerasus fünf Muffins. Bringe sie ihm."
Description[ENGLISH][11] = "Today Decius Cerasus needs five blackberry muffins. Bring them to Decius Cerasus, and no further questions."

Description[GERMAN][12] = "Eine Anfrage von unseren forschenden Alchemisten wurde gestellt. Sie brauchen zehn Sonnenkräuter. Bringt sie Decius Cerasus und die Tränkepanscher werden zufrieden sein."
Description[ENGLISH][12] = "A request was made by our researching alchemists. They need ten sun herbs. Just bring them to Decius Cerasus and those potion makers will be happy."

Description[GERMAN][13] = "Eine Anfrage von unseren forschenden Alchemisten wurde gestellt. Sie brauchen zehn Flammkelchblüten. Bringt sie Decius Cerasus und die Tränkepanscher werden zufrieden sein."
Description[ENGLISH][13] = "A request was made by our researching alchemists. They need ten flamegoblet blossoms. Just bring them to Decius Cerasus and those potion makers will be happy."

Description[GERMAN][14] = "Eine Anfrage von unseren forschenden Alchemisten wurde gestellt. Sie brauchen eine Wüstenbeere. Bringt sie Decius Cerasus und die Tränkepanscher werden zufrieden sein."
Description[ENGLISH][14] = "A request was made by our researching alchemists. They need a desert berry. Just bring it to Decius Cerasus and those potion makers will be happy."

Description[GERMAN][15] = "Unser erhabener Erzmagier erwartet Besuch. Für die Verköstigung braucht Decius Cerasus noch eine Flasche Runewicker Wein. Bring ihm schnell eine."
Description[ENGLISH][15] = "Our elevated Archmage expects a visitor. For his supply we still need a bottle of Runewicker wine. Please get Decius Cerasus one quickly."

Description[GERMAN][16] = "Eine Katastrophe. Das Pfeifenkraut unseres erhabenen Erzmagiers ist feucht geworden. Bringe Decius Cerasus sofort fünf Blätter Tabak."
Description[ENGLISH][16] = "A catastrophe. The Archmage's tobacco has got wet. He needs five leaves of tobacco. Immediately bring them to Decius Cerasus!"

Description[GERMAN][17] = "Eines der besten Mittel gegen eine Erkältung ist Jungfernkrauttee. Bringe Decius Cerasus bitte eine Flasche."
Description[ENGLISH][17] = "One of the best remedies for a cold is virgins weed tea. Get Decius Cerasus a bottle."

Description[GERMAN][18] = "Unser gelehrsamer Erzmagier braucht für ein Ritual einen Beutel Diamantstaub. Bringe ihn Decius Cerasus so schnell wie möglich."
Description[ENGLISH][18] = "Our studious Archmage needs a bag of diamond dust for a ritual. Bring Decius Cerasus one as fast as possible."

Description[GERMAN][19] = "Es werden fünf Forellen benötigt. Frag Decius Cerasus nicht warum, bring sie ihn einfach."
Description[ENGLISH][19] = "Five trout are needed. Do not ask Decius Cerasus why, please just get them for him."

Description[GERMAN][20] = "Bringe Decius Cerasus 20 Kirschen, am besten die süßen, dunkelroten, Runewicker Kirschen."
Description[ENGLISH][20] = "Bring Decius Cerasus, twenty cherries, preferrably the sweet dark red Runewicker cherries."

Description[GERMAN][21] = "Runewick muss in Stand gehalten werden. Bringt Decius Cerasus zehn Ziegelsteine, damit er einige beschädigte Teile ausbessern kann."
Description[ENGLISH][21] = "Runewick needs to be kept in shape. Bring Decius Cerasus ten bricks to mend a few damaged parts."

Description[GERMAN][22] = "Runewick muss in Stand gehalten werden. Bringt Decius Cerasus zehn Naldorholzbretter, damit die Schreiner neue Regale bauen können."
Description[ENGLISH][22] = "Runewick needs to be kept in shape. Get Decius Cerasus ten naldor wood boards, so the carpenters can build new shelves."

Description[GERMAN][23] = "Der Vorrat an Kohle für die Öfen geht zur Neige. Wenn wir nicht frieren wollen benötigt Decius Cerasus fünf Kohleklumpen. Und zwar so schnell wie möglich."
Description[ENGLISH][23] = "Our stock of coal for the ovens is running low. If we don't want to freeze Decius Cerasus needs five lumps of coal. As fast as possible."

Description[GERMAN][24] = "Unser Erzmagier ist zwar meist fleißig am lehren und studieren, aber manchmal braucht auch er eine Pause. Nun ist allerdings seine Lieblingspfeife zu Bruch gegangen, bringt Decius Cerasus dafür Ersatz. Und zwar so schnell wie möglich."
Description[ENGLISH][24] = "Our Archmage is usually busy teaching and studying, but sometimes even he needs a break. Now his beloved pipe has broken, bring Decius Cerasus a replacement. Do it as fast as possible."

Description[GERMAN][25] = "Für Umbau- und Renovierungsarbeiten benötigt Decius Cerasus noch einen Hammer. Natürlich wird unser Erzmagier davon erfahren, wenn ihr Decius Cerasus helft."
Description[ENGLISH][25] = "For the reconstructions and renovations Decius Cerasus still needs a hammer. Of course our Archmage will hear about your help."
-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {896, 849, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(896, 849, 0)} 
QuestTarget[2] = {position(896, 849, 0)} 
QuestTarget[3] = {position(896, 849, 0)} 
QuestTarget[4] = {position(896, 849, 0)} 
QuestTarget[5] = {position(896, 849, 0)} 
QuestTarget[6] = {position(896, 849, 0)} 
QuestTarget[7] = {position(896, 849, 0)} 
QuestTarget[8] = {position(896, 849, 0)} 
QuestTarget[9] = {position(896, 849, 0)} 
QuestTarget[10] = {position(896, 849, 0)} 
QuestTarget[11] = {position(896, 849, 0)} 
QuestTarget[12] = {position(896, 849, 0)} 
QuestTarget[13] = {position(896, 849, 0)} 
QuestTarget[14] = {position(896, 849, 0)} 
QuestTarget[15] = {position(896, 849, 0)} 
QuestTarget[16] = {position(896, 849, 0)} 
QuestTarget[17] = {position(896, 849, 0)} 
QuestTarget[18] = {position(896, 849, 0)} 
QuestTarget[19] = {position(896, 849, 0)} 
QuestTarget[20] = {position(896, 849, 0)} 
QuestTarget[21] = {position(896, 849, 0)} 
QuestTarget[22] = {position(896, 849, 0)} 
QuestTarget[23] = {position(896, 849, 0)} 
QuestTarget[24] = {position(896, 849, 0)} 
QuestTarget[25] = {position(896, 849, 0)} 
--QuestTarget[1] = {position(x, y, 100), position(x, y, 100)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 0


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
