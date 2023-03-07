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

-- Introduction LTE
-- by Estralis
-- EffectID = 37
-- Quest status = 44 (places), 45 (greeting), 46 (overall status)

local common = require("base.common")
local factions = require("base.factions")

local M = {}

function M.initWaypoint(User)

    --[[This is a list of places the player should visit during the introduction. The order does not matter.
    1: Depot
    2: Market
    3: Workshop
    4: Pillar of Resurrection
    5: Money Changer
    6: Notary
    7: Treasurer
    8: Faction leader
    9: Gate/guard
    10: Teleporter
    11: Temple 1
    12: Temple 2
    13: Temple 3
    ]]

    local waypoint = {}
    local waypointNameG = {}
    local waypointNameE = {}
    local waypointRadius = {}

    if factions.isCadomyrCitizen(User) then

        waypoint = {
        position(133, 626, 0),
        position(118, 606, 0),
        position(140, 587, 0),
        position(102, 562, 0),
        position(98, 567, 0),
        position(106, 553, 0),
        position(116, 519, 0),
        position(122, 521, 0),
        position(120, 642, 0),
        position(127, 647, 0),
        position(142, 564, 0),
        position(146, 677, 1),
        position(176, 761, 0)}

        waypointRadius = {3, 7, 5, 3, 3, 3, 3, 3, 3, 3, 5, 5, 5}

        waypointNameG = {
        "Depot",
        "Markt",
        "Werkstatt",
        "S�ule der Auferstehung",
        "Geldwechsler",
        "Notar",
        "Schatzmeister",
        "K�nigin Rosaline Edwards",
        "Torwache",
        "Teleporter",
        "Tempel des Zhambra",
        "Tempel des Malach�n",
        "Tempel der Sirani"}

        waypointNameE = {
        "Depot",
        "Market",
        "Workshop",
        "Pillar of Resurrection",
        "Money Changer",
        "Notary",
        "Treasurer",
        "Queen Rosaline Edwards",
        "Guard",
        "Teleporter",
        "Temple of Zhambra",
        "Temple of Malach�n",
        "Temple of Sirani"}

    elseif factions.isRunewickCitizen(User) then

        waypoint = {
        position(898, 817, 0),
        position(946, 834, 0),
        position(957, 824, 0),
        position(918, 775, 0),
        position(956, 829, 0),
        position(947, 784, 1),
        position(944, 784, 1),
        position(1002, 813, 0),
        position(865, 814, 0),
        position(836, 813, 0),
        position(968, 784, 1),
        position(919, 827, 0),
        position(802, 797, 0)}

        waypointRadius = {3, 5, 3, 3, 3, 3, 3, 3, 3, 3, 5, 5, 5}

        waypointNameG = {
        "Depot",
        "Markt",
        "Werkstatt",
        "S�ule der Auferstehung",
        "Geldwechsler",
        "Notar",
        "Schatzmeister",
        "Erzmagier Elvaine Morgan",
        "Torwache",
        "Teleporter",
        "Tempel der Elara",
        "Tempel des Adron",
        "Tempel der Oldra"}

        waypointNameE = {
        "Depot",
        "Market",
        "Workshop",
        "Pillar of Resurrection",
        "Money Changer",
        "Notary",
        "Treasurer",
        "Archmage Elvaine Morgan",
        "Guard",
        "Teleporter",
        "Temple of Elara",
        "Temple of Adron",
        "Temple of Oldra"}

    elseif factions.isGalmairCitizen(User) then

        waypoint = {
        position(395, 240, 0),
        position(364, 271, 0),
        position(384, 274, 0),
        position(345, 266, 0),
        position(374, 229, 0),
        position(404, 263, 1),
        position(341, 218, 0),
        position(337, 215, 0),
        position(415, 248, 0),
        position(424, 246, 0),
        position(312, 232, 1),
        position(299, 265, -5),
        position(385, 262, -6)}

        waypointRadius = {3, 7, 5, 3, 3, 3, 3, 3, 3, 3, 5, 5, 5}

        waypointNameG = {
        "Depot",
        "Markt",
        "Werkstatt",
        "S�ule der Auferstehung",
        "Geldwechsler",
        "Notar",
        "Schatzmeister",
        "Don Valerio Guilianni",
        "Torwache",
        "Teleporter",
        "Tempel des Irmorom",
        "Tempel des Narg�n",
        "Tempel des Ronagan"}

        waypointNameE = {
        "Depot",
        "Market",
        "Workshop",
        "Pillar of Resurrection",
        "Money Changer",
        "Notary",
        "Treasurer",
        "Don Valerio Guilianni",
        "Guard",
        "Teleporter",
        "Temple of Irmorom",
        "Temple of Narg�n",
        "Temple of Ronagan"}

    end

    return waypoint, waypointRadius, waypointNameG, waypointNameE
end

