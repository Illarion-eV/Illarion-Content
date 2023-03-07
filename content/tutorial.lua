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

local common = require("base.common")
local factions = require("base.factions")

local M = {}

--These lists contain all texts of the tutorial.

local tutorialInformDE = {}
local tutorialInformEN = {}
local tutorialTextDE = {}
local tutorialTextEN = {}
local tutorialTalkDE = {}
local tutorialTalkEN = {}

--Texts for informs

tutorialInformDE["brewery"] = "Umgeben von aufeinander gestapelten F�ssern stehen Tische, auf denen wild verstreut Zutaten f�r weitere Getr�nke herumliegen. Der verlockende Geruch der Fermentierung wabert in den Gasthof und durch fein gewebten Stoff gefilterter goldener Met wird in Flaschen abgef�llt."
tutorialInformEN["brewery"] = "Surrounded by stacked barrels, ingredients chaotically scattered over tables await the next brew. The tantilising aroma of fermentation drifts into the inn, as golden mead strains through finely woven cloth to fill the next bottle."

tutorialInformDE["campfire"] ="Alte Baumst�mme, die um ein einladend knisterndes Feuer platziert wurden, bieten eine gute Gelegenheit sich auszuruhen. Funken aus der hei�en Glut fallen auf den Boden, der von den vielen Reisenden, die sich hier gemeinsam ausruhen und Geschichten austauschen, platt getrampelt ist."
tutorialInformEN["campfire"] = "Old logs drawn around the inviting warmth of a crackling fire offer a simple place for respite. Sparks from the glowing embers fall to the scuffed ground, worn bare by many a traveller sharing tales as they rest a while."

tutorialInformDE["depot"] = "Eine reich verzierte goldene Truhe, die vor Energie schimmert, steht im Gasthof zur Hanfschlinge. Sie ist offenbar sehr ger�umig im Inneren."
tutorialInformEN["depot"] = "A highly embellished golden chest sits prominently in the Hemp Necktie Inn, shimmering with energy and seemingly harbouring remarkable depths."

tutorialInformDE["entrance"] = "Von den abgenutzten Bodendielen steigt ein starker Geruch von vergossenem Bier auf, etwas abgemildert durch die wabernden Ger�che von Braten und exotischen Gew�rzen. Der gesch�ftige Wirt bedient Reisende und H�ndler, die an ziemlich abgenutzten Tischen eine Pause einlegen, schroff."
tutorialInformEN["entrance"] = "A strong whiff of sloshed ale rises from scuffed boards, tempered by drifting aromas of roasting meat and exotic spices. The bustling barkeep gruffly serves travellers and merchants taking respite at abundant rustic tables."

tutorialInformDE["glyph"] = "Auf der anderen Seite der funkelnden Br�cke liegt eine mystische Insel, die in schimmernden Nebel geh�llt ist. Energie, durchdrungen mit farbigem Licht, wirbelt um einen Ritualplatz, der in den glitzernden Fels gehauen ist."
tutorialInformEN["glyph"] = "Across a sparkling bridge lies a mystical islet, shrouded in a shimmering mist. Energy swirls with bursts of coloured light around an intricate ritual site carved into glittering rock."

tutorialInformDE["harbour"] = "Passagiere bezahlen an einem reich verzierten Podium, bevor sie auf die wartenden F�hren steigen. Auf dem Podium liegt ein fein beschriebenes, wenn auch etwas verf�rbtes und abgenutztes Pergament, das eine Reihe von Zielen auflistet."
tutorialInformEN["harbour"] = "Coins are exchanged as passengers gather around an ornate podium before boarding the waiting ferry. A neatly scribed, albeit somewhat discoloured and well-used pell sits on the podium listing a number of destinations."

tutorialInformDE["henry"] = "Am Ende des Pier steht ein Mann mit wachsamen Blick. Unentwegt notiert er etwas in sein ledergebundenes Buch. W�hrend er Neuank�mmlinge freundlich gr��t und seinen Rat anbietet, tadelt er immer wieder ungeduldige H�ndler und unfl�tige Seeb�ren."
tutorialInformEN["henry"] = "A sharp-eyed man at the end of the pier diligently writes in a leather-bound journal. Between offering friendly greetings and advice to newcomers, he issues stern reprimands to impatient merchants or unruly sailors."

tutorialInformDE["market"] = "Schwer beladene Karren werden am Hafen hin und her gezogen. Lautstark dr�ngen sich die H�ndler an den Marktst�nden, um ihre Waren anzubieten und �ber die Preise zu verhandeln. Das ein oder andere Gesch�ft wird allerdings auch abseits des Markts und fern neugieriger Blicke abgewickelt."
tutorialInformEN["market"] = "Heavily laden carts are hauled back and forth from the harbour as raucous merchants bustle around market stalls, shouting out offers and haggling over prices, oblivious to other negotiations being concluded inconspicuously through hushed whispers."

tutorialInformDE["nimbur"] = "Ein korpulenter Zwerg h�lt einen Becher in der Hand und probiert vergn�gt sein neuestes Gebr�u. Er scheint damit einverstanden zu sein, einen Schluck zu teilen. H�nde, die nach seinem Geheimrezept trachten, k�nnen sich allerdings auf einen ordentlichen Hieb mit dem Kochl�ffel gefasst machen."
tutorialInformEN["nimbur"] = "A rotund dwarf with mug in hand gleefully samples his latest brew. Pleased enough to share a tipple, any hands straying to his secret recipes can expect a sharp rap across the knuckles from his well used spoon."

tutorialInformDE["orchard"] = "Ein kleiner Hain auf der Landzunge bietet einen schattigen, ruhigen Erholungsort abseits des gesch�ftigen Hafens. Das Rascheln zwischen den Bl�ttern l�sst jedoch darauf schlie�en, dass die verlockenden Fr�chte des Obstgartens auch andere Besucher angezogen haben k�nnten."
tutorialInformEN["orchard"] = "A small grove of trees planted on the headland provides shady tranquility from the bustling harbour. Rustling amongt the leaves, however, suggests the abundant fruit of this orchard might also have attracted other visitors."

tutorialInformDE["orchard rat"] = "Eine kleine braune Ratte verliert das Interesse an einem angenagten Apfel und st�rzt sich vom Baum auf dich, um dich zu bei�en und zu kratzen."
tutorialInformEN["orchard rat"] = "A small brown rat abandons a partially gnawed apple and jumps from the tree, biting and clawing at you."

tutorialInformDE["pathway"] = "Abgenutztes und mit Gras �berwachsenes Kopfsteinpflaster f�hrt vom gesch�ftigen Pier, vorbei an einem knisternden Lagerfeuer und einem malerischen Obstgarten. Der Weg f�hrt schlie�lich zum offenen Anbau eines gewaltigen Geb�udes."
tutorialInformEN["pathway"] = "Worn cobbles with edges overgrown by grass lead from the bustling pier, cut between a tranquil orchard and crackling campfire. Beyond the pathway leads to an open front annex of a towering building."

tutorialInformDE["teleporter"] = "Die Luft um das marmorverzierte Pult knistert vor Energie. Auf dem Pult liegt eine vergilbte und abgenutzte Schriftrolle, auf der in ordentlicher Schrift Zielorte niedergeschrieben wurden."
tutorialInformEN["teleporter"] = "The air crackles with energy around an ornate marble podium. A neatly scribed, albeit somewhat discoloured and well-used pell sits on the podium listing a number of destinations."

