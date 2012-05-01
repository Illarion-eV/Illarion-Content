require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_29_animals", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

end

function onSpawn(thisPig)
	if thisPig:getMonsterType()==241 or thisPig:getMonsterType()==251 or thisPig:getMonsterType()==252 or thisPig:getMonsterType()==253 then
    var=60;
    red,green,blue=thisPig:getSkinColor();
    red=math.min(255,red-var+math.random(2*var));
    green=math.min(255,green-var+math.random(2*var));
    blue=math.min(255,blue-var+math.random(2*var));
    thisPig:setSkinColor(red,green,blue);
	end
end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    return false
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
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

	local NoDrop=Monster:getSkill("no drop pls")
	if NoDrop >= 10 then
	return;
	end
	
	if killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);
    
        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end
	
    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();

    if (MonID==181 or MonID==182) then --sheep

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(170,10,50,333,0,2); --wool
        monster.base.drop.AddDropItem(2934,1,100,333,0,3); --lamb meat

    elseif (MonID==371 or MonID==381 or MonID==382) then --cow

        monster.base.drop.AddDropItem(69,1,50,333,0,1); --leather
        monster.base.drop.AddDropItem(333,1,50,333,0,2); --horn
        monster.base.drop.AddDropItem(2940,1,100,333,0,3); --steak
		
	elseif (MonID==241 or MonID==251 or MonID==252 or MonID==253) then --pig

        monster.base.drop.AddDropItem(69,1,50,333,0,1); --leather
        monster.base.drop.AddDropItem(63,1,50,333,0,2); --entrails
        monster.base.drop.AddDropItem(307,1,100,333,0,3); --pork
		
	elseif (MonID==581 or MonID==582 or MonID==583 or MonID==584 or MonID==951 or MonID==961 or MonID==962 or MonID==971 or MonID==972) then --dog

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur

	elseif (MonID==591 or MonID==592 or MonID==593 or MonID==594 or MonID==981 or MonID==991 or MonID==1001 or MonID==1011) then --beetle

        monster.base.drop.AddDropItem(1266,1,50,333,0,1); --stone
        monster.base.drop.AddDropItem(1266,10,100,333,0,2); --stone
		
	elseif (MonID==601 or MonID==602 or MonID==603 or MonID==604 or MonID==1021 or MonID==1022) then --fox

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur
		
	elseif (MonID==621 or MonID==622 or MonID==1061 or MonID==1071 or MonID==1081) then --chicken

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2696,1,100,333,0,2); --feather
		
		
    end
    monster.base.drop.Dropping(Monster);
end
