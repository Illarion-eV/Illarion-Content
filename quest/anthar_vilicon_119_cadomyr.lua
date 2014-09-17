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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (119, 'quest.anthar_vilicon_119_cadomyr');

local common = require("base.common")
module("quest.anthar_vilicon_119_cadomyr", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Jeden Tag eine gute Tat für Cadomyr"
Title[ENGLISH] = "Do a good turn daily for Cadomyr"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Eure heutige Mission: Die Königin verlang nach süßen Früchten und ich werde sie nicht enttäuschen. Bringt mir fünf Erdbeeren und ich werde euren Namen ihr gegenüber lobend erwähnen."
Description[ENGLISH][1] = "Your mission today: The Queen desires sweet fruit and I will not disappoint her. Bring me five strawberries as fast as possible and I'll mention your name in front of her."

Description[GERMAN][2] = "Cadomyrs Wirtschaft ist auf Sand gebaut. Sehr witzig, ich weiß - aber wenn ihr einen Blick in die Schatzkammer werfen dürftet, würde euch das Lachen vergehen. Einer Lieferung Quartzsand ins Ausland fehlen noch zwanzig Haufen. Beschafft sie bitte möglichst bald."
Description[ENGLISH][2] = "Cadomyr's economy is based on sand. Very funny, I know - but take a look at the treasury and you won't laugh anymore. A shipment of quartz sand abroad lacks twenty piles. Please provide them sometime soon."

Description[GERMAN][3] = "Ich habe eine besondere Aufgabe für euch. Königin Rosaline möchte ein Diadem als Geschenk an ihre Großtante in Albar senden. Für dieses Diadem werden noch drei geschliffene Rubine benötigt. Ihr werdet derjenige sein, der sie besorgt!"
Description[ENGLISH][3] = "I have a special assignement for you. Queen Rosaline wants to send a diadem to her grand aunt in Albar as present. For that diadem, three cut rubies are needed. You are the one who will get them!"

Description[GERMAN][4] = "Als Verwalter des Palastes muss ich mich sogar um Löcher in der Decke kümmern, habt ihr jenes gesehen? Die Artisanen brauchen zehn Kirschholzbretter, um es auszubessern. Bitte besorgt diese und der Dank der Königin ist euch gewiss."
Description[ENGLISH][4] = "As administrator of the palace, I even have to take care of leaks in the ceiling. Did you see that hole? To fix it, the artisans need ten cherry wood boards. Please provide them and the Queen will be grateful."

Description[GERMAN][5] = "Eine neue Zofe steht seit kurzem im Dienste ihrer Majestät. Um sie gebührend einzukleiden wird ein weißes Wappenkleid benötigt. Los, lauft zu einem Schneider und besorgt eines."
Description[ENGLISH][5] = "A new maidservant recently started working for her Majesty. To dress her properly, a white heraldic dress is needed. Quick, run to one of the tailors and obtain one."

Description[GERMAN][6] = "Die heutige Mission ist etwas wichtiger: Die Stadtmauer Cadomyrs muss ständig in Schuss gehalten werden. In der Südmauer ist ein kleiner Schaden, nichts schlimmes, aber dennoch werden zwanzig Ziegelsteine benötigt, um sie auszubessern."
Description[ENGLISH][6] = "Today's mission is a little more important: The town wall of Cadomyr is in need of constant repair. There is a small amount of damage to the southern wall, nothing serious, but still, twenty bricks are needed to fix it."

Description[GERMAN][7] = "Ihr da! Ich habe gerade die Waffenkammer überprüft und festgestellt, dass ein Langschwert fehlt. Bitte untersucht diesen Diebstahl - entweder, ihr bringt mir den Kopf des Diebes oder ein neues Langschwert als Ersatz."
Description[ENGLISH][7] = "You! I just checked the armoury and found a long sword missing! Please investigate this theft - either, bring me the head of the thief or a newly crafted long sword as replacement."

Description[GERMAN][8] = "Wißt ihr, was einen Palast erst so richtig prunkvoll macht? Dekoration. Die Königin liebt Firnisblüten über alles und sie mag sie in Massen. Bringt bitte fünfzehn Blüten, so dass ich ihre Kammer ausschmücken kann."
Description[ENGLISH][8] = "You know what makes a glorious palace? Decoration. The Queen likes firnis blossoms and she likes many of them. Bring me fifteen of them so I can decorate her chamber."

Description[GERMAN][9] = "Die Kavallerie der Ritter Cadomyrs wurde schon immer von unseren Feinden gefürchtet. Heute lernt ihr, dass zu einer Kavallerie mehr gehört als Lanzen; die Pferde müssen jeden Tag gefüttert werden. Eure Aufgabe ist es, zehn Karotten für das königliche Gestüt herzubringen."
Description[ENGLISH][9] = "The cavalary of Cadomyr's knights has always been feared by our enemies. Today, you'll learn that a cavalary needs more than a lance; the horses need to be fed every day. It is your job to bring ten carrots for the royal horses."

Description[GERMAN][10] = "Verwaltung kann manchmal ganz schön anstrengend sein. Manchmal arbeite ich bis tief in die Nacht. Dafür brauche ich immer eine Menge Kerzen. Bringt mir doch bitte eine Kerzenziehform."
Description[ENGLISH][10] = "Administration can be quite exhausting. Sometimes, I even work during the night. For that, I need a constant supply of candles. Please bring me a candle mould."

Description[GERMAN][11] = "Ah, ein ergebender Diener ihrer Majestät, sehr gut. Ich plane ein Bankett zu Ehren der königlichen Familie. Es wird eine schmackhafte Spargelcremesuppe gereicht werden, aber es mangelt an Suppenschüsseln. Bitte besorgt zwanzig Schüsseln feinster Machart und bringt sie zu mir."
Description[ENGLISH][11] = "Ah, a loyal servant of her Majesty, very good. I plan a banquet to honour the royal family. We'll serve a delicious asparagus cream soup, but soup bowls aren't available in sufficient amounts. Please obtain twenty soup bowls of highest quality and bring them to me."

Description[GERMAN][12] = "Ein Notfall ist eingetreten, das Königreich ist in ernsthafter Gefahr. Königin Rosaline hat ihren Spiegel zerbrochen - ihr wisst, wie aufbrausend sie sein kann und wie viel Wert sie auf ihre Schönheit legt. Um Überstürztheiten ihrerseits zuvorzukommen, besorgt sofort einen neuen Spiegel. Gehorcht!"
Description[ENGLISH][12] = "An emergency has occured, the kingdom is seriously endangered. Queen Rosaline broke her mirror - you know how irascible she is and what beauty means to her. To prevent possible misjudgements by her, get a new mirror at once. Obey!"

Description[GERMAN][13] = "Ich habe einen wichtigen Auftrag: Königin Rosaline empfängt demnächste eine Delegation aus Siebenbergen, ein Zwergenreich. Sie möchte diese bärtigen Wichte mit einem besonderen Geschenk beeindrucken: Ein Kamm für ihre zotteligen Bärte. Es ist an euch, einen geeigneten Kamm auszusuchen und mir zu bringen."
Description[ENGLISH][13] = "I have an important order: Queen Rosaline will welcome a delegation from Sevenhill, a dwarven kingdom. She wants to impress those bearded gnomes with a special present: A comb for their shaggy beards. It is your duty to select a proper comb and bring it to me."

Description[GERMAN][14] = "Ich bin auch für die Waffenkammer Cadomyrs verantwortlich. Neulich trat Horatio Milenus, eine der Stadtwachen, an mich heran und bat um die Anschaffung eines Langbogens um das Getier der Wüste fernzuhalten. Ich befehle nun euch, einen Langbogen zu beschaffen."
Description[ENGLISH][14] = "I am responsible for the armoury of Cadomyr. Recently, Horatio Milenus, one of the town guards, approached me and suggested the purchase of a long bow to repel the beasts of the desert. Now I command you to provide a long bow."

Description[GERMAN][15] = "Neulich erdreiste sich eine Banditenbande, Rekruten Cadomyrs aufzulauern. Ich brauche nicht betonen, dass die Banditen mit unzähligen Armbrustbolzen niedergestreckt wurden. Besorgt bitte Nachschub an einhundert Bolzen."
Description[ENGLISH][15] = "Recently, a bunch of bandits dared to ambush a host of recruits of Cadomyr. Needless to say the bandits perished. During the skirmish, many crossbow bolts were shot into their chests. Please bring me a supply of a hundred bolts to replace them."

Description[GERMAN][16] = "Die Königin hat befohlen, dass sie ein Festessen mit ihren Adligen abhalten wird. Ich koordiniere die Vorbereitungen, für den Hauptgang ist ein Wildgericht vorgesehen. Euer Befehl: Besorgt fünf Gerichte oder spürt meinen Zorn."
Description[ENGLISH][16] = "The Queen commanded that she'll have a feast with her nobles and I am the one who coordinates the preparations. For the main course, venison dishes are planned. Your order is to obtain five dishes or you'll feel my wrath."

Description[GERMAN][17] = "Neue Befehle der Königin: Morgen möchte sie die Wüste bereisen und sie braucht noch passende Kleidung. Ihr Geschmack ist manchmal etwas ausgefallen. Sie verlangt nach einem rot-weißem Rock. Besorgt einen und bringt ihn her."
Description[ENGLISH][17] = "New orders from the Queen: Tomorrow, she wants to visit the desert but lacks a proper outfit. Her taste is sometimes... special. She demands a red and white skirt, get it and bring it to me."

Description[GERMAN][18] = "Verwaltung, Verwaltung, Verwaltung... um es kurz zu machen, auch wenn Cadomyr ein Wüstenreich ist, kann es verdammt kalt in der Nacht werden. Die Kohlevorräte sind erschöpft und Königin Rosaline soll doch nicht frieren. Bringt mir bitte fünfzehn Klumpen Kohle, um sie zu wärmen."
Description[ENGLISH][18] = "Administration, administration, administration... to cut a long story short, even though Cadomyr is a desert realm, it can be pretty cold at night. The stocks of coal are depleted and I don't want to see the Queen freeze. Get fifteen lumps of coal to warm her."

Description[GERMAN][19] = "Gerüchten zufolge planen Baron Hastings Männer einen Anschlag. Alle Wachen sind bestens vorbereitet und ausgerüstet, es fehlt lediglich ein Helm für einen neuen Rekruten. Gehorcht und liefert einen Topfhelm zu meinen Händen."
Description[ENGLISH][19] = "I got word of planned sabotage by Baron Hastings' men. All our guards are well equipped and prepared, except for a missing helmet for one recruit. Obey and deliver a pot helmet to my hands."

Description[GERMAN][20] = "Heute habe ich keinen Befehl für euch sondern eine persönliche Bitte. Könntet ihr mir bitte einen Goldbarren bringen - ich möchte der Königin ein besonderes Geschenk, einen Armreif, schmieden um ihr meine Ergebenheit zu beweisen."
Description[ENGLISH][20] = "Today, I have a personal request rather than an order. Could you please bring me a gold ingot - I want to forge a special gift, a bracelet, for my Queen to prove my loyality."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {117, 528, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(117, 528, 0)} 
QuestTarget[2] = {position(117, 528, 0)} 
QuestTarget[3] = {position(117, 528, 0)} 
QuestTarget[4] = {position(117, 528, 0)} 
QuestTarget[5] = {position(117, 528, 0)} 
QuestTarget[6] = {position(117, 528, 0)} 
QuestTarget[7] = {position(117, 528, 0)} 
QuestTarget[8] = {position(117, 528, 0)} 
QuestTarget[9] = {position(117, 528, 0)} 
QuestTarget[10] = {position(117, 528, 0)} 
QuestTarget[11] = {position(117, 528, 0)} 
QuestTarget[12] = {position(117, 528, 0)} 
QuestTarget[13] = {position(117, 528, 0)} 
QuestTarget[14] = {position(117, 528, 0)} 
QuestTarget[15] = {position(117, 528, 0)} 
QuestTarget[16] = {position(117, 528, 0)} 
QuestTarget[17] = {position(117, 528, 0)} 
QuestTarget[18] = {position(117, 528, 0)} 
QuestTarget[19] = {position(117, 528, 0)} 
QuestTarget[20] = {position(117, 528, 0)} 

--QuestTarget[1] = {position(x, y, 100), position(x, y, 100)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 0


function QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
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