-- Location: -50 201 -3
-- Purpose: simulate illusion wall

module("triggerfield.aq001_wall", package.seeall)

function MoveFromField(User)
    if (User:get_face_to() == 0) then
        if (User:getPlayerLanguage() == 0) then
            User:inform("Die solide aussehende Höhlenwand war anscheinend nur eine Illusion und du stolperst in einen stockfinsteren Schacht...");
        else
            User:inform("Apparently the solid seeming cave wall was just an illusion and you stumble into a pitch-dark shaft...");
        end;
        User:warp( position( -50, 200, -9 ) );
    end;
end