tutorialInformDE["temple"] = "Hinter der Taverne steht ein Altar umgeben von dicht gewachsenen Reben, die �ppige Trauben tragen. Umstellt mit Weinf�ssern der besten Jahrg�nge kann er nur Adron geweiht sein. Statuen repr�sentieren Adrons breite Anh�ngerschaft. Sie zeigen alle sozialen Schicht, von der elegant gekleideten Adeligen bis hin zum betrunkenen Bettler."
tutorialInformEN["temple"] = "Behind the tavern, set amongst tangled vines bearing bountiful bunches of grapes and backed by kegs of the finest vintage, there is little doubt the altar serves Adron. From charismatic noble to drunken beggar, the flanking statues represent the dichotomy of Adron."

tutorialInformDE["viola"] = "Eine kluge und flei�ige Halblingsdame winkt alle, die orientierungslos wirken, mit einer fr�hlichen Begr��ung zu sich. Aus einem wettergegerbten Koffer voller Pergamente verteilt sie Fahrkarten und f�hrt Neuank�mmlinge zu den wartenden F�hren."
tutorialInformEN["viola"] = "A bright and industrious halfling eagerly intercepts any who look lost with cheerful greetings. With a weathered trunk overflowing with parchments, she hands out tickets and ushers newcomers towards waiting ferries."

tutorialInformDE["wilderness"] = "Beim �berqueren der Br�cke verliert sich der L�rm und Trubel des Hafenmarkts hinter dir. Vor dir f�hrt ein einfacher Weg hinaus in die Wildnis."
tutorialInformEN["wilderness"] = "Crossing the bridge, the noise and commotion of the harbour market is left behind and a simple path cuts into the wilderness beyond."

tutorialInformDE["hitpoints"] = "[Tutorial] Dein Charakter ist verletzt. Der rote Balken stellt die Lebensanzeige deines Charakters dar. Eine Rast wird die Gesundheit deines Charakters verbessern."
tutorialInformEN["hitpoints"] = "[Tutorial] Your character is hurt. The red bar indicates the health of your character. A rest is recommended to restore health."

tutorialInformDE["foodlevel"] = "[Tutorial] Dein Charakter wird hungrig. Der gelbe Balken zeigt dir die Ausdauer deines Charakters. Du solltest etwas essen, zum Beispiel Fr�chte."
tutorialInformEN["foodlevel"] = "[Tutorial] Your character is getting hungry. The yellow bar indicates the stamina level of your character. You better eat something, for example fruit."

tutorialInformDE["monsters"] = "[Tutorial] Ein Monster! Du kannst es mit einem Rechtsklick angreifen. Um in den Nahkampf zu gehen, bewege dich zu dem Monster."
tutorialInformEN["monsters"] = "[Tutorial] A monster! You can attack it with a right click. For engaging in melee, move close to it."

tutorialInformDE["first encounter"] = "In der Ferne siehst du eine Person, die ihren Gesch�ften nachgeht. Da du erst k�rzlich angekommen bist, ist es kaum verwunderlich, dass dir die Person auch beim N�herkommen nicht bekannt vorkommt. "
tutorialInformEN["first encounter"] = "You notice a figure in the distance going about their business. Having only recently arrived it can come as no surprise you do not recognise them as the two of you draw closer."

tutorialInformDE["end"] = "[Tutorial] Es werden keine weiteren Tutorialnachrichten angezeigt."
tutorialInformEN["end"] = "[Tutorial] No further tutorial messages will be shown."

tutorialInformDE["Have a break"] = "[Tutorial] Das Anlegen von Ausr�stung im Kampf f�hrt zu einer kurzen Unterbrechung."
tutorialInformEN["Have a break"] = "[Tutorial] Putting on equipment during combat leads to a short interruption."

tutorialInformDE["postSkip"] = "Die Ankunft eines Schiffes sorgt f�r reges Treiben. Passagiere gehen von Bord und die Ladung wird an Land geschafft. Vom S�den her sind die Rufe der Arbeiter zu vernehmen, die emsig andere Schiffe beladen. "
tutorialInformEN["postSkip"] = "The new arrival of a ship brings a frenzy of activity as passengers disembark and cargo is hauled ashore. Shouts rise from the south where other vessels are boarded and goods loaded from bustling piers."

tutorialInformDE["barrel"] = "W�hrend du die Zutaten in dem riesigen Fass umr�hrst, erf�llt der Geruch g�render �pfel deine Nase."
tutorialInformEN["barrel"] = "As you stir ingredients in the immense barrel a waft of fermenting apples fills your nostrils."

tutorialInformDE["lights"] = "[Quest 'Tutorial I' beendet] Du kannst nun die Tutorial-Quests fortsetzen, indem du zu Nimbur Goldbrew gehst, um etwas �ber das Sammeln, Handwerken und K�mpfen zu lernen."
tutorialInformEN["lights"] = "[Quest 'Tutorial I' end] You can continue the tutorial quests with Nimbur Goldbrew to learn about gathering, crafting and fighting."

tutorialInformDE["lightsStart"] = "[Quest 'Tutorial I'] Doppelklicke die Fackel um sie zu entz�nden. Die Fackel wird eine Zeit lang brennen und sobald sie ausgebrannt ist, verschwindet sie aus deinem Inventar."
tutorialInformEN["lightsStart"] = "[Quest 'Tutorial I'] To light the torch double click on it. The torch will burn for a while and once it has burnt out, it will disappear from your inventory."

tutorialInformDE["housing"] = "Eine reich verzierte Plakette ziert dieses Geb�ude."
tutorialInformEN["housing"] = "A richly decorated plaque adorns this building."

--Texts for dialogues

--Quest 336: Brewery
tutorialTextDE["brewery"] = "Um ein Handwerk auszuf�hren, muss ein daf�r vorgesehenes Werkzeug mit einem passenden statischen Werkzeug zusammen verwendet werden. Die statischen Werkzeuge k�nnen am einfachsten in den daf�r spezialisierten Reichen gefunden werden. Jedes Handwerk hat ein entsprechendes Men�, in dem alle Produkte, die dein Charakter aktuell herstellen kann, aufgelistet sind. Wenn du einen Gegenstand im Men� anklickst, siehst du ein Bild des Produkts und die zur Herstellung erforderlichen Materialien, sowie die Herstellungsdauer. Wenn du deine F�higkeiten in einer Fertigkeit verbesserst, werden dem Men� komplexere Produkte hinzugef�gt."
tutorialTextEN["brewery"] = "Crafting depends on use of a dedicated hand tool with specialist static tools. Static tools are easiest found in the two realms specialising in the relevant craft. Each craft has a menu in which all the products you are currently able to make are listed under various categories. If you highlight a product in the menu by clicking on it you will see a picture of the product and the ingredients required to make the item, along with a production time. As your skill in a craft increases, more complex products will be added to the menu."

