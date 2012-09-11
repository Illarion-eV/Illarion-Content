require("base.common")

module("triggerfield.donation_base", package.seeall)


function donate(Item,User,FactionID,FactionName,LeaderName,Treasury)

    -- This function donates 10% of the worth of an item to the faction
    
	ItemStats=world:getItemStats(Item); -- get the item stats
	
	if ItemStats.Worth == 0 then -- worthless item -> inform
	
        base.common.InformNLS(User,"Arsch!","Asshole!"); -- Feedback!
		
	else -- item with worth
	
        base.common.InformNLS(User,"OMG!","WTF!"); -- Feedback!
		payToFaction = Item.number*ItemStats.Worth*0.1; -- 10% of the worth are added
		foundTreasure, oldTreasure = ScriptVars:find(townTreasure); -- Reading the old treasure amount
		
	    if not foundTreasure then -- security check
			oldTreasure = 0
		else
			ScriptVars:set(townTreasure, oldTreasure+payToFaction) -- add acquired coins to the treasure		
		end
		
		world:erase(Item,Item.number); -- delete the item
	
	end    
	
end