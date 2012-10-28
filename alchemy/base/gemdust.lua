-- gemdust
-- alchemy system: using gemdust infront of a cauldron - creating essence brew or enchant a stock

require("base.common")
require("alchemy.base.alchemy")

module("alchemy.base.gemdust", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

    -- infront of a cauldron?
    local cauldron = GetCauldronInfront(User)
    if cauldron then
	  
        -- is the char an alchemist?
		local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
		if not anAlchemist then
			return
		end

        if ( ltstate == Action.abort ) then
		    base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
			return
		end
	
		if (ltstate == Action.none) then
		   User:startAction(30,21,5,15,25);
		   return
		end
		
		BrewingGemDust(User,SourceItem,cauldron)
	else
	    -- not infront of cauldron, maybe do something else with herbs
        return
	end
end

function GetPotionId(gemDust)

    local potionId
    if gemDust.id == 446 then --bluestone
	   cauldronId = 1011 -- id of the matching potion
	elseif gemDust.id == 447 then  -- ruby
		   cauldronId = 1016
	elseif gemDust.id == 448 then  -- emerald
		   cauldronId = 1013
	elseif gemDust.id == 449 then  -- blackstone
		   cauldronId = 1009
	elseif gemDust.id == 450 then -- amethyst
		   cauldronId = 1015
	elseif gemDust.id == 451 then -- topaz
		   cauldronId = 1014
	elseif gemDust.id == 452 then -- diamond
		   cauldronId = 1017
	end 

    return cauldronId
end

function GemDustInStock(User,cauldron,gemDust)
    
	local potionEffectId = ""
	local addCon
	if (gemDust.id == 447) or (gemDust.id == 450) then 
		local mySubstances = alchemy.base.alchemy.wirkstoff
		for i=1,8 do 
		    addCon = (cauldron:getData(mySubstances[i].."Concentration"))
			if addCon == "" then
			    addCon = 5 
			end	
			potionEffectId = potionEffectId..addCon
	    end
	else 
		potionEffectId = 0
    end
    local cauldronId = GetCauldronId(gemDust)
	cauldron.id = cauldronId
	cauldron:setData("potionEffectId",""..potionEffectId)	
    getQuality = alchemy.base.alchemy.GetQuality(User)
	cauldron:setData("potionQuality",""..getQuality)
	cahuldron:setData("cauldronFilledWith","potion")
	world:changeItem(cauldron)
	world:makeSound(13,cauldron.pos)
	world:gfx(52,cauldron.pos)
end

function GemDustInWater(User,cauldron,gemDust)

    cauldron:setData("cauldronFilledWith","essenceBrew")
	local cauldronId = GetCauldronId(gemDust)
	cauldron.id = cauldronId
	world:changeItem(cauldron)
	world:makeSound(13,cauldron.pos)
	world:gfx(52,cauldron.pos)

end

function BrewingGemDust(User,gemDust,cauldron)
    
	if cauldron:getData("cauldronFilledWith")=="potion" then -- potion in cauldron, failure
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
	
    elseif cauldron:getData("cauldronFilledWith")=="essenceBrew" then -- essence brew in cauldron, failure
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
		
	elseif cauldron:getData("cauldronFilledWith") == "stock" then
	    GemDustInStock(User,cauldron,gemDust)
		User:learn("alchemy",6,20,100,User:increaseAttrib("essence",0))

    elseif cauldron:getData("cauldronFilledWith")=="water" then
		GemDustInWater(User,cauldron,gemDust)
		User:learn("alchemy",6,20,100,User:increaseAttrib("essence",0))
	
	else -- nothing in the cauldron
	    base.common.InformNLS(User, "Der Edelsteinstaub verflüchtigt sich, als Du ihn in den leeren Kessel schüttest.", 
		                            "The gem dust dissipates, as you fill it into the empty cauldron.")
	end	
    world:erase(gemDust,1)	
end