--Quest 332: Roleplaying
tutorialTextDE["campfire"] = "Die Charaktere, denen du hier in Illarion begegnest, haben ihre eigenen Pers�nlichkeiten mit St�rken und Schw�chen, gepr�gt durch ihre Vergangenheit und angetrieben von pers�nlichen Zielen. Interagiere mit ihnen und entdecke ihre Geschichten, w�hrend du deine eigene erschaffst. Gemeinsam entscheidet ihr die Zukunft Illarions. Wenn du dich mit anderen am Lagerfeuer triffst, um von epischen Abenteuern zu berichten oder auch nur den neuesten Klatsch zu erfahren, wirst du ein Teil ihrer Geschichte ebenso wie sie Teil deiner Geschichte werden. Egal, ob eure Charaktere in der Zukunft zu Freunden oder Feinden werden, kooperatives Rollenspiel bedeutet, dass wir miteinander und nicht gegeneinander spielen."
tutorialTextEN["campfire"] = "The characters that you will encounter in Illarion all have their own personality with strengths and flaws, shaped by their past and driven by personal goals. Interact with them and discover their stories as you create your own, together you will write the future of Illarion. As you gather around a campfire to share tales of epic adventures or simply catch up on the latest gossip you become part of their story, just as they influence yours. Whether your characters become friends or foe in the future, cooperative roleplay ensures we play with each other, not against each other."

--Quest 345: Depot
tutorialTextDE["depot"] = "Hier im neutralen Gasthof zur Hanfschlinge und auch in jeder Stadt findest du ein System mit mehreren Depots zur Aufbewahrung deiner Besitzt�mer. Mit einem Doppelklick kannst du das Depot �ffnen und Gegenst�nde in die Slots hinein- und herausziehen. Jedes Reich hat sein eigenes Lagersystem. Nur die Depots auf dem Markt am Gasthof zur Hanfschlinge bieten einmal im Monat Zugang zu gelagerten G�tern au�erhalb der jeweiligen St�dte."
tutorialTextEN["depot"] = "Here at the neutral Hemp Necktie Inn, and throughout each of the towns, you will find a system of several depots for storing possessions. Access the depot by double clicking it and drag items in and out of the slots. Each realm has their own storage system with only the depots in the market at the Hemp Necktie Inn giving access to stored possessions outside the towns."

--Quest 337: Quests
tutorialTextDE["entrance"] = "Unz�hlige Wegen kreuzen sich am Gasthof zur Hanfschlinge. Reisende, H�ndler, Abenteurer und Gesetzlose, sie alle haben ihre Gr�nde vorbeizukommen. Die Taverne und ihre Umgebung bieten Gelegenheit, andere Charaktere zu treffen und ein Leben au�erhalb der Reiche zu f�hren. Dieses neutrale Territorium ist frei von den Auflagen der Stadtverwalter und ihrer Gesetze, aber es fehlen auch der Schutz und die anderen Vorteile, die die St�dte mit sich bringen. Einige Gesetzlose k�nnen aus den Reichen verbannt sein, es steht jedoch jedem frei den Gasthof zur Hanfschlinge zu betreten.\n\nViele Quests beginnen in und um diese Taverne. Achte auf GM- oder Spieler-Quests im Illarion-Launcher und auf der Website. Zahlreiche statische Quests in ganz Illarion k�nnen durch das Sprechen mit NPCs ausgel�st werden. Um deinen aktuellen Stand in den NPC-Quests zu sehen, kannst du das Questlog mit der Taste 'Q' �ffnen oder das Schriftrollensymbol in der rechten unteren Ecke des Fensters anklicken."
tutorialTextEN["entrance"] = "Countless paths cross at the Hemp Necktie Inn as travellers, traders, adventurers, and outlaws all have reason to visit. The tavern and surrounds give opportunity to meet other characters and experience life outside the realms. This neutral territory is free of the constraint of realm officials and their laws, but also lacks the same protection and benefits the towns may offer. Whilst some outlaws may be banished from the realms, all are free to enter the Hemp Necktie Inn.\n\nMany quests start in and around the Hemp Necktie Inn. Look out for planned GM or player quests on the Illarion Launcher and the website. Numerous static quests throughout Illarion can be triggered by speaking to NPCs. Once started, the quest log for these can be found by pressing 'Q' or clicking on the scroll icon in the bottom right corner of the window."

--Quest 346: Glyph forging
tutorialTextDE["glyph"] = "Magie ist eine geheimnisvolle Begabung. Das Wissen um das Arkane ist f�r die meisten verloren, daher versuchen jene mit magischem Talent die uralte Kunst des Glyphenschmiedens zu erlernen. Das rituelle Einfassen von Glyphen in Schmuck bedient sich magischer Kr�fte, die von jedem beschworen werden k�nnen. Mit etwas Gl�ck findest du vielleicht einige der magischen Scherben, die sich zu diesen kostbaren Glyphen zusammenf�gen lassen."
tutorialTextEN["glyph"] = "Magic is a mysterious calling. With the old ways of the arcane lost to many, those of talent seek a new understanding of the ancient art of glyph forging. Ritualistic forging of glyphs into jewellery harnesses magical power that can be invoked by anyone. If you are fortunate you may find some of the magical shards which combine to form these precious glyphs."

--Quest 339: Ferries
tutorialTextDE["harbour"] = "F�hren bedienen die H�fen in ganz Illarion, einschlie�lich der drei Reiche, aber sei dir im Klaren, dass sich die H�fen au�erhalb der St�dte befinden. Sie sind ein g�nstiges Transportmittel f�r Gruppen, mit einer Geb�hr von zehn Silberst�cken f�r die gesamte Gesellschaft. Der zahlende Charakter w�hlt das Ziel aus und alle berechtigten Reisenden innerhalb von f�nf Feldern um das Pult haben die M�glichkeit an der Reise teilzunehmen.\n\nWenn das deine erste Fahrt vom Hafen ist, kannst du die F�hre in das Reich deiner Wahl kostenlos nehmen. Die Stra�en von den H�fen zu den St�dten k�nnen manchmal gef�hrlich sein, aber da du neu in diesem Land bist, wirst du sicher in die Stadt deiner Wahl geleitet. Falls du noch nicht mit ihr gesprochen hast, kann Viola Baywillow dir sicherlich weitere Informationen �ber die drei Reiche Illarions geben. Bist du einem Reich beigetreten, kannst du die Entscheidung jederzeit �berdenken und die Zugeh�rigkeit zu einem sp�teren Zeitpunkt noch �ndern oder sogar ein Gesetzloser werden."
tutorialTextEN["harbour"] = "Ferries serve harbours throughout Illarion, including the three realms, but be aware these are situated outside the main towns. They are a cheap means of transportation for groups with a fee of ten silver covering the whole party. The paying character selects the destination and all eligible travellers within five tiles of the podium will be given the option to join the voyage.\n\nIf this is your first journey from the harbour you can catch a ferry to the realm of your choice for free. The roads from the harbours can sometimes be perilous, but as you are new to these lands you will be granted safe passage to the town of your choosing. If you haven't already spoken to her, Viola Baywillow can provide you with more information about the three realms of Illarion. When you join a realm you can always change allegiance at a later date, or even become an outlaw."

