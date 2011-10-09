--Last Update: 20/06/2008
--Update by:   Kadiya

--UPDATE common SET com_script='base_wind.lua' WHERE com_itemid=(373);

require("base.common")


function CharacterOnField( User )
    local SetOff=false;
    repeat
    
    local SourceItem = world:getItemOnField( User.pos );
    direction=User:getFaceTo();
    if (SourceItem==373) then
    	if (direction==0) then
	    --User:warp(position(User.pos.x,User.pos.y+2,User.pos.z));
	    User:inform("moep->0")
	elseif (direction==2) then
	    --User:warp(position(User.pos.x-2,User.pos.y,User.pos.z));
            User:inform("moep->2")
    	elseif (direction==4) then
	    --User:warp(position(User.pos.x,User.pos.y-2,User.pos.z));
            User:inform("moep->4")
    	elseif (direction==6) then
	    --User:warp(position(User.pos.x+2,User.pos.y,User.pos.z));
            User:inform("moep->6")
    	else
	    User:inform("moep->Error!")
    	end
	SetOff=true;

    end
    until ( SetOff == true )
    User.movepoints=User.movepoints-10;
end

