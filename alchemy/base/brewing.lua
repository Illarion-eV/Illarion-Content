-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

require("base.common")
require("alchemy.base.alchemy")
require("alchemy.base.herbs")
require("alchemy.base.gemdust")


module("alchemy.base.brewing_plants_gemdust", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    local isPlant = alchemy.base.alchemy.getPlant(SourceItem.id)
	local isGemDust = alchemy.base.alchemy.CheckIfGemDust(SourceItem)
	if isPlant  or SourceItem.id == 157 then
	    alchemy.base.herbs.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	elseif gemDust then
	    alchemy.base.gemdust.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	end
end	