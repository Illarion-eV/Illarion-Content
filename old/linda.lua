module("npc.linda", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    if ( User:getPlayerLanguage()==0 ) then
        thisNPC:talk(Character.say, "Finger weg! Hilf mir lieber.");
    elseif ( User:getPlayerLanguage()==1 ) then
        thisNPC:talk(Character.say, "Hands off! Help me, instead.");
    end
end

function nextCycle()
--    if (cycCount==nil) then
--        cycCount=1;
--        thisNPC:increaseSkill(1,"common language",100);
--    else
--        cycCount=cycCount+1;
--        if (cycCount==300) then
--            if ((thisNPC.pos == position(234,43,0))==false) then     --does not run to the pier
--                direction = math random(3);
--                direction = direction*2;
--                thisNPC:move(direction);               --runs around
--            else
--                thisNPC:move(0);
--            end
--        end
--        if (cycCount==1200) then
--            cycCount=1;
--            thisNPC:talk(Character.say, "Hello you! Over here! Could you help me?");
--        end
--    end
end

function receiveText(texttype, message, originator)
 -- printerr("from"..originator.name.."to"..thisNPC.name);

    if (originator.id ~= thisNPC.id) then                                                  --avoid talking to himself.
        thisNPC:introduce(originator);
        if (originator:countItemAt("all",302) == 0) then    --cherries
            thisNPC:talk(Character.say, "I like cherries very much. Will you bring me some from the garden?");
        else
            thisNPC:talk(Character.say, "Thank you, cherries are so tasteful. Here, I give you an apple in return.");
            originator:eraseItem(302,1);
            originator:createItem(15,1);
        end
    end
end
