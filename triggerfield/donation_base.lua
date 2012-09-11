require("base.common")

module("triggerfield.donation_base", package.seeall)


function donate(Item,User,FactionName,LeaderName,Treasury)

    -- This function donates 10% of the worth of an item to the faction
    
	ItemStats=world:getItemStats(Item); -- get the item stats
	
	if ItemStats.Worth == 0 then -- worthless item -> inform
	
        base.common.InformNLS(User,"Arsch!","Asshole!"); -- Feedback!
		
	else -- item with worth
	
		payToFaction = Item.number*ItemStats.Worth*0.1; -- 10% of the worth are added
		foundTreasure, oldTreasure = ScriptVars:find(Treasury); -- Reading the old treasure amount
		
	    if not foundTreasure then -- security check
			oldTreasure = 0
		else
			ScriptVars:set(Treasury, oldTreasure+payToFaction) -- add acquired coins to the treasure		
		end
		
        base.common.InformNLS(User,"[Spende] Du spendest Gegenstände im Gegenwert von "..payToFaction.." Kupferstücken in die Schatzkammer von "..FactionName..". "..LeaderName.." wird zufrieden sein.","[Donation] You donate items valued at "..payToFaction.." copper coins to the treasury of "..FactionName..". "..LeaderName.." will be pleased."); -- Feedback!		
		world:gfx(46,Item.pos);
		world:erase(Item,Item.number); -- delete the item
	
	end    
	
end