function M.initText(User)

    local informTextG = {}
    local informTextE = {}
    local dialogTextG = {}
    local dialogTextE = {}

    if factions.isCadomyrCitizen(User) then

        informTextG = {
        "Eine goldene verzierte Kiste thront in Cadomyr, schimmernd mit Energie und scheinbar voll mit unersch�pflichen Reicht�mern.",
        "Feine Kleidung, funkelnde Glaswaren und filigrane T�pferei schm�cken die Marktst�nde von Cadomyr. Kaufleute, die in der W�stenhitze schuften, preisen ihre Waren als ihrer geliebten K�nigin w�rdig an.",
        "Die schwelende Hitze der riesigen Brenn- und Schmelz�fen von Cadomyrs T�pfern und Glasbl�sern f�llt die stickige Werkst�tten. Im benachbarten Raum spinnen Schneider rhythmisch Garn und weben Stoffe zum N�hen.",
        "Licht bricht sich, als es auf das kunstvoll geschnitzte Kreuz trifft, und l�sst den umgebenen Marmor funkeln. Die Luft flimmert und knistert vor Energie.",
        "In den Gassen Cadomyrs z�hlt eine bescheidene Frau flei�ig M�nzen in Stoffs�ckchen. Gelegentlich tauscht sie unauff�llig mit vor�bergehenden B�rgern M�nzen ohne viele Worte dar�ber zu verlieren.",
        "Eine w�rdige Frau sitzt an einem Schreibtisch und ordnet Akten. Zwei schimmernde rot-wei�e Banner Cadomyrs rahmen sie, ein Hinweis, dass sie ein Beamter des Reiches ist.",
        "Ein strenger Mann beobachtet sorgf�ltig die Spendenplattform und alle, die den Thronraum besuchen. Zwei schimmernde rot-wei�e Banner Cadomyrs flankieren ihn, ein Hinweis auf seine Bedeutung f�r das Reich.",
        "Eine stolze und sch�ne Frau tr�gt eine Krone im Thronsaal des K�nigspalastes. Zweifellos ist sie K�nigin Rosaline Edwards, die gerechte und ehrgeizige Herrscherin Cadomyrs.",
        "Ein imposanter und schwer gepanzerter W�chter steht vor dem gro�en Tor zu Cadomyr und �berpr�ft all jene, die versuchen, �ber die Br�cke zu gehen.",
        "Die Luft knistert mit Energie um ein kunstvoll verziertes Marmorpodium. Ein sonnengebleichtes Pergament mit einer Liste von Zielen liegt auf dem Podium.",
        "Reihen glorreicher Reiter bilden eine Ehrenwache, die zu einem Altar f�hrt. Er wird flankiert von zwei gepanzerten Statuen, die edle, junge Soldaten darstellen, die die Tapferkeit und Kameradschaft des Zhambra verk�rpern.",
        "Gelegentlich tr�gt der Wind das ferne Heulen eines Wolfs herbei und pfeift �ber den den bescheiden geschm�ckten Tempel. Bewacht von gepanzerten Statuen steht er f�r die w�rdige Ehre Malach�ns.",
        "Der einst wundersch�ne Oasentempel liegt in Tr�mmern, wobei nur der Altar intakt geblieben ist. Doch der Trost Siranis kann noch von einem offenen Herzen empfangen werden."}

        informTextE = {
        "A highly embellished golden chest sits prominently in Cadomyr, shimmering with energy and seemingly harbouring remarkable depths.",
        "Fine clothing, sparkling glassware, and intricate pottery adorn the market stalls of Cadomyr as merchants toiling in the desert heat proclaim their wares to be worthy of their beloved Queen.",
        "Suffocating heat from the vast kilns and ovens of Cadomyr's potters and glassblowers fills the sweltering workshops, whilst tailors rhythmically spin thread and weave cloth for stitching in the neighbouring room.",
        "Light splits as it strikes the ornately carved cross, colour falling to the sparkling marble surround as the atmosphere shimmers and crackles with energy.",
        "In the backstreets of Cadomyr a humble woman diligently counts coins into cloth bags. On occasion she inconspicuously exchanges coins with passing citizens with barely a few words passing between them.",
        "A dignified woman sits at a desk neatly ordering ledgers. Two shimmering red and white banners of Cadomyr frame her, an indication she is an official of the realm.",
        "A stern man keeps careful watch on the donation platform and all those that visit it in the Throne Room. Two shimmering red and white banners of Cadomyr flank him, an indication of his importance to the realm.",
        "A proud, yet beautiful, woman wears a crown in the Throne Room of the Royal Palace. Undoubtedly she is Queen Rosaline Edwards, the righteous and ambitious ruler of Cadomyr.",
        "An imposing and heavily armoured guard stands to attention before the grand entrance to Cadomyr, scrutinising all those who try to pass over the bridge.",
        "The air crackles with energy around an ornate marble podium. A sun-bleached pell sits on the podium listing a number of destinations.",
        "Lines of glorious mounted riders form a guard of honour leading to an altar, flanked by two armoured figures that depict a noble young soldier who epitomises the bravery and camaraderie of Zhambra.",
        "On occasion, the distant howl of a wolf might be carried on winds whistling through the modestly adorned mountain-top temple guarded by armoured statues that encapsulate the dignified honour of Malach�n.",
        "The once beautiful oasis temple lies in ruins with only the altar remaining intact, yet the comfort of Sirani may still be felt by those with an open heart."}

        dialogTextG = {
        "Es befinden sich mehrere Depots in Cadomyr. Jedes gibt dir Zugriff auf deine eingelagerten Gegenst�nde. Greife auf das Depot zu, indem du darauf doppelklickst und Gegenst�nde in und aus den Slots ziehst. Jedes Reich und der neutrale Gasthof zur Hanfschlinge hat sein eigenes Depotsystem.",
        "Der Markt beherbergt eine F�lle von H�ndlern, die von Rohstoffen bis hin zu feinsten Kunsthandwerk alles kaufen und verkaufen. Gegenst�nde der prim�ren Handwerk k�nnen zu einem Zehntel ihres Wertes verkauft werden. Dies wird durch die Goldm�nze im Handelsmen� angezeigt. Gegenst�nde der sekund�ren Handwerke k�nnen zu einem Zwanzigstel ihres Wertes verkauft werden, was durch die Silberm�nze im Handelsmen� angezeigt wird.",
        "Die prim�ren Handwerke Glasbl�serei, T�pfern und Schneidern werden durch statische Werkzeuge, Ressourcen, H�ndler und Gilden in Cadomyr voll unterst�tzt. Sekund�res Handwerk wird nur teilweise mit statischen Werkzeugen, begrenzten Ressourcen und schlechteren Handelsm�glichkeiten unterst�tzt. Die meisten statischen Werkzeuge k�nnen in oder um die Werkst�tten gefunden werden. Bewege deine Maus �ber ein Werkzeug, um herauszufinden, f�r was es verwendet werden kann.",
        "Solltest du das Pech haben, niedergestreckt zu werden, gibt es eine Chance, dass Cherga, die G�ttin der Geister und die Unterwelt, dir den Eintritt in ihr Reich verweigern wird. Es gibt noch so viel f�r dich in Illarion zu erleben und du wirst am Auferstehungspfeiler deines Reiches wiederbelebt. Du wirst dich schwach f�hlen, also gib dir Zeit, dich zu erholen.",
        "Kupfer-, Silber- und Goldm�nzen werden in ganz Illarion verwendet. Einhundert Kupferm�nzen k�nnen gegen eine Silberm�nze getauscht werden und hundert Silberm�nzen k�nnen durch den Geldwechsler Cassandra Hestan gegen eine Goldm�nze getauscht werden.",
        "Sprich mit dem Notar Reret Odohir, wenn du dich Cadomyr anschlie�en oder es verlassen willst. Du kannst auch herausfinden, was dein Rang als B�rger Cadomyrs ist. Du kannst deinen Rang verbessern und in der Gunst der K�nigin aufsteigen, indem du die von den NPCs in Cadomyr herausgegebenen Quests abschlie�t oder Rangpunkte von einem Gamemaster f�r deinen Beitrag zum Reich empf�ngst.",
        "Gemeinsam mit Steuerzahlungen tragen Spenden zum Reichtum deines Reiches bei und bestimmen die Anzahl der magischen Edelsteine, die unter den B�rgern verteilt werden. Gespendet wird durch die Platzierung eines Gegenstandes oder M�nzen auf der Spendenplattform. Gegenst�nde z�hlen hierbei einen Zehntel ihres Wertes.",
        "Der Herrscher eines Reiches kann von einem der Gamemaster gespielt werden, um an Veranstaltungen teilzunehmen und mit den Untertanen zu interagieren. Wenn du eine Nachricht f�r die K�nigin hinterlassen m�chtest, kannst du den entsprechenden Gamemaster �ber den Forenaccount Rosaline Edwards kontaktieren. Bedenke, dass jedes Reich seine eigene Sitten und Br�uche entwickelt hat, also solltest du versuchen, herauszufinden, was von den B�rgern erwartet wird. Oft wird der Herrscher eines Reiches von einigen Spielercharakteren unterst�tzt, die sich ihren Weg in einflussreiche Positionen erarbeitet haben.",
        "Horatio Milenus ist eine loyale Wache der K�nigin Rosaline Edwards und wird es nur den Ehrenhaften erlauben, durch die Tore von Cadomyr zu schreiten. Hinter den Toren ist Cadomyr ein sicherer Zufluchtsort vor den Gefahren, den die Wache gegen Monster verteidigt. Solltest du bei der K�nigin oder ihren Beamten in Misskredit geraten, wirst du m�glicherweise aus dem Reich verbannt und Horatio wird dich abweisen.",
        "Ein Teleporter findet sich au�erhalb des Eingangs zu jeder Stadt und dem neutralen Gasthof zur Hanfschlinge. Doppelklicke auf das Podium, um es zu benutzen und f�r f�nf Silberst�cke in ein anderes Reich zu reisen. Portalb�cher k�nnen auch f�r zehn Silberst�cke gekauft werden und �berall benutzt werden, um dich zu einem bestimmten Teleporter zu transportieren. In Cadomyr verkauft Evera Portalb�cher in der Stube des Wachtmeisters im Osten, hinter dem Tor.",
        "Die Jungen G�tter beherrschen das t�gliche Leben in Illarion. Zhambra ist einer der drei Schutzg�tter von Cadomyr. Als Gott der Freundschaft und des Vertrauens werden seine gerechten Absichten unter den Gl�ubigen Cadomyrs hoch gesch�tzt.",
        "Die elf Jungen G�tter haben mehr Anh�nger als die f�nf Alten G�tter. Malach�n ist einer der drei Schutzg�tter von Cadomyr. Als der Gott Jagd und der Schlachten werden seine Tapferkeit und sein starkes Gerechtigkeitsgef�hl von den Gl�ubigen Cadomyrs verehrt.",
        "Jedes Reich hat drei Schutzg�tter. Sirani ist eine der drei Schutzg�tter von Cadomyr. Unter den Gl�ubigen von Cadomyr werden nur wenige die Sch�nheit der G�ttin der Liebe und der Freude in ihrer K�nigin nicht erkennen."}

        dialogTextE = {
        "You will find several depots around Cadomyr, each giving you access to your stored possessions. Access the depot by double clicking it and drag items in and out of the slots. Each realm and the neutral Hemp Necktie Inn have their own storage system.",
        "The market contains a wealth of traders buying and selling anything from raw materials to the finest crafted products. Items can be sold at a tenth of their value in the primary crafting realm, indicated by the gold coin in the trading menu. They can only be sold at a twentieth of their value in the secondary crafting realm, indicated by the silver coin in the trading menu.",
        "The primary crafts of glass blowing, pottery, and tailoring are fully supported with static tools, resources, merchants, and guilds in Cadomyr. Secondary crafts are only partially supported with static tools, limited resources and poorer trading opportunities. Most static tools are found in or around the workshops. Hover over a tool to find out what it should be used for.",
        "Should you be unfortunate enough to perish there is every chance Cherga, the goddess of spirits and the underworld, will deny you entry to her realm as there is still so much for you to experience in Illarion. Returned to the resurrection pillar of you chosen realm you will find yourself weak so give yourself time to recover.",
        "Copper, silver and gold coins are used throughout Illarion. One hundred copper coins can be exchanged for one silver coin and one hundred silver coins can be exchanged for a gold coin by the Money Changer, Cassandra Hestan.",
        "Speak to the Notary Reret Odohir if you wish to join or leave Cadomyr, find out what your rank is as a citizen of Cadomyr. You can improve your rank and advance in the Queen's favour by completing quests issued by NPCs in Cadomyr or by receiving rank points from a Game Master for your contribution to the realm.",
        "Together with tax returns, donations made to the realm contribute to faction wealth and determine the number of magic gems distributed between citizens. A donation is made by placing an item or coins on the donation platform. Donated items contribute a tenth of their value.",
        "The faction ruler may be played by one of the Game Masters on occasions to attend events and interact with their subjects. If you wish to leave a message for the Queen you can contact the relevant Game Master via the forum account Rosaline Edwards. Be aware though each realm has developed their own customs and etiquette so you should try to find out what is expected of citizens. Often the faction ruler will be supported by a number of player characters who have worked their way into positions of influence.",
        "Horatio Milenus is a loyal guard of Queen Rosaline Edwards and will only allow the respectable to pass through Cadomyr's gates. Behind the gates, Cadomyr is a safe haven from the dangers beyond as the guard will defend against any monsters. Should you displease the Queen or her officials, however, you may find yourself banned from the realm and then Horatio will see you do not enter either.",
        "A teleporter can be found outside the entrance to each town and the neutral Hemp Necktie Inn. Double click on the podium to use it and for five silver you will be able to travel to another realm. Portal books can also be bought for ten silver to use anywhere on the map to transport you to a designated teleporter. In Cadomyr, Evera sells portal books from the Sergeant's Room to the east, just inside the gates.",
        "The Younger Gods dominate daily life in Illarion. Zhambra is one of the three patron deities of Cadomyr. As the god of friendship and loyalty his righteous intentions are held in high esteem amongst the faithful of Cadomyr.",
        "The eleven Younger Gods have more followers than the five Elder Gods. Malach�n is one of the three patron deities of Cadomyr. As the god of battle and hunting, his valour and strong sense of justice are revered by the honourable of Cadomyr.",
        "Each realm has three patron deities. Sirani is one of the three patron deities of Cadomyr. Amongst the faithful of Cadomyr, few will not recognise the beauty of the goddess of love and pleasure in their Queen."}

    elseif factions.isRunewickCitizen(User) then

        informTextG = {
        "Eine goldene verzierte Kiste thront in Runewick, schimmernd mit Energie und scheinbar voll mit unersch�pflichen Reicht�mern.",
        "Das k�stliche Aroma von Backwaren erf�llt den Markt, w�hrend Schreiner fein geschnitzte Waren verkaufen. Kaufleute rollen F�sser in Richtung der Taverne und erkl�ren ihr Gebr�u zum Leibtrunk des Erzmagiers.",
        "Holzsp�ne bedecken den Werkstattboden wo Schreiner rhythmisch Holz s�gen und hobeln. Ein k�stliches Aroma von Backwaren, k�chelnden Suppen und Gebr�u str�mt aus der gro�en K�che herr�ber.",
        "Licht bricht sich, als es auf das kunstvoll geschnitzte Kreuz trifft, und l�sst vier dunkle S�ulen funkeln. Die Luft flimmert und knistert vor Energie.",
        "Ein gewissenhaft Mann z�hlt flei�ig M�nzen und f�hrt mit gro�er Genauigkeit Buch �ber Transaktionen. H�flich tauscht er an seinem Tisch M�nzen mit den B�rgern, die den Markt Runewicks besuchen.",
        "Eine flei�ige Frau sitzt umgeben von Pergamenten, und schreibt etwas in einen dicken Band. Zu ihrer Seite steht das blau-graue Banner von Runewick, ein Hinweis, dass sie ein Beamter des Reiches ist.",
        "Ein t�chtiger Elf nimmt sorgf�ltig alle Spenden auf der Plattform neben ihm auf. Dahinter gibt das hoch aufragende blau-graue Banner von Runewick einen Hinweis auf seine Bedeutung f�r das Reich.",
        "Ein Elf studiert tief in Gedanken unz�hlige Artefakte und Schriftrollen in seiner abgeschiedenen Inselvilla. Zweifellos ist er Erzmagier Elvaine Morgan, der weise und erleuchtete Herrscher Runewicks.",
        "Ein in Leder gekleideter Waldl�ufer mit vollem K�cher und Bogen im Anschlag beobachtet den Wald vor ihm und �berpr�ft all jene, die versuchen, die Br�cke zu Runewick zu �berqueren.",
        "Die Luft knistert mit Energie um ein kunstvoll verziertes Marmorpodium. Ein aufwendig beschriebenes Pergament mit einer Liste von Zielen liegt auf dem Podium.",
        "Eingebettet in eine ruhige Ecke der riesigen Bibliothek, umgeben von B�chern und Manuskripten, dient ein einfacher Tisch als bescheidener Altar, der die Zur�ckhaltung und Weisheit Elaras repr�sentiert.",
        "Vor verworrenen Reben, die reichhaltige Trauben tragen und von schweren F�ssern des feinsten Gebr�ue flankiert sind, dominiert ein protziger Altar die heimelige Taverne. Dies ist ein Ort vieler Feierlichkeiten welche Adron w�rdig sind.",
        "Geschnitzte Holzs�ulen, die von verworrenen Reben umgeben sind, sch�tzen einen bescheidenen Altar. Er ist umgeben von �ppigen Blumen, die das Leben verk�rpern, das Oldra bringt."}

        informTextE = {
        "A highly embellished golden chest sits prominently in Runewick, shimmering with energy and seemingly harbouring remarkable depths.",
        "A delicious aroma of baked goods fills the market as carpenters sell finely carved wares and merchants haul barrels towards the tavern declaring their brews to be a favourite of the Archmage.",
        "Wood shavings litter the workshop floor as carpenters rhythmically saw and plane timber, whilst a delicious aroma of baked goods, simmering soups and brewing beverages drifts out from the vast kitchen.",
        "Light splits as it strikes the ornately carved cross, the refracted colours framed by four dark columns as the atmosphere shimmers and crackles with energy.",
        "A studious man sits diligently counting coins and recording transactions in a ledger with great accuracy. Polite exchanges are made over the table with citizens frequenting Runewick's market.",
        "A studious woman sits surrounded by parchments as she writes in a thick volume. To her side stands the blue and grey pennant of Runewick, an indication she is an official of the realm.",
        "A diligent elf carefully records any donations left on the platform beside him. Behind, the towering blue and grey pennant of Runewick provides an indication of his importance to the realm.",
        "Within his secluded island villa, an elf deep in thought, studies countless artefacts and scrolls. Undoubtedly he is Archmage Elvaine Morgan, the wise and enlightened ruler of Runewick.",
        "A leather-clad ranger with a full quiver and bow held ready keeps watch over the forest before him, scrutinising all those who try to cross the bridge to Runewick.",
        "The air crackles with energy around an ornate marble podium. An elaborately scribed pell sits on the podium listing a number of destinations.",
        "Nestled in a quiet corner of the immense library and surrounded by books and manuscripts, a simple table serves as a modest altar that encapsulates the restraint and wisdom of Elara.",
        "Backed by tangled vines bearing bountiful bunches of grapes and flanked by heavy barrels of the finest ale, a prominent altar dominates the homely tavern, a place of many joyous festivities worthy of Adron.",
        "Carved wooden columns embraced by tangled vines shelter a modestly adorned altar, surrounded by bountiful flowers that epitomise the life that Oldra brings."}

        dialogTextG = {
        "Es befinden sich mehrere Depots in Runewick. Jedes gibt dir Zugriff auf deine eingelagerten Gegenst�nde. Greife auf das Depot zu, indem du darauf doppelklickst und Gegenst�nde in und aus den Slots ziehst. Jedes Reich und der neutrale Gasthof zur Hanfschlinge hat sein eigenes Depotsystem.",
        "Der Markt beherbergt eine F�lle von H�ndlern, die von Rohstoffen bis hin zu feinsten Kunsthandwerk alles kaufen und verkaufen. Gegenst�nde der prim�ren Handwerk k�nnen zu einem Zehntel ihres Wertes verkauft werden. Dies wird durch die Goldm�nze im Handelsmen� angezeigt. Gegenst�nde der sekund�ren Handwerke k�nnen zu einem Zwanzigstel ihres Wertes verkauft werden, was durch die Silberm�nze im Handelsmen� angezeigt wird.",
        "Die prim�ren Handwerke Schreinern, Kochen und Brauen werden durch statische Werkzeuge, Ressourcen, H�ndler und Gilden in Runewick voll unterst�tzt. Sekund�res Handwerk wird nur teilweise mit statischen Werkzeugen, begrenzten Ressourcen und schlechteren Handelsm�glichkeiten unterst�tzt. Die meisten statischen Werkzeuge k�nnen in oder um die Werkst�tten gefunden werden. Bewege deine Maus �ber ein Werkzeug, um herauszufinden, f�r was es verwendet werden kann.",
        "Solltest du das Pech haben, niedergestreckt zu werden, gibt es eine Chance, dass Cherga, die G�ttin der Geister und die Unterwelt, dir den Eintritt in ihr Reich verweigern wird. Es gibt noch so viel f�r dich in Illarion zu erleben und du wirst am Auferstehungspfeiler deines Reiches wiederbelebt. Du wirst dich schwach f�hlen, also gib dir Zeit, dich zu erholen.",
        "Kupfer-, Silber- und Goldm�nzen werden in ganz Illarion verwendet. Einhundert Kupferm�nzen k�nnen gegen eine Silberm�nze getauscht werden und hundert Silberm�nzen k�nnen durch den Geldwechsler Argentus Almsbag gegen eine Goldm�nze getauscht werden.",
        "Sprich mit dem Notar Torina Scibrim, wenn du dich Runewick anschlie�en oder es verlassen willst. Du kannst auch herausfinden, was dein Rang als B�rger Runewicks ist. Du kannst deinen Rang verbessern und in der Gunst des Erzmagiers aufsteigen, indem du die von den NPCs in Runewick herausgegebenen Quests abschlie�t oder Rangpunkte von einem Gamemaster f�r deinen Beitrag zum Reich empf�ngst.",
        "Gemeinsam mit Steuerzahlungen tragen Spenden zum Reichtum deines Reiches bei und bestimmen die Anzahl der magischen Edelsteine, die unter den B�rgern verteilt werden. Gespendet wird durch die Platzierung eines Gegenstandes oder M�nzen auf der Spendenplattform. Gegenst�nde z�hlen hierbei einen Zehntel ihres Wertes.",
        "Der Herrscher eines Reiches kann von einem der Gamemaster gespielt werden, um an Veranstaltungen teilzunehmen und mit den Untertanen zu interagieren. Wenn du eine Nachricht f�r den Erzmagier hinterlassen m�chtest, kannst du den entsprechenden Gamemaster �ber den Forenaccount Elvaine Morgan kontaktieren. Bedenke, dass jedes Reich seine eigene Sitten und Br�uche entwickelt hat, also solltest du versuchen, herauszufinden, was von den B�rgern erwartet wird. Oft wird der Herrscher eines Reiches von einigen Spielercharakteren unterst�tzt, die sich ihren Weg in einflussreiche Positionen erarbeitet haben.",
        "Brassius Meres ist eine loyale Wache des Erzmagiers Elvaine Morgan und wird es nur den Ehrenhaften erlauben, �ber die Br�cke nach Runewick zu gehen. Hinter der Br�cke ist Runewick ein sicherer Zufluchtsort vor den Gefahren, den die Wache gegen Monster verteidigt. Solltest du beim Erzmagier oder seinen Beamten in Misskredit geraten, wirst du m�glicherweise aus dem Reich verbannt und Brassius wird dich abweisen.",
        "Ein Teleporter findet sich au�erhalb des Eingangs zu jeder Stadt und dem neutralen Gasthof zur Hanfschlinge. Doppelklicke auf das Podium, um es zu benutzen und f�r f�nf Silberst�cke in ein anderes Reich zu reisen. Portalb�cher k�nnen auch f�r zehn Silberst�cke gekauft werden und �berall benutzt werden, um dich zu einem bestimmten Teleporter zu transportieren. In Runewick verkauft Phillibald Portalb�cher im W�chterhaus im Norden, direkt bei der Br�cke.",
        "Die Jungen G�tter beherrschen das t�gliche Leben in Illarion. Elara ist einer der drei Schutzg�ttinnen Runewicks. Als G�ttin des Wissens und der Weisheit werden ihre aufrichtigen Absichten unter den Gelehrten von Runewick hoch gesch�tzt.",
        "Die elf Jungen G�tter haben mehr Anh�nger als die f�nf Alten G�tter. Adron ist einer der drei Schutzg�tter Runewicks. Als Gott des Weines und der Feste wird seine Ausstrahlung von den jovialen Feiernden Runewicks besonders gesch�tzt.",
        "Jedes Reich hat drei Schutzg�tter. Oldra ist einer der drei Schutzg�tter Runewicks. Als G�ttin der Fruchtbarkeit und des Lebens ist ihre F�rsorge und Demut unter den Bauern von Runewick beliebt."}

        dialogTextE = {
        "You will find several depots around Runewick, each giving you access to your stored possessions. Access the depot by double clicking it and drag items in and out of the slots. Each realm and the neutral Hemp Necktie Inn have their own storage system.",
        "The market contains a wealth of traders buying and selling anything from raw materials to the finest crafted products. Items can be sold at a tenth of their value in the primary crafting realm, indicated by the gold coin in the trading menu. They can only be sold at a twentieth of their value in the secondary crafting realm, indicated by the silver coin in the trading menu.",
        "The primary crafts of carpentry, cooking, and brewing are fully supported with static tools, resources, merchants, and guilds in Runewick. Secondary crafts are only partially supported with static tools, limited resources and poorer trading opportunities. Most static tools are found in or around the workshops. Hover over a tool to find out what it should be used for.",
        "Should you be unfortunate enough to perish there is every chance Cherga, the goddess of spirits and the underworld, will deny you entry to her realm as there is still so much for you to experience in Illarion. Returned to the resurrection pillar of you chosen realm you will find yourself weak so give yourself time to recover.",
        "Copper, silver and gold coins are used throughout Illarion. One hundred copper coins can be exchanged for one silver coin and one hundred silver coins can be exchanged for a gold coin by the Money Changer, Argentus Almsbag.",
        "Speak to the Notary Torina Scibrim if you wish to join or leave Runewick, find out what your rank is as a citizen of Runewick. You can improve your rank and advance in the Archmage's favour by completing quests issued by NPCs in Runewick or by receiving rank points from a Game Master for your contribution to the realm.",
        "Together with tax returns, donations made to the realm contribute to faction wealth and determine the number of magic gems distributed between citizens. A donation is made by placing an item or coins on the donation platform. Donated items contribute a tenth of their value.",
        "The faction ruler may be played by one of the Game Masters on occasions to attend events and interact with their subjects. If you wish to leave a message for the Archmage you can contact the relevant Game Master via the forum account Elvaine Morgan. Be aware though each realm has developed their own customs and etiquette so you should try to find out what is expected of citizens. Often the faction ruler will be supported by a number of player characters who have worked their way into positions of influence.",
        "Brassius Meres is a loyal guard of Archmage Elvaine Morgan and will only allow the respectable to pass across the bridge into Runewick. Over the bridge, Runewick is a safe haven from the dangers beyond as the guard will defend against any monsters. Should you displease the Archmage or his officials, however, you may find yourself banned from the realm and then Brassius will see you do not enter either.",
        "A teleporter can be found outside the entrance to each town and the neutral Hemp Necktie Inn. Double click on the podium to use it and for five silver you will be able to travel to another realm. Portal books can also be bought for ten silver to use anywhere on the map to transport you to a designated teleporter. In Runewick, Phillibald sells portal books from the Guard House to the north, just as you cross the bridge.",
        "The Younger Gods dominate daily life in Illarion. Elara is one of the three patron deities of Runewick. As the goddess of wisdom and knowledge her righteous intentions are held in high esteem amongst the learned of Runewick.",
        "The eleven Younger Gods have more followers than the five Elder Gods. Adron is one of the three patron deities of Runewick. As the god of festivities and wine his charisma and is celebrated amongst the jovial revellers of Runewick.",
        "Each realm has three patron deities. Oldra is one of the three patron deities of Runewick. As the goddess of life and fertility her nurturing and humility is favoured amongst the farmers of Runewick."}

    elseif factions.isGalmairCitizen(User) then

        informTextG = {
        "Eine goldene verzierte Kiste thront in Galmair, schimmernd mit Energie und scheinbar voll mit unersch�pflichen Reicht�mern.",
        "Gl�nzende Klingen, polierte R�stungen und funkelnde Schmuckst�cke f�llen die Marktst�nde der rauen Kaufleuten. Sie feilschen �ber Preise und ihr erkl�ren ihre Schmiedewaren dem Don w�rdig zu sein, wenn nicht sogar Irmorom selbst.",
        "Flammende �fen spucken Funken und Rauch aus. Die Hitze erw�rmt die k�hle Bergluft, die in die Werkstatt weht. Ein Crescendo des H�mmerns erklingt von den Ambossen, als Schmiede aller Art ihr Metall schlagen.",
        "Licht bricht sich, als es auf das kunstvoll geschnitzte Kreuz trifft, und l�sst vier goldene Wachen funkeln. Die Luft flimmert und knistert vor Energie.",
        "Umgeben von Truhen von M�nzen, pr�ft eine scharfsinnig Frau einen Haufen von M�nzen auf F�lschungen, bevor sie sie in Beutel packt. H�ufig tauscht sie Geld der B�rgern, die daran interessiert sind, wieder zu ihren Gesch�ften zur�ckzukehren.",
        "Ein Mann schaut gewissenhaft auf einige Steueraktenund �berpr�ft Namen. Das sp�rlich dekorierte Zimmer gibt wenig Hinweis, dass er ein Beamter des Reiches ist, aber das Siegel von Galmair schm�ckt seine Briefe.",
        "Eine Frau pr�ft mit scharfem Blick alles auf der Spendenplattform, um schnell den Wert zu berechnen. Es ist unklar, ob sie ein neugieriger Zuschauer oder ein Beamter des Reiches ist, aber ihre Anwesenheit im Crest scheint geduldet zu sein.",
        "Ein reich gekleideter Zwerg schnippt eine Goldm�nze in die Luft, als du die riesige Giulianni-Residenz in Galmairs Crest betrittst. Zweifellos ist er Don Valerio Guilianni, der reiche und umsichtige Herrscher Galmairs.",
        "Eine kr�ftige und schwer gepanzerte Zwergin steht hinter hoch aufragenden Festungsmauern und �berpr�ft all jene, die versuchen, durch das Haupttor Galmairs einzutreten.",
        "Die Luft knistert mit Energie um ein kunstvoll verziertes Marmorpodium. Ein verwittertesPergament mit einer Liste von Zielen liegt auf dem Podium.",
        "Am  Berghang f�hrt ein extravaganter Pfad zu einem Altar und zwei pr�chtigen Ambossen. Sie werden von zwei gepanzerten Statues flankiert, die  reiche Zwergenschmiede darstellen und die Werte Irmoroms repr�sentieren.",
        "Das bizarre Kr�hen eines Raben ist zuweilen in dem eigent�mlichen Tempel, der tief in den Berg gegraben wurde. Die chaotische Beleuchtung und die nicht �bereinstimmenden M�bel stehen hier f�r die Unberechenbarkeit von Narg�n.",
        "Tief in einem mit schmutzigem Wasser �berfluteten Tunnel steht ein dezenter Altar im Schatten. Die dunkle S�ule f�r die Sammlung von M�nzen erinnert an den Schutz, den Ronagan bietet."}

        informTextE = {
        "A highly embellished golden chest sits prominently in Galmair, shimmering with energy and seemingly harbouring remarkable depths.",
        "Gleaming blades, polished armour and sparkling jewellery fills the market stalls with raucous merchants haggling over prices and declaring their smithing to be worthy of the Don, if not Irmorom himself.",
        "Blazing furnaces belch out sparks and smoke, the heat warming the cool mountain air that blows into the workshop. A crescendo of hammering rises from the anvils as smiths of all kinds strike their metal.",
        "Light splits as it strikes the ornately carved cross, refracted colour falling to the feet of four golden armoured guards as the atmosphere shimmers and crackles with energy.",
        "Surrounded by chests of coins, an astute woman inspects a pile of coins for counterfeits before sliding them into pouches. Frequent exchanges are made with citizens keen to get back to their trade.",
        "A man peers scrupulously at some tax records, checking off names. The sparsely decorated room gives little hint he is an official of the realm, but the seal of Galmair adorns his letters.",
        "A sharp-eyed woman scrutinises all left at the donation platform, quickly calculating the value. It may be unclear whether she is a nosy onlooker or an official of the realm, but her presence in the Crest seems to be tolerated.",
        "A richly attired dwarf flips a gold coin as you enter the vast Guilianni Residence in Galmair's Crest. Undoubtedly he is Don Valerio Guilianni, the wealthy and prudent ruler of Galmair.",
        "A stout and heavily armoured dwarfess stands guard behind towering fortress walls, scrutinising all those who try to enter through the main gate into Galmair.",
        "The air crackles with energy around an ornate marble podium. A weathered pell sits on the podium listing a number of destinations.",
        "Carved into the mountainside an extravagant approach leads to an altar and two magnificent anvils, flanked by two armoured figures that depict a rich dwarven smith that encapsulate the values of Irmorom.",
        "Bizarrely, the cawing of a raven might be heard on occasion echoing through the peculiar temple dug deep into the mountain, the chaotic lighting and mismatched furniture encapsulating the unpredictability of Narg�n.",
        "Deep in a tunnel flooded with filthy water an understated altar serves hidden in the shadows, the dark column for the collection of coins reminding of the protection Ronagan brings."}

        dialogTextG = {
        "Es befinden sich mehrere Depots in Galmair. Jedes gibt dir Zugriff auf deine eingelagerten Gegenst�nde. Greife auf das Depot zu, indem du darauf doppelklickst und Gegenst�nde in und aus den Slots ziehst. Jedes Reich und der neutrale Gasthof zur Hanfschlinge hat sein eigenes Depotsystem.",
        "Der Markt beherbergt eine F�lle von H�ndlern, die von Rohstoffen bis hin zu feinsten Kunsthandwerk alles kaufen und verkaufen. Gegenst�nde der prim�ren Handwerk k�nnen zu einem Zehntel ihres Wertes verkauft werden. Dies wird durch die Goldm�nze im Handelsmen� angezeigt. Gegenst�nde der sekund�ren Handwerke k�nnen zu einem Zwanzigstel ihres Wertes verkauft werden, was durch die Silberm�nze im Handelsmen� angezeigt wird.",
        "Die prim�ren Handwerke Schmieden, R�stschmieden und Feinschmieden werden durch statische Werkzeuge, Ressourcen, H�ndler und Gilden in Galmair voll unterst�tzt. Sekund�res Handwerk wird nur teilweise mit statischen Werkzeugen, begrenzten Ressourcen und schlechteren Handelsm�glichkeiten unterst�tzt. Die meisten statischen Werkzeuge k�nnen in oder um die Werkst�tten gefunden werden. Bewege deine Maus �ber ein Werkzeug, um herauszufinden, f�r was es verwendet werden kann.",
        "Solltest du das Pech haben, niedergestreckt zu werden, gibt es eine Chance, dass Cherga, die G�ttin der Geister und die Unterwelt, dir den Eintritt in ihr Reich verweigern wird. Es gibt noch so viel f�r dich in Illarion zu erleben und du wirst am Auferstehungspfeiler deines Reiches wiederbelebt. Du wirst dich schwach f�hlen, also gib dir Zeit, dich zu erholen.",
        "Kupfer-, Silber- und Goldm�nzen werden in ganz Illarion verwendet. Einhundert Kupferm�nzen k�nnen gegen eine Silberm�nze getauscht werden und hundert Silberm�nzen k�nnen durch den Geldwechsler Laura Pepperbags gegen eine Goldm�nze getauscht werden.",
        "Sprich mit dem Notar Frederik Silvereye, wenn du dich Galmair anschlie�en oder es verlassen willst. Du kannst auch herausfinden, was dein Rang als B�rger Galmairs ist. Du kannst deinen Rang verbessern und in der Gunst des Dons aufsteigen, indem du die von den NPCs in Galmair herausgegebenen Quests abschlie�t oder Rangpunkte von einem Gamemaster f�r deinen Beitrag zum Reich empf�ngst.",
        "Gemeinsam mit Steuerzahlungen tragen Spenden zum Reichtum deines Reiches bei und bestimmen die Anzahl der magischen Edelsteine, die unter den B�rgern verteilt werden. Gespendet wird durch die Platzierung eines Gegenstandes oder M�nzen auf der Spendenplattform. Gegenst�nde z�hlen hierbei einen Zehntel ihres Wertes.",
        "Der Herrscher eines Reiches kann von einem der Gamemaster gespielt werden, um an Veranstaltungen teilzunehmen und mit den Untertanen zu interagieren. Wenn du eine Nachricht f�r den Don hinterlassen m�chtest, kannst du den entsprechenden Gamemaster �ber den Forenaccount Valerio Guilianni kontaktieren. Bedenke, dass jedes Reich seine eigene Sitten und Br�uche entwickelt hat, also solltest du versuchen, herauszufinden, was von den B�rgern erwartet wird. Oft wird der Herrscher eines Reiches von einigen Spielercharakteren unterst�tzt, die sich ihren Weg in einflussreiche Positionen erarbeitet haben.",
        "Bre Southstar ist eine loyale Wache von Don Valerio Guilianni und wird es nur den Respektablen und denen mit genug Gold erlauben, Galmair zu betreten. Hinter den Mauern ist Galmair ein sicherer Zufluchtsort vor den Gefahren, den die Wache gegen Monster verteidigt. Solltest du beim Don oder seinen Handlangern in Misskredit geraten, wirst du m�glicherweise aus dem Reich verbannt und Bre wird dich abweisen.",
        "Ein Teleporter findet sich au�erhalb des Eingangs zu jeder Stadt und dem neutralen Gasthof zur Hanfschlinge. Doppelklicke auf das Podium, um es zu benutzen und f�r f�nf Silberst�cke in ein anderes Reich zu reisen. Portalb�cher k�nnen auch f�r zehn Silberst�cke gekauft werden und �berall benutzt werden, um dich zu einem bestimmten Teleporter zu transportieren. In Galmair verkauft Pipillo Portalb�cher im Stall im n�rdlichen Torhaus.",
        "Die Jungen G�tter beherrschen das t�gliche Leben in Illarion. Irmorom ist einer der drei Schutzg�tter Galmairs. Als der Gott des Handels und der Handwerkskunst werden seine aufrichtigen Absichten von der flei�igen Handwerkern in Galmair hoch gesch�tzt.",
        "Die elf Jungen G�tter haben mehr Anh�nger als die f�nf Alten G�tter. Narg�n ist einer der drei Schutzg�tter Galmairs. Als Gott des Chaos ist sein schneller Witz und seine Gunst gesch�tzt unter denen, die ihr Gl�ck in Galmair suchen.",
        "Jedes Reich hat drei Schutzg�tter. Ronagan ist einer der drei Schutzg�tter Galmairs. Als der Gott der Diebe und Schatten wird seine entschlossene K�hnheit in der Unterschicht Galmairs hoch gesch�tzt."}

        dialogTextE = {
        "You will find several depots around Galmair, each giving you access to your stored possessions. Access the depot by double clicking it and drag items in and out of the slots. Each realm and the neutral Hemp Necktie Inn have their own storage system.",
        "The market contains a wealth of traders buying and selling anything from raw materials to the finest crafted products. Items can be sold at a tenth of their value in the primary crafting realm, indicated by the gold coin in the trading menu. They can only be sold at a twentieth of their value in the secondary crafting realm, indicated by the silver coin in the trading menu.",
        "The primary crafts of blacksmithing, armour smithing, and finesmithing are fully supported with static tools, resources, merchants, and guilds in Galmair. Secondary crafts are only partially supported with static tools, limited resources and poorer trading opportunities. Most static tools are found in or around the workshops. Hover over a tool to find out what it should be used for.",
        "Should you be unfortunate enough to perish there is every chance Cherga, the goddess of spirits and the underworld, will deny you entry to her realm as there is still so much for you to experience in Illarion. Returned to the resurrection pillar of you chosen realm you will find yourself weak so give yourself time to recover.",
        "Copper, silver and gold coins are used throughout Illarion. One hundred copper coins can be exchanged for one silver coin and one hundred silver coins can be exchanged for a gold coin by the Money Changer, Laura Pepperbags.",
        "Speak to the Notary Frederik Silvereye if you wish to join or leave Galmair, find out what your rank is as a citizen of Galmair. You can improve your rank and advance in the Don's favour by completing quests issued by NPCs in Galmair or by receiving rank points from a Game Master for your contribution to the realm.",
        "Together with tax returns, donations made to the realm contribute to faction wealth and determine the number of magic gems distributed between citizens. A donation is made by placing an item or coins on the donation platform. Donated items contribute a tenth of their value.",
        "The faction ruler may be played by one of the Game Masters on occasions to attend events and interact with their subjects. If you wish to leave a message for the Don you can contact the relevant Game Master via the forum account Valerio Guilianni. Be aware though each realm has developed their own customs and etiquette so you should try to find out what is expected of citizens. Often the faction ruler will be supported by a number of player characters who have worked their way into positions of influence.",
        "Bre Southstar is a loyal guard of Don Valerio Guilianni and will only allow the respectable and those with business to pass into Galmair. Behind the gates, Galmair is a safe haven from the dangers beyond as the guard will defend against any monsters. Should you displease the Don or his officials, however, you may find yourself banned from the realm and then Bre will see you do not enter either.",
        "A teleporter can be found outside the entrance to each town and the neutral Hemp Necktie Inn. Double click on the podium to use it and for five silver you will be able to travel to another realm. Portal books can also be bought for ten silver to use anywhere on the map to transport you to a designated teleporter. In Galmair, Pipillo sells portal books from the stall to the north, just inside the gates.",
        "The Younger Gods dominate daily life in Illarion. Irmorom is one of the three patron deities of Galmair. As the god of trade and craftmanship his righteous intentions are held in high esteem by the industrious of Galmair.",
        "The eleven Younger Gods have more followers than the five Elder Gods. Narg�n is one of the three patron deities of Galmair. As the god of chaos his quick wit and favour are valued amongst those seeking good fortune in Galmair.",
        "Each realm has three patron deities. Ronagan is one of the three patron deities of Galmair. As the god of thieves and shadows his determined audacity is held in high esteem amongst the underclass of Galmair."}

    end

    return informTextG, informTextE, dialogTextG, dialogTextE
