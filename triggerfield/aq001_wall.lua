-- Location: -50 201 -3
-- Purpose: simulate illusion wall

module("triggerfield.aq001_wall", package.seeall)
require("base.common")

function MoveFromField(User)
    if (User:getFaceTo() == 0) then
	    informNLS(user,"Die solide aussehende Höhlenwand war anscheinend nur eine Illusion und du stolperst in einen stockfinsteren Schacht...","Apparently the solid seeming cave wall was just an illusion and you stumble into a pitch-dark shaft...");
        User:warp( position( -50, 200, -9 ) );
    end;
end
