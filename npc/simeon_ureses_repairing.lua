--Repair NPC Simeon Ureses

--First, add these require lines, the modules are needed.
require("base.common")
require("npc.base.autonpcfunctions")

--Then, replace the receiveText function with this one. You are done!

function receiveText(thisNPC, texttype, message, speaker) 

--ADDITTION BY ESTRALIS
    message=string.lower(message); --lower case MESSAGE -> message
	
    if base.common.BasicNPCChecks(speaker,2,thisNPC) and (string.find(message,"price") or string.find(message,"cost") or string.find(message,"preis") or string.find(message,"koste") or string.find(message,"repair") or string.find(message,"fix") or string.find(message,"reparier") or string.find(message,"instand")) then --initiate repairing with triggers

		--Full repair is the same as buying half a new one. Just worth it with special (e.g. gemmed) items. Price may change if the players overdo it.
		--Round prices to prevent prices like "1273 cp" and to prevent exact durability determination via repairing.

		if string.find(message,"price") or string.find(message,"cost") or string.find(message,"repair") or string.find(message,"fix") then --english triggers
            language = 1; --english
		else
		    language = 2; --german
		end
 
		theItem=base.common.GetFrontItem(thisNPC); --What item shall be repaired?
		
		if theItem then
            theItemStats=world:getItemStats(theItem); --reading its stats
		end
		
		if not theItem then --nothing there!
			message1={"Please put the item I shall repair on the table.","Packt den Gegenstand, den ich instandsetzen soll, einfach auf den Tisch."}; --No item found
		    thisNPC:talk(Character.say, message1[language]); --Message 1
		end
		
		if theItem then
			durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
		    toRepair=99-durability; --the amount of durability points that has to repaired
		    price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10; --Price rounded up in 10 cp steps
		
            if theItem.id == 0 or theItem.id == 320 or theItem.id == nil then --there is nothing on the table!
		
	            message1={"Please put the item I shall repair on the table.","Packt den Gegenstand, den ich instandsetzen soll, einfach auf den Tisch."}; --No item found
		        thisNPC:talk(Character.say, message1[language]); --Message 1
			
		    elseif theItemStats.Worth == 0 or theItemStats.isStackable or durability==99 then --Cannot repair perfect, priceless or stackable items
		
	            message2={"I cannot repair this, sorry.","Entschuldigt, aber das kann ich nicht reparieren."}; --Priceless, perfect or stackable item
		        thisNPC:talk(Character.say, message2[language]); --Message 2
			
		    else -- I can repair it!
	
	            if string.find(message,"price") or string.find(message,"cost") or  string.find(message,"preis") or string.find(message,"koste") then --player just wants to know the price
			    
				    message3={"For repairing this item, I demand "..price.." copper coins.","Die Reparatur dieses Gegenstandes würde "..price.." Kupferstücke kosten."}; --Saying the price
		            thisNPC:talk(Character.say, message3[language]); --Message 3
				
                elseif string.find(message,"repair") or string.find(message,"fix") or string.find(message,"reparier") or string.find(message,"instand") then --player wants to repair the item
			
			        if not npc.base.autonpcfunctions.CheckMoney(speaker,price) then --player is broke
				
			            message4={"You don't have enough money I suppose. I demand "..price.." copper coins for repairing this item.","Ihr habt anscheinend nicht genug Geld. Die Reparatur würde "..price.." Kupferstücke kosten."}; --Player is broke
		                thisNPC:talk(Character.say, message4 [language]); --Message 4
					
			        else --he has the money
				
			            message5={"#me repairs the item at a cost of "..price.." copper coins.","#me setzt den Gegenstand für "..price.." Kupferstücke in Stand."};	--...
                        thisNPC:talk(Character.say, message5 [language]); --Message 5
                        npc.base.autonpcfunctions.PayTheNPC(speaker,price); --pay!
                        theItem.quality=theItem.quality+toRepair; --repair!
                        world:changeItem(theItem);
					
				    end --broke/wealthy	
			    end --price/repair
		    end --there is an item
        end --item exists
	else
        mainNPC:receiveText(speaker, message); 
	end
--ADDITION END
end;