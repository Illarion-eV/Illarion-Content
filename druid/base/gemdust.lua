-- gemdust
-- alchemy system: using gemdust infront of a cauldron - creating essence brew or enchant a stock

require("base.common")
require("druid.base.alchemy")

module("druid.base.gemdust", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

   -- infront of a cauldron?
   if base.common.GetFrontItemID(User) == 1008 then
	  
        -- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  base.common.InformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here."
				)
		  return;
	    end

        gemDust = druid.base.alchemy.CheckIfGemDust(User,SourceItem)
	    if gemDust then -- security check if it is really gem dust
	        BrewingGemDust(User,SourceItem,TargetItem,Counter,Param,ltstate)
	    end
    
	else
	    -- not infront of cauldron, maybe do something else with herbs
        return
	end
end

function BrewingGemDust(User,SourceItem,TargetItem,Counter,Param,ltstate)
    cauldron = base.common.GetFrontItem(User)

	if ( ltstate == Action.abort ) then
		base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	   return
	end
	
	if (ltstate == Action.none) then
		   User:startAction(30,21,5,15,25);
		   return
	end
	
	if SourceItem.id == 446 then --bluestone
	   IdPotion = 165 -- id of the matching potion
	elseif SourceItem.id == 447 then  -- ruby
		   IdPotion = 59
	elseif SourceItem.id == 448 then  -- emerald
		   IdPotion = 327
	elseif SourceItem.id ==	449 then  -- blackstone
		   IdPotion = 329
	elseif SourceItem.id == 450 then -- amethyst
		   IdPotion = 166
	elseif SourceItem.id == 451 then -- topaz
		   IdPotion = 328
	elseif SourceItem.id == 452 then -- diamond
		   IdPotion = 330
	end 
	
	if cauldron:getData("potionIdEffect")~="" then -- potion in cauldron, failure
	    druid.base.alchemy.CauldronExplosion(User,cauldron,{4,5})
	
    elseif cauldron:getData("cauldronFilledWith")=="essenceBrew" then -- essence brew in cauldron, failure
	    druid.base.alchemy.CauldronExplosion(User,cauldron,{4,5})
		
	elseif cauldron:getData("stockData") ~= "" then
	    if (SourceItem.id == 447) or (SourceItem.id == 450) then 
		    potionEffectId = TargetItem:getData("stockData")
	    else 
		    potionEffectId = 0
        end			
	    cauldron:setData("potionId",""..IdPotion)
		cauldron:setData("potionEffectId",""..potionEffectId)
	    cauldron:setData("stockData","")
		potionQuality = 999
	    cauldron:setData("potionQuality",""..potionQuality)
		world:makeSound(13,cauldron.pos)
		world:gfx(52,cauldron.pos)

    elseif cauldron:getData("cauldronFilledWith")=="water" then
		cauldron:setData("cauldronFilledWith","essenceBrew")
		cauldron:setData("potionId",""..IdPotion)
		world:makeSound(13,cauldron.pos)
		world:gfx(52,cauldron.pos)
	
	else -- nothing in the cauldron
	    base.common.InformNLS(User, "Der Edelsteinstaub verflüchtigt sich, als Du ihn in den leeren Kessel schüttest.", 
		                            "The gem dust dissipates, as you fill it into the empty cauldron.")
	end	

    world:changeItem(cauldron)
    world:erase(SourceItem,1)	
end