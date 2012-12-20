require("base.common")
module("scheduled.thunder", package.seeall)

function makeBolt()
	thunder=world.weather.thunderstorm;
	
	-- check whether it's thuderstorm or not
	if (thunder > 0) then
		-- tweaking variables: change the number for tweaking
		randomSeed = 100; -- the denominator for the chances
		chanceForBolt = math.ceil(thunder/20); -- max 5% chance
		boltRangeFromChar = 5; -- by tiles
		minDamage = 4000;
		maxDamage = 6500;
		-- chance of air and water element is created when it hit someone
		chanceForAirElement = 3; -- in %
		chanceForWaterElement = 4; -- in %
		chanceToBurnTree = 75; -- in %
		-- chance of fire element to be created is when it hit a tree
		chanceForFireElement = 2; -- in %
		-- chance of earth element to be created is when it hit nothing except the ground
		chanceForEarthElement = 1; -- in %
		-- end of tweaking variables
		
		damage = (math.random(minDamage,maxDamage))*thunder/100;

		-- if damage too little... re-calculate
		if (damage <= 2000) then
			damage = (math.random(minDamage,maxDamage))/2
		end
		
		-- get list of online players
		victimList = world:getPlayersOnline();
		for i, victim in pairs(victimList) do
			if noRoof(victim.pos) then
				-- no roof above... 
				if (math.random(randomSeed) <= chanceForBolt) then 
					-- randomly pick a spot around the victim
					a = math.random(-boltRangeFromChar, boltRangeFromChar);
					b = math.random(-boltRangeFromChar, boltRangeFromChar);
					targetPos = position (victim.pos.x + a, victim.pos.y + b , victim.pos.z);
					
					if noRoof(targetPos) then
						-- lightning gfx and sound
						world:gfx( 2, targetPos );
						world:makeSound( 4, targetPos );
		
						-- is a char on the field?
						if world:isCharacterOnField(targetPos) then
							targetChar = world:getCharacterOnField(targetPos);
		   				  	currentHP = targetChar:increaseAttrib("hitpoints",0);
		   				  	-- victim:inform("damage: " ..damage);
		   				  	-- a limiter so a char won't get killed by a lightning
		   				  	if (damage >= currentHP) then
		   				  		damage = currentHP - 1;
		   				  	end

							-- reduce target's HP
		   				  	targetChar:increaseAttrib("hitpoints",-(damage));
							base.common.InformNLS( targetChar,
			    	        			"Der Blitz schlägt vom Himmel herunter direkt in deinen Kopf und ein ungeheurer Schmerz erfüllt deinen Körper.",
										"The lightningbolt crashes down right onto your head and an immense pain fills your body.");
		   				  	
		   				  	-- counter abuse if a char doesn't get damaged enough to earn a bonus
		   				  	if (damage >= 3000) then
								if ( math.random(randomSeed) <= (chanceForAirElement + (math.floor((damage/1500))))) then -- chance to create pure air element
								       	world:createItemFromId(2551,1,targetPos,true,333,0);
								        base.common.InformNLS(targetChar,
											        "Der Blitz reagierte mit der ihn umgebenden Luft und erzeugte ein Element der reinen Luft.",
											        "The lightning bolt reacted with the surrounding air and created a pure air element.");
								elseif ( math.random(randomSeed) <= (chanceForWaterElement + (math.floor((damage/1000))))) then -- chance to create pure water element
							        	world:createItemFromId(2554,1,targetPos,true,333,0);
								        base.common.InformNLS(targetChar,
											        "Der Blitz reagierte mit dem fallenden Regen und erzeugte ein Element des reinen Wassers.",
											        "The lightning bolt reacted with the falling rain and created a pure water element.");
								end
							end
						-- there is an item on the field if it is a tree... it would burn down and small chance to create pure fire element
		        		elseif world:isItemOnField(targetPos) then
		        			targetItem = world:getItemOnField(targetPos);
		       				-- check whether it's full grown trees from the ID
		       				if ((math.random(randomSeed) <= chanceToBurnTree )and (targetItem.id == 11 or targetItem.id == 14 or targetItem.id == 203 or targetItem.id == 299 or targetItem.id == 300 or targetItem.id == 308 or targetItem.id == 586 or targetItem.id == 1804 or targetItem.id == 1807 or targetItem.id == 1808 or targetItem.id == 1809 or targetItem.id == 1817)) then
		       					-- creating flame
								world:erase(targetItem,1); -- erase the tree
		       					world:createItemFromId( 314, 5, targetPos, true, 333, 0 ); -- create ash from the tree
		       					world:createItemFromId( 359, 1, targetPos, true, 333, 0 ); -- create flame that's burning down the tree
								world:makeSound( 7, targetPos );
								base.common.InformNLS(victim,
								    	    "Der Blitz spaltete und brannte den Baum nieder und hinterlässt eine Flamme und Asche.",
								   	    	"The lightning bolt split and burnt down the tree and leaves flame and ashes.");
								
								if ( math.random(randomSeed) <= chanceForFireElement )then -- chance to create pure fire element
							        world:createItemFromId(2553,1,targetPos,true,333,0);
									base.common.InformNLS(victim,
									    	    "Der Blitz erzeugte ein Element des reinen Feuers, als er den Baum niederbrannte.",
									   	    	"The lightning bolt created a pure fire element when it burn down the tree.");
								end
							-- there is an item on the field but it's not a tree so it's not burnt down
							else
								base.common.InformNLS(victim,
								    	    "Der Blitz schlägt in deiner Nähe ein.",
								   	    	"The lightning bolt strikes down nearby.");
							end
							
						-- nothing on the field
						else
							floor=world:getField(targetPos);
							tileID=floor:tile();

							-- 6 = water tile
							if ( tileID == 6) then
								fishChance = math.random(randomSeed);
								if (fishChance < 10 ) then
									world:createItemFromId(73,math.random(5),targetPos,true,333,0); -- trout
									base.common.InformNLS(victim,
								    		    "Der Blitz schlägt in das Wasser ein und tötet einige Fische.",
								   	 		   	"The lightning bolt hit the water and shocked the fish to death.");
								elseif (fishChance > 90 ) then
									world:createItemFromId(355,math.random(5),targetPos,true,333,0); -- salmon
									base.common.InformNLS(victim,
												"Der Blitz schlägt in das Wasser ein und tötet einige Fische.",
								   	    		"The lightning bolt hit the water and shocked the fish to death.");
								else
									base.common.InformNLS(victim,
								    		    "Der Blitz schlägt in deiner Nähe ein.",
								   	    		"The lightning bolt strikes down nearby.");
								end
							elseif (math.random(randomSeed) <= chanceForEarthElement ) then -- chance to create pure earth element
						        world:createItemFromId(2552,1,targetPos,true,333,0);
								base.common.InformNLS(victim,
								    	    "Der Blitz berührte kaum den Boden und erzeugte ein Element der reinen Erde.",
								   	    	"The lightning bolt barely touch the soil and created the pure earth element.");
							-- lightning strikes down without creating any pure element
							else
								base.common.InformNLS(victim,
								    	    "Der Blitz schlägt in deiner Nähe ein.",
								   	    	"The lightning bolt strikes down nearby.");
		
							end
						end
					end
				end
			end
	    end -- end of for loop thru all the online players
	end -- thunder <= 0 means no thunder
end -- end of function



function noRoof(targetPos)
	if targetPos.z < 0 then
		return false -- in a dungeon
	else
		-- not in dungeon
		potentialRoofPos=position(targetPos.x, targetPos.y, targetPos.z+1);
		potRoof=world:getField(potentialRoofPos);
		if potRoof~=nil then  
			tileID = potRoof:tile();
			if tileID == 0 then
				return true; -- fake roof
			else
				return false; -- under a roof
			end
		else
			return true; -- no roof
		end
	end
end
