function useNPC(user,counter,param)
       -- user:talk(CCharacter.say, "test");
       thisNPC:increaseSkill(1,"common language",100);
       thisNPC:talk(CCharacter.say, "Don't touch me!");
end

function nextCycle()
		
end					-- End of function

function receiveText(texttype, message, originator)
 -- printerr("from"..originator.name.."to"..thisNPC.name);

    if originator.id ~= thisNPC.id then								-- straight forward.

         race=originator:increaseAttrib("racetype",0);                              -- determine race of speaker
         if(race==0) then raceString="human"
         elseif(race==1) then 
              raceString="dwarf";
              thisNPC.activeLanguage=2;                                             -- if the speaker is a dwarf, speak dwarfen
         elseif(race==2) then raceString="halfling"
         elseif(race==3) then raceString="elf"
         elseif(race==4) then raceString="orc"
         elseif(race==5) then raceString="lizardman"
         else raceString="something else" end
         
        thisNPC:increaseSkill(1,"common language",100);
        
        if (string.find(message,"[Gg]reetings") ~= nil) then                        -- reacts if "greetings" is inside the text     
            thisNPC:talk(CCharacter.say, "Good day, stranger. What is your name?  You are a "..raceString..".");            
        end
        
        if (string.find(message,originator.name) ~= nil) then
            thisNPC:talk(CCharacter.say, "Nice to meet you, "..originator.name..". Can I help you?")
        end
        
        if (string.find(message,"warp%s%d+%s%d+") ~= nil) then                     -- on "warp 10 200" he warps you to that coordinates
            a,b,c,d,e=string.find(message,"(warp) (%d+) (%d+)");
            originator:inform("a="..a.." b="..b.." c="..c.." d="..d.." e="..e);
            NewPos=position(d+1-1,e+1-1,0);                                        -- to convert it into numbers, add 1 and subtract 1 again
            originator:inform("koo ".. NewPos.x .." ".. NewPos.y .." ".. NewPos.z);
            originator:warp(NewPos);
        end
        
        if (string.find(mesage,"[Gg]ive%sme%smoney") ~= nil) then
            originator:createItem(3076,250,333,0)
        end
        
        if (string.find(message,"[Cc]reate%smonster") ~= nil) then
            monsPos=position(thisNPC.pos.x+3,thisNPC.pos.y,thisNPC.pos.z)
            world:createMonster(3,monsPos,100);
        end
   end
end