--Quest 356: NPCs
tutorialTextDE["henry"] = "In Illarion wirst du vielen Nicht-Spieler-Charakteren (NPCs) begegnen, die Funktionen wie Quests, Dienste und Handel anbieten. Um mit dem Mann zu sprechen, musst du die Chatbox links unten aktivieren, indem du darauf klickst oder die 'Enter'-Taste dr�ckst. Gib 'Hallo' ein, um ihn zu begr��en und dr�cke erneut 'Enter'. Alternativ kannst du NPCs auch doppelklicken, um grundlegende Gespr�chsoptionen zu aktivieren. Alle NPCs reagieren auf bestimmte Schl�sselw�rter, wenn du innerhalb von zwei Feldern um sie herum stehst. Wenn du bei der Kommunikation mit einem NPC nicht weiterkommst, kannst du um 'Hilfe' bitten um eine Liste von empfohlenen Schl�sselw�rtern zu erhalten.\n\nBefolge den Rat von Henry Cunnigan, um zu lernen, wie du Gegenst�nde ausr�stest und benutzt. Wenn du mal nicht sicher bist, was du f�r eine Quest als n�chstes tun musst, kannst du das Questlog aufrufen, indem du 'Q' dr�ckst oder auf das Schriftrollen-Symbol in der unteren rechten Ecke des Spielfensters klickst."
tutorialTextEN["henry"] = "Throughout Illarion you will encounter many non-player characters (NPCs) which support functions such as quests, services, and trade. To speak to the man, activate (green) the chat box if necessary by clicking on it or by using the 'Return' key, type 'Hello' to greet him, and hit 'Return'. Alternatively you can double click on any NPC to activate basic talk options. All NPCs react to certain keywords if you are standing within two tiles. If you get stuck trying to communicate with an NPC, asking for 'help' will provide you with a list of recommended commands.\n\nFollow Henry Cunnigan's advice to learn how to equip and use items. If you are ever unsure what you need to do next for a quest, you can find the quest log by pressing 'Q' or clicking on the scroll icon in the bottom right corner of the window."

--Quest 341: Market
tutorialTextDE["market"] = "Auf dem Markt bieten sich an den St�nden zwischen Hafen und Taverne reichlich M�glichkeiten zum Handel. Neben Angeboten f�r den t�glichen Bedarf findest du hier auch verschiedene G�ter und Dienstleistungen, die in den Reichen sonst nicht so einfach verf�gbar sind. H�ndler werden dir allerdings Preise weit unter dem Wert deiner Waren anbieten. Besser ist es Gesch�fte mit anderen Spielern zu machen, die meistens bereit sind fairere Preise zu bezahlen.\n\nDer Zugriff auf die Men�s zum Handel erfolgt durch Ansprechen des jeweiligen NPC mit den Schl�sselworten 'Handel', 'Kaufen' oder 'Verkaufen'. Solche Schl�sselw�rter sollten in S�tzen verwendet werden, die der Rolle deines Charakters entsprechen. Durch Doppelklick auf einen NPC kannst du auch grundlegende Optionen f�r ein Gespr�ch nutzen, die die pers�nliche Charakterdarstellung jedoch erheblich begrenzen."
tutorialTextEN["market"] = "The market offers bountiful trading opportunities with stalls extending from the harbour to the tavern forecourt. Whilst some basic provisions can acquired, you will also find other goods and services on offer that are less readily available in the realms. Although you will not get the best prices for selling goods to NPC traders here, you may find other trading opportunities with players that offer far greater value.\n\nRelevant trade menus can be accessed by speaking to an NPC and using a keyword such as 'trade', 'buy', or 'sell'. Such keywords should be used in a sentence in a manner appropriate for your character when speak to a trader to enhance immersion. You can also double click on any NPC to activate basic talk options but remember this will limit portrayal of characterisation."

--Quest 357: Crafting
tutorialTextDE["nimbur"] = "Illarion verf�gt �ber ein komplexes Handwerkssystem, bei dem Rohstoffe gesammelt und veredelt werden, um anschlie�end damit zahlreiche Gegenst�nde herzustellen. Diese sind auf verschiedene Handwerksfertigkeiten verteilt. Jedes Reich ist auf bestimmte Handwerke spezialisiert. Dort stehen alle daf�r notwendigen Werkzeuge zur Verf�gung, Rohstoffe sind einfach zu erlangen und der Verkauf von Waren an die H�ndler erzielt bessere Preise.\n\nBefolge die Ratschl�ge von Nimbur Goldbrew, um zu lernen, wie du Rohstoffe sammeln und Gegenst�nde herstellen kannst. Vielleicht findest du auch noch heraus, wie du dein erstes Monster erlegst!"
tutorialTextEN["nimbur"] = "Illarion has a complex crafting system based on gathering and refining raw materials which are used in the production of numerous items distributed across distinct skill-based crafts. Each realm has their speciality crafts, meaning all necessary tools are available for use, resources are more abundant, and goods trade at higher prices.\n\nFollow Nimbur Goldbrew's advice to learn how to gather resources and craft items. You may even find out how to kill your first monster!"

--Quest 353: Gathering
tutorialTextDE["orchard"] = "Das Sammeln von Rohstoffen erfordert normalerweise ein spezielles Werkzeug, aber Obst kann ohne Hilfsmittel gepfl�ckt werden. Du kannst �pfel sammeln, indem du dich vor einen Apfelbaum stellst und diesen dann doppelklickst. Die Rohstoffe sind begrenzt und sobald eine Quelle ersch�pft ist, braucht es eine gewisse Zeit, bis sie wieder aufgef�llt ist. Falls der von dir ausgew�hlte Baum nicht mehr gen�gend �pfel tr�gt oder du ein paar gegessen hast, versuch es mit einem anderen Baum. Wenn du ein Lebensmittel verwendest, wird es verbraucht und f�llt den gelben Balken in der unteren rechten Ecke des Fensters auf.\n\nBleib immer wachsam, da deine Aktionen manchmal Ereignisse ausl�sen k�nnen. Solltest du beim Obstpfl�cken ein wildes Tier st�ren, k�nntest du angegriffen werden."
tutorialTextEN["orchard"] = "Gathering resources usually requires a designated hand tool but fruit can be picked unaided. You can collect apples by standing in front of an apple tree and double clicking on it. Resource supply is limited and once exhausted a source takes time to replenish. If the tree you have selected lacks sufficient apples or you eat some, try another tree. Using a food item consumes it to replenish the yellow bar in the bottom right corner of the window.\n\nBe sure to stay alert as your actions can sometimes trigger events. Should you disturb some of the local wildlife as you are picking fruit, you could be attacked."

--Quest 354: Fighting
tutorialTextDE["orchard rat"] = "Klick mit der rechten Maustaste auf das Monster um es anzugreifen oder dr�cke die Taste 'F', um das dichteste Monster anzugreifen. Ein roter Ring markiert dein aktuelles Ziel, sowohl bei Monstern als auch bei Charakteren. Sobald ein Monster get�tet wurde, k�nnen fallengelassene Gegenst�nde gesammelt werden. Dazu kannst du die Taste 'P' dr�cken oder die Gegenst�nde einzeln mit der Maus in einen Inventarplatz ziehen. Deine Gesundheit wird durch den roten Balken in der unteren rechten Ecke des Fensters angezeigt. Wenn dein Charakter get�tet wird, k�nnen drei Gegenst�nde aus der Tasche fallen. Gegenst�nde, die der Charakter ausger�stet hat oder die sich am G�rtel befinden sind davon nicht betroffen."
tutorialTextEN["orchard rat"] = "To attack, right click on the monster or press 'F' to attack the nearest monster. A red ring highlights any monster or character you are engaged in battle with. Once a monster has been killed items dropped can be collected by pressing 'P' or dragging them into an inventory slot using the mouse. Health is indicated by the red bar in the bottom right corner of the window. If your character is killed, three items may drop from your bag, but those worn or on the belt are not at risk."

