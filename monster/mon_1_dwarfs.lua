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
require("monster.base.monstermagic")
require("monster.base.base")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("monster.base.kills")
require("base.arena")
require("base.messages");
module("monster.mon_1_dwarfs", package.seeall)


function ini(Monster)
    --debug("INI MONSTER START")
    init=true;
    monster.base.quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last
    --debug("INI QUEETS MID")
    --Random Messages

    msgs = base.messages.Messages();
    msgs:addMessage("#me brummt lautstark.", "#me hums clamorously.");
    msgs:addMessage("#me grummelt wütend.", "#me grumbles furiously.");
    msgs:addMessage("#me schnauft angestrengt.", "#me breathes with some difficulty.");
    msgs:addMessage("#me schwingt seine mächtige Axt.", "#me swings his mighty axe.");
    msgs:addMessage("#me's Bart erzittert bei jedem Schlag.", "#me's beard shakes with every hit.");
    msgs:addMessage("Arrr!?", "Arrr!?");
    msgs:addMessage("Arrr, ick brauch' mehr Bier!", "Arrr, I need more beer!");
    msgs:addMessage("Aye, dich stutz ick auf meine Größe!", "Aye, I'll trim yer ta my size");
    msgs:addMessage("Beim Barte Irmoroms!", "By Irmorom's Beard!");
    msgs:addMessage("Dein Kopf un' meine Axt, harr!", "Yer head an' my axe, harr!");
    msgs:addMessage("Du kämpfst wie 'ne Schweinenase, aye!", "Ye're fightin' like a piggynose, aye!");
    msgs:addMessage("Friss mein Axtblatt, Drecksack!", "Taste my axe blade, scumbag!");
    msgs:addMessage("Meine Axt wird dich fäll'n wie 'n Baum!", "My axe will cut ye down like a tree!");
    msgs:addMessage("#me wirft einen Krug von sich und wischt den letzten Bierschaum aus seinem Bart, ehe er drohend lallt 'Bei Irmorom, jetzt jibts Saures!'", "#me tosses a beer mug to the ground and wipes off foam from his beard before he babbles: 'By Irmorom! You have something coming!'.");
    msgs:addMessage("Irmorom, schärfe meine Axt, wuchte meinen Hammer und kräftige meinen Arm, ich ziehe aus um den Feind niederzuwerfen!", "Irmorom, sharpen my axe, balance my hammer and strengthen my arms, for I set out to smite this fiend.");
    msgs:addMessage("#me schnauft und stöhnt unter der Last seiner Rüstung, setzt aber störrisch zum Angriff an.", "#me groans under the weight of his armour, but charges stubbornly.");
    msgs:addMessage("#me reckt eine Faust gen Himmel und brüllt ohrenbetäubend seine ganze aufgestaute Rage heraus, ehe er seine Waffe schwingt", "#me raises his fist as he yells loudly, swinging his weapon.");
    msgs:addMessage("Ha, nur ein Mann vermochte es bisher, mich zu besiegen und das war beim Armdrücken, du wirst heulen, wenn ich mit dir fertig bin!", "Ha! Only one man could defeat me ever and that was in armwrestling. You'll see when I'm done with you!");
    msgs:addMessage("Merke dir meine Worte, es werden die letzten sein, die du zu hören bekommst!", "Remember my words, for they will be the last ones your ears will ever hear.");
    msgs:addMessage("Pah! Du stinkst ja wie ein Elf, bist dumm wie ein Ork und schwach wie eine Fee!", "Pah! You stink like an elf, are as stupid as an orc and as weak as a fairy!");
    msgs:addMessage("Attacke! Möge Irmorom mir einen Platz in seinen ewigen Hallen frei halten!", "Charge! May Irmorom reserve a seat for me in the Great Hall!");
    msgs:addMessage("#me grollt kehlig und schüttelt den Kopf so wild, dass ihm sein Bart um beide Ohren schlackert.", "#me growls and shakes his head so wildly that his beard hits his ears.");
    msgs:addMessage("Bah, hast du eine hässliche Fratze… lass sie mich dir zurechtschmieden!", "Bah, your face is so ugly… let me re-forge it for you!");

end

function enemyNear(Monster,Enemy)

    local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    if (MonID==13) then
        return ( monster.base.drop.CastLargeAreaMagic(Monster,15,3,{37,0},{1000, 2000},8,{36,5},60,{35,50}) or monster.base.monstermagic.SuddenWarp(Monster,Enemy) or monster.base.drop.CastMonMagic(Monster,Enemy,7,{1000,2000},{{36,5}},{},40,1,{35,50}) );
    else
        return false
    end
end

function enemyOnSight(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

	monster.base.monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

    if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==13) then
		return ( monster.base.drop.CastLargeAreaMagic(Monster,10,3,{37,0},{1000, 2000},8,{36,5},60,{35,50}) or monster.base.drop.CastMonMagic(Monster,Enemy,4,{1000,2000},{{37,5}},{},40,1,{35,50}) or monster.base.monstermagic.CastHealing( Monster, {1000,2000}) );
    else
        return false
    end
