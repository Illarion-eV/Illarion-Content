--ds_059_rote_flasche
--Druidensystem in Arbeit
--Falk
--Delay added by Blay09
--rework by Merung

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_59_red_bottle",package.seeall); --, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_59_red_bottle' WHERE com_itemid = 59;

taste = {};
attribList ={"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
taste[0]   ={"fruchtig","herb"     ,"bitter"    ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"   ,"süß"};
taste[1]   ={"fruity"  ,"tartly"   ,"bitter"    ,"putrefactive","acidly"      ,"salt"   ,"hot"      ,"sweet"};

function DrinkPotion(User,SourceItem)

	local potionData = tonumber(SourceItem:getData("potionData"));
	local dataZList = druid.base.alchemy.SplitBottleData(User,potionData);

   druid.base.alchemy.generateTasteMessage(User,dataZList);

    -- Hier kommt die Sache mit dem Langzeiteffekt:
    foundEffect, myEffect = User.effects:find(59);
    if not foundEffect then
        myEffect=LongTimeEffect(59,10);
    else
	    return
	end
    User:inform("inform 1: "..User:increaseAttrib("strength",0))
    for i=1,8 do
        --den bisherigen Attributswert laden
        attribValue = User:increaseAttrib(attribList[i],0);

        bottomBorder = 1
		
		if (attribValue + dataZList[i] - 5) < bottomBorder then
            dataZList[i] = (bottomBorder - attribValue) + 5;
        end

        if dataZList[i] ~= 5 then
            User:increaseAttrib(attribList[i],dataZList[i]-5);
            myEffect:addValue(""..attribList[i],dataZList[i]);
        end
        
	end
    User:inform("inform 2: "..User:increaseAttrib("strength",0))
	duration = 5 -- to be replaced with a formula with the potion's quality being the changeabale varibale
	myEffect:addValue("counterRed",duration);
    myEffect:addValue("cooldownRed",5);
	
	if not foundEffect then
       User.effects:addEffect( myEffect );
    end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param, ltstate)

	if base.common.GetFrontItemID(User) == 1008 then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	
	   if (cauldron:getData("cauldronData") ~= "") then 
	      base.common.InformNLS( User,
					"In dem Kessel befindet sich bereits etwas. Du kannst nichts mehr hinzutun.",
					"There is already something in the cauldron. You cannot add something else to it."
						   );
	       return;
      
	  elseif (cauldron:getData("cauldronData") == "") then -- nothing in the cauldron, so the stock is being filled in
	      
		  if ( ltstate == Action.abort ) then
                base.common.InformNLS( User,
                "Du brichst Deine Arbeit ab.",
                "You abort your work."
                       );
		        return;
            end
			
			if (ltstate == Action.none) then
			   User:startAction(20,21,5,0,0);
			   return
			end
		  
		  local ID_potion = SourceItem.id			 
		  cauldron:setData("potionID", ""..ID_potion);
		  cauldron:setData("cauldronData",""..SourceItem:getData("potionData"))
	      cauldron.quality = SourceItem.quality
		  world:changeItem(cauldron)
		  User:talkLanguage(Character.say, Player.german, "#me kippt einen Trank in den Kessel.");
          User:talkLanguage(Character.say, Player.english, "#me pours a potion into the cauldron.");
		  world:makeSound(10,User.pos);
		  world:erase(SourceItem,1);
		  User:createItem(164, 1, 333, 0);
	      return;
	   end  
	end
	
	-- not infront of a cauldron: let's drink the potion!
	if User.attackmode then
        base.common.InformNLS(User,
			"Du kannst den Trank nicht benutzen, während Du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	if User.effects:find(59) then
	   base.common.InformNLS( User,
                "Der Trank hätte jetzt keine Wirkung.",
                "The potion wouldn't have any effect now."
                       );  
	   return;
	end	
	
	base.character.ChangeFightingpoints(User, -20);
	world:makeSound(12,User.pos);
	world:erase(SourceItem,1);
	   if(math.random(20) == 1) then
           base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            User:createItem(164, 1, 333, 0);
        end
	DrinkPotion(User, SourceItem);
end

function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"")
    else
        world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"")
    end
end
