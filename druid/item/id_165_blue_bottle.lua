--I_165_blaue_flasche
--Druidensystem in Arbeit / Pasten für Items
--Falk
--HINWEIS: In dieser Ausbaustufe(12/2007) kann nur die Haltbarkeit verbessert werden, nicht die Qualität

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_165_blue_bottle", package.seeall, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_165_blue_bottle' WHERE com_itemid = 165;

function initLists()
  ListeObjMetall 		= {1,4,6,7,9,16,18,19,20,23,24,25,27,47,74,77,78,88,94,95,96,101,184,185,186,187,188,189,190,126,202,204,205,207,226,230,231,271,311,324,325,326,383,916,1858,2111,2112,2116,2117,2140,2172,2284,2286,2287,2290,2291,2302,2357,2359,2360,2363,2364,2365,2367,2369,2388,2389,2390,2393,2395,2399,2400,2403,2407,2441,2444,2629,2635,2642,2645,2658,2660,2675,2701,2711,2723,2725,2731,2738,2740,2746,2715,2752,2757,2763,2775,2778}
	ListeObjNahrung		= {554,555,556,557,559,2276,2278,2456,2459,2922,2923,2940,3051}
	ListeObjLeder  		= {4,17,18,19,20,48,53,95,96,97,101,186,293,325,326,362,363,364,365,366,367,369,916,2111,2112,2116,2117,2172,2284,2286,2287,2290,2291,2302,2357,2359,2360,2363,2364,2365,2367,2369,2388,2389,2390,2393,2395,2399,2400,2403,2407,2441,2445,2448}  
	ListeObjEdelstein = {57,68,76,225,277,278,279,280,281,282,336,2284,2357,2367,2400,2731}   
	ListeObjEdelMet		= {68,95,190,224,225,235,277,278,279,280,281,282,336,383,916,1001,1840,2031,2284,2286,2287,2290,2359,2360,2363,2365,2367,2369,2390,2400,2407,2550,2647,2660,2731}
	ListeObjHolz   		= {1,9,17,23,24,25,27,39,40,51,57,64,70,72,74,76,77,78,88,90,118,121,126,188,189,190,204,205,207,208,209,226,230,231,237,258,271,277,293,312,332,335,383,734,2185,2193,2194,2445,2448,2525,2527,2528,2530,2541,2544,2548,2549,2561,2566,2567,2570,2572,2573,2584,2585,2629,2635,2636,2642,2645,2646,2658,2660,2675,2685,2701,2708,2711,2714,2715,2718,2719,2723,2725,2731,2740,2746,2752,2705,2744,2757,2763,2775,2778,2781,2935,2952}
	ListeObjStoff  		= {34,55,180,181,182,183,193,194,195,196,356,357,358,368,370,385,547,548,558,2295,2377,2378,2380,2384,2416,2418,2419,2420,2421,}  
--Fï¿½r Horn, Fell, Seil, Knochen
	ListeObjHorn 			= {7,16,39,366,367,2113,2114}
end


function DoDruidism(Character,SourceItem,TargetItem)
	if firsttime == nil then
		initLists()
		firsttime = 1
	end    
	local workdata = SourceItem.data
	local dataZList = druid.base.alchemy.SplitBottleData(Character,workdata)

--   Dura-Wert ermitteln
     local qual = math.floor(TargetItem.quality/100)
     local dura = TargetItem.quality - qual*100
     
	 local foundItem = false;
	 
--   Effekte für Metall:
     for zaehler = 1,table.getn(ListeObjMetall) do
         if ListeObjMetall[zaehler]==TargetItem.id then
            wert = dataZList[1] -5  
            dura = dura + (wert*25*((Character:getSkill("smithing")+math.floor(SourceItem.quality/10))/100)) 
			foundItem = true;
         end    
     end
--   Effekte für Nahrung:
     for zaehler = 1,table.getn(ListeObjNahrung) do
         if ListeObjNahrung[zaehler]==TargetItem.id then    
            wert = dataZList[2] -5
            dura = dura + (wert*25*((Character:getSkill("cooking")+math.floor(SourceItem.quality/10))/100))                
			foundItem = true;
         end    
     end     
