-- triggerfields for better atmosphere

--[[ SQL Statements:
INSERT INTO triggerfields VALUES (X,Y,Z,'triggerfield.ambient');

]]

require("base.common")

module("triggerfield.ambient", package.seeall)

--[[
position: coordinates
direction: array with directions, 0=North,2=East,4=South,6=West. Set nil for always
german/english: text
hours: array with hours when text shall be shown, in range of 0 to 23. Set to nil for always.
months: array with months when text shall be shown, in range of 1 to 16. Set to nil for always.
chance: Chance that this triggerfield is triggered in percent (integer)

for script:
AmbientList:add( position(x,y,z), {0,1,7}, "german", "english", {0,1,23}, {1,2,16}, chance );

for db:
INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.ambient');

Old stuff:

-62,-124,0), 4, "Du betrittst den Raum und merkst sofort, dass es zieht. Ein Mann auf einem der St?hle blickt sich ungeduldig um.", "You enter the room and immediately notice that there is draught. A man on one of the chairs looks around impatient.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {9,10,11,12} );
-62,-124,0), 4, "Es ist ziemlich warm im Raum, man sollte hier mal l?ften. Hinter der Theke steht eine g?hnende Echse, auf einem der St?hle schnarcht ein Mann vor sich hin.", "It is quite warm in the room, someone should open the windows. Behind the shop counter stands a yawning lizard, on one of the chairs you see a snoring man.", {22,23,0,1,2,3,4,5,6,7}, {5,6,7,8} );
-62,-124,0), 4, "Im Raum ist es etwas w?rmer als drau?en, du frierst aber trotzdem etwas. An der Theke steht eine Echse, die in einen dicken Mantel geh?llt ist.", "It's a little bit warmer inside than outside, but you still feel cold. At the shop counter stands a lizard, who wears a warm coat.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {13,14,15,16} );
-62,-124,0), 4, "In dieser Herbstnacht ist es ruhig im Laden. Wenn du umhergehst knarrt der Boden unter deinen F??en.", "This night, it is very quite in the shop. As you walk around the floor under your feets creaks a little.", {22,23,0,1,2,3,4,5,6,7}, {9,10,11,12} );
-62,-125,0), 0, "Der Boden im Raum ist nass, hier suchen wohl viele Leute Unterschlupf, wenn es regnet. Die Stimmung unter den H?ndlern scheint genau so schlecht zu sein wie das Wetter.", "The floor in the room is wet, it seems that many people seek shelter in here when it rains. The mood of the merchants appears to be as bad as the weather.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {9,10,11,12} );
-62,-125,0), 0, "Der Schnee glitzert durch die Fenster und bringt den Raum zum Leuchten. Es riecht nach Wintergeb?ck, die H?ndler sind in guter Stimmung.", "The glittering snow outside lights up the whole room. You can smell winter pastry, the merchants are in a very good mood.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {13,14,15,16} );
-62,-125,0), 0, "Sofort als du durch die T?r trittst, nimmst du die verschiedensten D?fte wahr, einige Kaufleute unterhalten sich, andere sortieren ihre Waren.", "As you go through the door, you immediately notice different fragrances, some merchants are having a conversation, others are sorting their goods.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {1,2,3,4} );
-62,-125,0), 0, "Vor dir steht ein reich gekleideter Mann, hinter dem einige Truhen randgef?llt mit Gold zu erkennen sind. Er sieht dich misstrauisch an.", "The man in front of you is clad in fine clothes, behind him you see many chests filled to the brim with gold. He eyes you suspiciously.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {5,6,7,8} );
-64,-129,0), 2, "Auch das Markthaus bleibt vom Winter nicht verschont: Der Raum ist eiskalt, du solltest deinen Mantel umwerfen, bevor du dich erk?ltest.", "Not even the shops can escape winter: It is icecold in here. You should put on your coat or you will get a cold.",  {22,23,0,1,2,3,4,5,6,7}, {13,14,15,16} );
-64,-129,0), 2, "Der Boden im Raum ist nass, hier suchen wohl viele Leute Unterschlupf, wenn es regnet. Die Stimmung unter den H?ndlern scheint genau so schlecht zu sein wie das Wetter.", "The floor in the room is wet, it seems that many people seek shelter in here when it rains. The mood of the merchants appears to be as bad as the weather.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {9,10,11,12} );
-64,-129,0), 2, "Der Schnee glitzert durch die Fenster und bringt den Raum zum Leuchten. Es riecht nach Wintergeb?ck, die H?ndler sind in guter Stimmung.", "The glittering snow outside lights up the whole room. You can smell winter pastry, the merchants are in a very good mood.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {13,14,15,16} );
-64,-129,0), 2, "Die n?chtliche Luft im Herbst scheint es den H?ndlern angetan zu haben, sie haben alle Fenster sperrangelweit offen. Im hinteren Teil des Raumes sitzt ein strickender Mann auf der Theke.", "The merchants seem to like the fresh air, all windows are opened. In the back of the room, someone sits on a counter knitting.",  {22,23,0,1,2,3,4,5,6,7}, {9,10,11,12} );
-64,-129,0), 2, "Es ist nicht mehr viel los im Raum, die meisten H?ndler bauen gerade ihre St?nde ab und reden nochmal ?ber den Tag.", "Not much is going on in the room. Most of the merchants are packing their bags and summing up the day.", {22,23,0,1,2,3,4,5,6,7}, {1,2,3,4} );
-64,-129,0), 2, "Hier drin riecht es nach den verschiedensten Sachen. Einige Kaufm?nner sind noch immer hier und preisen ihre Waren an.", "You smell the most different things in here. Some merchants are still touting for their goods.", {22,23,0,1,2,3,4,5,6,7}, {5,6,7,8} );
-64,-129,0), 2, "Links von dir steht ein reich gekleideter Mann, hinter dem einige Truhen randgef?llt mit Gold zu erkennen sind. Er sieht dich misstrauisch an.", "The man to the left of you is clad in fine clothes, behind him you see many chests filled to the brim with gold. He eyes you suspiciously.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {5,6,7,8} );
-64,-129,0), 2, "Sofort als du durch die T?r trittst, nimmst du die verschiedensten D?fte wahr, einige Kaufleute unterhalten sich, andere sortieren ihre Waren.", "As you go through the door, you immediately notice different fragrances, some merchants are having a conversation, others are sorting their goods.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {1,2,3,4} );
-66,-116,0), 0, "Auch das Markthaus bleibt vom Winter nicht verschont: Der Raum ist eiskalt, du solltest deinen Mantel umwerfen, bevor du dich erk?ltest.", "Not even the shops can escape winter: It is icecold in here. You should put on your coat or you will get a cold.", {22,23,0,1,2,3,4,5,6,7}, {13,14,15,16} );
-66,-116,0), 0, "Die n?chtliche Luft im Herbst scheint es den H?ndlern angetan zu haben, sie haben alle Fenster sperrangelweit offen. Im hinteren Teil des Raumes sitzt ein strickender Mann auf der Theke.", "The merchants seem to like the fresh air, all windows are opened. In the back of the room, someone sits on a counter knitting.", {22,23,0,1,2,3,4,5,6,7}, {9,10,11,12} );
-66,-116,0), 0, "Es ist nicht mehr viel los im Raum, die meisten H?ndler bauen gerade ihre St?nde ab und reden nochmal ?ber den Tag.", "Not much is going on in the room. Most of the merchants are packing their bags and summing up the day.", {22,23,0,1,2,3,4,5,6,7}, {1,2,3,4} );
-66,-116,0), 0, "Hier drin riecht es nach den verschiedensten Sachen. Einige Kaufm?nner sind noch immer hier und preisen ihre Waren an.", "You smell the most different things in here. Some merchants are still touting for their goods.", {22,23,0,1,2,3,4,5,6,7}, {5,6,7,8} );
-66,-116,0), 2, "Die Nacht ist kalt. An die Theke gelehnt steht eine schnarchende Echse, die sich ab und zu nach Kunden umsieht.", "The night is cold. Leaned at the shop counter is a snoring lizard, who sometimes looks around for customers.", {22,23,0,1,2,3,4,5,6,7}, {1,2,3,4} );
-66,-116,0), 2, "Du betrittst den Raum und merkst sofort, dass es zieht. Ein Mann auf einem der St?hle blickt sich ungeduldig um.", "You enter the room and immediately notice that there is draught. A man on one of the chairs looks around impatient.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {9,10,11,12} );
-66,-116,0), 2, "Es ist ziemlich warm im Raum, man sollte hier mal l?ften. Hinter der Theke steht eine g?hnende Echse, auf einem der St?hle schnarcht ein Mann vor sich hin.", "It is quite warm in the room, someone should open the windows. Behind the shop counter stands a yawning lizard, on one of the chairs you see a snoring man.", {22,23,0,1,2,3,4,5,6,7}, {5,6,7,8} );
-66,-116,0), 2, "Im Raum ist es etwas w?rmer als drau?en, du frierst aber trotzdem etwas. An der Theke steht eine Echse, die in einen dicken Mantel geh?llt ist.", "It's a little bit warmer inside than outside, but you still feel cold. At the shop counter stands a lizard, who wears a warm coat.", {8,9,10,11,12,13,14,15,16,17,18,19,20,21}, {13,14,15,16} );
-66,-116,0), 2, "In dieser Herbstnacht ist es ruhig im Laden. Wenn du umhergehst knarrt der Boden unter deinen F??en.", "This night, it is very quite in the shop. As you walk around the floor under your feets creaks a little.", {22,23,0,1,2,3,4,5,6,7}, {9,10,11,12} );
-86,-99,-3), 6, "Du verl?sst den Schankraum und steigst die knarrende Treppe in den k?hlen Keller hinab. Deine Augen gew?hnen sich langsam an die Dunkelheit.", "You leave the taproom and steps down the creaking stairs to the cool, dark cellar. Your eyes start adapting to the darkness slowly.", nil, nil );
-88,-116,1), 6, "Beim Betreten des Raumes fallen Dir die gedeckten Tische auf. Sie laden zum Verweilen ein.", "As you walk in the room, the set table catch your eyes. They invite to take a rest.", nil, nil );
-89,-90,0), 2, "Du betrittst die Taverne und sogleich umh?llt dich wohlige W?rme und der Geruch von starkem Bier str?mt in deine Nase.", "You are walking in the tavern and instantly the warmth encloses you and the smell of strong beer pours into your nose.", nil, nil );
-91,-115,0), 2, "Du betrittst den Altarraum und heute sp?rst du die g?ttliche Stille noch st?rker als sonst. Die G?tter stehen dir im Mas bei.", "You walk into the sanctuary and instantly you feel the divine silence stronger then otherwise. The gods stand by you in the time of Mas.", nil, {16} );
-91,-115,0), 2, "Du betrittst den Altarraum und sofort sp?rst du etwas wie g?ttliche Inspiration und g?ttliche Stille.", "You walk into the sanctuary and instantly you feel something like afflatus and divine silence.", nil, {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} );
-94,-123,1), 4, "Beim Betreten des Raumes fallen Dir die gedeckten Tische auf. Sie laden zum Verweilen ein.", "As you walk in the room, the set table catch your eyes. They invite to take a rest.", nil, nil );
-94,-127,0), 2, "Du betrittst die Bibliothek und sofort umh?llt dich die Stille. Vereinzelt h?rst du raschelnde Pergamente.", "You walk in the libary and instantly silence surrounds you. Sporadicly you hear crinkly parchments.", nil, nil );
-95,-94,0), 0, "Du betrittst die Taverne und sogleich umh?llt dich wohlige W?rme und der Geruch von starkem Bier str?mt in deine Nase.", "You are walking in the tavern and instantly the warmth encloses you and the smell of strong beer pours into your nose.", nil, nil );
110,-200,-3), 6, "Dir schl?gt eine Hitze entgegen, die ihren Ursprung wohl bei den drei Heiz?fen hat. Die Ambosse sehen sehr abgenutzt aus und die Esse ist bedeckt von Ru?. Es ist sehr stickig und der Geruch von verbrannter Kohle liegt in der Luft.", "Some hot air streams straight into your face, probably coming from the three heat ovens. The anvils look quite used up and the forge is covered under a layer of ash. It is very stuffy and the smell of burned coal is in the air.", {nil}, {1,2,3,4,5,6,7,8,9,10,11,12} );
110,-200,-3), 6, "Nach der K?lte drau?en schl?gt dir hier eine angenehme W?rme entgegen, die ihren Ursprung wohl bei den drei Heiz?fen hat. Die Ambosse sehen sehr abgenutzt aus und die Esse ist bedeckt von Ru?. Es ist sehr stickig und der Geruch von verbrannter Kohle liegt in der Luft.", "After the coldness outside, you like the warm air, streaming your face, probably coming from the three heat ovens. The anvils look quite used up and the forge is covered under a layer of ash. It is very stuffy and the smell of burned coal is in the air", {nil}, {13,14,15,16} );
111,-200,-3), 6, "Dir schl?gt eine Hitze entgegen, die ihren Ursprung wohl bei den drei Heiz?fen hat. Die Ambosse sehen sehr abgenutzt aus und die Esse ist bedeckt von Ru?. Es ist sehr stickig und der Geruch von verbrannter Kohle liegt in der Luft.", "Some hot air streams straight into your face, probably coming from the three heat ovens. The anvils look quite used up and the forge is covered under a layer of ash. It is very stuffy and the smell of burned coal is in the air.", {nil}, {1,2,3,4,5,6,7,8,9,10,11,12} );
111,-200,-3), 6, "Nach der K?lte drau?en schl?gt dir hier eine angenehme W?rme entgegen, die ihren Ursprung wohl bei den drei Heiz?fen hat. Die Ambosse sehen sehr abgenutzt aus und die Esse ist bedeckt von Ru?. Es ist sehr stickig und der Geruch von verbrannter Kohle liegt in der Luft.", "After the coldness outside, you like the warm air, streaming your face, probably coming from the three heat ovens. The anvils look quite used up and the forge is covered under a layer of ash. It is very stuffy and the smell of burned coal is in the air", {nil}, {13,14,15,16} );
156,-433,0), 0,"Als du die H?hle betrittst, ist es dir als l?ufst du gegen eine k?hle unsichtbare Wand aus Luft die deinen K?rper in eiskaltes Wasser zu tauchen scheint. Beisender Rauch und der Gestank verdorbenen Fleisches durchdringen die Luft.","As you enter the cave you are met with an invisible wall of cold air, it feels like submerging your body in ice cold water after being burned by fire. The smell of smoke and decaying meat is overpowering",nil, {1,2,3,4,5,6,7,8,9,10,11,12} );
156,-433,0), 0,"Die W?rme in der H?hle vertreibt gem?chlich die K?lte aus deinen Gliedern und l?sst den Schnee auf deinen Schultern schmelzen. Der Geruch, ger?steten und ger?ucherten Fleisches steigt dir in die Nase."," The warm air inside the cave slowly thaws the snow and cold from your body, the stench of roasted meat and smoke fills your nostriles. ",nil, {13,14,15,16} );
156,-433,0), 4,"Als du ins Freie trittst, knacken die unz?hligen vereisten Stellen am Boden vor der H?hle unter deinen F??en. Die eisige Luft scheint dir die Brust zu verschn?ren und das Atmen f?llt dir schwer. Bald bemerkst du, dass deine Haare allm?hlich vereisen. ","A thin carpet of frost smoke covers the frozen ground, the soft cracking of ice is heard comming from above. The cold air fills your lungs with every breath you take making it hard to breath for a few moments as you get used to the biting cold air.",{19,20,21,22,23,0,1,2,3,4}, {13,14,15,16} );
156,-433,0), 4,"Angenehm warme Bergluft l?dt dich ein, kr?ftig durch zu atmen. In der Ferne l?sst sich manch mal das Br?llen eines l?ufigen Panthers vernehmen. ","The pleasing mountain air invites you to take a deep breath. Sometimes you hear the growl of a panther on the prowl. ",{5,6,7,8,9,10,11,12,13,14,15,16,17,18}, {1,2,3,4,5,6,7,8,9,10,11,12} );
156,-433,0), 4,"Trotz der Finsternis ist es noch angenehm Warm drau?en. Unz?hlige Grillen zirpen im hohen Gras auf dem Plateau. ","Despite the darkness it is pleasingly warm outside. Countless crickets chirr in the high grass on the plateu.",{19,20,21,22,23,0,1,2,3,4}, {1,2,3,4,5,6,7,8,9,10,11,12} );
157,-200,-6), 2, "In der Gruft riecht es abgestanden und modrig. Die W?nde sind mit uralten Zwergenrunen versehen. Es ist kalt und feucht hier untem im Berg, soweit weg von allem W?rmequellen. ", "In the crypt it smells moldy. On the walls you can see ancient dwarven runes. It is cold and clammy down here, far away from all sources of heat.", {nil}, {nil} );
157,-433,0), 0,"Als du die H?hle betrittst, ist es dir als l?ufst du gegen eine k?hle unsichtbare Wand aus Luft die deinen K?rper in eiskaltes Wasser zu tauchen scheint. Beisender Rauch und der Gestank verdorbenen Fleisches durchdringen die Luft.","As you enter the cave you are met with an invisible wall of cold air, it feels like submerging your body in ice cold water after being burned by fire. The smell of smoke and decaying meat is overpowering",nil, {1,2,3,4,5,6,7,8,9,10,11,12} );
157,-433,0), 0,"Die W?rme in der H?hle vertreibt gem?chlich die K?lte aus deinen Gliedern und l?sst den Schnee auf deinen Schultern schmelzen. Der Geruch, ger?steten und ger?ucherten Fleisches steigt dir in die Nase."," The warm air inside the cave slowly thaws the snow and cold from your body, the stench of roasted meat and smoke fills your nostriles. ",nil, {13,14,15,16} );
157,-433,0), 4,"Als du ins Freie trittst, knacken die unz?hligen vereisten Stellen am Boden vor der H?hle unter deinen F??en. Die eisige Luft scheint dir die Brust zu verschn?ren und das Atmen f?llt dir schwer. Bald bemerkst du, dass deine Haare allm?hlich vereisen. ","A thin carpet of frost smoke covers the frozen ground, the soft cracking of ice is heard comming from above. The cold air fills your lungs with every breath you take making it hard to breath for a few moments as you get used to the biting cold air.",{19,20,21,22,23,0,1,2,3,4}, {13,14,15,16} );
157,-433,0), 4,"Angenehm warme Bergluft l?dt dich ein, kr?ftig durch zu atmen. In der Ferne l?sst sich manch mal das Br?llen eines l?ufigen Panthers vernehmen. ","The pleasing mountain air invites you to take a deep breath. Sometimes you hear the growl of a panther on the prowl. ",{5,6,7,8,9,10,11,12,13,14,15,16,17,18}, {1,2,3,4,5,6,7,8,9,10,11,12} );
157,-433,0), 4,"Die eisige Luft, verwandelt deinen Atem in eine nebelige Schwade. Bei jedem Atemzug scheint sich deine Lunge zu verkrampfen und du ben?tigst einige Zeit, bis dein K?rper sich an die K?lte gew?hnt hat. Langsam beginnen deine Haare zu vereisen. ","The crisp cold air makes the sweat on your nostriles and forehead freeze instantly, it is difficult to breath for a few moments as your body gets used to the biting cold outside. ",{5,6,7,8,9,10,11,12,13,14,15,16,17,18}, {13,14,15,16} );
157,-433,0), 4,"Trotz der Finsternis ist es noch angenehm Warm drau?en. Unz?hlige Grillen zirpen im hohen Gras auf dem Plateau. ","Despite the darkness it is pleasingly warm outside. Countless crickets chirr in the high grass on the plateu.",{19,20,21,22,23,0,1,2,3,4}, {1,2,3,4,5,6,7,8,9,10,11,12} );
158,-200,-6), 2, "In der Gruft riecht es abgestanden und modrig. Die W?nde sind mit uralten Zwergenrunen versehen. Es ist kalt und feucht hier untem im Berg, soweit weg von allem W?rmequellen. ", "In the crypt it smells moldy. On the walls you can see ancient dwarven runes. It is cold and clammy down here, far away from all sources of heat.", {nil}, {nil} );
170,-194,-3), 0, "Der Geruch von Pergament dringt dir in die Nase. Die meisten B?cher in den Regalen sind verstaubt. In der Ecke liegen einige zusammengekn?llte Bl?tter. ", "The smell of pergament comes into your nose. Most of the books in the cupboard are dusty. In one corner there are waded papers.", {nil}, {nil} );
187,-443,1), 2,"Angenehm warme Bergluft l?dt dich ein, kr?ftig durch zu atmen. In der Ferne l?sst sich manch mal das Br?llen eines l?ufigen Panthers vernehmen. ","The pleasing mountain air invites you to take a deep breath. Sometimes you hear the growl of a panther on the prowl. ",{5,6,7,8,9,10,11,12,13,14,15,16,17,18}, {1,2,3,4,5,6,7,8,9,10,11,12} );
187,-443,1), 2,"Die eisige Luft, verwandelt deinen Atem in eine nebelige Schwade. Bei jedem Atemzug scheint sich deine Lunge zu verkrampfen und du ben?tigst einige Zeit, bis dein K?rper sich an die K?lte gew?hnt hat. Langsam beginnen deine Haare zu vereisen. ","The crisp cold air makes the sweat on your nostriles and forehead freeze instantly, it is difficult to breath for a few moments as your body gets used to the biting cold outside. ",{5,6,7,8,9,10,11,12,13,14,15,16,17,18}, {13,14,15,16} );
187,-443,1), 2,"Trotz der Finsternis ist es noch angenehm Warm drau?en. Unz?hlige Grillen zirpen im hohen Gras auf dem Plateau. ","Despite the darkness it is pleasingly warm outside. Countless crickets chirr in the high grass on the plateu.",{19,20,21,22,23,0,1,2,3,4}, {1,2,3,4,5,6,7,8,9,10,11,12} );
187,-443,1), 6,"Als du die H?hle betrittst, ist es dir als l?ufst du gegen eine k?hle unsichtbare Wand aus Luft die deinen K?rper in eiskaltes Wasser zu tauchen scheint. Beisender Rauch und der Gestank verdorbenen Fleisches durchdringen die Luft.","As you enter the cave you are met with an invisible wall of cold air, it feels like submerging your body in ice cold water after being burned by fire. The smell of smoke and decaying meat is overpowering",nil, {1,2,3,4,5,6,7,8,9,10,11,12} );
187,-443,1), 6,"Die W?rme in der H?hle vertreibt gem?chlich die K?lte aus deinen Gliedern und l?sst den Schnee auf deinen Schultern schmelzen. Der Geruch, ger?steten und ger?ucherten Fleisches steigt dir in die Nase."," The warm air inside the cave slowly thaws the snow and cold from your body, the stench of roasted meat and smoke fills your nostriles. ",nil, {13,14,15,16} );
187,-444,1), 2,"Als du ins Freie trittst, knacken die unz?hligen vereisten Stellen am Boden vor der H?hle unter deinen F??en. Die eisige Luft scheint dir die Brust zu verschn?ren und das Atmen f?llt dir schwer. Bald bemerkst du, dass deine Haare allm?hlich vereisen. ","A thin carpet of frost smoke covers the frozen ground, the soft cracking of ice is heard comming from above. The cold air fills your lungs with every breath you take making it hard to breath for a few moments as you get used to the biting cold air.",{19,20,21,22,23,0,1,2,3,4}, {13,14,15,16} );
187,-444,1), 2,"Angenehm warme Bergluft l?dt dich ein, kr?ftig durch zu atmen. In der Ferne l?sst sich manch mal das Br?llen eines l?ufigen Panthers vernehmen. ","The pleasing mountain air invites you to take a deep breath. Sometimes you hear the growl of a panther on the prowl. ",{5,6,7,8,9,10,11,12,13,14,15,16,17,18}, {1,2,3,4,5,6,7,8,9,10,11,12} );
187,-444,1), 2,"Die eisige Luft, verwandelt deinen Atem in eine nebelige Schwade. Bei jedem Atemzug scheint sich deine Lunge zu verkrampfen und du ben?tigst einige Zeit, bis dein K?rper sich an die K?lte gew?hnt hat. Langsam beginnen deine Haare zu vereisen. ","The crisp cold air makes the sweat on your nostriles and forehead freeze instantly, it is difficult to breath for a few moments as your body gets used to the biting cold outside. ",{5,6,7,8,9,10,11,12,13,14,15,16,17,18}, {13,14,15,16} );
187,-444,1), 2,"Trotz der Finsternis ist es noch angenehm Warm drau?en. Unz?hlige Grillen zirpen im hohen Gras auf dem Plateau. ","Despite the darkness it is pleasingly warm outside. Countless crickets chirr in the high grass on the plateu.",{19,20,21,22,23,0,1,2,3,4}, {1,2,3,4,5,6,7,8,9,10,11,12} );
187,-444,1), 6,"Als du die H?hle betrittst, ist es dir als l?ufst du gegen eine k?hle unsichtbare Wand aus Luft die deinen K?rper in eiskaltes Wasser zu tauchen scheint. Beisender Rauch und der Gestank verdorbenen Fleisches durchdringen die Luft.","As you enter the cave you are met with an invisible wall of cold air, it feels like submerging your body in ice cold water after being burned by fire. The smell of smoke and decaying meat is overpowering",nil, {1,2,3,4,5,6,7,8,9,10,11,12} );
187,-444,1), 6,"Die W?rme in der H?hle vertreibt gem?chlich die K?lte aus deinen Gliedern und l?sst den Schnee auf deinen Schultern schmelzen. Der Geruch, ger?steten und ger?ucherten Fleisches steigt dir in die Nase."," The warm air inside the cave slowly thaws the snow and cold from your body, the stench of roasted meat and smoke fills your nostriles. ",nil, {13,14,15,16} );

]]


