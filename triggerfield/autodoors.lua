require("base.common")
require("base.doors")
require("item.doors")

module("triggerfield.autodoors", package.seeall)

function MoveToField(User)
    frontItem=base.common.GetFrontItem(User);
	if frontItem then
	    if frontItem.id==708 then
	        item.doors.UseItem(User,frontItem,nil,nil,nil);
	    end
	end
	backPos=base.common.GetBackPosition(User);
	backItemID=base.common.GetBackItemID(User);
    backItem=base.common.GetBackItem(User);
	if backItem then
	    if backItem.id==712 then
	        item.doors.UseItem(User,backItem,nil,nil,nil);
        end
	end
end