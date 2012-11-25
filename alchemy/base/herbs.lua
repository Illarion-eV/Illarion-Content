-- herbs 
-- alchemy system: using a herb infront of a cauldron - brewing

require("base.common")
require("alchemy.base.alchemy")

module("alchemy.base.herbs", package.seeall)


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

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
		   User:startAction(20,21,5,15,25);
		   return
	    end
		
		local isPlant, ignoreIt = alchemy.base.alchemy.getPlantSubstance(SourceItem.id, User)
	    if isPlant then
	        BrewingPlant(User,SourceItem,cauldron)
	    elseif SourceItem.id == 157 then
		    BrewingFilter(User,SourceItem,cauldron)
		end
    
	else
	    -- not infront of cauldron, maybe do something else with herbs
        return
	end
end

function PlantInEssenceBrew(User,cauldron,plant)
    local success = nil
    for i=1,8 do 
		if cauldron:getData("essenceHerb"..i) == "" then
			cauldron:setData("essenceHerb"..i,plant.id)
			success = true
			break
		end				
	end
	
	if success then
	    world:changeItem(cauldron)
	else
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
	end	
end

function PlantInStock(User,cauldron,plant)
    local plusSubstance, minusSubstance = alchemy.base.alchemy.getPlantSubstance(plant.id, User)
	if plusSubstance == "" and minusSubstance == "" then
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
	else
	    if plusSubstance ~= "" then
		    local oldConcentration = tonumber(cauldron:getData(plusSubstance.."Concentration"))
			if oldConcentration == nil then
			    oldConcentration = 5 
			end
            local newConcentration = oldConcentration + 1
            if newConcentration > 9 then
                alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
			    return
			else
                cauldron:setData(plusSubstance.."Concentration",newConcentration)
                cauldron.id = 1012
			end				
	    end
		if minusSubstance ~= "" then
		    local oldConcentration = tonumber(cauldron:getData(minusSubstance.."Concentration"))
			if oldConcentration == nil then
			    oldConcentration = 5 
			end

            local newConcentration = oldConcentration - 1
            if newConcentration < 1 then
                alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
			    return
			else
                cauldron:setData(minusSubstance.."Concentration",newConcentration)
                cauldron.id = 1012
			end				
	    end
	    world:changeItem(cauldron)
	end
end

function BrewingPlant(User,plant,cauldron)
    if cauldron:getData("filledWith") == "potion" then -- potion in cauldron, failure
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
		
	elseif cauldron:getData("filledWith")== "essenceBrew" then -- essence brew
		PlantInEssenceBrew(User,cauldron,plant)
		User:learn(User.alchemy, 20, 100)
		
	elseif (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "water") then -- water or a stock we put the herb in
	    PlantInStock(User,cauldron,plant)
		User:learn(User.alchemy, 20, 100)
		
	else -- there is nothing in the cauldron to put the herb in, failure
	    base.common.InformNLS(User, "Die Pflanze vertrockent auf dem Boden des heißen Kessels und zerfällt zu Asche.", 
		                            "The plant dries up on the hot bottom of the cauldron and falls to ashes.")
        world:makeSound(7,cauldron.pos)    
	end		
	world:erase(plant,1)	
end

function FilterStock(User,cauldron,plant)
    local success = false
	local mySubstance = alchemy.base.alchemy.wirkstoff
	for i=1,8 do 
	    local oldConcentration = tonumber(cauldron:getData(mySubstance.."Concentration"))
		if not oldConcentration == nil then
		    if oldConcentration > 5 then
			    cauldron:setData(mySubstance.."Concentration",oldConcentration-1)
				success = true
			elseif oldConcentration < 5 then
			    cauldron:setData(mySubstance.."Concentration",oldConcentration+1)
				success = true
            end    			
        end
	end
	world:changeItem(cauldron)
    if success == false then
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)	
	end	
end

function BrewingFilter(User,plant,cauldron)
    if cauldron:getData("filledWith") == "potion" then -- potion in cauldron, failure
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
    
	elseif cauldron:getData("filledWith")=="essenceBrew" then -- essence brew in cauldron, failure
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
		
	elseif cauldron:getData("filledWith")=="water" then
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
    
	elseif cauldron:getData("filledWith")=="stock" then -- stock, let's filter
	    FilterStock(User,cauldron,plant)
		User:learn(User.alchemy, 20, 100)
		
    else -- empty cauldron
        base.common.InformNLS(User, "Die Pflanze vertrockent auf dem Boden des heißen Kessels und zerfällt zu Asche", 
		                            "The plant dries up on the hot bottom of the cauldron and falls to ashes.")	
	end
    world:erase(SourceItem,1)	
end
