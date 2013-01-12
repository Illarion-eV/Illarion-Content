module("npc.skill", package.seeall)

function useNPC(user)
    --thisNPC:increaseSkill(1,"common language",100);
    
    thisNPC:talk(Character.say, "Don't you touch me!");    
end

function nextCycle()  -- ~10 times per second
    if (cycCount==nil) then
        cycCount=1;
        --nextDelivery=math.random(40000);
        thisNPC:increaseSkill(1,"common language",100);
        --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery);
    end
end



function receiveText(texttype, message, originator)
 -- printerr("from"..originator.name.."to"..thisNPC.name);
    --originator:introduce(thisNPC);
    if (TraderFirst == nil) then
        TraderFirst=1;  
        startPos={};
        
        startPos[1]=position(-90,-110,0); --human
        startPos[2]=position(-90,-110,0); -- dwarf
        startPos[3]=position(-90,-110,0); -- halfling
        startPos[4]=position(-90,-110,0);    --elf
        startPos[5]=position(-90,-110,0); -- orc
        startPos[6]=position(-90,-110,0); --lizzi
    end
    if (thisNPC:isInRange(originator,4)) then
        if (originator.id ~= thisNPC.id) then
            originator:introduce(thisNPC);
            
            if originator:getRace()==0 then skill="human language"
            elseif originator:getRace()==1 then skill="dwarf language"
            elseif originator:getRace()==2 then skill="halfling language"
            elseif originator:getRace()==3 then skill="elf language"
            elseif originator:getRace()==4 then skill="orc language"
            elseif originator:getRace()==5 then skill="lizard language" end
            
            originator:increaseSkill(1,skill,100);
            
            originator:increaseSkill(1,"common language",100);
            
            if (string.find(message,"[nN]ame")~=nil or string.find(message,"[Ww]ho.*you")~=nil) then
                thisNPC:talk(Character.say, "My name is "..thisNPC.name..". I am here to help you. Tell me if you want to be a fighter, a magician or a craftsman.");
            end
            
            if (string.find(message,"[Gg]reet")~=nil or string.find(message,"[Hh]ello")~=nil) then
                thisNPC:talk(Character.say, "My name is "..thisNPC.name..". I am here to help you. Tell me if you want to be a fighter, a magician or a craftsman.");
            end
            
            if string.find(message,"[Hh]elp")~=nil then
                thisNPC:talk(Character.say, "Say 'I want to be a craftsman' to become a craftsman, '...magician' to become a magician or '...fighter' to become a fighter");
            end
            
            if (string.find(message,"[Ww]ant.*be.*[Cc]raftsman") ~=nil) then
                thisNPC:talk(Character.say, "Not my problem.");
            elseif (string.find(message,"[Ww]ant.*be.*[Mm]agician")~=nil) then
                thisNPC:talk(Character.say, "Not my problem.");
            elseif (string.find(message,"[Ww]ant.*be.*[Ff]ighter") ~=nil) then
                thisNPC:talk(Character.say, "Not my problem.");
            elseif (string.find(message,"[Ww]ant.*be.*[Gg][Mm]") ~=nil) then
                thisNPC:talk(Character.say, "Hehe. Sure. Anyhing else?");
            end
        end
    end
end

