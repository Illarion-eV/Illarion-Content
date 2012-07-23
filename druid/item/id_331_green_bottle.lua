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
    
	if not SourceItem:getData("stockData") ~= "" then -- no stock, something else
	    return
	end	
	
	if base.common.GetFrontItemID(User) == 1008 then -- infront of a cauldron?
	    cauldron = base.common.GetFrontItemID(User)
		
		if ( ltstate == Action.abort ) then
	        User:talkLanguage(Character.say, Player.german, "abbruch arbeit");
		   -- base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.", Player.lowPriority)
	       return
		end
		
		-- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  User:talkLanguage(Character.say, Player.german, "nur alchemisten");
          --[[base.common.InformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here.",
				Player.lowPriority
							)]]
		  return;
	    end
		
		if ( ltstate == Action.none ) then
            if (cauldron:getData("essenceBrew") =="true") then
		        actionDuration = 40 -- when we combine a stock and an essence brew, it takes longer
            else
                actionDuration = 20
            end				
			User:startAction( actionDuration, 21, 5, 10, 45)
			return
		end	  

		-- water, stock or potion is in the cauldron; leads to a failure
		if cauldron:getData("cauldronFilledWith") == "water" then
			User:talkLanguage(Character.say, Player.german, "stock -> water, fail")
			 -- define effect
		elseif cauldron:getData("stockData") ~= "" then
			User:talkLanguage(Character.say, Player.german, "stock -> stock, fail")
			-- define effect
		elseif cauldron:getData("potionEffectId") ~= "" then
			User:talkLanguage(Character.say, Player.german, "stock -> potion, fail")
			-- define effect
		
		elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
			druid.base.alchemy.CombineStockEssence( User, SourceItem, cauldron, Counter, Param, ltstate )
		
		else -- nothing in the cauldron, we just fill in the stock
            cauldron:setData("stockData",SourceItem:getData("stockData"))
		end
		
		world:changeItem(cauldron)
		SourceItem.id = 164
		SourceItem.quality = 333
	    if math.random(1,20) == 1 then
		    User:eraseItem(SourceItem,1) -- bottle breaks
		    User:talkLanguage(Character.say, Player.german, "flasche kaputt");
		   -- base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.", Player.lowPriority)
        else	
		    world:changeItem(SourceItem)
        end
	
	else -- no cauldron, drink 
	    if User.attackmode then
		   base.common.InformNLS(User, "Du kannst nichts trinken, während Du kämpfst.", "You cannot drink while fighting.", Player.lowPriority)
		else
		    User:talkLanguage(Character.say, Player.german, "#me trinkt eine grüne Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a green liquid.");
			base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", "You don't have the feeling that something happens.", Player.mediumPriority)
			SourceItem.id = 164
		    SourceItem.quality = 333
	        if math.random(1,20) == 1 then
		       User:eraseItem(SourceItem,1) -- bottle breaks
		       base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.", Player.lowPriority)
            else	
		        world:changeItem(SourceItem)
            end
	        User.movepoints - 20
		end
	end

function LookAtItem(User,Item)
         world:itemInform( User, Item, base.common.GetNLS( User,
        "Du siehst ein Flaschenetikett mit der Aufschrift: \"Kräutersud\"",
        "You look at a sticker telling: \"Herbage Broth\"" ) );
  end   