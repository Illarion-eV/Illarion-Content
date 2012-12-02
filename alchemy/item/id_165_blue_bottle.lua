--I_165_blaue_flasche
-- new effects for reworked alchemy system
-- support potions: the effect other potions (stocks or essencebrews) or the effect of potion
-- e.g. change a potion's quality, remove cooldown of  potion

require("base.common")
require("alchemy.base.alchemy")

module("alchemy.item.id_165_blue_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_165_blue_bottle' WHERE com_itemid = 165;

function DrinkPotion(User,SourceItem)
    -- no effecs yet
	 base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
end

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	
	   -- is the char an alchemist?
	    local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
		if not anAlchemist then
			return
		end
	   
	   if ( ltstate == Action.abort ) then
	        base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
		
		if ( ltstate == Action.none ) then
            if (SourceItem:getData("filledWith") =="essenceBrew") and (cauldron:getData("filledWith") == "stock") then
		        actionDuration = 40 -- when we combine a stock and an essence brew, it takes longer
            else
                actionDuration = 20
            end				
			User:startAction( actionDuration, 21, 5, 10, 45)
			return
		end	
	
	    if (SourceItem:getData("filledWith")=="potion") then -- potion should be filled into the cauldron
		    -- water leads to a failure
			if cauldron:getData("cauldronFilledWith") == "water" then
			    world:gfx(1,cauldron.pos)
		    
			elseif cauldron:getData("filledWith") == "essenceBrew" then 
			    cauldron = SupportEssencebrew(User,SourceItem,cauldron)
			
			elseif cauldron:getData("filledWith") == "potion" then
			    cauldron = SupportPotion(User,SourceItem,cauldron)
			    
			elseif cauldron:getData("filledWith") == "stock" then
				cauldron = SupportStock(User,SourceItem,cauldron)
			
			else
			    alchemy.base.alchemy.FillFromTo(SourceItem,cauldron)
			end    
            alchemy.base.alchemy.EmptyBottle(User,SourceItem)
			world:changeItem(cauldron)
		
		elseif (SourceItem:getData("filledWith") =="essenceBrew") then -- essence brew should be filled into the cauldron
		    -- unlike the support potion itself, the essence brew of it has no specail effects when filled in
			-- therefore we call the ordinary fill-function; note that we call it after checking for potion in this script
			-- and we do not set ltstate as a parameter, since we did the abort stuff already here
			alchemy.base.alchemy.FillIntoCauldron(User,SourceItem,cauldron,Counter,Param)
		end
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine hellblaue Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a light blue liquid.");
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem)
	    end
	end  
end

function GetProperties(support,targetBrew)
    -- returns datas and qualities for the support functions
	
	if targetBrew.id == 1008 then -- the target brew is in the cauldron, the support is in a bottle
	    supQuali = support.quality 
	    tarBrewId = tonumber(targetBrew:getData("potionId"))
	    tarBrewQuali = tonumber(targetBrew:getData("potionQuality"))
	
    else -- support is in the cauldron, the other brew in a bottle
        supQuali = tonumber(support:getData("potionQuality"))
	    tarBrewId = targetBrew.id
		tarBrewQuali = targetBrew.quality
	end
	
	supEffId = tonumber(support:getData("potionEffectId"))
	essHerbs = targetBrew:getData("essenceHerbs")
	tarStData = targetBrew:getData("stockData")
	tarBrewEffId = tonumber(targetBrew:getData("potionEffectId"))
	
	if tarStData~="" then -- target a stock
		return supEffId, supQuali, tarStData
	
	elseif (targetBrew:getData("essenceBrew")=="true") or (targetBrew:getData("cauldronFilledWith")=="essenceBrew")then -- target an essence brew
		return supEffId, supQuali, tarBrewId, essHerbs
		
	elseif tarBrewEffId ~= nil then -- target a potion
		return supEffId, supQuali, tarBrewId, tarBrewEffId, tarBrewQuali
	end
	
end	
	
function SupportStock(User,support,stock)
    supportEffectId, supportQuality, stockData = GetProperties(support,stock)
	
	-- no effects yet
    
	local cauldron = base.common.GetFrontItem( User )
	-- remove support potion in case it was in the cauldron
	cauldron:setData("potionId","")
	cauldron:setData("potionEffectId","")
	cauldron:setData("potionQuality","")
	-- fill in the stock
	cauldron:setData("stockData",stockData)
	world:changeItem(cauldron)
	world:gfx(1,cauldron.pos)
    return cauldron -- we have to give the cauldron back to keep our changes
end

function SupportEssencebrew(User,support,essencebrew)
    supportEffectId, supportQuality, potionId, essenceHerbs = GetProperties(support,essencebrew)
	
	-- no effects yet
	
	local cauldron = base.common.GetFrontItem( User )
	-- remove the support brew and fill in the essence brew
	cauldron:setData("potionEffectId","")
	cauldron:setData("potionId",potionId)
	cauldron:setData("cauldronFilledWith","essenceBrew")
	cauldron:setData("essenceHerbs",essenceHerbs)
    cauldron:setData("potionQuality","")
	world:changeItem(cauldron)
	world:gfx(1,cauldron.pos)
    return cauldron -- we have to give the cauldron back to keep our changes
end

function SupportPotion(User,support,potion)
    supportPotionEffectId, supportQuality, targetPotionId, targetPotionEffectId, targetPotionQuality = GetProperties(support,potion)
	User:talkLanguage(Character.say,Player.german,"old quali: "..targetPotionQuality)
	local cauldron = base.common.GetFrontItem( User )
	
	if (supportPotionEffectId > 0) and (supportPotionEffectId <= 7) then -- quality raiser
	    PotionList = {59,165,166,327,328,329,330} -- potion ids
	
	    if targetPotionId == PotionList[supportPotionEffectId] then -- support and potion belong together
		
		    local chance = (math.floor(supportQuality/100))*9  -- support quality * 9 = chance that potion's quality is increased
		    User:talkLanguage(Character.say,Player.german,"chance: "..chance)
			if base.common.Chance(chance, 100)==true then 
			    local newQuali = base.common.Limit(targetPotionQuality+100, 100, 999)
			    User:talkLanguage(Character.say,Player.german,"new quali: "..newQuali)
				cauldron:setData("potionQuality",""..newQuali)
		        world:gfx(53,cauldron.pos)
			else -- no success, quality stays the same
		        cauldron:setData("potionQuality",targetPotionQuality)
                world:gfx(1,cauldron.pos)
			end
		
		else 
	        world:gfx(1,cauldron.pos)
	    end

	else
	    world:gfx(1,cauldron.pos)
	end	

	cauldron:setData("potionId",targetPotionId)
	cauldron:setData("potionEffectId",targetPotionEffectId)
    world:changeItem(cauldron)
    User:talkLanguage(Character.say,Player.german,"quali added: "..cauldron:getData("potionQuality"))
    return cauldron -- we have to give the cauldron back to keep our changes
end

function LookAtItem(User,Item)
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))   
end