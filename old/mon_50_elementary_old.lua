require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_50_elementary", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("Dieses Monster wird mit NewIllarion abgeschafft. Bitte für Ersatz sorgen, um die Zahl der Bossmonster und die Balance der Monsterdrops beibehalten zu können!", "This monster will be discontinued with NewIllarion. Please create a replacement to maintain the number of boss monsters and the balance of drops!");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
    if (MonID==501) or (MonID==502) then -- Fire Elementaries
        if (true) then
            world:gfx(36,Monster.pos);
            if (MonID == 502) then
                world:gfx(36,position(Monster.pos.x - 1,Monster.pos.y,Monster.pos.z));
                world:gfx(36,position(Monster.pos.x + 1,Monster.pos.y,Monster.pos.z));
                world:gfx(36,position(Monster.pos.x,Monster.pos.y - 1,Monster.pos.z));
                world:gfx(36,position(Monster.pos.x,Monster.pos.y + 1,Monster.pos.z));
            end
        end
        if (math.random(1,15) == 1) then
            if (MonID == 502) then
                old_mon_pos = Monster.pos;
                monster.base.drop.SuddenWarp(Monster,Enemy,false);
                CreateLineofFligth(old_mon_pos,Monster.pos,44);
                CreateLineofFligth(position(old_mon_pos.x - 1,old_mon_pos.y,old_mon_pos.z),position(Monster.pos.x - 1,Monster.pos.y,Monster.pos.z),44);
                CreateLineofFligth(position(old_mon_pos.x + 1,old_mon_pos.y,old_mon_pos.z),position(Monster.pos.x + 1,Monster.pos.y,Monster.pos.z),44);
                CreateLineofFligth(position(old_mon_pos.x,old_mon_pos.y - 1,old_mon_pos.z),position(Monster.pos.x,Monster.pos.y - 1,Monster.pos.z),44);
                CreateLineofFligth(position(old_mon_pos.x,old_mon_pos.y + 1,old_mon_pos.z),position(Monster.pos.x,Monster.pos.y + 1,Monster.pos.z),44);
            else
                monster.base.drop.SuddenWarp(Monster,Enemy,true);
            end
            return true;
        end
        return false;
    elseif (MonID==503) or (MonID==504) then -- Water Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(4,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        return false;
    elseif (MonID==505) or (MonID==506) then -- Wind Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(7,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        return false;
    elseif (MonID==507) or (MonID==508) then -- Earth Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(5,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        return false;
    elseif (MonID==509) or (MonID==510) then -- Spirit Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(46,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        return false;
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:getMonsterType();
    if (MonID==501) or (MonID==502) then -- Fire Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(36,Monster.pos);
            if (MonID == 502) then
                world:gfx(36,position(Monster.pos.x - 1,Monster.pos.y,Monster.pos.z));
                world:gfx(36,position(Monster.pos.x + 1,Monster.pos.y,Monster.pos.z));
                world:gfx(36,position(Monster.pos.x,Monster.pos.y - 1,Monster.pos.z));
                world:gfx(36,position(Monster.pos.x,Monster.pos.y + 1,Monster.pos.z));
            end
        end
        if (math.random(1,15) == 1) then
            if (MonID == 502) then
                old_mon_pos = Monster.pos;
                monster.base.drop.SuddenWarp(Monster,Enemy,false);
                CreateLineofFligth(old_mon_pos,Monster.pos,44);
                CreateLineofFligth(position(old_mon_pos.x - 1,old_mon_pos.y,old_mon_pos.z),position(Monster.pos.x - 1,Monster.pos.y,Monster.pos.z),44);
                CreateLineofFligth(position(old_mon_pos.x + 1,old_mon_pos.y,old_mon_pos.z),position(Monster.pos.x + 1,Monster.pos.y,Monster.pos.z),44);
                CreateLineofFligth(position(old_mon_pos.x,old_mon_pos.y - 1,old_mon_pos.z),position(Monster.pos.x,Monster.pos.y - 1,Monster.pos.z),44);
                CreateLineofFligth(position(old_mon_pos.x,old_mon_pos.y + 1,old_mon_pos.z),position(Monster.pos.x,Monster.pos.y + 1,Monster.pos.z),44);
            else
                monster.base.drop.SuddenWarp(Monster,Enemy,true);
            end
            return true;
        end
        if (MonID==502) then
            if (math.random(1,30) == 1) then
                CreateLineofFligth(Monster.pos,Enemy.pos,44);
                Enemy:increaseAttrib("hitpoints",-700);
                Monster.movepoints = Monster.movepoints - 40;
                return true;
            end
        end
        return false;
    elseif (MonID==503) or (MonID==504) then -- Water Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(4,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        if (MonID==504) then
            if (math.random(1,30) == 1) then
                CreateLineofFligth(Monster.pos,Enemy.pos,3);
                Enemy:increaseAttrib("hitpoints",-700);
                Monster.movepoints = Monster.movepoints - 40;
                return true;
            end
        end
        return false;
    elseif (MonID==505) or (MonID==506) then -- Wind Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(7,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        if (MonID==506) then
            if (math.random(1,30) == 1) then
                world:gfx(2,Enemy.pos);
                Enemy:increaseAttrib("hitpoints",-1000);
                Monster.movepoints = Monster.movepoints - 40;
                return true;
            end
        end
        return false;
    elseif (MonID==507) or (MonID==508) then -- Earth Elementaries
        if (math.random(1,2) == 1) then
            world:gfx(5,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        if (MonID==508) then
            if (math.random(1,30) == 1) then
                world:gfx(6,Enemy.pos);
                Enemy.movepoints = Enemy.movepoints - 60;
                Monster.movepoints = Monster.movepoints - 20;
                return true;
            end
        end
        return false;
    elseif (MonID==509) or (MonID==510) then -- Spirit Elementaries
        if ((math.random(1,2) == 1) and (Monster:increaseAttrib("racetyp",0) == 25)) then
            world:gfx(46,Monster.pos);
        end
        if (math.random(1,15) == 1) then
            monster.base.drop.SuddenWarp(Monster,Enemy,true);
            return true;
        end
        if (MonID==510) then
            if (math.random(1,15) == 1) then
                world:gfx(16,Monster.pos);
                Monster:increaseAttrib("hitpoints",2000);
                Monster.movepoints = Monster.movepoints - 20;
                return true;
            elseif (math.random(1,15) == 1) then
                racelist = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,17,18,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46};
                if (Monster:increaseAttrib("racetyp",0) ~= 25) then
                    Monster:setAttrib("racetyp",25);
                else
                    Monster:setAttrib("racetyp",racelist[math.random(1,table.getn(racelist))]);
                end
                oldpos = Monster.pos;
                Monster:warp(position(0,0,0));
                Monster:warp(oldpos);
                world:gfx(41,Monster.pos);
                Monster.movepoints = Monster.movepoints - 40;
                return true;
            end
        end
        return false;
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

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

	
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
    if (MonID==501) then --Lower Fire Elementary, Level: 4, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(431,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --wax
        if not done then done=monster.base.drop.AddDropItem(390,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --lamp oil
        if not done then done=monster.base.drop.AddDropItem(359,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --flame
        if not done then done=monster.base.drop.AddDropItem(43,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --candles
        if not done then done=monster.base.drop.AddDropItem(391,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --torch

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(314,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --pott ash
        if not done then done=monster.base.drop.AddDropItem(1840,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --copper goblet
        if not done then done=monster.base.drop.AddDropItem(2536,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --copper ore
        if not done then done=monster.base.drop.AddDropItem(2550,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --copper ingot
        if not done then done=monster.base.drop.AddDropItem(104,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --silver ingot

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(67,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby amulet
        if not done then done=monster.base.drop.AddDropItem(447,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby powder

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==502) then --Higher Fire Elementary, Level: 4, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(43,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --candles
        if not done then done=monster.base.drop.AddDropItem(359,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --flame
        if not done then done=monster.base.drop.AddDropItem(2553,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --pure fire
        if not done then done=monster.base.drop.AddDropItem(431,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --wax
        if not done then done=monster.base.drop.AddDropItem(390,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --lamp oil

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2536,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --copper ore
        if not done then done=monster.base.drop.AddDropItem(2550,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --copper ingot
        if not done then done=monster.base.drop.AddDropItem(1840,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --copper goblet
        if not done then done=monster.base.drop.AddDropItem(314,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --pott ash
        if not done then done=monster.base.drop.AddDropItem(104,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --silver ingot

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(68,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --ruby ring
        if not done then done=monster.base.drop.AddDropItem(67,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby amulet
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby
        if not done then done=monster.base.drop.AddDropItem(447,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby powder

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==503) then --Lower Water Elementary, Level: 4, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(26,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --clay
        if not done then done=monster.base.drop.AddDropItem(355,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --salmon
        if not done then done=monster.base.drop.AddDropItem(360,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --iceflame
        if not done then done=monster.base.drop.AddDropItem(54,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --bucket with water
        if not done then done=monster.base.drop.AddDropItem(73,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --trout

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2186,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --goblet with water
        if not done then done=monster.base.drop.AddDropItem(1854,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --goblet with water
        if not done then done=monster.base.drop.AddDropItem(1841,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --goblet with water
        if not done then done=monster.base.drop.AddDropItem(1855,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --goblet with water
        if not done then done=monster.base.drop.AddDropItem(2058,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --glass with water

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(253,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(71,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire amulet
        if not done then done=monster.base.drop.AddDropItem(446,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire powder

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==504) then --Higher Water Elementary, Level: 4, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(54,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --bucket with water
        if not done then done=monster.base.drop.AddDropItem(360,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --iceflame
        if not done then done=monster.base.drop.AddDropItem(2554,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --pure water
        if not done then done=monster.base.drop.AddDropItem(26,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --clay
        if not done then done=monster.base.drop.AddDropItem(355,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --salmon

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(1841,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --goblet with water
        if not done then done=monster.base.drop.AddDropItem(1855,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --goblet with water
        if not done then done=monster.base.drop.AddDropItem(2186,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --goblet with water
        if not done then done=monster.base.drop.AddDropItem(1854,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --goblet with water
        if not done then done=monster.base.drop.AddDropItem(2186,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --cup with water

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(279,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(71,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire amulet
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(446,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire powder

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==505) then --Lower Wind Elementary, Level: 4, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2786,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --branch
        if not done then done=monster.base.drop.AddDropItem(56,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --bough
        if not done then done=monster.base.drop.AddDropItem(372,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --poison cloud
        if not done then done=monster.base.drop.AddDropItem(2745,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --parchment
        if not done then done=monster.base.drop.AddDropItem(155,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --sibanac leaf

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(314,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --pott ash
        if not done then done=monster.base.drop.AddDropItem(316,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --sand
        if not done then done=monster.base.drop.AddDropItem(2055,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --glass
        if not done then done=monster.base.drop.AddDropItem(41,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --glass ingot
        if not done then done=monster.base.drop.AddDropItem(726,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --coarse sand

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --emerald
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(62,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --emerald amulet
        if not done then done=monster.base.drop.AddDropItem(448,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --emerald powder

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins
    end
    monster.base.drop.Dropping(Monster);
end
