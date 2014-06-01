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

require("base.common")
module("quest.decius_cerasus_160_runewick", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Im Dienste Runewicks"
Title[ENGLISH] = "For Runewick"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Ein neuer Novize wird bald in unsere Reihen aufgenommen. Bringe mir bitte eine Novizenrobe. Aber beeile dich, sie muss bis zur Zeremonie da sein."
Description[ENGLISH][1] = "A new novice will be accepted into our ranks soon. Please bring me a novice robe. But hurry, it must be here for the ceremony."

Description[GERMAN][2] = "Unsere alchemistischen Vorräte gehen zur Neige. Bringe mir bitte 5 leere Flaschen."
Description[ENGLISH][2] = "Our alchemistical resources are dwindling. Please bring me five empty bottles."

Description[GERMAN][3] = "Bei der letzten Feier zur Ehren Adrons sind ein paar Gläser zu Bruch gegangen. Könntest du mir 5 Glaskrüge bringen?"
Description[ENGLISH][3] = "During the last celebration to honour Adron some glasses were broken. Can you bring me five glass mugs?"

Description[GERMAN][4] = "Unser Erzmagier arbeitet bis spät in die Nacht. Deshalb benötigt er einen Kerzenhalter. Bring mir bitte einen."
Description[ENGLISH][4] = "Our Archmage works late into the night. That's why he needs a candlestick. Please bring me one."

Description[GERMAN][5] = "Unser Erzmagier hat einen neuen Kerzenhalter bekommen. Jetzt benötigt er 10 Kerzen dafür."
Description[ENGLISH][5] = "Our Archmage got a new candlestick. Now he needs ten candles for it."

Description[GERMAN][6] = "Für unsere Bibliothek werden immer neue Bücher und Schriftrollen geschrieben. Deshalb wurde bei mir noch eine Schreibfeder bestellt. Bring mir bitte eine."
Description[ENGLISH][6] = "There are always new books and scrolls written for our library. Therefore I received an order for a quill. Bring me one."

Description[GERMAN][7] = "Leider hatten wir bei dem letzten Fest keine Musik. Bring mir doch bitte eine Laute, für den Musiker sorge ich."
Description[ENGLISH][7] = "Sadly, our last feast lacked music. Please bring me a lute, I shall take care of the musician."

Description[GERMAN][8] = "Unser erleuchteter Erzmagier möchte einen verdienten Schüler einen neuen Zauberstab überreichen. Ich übergeb euch hiermit die Aufgabe, mir einen zu bringen."
Description[ENGLISH][8] = "Our enlightened Archmage wishes to give a pupil a well-deserved new wand. I hereby give you the task to bring me one."

Description[GERMAN][9] = "Eine sehr dringende und etwas aufwendigere Bestellung unseres Erzmagiers. Bringe mir einen feinen Zauberhut."
Description[ENGLISH][9] = "A very urgent and quite elaborate order by our Archmage. Bring me a fine wizard hat."

Description[GERMAN][10] = "Ich brauche eine Rubinkette. Wärt ihr so freundlich mir eine zu bringen?"
Description[ENGLISH][10] = "I need a ruby amulet. Would you be so kind to get me one?"

Description[GERMAN][11] = "Heute benötige ich 5 Muffins. Bringt sie mir und fragt nicht weiter."
Description[ENGLISH][11] = "Today I need five blackberry muffins. Bring them to me and no further questions."

Description[GERMAN][12] = "Eine Anfrage von unseren forschenden Alchemisten wurde gestellt. Sie brauchen 10 mal Sonnenkraut. Bringt sie mir einfach und die Tränkepanscher werden zufrieden sein."
Description[ENGLISH][12] = "A request was made by our researching alchemists. They need ten sun herbs. Just bring them to me and those potion makers will be happy."

Description[GERMAN][13] = "Eine Anfrage von unseren forschenden Alchemisten wurde gestellt. Sie brauchen 10 mal Flammkelchblüte. Bringt sie mir einfach und die Tränkepanscher werden zufrieden sein."
Description[ENGLISH][13] = "A request was made by our researching alchemists. They need ten flamegoblet blossoms. Just bring them to me and those potion makers will be happy."

Description[GERMAN][14] = "Eine Anfrage von unseren forschenden Alchemisten wurde gestellt. Sie brauchen eine Wüstenbeere. Bringt sie mir einfach und die Tränkepanscher werden zufrieden sein."
Description[ENGLISH][14] = "A request was made by our researching alchemists. They need a desert berry. Just bring it to me and those potion makers will be happy."

Description[GERMAN][15] = "Unser erhabener Erzmagier erwartet Besuch. Für die Verköstigung brauchen wir noch eine Flasche runewicker Wein. Bring mir doch schnell eine."
Description[ENGLISH][15] = "Our elevated Archmage expects a visitor. For his supply we still need a bottle of Runewicker wine. Please get me one quickly."

Description[GERMAN][16] = "Eine Katastrophe. Das Pfeifenkraut unseres erhabenen Erzmagiers ist feucht geworden. Er benötigt 5 Blätter Tabak. Sofort!"
Description[ENGLISH][16] = "A catastrophe. The Archmage's tobacco has got wet. He needs five leaves of tobacco. Immediately!"

Description[GERMAN][17] = "Eines der besten Mittel gegen eine Erkältung ist Jungfernkrauttee. Bringe mir bitte eine Flasche."
Description[ENGLISH][17] = "One of the best remedies for a cold is virgins weed tea. Get me a bottle."

Description[GERMAN][18] = "Unser gelehrsamer Erzmagier braucht für ein Ritual einen Bäutel Diamantstaub. Bring es mir so schnell wie möglich."
Description[ENGLISH][18] = "Our studious Archmage needs a bag of diamond dust for a ritual. Bring me one as fast as possible."

Description[GERMAN][19] = "Es werden fünf Forellen benötigt. Frag mich nicht warum, bring sie mir bitte einfach."
Description[ENGLISH][19] = "Five trout are needed. Do not ask me why, please just get them for me."

Description[GERMAN][20] = "Ich habe wieder eine Aufgabe für euch. Bringt mir 20 Kirschen, am besten die süßen, dunkelroten, runewicker Kirschen."
Description[ENGLISH][20] = "I've got another task for you. Bring me twenty cherries, preferrably the sweet dark red Runewicker cherries."

Description[GERMAN][21] = "Runewick muss in Stand gehalten werden. Bringt mir zehn Ziegelsteine, damit ich einige beschädigte Teile ausbessern kann."
Description[ENGLISH][21] = "Runewick needs to be kept in shape. Bring me ten bricks so I can mend a few damaged parts."

Description[GERMAN][22] = "Runewick muss in Stand gehalten werden. Bringt mir zehn Naldorholzbretter, damit die Schreiner neue Regale bauen können."
Description[ENGLISH][22] = "Runewick needs to be kept in shape. Get me ten naldor wood boards, so the carpenters can build new shelves."

Description[GERMAN][23] = "Der Vorrat an Kohle für die Öfen geht zur Neige. Wenn wir nicht frieren wollen benötige ich fünf Kohleklumpen. Und zwar so schnell wie möglich."
Description[ENGLISH][23] = "Our stock of coal for the ovens is running low. If we don't want to freeze I need five lumps of coal. As fast as possible."

Description[GERMAN][24] = "Unser Erzmagier ist zwar meist fleißig am lehren und studieren, aber manchmal braucht auch er eine Pause. Nun ist allerdings seine Lieblingspfeife zu Bruch gegangen, bringt mir dafür Ersatz. Und zwar so schnell wie möglich."
Description[ENGLISH][24] = "Our Archmage is usually busy teaching and studying, but sometimes even he needs a break. Now his beloved pipe has broken, bring me a replacement. Do it as fast as possible."

Description[GERMAN][25] = "Für Umbau- und Renovierungsarbeiten benötige ich noch einen Hammer. Natürlich wird unser Erzmagier davon erfahren, wenn ihr mir helft."
Description[ENGLISH][25] = "For the reconstructions and renovations I still need a hammer. Of course our Archmage will hear about your help."
-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {906, 828, 3}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(906, 828, 3)} 
QuestTarget[2] = {position(906, 828, 3)} 
QuestTarget[3] = {position(906, 828, 3)} 
QuestTarget[4] = {position(906, 828, 3)} 
QuestTarget[5] = {position(906, 828, 3)} 
QuestTarget[6] = {position(906, 828, 3)} 
QuestTarget[7] = {position(906, 828, 3)} 
QuestTarget[8] = {position(906, 828, 3)} 
QuestTarget[9] = {position(906, 828, 3)} 
QuestTarget[10] = {position(906, 828, 3)} 
QuestTarget[11] = {position(906, 828, 3)} 
QuestTarget[12] = {position(906, 828, 3)} 
QuestTarget[13] = {position(906, 828, 3)} 
QuestTarget[14] = {position(906, 828, 3)} 
QuestTarget[15] = {position(906, 828, 3)} 
QuestTarget[16] = {position(906, 828, 3)} 
QuestTarget[17] = {position(906, 828, 3)} 
QuestTarget[18] = {position(906, 828, 3)} 
QuestTarget[19] = {position(906, 828, 3)} 
QuestTarget[20] = {position(906, 828, 3)} 
QuestTarget[21] = {position(906, 828, 3)} 
QuestTarget[22] = {position(906, 828, 3)} 
QuestTarget[23] = {position(906, 828, 3)} 
QuestTarget[24] = {position(906, 828, 3)} 
QuestTarget[25] = {position(906, 828, 3)} 
--QuestTarget[1] = {position(x, y, 100), position(x, y, 100)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 0


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