-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

require("base.common")
require("druid.base.alchemy")
require("druid.base.herbs")
require("druid.base.gemdust")


module("druid.base.brewing_plants_gemdust", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    AlchemyPlant = druid.base.alchemy.CheckIfAlchemyPlant(User,SourceItem)
	gemDust = druid.base.alchemy.CheckIfGemDust(User,SourceItem)
	if AlchemyPlant  or SourceItem.id == 157 then
	    druid.base.herbs(User,SourceItem,TargetItem,Counter,Param,ltstate)
	elseif gemDust then
	    druid.base.gemdust(User,SourceItem,TargetItem,Counter,Param,ltstate)
	end
end	