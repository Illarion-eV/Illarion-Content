dofile("mon_drop.lua");
dofile("mon_lookat.lua");
dofile("mon_quests.lua");
require("base.messages");

function ini(Monster)

init=true;
iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

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

    if DefaultSlowdown( Monster ) then
        return true
    else
        return false
    end
end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);
    
        if murderer then --Checking for quests

            checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    ClearDropping();
    local MonID=Monster:get_mon_type();

    if (MonID==291) then --sheep

        AddDropItem(63,1,50,333,0,1); --inners
        AddDropItem(170,10,50,333,0,2); --wool
        AddDropItem(2934,1,100,333,0,3); --lamb meat

    elseif (MonID==292) then --pig

        AddDropItem(63,1,50,333,0,1); --inners
        AddDropItem(69,1,50,333,0,2); --leather
        AddDropItem(307,1,100,333,0,3); --pork

    elseif (MonID==293) then --cow

        AddDropItem(69,1,50,333,0,1); --leather
        AddDropItem(333,1,50,333,0,2); --horn
        AddDropItem(2940,1,100,333,0,3); --steak

    elseif (MonID==294) then --deer

        AddDropItem(63,1,50,333,0,1); --inners
        AddDropItem(552,1,100,333,0,2); --deer meat

    elseif (MonID==295) then --bunny

        AddDropItem(63,1,50,333,0,1); --inners
        AddDropItem(553,1,100,333,0,2); --rabbit meat

    end
    Dropping(Monster);
end