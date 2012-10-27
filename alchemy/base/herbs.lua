-- herbs 
-- alchemy system: using a herb infront of a cauldron - brewing

require("base.common")
require("alchemy.base.alchemy")

module("alchemy.base.herbs", package.seeall)


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

    -- infront of a cauldron?
	local cauldron = base.common.GetFrontItem(User)
    if cauldron == 1008 then
	  
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
		
		local isPlant = alchemy.base.alchemy.getPlant(SourceItem.id)
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
    local success = false
    for i=1,8 do 
		if cauldron:getData("essenceHerb"..i) == "" then
			cauldron:setData("essenceHerb"..i,plant.id)
			world:changeItem(cauldron)
			success = true
			break
		end				
	end

	if not success then
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
	end	
end

function PlantInStock(User,cauldron,plant)
    local plusSubstance, minusSubstance = alchemy.base.alchemy.getPlantSubstance(plant.id)
	if plusSubstance == "" and minusSubstance == "" then
	    alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
	else
	    if plusSubstance ~= "" then
		    local oldConcentration = tonumber(cauldron:getData(plusSubstance.."Concentration"))
			if concentration == nil then
			    concentration = 5 
			end
            local newConcentration = oldConcentration + 1
            if newConcentration > 9 then
                alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
			    return
			else
                cauldron:setData(plusSubstance..Concentration,newConcentration)
                world:changeItem(cauldron)
			end				
	    end
		if minusSubstance ~= "" then
		    local oldConcentration = tonumber(cauldron:getData(minusSubstance.."Concentration"))
			if concentration == nil then
			    concentration = 5 
			end

            local newConcentration = oldConcentration - 1
            if newConcentration < 1 then
                alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)
			    return
			else
                cauldron:setData(minusSubstance.."Concentration",newConcentration)
                world:changeItem(cauldron)
			end				
	    end
	end
end

function BrewingPlant(User,plant,cauldron)
    if cauldron:getData("cauldronFilledWith") == "potion" then -- potion in cauldron, failure
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
		
	elseif cauldron:getData("cauldronFilledWith")== "essenceBrew" then -- essence brew
		PlantInEssenceBrew(User,cauldron,plant)
		User:learn(Character.alchemy,20,100,User:increaseAttrib("essence",0))
		
	elseif (cauldron:getData("cauldronFilledWith") == "stock") or (cauldron:getData("cauldronFilledWith") == "water") then -- water or a stock we put the herb in
	    PlantInStock(User,cauldron,plant)
		User:learn(Character.alchemy,20,100,User:increaseAttrib("essence",0))
		
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
				world:changeItem(cauldron)
				success = true
			elseif oldConcentration < 5 then
			    cauldron:setData(mySubstance.."Concentration",oldConcentration+1)
				world:changeItem(cauldron)
				success = true
            end    			
        end
	end
    if success == false then
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,2)	
	end	
end

function BrewingFilter(User,plant,cauldron)
    if cauldron:getData("cauldronFilledWith") == "potion" then -- potion in cauldron, failure
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
    
	elseif cauldron:getData("cauldronFilledWith")=="essenceBrew" then -- essence brew in cauldron, failure
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
		
	elseif cauldron:getData("cauldronFilledWith")=="water" then
        alchemy.base.alchemy.CauldronDestruction(User,cauldron,1)
    
	elseif cauldron:getData("stockData")~="" then -- stock, let's filter
	    FilterStock(User,cauldron,plant)
		User:learn("alchemy",6,20,100,User:increaseAttrib("essence",0))
        
    else -- empty cauldron
        base.common.InformNLS(User, "Die Pflanze vertrockent auf dem Boden des heißen Kessels und zerfällt zu Asche", 
		                            "The plant dries up on the hot bottom of the cauldron and falls to ashes.")	
	end
    world:erase(SourceItem,1)	
end
