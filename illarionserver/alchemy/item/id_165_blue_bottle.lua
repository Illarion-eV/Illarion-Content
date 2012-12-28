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
		        actionDuration = 80 -- when we combine a stock and an essence brew, it takes longer
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
			    SupportEssenceBrew(User,SourceItem,cauldron)
			
			elseif cauldron:getData("filledWith") == "potion" then
			    SupportPotion(User,SourceItem,cauldron)
			    
			elseif cauldron:getData("filledWith") == "stock" then
				SupportStock(User,SourceItem,cauldron)
			
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
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem)
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
	    end
	end  
end

function SupportStock(User,support,stock)
    
	-- no effects yet, support has no effect, stock is unchanged
    
	local cauldron = base.common.GetFrontItem( User )
	-- remove support potion in case it was in the cauldron
	alchemy.base.alchemy.RemoveAll(cauldron)
	-- fill in the stock
	alchemy.base.alchemy.FillFromTo(stock,cauldron)
	world:changeItem(cauldron)
	world:gfx(1,cauldron.pos)
    
end

function SupportEssenceBrew(User,support,essenceBrew)
    
	-- no effects yet, support has no effect, essenceBrew is unchanged
	
	local cauldron = base.common.GetFrontItem( User )
	-- remove the support 
	alchemy.base.alchemy.RemoveAll(cauldron)
	-- fill in the brew
	alchemy.base.alchemy.FillFromTo(essenceBrew,cauldron)
	world:changeItem(cauldron)
	world:gfx(1,cauldron.pos)
    return cauldron -- we have to give the cauldron back to keep our changes
end

function SupportPotion(User,support,potion)
    local cauldron = base.common.GetFrontItem( User )
	local supportEffectId = tonumber(support:getData("potionEffectId"))
	
	local supportQuality, potionQuality
	if support.id >= 1008 and support.id <= 1018 then
		supportQuality = tonumber(support:getData("potionQuality"))
		potionQuality = potion.quality
	else
		supportQuality = support.quality
		potionQuality = tonumber(support:getData("potionQuality"))
	end	
	if (supportEffectId >= 400) and (supportEffectId <= 406) then -- quality raiser
	    -- list with potions in cauldron and bottle
		local cauldronPotion = {1011,1016,1013,1009,1015,1018,1017} 
        local bottlePotion   = {327 ,59  ,165 ,329 ,166 ,167 ,330}
	
	    if (potion.id == cauldronPotion[supportEffectId-399]) or (potion.id == bottlePotion[supportEffectId-399]) then -- support and potion belong together
		    
			supportQuality = base.common.Limit(math.floor(supportQuality/100), 1, 9)
		    local chance = supportQuality*9  -- support quality * 9 = chance that potion's quality is increased
		    if base.common.Chance(chance, 100)==true then 
			    potionQuality = base.common.Limit(potionQuality+100, 100, 999) -- new quality
			    world:gfx(53,cauldron.pos)
			else -- no success, quality stays the same
		        world:gfx(1,cauldron.pos)
			end
		
		else 
	        world:gfx(1,cauldron.pos)
	    end

	else
	    world:gfx(1,cauldron.pos)
	end	
    alchemy.base.alchemy.RemoveAll(cauldron)
	alchemy.base.alchemy.FillFromTo(potion,cauldron)
	cauldron:setData("potionQuality",potionQuality) -- here we set the new quality, in case the quality raiser was successfull
end

function LookAtItem(User,Item)
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))   
end