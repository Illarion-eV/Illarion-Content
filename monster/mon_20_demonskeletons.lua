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
require("item.gems")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
require("monster.base.kills")
require("base.arena")
module("monster.mon_20_demonskeletons", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("Die Toten dulden keine Lebenden in ihrer Mitte. Die Strafe für euer Eindringen ist der Tod.", "The undead shall not allow the living to dwell here. The punishment for such insolence shall be death!");
msgs:addMessage("Die Toten verlangen nach frischem Blut. Deinem Blut!", "The undead demand fresh blood, your blood!");
msgs:addMessage("Es ist gut das ihr hier seid, Sterblicher. Die Stimmung hier war irgendwie tot.", "It's good that you are here, mortal. Now you can entertain me.");
msgs:addMessage("Selbst wenn du meinen Körper zerschlägst, werde ich zurück kommen. Wie ist es bei dir?", "Even if you destroy my body, I will return. How about you?");
msgs:addMessage("Wie tötet man etwas was schon tot ist? Das hättest du dir eher überlegen sollen!", "How do you expect to kill something that is already dead? You should have thought about that earlier!");
msgs:addMessage("#me unternimmt nichts um die blutbefleckten Folterinstrumente zu verstecken die von seiner knochigen Hüfte baumeln: eine rostige Schere, gezackte Metallscherben, Zangen, und verschiedene Phiolen mit Flüssigkeiten.", "#me does nothing to conceal the blood soaked devices of torture clanging from its bony hip: rusted scissors, jagged shards of metal, tongs, and various vials of liquid.");
msgs:addMessage("#mes schreckliche Aura zerstört das natürliche Gleichgewicht. Jene, denen die höheren, geistigen Ebenen offen stehen, spüren vielleicht seine ruchlose Gier.", "#me's unholy aura corrupts the natural balance, even those oblivious to the ethereal planes might sense its heinous lust.");
msgs:addMessage("#mes Durst nach Zerstörung ist unerbittlich, und so benutzt es seine höllische Macht um seine verderbliche Wut zu entfesseln.", "#me is unrelenting in its thirst for destruction, using its infernal powers to unleash its baleful wrath.");
msgs:addMessage("#mes Knochen krachen und knirschen bedrohlich mit jeder lebhaften Bewegung.", "#me's bones grind and crack ominously with its animated movements.");
msgs:addMessage("#mes teuflisch gerötete Knochen tropfen von geronnenem Blut während ein abscheulicher Gestank die Luft vergiftet.", "#me's fiendishly reddened bones drip with clotted blood as an abhorrent stench pollutes the air.");
msgs:addMessage("#me bewegt seinen deformierten Unterkiefer als wolle es sprechen, aber stattdessen rasselt ein beunruhigendes Krachen durch die Luft.", "#me moves its mangled jaw as if to speak, but instead an unsettling crackle rattles through the air.");
msgs:addMessage("#me weicht wie in Trance erstarrt aus, niemals zögerlich oder locker, sein einziges Ziel ist es die zerstörerische Gier zu befriedigen.", "#me manoeuvres in a rigid trance, never hesitant or lax, its only purpose is to devour.");
msgs:addMessage("#me beugt sich in verwirrtem Irrsinn nieder, all sein Können benutzend um in elendem Zorn Leben zu verschlingen.", "#me bears down with a deranged frenzy using everything in its répertoire to consume life in its blighted rage.");
msgs:addMessage("#mes scheinbar zerbrechliches Äußeres stellt sich als täuschend heraus, verschleiert es doch die tatsächliche Macht der schwarzen Magie, die das Skelett umgibt, auf verräterische Weise.", "#me's seemingly fragile exterior proves to be deceiving as he mutters words of black magic.");
msgs:addMessage("#me streift eine lästige Sammlung blutverkrusteter, ineinander verwickelter Ketten über seine Schultern und seinen Oberkörper.", "#me drags a cumbersome set of blood encrusted chains that intertwine around its shoulders and torso.");
msgs:addMessage("#me zischt erbost: 'Ich bin nicht auferstanden, um mir von euch erneut ein Ende bereiten zu lassen. Sterbt!'", "#me hisses in fury: 'I did not rise from the dead just to get finished off by you. Die!'");
msgs:addMessage("#me lacht mit krachenden Kiefern und kleine Flammen züngeln aus seinen Augenhöhlen.", "#me laughs with snapping jaw, small flames glowing from its eyeholes.");
msgs:addMessage("Du kannst mich nicht bezwingen, das vermochte nicht einmal der Tod zu erreichen.", "You will not succeed in what death failed in.");
msgs:addMessage("Ich werde dich töten, Sterblicher, auf dass du die Qualen erleiden mögest, die ich durchgestanden habe!", "I will slay you, mortal, for you shall suffer as I did.");
msgs:addMessage("#me schnarrt drohend und dreht den Kopf von einer Seite zur anderen.", "#me snares evilly and turns its head from side to side.");
msgs:addMessage("#me kreischt hysterisch mit schriller Stimme 'Na los, erlöse mich von meinem unseligen Dasein!'.", "#me screams in a shrill voice: 'Come on, relive me from my puny existance!'.");
msgs:addMessage("#me breitet die Arme aus und ein blutrotes Leuchten geht von seinen Knochen aus. Ein Schaudern scheint das Skelett zu erfüllen, ehe es sich wie im Rausch auf sein Opfer stürzt.", "#me spreads its arms and a blood red glow is radiated from its bones. A shiver seems to overcome the skeleton before it charges its victim.");
msgs:addMessage("Geht in die Knie, Sterblicher, und ich werde euch vielleicht verschonen… vielleicht werd ich euer Ende aber auch nur schneller bereiten!", "Kneel down, mortal, and I will spare you... or just make the end approach faster.");
msgs:addMessage("#me krächzt verworren: 'Du dachtest, du hättest mich erledigt. Das wirst du nun büßen!'", "#me croaks abstrusely: 'You thought you were done with me. You shall regret this!'");
msgs:addMessage("#me flüstert lockend: 'Begib dich in Cherga's Umarmung und werde einer von uns…'.", "#me whispers alluringly: 'Embrace Cherga and become one of us…'.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==202) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{1500,3500},{{36,5},{9,5}},{},40,1,{25,65}) );
	elseif (MonID==204) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{3,5},{6,5}},{},40,1,{25,65}) );
    elseif (MonID==205) then
        return ( monster.base.monstermagic.SuddenWarp(Monster, Enemy) or monster.base.monstermagic.CastMonster(Monster, {103, 763}) );
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

	monster.base.monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

    local MonID=Monster:getMonsterType();

	if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==202) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{1500,3500},{{36,5},{9,5}},{},40,1,{25,65}) );
	elseif (MonID==204) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{3,5},{6,5}},{},40,1,{25,65}) );
    elseif (MonID==205) then
        return ( monster.base.monstermagic.CastMonster(Monster, {103, 763}) );
    else
        return false;
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
    local MonID=Monster:getMonsterType();
	if(MonID == 205) then
		if monster.specialattacks.lich_spells.Lich_MagicShield (monster, char) then
			return true;
		else
			return false;
		end
	end

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

