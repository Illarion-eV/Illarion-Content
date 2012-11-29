-- gemdust
-- alchemy system: using gemdust infront of a cauldron - creating essence brew or enchant a stock

require("base.common")
require("alchemy.base.alchemy")

module("alchemy.base.gemdust", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
User:inform("debug 1")
    -- infront of a cauldron?
    local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
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
    cauldron:setData("filledWith","essenceBrew")
	local reGemdust, reCauldron, reBottle = alchemy.base.alchemy.GemDustBottleCauldron(gemDust, nil, nil, User)
	cauldron.id = reCauldron
	world:changeItem(cauldron)
	world:makeSound(13,cauldron.pos)
	world:gfx(52,cauldron.pos)

end

function BrewingGemDust(User,gemDust,cauldron)
    
	if cauldron:getData("filledWith")=="potion" then -- potion in cauldron, failure
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
	
    elseif cauldron:getData("filledWith")=="essenceBrew" then -- essence brew in cauldron, failure
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
		
	elseif cauldron:getData("filledWith") == "stock" then
	    GemDustInStock(User,cauldron,gemDust)
		--User:learn("alchemy",6,20,100,User:increaseAttrib("essence",0))

    elseif cauldron:getData("filledWith")=="water" then
		GemDustInWater(User,cauldron,gemDust)
		--User:learn("alchemy",6,20,100,User:increaseAttrib("essence",0))
	
	else -- nothing in the cauldron
	    base.common.InformNLS(User, "Der Edelsteinstaub verflüchtigt sich, als du ihn in den leeren Kessel schüttest.", 
		                            "The gem dust dissipates, as you fill it into the empty cauldron.")
	end	
    world:erase(gemDust,1)	
end