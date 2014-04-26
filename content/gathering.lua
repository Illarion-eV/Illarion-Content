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
require("base.gatheringcraft")
require("item.gems")

module("content.gathering", package.seeall)

function InitGathering()
	if(Init == nil) then
	
		-- if FastAction==true then the probabilities are again reduced in FindRandomItem, see gatheringcraft.lua

		local prob_frequently = 0.005; --0.5% (1/200)
		local prob_occasionally = 0.0025; --0.25% (1/400)
		local prob_rarely = 0.001; --0.1% (1/1000)
		local prob_extremely_rarely = 0.00025; --0.025% (1/4000)

		woodchopping = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.woodcutting, LearnLimit = 100}; -- id_74_axe
		honeygathering = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming}; -- id_1005_beehive
		egggathering = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming}; -- egg collecting
		milking = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming}; -- id_2498_empty_bottle
		farming = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, FastActionFactor = 0.5, LearnLimit = 100}; -- seeds, id_126_sickle
		fruitgathering = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, FastActionFactor = 0.5}; -- harvest
		mining = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_2763_pickaxe
		sanddigging = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_24_shovel
		claydigging = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_24_shovel
		herbgathering = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.herblore, LearnLimit = 100}; -- id_126_sickle
		fishing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.fishing, LearnLimit = 100}; -- id_72_fishingrod
		woolcutting = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.tailoring}; -- id_6_scissors
		potashproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.woodcutting}; -- item.id_12_campfire
		entrailscutting = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.tailoring}; -- id_6_scissors
		stonecutting = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_737_chisel
		sieving = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_727_sieve
		flailing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, FastActionFactor = 0.5, LearnLimit = 100}; -- id_258_flail
		grainharvesting = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, FastActionFactor = 0.5, LearnLimit = 100}; -- id_271_scythe
		threadproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.tailoring}; -- id_171_spinningwheel
		oilsqueezing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.herblore, LearnLimit = 100}; -- id_44_squeezer
		doughproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.cookingAndBaking}; -- id_118_rollingpin
		weaving = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.tailoring}; -- id_169_loom
		oremelting = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.smithing}; -- id_2836_forge
		leatherproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.tailoring}; -- id_2052_stretcher
		boardproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.carpentry}; -- id_724_workbench
		candleproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = 100}; -- id_429_candlemold
		waxproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming}; -- id_428_candletable
		glassingotproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.glassBlowing}; -- id_313_glassmeltoven
		bricksproducing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.firingBricks, LearnLimit = 100}; -- id_313_glassmeltoven
		smokefood = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.cookingAndBaking}; -- id_305_smokingoven
		graingrinding = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, FastActionFactor = 0.5, LearnLimit = 100}; -- id_250_mill
		dyeing = base.gatheringcraft.GatheringCraft:new{LeadSkill = Character.tailoring}; -- id_220_barrel

		--woodchopping
		woodchopping:AddRandomItem(2551,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.","For your hard and honest labor Findari, the Godess of Air, rewards you with a treasure of Pure Air."); --Pure air
		woodchopping:AddRandomItem(item.gems.getMagicGemId(item.gems.EMERALD),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Im Unterholz erspähst du einen grün funkelnden Gegenstand. Du findest einen magischen Smaragd.","In the undergrowth you spot a green sparkling object. On closer inspection you discover it is a magical emerald."); --Magical emerald
		woodchopping:AddRandomItem(2441,1,333,{},prob_extremely_rarely,"Im Erdboben machst du einen alten, rostigen Helm aus. Ein Überbleibsel einer längst vergessenen Schlacht?","As you work you unearth an old rusty helmet. A remnant of a long-forgotten battle?"); --Storm cap
		woodchopping:AddRandomItem(235,1,333,{},prob_occasionally,"In einer Spechthöhle findest du einen goldenen Ring. Wird er dich ins Dunkle treiben?","From a woodpecker's hole a golden gleam catches your eye, and you discover it is a golden ring."); --gold ring
		woodchopping:AddRandomItem(2664,1,333,{},prob_frequently,"Du findest einen Ast, den man auch sehr gut als Keule verwenden könnte.","You find a branch that resembles a sturdy club."); --Club
		woodchopping:SetTreasureMap(prob_rarely,"Fein säuberlich aufgerollt findest du eine Schatzkarte in einem ausgehöhlten Ast.","You find a treasure map neatly rolled up in a hollowed-out branch.");
		woodchopping:AddMonster(91,prob_rarely,"Dein Frevel gegen die Natur ruft die Wächter der Bäume herbei. Wie aus dem Nichts stampft ein wütender Troll auf dich zu.","From the nearby brush you hear a guttural snarl just before an angry troll emerges into the clearing. There is no doubt his eyes are trained on you.",4,7);

		woodchopping:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		-- egg gathering
		egggathering:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, die Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the god of fire, rewards you with a treasure of Pure Fire."); --Pure fire
		egggathering:AddRandomItem(item.gems.getMagicGemId(item.gems.TOPAZ),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Während du Eier sammelst, bemerkst du einen Stein, welcher sich aber als wirklich beachtenswert herausstellt. Du findest einen magischen Topaz.","While you collect eggs you notice a strange stone. You find a magical topaz!"); --Magical topaz
		egggathering:AddRandomItem(249,1,333,{},prob_occasionally,"Du findest einen ganzen Getreidebündel in dem Nest!","You find a whole bundle of grain!"); --bundle of grain
		egggathering:AddRandomItem(259,1,333,{},prob_frequently,"Du findest eine handvoll Getreide.","You find some grain."); --Steppe fern
		egggathering:SetTreasureMap(prob_rarely,"Im Nest findest du eine Karte.","You find a map in the nest");
		egggathering:AddMonster(1081,prob_rarely,"Während du die Eier stiehlst, hüpft ein wütendes Hühnchen aus dem Nest.","While you steal eggs an angry chickens hops out of the nest!",4,7);

		egggathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--honeygathering
		honeygathering:AddRandomItem(2551,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.","For your hard and honest labor Findari, the Godess of Air, rewards you with a treasure of Pure Air."); --Pure air
		honeygathering:AddRandomItem(item.gems.getMagicGemId(item.gems.RUBY),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Im Inneren des Bienenstocks bemerkst du ein rot glühendes Licht. Du findest einen magischen Rubin.","Inside the hive, you notice a red light. With a closer look you realize it is a magical ruby."); --Magical ruby
		honeygathering:AddRandomItem(2744,1,333,{},prob_extremely_rarely,"Ein Imkerkollege scheint hier seine Pfeife vergessen zu haben. Du nimmst sie an dich.","A beekeeper colleague must have forgotten his pipe for smoking out the bees. You take it with you."); --Pipe
		honeygathering:AddRandomItem(151,1,333,{},prob_occasionally,"Die Bienen haben offensichtlich Vorräte angelegt. Sogar eine ganze Erdbeere haben sie in ihren Stock geschleppt.","As you carefully pull honey from the hive you notice a sticky strawberry in your grasp!"); --Strawberry
		honeygathering:AddRandomItem(431,1,333,{},prob_frequently,"An deinen Händen bleibt klebriger Wachs hängen.","Your hands get stuck in sticky wax.", 0); --Wax
		honeygathering:SetTreasureMap(prob_rarely,"Oh! Jemand hat eine Schatzkarte in diesem Bienenstock versteckt. Was für eine Überraschung!","Oh! Someone has hidden a treasure map in this hive. What a surprise!");
		honeygathering:AddMonster(271,prob_rarely,"Eine über deine Handlungen etwas erboste Wespe scheint sich dazu entschlossen zu haben, deinen Handlungen ein Ende zu setzten.","A wasp, unamused by your deeds, decides to attack!",4,7);

		honeygathering:AddInterruptMessage("Du wirst von etwas in dem Bienenstock gestochen. Was das wohl wahr?", "You feel a sting as you try to work.");
		honeygathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		honeygathering:AddInterruptMessage("Du wirfst kurz einen Blick in den Bienenkorb um nach einer besseren Stelle für Honigwaben zu suchen.", "You decide to search deeper for honeycombs.");
		honeygathering:AddInterruptMessage("Du greifst direkt in eine Stelle mit Honig und ziehst die Hand zurück. Nun bleibt dir wohl nichts anderes übrig als dir die Finger abzulecken.", "You decide to take a short break to lick off honey from your hands");
		honeygathering:AddInterruptMessage("Eine aufdringliche Wespe schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.", "A curious wasp buzzes around your head and you try to scare it away.");

		--milking
		milking:AddRandomItem(2554,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.","For your hard and honest labor Tanora, the Godess of Water, rewards you with a treasure of Pure Water."); --Pure water
		milking:AddRandomItem(item.gems.getMagicGemId(item.gems.TOPAZ),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Während du das Tier melkst, bemerkst einen Stein, welcher sich aber als wirklich beachtenswert herausstellt. Du findest einen magischen Topaz.","While you milk the animal you notice a strange stone. You find a magical topaz!"); --Magical topaz
		milking:AddRandomItem(153,1,333,{},prob_occasionally,"Ein großes Blatt hat sich im Fell des Tieres verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter melkst.","A large leaf was tangled in the fur of the animal. You do a little grooming before you continue milking."); --Foot leaf
		milking:AddRandomItem(156,1,333,{},prob_frequently,"Etwas Gras hat sich im Fell des tieres verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the animal. Before you can continue milking you have to remove the sticky green weed."); --Steppe fern
		milking:SetTreasureMap(prob_rarely,"Das Tier kratzt und schnüffelt aufgeregt am Boden. Dort findest du eine seltsame Karte.","The animal scratches and sniffs on the ground excitdly. You find a strange map there.");
		milking:AddMonster(271,prob_rarely,"Während du das Tiel melkst, umschwirrt dich eine ungewöhnlich agressive Wespe.","While you milk the animal an annoyingly aggressive wasp comes after you!",4,7);

		--farming
		farming:AddRandomItem(2552,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.","For your hard and honest labor Ushara, the Godess of Earth, rewards you with a treasure of Pure Earth."); --Pure earth
		farming:AddRandomItem(item.gems.getMagicGemId(item.gems.RUBY),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Beim Durchpflügen des Erdbodens stößt du auf einen rot scheinenden Stein. Du findest einen magischen Rubin.","While plowing the soil you notice a red stone shining brightly. As you get closer you notice it is a magical ruby."); --Magical ruby
		farming:AddRandomItem(1840,1,333,{},prob_extremely_rarely,"Im Ackerboden ist ein angelaufender Kupferkelch zu finden.","In the arable soil you find a tarnished copper goblet."); --copper goblet
		farming:AddRandomItem(2935,1,333,{},prob_occasionally,"Da hat wohl jemand eine Schüssel verloren, mit der er Saatgut augestreut hat. Nun gehört sie dir.","You dig up an old bowl. Now it belongs to you."); --soup bowl
		farming:AddRandomItem(2760,1,333,{},prob_frequently,"Zwischen den Feldfrüchten findest du ein altes Seil. Nützlich, oder?","Among the crops you find an old rope. Can never have enough rope!"); --rope
		farming:SetTreasureMap(prob_rarely,"In einer Ackerfurche findest du ein altes Pergament mit einem Kreuz darauf. Ob sie dich zu einem vergrabenen Schatz weisen wird?","In a furrow you find an old parchment with a cross on it. Will it show you the way to a buried treasure?");
		farming:AddMonster(111,prob_rarely,"Du stößt bei der Erdarbeit auf alte Knochen. Leider hat sie kein Hund hier vergraben und die Störung der Totenruhe bleibt nicht ungesühnt.","While plowing, you find some old bones. Unfortunately, no dog has buried them here, and the disturbance of the dead unleashes Cherga's wrath.",4,7);

		farming:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--fruitgathering
		fruitgathering:AddRandomItem(2551,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.","For your hard and honest labor Findari, the Godess of Air, rewards you with a treasure of Pure Air."); --Pure air
		fruitgathering:AddRandomItem(item.gems.getMagicGemId(item.gems.AMETHYST),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Zwischen all den Früchten siehst du auf einmal ein strahlendes Etwas. Du findest einen magischen Amethyst.","Between all the fruit you suddenly spot a flickering reflection, a magical amethyst!"); --Magical amethyst
		fruitgathering:AddRandomItem(65,1,333,{},prob_extremely_rarely,"Bei genauer Betrachtung entpuppt sich ein Ast am Boden als Bogen. Ob den ein elfischer Späher hier deponiert hat?","On closer inspection, a branch on the ground turns out to be a bow. Did an elven scout forget it here?"); --short bow
		fruitgathering:AddRandomItem(2295,1,333,{},prob_occasionally,"Über einem Ast hängt ein Paar alter Handschuhe. Der Besitzer vermisst die offenbahr nicht.","Over a branch hangs a pair of old gloves. Judging by their condition no one would miss them."); --cloth gloves
		fruitgathering:AddRandomItem(463,1,333,{},prob_frequently,"Eine Feder hat sich zwischen den Zweigen verfangen. Ob man mit ihr auch schreiben kann?","A feather lies entangled among the branches. Perhaps one could write with it?"); --quill
		fruitgathering:SetTreasureMap(prob_rarely,"Aus dem Augenwinkel siehst du ein altes Stück Pergament, das sich in einem Busch verfangen hat. Als du es dir genauer anschaust, erkennst du, dass es sich um eine Art Karte handelt.","Through the corner of your eye you spot an old parchment snared in a nearby bush. Once it is in your hand you notice it is some kind of map.");
		fruitgathering:AddMonster(271,prob_rarely,"Eine Wespe schnellt heran, um dir die süßen Früchte streitig zu machen.","An agitated wasp darts toward you to contest its claim to the fruit.",4,7);

		fruitgathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--mining
		mining:AddRandomItem(2552,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.","For your hard and honest labor Ushara, the Godess of Earth, rewards you with a treasure of Pure Earth."); --Pure earth
		mining:AddRandomItem(item.gems.getMagicGemId(item.gems.AMETHYST),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Deine Spitzhacke zertrümmert den Fels und zum Vorschein kommt ein eingeschlossener Edelstein. Du findest einen magischen Amethyst.","Your pickaxe smashes the rock and reveals an enclosed gemstone. Wow a magical amethyst!"); --Magical amethyst
		mining:AddRandomItem(310,1,333,{},prob_extremely_rarely,"Zwerge scheinen alten Krügen keine Beachtung beizumessen, insbesondere, wenn sie leer sind. Auch hier liegt einfach einer herum.","Dwarves seem to pay no attention to old pitchers, especially if they are empty. As you work one catches your eye."); --mug with lid
		mining:AddRandomItem(1908,1,333,{},prob_occasionally,"Diese Mine wurde offensichtlich kürzlich von Zwergen aufgesucht. Wie sonst erklärt sich der Bierkrug, den du zwischen dem Geröll findest?","This mine was occupied recently. How else would you explain the beer mug at your feet?"); --beer mug
		mining:AddRandomItem(391,1,333,{},prob_frequently,"In einer Felsspalte liegt eine alte Fackel. Hier ist wohl jemanden ein Licht aufgegangen.","In a crevice you spot an old torch."); --torch
		mining:SetTreasureMap(prob_rarely,"In einer engen Felsspalte findest du ein altes Pergament, das wie eine Karte aussieht. Kein Versteck ist so sicher, dass es nicht gefunden wird.","In a narrow crevice you find an old parchment that looks like a map. No hiding place is too safe that it cannot be found.");
		mining:AddMonster(611,prob_rarely,"Als du den Fels malträtierst, läuft etwas Schleim aus einer Felsspalte...","As you slam your pick-axe on the rock, some slime flows out of a cleavage...",4,7);

		mining:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		mining:AddInterruptMessage("Dir fliegt ein Steinsplitter entgegen. Du kannst gerade noch ausweichen.", "Your hard work has shaken free a stalactite that crashes from overhead. Somehow you manage to avoid any injury as the rubble clears.");
		mining:AddInterruptMessage("Du bekommst etwas Schmutz ins Auge und reibst dir kurz die Augen.", "You feel a flake of dirt in your eye.");
		mining:AddInterruptMessage("Du überprüfst kurz die Struktur der Ader, an der du gerade gräbst.", "You notice a vein ripe with ore and pause to reposition yourself.");
		mining:AddInterruptMessage("Du verlierst kurz das Gleichgewicht durch einen losen Gesteinsbrocken am Boden.", "Some rubble at your feet impedes your progress.");

		--sanddigging
		sanddigging:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, die Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the god of fire, rewards you with a treasure of Pure Fire."); --Pure fire
		sanddigging:AddRandomItem(item.gems.getMagicGemId(item.gems.TOPAZ),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Ein Stein, strahlend wie die heiße Wüstensonne, kommt zwischen all dem Sand zum Vorschein. Du findest einen magischen Topas.","A stone, bright as the hot desert sun, reveals itself beneath your feet. Upon closer inspection it turns out to be a magic topaz."); --Magical topaz
		sanddigging:AddRandomItem(3077,1,333,{},prob_extremely_rarely,"Eine funkelnde Münze liegt auf deinem Schaufelblatt. Hat sich die harte Arbeit doch gelohnt!","A tink of your shovel blade causes you to pause. Then to your surprise it turns out you struck a silver coin!"); --Silver coin
		sanddigging:AddRandomItem(21,1,333,{},prob_occasionally,"Du findest einige noch heiße Kohlen im Sand. Ein Glück, dass du nicht auf diese Überreste einer nächtlichen Grillfeier getreten bist.","As your shovel digs through the sand you unearth an unused lump of coal and discover an abandoned campfire."); --Coal
		sanddigging:AddRandomItem(1266,1,333,{},prob_frequently,"Deine Schaufel stößt auf einen runden Kieselstein.","Your shoulder locks as your shovel drives into a hard stone."); --Rock
		sanddigging:SetTreasureMap(prob_rarely,"Der Sand gibt eine gut erhaltene Karte frei. Die Hitze konnte dem Pergament nichts anhaben.","Deep in the sand sheltered from the desert heat you discover a treasure map!");
		sanddigging:AddMonster(592,prob_rarely,"Tief im Sand stößt du auf etwas schwarzes, krabbelndes. Eine vorschnellende Klaue ist nur der Vorbote dessen, was du gerade erweckt hast.","To your dismay you unearth a bettless hiding place. He furiously lashes his claws trying to defend his home.",4,7);

		sanddigging:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		sanddigging:AddInterruptMessage("Du stößt beim Graben auf einen großen Stein. Der plötzliche Schlag auf die Schaufel lässt sie dir beinahe aus der Hand rutschen", "While digging you hit a big stone; the sudden impact nearly causes you to drop your shovel.");
		sanddigging:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.", "An annoying bug buzzes around your head. You strike at it in order to drive it away.");
		sanddigging:AddInterruptMessage("Das Graben im Sand macht dich sehr durstig und du hältst kurz inne.", "Digging for sand makes you thirsty. You have to take a short break.");
		sanddigging:AddInterruptMessage("Du meinst du hättest etwas vor dir gesehen, aber es war wohl nur eine Luftspiegelung.", "Something in front of you catches your attention. Just a mirage...");

		--claydigging
		claydigging:AddRandomItem(2554,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.","For your hard and honest labor Tanora, the Godess of Water, rewards you with a treasure of Pure Water."); --Pure water
		claydigging:AddRandomItem(item.gems.getMagicGemId(item.gems.OBSIDIAN),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Tief im Matsch stößt deine Schaufel auf etwas hartes. Du findest einen magischen Obsidian.","Deep in the mud your shovel hits on something hard. To your surprise it's a magical obsidian."); --Magical obsidian
		claydigging:AddRandomItem(2658,1,333,{},prob_extremely_rarely,"Du findest eine Knochenhand im Matsch. Sie umklammert ein altes Schwert.","You find a boney hand in the mud clutching an old sword."); --broadsword
		claydigging:AddRandomItem(51,1,333,{},prob_occasionally,"Du ziehst einen alten Eimer aus dem Schlick.","You draw an old bucket from the silt."); --bucket
		claydigging:AddRandomItem(2184,1,333,{},prob_frequently,"Ein Tonkrug offenbahrt sich im Matsch. Die Überreste einer alten Zivilisation oder einfach nur vom letzten Saufgelage?","A clay mug reveals itself in the mud. Perhaps the remains of an ancient civilization or just a littering traveller, who knows?"); --clay cup
		claydigging:SetTreasureMap(prob_rarely,"Von einer Lederhülle umgeben, findest du eine alte Karte. Die hat definitiv niemand absichtlich hier hinterlassen.","Covered in a leather hide you find an old map.");
		claydigging:AddMonster(104,prob_rarely,"Im Morast stößt du auf eine bedauernswerte Moorleiche. Jedoch scheinst du derjenige zu sein, den man fortan betrauern wird.","In the mud your shovel digs unintentionally into a feculent bog body. The stench is atrocious, but what's worse is the undead creature rises to attack.",4,7);

		claydigging:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		claydigging:AddInterruptMessage("Du stößt beim Graben auf einen großen Stein. Der plötzliche Schlag auf die Schaufel lässt sie dir beinahe aus der Hand rutschen", "While digging you hit a big stone, the sudden impact nearly causes you to lose your grip on the handle.");
		claydigging:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.", "An annoying bug buzzes around your head. You swat at it in order to drive it away.");
		claydigging:AddInterruptMessage("Du bekommst einen Schlammspritzer ins Gesicht und musst ihn kurz mit den Ärmel abwischen.", "Mud splatters your face, perhaps Nargún does not favour you today?");
		claydigging:AddInterruptMessage("Das Loch, in dem du gräbst, füllt sich mit Wasser und du mußt es kurz abschöpfen.", "The pit you are digging fills with water causing you to pause in order to scoop it out.");

		--herbgathering
		herbgathering:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, die Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the God of Fire, rewards you with a treasure of Pure Fire."); --Pure fire
		herbgathering:AddRandomItem(item.gems.getMagicGemId(item.gems.SAPPHIRE),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Tief im Gestrüpp machst du ein blaues, unheimliches Leuchten aus. Du findest einen magischen Saphir.","Deep in the shrub you notice a blue, eerie glow. To your delight it turns out to be a magical sapphire."); --Magical sapphire
		herbgathering:AddRandomItem(2183,1,333,{},prob_extremely_rarely,"Ein alter Krug liegt verlassen und einsam im Gebüsch.","An old mug lies abandoned and lonesome in the bushes."); --Mug
		herbgathering:AddRandomItem(799,1,333,{},prob_occasionally,"Ein Weidenkorb liegt am Boden. Er scheint noch brauchbar zu sein.","A wicker basket lies on the ground. It still seems to be usable."); --Basket
		herbgathering:AddRandomItem(2570,1,333,{},prob_frequently,"Ein Griff einer alten Sichel liegt achtlos weggeworfen zwischen Blättern und Ästen herum.","A handle of an old sickle lies between the leaves and branches, but the blade is no where in sight."); --Sickle hilt
		herbgathering:SetTreasureMap(prob_rarely,"Unter einer Lage Blätter stößt du auf eine Schatzkarte. Hoffentlich ist der Besitzer nicht in der Nähe.","Under a layer of leaves you find a treasure map. Hopefully, the owner is not nearby!");
		herbgathering:AddMonster(271,prob_rarely,"Eine Wespe steigt aus dem Gestrüpp auf, offensichtlich unerfreut über die Störung.","A pesky wasp rises from the bushes apparently displeased with your disturbance.",4,7);

		herbgathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		herbgathering:AddInterruptMessage("Ein kleines pelziges Tier springt aus dem Gebüsch und rennt davon. Für einen Moment bist du fürchterlich erschrocken.", "A small, furry critter jumps out of a bush and darts off. That really surprised you.");
		herbgathering:AddInterruptMessage("Du greifst mit der Hand in eine Blattlauskolonie. Verärgert wischt du dir die Hand an der Hose ab.", "The plant is crowded with lice. Annoyed, you wipe your hand clean on your trousers.");
		herbgathering:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.", "An annoying bug buzzes around your head. You strike at it in order to drive it away.");

		--fishing
		fishing:AddRandomItem(2554,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.","For your hard and honest labor Tanora, the Godess of Water, rewards you with a treasure of Pure Water."); --Pure water
		fishing:AddRandomItem(item.gems.getMagicGemId(item.gems.SAPPHIRE),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Im Wasser kaum auszumachen, erspähst du ein blaues Funkeln am Boden des Gewässers. Du findest einen magischen Saphir.","Beneath the rhythmic ripples of the water you spot an odd blue sparkle rich in hue. Wow it's a magical sapphire!"); --Magical sapphire
		fishing:AddRandomItem(51,1,333,{},prob_extremely_rarely,"Ein Eimer verfängt sich in deiner Angelschnur. Den hat hier wohl jemand verloren.","As you tighten your line you feel a heavy resistance. With a careful approach you are able to pull a bucket ashore."); --Bucket
		fishing:AddRandomItem(92,1,333,{},prob_occasionally,"Du ziehst eine glitzernde Öllampe aus dem Wasser. Wo die wohl herkommt...?","You pull a sparkling oil lamp out of the water. Where did that come from?"); --Oil lamp
		fishing:AddRandomItem(53,1,333,{},prob_frequently,"Ein alter, durchlöcherter Lederstiefel hängt am Haken.","As you angle back and forth for fish you feel a snag. Instead of a fish, however, a pair of old perforated boots tied together hangs from your hook!"); --Leather boots
		fishing:SetTreasureMap(prob_rarely,"Statt eines Fisches hast du eine Karte am Haken hängen.","Nargún's favour has finally found you for there is a treasure map on your hook instead of a fish!");
		fishing:AddMonster(101,prob_rarely,"Ein heftiger Ruck reißt dir fast die Angel aus der Hand. Noch während du dich wunderst teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor.","A heavy force pulls on your fishing line momentarily before it releases. Then without warning the water before you erupts as putrified mummy vaults toward you.",4,7);

		-- TODO decide if this should be included
		-- fishing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		fishing:AddInterruptMessage("Ein schwarzer Fleck huscht durch das Wasser. Etwas erschrocken weichst du zurück.", "You notice a large black dot in the water, you decide not to disturb it.");
		fishing:AddInterruptMessage("Der Boden unter dir rutscht leicht weg, sodass du gerade noch das Gleichgewicht halten kannst.", "Some stones slip away from the bank, disturbing all the fish.");
		fishing:AddInterruptMessage("Dein Blick verliert sich für kurze Zeit in deinem Spiegelbild und du bist abgelenkt.", "You take a while to admire that good-looking person staring at you from your reflection.");
		fishing:AddInterruptMessage("Der Köder hängt nicht mehr am Haken. Leicht verärgert befestigst du einen neuen.", "A clever fish stole the bait from you, you affix fresh bait to the hook.");
		-- TODO translate
		-- fishing:AddInterruptMessage("Du weidest deinen bisherigen Fang aus.");

		--woolcutting
		woolcutting:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, der Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the God of Fire, rewards you with a treasure of Pure Fire."); --Pure fire
		woolcutting:AddRandomItem(item.gems.getMagicGemId(item.gems.TOPAZ),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"Während du das Schaf scherst, tritt dein Fuss achtlos gegen einen Stein, welcher sich aber als durchaus beachtenswert herausstellt. Du findest einen magischen Topaz.","While you shear the sheep your foot kicks a stone carelessly. Underneath the rock to your surprise you find a magical topaz!"); --Magical topaz
		woolcutting:AddRandomItem(222,1,333,{},prob_extremely_rarely,"Dieses Schaf trägt ein merkwürdiges Amulett um den Hals. Wer kommt auf solch eine Idee?","This sheep is bearing a strange amulet around its neck. Who had such an idea?"); --Amulet
		woolcutting:AddRandomItem(153,1,333,{},prob_occasionally,"Ein großes Blatt hat sich im Fell des Schafes verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter scherst.","A large leaf was tangled in the fur of the sheep. You do a little grooming before you continue shearing."); --Foot leaf
		woolcutting:AddRandomItem(156,1,333,{},prob_frequently,"Etwas Gras hat sich im Fell des Schafs verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the sheep. Before you can continue shearing you have to remove the sticky green weed."); --Steppe fern
		woolcutting:SetTreasureMap(prob_rarely,"Mit einem lauten 'Mäh' kratzt und schnüffelt das Schaf am Boden. Dort findest du eine seltsame Karte.","With a loud 'Baa' the sheep scratches and sniffs on the ground. Then, as if by magic a strange map appears on the ground.");
		woolcutting:AddMonster(271,prob_rarely,"Während du die Wolle einsammelst, umschwirrt dich eine ungewöhnlich agressive Wespe.","While you gather some wool a annoyingly aggressive wasp comes after you!",4,7);

		woolcutting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--potashproducing
		potashproducing:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, die Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the God of Fire, awards you with a treasure of Pure Fire."); --Pure fire
		potashproducing:AddRandomItem(item.gems.getMagicGemId(item.gems.EMERALD),1,999,item.gems.getMagicGemData(1),prob_extremely_rarely,"In der Asche erspähst du einen grün funkelnden Gegenstand. Du findest einen magischen Smaragd.","Amidst the burning rubble and potash you spot a green sparkling object. To your fortune it is a magical emerald."); --Magical emerald
		potashproducing:SetTreasureMap(prob_rarely,"Fein säuberlich aufgerollt findest du eine Schatzkarte in einem ausgehöhlten Ast. Gut, dass du das Holz noch nicht verbrannt hattest!","Nestled in a hollowed-out branch you find a treasure map neatly rolled up. Luckily you did not burn it yet!");
		potashproducing:AddMonster(271,prob_rarely,"Angezogen vom Licht des wärmenden Feuers, taucht eine agressive Wespe auf.","Attracted to the bright warm light of your fire a aggressive wasp comes after you.",4,7);

		potashproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--entrailscutting
		entrailscutting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--stonecutting
		stonecutting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--sieving
		sieving:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		sieving:AddInterruptMessage("Du machst eine kürzere Pause um die größeren Steine aus dem Rüttelsieb zu entfernen.", "You toss out some small pebbles from the sieve.");
		sieving:AddInterruptMessage("Für einen Moment dachtest du einen Edelstein im Sieb gefunden zu haben, es war aber doch nur ein Stück Glas.", "You look with glee at a shining stone in the sand, but then realise its only a piece of glass");
		sieving:AddInterruptMessage("Du klopfst dir kurz den Sand aus der Kleidung, da er beginnt auf der Haut zu scheuern.", "You blow sand away from your clothes.");

		--flailing
		flailing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		-- TODO translate
		-- flailing:AddInterruptMessage("Du kehrst kurz die Spreu zusammen und bringst sie weg.", "");
		flailing:AddInterruptMessage("Die Dreschstange des Flegels löst sich und du musst sie erneut festbinden.", "The flail's chain appears to be stuck, it takes you some time to fix it.");
		flailing:AddInterruptMessage("Du schaffst das Stroh weg um wieder mehr Platz zu haben.", "You tie a few straw bundles together.");
		flailing:AddInterruptMessage("Deine Hände brennen wie Feuer, deshalb machst du eine kurze Pause. Hoffentlich gibt das keine Blase…", "Your arms appear to be getting very tired, you decide on a short break.");

		--grainharvesting
		grainharvesting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--threadproducing
		threadproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		threadproducing:AddInterruptMessage("Das Material zum Spinnen hat sich verheddert. Du brauchst einen Moment es auseinander zu machen.", "The spinning material gets entangled. You need a moment to remove the knots from it.");
		threadproducing:AddInterruptMessage("Du siehst Gerade noch wie eine Maus ein Bündel Fasern von dir stibitzt. Du rennst der Maus hinterher, woraufhin diese das Bündel fallen lässt.", "You see a mouse nibbling at a few fibers. You try to catch it, causing it to drop them");
		threadproducing:AddInterruptMessage("Du sortierst kurz einige fertige Garnspulen in deine Tasche ein.", "You sort some twisted yarn in your bag.");

		--oilsqueezing
		oilsqueezing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--doughproducing
		doughproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--weaving
		weaving:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--oremelting
		oremelting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--leatherproducing
		leatherproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--boardproducing
		boardproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		boardproducing:AddInterruptMessage("Du bekommst einige Späne in den Mund und mußt husten.", "A cloud of fine splints makes you cough.");
		boardproducing:AddInterruptMessage("Du überprüfst kurz die Maße des Brettes.", "You briefly check the measurements of the board.");
		boardproducing:AddInterruptMessage("Du bekommst einen Holzsplitter in den Finger und mußt Pause machen, um ihn zu entfernen.", "A splinter pierces your finger. You have to take a break to remove it.");
		boardproducing:AddInterruptMessage("Du bekommst einige Sägespäne ins Auge und reibst dir kurz die Augen.", "Fine splints make you rub your eyes.");

		--candleproducing
		candleproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--waxproducing
		waxproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--glassingotproducing
		glassingotproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		glassingotproducing:AddInterruptMessage("Dir rutscht eine Kelle mit Sand aus der Hand und der Sand verteilt sich über den Boden. Nun wirst du erst den Sand aufkehren müssen.", "Some sand slips out of your hand, and you stop to try to scoop it up.");
		glassingotproducing:AddInterruptMessage("Dir rutscht eine Kelle mit Asche aus der Hand und die Asche verteilt sich über den Boden. Nun wirst du erst die Asche aufkehren müssen.", "Some ash falls out of your hand, and you try your best to scoop it up.");
		-- TODO translate
		-- glassingotproducing:AddInterruptMessage("Der fertige Barren klemmt in der Form. Du klopfst sehr stark auf die Rückseite der Form bis er endlich heraus fällt.", "");
		-- glassingotproducing:AddInterruptMessage("Für einen Moment hast du vergessen wo du die Kelle zum Sand schaufeln hingelegt hast und musst nach ihr suchen.", ");
		glassingotproducing:AddInterruptMessage("Du beseitigst eine Verstopfung des Glasblasrohres.", "You remove an obstruction from the glass-blowing rod.");

		--bricksproducing
		bricksproducing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		bricksproducing:AddInterruptMessage("Du bekommst den Ziegel nicht aus der Form und musst deshalb stark auf die Form klopfen bis er heraus fällt.", "A brick refuses to come out of the mould, it takes some time for you to get it out.");
		bricksproducing:AddInterruptMessage("Bevor du weiter machst reinigst du deine Hände kurz vom feuchten Lehm der an den Fingern klebt.", "You wash your hands of the wet clay.");
		bricksproducing:AddInterruptMessage("Du holst einen Stein aus dem Lehm. Zum Glück hast du ihn noch vor dem brennen bemerkt, sonst wäre der Ziegel bestimmt gebrochen.", "You fish out a stone from the wet clay. Fortunately you have found it, otherwise the brick would have probably been broken.");

		--smokefood
		smokefood:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

		--graingrinding
		graingrinding:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		graingrinding:AddInterruptMessage("Du klopfst dir das Mehl aus der Kleidung da du das Gefühl hast wie ein Geist auszusehen.", "You beat the flour out of your clothes so that you do not look like a ghost anymore.");
		graingrinding:AddInterruptMessage("Gerade noch kannst du verhindern, dass ein Stein der sich wohl ins Korn gemogelt hatte, in das Mühlrad fällt.", "You just manage to catch a stone that whould have fallen into the millstone.");
		graingrinding:AddInterruptMessage("Du säuberst kurz den Mühlstein um eine bessere Qualität des Mehls zu erreichen.", "You clean the millstone in order to ensure a good quality of the flour.");

		--dyeing
		dyeing:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		dyeing:AddInterruptMessage("Ein großer dicker Käfer ist irgendwie in die Farbe gelangt. Du benötigst eine Weile ihn zu fangen und mit ihm das zu machen was er verdient hat.", "A big, fat bug has found its way into your dye. It takes a while to catch it and seal its fate.");

		Init = 1;
	end
end
