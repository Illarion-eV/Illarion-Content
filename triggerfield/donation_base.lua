require("base.common")
require("base.money")

module("triggerfield.donation_base", package.seeall)

function donate(Item,User,FactionName,LeaderName,Treasury)

    -- This function donates 10% of the worth of an item to the faction
    
	ItemStats=world:getItemStats(Item); -- get the item stats
	
	if ItemStats.Worth == 0 then -- worthless item -> inform
	
        base.common.InformNLS(User,"[Spende] Dieser Gegenstand ist wertlos.","[Donation] This item is worthless."); -- Feedback!
		
	else -- item with worth
	
		if Item.id == 61 or Item.id == 3076 or Item.id == 3077 then -- coins
		
		    payToFaction = Item.number*ItemStats.Worth; -- 100% of the worth are added for coins
			
		else
		
		    payToFaction = Item.number*ItemStats.Worth*0.1; -- 10% of the worth are added for items
		
		end
		
		foundTreasure, oldTreasure = ScriptVars:find(Treasury); -- Reading the old treasure amount
				
	    if not foundTreasure then -- security check
			oldTreasure = 0;
		else
		    User:inform("Old: "..oldTreasure.."!");
		    oldTreasure=tonumber(oldTreasure); --Converting the string to a number
		    newTreasure=tostring(oldTreasure+payToFaction); --scriptVars are strings :-(
		    User:inform("New: "..newTreasure.."!");
			ScriptVars:set(Treasury, newTreasure); -- add acquired coins to the treasure	
            ScriptVars:save();			
		end
		
		gp,sp,cp=base.money.MoneyToCoins(payToFaction); -- split the amount into copper coins, silver coins and gold coins
		
		if payToFaction >= 10000 then -- at least one gold coin
	
	        estring=" "..gp.." gold coins, "..sp.." silver coins and "..cp.." copper coins";
		    gstring=" "..gp.." Goldstücken, "..sp.." Silberstücken und "..cp.." Kupferstücken"; --what a name for a variable...

        elseif payToFaction >= 100 then -- at least one silver coin
	
		    estring=" "..sp.." silver coins and "..cp.." copper coins";
		    gstring=" "..sp.." Silberstücken und "..cp.." Kupferstücken"; --what a name for a variable...
		
	    else -- just copper coins
	
		    estring=" "..cp.." copper coins";
		    gstring=" "..cp.." Kupferstücken"; --what a name for a variable...
		
	    end

        base.common.InformNLS(User,"[Spende] Du spendest Gegenstände im Gegenwert von"..gstring.." in die Schatzkammer von "..FactionName..". "..LeaderName.." wird zufrieden sein.","[Donation] You donate items valued at"..estring.." to the treasury of "..FactionName..". "..LeaderName.." will be pleased."); -- Feedback!		
		world:gfx(46,Item.pos); -- nice GFX
		world:erase(Item,Item.number); -- delete the item
	
	end    
	
end