-- Druidsystem: potion

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_166_pink_bottle", package.seeall)

-- UPDATE common SET com_script='druid.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000         ,50000      ,10000          ,7000  ,7000    ,10000        ,50000        ,7000}
attribList ={"hitpointsOT","foodlevel","poisonvalueOT","mana","manaOT","poisonvalue","foodlevelOT","hitpoints"};




function DrinkPotion(User,SourceItem)
     
	if User.effects:find(166) then
	   User:inform("lte noch aktiv");   
	   return;
	end	
	
	
	local potionData = tonumber(SourceItem:getData("potionData"));
	local dataZList = druid.base.alchemy.SplitBottleData(User,potionData);
	druid.base.alchemy.generateTasteMessage(User,dataZList);

	
	
		for i=1,8 do
			--Trankwirkung
			local Val = (dataZList[i]-5) * (topBorder[i]/5) * base.common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );
			User:inform(""..Val)
			if ( attribList[i] == "hitpointsOT" ) then
			    hitpointsOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "poisonvalueOT" ) then
			       poisonvalueOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "manaOT" ) then
			       manaOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "foodlevelOT" ) then     			
			       foodlevelOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "poisonvalue" ) then
				Val = base.common.Limit( (User:getPoisonValue() + Val) , 0, 10000 ); 
				User:setPoisonValue( Val );
			else
			    User:increaseAttrib(attribList[i],Val);
	            User:inform("tata!")
			end
	      end  
	 	
          
		User.movepoints=User.movepoints-20;
	    world:makeSound(12,User.pos);
	
	    find, myEffect = User.effects:find(166)

        if not find then
	       myEffect=LongTimeEffect(166,1); 
	       User.effects:addEffect(myEffect); -- create the effect
	   
	     find, myEffect = User.effects:find(166)
		 if not find then  -- security check 
	         User:inform("An error occured, inform a developer.");
	         return;
	       end  
	   end
        -- now we add the values
	   myEffect:addValue("hitpointsIncrease",hitpointsOT)
       myEffect:addValue("manaIncrease",manaOT)
	   myEffect:addValue("foodlevelIncrease",foodlevelOT)
	   myEffect:addValue("poisonvalueIncrease",poisonvalueOT)
	   myEffect:addValue("counterPink",10)	   
	   myEffect:addValue("cooldownPink",20)
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
	      if SourceItem.id == 165 then
		     potionKind = 1;
		  elseif SourceItem.id == 59 then
             potionKind = 2;
          elseif SourceItem.id == 327 then
             potionKind = 3;		  
		  elseif SourceItem.id == 329 then
             potionKind = 4;		  
		  elseif SourceItem.id == 166 then
             potionKind = 5;		  
		  elseif SourceItem.id == 328 then
             potionKind = 6; 		  
		  elseif SourceItem.id == 330 then
             potionKind = 7;		  
		  end			 
		  
		  cauldron:setData("potionType", ""..potionKind);
		  cauldron:setData("cauldronData",""..SourceItem:getData("potionData"))
	      cauldron.quality = SourceItem.quality
		  world:changeItem(cauldron)
		  User:talkLanguage(Character.say, Player.german, "#me kippt einen Trank in den Kessel.");
          User:talkLanguage(Character.say, Player.english, "#me pours a potion into the cauldron.");
		  world:makeSound(10,User.pos);
		  world:erase(SourceItem,1);
		  User:createItem(164, 1, 333, 0);
	      User.movepoints=User.movepoints-20;
		  return;
	   end  
	end
	
	if (ltstate == Action.abort) then
       User:talkLanguage(User.say, Player.german, "#me verschüttet den Trank.");
        User:talkLanguage(User.say, Player.english, "#me spills the potion.");
        world:erase(SourceItem,1);
        -- Chance for a new bottle 19/20
        if(math.random(20) == 1) then
           base.common.TempInformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            User:createItem(164, 1, 333, 0);
        end
        return;
    end

    if User.attackmode then
        base.common.TempInformNLS(User,
			"Du kannst den Trank nicht benutzen während du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	
	
    if (ltstate == Action.none) then
		
			User:startAction(20,0,0,12,25);
			--User:talkLanguage(User.say, Player.german, "#me beginnt einen Trank zu trinken.");
			--User:talkLanguage(User.say, Player.english, "#me starts to drink a potion.");
			DrinkPotion(User, SourceItem);
	end
	
	world:erase(SourceItem,1);

    if( math.random( 20 ) <= 1 ) then
        base.common.TempInformNLS( User, "Die Flasche zerbricht.", "The bottle breaks.");
    else
        User:createItem( 164, 1, 333,0);
    end
end

function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"");
    else
        world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"");
        
    end
end