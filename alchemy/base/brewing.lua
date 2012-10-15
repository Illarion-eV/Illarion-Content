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
    AlchemyPlant = druid.base.alchemy.CheckIfAlchemyPlant(User,SourceItem)
	gemDust = druid.base.alchemy.CheckIfGemDust(User,SourceItem)
	if AlchemyPlant  or SourceItem.id == 157 then
	    druid.base.herbs.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	elseif gemDust then
	    druid.base.gemdust.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	end
end	