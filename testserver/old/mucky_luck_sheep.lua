-- dynamic sheep
-- for Nargun Parish
-- game "mucky luck"

require("base.common")
module("npc.mucky_luck_sheep", package.seeall)

function InitNPC()
	
	if not InitDone then
		InitDone = true;
		singleNPCInit = {};
		nextCheck = {};
		endGame = {};
		eatAt = {};
		moving = {};
		centerPos = {};
	end
	
	if not singleNPCInit[thisNPC.id] then
		singleNPCInit[thisNPC.id] = true;
		thisNPC:increaseSkill(1,"common language",100);
		nextCheck[thisNPC.id] = 30;
		endGame[thisNPC.id] = 25;
		eatAt[thisNPC.id] = {};
		moving[thisNPC.id] = false;
		local eatNum = 10;
		centerPos[thisNPC.id] = position(thisNPC.pos.x, thisNPC.pos.y, thisNPC.pos.z);
		
		local cur = 0;
		for i=1,(eatNum) do
			repeat
				cur = math.random(1,endGame[thisNPC.id]-1);
			until not eatAt[thisNPC.id][cur];
			eatAt[thisNPC.id][cur] = true;
		end
	end
end

function nextCycle()
	
	InitNPC();
	
	if endGame[thisNPC.id] == 0 then
		world:deleteNPC(thisNPC.id);
		--[[
		if math.random(25) == 1 then
			world:gfx(2, thisNPC.pos);
			world:makeSound(4, thisNPC.pos);
			world:createItemFromId(173,1,thisNPC.pos,true,333,0);
		else
			world:makeSound(23, thisNPC.pos);
			world:createItemFromId(63,1,thisNPC.pos,true,333,0);
		end
		]]
		world:gfx(2, thisNPC.pos);
		world:makeSound(4, thisNPC.pos);
		world:createItemFromId(173,1,thisNPC.pos,true,333,0);
	end
	
	if moving[thisNPC.id] then
		moving[thisNPC.id] = false;
		eat();
	end
	
	if nextCheck[thisNPC.id] == 0 then
		moveSheep();
		moving[thisNPC.id] = true;
		nextCheck[thisNPC.id] = math.random(30,50);
		endGame[thisNPC.id] = endGame[thisNPC.id] - 1;
	elseif math.mod(nextCheck[thisNPC.id],10) == 0 then
		if math.random(5) == 1 then
			world:makeSound(2,thisNPC.pos);
		end
	end
	
	nextCheck[thisNPC.id] = nextCheck[thisNPC.id] - 1;
end

function eat()
	
	if eatAt[thisNPC.id][endGame[thisNPC.id]] then
		local foodItems = {158,159,162};
		local curItem = world:getItemOnField(thisNPC.pos);
		eatIt = false;
		for i,id in foodItems do
			if curItem.id == id and curItem.wear == 255 then
				eatIt = true;
			end
		end
		local gText, eText;
		if eatIt then
			gText = "#me schnuppert vorsichtig an dem Pilz, beißt dann aber doch genüsslich hinein.";
			eText = "#me sniffs carefully at the mushroom, then takes a bite of the mushroom with relish.";
			world:erase(curItem,1);
			thisNPC:talkLanguage(Character.say, Player.german, gText);
			thisNPC:talkLanguage(Character.say, Player.english, eText);
			--gText = "#me schaut stumpf zu Boden.";
			--eText = "#me looks dully to the ground.";
		end
		
	end
end

function moveSheep()
	
	local nextPos = getPosList(thisNPC.pos);
	
	nextPos = nextPos[math.random(1,table.getn(nextPos))];
	
	thisNPC:move(base.common.GetDirection(thisNPC.pos,nextPos),true);
end

function getPosList(curPos)
	
	local radius = 2;
	local retList = {};
	local checkPos;
	local dx, dy;
	checkPos = function(pos)
		dx = math.abs(centerPos[thisNPC.id].x - pos.x);
		dy = math.abs(centerPos[thisNPC.id].y - pos.y);
		if (dx <= radius) and (dy <= radius) and not(dx == radius and dy == radius) then
			table.insert(retList,pos);
		end
	end
	checkPos(position(curPos.x-1,curPos.y,curPos.z));
	checkPos(position(curPos.x+1,curPos.y,curPos.z));
	checkPos(position(curPos.x,curPos.y+1,curPos.z));
	checkPos(position(curPos.x,curPos.y-1,curPos.z));
	return retList;
end