--Quest 355: Informs
tutorialTextDE["pathway"] = "Achte neben der Kommunikation mit Charakteren auch auf andere Eindr�cke, die dein Charakter auf seiner Reise wahrnimmt. Benachrichtigungen k�nnen wichtige Hinweise zur Umgebung geben, die dein Charakter betritt. Es kann daher erwartet werden, dass sie das Verhalten deines Charakters beeinflussen.\n\nRollenspiel ist der wahre Kern Illarions. Versetze dich hinein und passe das Verhalten deines Charakters der Welt um ihn herum und allem, was ihn beeinflusst, an. Ungeachtet der technischen M�glichkeiten und ihrer Grenzen, sollte dir die Auswirkung auf deinen Charakter bewusst sein, physisch wie emotional. K�mpfe bergen Risiken, Monster k�nnen furchterregend sein, NPCs k�nnten dich verpfeifen und der Tod ist niemals angenehm."
tutorialTextEN["pathway"] = "As well as communicating with other characters, be sure to note other things your character experiences on their journey. Informs can give an indication of the environment your character enters and can therefore be expected to influence the behaviour of your character.\n\nRoleplaying is the very core of Illarion. Immerse yourself, adapting the behaviour of your character to the world around them and all that influences it. Regardless of engine limits and technical possibilities, imagine the impact on your character both emotionally and physically. Fights carry risk, monsters can be scary, work is tiring, NPCs can be snitches, and death is never going to be pleasant."

--Quest 348: Teleporter
tutorialTextDE["teleporter"] = "Hier am neutralen Gasthof zur Hanfschlinge, sowie vor dem Eingang zu jeder Stadt, gibt es einen Teleporter. Mit einem Doppelklick auf das Pult kannst du ihn verwenden und f�r den Preis von f�nf Silberm�nzen in ein anderes Reich reisen. Portalb�cher k�nnen f�r zehn Silberst�cke gekauft werden und sie �ffnen an einer beliebigen Stelle ein Portal, welches dich zu einem bestimmten Teleporter zur�ckbringt. Im Vorhof der Taverne verkauft Lobely Portalb�cher an seinem Stand."
tutorialTextEN["teleporter"] = "Here at the neutral Hemp Necktie Inn, as well as outside the entrance to each of the towns, there is a teleporter. Double click on the podium to use it and for five silver you will be able to travel to another realm. Portal books can also be bought for ten silver to use anywhere on the map to transport you to a designated teleporter. Lobely sells portal books from his stall in the tavern forecourt."

--Quest 344: Religion
tutorialTextDE["temple"] = "Die Jungen G�tter dominieren das t�gliche Leben in Illarion. Jedes Reich hat drei Schutzgottheiten, jede mit einem eigenen Tempel, dem ein Priester vorsteht. Weitere Tempel und Schreine k�nnen im ganzen Land gefunden werden. Als Gott der Feste und des Weins wird Adron in der Regel von Tavernenbesitzern und ausgelassenen Nachtschw�rmern, sowie von verzweifelten Betrunkenen verehrt."
tutorialTextEN["temple"] = "The Younger Gods dominate daily life in Illarion with each realm having three patron deities, each with a dedicated temple served by a priest. Other temples and shrines can be found throughout the lands. As the god of festivities and wine, Adron is typically celebrated amongst tavern owners and their jovial revellers or desperate drunks alike."

--Quest 338: Realms
tutorialTextDE["viola"] = "Sprich mit Viola Baywillow, um mehr �ber die drei Reiche Illarions zu erfahren. Sie kann auch Auskunft �ber die Herrscher, G�tter, Motive, Handwerke und Landschaften der Reiche geben, um dir dabei zu helfen, dich f�r das Reich zu entscheiden, das am besten zu dir passt. Aber denk dran, dass Illarion eine dynamische Welt ist und sich zum Beispiel Gesetze und Politik durch den Einfluss von Spielercharakteren schnell �ndern k�nnen. Keine Sorge, falls dir dein neues Zuhause nicht gef�llt, oder nicht deinen W�nschen entspricht, kannst du jederzeit umziehen oder sogar ein Vogelfreier werden, indem du mit dem Notar deines Reiches sprichst.\n\nWenn du dich f�r Cadomyr, Galmair oder Runewick entschieden hast, folge der Stra�e nach Westen zum Hafen und nimm eine F�hre in das Reich deiner Wahl. Diese erste Fahrt ist kostenlos und du erh�ltst sicheres Geleit ins Stadtzentrum, wo dir das Tutorial weiterhin hilft, dich in deinem neuen Zuhause zurechtzufinden. Wenn du dich noch nicht bereit f�hlst, eine Wahl zu treffen, kannst du auch Trollshaven und alles, was es zu bieten hat, erkunden."
tutorialTextEN["viola"] = "Talk to Viola Baywillow to learn more of the three realms of Illarion. She can provide information on the leaders, patron gods, motives, crafts, and landscapes of the realms to help you decide which might suit your character best. Remember though, Illarion is a dynamic world and aspects such as laws and politics can rapidly change through the influence of player characters. Don't worry if you find your new home isn't to your liking, you can always change allegiance at a later date, or even become an outlaw by speaking to the realm notary.\n\nOnce you have decided to join Cadomyr, Galmair, or Runewick, follow the road west to the harbour and catch a ferry to the realm of your choice. This first journey is free and you will be granted safe passage to the centre of town where the tutorial will continue to help you find your way around your new home. If you do not feel ready to make this choice just yet you are free to explore Troll's Haven and all it has to offer."

--Quest 347: Wilderness
tutorialTextDE["wilderness"] = "In Illarion gibt es viel zu entdecken, aber du solltest nicht alleine reisen, weil dieses Land auch viele gef�hrliche Monster beherbergt. Auf deinen Reisen solltest du vorsichtig sein, insbesondere, wenn du H�hlen und Dungeons betrittst. Die Karte in der oberen rechten Ecke hilft dir zwar dich zurechtzufinden, aber du solltest trotzdem immer deine Umgebung im Auge behalten. Schau dir die Wegweiser genau an und sprich mit anderen Charakteren.\n\nWenn du das Tutorial noch nicht abgeschlossen hast, empfehlen wir dir, umzukehren und damit fortzufahren, bevor du dich weiter hinaus wagst. F�r jemanden, der neu hier ist, bieten die Reiche einen sicheren Ort. Dort kannst du dich einleben, bevor du die Karte weiter erkundest. Um dir die Wahl deines neuen Zuhauses zu erleichtern, sprich mit Viola Baywillow. Sie kann dir einige Informationen zu den drei Reichen geben."
tutorialTextEN["wilderness"] = "There is much to explore in Illarion but you may not want to travel alone as many hostile monsters also inhabit these lands. Take care on your travels and be especially careful when entering caves or dungeons. The map in the top right corner will help you navigate to some degree but be sure to take in your surroundings, check sign posts, and ask other characters.\n\nIf you haven't yet finished the tutorial, we recommend you turn back and continue with that before venturing further. For someone new to these lands the realms offer a much safer place to become established before exploring too far. Viola Baywillow can provide you with more information about the three realms to help you choose a new home."

