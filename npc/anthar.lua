module("npc.anthar", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    if ( User:getPlayerLanguage()==0 ) then
         thisNPC:talk(CCharacter.say, "Leg deine Hand nicht an einen Mann der Götter.");
    elseif ( User:getPlayerLanguage()==1 ) then
    thisNPC:talk(CCharacter.say, "Don't you lay hand on a man of the gods.");
    end
end

function nextCycle()
     if cycCount==nil then
        cycCount=1;
        thisNPC:increaseSkill(1,"common language",100);
     else
        cycCount=cycCount+1;
        if cycCount==1200 then
            cycCount=1;
            thisNPC:talk(CCharacter.say, "Praise the gods!");
        end
    end
end

function receiveText(texttype, message, originator)
 -- printerr("from"..originator.name.."to"..thisNPC.name);

    if originator.id ~= thisNPC.id then                                                  --avoid talking to himself.
       thisNPC:introduce(originator);
       if (string.find(message,"#me.*bows") ~= nil) then
            if (originator:countItemAt("all",134) == 0) then     --fourleafed oneberry
               thisNPC:talk(CCharacter.say, "Yes, respect the gods! Take this token of luck. It will help you in times of need.");
               originator:createItem(15,1);
            else
               thisNPC:talk(CCharacter.say, "The token of luck will help you. Keep it safe.");
            end
       else
            thisNPC:talk(CCharacter.say, "Hush! Bow down and praise the gods.");
       end
    end
end