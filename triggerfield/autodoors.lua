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
	--Automatic closing looks bad!
    --[[backItem=base.common.GetBehindItem(User);
	if backItem then
	    if backItem.id==712 then
	        item.doors.UseItem(User,backItem,nil,nil,nil);
        end
	end]]
end