end

function M.addEffect(introductionEffect, User)
    introductionEffect:addValue("10",0) --dummy value to make sure the effect does not get deleted right after the first call
end

function M.callEffect(introductionEffect, User)

    if factions.isOutlaw(User) then --abort the quest
        User:setQuestProgress(44,0)
        User:setQuestProgress(45,0)
        User:setQuestProgress(46,0)
        return false
    end

    local waypoint, waypointRadius, _, _ = M.initWaypoint(User)
    local informTextG, informTextE, dialogTextG, dialogTextE = M.initText(User)

    -- QUEST FINISHED DIALOG
    local function finishDialog()
        if M.questFinished(User, waypoint) then
            local callbackFinish = function() end --empty callback
            local dialogText = common.GetNLS(User,"Du hast jetzt einen guten �berblick �ber deine Heimatstadt. Du kannst nun jedes Ziel verfolgen, das dein Charakter haben k�nnte. Es wird dringend empfohlen, einige Freunde zu machen, die dir beim Start helfen. Bleibe dabei stets in deiner gew�hlten Rolle. Werde der reichste H�ndler, der erfahrenste Handwerker oder ein weiser Magier. Das einzigartige Skill-System von Illarion sorgt daf�r, dass keine Zeit verschwendet wird, wenn du mit anderen Spielern sprichst. Du lernst mehr von jeder Aktion, wenn du dir die Zeit nimmst, mit anderen zu interagieren. Aber wer gar nichts tut lernt nat�rlich auch nichts!","You have now a good overview of your home city. You are free to pursuit any goal your character might have. It is highly recommended to make some friends who help you get started. Always stay in your chosen role. Become the wealthiest trader, the most skilled crafter or a wise mage. The unique skill system of Illarion makes sure no time is wasted if you talk to other player characters. You'll learn more from each action if you take your time to interact with others. But who does nothing learns nothing, obviously!")
            local dialogTitle = common.GetNLS(User,"Einf�hrung","Introduction")
            local dialogFinish = MessageDialog(dialogTitle, dialogText, callbackFinish)
            User:requestMessageDialog(dialogFinish)
        end
    end

    -- CHECK LOCATIONS
    local queststatus = User:getQuestProgress(44) --here, we save which places were visited

    for i = 1, #waypoint do

        if not common.isBitSet(queststatus, i) and User:isInRangeToPosition(waypoint[i], waypointRadius[i]) then

            User:setQuestProgress(44,common.addBit(queststatus,i)) --remember we visited the place
            User:setQuestProgress(46,0) --hack to reload the quest log
            User:setQuestProgress(46,1) --hack to reload the quest log

            local callbackFound = function(dialogFound)
                common.InformNLS(User,informTextG[i],informTextE[i])
                finishDialog()
            end --callback

            local dialogText = common.GetNLS(User,dialogTextG[i],dialogTextE[i])
            local dialogTitle = common.GetNLS(User,"Einf�hrung","Introduction")
            local dialogFound = MessageDialog(dialogTitle, dialogText, callbackFound)
            User:requestMessageDialog(dialogFound)

        end

    end

    -- LOOK FOR OTHER PLAYERS
    local otherPlayers = world:getPlayersInRangeOf(User.pos, 5)
    if #otherPlayers > 1 and User:getQuestProgress(45) == 0 then

        User:setQuestProgress(45,1) --remember we found someone
        local callbackGreeting = function(dialogGreeting)
            finishDialog()
        end --callback

        local dialogText = common.GetNLS(User,"Illarion basiert auf der Interaktion zwischen Spielerfiguren und dem wahren Rollenspiel. Warum sagst du nicht 'Hallo, mein Name ist "..User.name ..".' zu diesem anderen Charakter? Mit dem Befehl #i kannst du deinen Charakter anderen Spielfiguren neben dir vorstellen. Bleib immer in deiner gew�hlten Rolle und du wirst eine tolle Zeit haben. Vielleicht wirst du eines Tages einer einflussreichen Gilde beitreten und dich in die Politik deiner Heimatstadt einbringen?","Illarion is based on interaction between player characters and true roleplaying. Why don't you say 'Hello, my name is '"..User.name..".' to that other character? By the command #i, you can introduce your character to other player characters next to yours. Always stay in your chosen role and you'll have a great time. Maybe one day you will join a influential guild and get involved in the politics of your home city?")
        local dialogTitle = common.GetNLS(User,"Einf�hrung","Introduction")
        local dialogGreeting = MessageDialog(dialogTitle, dialogText, callbackGreeting)
        User:requestMessageDialog(dialogGreeting)

    end

    -- FINISH QUEST OR NEXT CALL
    if M.questFinished(User, waypoint) then
        User:setQuestProgress(46,2) --end the quest
        return false --remove the effect
    end

    introductionEffect.nextCalled = 10
    return true
