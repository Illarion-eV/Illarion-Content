-- tinderbox
-- light a fire

require ("base.common")

module("item.id_x_tinderbox", package.seeall)

LogIds = {3,543,544,2560};

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	
	local logItem = base.common.GetFrontItem(User);
	
	
end

function IsLog(item)
	if not item then
		return;
	end
	
	if item.id == 0 then
		return;
	end
	
	for _,id in pairs(LogIds) do
		if id == item.id then
			return true;
		end
	end
	
	return false;
end
