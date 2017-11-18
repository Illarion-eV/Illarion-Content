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

local gatheringcraft = require("base.gatheringcraft")
local gems = require("item.gems")

module("content.gathering", package.seeall)

function InitGathering()
    if(startGathering == nil) then

        -- if FastAction==true then the probabilities are again reduced in FindRandomItem, see gatheringcraft.lua

        local prob_frequently = 0.005; --0.5% (1/200)
        local prob_occasionally = 0.0025; --0.25% (1/400)
        local prob_rarely = 0.001; --0.1% (1/1000)
        local prob_extremely_rarely = 0.00025; --0.025% (1/4000)

        woodchopping = gatheringcraft.GatheringCraft:new{LeadSkill = Character.woodcutting, LearnLimit = 100}; -- id_74_axe
        honeygathering = gatheringcraft.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}; -- id_1005_beehive
        egggathering = gatheringcraft.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}; -- egg collecting
        milking = gatheringcraft.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}; -- id_2498_empty_bottle
        farming = gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = 100}; -- seeds, id_126_sickle
        fruitgathering = gatheringcraft.GatheringCraft:new{FastActionFactor = 0.5}; -- harvest
        mining = gatheringcraft.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_2763_pickaxe
        sanddigging = gatheringcraft.GatheringCraft:new{LeadSkill = Character.digging, LearnLimit = 100}; -- id_24_shovel
        snowballmaking = gatheringcraft.GatheringCraft:new{};
        claydigging = gatheringcraft.GatheringCraft:new{LeadSkill = Character.digging, LearnLimit = 100}; -- id_24_shovel
        herbgathering = gatheringcraft.GatheringCraft:new{LeadSkill = Character.herblore, LearnLimit = 100}; -- id_126_sickle
        fishing = gatheringcraft.GatheringCraft:new{LeadSkill = Character.fishing, LearnLimit = 100}; -- id_72_fishingrod
        woolcutting = gatheringcraft.GatheringCraft:new{LeadSkill = Character.tanningAndWeaving, LearnLimit = 100}; -- id_6_scissors
        grainharvesting = gatheringcraft.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = 100}; -- id_271_scythe
        
        --woodchopping
        woodchopping:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        woodchopping:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        woodchopping:SetShard(prob_rarely,"Deine Axt stößt auf einen Splitter eines magischen Artefaktes.", "You hatchet hits a shard of a magical artifact."); -- Any shard
        woodchopping:AddRandomItem(2441,1,333,{},prob_extremely_rarely,"Im Erdboden machst du einen alten, rostigen Helm aus. Ein Überbleibsel einer längst vergessenen Schlacht?","As you work you unearth an old rusty helmet. A remnant of a long-forgotten battle?"); --Storm cap
        woodchopping:AddRandomItem(235,1,333,{},prob_occasionally,"In einer Spechthöhle findest du einen goldenen Ring. Wird er dich ins Dunkle treiben?","From a woodpecker's hole a golden gleam catches your eye, and you discover it is a golden ring."); --gold ring
        woodchopping:AddRandomItem(2664,1,333,{},prob_frequently,"Du findest einen Ast, den man auch sehr gut als Keule verwenden könnte.","You find a branch that resembles a sturdy club."); --Club
        woodchopping:SetTreasureMap(prob_rarely,"Fein säuberlich aufgerollt findest du eine Schatzkarte in einem ausgehöhlten Ast.","You find a treasure map neatly rolled up in a hollowed-out branch.");
        woodchopping:AddMonster(91,prob_rarely,"Dein Frevel gegen die Natur ruft die Wächter der Bäume herbei. Wie aus dem Nichts stampft ein wütender Troll auf dich zu.","From the nearby brush you hear a guttural snarl just before an angry troll emerges into the clearing. There is no doubt his eyes are trained on you.",4,7);
        woodchopping:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

        -- egg gathering
        egggathering:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        egggathering:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        egggathering:SetShard(prob_rarely,"An einem Ei klebt ein Splitter eines magischen Artefaktes.", "A shard of a magical artifact is stuck to an egg."); -- Any shard
        egggathering:AddRandomItem(249,1,333,{},prob_occasionally,"Für dieses Nest wurde ein ganzes Bündel Getreide als Nistmaterial verwendet.","A bundle of grain was used as nesting material for this nest."); --bundle of grain
        egggathering:AddRandomItem(463,1,333,{},prob_frequently,"Du findest eine besonders große Feder, mit der man sicher auch gut schreiben kann.","You find a big feather that looks suitable for writing."); --Quill
        egggathering:SetTreasureMap(prob_rarely,"Unter dem Nest findest du eine Karte. Kein gutes Versteck!","Under the nest, you find a map. Not a good hiding place.");
        egggathering:AddMonster(622,prob_rarely,"Während du die Eier stiehlst, hüpft ein wütendes Hühnchen aus dem Nest.","While you steal eggs an angry chickens hops out of the nest!",4,7);
        egggathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

        --honeygathering
        honeygathering:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        honeygathering:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        honeygathering:SetShard(prob_rarely,"Im Honig findest du einen Splitter eines magischen Artefaktes.", "You find a shard of a magical artifact in the honey comb."); -- Any shard
        honeygathering:AddRandomItem(2744,1,333,{},prob_extremely_rarely,"Ein Imkerkollege scheint hier seine Pfeife vergessen zu haben. Du nimmst sie an dich.","A beekeeper colleague must have forgotten his pipe for smoking out the bees. You take it with you."); --Pipe
        honeygathering:AddRandomItem(151,1,333,{},prob_occasionally,"Die Bienen haben offensichtlich Vorräte angelegt. Sogar eine ganze Erdbeere haben sie in ihren Stock geschleppt.","As you carefully pull honey from the hive you notice a sticky strawberry in your grasp!"); --Strawberry
        honeygathering:AddRandomItem(431,1,333,{},prob_frequently,"An deinen Händen bleibt klebriger Wachs hängen.","Your hands get stuck in sticky wax.", 0); --Wax
        honeygathering:SetTreasureMap(prob_rarely,"Oh! Jemand hat eine Schatzkarte in diesem Bienenstock versteckt. Was für eine Überraschung!","Oh! Someone has hidden a treasure map in this hive. What a surprise!");
        honeygathering:AddMonster(271,prob_rarely,"Eine über deine Handlungen etwas erboste Wespe scheint sich dazu entschlossen zu haben, deinen Handlungen ein Ende zu setzten.","A wasp, unamused by your deeds, decides to attack!",4,7);
        honeygathering:AddInterruptMessage("Du wirst von etwas in dem Bienenstock gestochen. Was das wohl wahr?", "You feel a sting as you try to work.");
        honeygathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        honeygathering:AddInterruptMessage("Du wirfst kurz einen Blick in den Bienenkorb um nach einer besseren Stelle für Honigwaben zu suchen.", "You decide to search deeper for honeycombs.");
        honeygathering:AddInterruptMessage("Du greifst direkt in eine Stelle mit Honig und ziehst die Hand zurück. Nun bleibt dir wohl nichts anderes übrig als dir die Finger abzulecken.", "You decide to take a short break to lick off honey from your hands");
        honeygathering:AddInterruptMessage("Eine aufdringliche Wespe schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst sie zu vertreiben.", "A curious wasp buzzes around your head and you try to scare it away.");

        --milking
        milking:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        milking:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        milking:SetShard(prob_rarely,"Ein Splitter eines magischen Artefaktes hat sich im Fell des Tieres verfangen.", "A shard of a magical artifact was tangled in the fur of the animal."); -- Any shard
        milking:AddRandomItem(153,1,333,{},prob_occasionally,"Ein großes Blatt hat sich im Fell des Tieres verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter melkst.","A large leaf was tangled in the fur of the animal. You do a little grooming before you continue milking."); --Foot leaf
        milking:AddRandomItem(156,1,333,{},prob_frequently,"Etwas Gras hat sich im Fell des Tieres verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the animal. Before you can continue milking you have to remove the sticky green weed."); --Steppe fern
        milking:SetTreasureMap(prob_rarely,"Das Tier kratzt und schnüffelt aufgeregt am Boden. Dort findest du eine seltsame Karte.","The animal scratches and sniffs on the ground excitdly. You find a strange map there.");
        milking:AddMonster(271,prob_rarely,"Während du das Tiel melkst, umschwirrt dich eine ungewöhnlich agressive Wespe.","While you milk the animal an annoyingly aggressive wasp comes after you!",4,7);

        --farming
        farming:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        farming:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        farming:SetShard(prob_rarely,"Zwischen den Ackerfurchen findest du einen Splitter eines magischen Artefaktes.", "Between the furrows you find a shard of a magical artifact."); -- Any shard
        farming:AddRandomItem(1840,1,333,{},prob_extremely_rarely,"Im Ackerboden ist ein angelaufender Kupferkelch zu finden.","In the arable soil you find a tarnished copper goblet."); --copper goblet
        farming:AddRandomItem(2935,1,333,{},prob_occasionally,"Da hat wohl jemand eine Schüssel verloren, mit der er Saatgut augestreut hat. Nun gehört sie dir.","You dig up an old bowl. Now it belongs to you."); --soup bowl
        farming:AddRandomItem(51,1,333,{},prob_frequently,"Da hat wohl jemand einen Eimer verloren. Nun gehört er dir.","You dig up an old bucket. Now it belongs to you."); --bucket
        farming:SetTreasureMap(prob_rarely,"In einer Ackerfurche findest du ein altes Pergament mit einem Kreuz darauf. Ob sie dich zu einem vergrabenen Schatz weisen wird?","In a furrow you find an old parchment with a cross on it. Will it show you the way to a buried treasure?");
        farming:AddMonster(114,prob_rarely,"Du stößt bei der Erdarbeit auf alte Knochen. Leider hat sie kein Hund hier vergraben und die Störung der Totenruhe bleibt nicht ungesühnt.","While ploughing, you find some old bones. Unfortunately, no dog has buried them here, and the disturbance of the dead unleashes Cherga's wrath.",4,7);
        farming:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        
        --fruitgathering
        fruitgathering:SetShard(prob_rarely,"In einem Ast steckt ein Splitter eines magischen Artefaktes.", "In a branch sticks a shard of a magical artifact."); -- Any shard
        fruitgathering:AddRandomItem(65,1,333,{},prob_extremely_rarely,"Bei genauer Betrachtung entpuppt sich ein Ast am Boden als Bogen. Ob den ein elfischer Späher hier deponiert hat?","On closer inspection, a branch on the ground turns out to be a bow. Did an elven scout forget it here?"); --short bow
        fruitgathering:AddRandomItem(2295,1,333,{},prob_occasionally,"Über einem Ast hängt ein Paar alter Handschuhe. Der Besitzer vermisst sie offenbar nicht.","Over a branch hangs a pair of old gloves. Judging by their condition no one would miss them."); --cloth gloves
        fruitgathering:AddRandomItem(463,1,333,{},prob_frequently,"Eine Feder hat sich zwischen den Zweigen verfangen. Ob man mit ihr auch schreiben kann?","A feather lies entangled among the branches. Perhaps one could write with it?"); --quill
        fruitgathering:SetTreasureMap(prob_rarely,"Aus dem Augenwinkel siehst du ein altes Stück Pergament, das sich in einem Busch verfangen hat. Als du es dir genauer anschaust, erkennst du, dass es sich um eine Art Karte handelt.","Through the corner of your eye you spot an old parchment snared in a nearby bush. Once it is in your hand you notice it is some kind of map.");
        fruitgathering:AddMonster(271,prob_rarely,"Eine Wespe schnellt heran, um dir die süßen Früchte streitig zu machen.","An agitated wasp darts toward you to contest its claim to the fruit.",4,7);
        fruitgathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

        --mining
        mining:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        mining:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        mining:SetShard(prob_rarely,"Ein kleiner Stein entpuppt sich als Splitter eines magischen Artefaktes.", "A little rock seems to be a shard of a magical artifact."); -- Any shard
        mining:AddRandomItem(310,1,333,{},prob_extremely_rarely,"Zwerge scheinen alten Krügen keine Beachtung beizumessen, insbesondere, wenn sie leer sind. Auch hier liegt einfach einer herum.","Dwarves seem to pay no attention to old pitchers, especially if they are empty. As you work one catches your eye."); --mug with lid
        mining:AddRandomItem(1908,1,333,{},prob_occasionally,"Diese Mine wurde offensichtlich kürzlich von Zwergen aufgesucht. Wie sonst erklärt sich der Bierkrug, den du zwischen dem Geröll findest?","This mine was occupied recently. How else would you explain the beer mug at your feet?"); --beer mug
        mining:AddRandomItem(391,1,333,{},prob_frequently,"In einer Felsspalte liegt eine alte Fackel. Hier ist wohl jemanden ein Licht aufgegangen.","In a crevice you spot an old torch."); --torch
        mining:SetTreasureMap(prob_rarely,"In einer engen Felsspalte findest du ein altes Pergament, das wie eine Karte aussieht. Kein Versteck ist so sicher, dass es nicht gefunden wird.","In a narrow crevice you find an old parchment that looks like a map. No hiding place is too safe that it cannot be found.");
        mining:AddMonster(1052,prob_rarely,"Als du den Fels malträtierst, läuft etwas Schleim aus einer Felsspalte...","As you slam your pick-axe on the rock, some slime flows out of the fissure...",4,7);
        mining:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        mining:AddInterruptMessage("Dir fliegt ein Steinsplitter entgegen. Du kannst gerade noch ausweichen.", "Your hard work has shaken free a stalactite that crashes from overhead. Somehow you manage to avoid any injury as the rubble clears.");
        mining:AddInterruptMessage("Du bekommst etwas Schmutz ins Auge und reibst dir kurz die Augen.", "You feel a flake of dirt in your eye.");
        mining:AddInterruptMessage("Du überprüfst kurz die Struktur der Ader, an der du gerade gräbst.", "You notice a vein ripe with ore and pause to reposition yourself.");
        mining:AddInterruptMessage("Du verlierst kurz das Gleichgewicht durch einen losen Gesteinsbrocken am Boden.", "Some rubble at your feet impedes your progress.");

        --sanddigging
        sanddigging:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        sanddigging:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        sanddigging:SetShard(prob_rarely,"Im Sand erkennst du einen Splitter eines magischen Artefaktes.", "You spot a shard of a magical artifact in the sand."); -- Any shard
        sanddigging:AddRandomItem(3077,1,333,{},prob_extremely_rarely,"Eine funkelnde Münze liegt auf deinem Schaufelblatt. Hat sich die harte Arbeit doch gelohnt!","A tink of your shovel blade causes you to pause. Then to your surprise it turns out you struck a silver coin!"); --Silver coin
        sanddigging:AddRandomItem(21,1,333,{},prob_occasionally,"Du findest einige noch heiße Kohlen im Sand. Ein Glück, dass du nicht auf diese Überreste einer nächtlichen Grillfeier getreten bist.","As your shovel digs through the sand you unearth an unused lump of coal and discover an abandoned campfire."); --Coal
        sanddigging:AddRandomItem(1266,1,333,{},prob_frequently,"Deine Schaufel stößt auf einen runden Kieselstein.","Your shoulder locks as your shovel drives into a hard stone."); --Rock
        sanddigging:SetTreasureMap(prob_rarely,"Der Sand gibt eine gut erhaltene Karte frei. Die Hitze konnte dem Pergament nichts anhaben.","Deep in the sand sheltered from the desert heat you discover a treasure map!");
        sanddigging:AddMonster(982,prob_rarely,"Tief im Sand stößt du auf etwas schwarzes, krabbelndes. Eine vorschnellende Klaue ist nur der Vorbote dessen, was du gerade erweckt hast.","To your dismay you unearth a beetle's hiding place. He furiously lashes his claws trying to defend his home.",4,7);
        sanddigging:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        sanddigging:AddInterruptMessage("Du stößt beim Graben auf einen großen Stein. Der plötzliche Schlag auf die Schaufel lässt sie dir beinahe aus der Hand rutschen", "While digging you hit a big stone; the sudden impact nearly causes you to drop your shovel.");
        sanddigging:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst sie zu vertreiben.", "An annoying bug buzzes around your head. You strike at it in order to drive it away.");
        sanddigging:AddInterruptMessage("Das Graben im Sand macht dich sehr durstig und du hältst kurz inne.", "Digging for sand makes you thirsty. You have to take a short break.");
        sanddigging:AddInterruptMessage("Du meinst du hättest etwas vor dir gesehen, aber es war wohl nur eine Luftspiegelung.", "Something in front of you catches your attention. Just a mirage...");
 
        --snowballmaking
        snowballmaking:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        
        --claydigging
        claydigging:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        claydigging:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        claydigging:SetShard(prob_rarely,"Im Matsch erkennst du einen Splitter eines magischen Artefaktes.", "You spot a shard of a magical artifact in the mud."); -- Any shard
        claydigging:AddRandomItem(2658,1,333,{},prob_extremely_rarely,"Du findest eine Knochenhand im Matsch. Sie umklammert ein altes Schwert.","You find a boney hand in the mud clutching an old sword."); --broadsword
        claydigging:AddRandomItem(51,1,333,{},prob_occasionally,"Du ziehst einen alten Eimer aus dem Schlick.","You draw an old bucket from the silt."); --bucket
        claydigging:AddRandomItem(2184,1,333,{},prob_frequently,"Ein Tonkrug offenbahrt sich im Matsch. Die Überreste einer alten Zivilisation oder einfach nur vom letzten Saufgelage?","A clay mug reveals itself in the mud. Perhaps the remains of an ancient civilization or just a littering traveller, who knows?"); --clay cup
        claydigging:SetTreasureMap(prob_rarely,"Von einer Lederhülle umgeben, findest du eine alte Karte. Die hat definitiv niemand absichtlich hier hinterlassen.","Covered in a leather hide you find an old map.");
        claydigging:AddMonster(104,prob_rarely,"Im Morast stößt du auf eine bedauernswerte Moorleiche. Jedoch scheinst du derjenige zu sein, den man fortan betrauern wird.","In the mud your shovel digs unintentionally into a feculent bog body. The stench is atrocious, but what's worse is the undead creature rises to attack.",4,7);
        claydigging:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        claydigging:AddInterruptMessage("Du stößt beim Graben auf einen großen Stein. Der plötzliche Schlag auf die Schaufel lässt sie dir beinahe aus der Hand rutschen", "While digging you hit a big stone, the sudden impact nearly causes you to lose your grip on the handle.");
        claydigging:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst sie zu vertreiben.", "An annoying bug buzzes around your head. You swat at it in order to drive it away.");
        claydigging:AddInterruptMessage("Du bekommst einen Schlammspritzer ins Gesicht und musst ihn kurz mit den Ärmel abwischen.", "Mud splatters your face, perhaps Nargún does not favour you today?");
        claydigging:AddInterruptMessage("Das Loch, in dem du gräbst, füllt sich mit Wasser und du mußt es kurz abschöpfen.", "The pit you are digging fills with water causing you to pause in order to scoop it out.");

        --herbgathering
        herbgathering:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        herbgathering:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        herbgathering:SetShard(prob_rarely,"An einem Blatt klebt ein Splitter eines magischen Artefaktes.", "A shard of a magical artifact is stuck to an leave."); -- Any shard
        herbgathering:AddRandomItem(2183,1,333,{},prob_extremely_rarely,"Ein alter Krug liegt verlassen und einsam im Gebüsch.","An old mug lies abandoned and lonesome in the bushes."); --Mug
        herbgathering:AddRandomItem(799,1,333,{},prob_occasionally,"Ein Weidenkorb liegt am Boden. Er scheint noch brauchbar zu sein.","A wicker basket lies on the ground. It still seems to be usable."); --Basket
        herbgathering:AddRandomItem(2570,1,333,{},prob_frequently,"Ein Griff einer alten Sichel liegt achtlos weggeworfen zwischen Ästen und Blättern herum.","A handle of an old sickle lies between the leaves and branches, but the blade is no where in sight."); --Sickle hilt
        herbgathering:AddRandomItem(3787,1,333,{},prob_frequently,"Du findest innerhalb der Pflanze verwobene Seide. Vorsichtig gelingt es dir sie zu entfernen.","You find silk interwoven amongst the plant, you carefully remove it."); -- silk
        herbgathering:SetTreasureMap(prob_rarely,"Unter einer Lage Blätter stößt du auf eine Schatzkarte. Hoffentlich ist der Besitzer nicht in der Nähe.","Under a layer of leaves you find a treasure map. Hopefully, the owner is not nearby!");
        herbgathering:AddMonster(271,prob_rarely,"Eine Wespe steigt aus dem Gestrüpp auf, offensichtlich unerfreut über die Störung.","A pesky wasp rises from the bushes apparently displeased with your disturbance.",4,7);
        herbgathering:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        herbgathering:AddInterruptMessage("Ein kleines pelziges Tier springt aus dem Gebüsch und rennt davon. Für einen Moment bist du fürchterlich erschrocken.", "A small, furry critter jumps out of a bush and darts off. That really surprised you.");
        herbgathering:AddInterruptMessage("Du greifst mit der Hand in eine Blattlauskolonie. Verärgert wischt du dir die Hand an der Hose ab.", "The plant is crowded with lice. Annoyed, you wipe your hand clean on your trousers.");
        herbgathering:AddInterruptMessage("Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst sie zu vertreiben.", "An annoying bug buzzes around your head. You strike at it in order to drive it away.");

        --fishing
        fishing:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        fishing:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        fishing:SetShard(prob_rarely,"In den Eingeweiden des Fischens findest du einen Splitter eines magischen Artefaktes.", "You find a shard of a magical artifact in the entrails of the fish."); -- Any shard
        fishing:AddRandomItem(51,1,333,{},prob_extremely_rarely,"Ein Eimer verfängt sich in deiner Angelschnur. Den hat hier wohl jemand verloren.","As you tighten your line you feel a heavy resistance. With a careful approach you are able to pull a bucket ashore."); --Bucket
        fishing:AddRandomItem(92,1,333,{},prob_occasionally,"Du ziehst eine glitzernde Öllampe aus dem Wasser. Wo die wohl herkommt...?","You pull a sparkling oil lamp out of the water. Where did that come from?"); --Oil lamp
        fishing:AddRandomItem(53,1,333,{},prob_frequently,"Ein alter, durchlöcherter Lederstiefel hängt am Haken.","As you angle back and forth for fish you feel a snag. Instead of a fish, however, a pair of old perforated boots tied together hangs from your hook!"); --Leather boots
        fishing:SetTreasureMap(prob_rarely,"Statt eines Fisches hast du eine Karte am Haken hängen.","Nargún's favour has finally found you for there is a treasure map on your hook instead of a fish!");
        fishing:AddMonster(101,prob_rarely,"Ein heftiger Ruck reißt dir fast die Angel aus der Hand. Noch während du dich wunderst teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor.","A heavy force pulls on your fishing line momentarily before it releases. Then without warning the water before you erupts as putrified mummy vaults toward you.",4,7);
        fishing:AddInterruptMessage("Ein schwarzer Fleck huscht durch das Wasser. Etwas erschrocken weichst du zurück.", "You notice a large black dot in the water, you decide not to disturb it.");
        fishing:AddInterruptMessage("Der Boden unter dir rutscht leicht weg, sodass du gerade noch das Gleichgewicht halten kannst.", "Some stones slip away from the bank, disturbing all the fish.");
        fishing:AddInterruptMessage("Dein Blick verliert sich für kurze Zeit in deinem Spiegelbild und du bist abgelenkt.", "You take a while to admire that good-looking person staring at you from your reflection.");
        fishing:AddInterruptMessage("Der Köder hängt nicht mehr am Haken. Leicht verärgert befestigst du einen neuen.", "A clever fish stole the bait from you, you affix fresh bait to the hook.");
        -- TODO translate
        -- fishing:AddInterruptMessage("Du weidest deinen bisherigen Fang aus.");

        --woolcutting
        woolcutting:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        woolcutting:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        woolcutting:SetShard(prob_rarely,"Ein Splitter eines magischen Artefaktes hat sich in der Wolle des Schafes verfangen.", "A shard of a magical artifact was tangled in the wool of the sheep."); -- Any shard
        woolcutting:AddRandomItem(222,1,333,{},prob_extremely_rarely,"Dieses Schaf trägt ein merkwürdiges Amulett um den Hals. Wer kommt auf solch eine Idee?","This sheep is bearing a strange amulet around its neck. Who had such an idea?"); --Amulet
        woolcutting:AddRandomItem(153,1,333,{},prob_occasionally,"Ein großes Blatt hat sich im Fell des Schafes verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter scherst.","A large leaf was tangled in the fur of the sheep. You do a little grooming before you continue shearing."); --Foot leaf
        woolcutting:AddRandomItem(156,1,333,{},prob_frequently,"Etwas Gras hat sich im Fell des Schafs verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the sheep. Before you can continue shearing you have to remove the sticky green weed."); --Steppe fern
        woolcutting:SetTreasureMap(prob_rarely,"Mit einem lauten 'Mäh' kratzt und schnüffelt das Schaf am Boden. Dort findest du eine seltsame Karte.","With a loud 'Baa' the sheep scratches and sniffs on the ground. Then, as if by magic a strange map appears on the ground.");
        woolcutting:AddMonster(271,prob_rarely,"Während du die Wolle einsammelst, umschwirrt dich eine ungewöhnlich agressive Wespe.","While you gather some wool a annoyingly aggressive wasp comes after you!",4,7);
        woolcutting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

        --grainharvesting
        grainharvesting:AddRandomPureElement(1,{},prob_extremely_rarely); -- Any pure element
        grainharvesting:AddRandomMagicGem(1,999,gems.getMagicGemData(1),prob_extremely_rarely); -- Any latent magical gem
        grainharvesting:SetShard(prob_rarely,"In einer Ähre hängt ein Splitter eines magischen Artefaktes.", "A shard of a magical artifact hangs in a spike."); -- Any shard
        grainharvesting:AddRandomItem(1840,1,333,{},prob_extremely_rarely,"Im Ackerboden ist ein angelaufender Kupferkelch zu finden.","In the arable soil you find a tarnished copper goblet."); --copper goblet
        grainharvesting:AddRandomItem(2935,1,333,{},prob_occasionally,"Da hat wohl jemand eine Schüssel verloren, mit der er Saatgut augestreut hat. Nun gehört sie dir.","You dig up an old bowl. Now it belongs to you."); --soup bowl
        grainharvesting:AddRandomItem(2760,1,333,{},prob_frequently,"Zwischen den Feldfrüchten findest du ein altes Seil. Nützlich, oder?","Among the crops you find an old rope. Can never have enough rope!"); --rope
        grainharvesting:SetTreasureMap(prob_rarely,"In einer Ackerfurche findest du ein altes Pergament mit einem Kreuz darauf. Ob sie dich zu einem vergrabenen Schatz weisen wird?","In a furrow you find an old parchment with a cross on it. Will it show you the way to a buried treasure?");
        grainharvesting:AddMonster(114,prob_rarely,"Du stößt bei der Erdarbeit auf alte Knochen. Leider hat sie kein Hund hier vergraben und die Störung der Totenruhe bleibt nicht ungesühnt.","While ploughing, you find some old bones. Unfortunately, no dog has buried them here, and the disturbance of the dead unleashes Cherga's wrath.",4,7);
        grainharvesting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");
        
        startGathering = 1;
    end
end