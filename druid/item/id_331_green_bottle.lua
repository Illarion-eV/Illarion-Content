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
	   local cauldron = base.common.GetFrontItem( User );
	   User:inform("data im kessel "..cauldron:getData("cauldronData"))
	   if (cauldron:getData("cauldronData") ~= "") then 
	      base.common.TempInformNLS( User,
					"In dem Kessel befindet sich bereits etwas. Du kannst nichts mehr hinzutun.",
					"There is already something in the cauldron. You cannot add something else to it."
						   );
	       return;
      
	  elseif (cauldron:getData("cauldronData") == "") then -- nothing in the cauldron, so the stock is being filled in
		  
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
		  
		  cauldron:setData("cauldronData",""..SourceItem:getData("stockData"))
		  cauldron.quality = SourceItem.quality
		  world:changeItem(cauldron)
		  User:talkLanguage(Character.say, Player.german, "#me kippt einen Sud in den Kessel.");
		  User:talkLanguage(Character.say, Player.english, "#me pours a stock into the cauldron.");
		  world:makeSound(10,User.pos);
		  world:erase(SourceItem,1);
		  User:createItem(164, 1, 333, 0);
		  return;
	   end  
   
   else
       User:talkLanguage(Character.say, Player.german, "#me trinkt den grünen dickflüssigen Sud.");
       User:talkLanguage(Character.say, Player.english, "#me drinks the green viscous broth.");

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