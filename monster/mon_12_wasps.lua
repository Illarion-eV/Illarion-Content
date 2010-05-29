require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_12_wasps")


function ini(Monster)

init=true;
monster.base.quest.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me fliegt, ein hohes, weinerlich klingendes Geräusch machend umher.", "#me flies around, making a high pitched whining sound.");
msgs:addMessage("#me landet nur um wieder abheben zu können begleitet von einem kurzen Summen.", "#me lands, only to take off again with a short buzz.");
msgs:addMessage("#me peitscht, einen Landeplatz suchend durch die Luft.", "#me whips about in the air, searching for somewhere to land.");
msgs:addMessage("#me schwirrt drohend in keine bestimmte Richtung.", "#me angrily buzzes around in no particular direction.");
msgs:addMessage("Bzzz.", "Bzzz.");
msgs:addMessage("#me fliegt in wilden Kreisen und man kann das Gift an ihrem Stachel aufglänzen sehen.", "#me darts around, one can see venom dripping from its sting.");
msgs:addMessage("#me fährt ihren spitzen Stachel aus.", "#me extends its sting.");
msgs:addMessage("Summ, summ.", "Buzz, buzz.");
msgs:addMessage("Bsss.", "Bsss.");
msgs:addMessage("#mes Flügel verbreiten ein hochfrequentes Summen, welches in den Ohren schmerzt.", "#me's wings exude a buzzing with high frequency, it hurts one's ears.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:get_mon_type();
    if (MonID==126) then
        world:gfx(9,Monster.pos);
    end
    return false
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:get_mon_type();
    if (MonID==126) then
        world:gfx(9,Monster.pos);
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

            monster.base.quest.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.Clearmonster.base.drop.Dropping();
    local MonID=Monster:get_mon_type();

    monster.base.drop.AddDropItem(2529,1,100,333,0,1); --honeycombs

    if (MonID==126) then -- wasp of Fire!!!

        CreateCircle( 1, 250,Monster.pos,3,false);
        CreateCircle( 9, 750,Monster.pos,2,true);
        CreateCircle(44,1000,Monster.pos,1,true);
        world:gfx(36,Monster.pos);
        world:makeSound(5,Monster.pos);
        HitChar(SourceItem.pos,3000,Monster.pos);

    end
    monster.base.drop.Dropping(Monster);
end

function CreateCircle(gfxid,Damage,CenterPos,Radius,setFlames)
    local irad = math.ceil(Radius);
    local dim = 2*(irad+1);
    local x;
    local y;
    local map = {};    
    for x = -irad-1, irad do
        map[x] = {};
        for y = -irad-1, irad do
            map[x][y] = (x+0.5)*(x+0.5)+(y+0.5)*(y+0.5)-irad*irad > 0
        end;
    end;   
    for x = -irad, irad do
        for y = -irad, irad do
            if not( map[x][y] and  map[x-1][y] and map[x][y-1] and map[x-1][y-1] )
               and( map[x][y] or   map[x-1][y] or  map[x][y-1] or  map[x-1][y-1] ) then
                HitPos=position( CenterPos.x + x, CenterPos.y + y, CenterPos.z );
                world:gfx(gfxid,HitPos);
                HitChar(HitPos,Damage,CenterPos);
                if not SetNextTrap(HitPos,CenterPos) then
                    if setFlames then
                        if (math.random(1,5)==1) then
                            world:createItemFromId(359,1,HitPos,true,math.random(200,600),0);
                        end
                    end
                end
            end;
        end;
    end;
end;

function HitChar(Posi,Hitpoints,CenterPos)
    if world:isCharacterOnField(Posi) then
        local Character = world:getCharacterOnField(Posi);
        if (Character:get_type()==1) then
            if (Character:get_mon_type() == 401) then
                if not equapos(Posi,CenterPos) then
                    return
                end
            elseif (Character:get_mon_type() == 126) then
                Character:increaseAttrib("hitpoints",-10000);
                return
            end
        end
                
        if equapos(Posi,CenterPos) then
            Character:warp(position(Character.pos.x+math.random(-9,9),Character.pos.y+math.random(-9,9),Character.pos.z));
        else
            local Distance = Character:distanceMetricToPosition(CenterPos);
            local Diffx = CenterPos.x - Character.pos.x;
            local Diffy = CenterPos.y - Character.pos.y;
            if (Distance == 1) then
                Diffx = 6*Diffx;
                Diffy = 6*Diffy;
            elseif (Distance == 2) then
                Diffx = 2*Diffx;
                Diffy = 2*Diffy;
            end
            Character:warp(position(Character.pos.x-Diffx,Character.pos.y-Diffy,Character.pos.z));
        end
        InformChar(Character,
        "Getroffen von der Detonation wirst du davon geschleudert.",
        "Hitted by the detonation, you get thrown away.");
        Character:increaseAttrib("hitpoints",-Hitpoints);
    end;
end;

function SetNextTrap(Posi,CenterPos)
    if equapos(Posi,CenterPos) then
        return false
    end
    
    if not world:isItemOnField(Posi) then
        return false
    end
    
    TestItem = world:getItemOnField(Posi);
    
    if (TestItem.data ~= 2) then
        return false
    end
    
    if ((TestItem.id >= 377) and (TestItem.id <=381)) then
        world:createMonster(401,Posi,-50);
        local tempmonster = world:getCharacterOnField(Posi);
        tempmonster.fightpoints = tempmonster.fightpoints - 100;
        return true
    end
    return false
end