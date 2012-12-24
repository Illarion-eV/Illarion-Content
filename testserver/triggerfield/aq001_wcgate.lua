-- Location: 28 190 -12
-- Purpose: invisible wall for secret passage to well, testing for

module("triggerfield.aq001_wcgate", package.seeall)
require("base.common")

function MoveToField( user )
    if world:isItemOnField( position( 28, 190, -12) ) then
        if (world:getItemOnField( position( 28, 190, -12) )).id ~= 287 then

            local left = user:getItemAt(5);
            local right = user:getItemAt(6);

            if( (right.id == 2496) and (left.id == 2496) and ( ((tonumber(right:getData("wallData")) == 1) and (tonumber(left:getData("wallData")) == 2)) or (((tonumber(right:getData("wallData")) == 2) and (tonumber(left:getData("wallData")) == 1)) ) ) then
                right.data = 0;
                left.data = 0;
                right.id = 2498;
                left.id = 2498;
                world:changeItem(right);
                world:changeItem(left);
            else
			    base.common.InformNLS(user,"Eine unsichtbare Wand hält dich zurück.","An invisible wall holds you back.");
                user:warp(position(27,190,-12));
            end;

        end;

    end

end