--Quest 329: First encounter
tutorialTextDE["first encounter"] = "Du m�chtest dich vielleicht einem anderen Charakter vorstellen oder durch dein Rollenspiel eine andere Aktion deines Charakters vermitteln. Zus�tzlich zum normalen Sprechen kann dein Charakter auch rufen oder fl�stern (innerhalb von zwei Feldern h�rbar). Dazu gibst du vor deinem Text #s f�r rufen oder #w f�r fl�stern ein. Mit #me beginnst du einen Emote, mit dem du das Erscheinungsbild deines Charakters oder eine Handlung beschreiben kannst. Mit #o kannst du eine Nachricht OOC (Out Of Character) an einen anderen Spieler schicken. Diese sollten jedoch auf ein Minimum beschr�nkt werden, um die Spielatmosph�re nicht zu st�ren.\n\nWenn sich dein Charakter einem anderen vorgestellt hat, kannst du innerhalb von zwei Feldern um den anderen Charakter herum #i verwenden, damit der Namen deines Charakters anderen angezeigt wird. So kann man dich in Zukunft wieder erkennen. Wenn du mit dem Mauszeiger �ber einen Charakter f�hrst, siehst du dessen Namen und Gesundheitszustand. Die Namen von NPCs und Spielercharakteren sind gelb, Monsternamen sind dagegen rot."
tutorialTextEN["first encounter"] = "You may want to introduce yourself to another character, or perhaps convey some other action through your role play. In addition to talking normally, your character can shout by prefixing your text with #s or whisper (within two tiles) by prefixing with #w. #me invokes an emote, allowing you to convey the appearance or describe an action of your character. #o is used for out of character messages, but these should be kept to a minimum to avoid breaking the immersion.\n\nOnce you have introduced your character, #i can be used (within two tiles) to display your character's name, so they will recognise you in future. If you hover your mouse pointer over a character you will see their name and health status. NPC and player character names are yellow, while monster names are red. Double clicking on a character gives you a description of them and allows you to name them."

--Quest 340: Crafting menu
tutorialTextDE["barrel"] = "Da du erst angefangen hast, wirst du wahrscheinlich nur leicht alkoholische Getr�nke in deinem Rezeptbuch haben. �ffne die Kategorie 'Leichter Alkohol', indem du auf den vorangestellten Pfeil klickst und dann auf 'Ciderflasche', um sie auszuw�hlen. In diesem Fall wird nur eine Flasche Cider ben�tigt, aber solltest du mehrere gleichzeitig herstellen wollen, kannst du die Anzahl der zu produzierenden Produkte mit den Schaltfl�chen '+' und '-' anpassen. Starte die Produktion, indem du auf die Schaltfl�che 'Herstellen' klickst. Der Fortschrittsbalken zeigt an, wie lange es bis zum Abschluss der Herstellung dauert. Die Ciderflasche erscheint nach Fertigstellung in deiner Tasche."
tutorialTextEN["barrel"] = "As you are only starting out, you will likely only have soft liquors listed on your brewing menu. Open the 'Soft Liquors' category by clicking the prefixing arrow head and click 'Bottle of Cider' to select it. In this instance only one bottle of cider is required, but you can adjust the number of items to be produced using the '-' and '+' buttons. Start production by clicking the 'Produce' button. A progress bar will indicate how long until production is complete and your finished bottle of cider will appear in your bag once complete."

tutorialTextDE["skipYes"] = "Du hast dich dazu entschieden, das Tutorial zu �berspringen. Wenn du bereit bist, kannst du ein Boot vom Haupthafen zum Reich deiner Wahl nehmen. Die Stra�en von den H�fen weg k�nnen manchmal gef�hrlich sein, aber da du neu in diesem Land bist, wirst du sicher in die Stadt deiner Wahl eskortiert werden. Viola Baywillow kann dir bei Bedarf weitere Informationen �ber die drei Reiche Illarions geben. Bist du einem Reich beigetreten, kannst du die Entscheidung jederzeit �berdenken und die Zugeh�rigkeit zu einem sp�teren Zeitpunkt noch �ndern oder sogar ein Gesetzloser werden."
tutorialTextEN["skipYes"] = "You have decided to skip the tutorial. When you are ready you can catch a boat from the main harbour to the realm of your choice. The roads from the harbours can sometimes be perilous, but as you are new to these lands you will be granted safe passage to the town of your choosing. Viola Baywillow can provide you with more information about the three realms of Illarion should you need it. If you join a realm you can always reconsider and change allegiance at a later date, or even become an outlaw."

--Quest 325: Moving
tutorialTextDE["skipNo"] = "Du bist von Bord gegangen und machst nun deine ersten Schritte auf dem Pier. Um dich zu bewegen, klicke mit der linken Maustaste auf ein Feld auf dem Pier. Alternativ kannst du auch den Ziffernblock, die Pfeiltasten oder WASD verwenden. Um zu laufen, dr�cke die STRG-Taste oder klicke auf das Stiefel-Symbol in der unteren rechten Ecke des Spielfensters.\n\nDr�cke die F1-Taste, um eine �bersicht �ber alle Befehle anzuzeigen. Antworten auf h�ufig gestellte Fragen (FAQ) findest du auf unserer Internetseite www.illarion.org. Au�erdem erh�ltst du jederzeit Hilfe auf unserem Discord-Server unter https://discord.gg/yj3htPN oder in unserem Forum. "
tutorialTextEN["skipNo"] = "As you disembark the ship, you can take your first steps onto the pier. To move, click a tile on the pier with the left mouse button. Alternatively you can walk using the Num pad, arrow keys, or WASD. Pressing the 'CTRL' key or clicking on the boots icon in the bottom right corner of the window makes your character run.\n\nTo see an overview of all commands, press 'F1'. Answers to many frequently asked questions (FAQs) can be found on our website at www.illarion.org and you are encouraged to seek help on our Discord chat at https://discord.gg/yj3htPN or on the forum."

tutorialTextDE["skip"] = "Neuen Spielern empfehlen wir, das Tutorial zu absolvieren. Es f�hrt dich durch die ersten Schritte und macht dich mit der Steuerung vertraut. Au�erdem bietet es einige Hintergrundinformationen, die dir helfen werden, die ersten Entscheidungen f�r den weiteren Weg deines Charakters zu treffen."
tutorialTextEN["skip"] = "We recommend new players complete the tutorial to help guide their first steps, teaching the basic controls of the game and providing some background lore to help make those first decisions that determine your character's path."

tutorialTextDE["welcome"] = "Eine anstrengende Reise neigt sich dem Ende zu und die Lande Illarions locken mit neuen, aufregenden Abenteuern. Alle Charaktere, denen du w�hrend deiner Zeit hier begegnest, sind lebende, atmende Bewohner dieser mysteri�sen Welt. Gleich, ob du nun glorreiche Abenteuer als edler Ritter bestehst, das Leben eines hart arbeitenden Handwerkers f�hrst, ein Verm�gen als t�chtiger H�ndler anh�ufst, Gunst als charismatischer Priester erwirbst, mit Zauberei verbl�ffst oder dein Schicksal als Dieb besiegelst, es werden deine Taten sein, die Illarions Zukunft mit gestalten.\n\nBald wirst du vor einer Wahl stehen; vielleicht die wichtigste deines ganzen Lebens. Zieht es dich dich zu Ruhm und der Ehre nach Cadomyr, zum Reichtum und Wohlstand Galmairs oder zu der Weisheit und Magie von Runewick?"
tutorialTextEN["welcome"] = "As an arduous voyage draws to a close, a new and exciting adventure in the land of Illarion beckons. All of the characters that you will encounter during your time here are living, breathing inhabitants of this mysterious world. Whether you experience glorious adventures as a noble knight, live the life of a hardworking craftsman, earn your fortune as an acquisitive merchant, gain favour as a charismatic priest, mystify with your sorcery, or seal your fate as a devious thief, it is your deeds that shape Illarion's future.\n\nSoon you will be faced with a choice, perhaps the most important of your entire life. Will you be drawn to the honour and glory of Cadomyr, the prosperity and wealth of Galmair, or the wisdom and magic of Runewick?"