if (MonID==201) then --Demon Skeleton, Level: 6, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2172,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --steel greaves
        if not done then done=monster.base.drop.AddDropItem(917,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --cursed shield
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(2363,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --nightplate
        if not done then done=monster.base.drop.AddDropItem(2357,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --shadowplate

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(235,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --gold ring
        if not done then done=monster.base.drop.AddDropItem(47,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --needle
        if not done then done=monster.base.drop.AddDropItem(6,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --scissors
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --amethyst

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2701,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --long sword
        if not done then done=monster.base.drop.AddDropItem(2658,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --broad sword
        if not done then done=monster.base.drop.AddDropItem(2757,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(25,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --sabre
        if not done then done=monster.base.drop.AddDropItem(1,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --serinjah sword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==202) then --Mystic Demon Skeleton, Level: 6, Armourtype: light, Weapontype: concussion (wrestling)

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(357,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --blue wizard hat
        if not done then done=monster.base.drop.AddDropItem(371,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --expensive wizard hat
        if not done then done=monster.base.drop.AddDropItem(547,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --novice mage robe
        if not done then done=monster.base.drop.AddDropItem(548,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --mage robe
        if not done then done=monster.base.drop.AddDropItem(558,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --master mage robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(68,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --ruby ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(336,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --mirror
        if not done then done=monster.base.drop.AddDropItem(334,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --charm of the icebird
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --ruby

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(76,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --mage's staff
        if not done then done=monster.base.drop.AddDropItem(1044,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(323,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --wand
        if not done then done=monster.base.drop.AddDropItem(209,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --battle staff
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==203) then --Unholy Akolyth, Level: 7, Armourtype: heavy, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2363,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --nightplate
        if not done then done=monster.base.drop.AddDropItem(326,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --steel boots
        if not done then done=monster.base.drop.AddDropItem(2393,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --heavy plate armor
        if not done then done=monster.base.drop.AddDropItem(184,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --black visor helmet
        if not done then done=monster.base.drop.AddDropItem(2111,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --blue steel greaves

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(2647,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --cutlery
        if not done then done=monster.base.drop.AddDropItem(1840,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --copper goblet
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2731,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --two handed sword
        if not done then done=monster.base.drop.AddDropItem(204,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --bastard sword
        if not done then done=monster.base.drop.AddDropItem(2640,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --fireaxe
        if not done then done=monster.base.drop.AddDropItem(383,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --waraxe
        if not done then done=monster.base.drop.AddDropItem(205,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --double axe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


    elseif (MonID==204) then --Unholy Archmage, Level: 7, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2389,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --salkamaerian armor
        if not done then done=monster.base.drop.AddDropItem(2287,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --albarian  soldier's helmet
        if not done then done=monster.base.drop.AddDropItem(2302,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --gynkese mercenarie's helmet
        if not done then done=monster.base.drop.AddDropItem(2194,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --short hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(916,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --ornate tower shield

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(2185,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --wooden cup
        if not done then done=monster.base.drop.AddDropItem(1858,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --goblet
        if not done then done=monster.base.drop.AddDropItem(item.gems.getMagicGemId(item.gems.TOPAZ),1,1,999,item.gems.getMagicGemData(1),2); end --magic topaz

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(231,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --morning star
        if not done then done=monster.base.drop.AddDropItem(2737,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(226,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --warhammer
        if not done then done=monster.base.drop.AddDropItem(209,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --battle staff
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


    elseif (MonID==205) then --Lich, Level: 8, Armourtype: heavy, Weapontype: puncture

		--[[ The lich drops NOTHING.
		When it dies, the following function drops a pile of bones from which the lich
		rises as a weakened version of itself. Kill that and you kill the lich and you get the loot.
		for the drop: monster.mon_11_skeletons; monster 117 (Weakened Lich)
		--]]
		LichPileOfBones(Monster)


	elseif (MonID==206) then
        -- Drops
    elseif (MonID==207) then
        --Drops
    elseif (MonID==208) then
        --Drops
    elseif (MonID==209) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end

function LichPileOfBones(theLich)

	theLich:talk(Character.say,"#me zerfällt zu einem Knochenhaufen.","#me collapses into a pile of bones.")
	world:gfx(45,theLich.pos)
	world:createItemFromId(498,1,theLich.pos,true,333,nil)
	table.insert(scheduled.itemEffects.PILE_OF_BONES,{itemPosition = position(theLich.pos.x,theLich.pos.y,theLich.pos.z), itemCounter = 0})

end
