require("base.gatheringcraft")

module("content.gathering", package.seeall)

function InitGathering()
	if(Init == nil) then
        -- if FastAction==true then the probabilities are again reduced in FindRandomItem, see gatheringcraft.lua
		local prob_frequently = 0.1;
		local prob_occasionally = 0.05;
		local prob_rarely = 0.01;
		local prob_extremely_rarely = 0.005;
		woodchopping = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "strength", LeadSkill = "lumberjacking", LeadSkillGroup = 2}; -- id_74_axe
		honeygathering = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "constitution", LeadSkill = "peasantry", LeadSkillGroup = 2}; -- id_1005_beehive
		farming = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "constitution", LeadSkill = "peasantry", LeadSkillGroup = 2, FastActionFactor = 0.5}; -- seeds, id_126_sickle
		fruitgathering = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "constitution", LeadSkill = "peasantry", LeadSkillGroup = 2}; -- harvest
		mining = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "strength", LeadSkill = "mining", LeadSkillGroup = 2}; -- id_2763_pickaxe
		sanddigging = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "strength", LeadSkill = "mining", LeadSkillGroup = 2}; -- id_24_shovel
		claydigging = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "strength", LeadSkill = "mining", LeadSkillGroup = 2}; -- id_24_shovel
		herbgathering = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "perception", LeadSkill = "herb lore", LeadSkillGroup = 2}; -- id_126_sickle
		fishing = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "perception", LeadSkill = "fishing", LeadSkillGroup = 2}; -- id_72_fishingrod
		woolcutting = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "dexterity", LeadSkill = "peasantry", LeadSkillGroup = 2}; -- id_6_scissors
		potashproducing = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "dexterity", LeadSkill = "lumberjacking", LeadSkillGroup = 2}; -- item.id_12_campfire
        
		entrailscutting = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "dexterity", LeadSkill = "tailoring", LeadSkillGroup = 2}; -- id_6_scissors
		stonecutting = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "strength", LeadSkill = "mining", LeadSkillGroup = 2}; -- id_737_chisel
		sieving = base.gatheringcraft.GatheringCraft:new{LeadAttrib = "dexterity", LeadSkill = "mining", LeadSkillGroup = 2}; -- id_727_sieve
		-- TODO
        -- id_258_flail ("peasantry") TODO:create new category
        -- id_52_filledbucket ("peasantry")
        -- id_171_spinningwheel TODO: new category? currently in woolcutting
        -- id_44_squeezer
        -- id_119_backingoven
        -- id_169_loom
        -- id_220_barrel
        -- id_250_mill
        -- id_271_scythe
        -- id_305_smokingoven
        -- id_313_glassmeltoven
        -- id_428_candletable
        -- id_429_candlemold
        -- id_724_workbench
        -- id_2052_stretcher
        -- id_2836_forge


		--woodchopping

		woodchopping:AddRandomItem(2551,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.","For your hard and honest labor Findari, the Godess of Air, rewards you with a treasure of Pure Air."); --Pure air
		woodchopping:AddRandomItem(45,1,333,1,prob_extremely_rarely,"Im Unterholz erspähst du einen grün funkelnden Gegenstand. Du findest einen magischen Smaragd.","In the undergrowth you spot a green sparkling object. On closer inspection you discover it is a magical emerald."); --Magical emerald
		woodchopping:AddRandomItem(2441,1,333,{},prob_extremely_rarely,"Im Erdboben machst du einen alten, rostigen Helm aus. Ein Überbleibsel einer längst vergessenen Schlacht?","As you work you unearth an old rusty helmet. A remnant of a long-forgotten battle?"); --Storm cap
		woodchopping:AddRandomItem(235,1,333,{},prob_occasionally,"In einer Spechthöhle findest du einen goldenen Ring. Wird er dich ins Dunkle treiben?","From a woodpecker's hole a golden gleam catches your eye, and you discover it is a golden ring."); --gold ring
		woodchopping:AddRandomItem(2664,1,333,{},prob_frequently,"Du findest einen Ast, den man auch sehr gut als Keule verwenden könnte.","You find a branch that resembles a sturdy club."); --Club
		woodchopping:SetTreasureMap(prob_rarely,"Fein säuberlich aufgerollt findest du eine Schatzkarte in einem ausgehöhlten Ast.","You find a treasure map neatly rolled up in a hollowed-out branch.");
		woodchopping:AddMonster(221,prob_rarely,"Dein Frevel gegen die Natur ruft die Wächter der Bäume herbei. Wie aus dem Nichts stampft ein wütender Troll auf dich zu.","From the nearby brush you hear a guttural snarl just before an angry troll emerges into the clearing. There is no doubt his eyes are trained on you.",4,7);


		--honeygathering

		honeygathering:AddRandomItem(2551,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.","For your hard and honest labor Findari, the Godess of Air, rewards you with a treasure of Pure Air."); --Pure air
		honeygathering:AddRandomItem(46,1,333,1,prob_extremely_rarely,"Im Inneren des Bienenstocks bemerkst du ein rot glühendes Licht. Du findest einen magischen Rubin.","Inside the hive, you notice a red light. With a closer look you realize it is a magical ruby."); --Magical ruby
		honeygathering:AddRandomItem(2744,1,333,{},prob_extremely_rarely,"Ein Imkerkollege scheint hier seine Pfeife vergessen zu haben. Du nimmst sie an dich.","A beekeeper colleague must have forgotten his pipe for smoking out the bees. You take it with you."); --Pipe
		honeygathering:AddRandomItem(151,1,333,{},prob_occasionally,"Die Bienen haben offensichtlich Vorräte angelegt. Sogar eine ganze Erdbeere haben sie in ihren Stock geschleppt.","As you carefully pull honey from the hive you notice a sticky strawberry in your grasp!"); --Strawberry
		honeygathering:AddRandomItem(431,1,333,{},prob_frequently,"An deinen Händen bleibt klebriger Wachs hängen.","Your hands get stuck in sticky wax.", 0); --Wax
		honeygathering:SetTreasureMap(prob_rarely,"Oh! Jemand hat eine Schatzkarte in diesem Bienenstock versteckt. Was für eine Überrachung!","Oh! Someone has hidden a treasure map in this hive. What a surprise!");
		honeygathering:AddMonster(122,prob_rarely,"Eine über deine Handlungen etwas erboste Biene scheint sich dazu entschlossen zu haben, deinen Handlungen ein Ende zu setzten.","A bee, unamused by your deeds, decides to attack!",4,7);
		
		honeygathering:AddInterruptMessage("Du wirst von etwas in dem Bienenstock gestochen. Was das wohl wahr?", "You feel a sting as you try to work.");
		honeygathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		honeygathering:AddInterruptMessage("Du wirfst kurz einen Blick in den Bienenkorb um nach einer besseren Stelle für Honigwaben zu suchen.", "You decide to search deeper for honeycombs.");
		honeygathering:AddInterruptMessage("Du greifst direkt in eine Stelle mit Honig und ziehst die Hand zurück. Nun bleibt dir wohl nichts anderes übrig als dir die Finger abzulecken.", "You decide to take a short break to lick off honey from your hands");
		honeygathering:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.", "A curious bee buzzes around your head and you try to scare it away.");


		--farming

		farming:AddRandomItem(2552,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.","For your hard and honest labor Ushara, the Godess of Earth, rewards you with a treasure of Pure Earth."); --Pure earth
		farming:AddRandomItem(46,1,333,1,prob_extremely_rarely,"Beim Durchpflügen des Erdbodens stößt du auf einen grün scheinenden Stein. Du findest einen magischen Smaragd.","While plowing the soil you notice a green stone shining brightly. As you get closer you notice it is a magical emerald."); --Magical ruby
		farming:AddRandomItem(1840,1,333,{},prob_extremely_rarely,"Im Ackerboden ist ein angelaufender Kupferkelch zu finden.","In the arable soil you find a tarnished copper goblet."); --copper goblet
		farming:AddRandomItem(2935,1,333,{},prob_occasionally,"Da hat wohl jemand eine Schüssel verloren, mit der er Saatgut augestreut hat. Nun gehört sie dir.","You dig up an old bowl. Now it belongs to you."); --soup bowl
		farming:AddRandomItem(2760,1,333,{},prob_frequently,"Zwischen den Feldfrüchten findest du ein altes Seil. Nützlich, oder?","Among the crops you find an old rope. Can never have enough rope!"); --rope
		farming:SetTreasureMap(prob_rarely,"In einer Ackerfurche findest du ein altes Pergament mit einem Kreuz darauf. Ob sie dich zu einem vergrabenen Schatz weisen wird?","In a furrow you find an old parchment with a cross on it. Will it show you the way to a buried treasure?");
		farming:AddMonster(111,prob_rarely,"Du stößt bei der Erdarbeit auf alte Knochen. Leider hat sie kein Hund hier vergraben und die Störung der Totenruhe bleibt nicht ungesühnt.","While plowing, you find some old bones. Unfortunately, no dog has buried them here, and the disturbance of the dead unleashes Cherga's wrath.",4,7);

		--fruitgathering

		fruitgathering:AddRandomItem(2551,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.","For your hard and honest labor Findari, the Godess of Air, rewards you with a treasure of Pure Air."); --Pure air
		fruitgathering:AddRandomItem(197,1,333,1,prob_extremely_rarely,"Zwischen all den Früchten siehst du auf einmal ein strahlendes Etwas. Du findest einen magischen Amethyst.","Between all the fruit you suddenly spot a flickering reflection, a magical amethyst!"); --Magical amethyst
		fruitgathering:AddRandomItem(65,1,333,{},prob_extremely_rarely,"Bei genauer Betrachtung entpuppt sich ein Ast am Boden als Bogen. Ob den ein elfischer Späher hier deponiert hat?","On closer inspection, a branch on the ground turns out to be a bow. Did an elven scout forget it here?"); --short bow
		fruitgathering:AddRandomItem(2295,1,333,{},prob_occasionally,"Über einem Ast hängt ein Paar alter Handschuhe. Der Besitzer vermisst die offenbahr nicht.","Over a branch hangs a pair of old gloves. Judging by their condition no one would miss them."); --cloth gloves
		fruitgathering:AddRandomItem(463,1,333,{},prob_frequently,"Eine Feder hat sich zwischen den Zweigen verfangen. Ob man mit ihr auch schreiben kann?","A feather lies entangled among the branches. Perhaps one could write with it?"); --quill
		fruitgathering:SetTreasureMap(prob_rarely,"Aus dem Augenwinkel siehst du ein altes Stück Pergament, das sich in einem Busch verfangen hat. Als du es dir genauer anschaust, erkennst du, dass es sich um eine Art Karte handelt.","Through the corner of your eye you spot an old parchment snared in a nearby bush. Once it is in your hand you notice it is some kind of map.");
		fruitgathering:AddMonster(121,prob_rarely,"Eine Wespe schnellt heran, um dir die süßen Früchte streitig zu machen.","An agitated wasp darts toward you to contest its claim to the fruit.",4,7);
		

		--mining

		mining:AddRandomItem(2552,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.","For your hard and honest labor Ushara, the Godess of Earth, rewards you with a treasure of Pure Earth."); --Pure earth
		mining:AddRandomItem(197,1,333,1,prob_extremely_rarely,"Deine Spitzhacke zertrümmert den Fels und zum Vorschein kommt ein eingeschlossener Edelstein. Du findest einen magischen Amethyst.","Your pickaxe smashes the rock and reveals an enclosed gemstone. Wow a magical amethyst!"); --Magical amethyst
		mining:AddRandomItem(310,1,333,{},prob_extremely_rarely,"Zwerge scheinen alten Krügen keine Beachtung beizumessen, insbesondere, wenn sie leer sind. Auch hier liegt einfach einer herum.","Dwarves seem to pay no attention to old pitchers, especially if they are empty. As you work one catches your eye."); --mug with lid
		mining:AddRandomItem(1908,1,333,{},prob_occasionally,"Diese Mine wurde offensichtlich kürzlich von Zwergen aufgesucht. Wie sonst erklärt sich der Bierkrug, den du zwischen dem Geröll findest?","This mine was occupied recently. How else would you explain the beer mug at your feet?"); --beer mug
		mining:AddRandomItem(391,1,333,{},prob_frequently,"In einer Felsspalte liegt eine alte Fackel. Hier ist wohl jemanden ein Licht aufgegangen.","In a crevice you spot an old torch."); --torch
		mining:SetTreasureMap(prob_rarely,"In einer engen Felsspalte findest du ein altes Pergament, das wie eine Karte aussieht. Kein Versteck ist so sicher, dass es nicht gefunden wird.","In a narrow crevice you find an old parchment that looks like a map. No hiding place is too safe that it cannot be found.");
		mining:AddMonster(301,prob_rarely,"Als du den Fels malträtierst, erbebt die Erde und der Stein, den du eben noch mit der Spitzhacke schlugst, erhebt sic…","Your misguided strike makes contact with an enchanted rock but not just any enchanted rock. This one groans and rises from the earth in disgruntled bane!",4,7);
		
		mining:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		mining:AddInterruptMessage("Dir fliegt ein Steinsplitter entgegen. Du kannst gerade noch ausweichen.", "Your hard work has shaken free a stalactite that crashes from overhead. Somehow you manage to avoid any injury as the rubble clears.");
		mining:AddInterruptMessage("Du bekommst etwas Schmutz ins Auge und reibst dir kurz die Augen.", "You feel a flake of dirt in your eye.");
		mining:AddInterruptMessage("Du überprüfst kurz die Struktur der Ader, an der du gerade gräbst.", "You notice a vein ripe with ore and pause to reposition yourself.");
		mining:AddInterruptMessage("Du verlierst kurz das Gleichgewicht durch einen losen Gesteinsbrocken am Boden.", "Some rubble at your feet impedes your progress.");

		--sanddigging

		sanddigging:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, die Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the god of fire, rewards you with a treasure of Pure Fire."); --Pure fire
		sanddigging:AddRandomItem(198,1,333,1,prob_extremely_rarely,"Ein Stein, strahlend wie die heiße Wüstensonne, kommt zwischen all dem Sand zum Vorschein. Du findest einen magischen Topa.","A stone, bright as the hot desert sun, reveals itself beneath your feet. Upon closer inspection it turns out to be a magic topaz."); --Magical topaz
		sanddigging:AddRandomItem(3077,1,333,{},prob_extremely_rarely,"Eine funkelnde Münze liegt auf deinem Schaufelblatt. Hat sich die harte Arbeit doch gelohnt!","A tink of your shovel blade causes you to pause. Then to your surprise it turns out you struck a silver coin!"); --Silver coin
		sanddigging:AddRandomItem(21,1,333,{},prob_occasionally,"Du findest einige noch heiße Kohlen im Sand. Ein Glück, dass du nicht auf diese Überreste einer nächtlichen Grillfeier getreten bist.","As your shovel digs through the sand you unearth an unused lump of coal and discover an abandoned campfire."); --Coal
		sanddigging:AddRandomItem(1266,1,333,{},prob_frequently,"Deine Schaufel stößt auf einen runden Kieselstein.","Your shoulder locks as your shovel drives into a hard stone."); --Rock
		sanddigging:SetTreasureMap(prob_rarely,"Der Sand gibt eine gut erhaltene Karte frei. Die Hitze konnte dem Pergament nichts anhaben.","Deep in the sand sheltered from the desert heat you discover a treasure map!");
		sanddigging:AddMonster(161,prob_rarely,"Tief im Sand stößt du auf etwas schwarzes, krabbelndes. Ein vorschnellender Stachel ist nur der Vorbote dessen, was du gerade erweckt hast.","To your dismay you unearth a scorpion's hiding place. He furiously lashes his stringer trying to defend his home.",4,7);
		
		sanddigging:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		sanddigging:AddInterruptMessage("Du stößt beim Graben auf einen großen Stein. Der plötzliche Schlag auf die Schaufel lässt sie dir beinahe aus der Hand rutschen", "While digging you hit a big stone; the sudden impact nearly causes you to drop your shovel.");
		sanddigging:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.", "An annoying bug buzzes around your head. You strike at it in order to drive it away.");
		sanddigging:AddInterruptMessage("Das Graben im Sand macht dich sehr durstig und du hältst kurz inne.", "Digging for sand makes you thirsty. You have to take a short break.");
		sanddigging:AddInterruptMessage("Du meinst du hättest etwas vor dir gesehen, aber es war wohl nur eine Luftspiegelung.", "Something in front of you catches your attention. Just a mirage...");

		--claydigging

		claydigging:AddRandomItem(2554,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.","For your hard and honest labor Tanora, the Godess of Water, rewards you with a treasure of Pure Water."); --Pure water
		claydigging:AddRandomItem(283,1,333,1,prob_extremely_rarely,"Tief im Matsch stößt deine Schaufel auf etwas hartes. Du findest einen magischen Schwarzstein.","Deep in the mud your shovel hits on something hard. To your surprise it's a magical blackstone."); --Magical blackstone
		claydigging:AddRandomItem(2658,1,333,{},prob_extremely_rarely,"Du findest eine Knochenhand im Matsch. Sie umklammert ein altes Schwert.","You find a boney hand in the mud clutching an old sword."); --broadsword
		claydigging:AddRandomItem(51,1,333,{},prob_occasionally,"Du ziehst einen alten Eimer aus dem Schlick.","You draw an old bucket from the silt."); --bucket
		claydigging:AddRandomItem(2184,1,333,{},prob_frequently,"Ein Tonkrug offenbahrt sich im Matsch. Die Überreste einer alten Zivilisation oder einfach nur vom letzten Saufgelage?","A clay mug reveals itself in the mud. Perhaps the remains of an ancient civilization or just a littering traveller, who knows?"); --clay cup
		claydigging:SetTreasureMap(prob_rarely,"Von einer Lederhülle umgeben, findest du eine alte Karte. Die hat definitiv niemand absichtlich hier hinterlassen.","Covered in a leather hide you find an old map.");
		claydigging:AddMonster(341,prob_rarely,"Im Morast stößt du auf eine bedauernswerte Moorleiche. Jedoch scheinst du derjenige zu sein, den man fortan betrauern wird.","In the mud your shovel digs unintentionally into a feculent bog body. The stench is atrocious, but what's worse is the undead creature rises to attack.",4,7);
		
		claydigging:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
		claydigging:AddInterruptMessage("Du stößt beim Graben auf einen großen Stein. Der plötzliche Schlag auf die Schaufel lässt sie dir beinahe aus der Hand rutschen", "While digging you hit a big stone, the sudden impact nearly causes you to lose your grip on the handle.");
		claydigging:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.", "An annoying bug buzzes around your head. You swat at it in order to drive it away.");
		claydigging:AddInterruptMessage("Du bekommst einen Schlammspritzer ins Gesicht und musst ihn kurz mit den Ärmel abwischen.", "Mud splatters your face, perhaps Nargún does not favor you today?");
		claydigging:AddInterruptMessage("Das Loch, in dem du gräbst, füllt sich mit Wasser und du mußt es kurz abschöpfen.", "The pit you are digging fills with water causing you to pause in order to scoop it out.");


		--herbgathering

		herbgathering:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, die Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the God of Fire, rewards you with a treasure of Pure Fire."); --Pure fire
		herbgathering:AddRandomItem(284,1,333,1,prob_extremely_rarely,"Tief im Gestrüpp machst du ein blaues, unheimliches Leuchten aus. Du findest einen magischen Blaustein.","Deep in the shrub you notice a blue, eerie glow. To your delight it turns out to be a magical bluestone."); --Magical bluestone
		herbgathering:AddRandomItem(2183,1,333,{},prob_extremely_rarely,"Ein alter Krug liegt verlassen und einsam im Gebüsch.","An old mug lies abandoned and lonesome in the bushes."); --Mug
		herbgathering:AddRandomItem(799,1,333,{},prob_occasionally,"Ein Weidenkorb liegt am Boden. Er scheint noch brauchbar zu sein.","A wicker basket lies on the ground. It still seems to be usable."); --Basket
		herbgathering:AddRandomItem(2570,1,333,{},prob_frequently,"Ein Griff einer alten Sichel liegt achtlos weggeworfen zwischen Blättern und Ästen herum.","A handle of an old sickle lies between the leaves and branches, but the blade is no where in sight."); --Sickle hilt
		herbgathering:SetTreasureMap(prob_rarely,"Unter einer Lage Blätter stößt du auf eine Schatzkarte. Hoffentlich ist der Besitzer nicht in der Nähe.","Under a layer of leaves you find a treasure map. Hopefully, the owner is not nearby!");
		herbgathering:AddMonster(132,prob_rarely,"Einige Fliegen steigen aus dem Gestrüpp auf, offensichtlich unerfreut über die Störung.","Some pesky flies rise in a swarm from the bushes apparently displeased with your disturbance.",4,7);
		

		--fishing

		fishing:AddRandomItem(2554,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.","For your hard and honest labor Tanora, the Godess of Water, rewards you with a treasure of Pure Water."); --Pure water
		fishing:AddRandomItem(284,1,333,3,prob_extremely_rarely,"Im Wasser kaum auszumachen, erspähst du ein blaues Funkeln am Boden des Gewässers. Du findest einen magischen Blaustein.","Beneath the rhythmic ripples of the water you spot an odd blue sparkle rich in hue. Wow it's a magical bluestone!"); --Magical bluestone
		fishing:AddRandomItem(51,1,333,{},prob_extremely_rarely,"Ein Eimer verfängt sich in deiner Angelschnur. Den hat hier wohl jemand verloren.","As you tighten your line you feel a heavy resistance. With a careful approach you are able to pull a bucket ashore."); --Bucket
		fishing:AddRandomItem(92,1,333,{},prob_occasionally,"Du ziehst eine glitzernde Öllampe aus dem Wasser. Wo die wohl herkommt...?","You pull a sparkling oil lamp out of the water. Where did that come from?"); --Oil lamp
		fishing:AddRandomItem(53,1,333,{},prob_frequently,"Ein alter, durchlöcherter Lederstiefel hängt am Haken.","As you angle back and forth for fish you feel a snag. Instead of a fish, however, a pair of old perforated boots tied together hangs from your hook!"); --Leather boots
		fishing:SetTreasureMap(prob_rarely,"Statt eines Fisches hast du eine Karte am Haken hängen.","Nargún's favor has finally found you for there is a treasure map on your hook instead of a fish!");
		fishing:AddMonster(101,prob_rarely,"Ein heftiger Ruck reißt dir fast die Angel aus der Hand. Noch während du dich wunderst teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor.","A heavy force pulls on your fishing line momentarily before it releases. Then without warning the water before you erupts as putrified mummy vaults toward you.",4,7);
		

		--woolcutting

		woolcutting:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, der Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the God of Fire, rewards you with a treasure of Pure Fire."); --Pure fire
		woolcutting:AddRandomItem(285,1,333,1,prob_extremely_rarely,"Während du das Schaf scherst, tritt dein Fuss achtlos gegen einen Stein, welcher sich aber als durchaus beachtenswert herausstellt. Du findest einen magischen Diamant.","While you shear the sheep your foot kicks a stone carelessly. Underneath the rock to your surprise you find a magical diamond!"); --Magical diamond
		woolcutting:AddRandomItem(222,1,333,{},prob_extremely_rarely,"Dieses Schaf trägt ein merkwürdiges Amulett um den Hals. Wer kommt auf solch eine Idee?","This sheep is bearing a strange amulet around its neck. Who had such an idea?"); --Amulet
		woolcutting:AddRandomItem(153,1,333,{},prob_occasionally,"Ein großes Blatt hat sich im Fell des Schafes verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter scherst.","A large leaf was tangled in the fur of the sheep. You do a little grooming before you continue shearing."); --Foot leaf
		woolcutting:AddRandomItem(156,1,333,{},prob_frequently,"Etwas Gras hat sich im Fell des Schafs verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the sheep. Before you can continue shearing you have to remove the sticky green weed."); --Steppe fern
		woolcutting:SetTreasureMap(prob_rarely,"Mit einem lauten 'Mäh' kratzt und schnüffelt das Schaf am Boden. Dort findest du eine seltsame Karte.","With a loud 'Baa' the sheep scratches and sniffs on the ground. Then, as if by magic a strange map appears on the ground.");
		woolcutting:AddMonster(131,prob_rarely,"Während du die Wolle einsammelst, formiert sich ein lästiger Schwarm ungeöhnlich agressiver Fliegen.","While you gather some wool a swarm of annoyingly aggressive flies come after you!",4,7);
		
		--potashproducing

		potashproducing:AddRandomItem(2553,1,333,{},prob_extremely_rarely,"Für deine harte und ehrliche Arbeit belohnt dich Brágon, die Gott des Feuers, mit einem Kleinod aus Reinem Feuer.","For your hard and honest labor Brágon, the God of Fire, awards you with a treasure of Pure Fire."); --Pure fire
		potashproducing:AddRandomItem(45,1,333,1,prob_extremely_rarely,"In der Asche erspähst du einen grün funkelnden Gegenstand. Du findest einen magischen Smaragd.","Amidst the burning rubble and potash you spot a green sparkling object. To your fortune it is a magical emerald."); --Magical emerald
		potashproducing:SetTreasureMap(prob_rarely,"Fein säuberlich aufgerollt findest du eine Schatzkarte in einem ausgehöhlten Ast. Gut, dass du das Holz noch nicht verbrannt hattest!","Nestled in a hollowed-out branch you find a treasure map neatly rolled up. Luckily you did not burn it yet!");
		potashproducing:AddMonster(131,prob_rarely,"Angezogen vom Licht des wärmenden Feuers, taucht ein schwarm agressiver Insekten auf.","Attracted to the bright warm light of your fire a swarm of aggressive flies come after you.",4,7);

		Init = 1;
	end
end
