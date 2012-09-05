-- INSERT INTO triggerfields VALUES (-492,-489,-40,'triggerfield.labour_camp_dumping');
-- INSERT INTO triggerfields VALUES (-492,-488,-40,'triggerfield.labour_camp_dumping');
-- INSERT INTO triggerfields VALUES (-491,-488,-40,'triggerfield.labour_camp_dumping');
-- INSERT INTO triggerfields VALUES (-491,-489,-40,'triggerfield.labour_camp_dumping');

require("base.common")

module("triggerfield.labour_camp_dumping", package.seeall)

function PutItemOnField(Item,User)
    -- coal, iron, copper, gold; more resources can be added
    if Item.id == 21 or Item.id == 22 or Item.id == 2536 or Item.id == 234 then
        
		local FactionImpr = User:getQuestProgress(26) -- faction which imprisoned the char
		local townTreasure = ""
		if FactionImpr == 1 then 
		    townTreasure = "TreasureCadomyr"
		elseif FactionImpr == 2 then 
		    townTreasure = "TreasureRunewick"
		elseif FactionImpr == 3 then 
		    townTreasure = "TreasureGalmair"
		end	

        if townTreasure ~= "" then -- only if the char as been sent to forced labour by a faction
			local theItemStats=world:getItemStats(Item)
			local payToFaction = Item.number*theItemStats.Worth--*FACTOR ; replace FACTOR with a value, determing what perecentage of the item worth is payed to the faction
			local foundTreasure, oldTreasure = ScriptVars:find(townTreasure)
			if not foundTreasure then -- security check
				oldTreasure = 0
			else
				ScriptVars:set(townTreasure, oldTreasure+payToFaction) -- add acquired coins to the treasure		
			end
			
			-- reduce work load of char
			local workLoad = User:getQuestProgress(25)
			if (workLoad - Item.number) <= 0 then
				User:setQuestProgress(25,0)
				User:setQuestProgress(26,0)
			else
				User:setQuestProgress(25,workLoad-Item.number)
			end
		end
		world:gfx(46,Item.pos)
		world:erase(Item,Item.number)
	end	
end