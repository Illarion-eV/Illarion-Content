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
			itemNumberPay = base.common.Limit(workLoad-Item.number,0,nil) -- we do only count the items a char has to deliver
			local payToFaction = itemNumberPay*theItemStats.Worth--*FACTOR ; replace FACTOR with a value, determing what perecentage of the item worth is payed to the faction
			local foundTreasure, oldTreasure = ScriptVars:find(townTreasure)
			if not foundTreasure then -- security check
				oldTreasure = 0
			else
				oldTreasure = tonumber(oldTreasure)
			end	
			User:inform("old treasure: "..oldTreasure)
			ScriptVars:set(townTreasure, tostring(oldTreasure+payToFaction)) -- add acquired coins to the treasure	
			ScriptVars:save()
			local foundTreasure, newTreasure = ScriptVars:find(townTreasure)
			User:inform("new treasure: "..newTreasure)
			
			-- reduce work load of char
			local workLoad = User:getQuestProgress(25)
			if (workLoad - Item.number) <= 0 then
				if workLoad > 0 then -- the char was actually still forced to work, inform him that he's free
				    local myNpc = world:getNPCSInRangeOf(position(-495,-484,-40),10)
			        for i=1,#myNpc do
				        if myNpc[i].name == "Percy Dryless" then -- check if it is the camp leader  
							myNpc[i]:talkLanguage(Character.say,Player.german,"So, du Wicht, du hast deine Strafe abgearbeitet. Hau ab!")
							myNpc[i]:talkLanguage(Character.say,Player.english,"Now, you runt, you're done with your punishment. Get lost!")
							break
					    end
					end	
				    base.common.InformNLS(User,"Freiheit!","Freedom!")
				else
				    base.common.InformNLS(User,"Du bemerkt, wie der Aufseher kopfschüttelnd zu dir blickt. Deine Strafe ist doch schon längst abgearbeitet.","You notice that the guard looks at you, shaking his head. You are already done!")
				end	
				User:setQuestProgress(25,0)
				User:setQuestProgress(26,0)
			else
				User:setQuestProgress(25,workLoad-Item.number)
			    base.common.InformNLS(User,"Du bemerkt, wie der Aufseher sich kurz etwas notiert. Scheinbar noch nicht deine letzte Ladung.","You notice that the guard seems to take a short note. Obviously, not your last charge.")
			end
		end
		world:gfx(46,Item.pos)
		world:erase(Item,Item.number)
	end	
end

function MoveToField(User)
    
	-- check for spam and put a new spam marker in case it is no spam
	local noSpam = false
	local foundEffect, myEffect = User.effects:find(55)
	if foundEffect then
		local findCounter,spamProtection_1 = Effect:findValue("spamProtection_1")
		if findCounter then
			if spamProtection_1 < 1 then
				noSpam = true
				myEffect:addValue("spamProtection_2",4)
			end
		else
			noSpam = true
			myEffect:addValue("spamProtection_2",4)
		end
	else 
		noSpam = true
		local myEffect=LongTimeEffect(55,5)
		myEffect:addValue("spamProtection_3",4)
		User.effects:addEffect( myEffect )
	end
	
	if noSpam == true then
	    base.common.InformNLS(User,"Ein seltsames Kribbeln erfüllt dich. Auf dieser Plattform müssen die Rohstoffe scheinbar abgelegt werden."
		                          ,"You feel a strange prickling. This platform is the place where you have to bring the resources to.")
    end
end