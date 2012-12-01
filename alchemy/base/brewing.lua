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
    User:inform("debug brewing 1")
	local isPlant, ignoreIt = alchemy.base.alchemy.getPlantSubstance(SourceItem.id, User)
	local isGemDust = alchemy.base.alchemy.CheckIfGemDust(SourceItem, User)
	if isPlant  or SourceItem.id == 157 then
	    alchemy.base.herbs.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	elseif isGemDust then
	    User:inform("debug brewing 2")
		alchemy.base.gemdust.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	end
end	