end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if base.arena.isArenaMonster(Monster) then
        return
    end

    if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();
    if (MonID==11) then --Dwarf, Level: 5, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2441,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --salkamaerian paladin's helmet
        if not done then done=monster.base.drop.AddDropItem(2193,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(2390,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --dwarven state armor
        if not done then done=monster.base.drop.AddDropItem(20,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --large metal shield
        if not done then done=monster.base.drop.AddDropItem(101,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --chain shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(1908,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --beer mug
        if not done then done=monster.base.drop.AddDropItem(728,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --hop seeds
        if not done then done=monster.base.drop.AddDropItem(259,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --grain
        if not done then done=monster.base.drop.AddDropItem(227,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --cooking spoon
        if not done then done=monster.base.drop.AddDropItem(1317,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --empty bottle

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2711,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --barbarian axe
        if not done then done=monster.base.drop.AddDropItem(2946,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --battleaxe
        if not done then done=monster.base.drop.AddDropItem(2642,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --orc axe
        if not done then done=monster.base.drop.AddDropItem(2629,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --heavy battleaxe
        if not done then done=monster.base.drop.AddDropItem(192,1,100,(100*math.random(4,5)+math.random(44,55)),0,3); end --coppered battleaxe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==12) then --Dwarven Warrior, Level: 6, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(529,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --dwarfen metal gloves
        if not done then done=monster.base.drop.AddDropItem(2117,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --short red steel greaves
        if not done then done=monster.base.drop.AddDropItem(2395,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --dwarven plate
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(4,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --plate armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(224,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --golden goblet
        if not done then done=monster.base.drop.AddDropItem(222,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --amulet
        if not done then done=monster.base.drop.AddDropItem(1908,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --beer mug
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(333,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --horn

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2946,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --battleaxe
        if not done then done=monster.base.drop.AddDropItem(2629,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --heavy battleaxe
        if not done then done=monster.base.drop.AddDropItem(2660,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --dwarven axe
        if not done then done=monster.base.drop.AddDropItem(2711,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --barbarian axe
        if not done then done=monster.base.drop.AddDropItem(124,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --golden battleaxe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==13) then --Dwarven Priest, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(807,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --blue doublet
        if not done then done=monster.base.drop.AddDropItem(182,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --black shirt
        if not done then done=monster.base.drop.AddDropItem(823,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --grey trousers
        if not done then done=monster.base.drop.AddDropItem(2421,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --white priest robe
        if not done then done=monster.base.drop.AddDropItem(2418,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --grey priest robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(391,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --torch
        if not done then done=monster.base.drop.AddDropItem(223,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --iron goblet
        if not done then done=monster.base.drop.AddDropItem(2935,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --soup bowl
        if not done then done=monster.base.drop.AddDropItem(1001,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --plate
        if not done then done=monster.base.drop.AddDropItem(2031,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --plate

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(40,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(230,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(209,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --battle staff
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --morning star

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==14) then --Dwarven Smith, Level: 4, Armourtype: heavy, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(202,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --steel cap
        if not done then done=monster.base.drop.AddDropItem(2112,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short blue steel greaves
        if not done then done=monster.base.drop.AddDropItem(2395,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --dwarven plate
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(4,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --plate armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2535,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --iron ingot
        if not done then done=monster.base.drop.AddDropItem(21,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --coal
        if not done then done=monster.base.drop.AddDropItem(22,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --iron ore
        if not done then done=monster.base.drop.AddDropItem(234,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --nugget
        if not done then done=monster.base.drop.AddDropItem(236,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --gold ingot

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(23,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --hammer
        if not done then done=monster.base.drop.AddDropItem(122,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --finesmithing hammer
        if not done then done=monster.base.drop.AddDropItem(2709,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --carpenter's hammer
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(2737,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,333,0,4); --copper coins


    elseif (MonID==15) then --Dwarven Hunter, Level: 5, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(367,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --short leather legs
        if not done then done=monster.base.drop.AddDropItem(48,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather gloves
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(306,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --ham
        if not done then done=monster.base.drop.AddDropItem(307,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --pork
        if not done then done=monster.base.drop.AddDropItem(2940,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --steak
        if not done then done=monster.base.drop.AddDropItem(557,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --steak dish
        if not done then done=monster.base.drop.AddDropItem(2277,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --meat dish

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(1266,10,20,(100*math.random(4,5)+math.random(44,55)),0,3); --stones
        if not done then done=monster.base.drop.AddDropItem(89,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --sling
        if not done then done=monster.base.drop.AddDropItem(2708,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --longbow
        if not done then done=monster.base.drop.AddDropItem(237,10,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --crossbow bolts
        if not done then done=monster.base.drop.AddDropItem(2645,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --throwing axe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    elseif (MonID==16) then
        -- Drops
    elseif (MonID==17) then
        --Drops
    elseif (MonID==18) then
        --Drops
    elseif (MonID==19) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
