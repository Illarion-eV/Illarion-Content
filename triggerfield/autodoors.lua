require("base.common")
require("base.doors")
require("item.doors")

module("triggerfield.autodoors", package.seeall)

function MoveToField(User)
    frontItem=base.common.GetFrontItem(User);
    backItem=base.common.GetBackItem(User);
	if frontItem.id==708 then
	    item.doors.UseItem(User,frontItem,nil,nil,nil);
	end
	if backItem.id==712 then
	    item.doors.UseItem(User,backItem,nil,nil,nil);
    end
end