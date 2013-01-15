--Function:    Generic trap script
--Last Update: 01/04/2006
--Update by:   Nitram

-- UPDATE common SET com_script='item.traps' WHERE com_itemid IN (377,378,379,380,381);

require("base.common")

module("item.traps", package.seeall)

function UseItem(User, SourceItem)
    if ((User:increaseAttrib("dexterity",0) + 0.5*User:increaseAttrib("perception",0) + math.random(1,30)) >= 30) then
        base.common.InformNLS( User,"Du entschärfst die Falle.","You disarm the trap." );
        world:swap(SourceItem,375,333);
    else
        base.common.InformNLS( User,"Du löst die Falle aus!","You set off the trap!" );
        world:gfx(14,SourceItem.pos);
        User:increaseAttrib("hitpoints", -5000);
        world:swap(SourceItem,376,333);
    end
    User.movepoints=User.movepoints-10;
end

function CharacterOnField( User )
    local SetOff=false;
	if (User:increaseAttrib("hitpoints",0)>0) then --ghosts do not set off traps
        repeat
            local SourceItem = world:getItemOnField( User.pos );
            if (User:increaseAttrib("hitpoints",0)>0) then
                if( SourceItem.id >= 377 ) and (SourceItem.id <= 381) then
                    base.common.InformNLS( User,"Du löst eine Falle aus!","You set off a trap!" );
                    world:gfx(14,User.pos);
                    User:increaseAttrib("hitpoints", -4999);
                    world:swap(SourceItem,376,333);
                    SetOff=true;
                else
                    world:erase(SourceItem,1);
                end
            end
        until ( SetOff == true )
        User.movepoints=User.movepoints-10;
	end
end

function LookAtItem(User,Item)
    if (User:distanceMetricToPosition(Item.pos)<2 and User:increaseAttrib("perception",0)>15) then
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Falle")
        else
            world:itemInform(User,Item,"trap")
        end
    end
end
