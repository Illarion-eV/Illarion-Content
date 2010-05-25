function useNPC(user,Counter,Param)
       -- user:talk(CCharacter.say, "test");
       thisNPC:talk(CCharacter.say, "I am used by " .. user.name .. " !");
end


function nextCycle()


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
					dir=0;			-- Make 4 steps to north.
				elseif schritt<9 then
					dir=2;			-- East.
				elseif schritt<13 then
					dir=4;			-- South.
				elseif schritt<17 then
					dir=6;			-- West.
				elseif schritt==17 then		-- When last step was finished...
					schritt=1;		-- ... start with north (schritt=1) again
					dir=0;			-- and set direction to north.
				end
				if schritt>0 then					-- Only to be sure...
					if thisNPC:move(dir,true)==true then			-- move the NPC
						thisNPC:talk(CCharacter.say, "done " .. schritt);
						schritt=schritt+1;			-- increase schritt
					end
				end
				delay=0;
			end
		end			-- stand ~= 1
	end      			-- "stand"
	
	-- randaction=math.random(40);
	-- if randaction==30 then
	--	thisNPC:talk(CCharacter.yell, "I am a test-NPC! Talk with me!");
	-- end
	
end					-- End of function

function receiveText(texttype, message, originator)
 -- printerr("from"..originator.name.."to"..thisNPC.name);

	if tableset==nil then							-- wenn die funktion das erste mal
		ware={}								-- aufgerufen wird, dann setzen wir
		ware["sword"]=0;						-- seine waren auf 0.
		ware["flour"]=0;
		tableset=1;
		originator:inform("Test");
		thisNPC:increaseSkill(1,"common language",100);
	end
	
        if message == "hi" then									-- straight forward.
        	thisNPC:increaseSkill(1,"common language",100);
                thisNPC:talk(CCharacter.say, "Hello " .. originator.name);
                thisNPC:talk(CCharacter.say, "I'm " .. thisNPC.name);
                originator:introduce(thisNPC);
                yr=world:getTime("year");
                mth=world:getTime("month");
                dy=world:getTime("day");
                hr=world:getTime("hour");
                mn=world:getTime("minute");
                sc=world:getTime("second");
                thisNPC:talk(CCharacter.say, "#me says we have the year " .. yr ..", month: " .. mth .. ", day: " .. dy .. " and it is " .. hr .. ":" .. mn .. ":" .. sc); 
        end
        