tutorialTextDE["NewbieTextCadomyr"] = "Herzlichen Gl�ckwunch! Du hast dich f�r Cadomyr, dem Reich von Ruhm und Ehre, entschieden. Vom Hafen aus wurde dir sicheres Geleit in das Stadtzentrum gew�hrt. Jemand hat die Notarin bereits von deiner Ankunft unterrichtet, so dass dein Name bereits auf die Einwohnerliste gesetzt wurde. Du hast nun die Gelegenheit Cadomyrs Zukunft mitzugestalten, ganz gleich, ob du danach strebst, geadelt zu werden oder ob es dir gen�gt, aufrichtig zu dienen."
tutorialTextEN["NewbieTextCadomyr"] = "Congratulations! You have chosen to join Cadomyr, the realm of honour and glory. Safely escorted from the harbour, you reach the centre of town. Already somebody has told the Notary of your arrival and added your name to the citizen list! Whether you strive for nobility or humbly serve, you have the opportunity to shape the future of Cadomyr."

tutorialTextDE["NewbieTaskTextCadomyr"] = "Neu in einer Stadt zu sein, ist niemals einfach. Du kennst weder die Gegend, noch die Leute, und sie kennen dich nicht. Nimm dir etwas Zeit mit anderen Charakteren zu sprechen, um mehr �ber dein neues Zuhause zu erfahren. Einige NPCs haben ein '!' �ber ihren K�pfen. Diese NPCs stellen dir Aufgaben. Falls du einmal bei einer Aufgabe nicht weiter wei�t , sieh einfach in deinen Questlogs (Q) nach. Beim Erkunden deiner Umgebung werden dir interessante Orte als rote Symbole auf der Karte angezeigt."
tutorialTextEN["NewbieTaskTextCadomyr"] = "Being new in town isn't easy. You don't know the area or the people, and they don't know you. Take some time to speak to other characters to learn more about your new home. Look out for NPCs issuing quests, indicated by a '!' above their head. If you are ever unsure how to proceed with a quest, refer your quest log (Q). As you explore your new home, you will find many interesting places marked on your map with a red symbol."

tutorialTextDE["NewbieTextRunewick"] = "Herzlichen Gl�ckwunsch! Du hast dich f�r Runewick, dem Reich der Weisheit und der Magie, entschieden. Vom Hafen aus wurde dir sicheres Geleit in das Stadtzentrum gew�hrt. Jemand hat die Notarin bereits von deiner Ankunft unterrichtet, so dass dein Name bereits auf die Einwohnerliste gesetzt wurde. Es liegt nun auch an dir, die Zukunft Runewicks mitzugestalten. Ganz gleich, ob du in die akademische Elite aufsteigen oder die Felder bestellen m�chtest."
tutorialTextEN["NewbieTextRunewick"] = "Congratulations! You have chosen to join Runewick, the realm of wisdom and magic. Safely escorted from the harbour, you reach the centre of town. Already somebody has told the Notary of your arrival and added your name to the citizen list! Whether you ascend to the academic elite or nurture the fields, you have the opportunity to shape the future of Runewick."

tutorialTextDE["NewbieTaskTextRunewick"] = "Neu in einer Stadt zu sein, ist niemals einfach. Du kennst weder die Gegend, noch die Leute, und sie kennen dich nicht. Nimm dir etwas Zeit mit anderen Charakteren zu sprechen, um mehr �ber dein neues Zuhause zu erfahren. Einige NPCs haben ein '!' �ber ihren K�pfen. Diese NPCs stellen dir Aufgaben. Falls du einmal bei einer Aufgabe nicht weiter wei�t , sieh einfach in deinen Questlogs (Q) nach. Beim Erkunden deiner Umgebung werden dir interessante Orte als rote Symbole auf der Karte angezeigt."
tutorialTextEN["NewbieTaskTextRunewick"] = "Being new in town isn't easy. You don't know the area or the people, and they don't know you. Take some time to speak to other characters to learn more about your new home. Look out for NPCs issuing quests, indicated by a '!' above their head. If you are ever unsure how to proceed with a quest, refer your quest log (Q). As you explore your new home, you will find many interesting places marked on your map with a red symbol."

tutorialTextDE["NewbieTextGalmair"] = "Herzlichen Gl�ckwunsch! Du hast dich f�r Galmair, das Reich des Wohlstands und des Reichtums, entschieden. Jemand hat den Notar bereits von deiner Ankunft unterrichtet, so dass dein Name bereits auf die Einwohnerliste gesetzt wurde. Egal, ob du daran arbeiten m�chtest, deinen Einfluss zu vergr��ern, oder ob du dich in der Werkstatt abm�hen m�chtest, du hast die M�glichkeit Galmairs Zukunft mitzugestalten."
tutorialTextEN["NewbieTextGalmair"] = "Congratulations! You have chosen to join Galmair, the realm of prosperity and wealth. Safely escorted from the harbour, you reach the centre of town. Already somebody has told the Notary of your arrival and added your name to the citizen list! Whether you invest to influence or toil in the workshops, you have the opportunity to shape the future of Galmair."

tutorialTextDE["NewbieTaskTextGalmair"] = "Neu in einer Stadt zu sein, ist niemals einfach. Du kennst weder die Gegend, noch die Leute, und sie kennen dich nicht. Nimm dir etwas Zeit mit anderen Charakteren zu sprechen, um mehr �ber dein neues Zuhause zu erfahren. Einige NPCs haben ein '!' �ber ihren K�pfen. Diese NPCs stellen dir Aufgaben. Falls du einmal bei einer Aufgabe nicht weiter wei�t , sieh einfach in deinen Questlogs (Q) nach. Beim Erkunden deiner Umgebung werden dir interessante Orte als rote Symbole auf der Karte angezeigt."
tutorialTextEN["NewbieTaskTextGalmair"] = "Being new in town isn't easy. You don't know the area or the people, and they don't know you. Take some time to speak to other characters to learn more about your new home. Look out for NPCs issuing quests, indicated by a '!' above their head. If you are ever unsure how to proceed with a quest, refer your quest log (Q). As you explore your new home, you will find many interesting places marked on your map with a red symbol."

--Quest 320: Explorer stone
tutorialTextDE["explorer"] = "Auf das gesamte Spiel verteilt, kannst du Markierungssteine finden. Wenn du diese Steine doppelt anklickst und somit sammelst, bekommst du Punkte. Wenn du eine bestimmte Anzahl von Punkten gesammelt hast, bekommst du eine Belohnung.\n\nVersuche es einmal und klicke doppelt auf den Markierungsstein."
tutorialTextEN["explorer"] = "Throughout the game you can find marker stones. If you double click a stone, and therefore collect it, you will get points for it. When you collect a specific number of stones you will get a reward.\n\nTry it now and double click the marker stone."

--Quest 359: Housing
tutorialTextDE["housing"] = "In ganz Illarion gibt es Grundst�cke, auf denen gebaut werden darf. Hierzu musst du das Grundst�ck zun�chst anmieten und regelm��ig Pacht bezahlen. Wende dich an einen Anf�hrer deiner Stadt oder einen Gamemaster. Du ben�tigst weiterhin eine Baukelle, welche ein Schmied herstellen kann oder die auf dem Marktplatz gekauft werden kann."
tutorialTextEN["housing"] = "Throughout Illarion there are plots of land on which you can build. You must first rent the land and pay regular rent. To do this, contact a leader of your city or a Gamemaster. You also need a construction trowel, which can be crafted by a blacksmith or bought at the marketplace."