AmbientList = {	add = function ( self, pos, dir, german, english, hours, months, chance )
						if not self[pos.x] then
							self[pos.x] = {};
						end
						if not self[pos.x][pos.y] then
							self[pos.x][pos.y] = {};
						end
						if not self[pos.x][pos.y][pos.z] then
							self[pos.x][pos.y][pos.z] = {};
						end
						local this = self[pos.x][pos.y][pos.z];
						table.insert(this, {
                            direction = direction or {0,1,2,3,4,5,6,7};
							german = german or "";
							english = english or "";
							hours = hours or {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
							months = months or {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
                            chance = chance or 100;
							} );
				end
}

AmbientList:add( position(7,7,0), {3,4,5}, "South, 30%", "South, 30%", nil, nil, 30 );

function MoveToField(Char)
	local this = getAmbient(Char);
	if this then
		base.common.TempInformNLS(Char,this.german,this.english);
	end
end

function getAmbient(Char)
	local pos = Char.pos;
	local dir = Char:get_face_to();
	if AmbientList[pos.x] and AmbientList[pos.x][pos.y] and AmbientList[pos.x][pos.y][pos.z] then
		local this = AmbientList[pos.x][pos.y][pos.z];
		local list = {};
		for _,ambient in pairs(this) do
			local timeOk, monthOk, dirOk = false, false, false;
			for _,that in pairs(ambient.hours) do
				if that==world:getTime("hour") then
					timeOk = true;
					break;
				end
			end
			for _,that in pairs(ambient.months) do
				if that==world:getTime("month") then
					monthOk = true;
					break;
				end
			end
			for _,that in pairs(ambient.direction) do
				if that==dir then
					dirOk = true;
					break;
				end
			end
			if timeOk and monthOk and dirOk and math.random(0,99)<ambient.chance then --chance!
				table.insert(list,ambient);
			end
		end
		if table.getn(list)>0 then
			return list[math.random(1,table.getn(list))];
		end
	end
	return nil;
end