--   Effekte für Leder:
     for zaehler = 1,table.getn(ListeObjLeder) do
         if ListeObjLeder[zaehler]==TargetItem.id then       
            wert = dataZList[3] -5   
            dura = dura + (wert*25*((Character:getSkill("tailoring")+math.floor(SourceItem.quality/10))/100))        
			foundItem = true;
         end    
     end
--   Effekte für Edelsteine:
     for zaehler = 1,table.getn(ListeObjEdelstein) do
         if ListeObjEdelstein[zaehler]==TargetItem.id then         
            wert = dataZList[4] -5
		    dura = dura + (wert*25*((Character:getSkill("goldsmithing")+math.floor(SourceItem.quality/10))/100))     
			foundItem = true;
         end    
     end 
--   Effekte für Edelmetalle:
     for zaehler = 1,table.getn(ListeObjEdelMet) do
         if ListeObjEdelMet[zaehler]==TargetItem.id then         
            wert = dataZList[5] -5  
		    dura = dura + (wert*25*((Character:getSkill("smithing")+math.floor(SourceItem.quality/10))/100))  
			foundItem = true;
         end    
     end              
--   Effekte für Holz:
     for zaehler = 1,table.getn(ListeObjHolz) do
         if ListeObjHolz[zaehler]==TargetItem.id then
            wert = dataZList[6] -5
		    dura = dura + (wert*25*((Character:getSkill("carpentry")+math.floor(SourceItem.quality/10))/100))    
			foundItem = true;
         end    
     end
--   Effekte für Stoff:
     for zaehler = 1,table.getn(ListeObjStoff) do
         if ListeObjStoff[zaehler]==TargetItem.id then          
            wert = dataZList[7] -5 
		    dura = dura + (wert*25*((Character:getSkill("tailoring")+math.floor(SourceItem.quality/10))/100))     
			foundItem = true;
         end    
     end
--     
--   Effekte für Sonstige:
     for zaehler = 1,table.getn(ListeObjHorn) do
         if ListeObjHorn[zaehler]==TargetItem.id then
            wert = dataZList[8] -5
		    dura = dura + (wert*25*((Character:getSkill("tailoring")+math.floor(SourceItem.quality/10))/100))       
			foundItem = true;
         end    
     end 
	
	if not foundItem then
		base.common.InformNLS(Character,
			"Die Paste lässt sich nicht auf diesen Gegenstand anwenden.",
			"The paste has no use for this item.");
		return false;
	end

	if dura > 99 then 
		dura = 99 
	elseif dura < 0 then
		dura = 0
	end

	TargetItem.quality = qual*100 + dura;
	world:changeItem(TargetItem);
	return true;
end  -- function DoDruidism
--  
function UseItem(Character,SourceItem,TargetItem,Counter,Param)
	if SourceItem.data ~= 0 then
		-- NEUE FASSUNG MIT DRUIDENSYSTEM
		if Character.attackmode then
			base.common.InformNLS(Character,
				"Du kannst die Paste nicht benutzen während du kämpfst.",
				"You can't use the paste something while fighting.");
		else
			-- Hier verweisen wir auf die Wirkung
			local TargetItem = base.common.GetTargetItem(User, SourceItem);
			if not TargetItem then
				TargetItem = base.common.GetFrontItem(User);
				if not TargetItem or not base.common.IsItemInHands(SourceItem) then
					base.common.InformNLS( Character,
						"Du musst die Paste in der Hand halten und einen anderen Gegenstand in die andere Hand oder vor dich legen.",
						"You have to take the paste in your hand and put another item in the other hand or infront of you.");
					return;
				end
			end
			-- got the paste in hands and some TargetItem
			if not DoDruidism(Character,SourceItem,TargetItem) then
				return;
			end

			world:erase(SourceItem,1);
			world:makeSound(10,TargetItem.pos);
			world:gfx(1,TargetItem.id_pos)
			world:makeSound(13,Targetitem.pos);    
			if( math.random( 20 ) <= 1 ) then
				base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
			else
				Character:createItem( 164, 1, 333,0);
			end

			Character.movepoints=Character.movepoints-50;
		end
	end  
end

function LookAtItem(Character,Item)
  
  if (Character:getPlayerLanguage()==0) then
	world:itemInform(Character,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Wunderpaste\"")
  else
	world:itemInform(Character,Item,"You look at a sticker telling: \"Marvel Paste\"")      
  end
  
end