--NPC texts outside .npc files

tutorialTalkDE["lights"] = "Du solltest jetzt sicher deinen Weg fortsetzen k�nnen, also trennen sich unsere Wege hier. Folge dem Pfad nach S�den und stelle dich dem Zwerg Nimbur Goldbrew vor. Er braut die feinsten Getr�nke f�r den Gasthof zur Hanfschlinge und wird dir sicherlich mehr �ber das Leben in Illarion erz�hlen k�nnen."
tutorialTalkEN["lights"] = "You should safely be able to see your way around now, so this is where we part company. Take the path south and introduce yourself to the dwarf Nimbur Goldbrew. He brews the finest beverages for the Hemp Necktie Inn and is sure to tell you a bit about life in Illarion."

tutorialTalkDE["lightsStart"] = "Das Licht der Fackel kann deinen Weg erleuchten. Man kann niemals vorsichtig genug sein, weil gef�hrliche Kreaturen in den Schatten lauern. Also pass auf, dass du immer eine Lichtquelle bei dir tr�gst, wenn die Nacht anbricht oder wenn du eine der zahlreichen H�hlen und Tunnel in Illarion erkundest. Solltest du mehr Fackeln brauchen, sprich mit Hook Gowan hier auf dem Markt von Trollshaven oder such einen Schreiner auf."
tutorialTalkEN["lightsStart"] = "A simple strike of a torch can light your path. You can never be too careful as dangerous creatures can lurk in the shadows, so make sure you have a source of light whenever darkness falls or you explore one of the many caves or dungeons scattered across Illarion. Should you need more torches, speak to Hook Gowan in the market here at Troll's Haven, or seek out a carpenter."

--General functions

function M.getTutorialInformDE(location)
    return tutorialInformDE[location] or false
end

function M.getTutorialInformEN(location)
    return tutorialInformEN[location] or false
end

function M.getTutorialTextDE(location)
    return tutorialTextDE[location] or false
end

function M.getTutorialTextEN(location)
    return tutorialTextEN[location] or false
end

function M.getTutorialTalkDE(location)
    return tutorialTalkDE[location] or false
end

function M.getTutorialTalkEN(location)
    return tutorialTalkEN[location] or false
end

function M.tutorialDialog(Character,questID,location)
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(questID) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(questID, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            local informDE = M.getTutorialInformDE(location)
            local informEN = M.getTutorialInformEN(location)
            if informDE and informEN then
                Character:inform(informDE,informEN)
            end
            Character:setQuestProgress(questID, 2) --remember that the dialog was read
        end --end callback
        local textDE = M.getTutorialTextDE(location)
        local textEN = M.getTutorialTextEN(location)
        local dialogText = common.GetNLS(Character,textDE,textEN)
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

--Faction selection dialog at bookrest
function M.NewbieSelectionBookrest(Character)

    local callback = function(dialog)
        if dialog:getSuccess() then
            if dialog:getSelectedIndex() == 0 then
                M.NewbieWarp(Character,"Cadomyr")
            elseif dialog:getSelectedIndex() == 1 then
                M.NewbieWarp(Character,"Runewick")
            elseif dialog:getSelectedIndex() == 2 then
                M.NewbieWarp(Character,"Galmair")
            end
        end
    end

    local dialogText = common.GetNLS(Character,"Welchem Reich m�chtest du beitreten? Du kannst deine Entscheidung jederzeit beim Notar der Stadt revidieren. Du kannst auch jederzeit zu diesem Ort zur�ckkehren. Das Tutorial wird mit einer Einf�hrungsqueste weitergehen, bei der du deine neue Heimat n�her kennenlernen wirst.","Which realm would you like to join? You can change your decision anytime at the town's notary office. You can also return to this place anytime. The tutorial will continue with a quest to explore the realm.")
    local dialog = SelectionDialog("Tutorial", dialogText, callback)
    dialog:setCloseOnMove()
    dialog:addOption(2701,common.GetNLS(Character,"Cadomyr","Cadomyr"))
    dialog:addOption(105,common.GetNLS(Character,"Runewick","Runewick"))
    dialog:addOption(61,common.GetNLS(Character,"Galmair","Galmair"))
    Character:requestSelectionDialog(dialog)

end

--Faction selection
function M.NewbieWarp(Character,destinationString)

    if destinationString ~= "Cadomyr" and destinationString ~= "Runewick" and destinationString ~= "Galmair" then
        Character:inform("[Fehler] Ung�ltige Fraktion.","[Error] Invalid faction.")
        return
    end

    local destination = {}
    destination["Cadomyr"] = position(126,596,0)
    destination["Runewick"] = position(931,818,0)
    destination["Galmair"] = position(367,258,0)

    local factionID = {}
    factionID["Cadomyr"] = 1
    factionID["Runewick"] = 2
    factionID["Galmair"] = 3

    -- Build the dialogs
    local callbackNewbie = function(dialogNewbie)
        local callbackNewbieTask = function(dialogNewbieTask) end
        local dialogNewbieTaskTitle = common.GetNLS(Character, "Einf�hrung", "Introduction")
        local dialogNewbieTaskText = common.GetNLS(Character, M.getTutorialTextDE("NewbieTaskText"..destinationString), M.getTutorialTextEN("NewbieTaskText"..destinationString))
        local dialogNewbieTask = MessageDialog(dialogNewbieTaskTitle, dialogNewbieTaskText, callbackNewbieTask)
        Character:requestMessageDialog(dialogNewbieTask)
    end
    local dialogNewbieText = common.GetNLS(Character, M.getTutorialTextDE("NewbieText"..destinationString), M.getTutorialTextEN("NewbieText"..destinationString))
    local dialogNewbie = MessageDialog("Tutorial", dialogNewbieText, callbackNewbie)

    -- We send a message box
    Character:requestMessageDialog(dialogNewbie); --sending the dialog box to tell that the tutorial is finished
                                                      --the callback of this box contains the dialog box telling to visit special places

    --Warping the character
    world:gfx(41,Character.pos)
    world:makeSound(13,Character.pos)
    Character:warp(destination[destinationString])
    world:makeSound(13,Character.pos)
    world:gfx(41,Character.pos)
    Character.movepoints = Character.movepoints-20

    -- We start the introduction LTE
    local found = Character.effects:find(37)
    if not found then
        Character.effects:addEffect(LongTimeEffect(37, 10))
        Character:setQuestProgress(46,1) --start the quest
    end

    -- We tell other players about our new players
    local playerlist = world:getPlayersOnline();

    for i = 1, #(playerlist) do
        local FactionStuff = factions.getFaction(playerlist[i])
        if FactionStuff.tid == factionID[destinationString] then --Other faction members are alerted
            common.InformNLS(playerlist[i],"[New player] Ein neuer Spieler ist gerade deinem Reich beigetreten.","[New player] A new player has just joined your realm.");
        end
    end

    -- We make the new player a faction member
    Character:setQuestProgress(199,factionID[destinationString]);
    factions.setRankpoints(Character,0);
    Character:setQuestProgress(323,1) --Remember player has chosen a faction.
end

return M
