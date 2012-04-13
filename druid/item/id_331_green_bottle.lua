-- Testskript 1 für Weiterentwicklung Druidenmagie
-- 2007 by Falk
-- 2009 by Nitram
-- 2011 by Merung
-- Trinken aus grüner Flasche (331)
-- ------------------------------------------------

-- include base.common for additional functions
require("base.common")
require("base.character")

module("druid.item.id_331_green_bottle", package.seeall, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_331_green_bottle' WHERE com_itemid = 331;


function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    
	if base.common.GetFrontItemID(User) == 1008 then -- infront of a cauldron?
	   if ( ltstate == Action.abort ) then
                base.common.TempInformNLS( User,
                "Du brichst Deine Arbeit ab.",
                "You abort your work."
                       );
		        return;
        end
			
		if (ltstate == Action.none) then
		   User:startAction(20,21,5,0,0);
		   return
		end
		  
	   local TargetItem = base.common.GetFrontItem( User );
	   -- the cauldron is filled with something we cannot add a stock to
	   if (TargetItem:getData("stockData") ~= "") or (TargetItem:getData("cauldronFilledWith") == "water") or (TargetItem:getData("potionEffectId") ~= "") then 
	      base.common.TempInformNLS( User,
					"In dem Kessel befindet sich bereits etwas. Du kannst nichts mehr hinzutun.",
					"There is already something in the cauldron. You cannot add something else to it."
						   );
	       return;
      
	    elseif (TargetItem:getData("cauldronFilledWith") == "essenceBrew") then -- essence brew; we call our function to combine stock and essence brew  
	        -- functionBlub
	  
	  elseif (TargetItem:getData("stockData") == "") then -- empty; we fill in!
		  
		  TargetItem:setData("stockData",SourceItem:getData("stockData"))
		  world:changeItem(TargetItem)
		  world:erase(SourceItem,1);
		  world:makeSound(10,TargetItem.pos);
	      User:createItem(164, 1, 333, 0);
	   end  
   
   else -- not infront of a cauldron; drink!
       base.common.TempInformNLS( User,
                "Du leerst die Flasche.",
                "You empty the bottle."
                       );

	   world:makeSound(12,User.pos);
	   world:gfx(1,User.pos);
       world:erase(SourceItem,1);
	   if(math.random(20) == 1) then
           base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            User:createItem(164, 1, 333, 0);
        end
	    base.character.ChangeFightingpoints(User, -20);
	end
end

function LookAtItem(User,Item)
         world:itemInform( User, Item, base.common.GetNLS( User,
        "Du siehst ein Flaschenetikett mit der Aufschrift: \"Kräutersud\"",
        "You look at a sticker telling: \"Herbage Broth\"" ) );
  end   