--        if ( (string.find(message,"[Ff]ish") ~= nil) or (string.find(message,"[Ff]isch") ~= nil) ) then		-- Fish or fish
--                thisNPC:talk(CCharacter.say, "Where?");
--        end
--        
--        if (string.find(message,"add%s%d+%s%d+") ~= nil) then                   	-- wenn "add <zahl> <zahl>" im string vorkommt
--                       a,b,c,d,e=string.find(message,".*(add) (%d+) (%d+).*");  	-- a=erster buchstabe, wo der string vorkommt,b=letzter.
--                       thisNPC:talk(CCharacter.say, "The 1st result is " .. d+e);	-- c, d, e sind fuer "add", %d+, %d+
--        end
--        
--        if (string.find(message,"buy%s%d+.+") ~= nil) then				-- if "buy <number> <text>" is found in the message
--        	thisNPC:talk(CCharacter.say, "I have " .. ware["flour"] .. " left.");	-- Just say how many pieces you have now.
--                a,b,c,d,e=string.find(message,".*(buy) (%d+) (.+)");			-- a=position of the first occurence of the string in "message"
--                									-- b=position of the end of the last occurence of the string in "message"
--                									-- c="buy", d="<number>", e="<string afterwards>"
--                
--                thisNPC:talk(CCharacter.say, "I don't have " .. d .. " " .. e .. " to sell. I can give you flour instead.");
--                if ware["flour"]+2 > d+1 then						-- A little "trick" to convert d into a number: add 1...
--                	thisNPC:talk(CCharacter.say, "I have " .. ware["flour"] .. " pieces of flour left.");
--                	originator:createItem(2,d*1,333,0); 					-- create an item of ID 2 (flour) d times in the inventory of the speaker
--                	ware["flour"]=ware["flour"]-d*1;					-- NPC now has less flour
--                	if ware["flour"]==0 then						-- if he has no flour anymore, refill...
--                		ware["flour"] = 20;
--                	end
--                else 
--               		thisNPC:talk(CCharacter.say, "I don't have that much flour!");	-- Not enough floor.
--                end	
--        end
--        
--        if (string.find(message,".*please%sspeak.+") ~= nil) then			-- "please speak human/common/dwarf" to make the NPC talk this language.
--        	a,b,c,d,e=string.find(message,".*(please) (speak) (.+)");
--        	if e=="human" then							-- if "human"...
--        		thisNPC:increaseSkill(1,"human language",100);			-- ... learn it and...
--        		thisNPC.activeLanguage=1;					-- ... set active language to 1=human language
--        	end
--        	if e=="common" then
--        		thisNPC:increaseSkill(1,"common language",100);
--        		thisNPC.activeLanguage=0;
--        	end
--        	if e=="dwarf" then
--        		thisNPC:increaseSkill(1,"dwarf language",100);
--        		thisNPC.activeLanguage=2;
--       		end
--        end	
--        
--        if (string.find(message,".*please%steach%sme.+") ~= nil) then			-- if "please teach me human/dwarf/common"...
--        	a,b,c,d,e,f=string.find(message,".*(please) (teach) (me) (.+)");
--        	thisNPC:talk(CCharacter.say, "Oh, yes.");
--        	if f=="human" then
--        		originator:increaseSkill(1,"human language",100);		-- increase skill "human language",
--        		thisNPC:talk(CCharacter.say, "#me A pleasure!");			-- say something nice.
--        	end
--        	if f=="dwarf" then
--        		originator:increaseSkill(1,"dwarf language",100);
--        		thisNPC:talk(CCharacter.say, "#me A pleasure!");
--       		end
--        	if f=="common" then
--        		originator:increaseSkill(1,"common language",100);
--        		thisNPC:talk(CCharacter.say, "#me A pleasure!");
--        	end
--        end
--        
        if message=="stop!" then							-- set "stand" to 1 which affects "nextCycle":
        	stand=1;								-- if stand==1 then he stands still, else he ...
        end	
        										-- ... walks around.
        if message=="run!" then
        	stand=2;
        end
        
--        if string.find(message,".*[Tt]ake%s%d+%ssword.*") ~= nil then			-- if message="take <number> sword(s)"...
--        	thisNPC:talk(CCharacter.say,"Okay!");
--        	a,b,c=string.find(message,".*[Tt]ake (%d+) sword.*");			-- analyze string, c="<number>"
--        	if originator:countItem(1)+2 > c+1 then				-- if originator has enough swords
--        		originator:eraseItem(1,c*1);					-- erase item from originators inventory c times
--        		ware["sword"]=ware["sword"]+c*1;
--        	else
--        		thisNPC:talk(CCharacter.say,"You do not have enough swords!");
--        	end
--        end
--        
--        if message=="left" then
--        	thisNPC:talk(CCharacter.say,"swords left: " .. ware["sword"]);
--        end
--        
--        if string.find(message,".*[Gg]ive%sme%s%d+%ssword.*")~=nil then			-- if message="give me <number> sword(s)"
--         	a,b,c=string.find(message,".*[Gg]ive me (%d+) sword.*");		-- analyze string, c="number"
--         	if ware["sword"]+2>c+1 then							-- if NPC has enough swords
--         		thisNPC:talk(CCharacter.say, "Here you are!");
--         		ware["sword"]=ware["sword"]-c*1;
--         		originator:createItem(1,c*1,333,0);
--         	else
--         		thisNPC:talk(CCharacter.say, "I do not have " .. c .. " swords!");
--         	end
--        end
--        
--        if string.find(message,"warp%sme%sto%s%d+%d+" ~= nil) then
--               a,b,c,d,e=string.find(message,"(warp me to) (%d+) (%d+)");
--               NewPos=position(d,e,0);
--               originator:warp(position);
--        end
end
