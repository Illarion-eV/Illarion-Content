module("npc.shiptest", package.seeall)

function useNPC(user)
       -- user:talk(Character.say, "test");
       thisNPC:talk(Character.say, "I am used by " .. user.name .. " !");
end

function nextCycle()
	--stand=2;
	if stand ~= nil then					-- if stand was already defined in receiveMessage.
		if stand ~= 1 then
	
			if schritt==nil then 			-- If "schritt" was not defined before (first
				schritt=1;			-- call of "nextCircle()"), then set it 1.
			end
			if delay==nil then			-- If "delay" was not defined, set it 1 also.
				delay=1;
			end
			delay=delay+1;				-- On each call of "nextCycle", increase "delay"
								-- by 1.
			if delay==20 then			-- To let the NPC walk at normal speed, let him do
				if schritt<5 then		-- a step only every 20 calls.
					dir=0; ymod=-1; xmod=0;	-- Make 4 steps to north.
				elseif schritt<9 then
					dir=2; ymod=0; xmod=1; -- East.
				elseif schritt<13 then
					dir=4; ymod=1; xmod=0; -- South.
				elseif schritt<17 then
					dir=6; ymod=0; xmod=-1; -- West.
				elseif schritt==17 then		-- When last step was finished...
					schritt=1;		-- ... start with north (schritt=1) again
					dir=0; ymod=-1; xmod=0;-- and set direction to north.
				end
				if schritt>0 then					-- Only to be sure...
					jesusitem = world:createItemFromId(42, 1, position(thisNPC.pos.x + xmod, thisNPC.pos.y + ymod, 0), true, 333, 0);
					jesusitem1 = world:createItemFromId(42, 1, position(pgr1.pos.x + xmod, pgr1.pos.y + ymod, 0), true, 333, 0);
					jesusitem2 = world:createItemFromId(42, 1, position(pgr2.pos.x + xmod, pgr2.pos.y + ymod, 0), true, 333, 0);
					jesusitem3 = world:createItemFromId(42, 1, position(pgr3.pos.x + xmod, pgr3.pos.y + ymod, 0), true, 333, 0);
					jesusitem4 = world:createItemFromId(42, 1, position(pgr4.pos.x + xmod, pgr4.pos.y + ymod, 0), true, 333, 0);
					if thisNPC:move(dir,true)==true then			-- move the NPC
						pgr1:move(dir,true);
					    pgr2:move(dir,true);
					    pgr3:move(dir,true);
					    --pgr4:inform("before move");
					    --world:movePlayerAtPos(pgr4.pos, dir);
					    --pgr4:setAttrib("faceto",dir);
					    pgr4:move(dir,true);
					    --pgr4:inform("after move");
						--thisNPC:talk(Character.say, "done " .. schritt);
						schritt=schritt+1;			-- increase schritt
					end
					world:erase(jesusitem,1);
					world:erase(jesusitem1,1);
					world:erase(jesusitem2,1);
					world:erase(jesusitem3,1);
					world:erase(jesusitem4,1);
				end
				delay=0;
			end
		end			-- stand ~= 1
	end      			-- "stand"
	
end					-- End of function

function receiveText(texttype, message, originator)

	thisNPC:increaseSkill(1,"common language",100);

        --originator:inform("received sth: '"..message.."'");
	if string.find(message,"stop!") ~= nil then		-- set "stand" to 1 which affects "nextCycle":
        	stand=1;			-- if stand==1 then he stands still, else he ...
        end	
        					-- ... walks around.
        if string.find(message,"start!") ~= nil then
        	stand=2;
		pgr1 = world:getCharacterOnField(position(thisNPC.pos.x+1,thisNPC.pos.y+1,0));
        pgr2 = world:getCharacterOnField(position(thisNPC.pos.x-1,thisNPC.pos.y+1,0));
        pgr3 = world:getCharacterOnField(position(thisNPC.pos.x+0,thisNPC.pos.y+2,0));
        pgr4 = world:getCharacterOnField(position(thisNPC.pos.x+0,thisNPC.pos.y+4,0));	
		originator:inform("Welcome on board, "..pgr4.name);
        end

end
