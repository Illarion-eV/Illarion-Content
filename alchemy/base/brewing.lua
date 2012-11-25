-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

require("base.common")
require("alchemy.base.alchemy")
require("alchemy.base.herbs")
require("alchemy.base.gemdust")

module("alchemy.base.brewing", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    User:inform("debug 0.5")
	local isPlant = alchemy.base.alchemy.getPlantSubstance(SourceItem.id, User)
	local isGemDust = alchemy.base.alchemy.CheckIfGemDust(SourceItem)
	User:inform("debug 0.75")
	if isPlant  or SourceItem.id == 157 then
	    User:inform("debug1")
		alchemy.base.herbs.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	elseif gemDust then
	    alchemy.base.gemdust.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	end
end	