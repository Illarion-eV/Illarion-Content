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
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
require("monster.base.kills")
require("base.arena")
module("monster.mon_21_redspiders", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bewegt alle ihre Beine näher zu ihrem Körper.", "#me moves all of its legs closer to its body.");
msgs:addMessage("#me fährt sich mit den Vorderbeinen über ihren Kopf.", "#me touches its head with its forelegs.");
msgs:addMessage("#me faucht angriffslustig.", "#me spits aggressively.");
msgs:addMessage("#me gibt ein paar zischende Laute von sich.", "#me does some frizzling noises.");
msgs:addMessage("#me hält zwei Beine schützend vor ihrem Gesicht.", "#me holds two legs up protectively.");
msgs:addMessage("#me krabbelt schnell umher.", "#me crawls around quickly.");
msgs:addMessage("#me schüttelt ein Netz von einem ihrer Beine ab, in dem es sich verfangen hatte.", "#me shakes a web off one of its legs, where it had become entangled.");
msgs:addMessage("#me schüttelt ihren Körper etwas.", "#me shakes its head a little.");
msgs:addMessage("#me zieht beim Laufen einige Spinnennetze mit sich.", "#me tugs as it walks a cobweb with it.");
msgs:addMessage("#mes Beine machen knackende Geräusche auf dem Boden.", "#me's legs make cracking sounds as they touch the ground.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
    if (MonID==211) then
        world:gfx(9,Monster.pos);
    end
    return false;
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:getMonsterType();
	if (MonID==211) then
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
	
	local MonID=Monster:getMonsterType();
	if (MonID==211) then -- spider of Fire!!
	     CreateCircle( 1, 250,Monster.pos,3,false);
        CreateCircle( 9, 750,Monster.pos,2,true);
        CreateCircle(44,1000,Monster.pos,1,true);
        world:gfx(36,Monster.pos);
        world:makeSound(5,Monster.pos);
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
   if (MonID==211) then --Firespide, Level: 4, Armourtype: heavy, Weapontype: distance

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw ruby

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,333,0,4); --copper coins


    elseif (MonID==211) then
        -- Drops
    elseif (MonID==212) then
        --Drops
    elseif (MonID==213) then
        --Drops
    elseif (MonID==214) then
        --Drops
    else
        --Drops
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
                            world:createItemFromId(359,1,HitPos,true,math.random(200,600),nil);
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
        if (Character:getType()==1) then
            if (Character:getMonsterType() == 401) then
                if not (Posi == CenterPos) then
                    return
                end
            elseif (Character:getMonsterType() == 278) then
                Character:increaseAttrib("hitpoints",-10000);
                return
            end
        end
                
        if (Posi == CenterPos) then			
			local posX = Character.pos.x+math.random(-9,9)
			local posY = Character.pos.y+math.random(-9,9)		
			local LoS = world:LoS(Character.pos, position(posX,posY,Character.pos.z))
            Character:warp(position(posX,posY,Character.pos.z));
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
			local posX = Character.pos.x-Diffx
			local posY = Character.pos.y-Diffy
			local listOfStuff = world:LoS(Character.pos, position(posX,posY,Character.pos.z))
			
			if listOfStuff ~= nil then
				for i, listEntry in pairs(listOfStuff) do
					local itemPos = listEntry.OBJECT.pos
					local field = world:getField(itemPos)
					
					-- something not passable is in the way, recalculate position
					if not field:isPassable() then 
						local phi = base.common.GetPhi(Character.pos, itemPos);
						if (phi < math.pi / 8) then
							posX = itemPos.x - 1
						elseif (phi < 3 * math.pi / 8) then
							posX = itemPos.x - 1
							posY = itemPos.y - 1
						elseif (phi < 5 * math.pi / 8) then
							posY = itemPos.y - 1
						elseif (phi < 7 * math.pi / 8) then
							posX = itemPos.x + 1
							posY = itemPos.y - 1
						elseif (phi < 9 * math.pi / 8) then
							posX = itemPos.x + 1
						elseif (phi < 11 * math.pi / 8) then
							posX = itemPos.x + 1
							posY = itemPos.y + 1
						elseif (phi < 13 * math.pi / 8) then
							posY = itemPos.y + 1
						elseif (phi < 15 * math.pi / 8) then
							posX = itemPos.x - 1
							posY = itemPos.y + 1
						else
							posX = itemPos.x - 1
						end;
						Character:warp(position(posX,posY,Character.pos.z));
						return;
					end
				end
			end
			Character:warp(position(posX,posY,Character.pos.z));
            
        end
        base.common.InformNLS(Character,
        "Getroffen von der Detonation wirst du davon geschleudert.",
        "Hit by the detonation, you get thrown away.");
        Character:increaseAttrib("hitpoints",-Hitpoints);
    end;
end;

function SetNextTrap(Posi,CenterPos)
    if (Posi == CenterPos) then
        return false
    end
    
    if not world:isItemOnField(Posi) then
        return false
    end
    
    TestItem = world:getItemOnField(Posi);
    
    -- item.data is deprecated, do not use anymore
    -- if (TestItem.data ~= 2) then
    --     return false
    -- end
    
    if ((TestItem.id >= 377) and (TestItem.id <=381)) then
        local tempmonster = world:createMonster(401,Posi,-50);
        if isValidChar(tempmonster) then
            tempmonster.fightpoints = tempmonster.fightpoints - 100;
            return true
        end
    end
    return false
end