end

function M.removeEffect(introductionEffect, User)
    return false
end

function M.loadEffect(introductionEffect, User)

    -- Login Dialog. Show only once.
    if User:getQuestProgress(324) == 0 then
        local callbackLogin = function() end --empty callback
        local dialogText = common.GetNLS(User,"Willkommen zur�ck!\n\nHast du schon alle interessanten Orte deiner Heimatstadt besucht? Folge einfach den roten Symbolen auf deiner Karte. Die Orte k�nnten unter der Oberfl�che oder im Obergeschoss liegen. Wenn du anderen Spielercharaktere begegnest, stell dich ihnen vor. Als ein neuer B�rger von Illarion ist es das Beste, Freunde zu gewinnen, die dir in Zeiten der Not helfen. Wenn du Probleme mit dem Spiel hast, denke daran mit F1 eine Liste von Befehlen aufzurufen oder dich dem Chat auf der Website www.illarion.org anzuschlie�en.","Welcome back!\n\nDid you already visit all interesting sites of your home city? Just follow the red symbols on your map. The sites might be below the surface or upstairs. If you encounter any other player characters, introduce yourself. As a new citizen of Illarion, the best you can do is to make friends who help you in times of need. If you have issues with the game, remember to hit F1 for a list of commands or join the chat on the website www.illarion.org.")
        local dialogTitle = common.GetNLS(User,"Einf�hrung","Introduction")
        local dialogLogin = MessageDialog(dialogTitle, dialogText, callbackLogin)
        User:requestMessageDialog(dialogLogin)
        User:setQuestProgress(324,1)
    end

end

function M.questFinished(User, waypoint)

    if common.countBit(User:getQuestProgress(44)) == #waypoint and User:getQuestProgress(45) == 1 then
        return true
    else
        return false
    end

end

return M
