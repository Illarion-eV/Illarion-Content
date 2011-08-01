-- Druidsystem: poison

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_166_pink_bottle", package.seeall)

-- UPDATE common SET com_script='druid.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000         ,50000      ,10000          ,7000  ,7000    ,10000        ,50000        ,7000}
attribList ={"hitpointsOT","foodlevel","poisonvalueOT","mana","manaOT","poisonvalue","foodlevelOT","hitpoints"};




function DrinkPotion(User,SourceItem)
     
		
	local dataZList = druid.base.alchemy.SplitBottleData(User,SourceItem.data);
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
	   myEffect:addValue("counter",5)	   
	
   end

function UseItem(User,SourceItem,TargetItem,Counter,Param, ltstate)

	if (ltstate == Action.abort) then
       User:talkLanguage(Character.say, Player.german, "#me verschüttet den Trank.");
        User:talkLanguage(Character.say, Player.english, "#me spills the potion.");
        world:erase(SourceItem,1);
        -- Chance for a new bottle 19/20
        if(math.random(20) == 1) then
           base.common.TempInformNLS(Character, "Die Flasche zerbricht.", "The bottle breaks.");
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
			User:talkLanguage(User.say, Player.german, "#me beginnt einen Trank zu trinken.");
			User:talkLanguage(User.say, Player.english, "#me starts to drink a potion.");
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