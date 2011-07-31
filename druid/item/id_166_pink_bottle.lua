-- Druidsystem: poison

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_166_pink_bottle", package.seeall)

-- UPDATE common SET com_script='druid.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000      ,100          ,50000      ,100   ,10000        ,9000      ,800             ,7000}
attribList ={"hitpoints","body_height","foodlevel","luck","poisonvalue","attitude","mental capacity","mana"};




function DrinkPotion(User,SourceItem)
     
		
	local dataZList = druid.base.alchemy.SplitBottleData(User,SourceItem.data);
	druid.base.alchemy.generateTasteMessage(User,dataZList);

	if (druid.base.alchemy.checkPotionSpam(User)) then
		base.common.TempInformNLS(User,
			"Dein exzessives Trinken von Tränken hat wohl dazu geführt, dass sie vorrübergehend ihre Wirkung nicht mehr entfalten.",
			"Due to excessive drinking of potions they seem to have temporarily no effect on you.");
	else
		for i=1,8 do
			--Trankwirkung
			local Val = (dataZList[i]-5) * (topBorder[i]/5) * base.common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );
			--Character:inform(""..Val)
			if ( attribList[i] == "hitpointsOT" ) then
			    hitpointsOT = (Val * 1.25) / 5;
			elseif attribList[i] == "poisonvalueOT" ) then
			       poisonvalueOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "manaOT" ) then
			       manaOT = (Val * 1.25) / 5;
            elseif ( attribList[i] == "foodlevelOT" ) then     			
			       foodlevelOT = Val * 1.25) / 5;
			elseif ( attribList[i] == "poisonvalue" ) then
				Val = base.common.Limit( (User:getPoisonValue() + Val) , 0, 10000 ); 
				User:setPoisonValue( Val );
			else
			    Character:increaseAttrib(attribList[i],Val);
			end	
          
		Character.movepoints=Character.movepoints-20;
	    world:makeSound(12,User.pos);
	
	    --find, myEffect = User.effects:find(XXX) -- don't forget to fill in the effect ID!!!

        --if not find then
	       --myEffect=LongTimeEffect(XXX,1); 
	      -- User.effects:addEffect(myEffect); -- create the effect
	   
	     -- if not find then  -- security check 
	      --   User:inform("An error occured, inform a developer.");
	      --   return;
	      -- end  
	  -- end
       -- no we add the values
	  -- myEffect:addValue("hitpointsIncrease",hitpointsOT)
      -- myEffect:addValue("manaIncrease",manaOT)
	  -- myEffect:addValue("foodlevelIncrease",foodlevelOT)
	  -- myEffect:addValue("poisonvalueIncrease",poisonvalueOT)
	  -- myEffect:addValue("counter",5)	   
	
   end
	
	
	
	


-- TODO: implement poisoning of items (also in food script)
-- @return true if poisoning was successful
function PoisonItem(Character,SourceItem,TargetItem)
     

-- Vergiften von Items
-- Liste der vergiftbaren Items
	local ListPo = {15,47,49,64,73,80,81,147,151,160,163,191,199,200,201,237,293,294,302,303,306,307,322,353,354,355,388,552,553,554,555,553,557,559,2276,2277,2278,2456,2459,2922,2923}
	for i = 1, table.getn(ListPo) do
		if TargetItem.id == ListPo[i] then
			TargetItem.data = SourceItem.data
			TargetItem.quality = SourceItem.quality
			world:changeItem(TargetItem)
			world:makeSound(12,Character.pos);
			world:gfx(5,Character.pos)
			return true;
		end
	end
-- in einer 2. Ausbaustufe kann man die Schwerter, die als vergiftete Waffen eine Grafik haben umsetzen
	base.common.TempInformNLS(Character,
		"Dieser Gegenstand lässt sich nicht vergiften.",
		"This item can't be poisoned.");
	return false;
end

-- @return true if potion has been used
function PoisonCharacter(User,SourceItem,Character)
	
	
	if User.id == Character.id then
		return false;
	end
	if base.common.IsLookingAt(User,Character.pos) then
		if not base.common.IsLookingAt(Character,User.pos) then
			local SkillName="poisoning";
			local SkillVal=User:getSkill(SkillName);
			local AttribVal=math.floor((User:increaseAttrib("dexterity",0)*2+User:increaseAttrib("agility",0))/3)*(math.random(7,13)/10);
			local PoiTry=(6/10)*(SkillVal+AttribVal)+10;
			local AttribValDef=math.floor((Character:increaseAttrib("dexterity",0)+(Character:increaseAttrib("agility",0)*2))/3)*(math.random(7,13)/10);
			local PoiDef=(5*AttribValDef)-11;
			if (PoiTry>PoiDef) then
				base.common.TempInformNLS(User,
					"Du verabreichst deinem Opfer den Trank.",
					"You administer your victim the potion.");
				base.common.TempInformNLS(Character,
					"Jemand hat dir einen Trank in den Mund geschüttet.",
					"Someone has poured a potion into your mouth.");
				DrinkPotion(Character, SourceItem);
			else
				base.common.TempInformNLS(User,
					"Du versuchst deinem Opfer den Trank zu verabreichen, aber du scheiterst.",
					"You try to administer the potion to your victim, buy you fail.");
				base.common.TempInformNLS(Character,
					"Jemand versuchte dir den Inhalt einer Flasche in den Mund zu schütten.",
					"Someone tried to make you drink a potion.");
			end
			--User:learn(5,SkillName,1,(3*AttribValDef)+40);
			--Replace with new learn function, see learn.lua 
			return true;
		else
			base.common.TempInformNLS(User,
				"Dein Opfer darf nicht zu dir sehen, wenn du Erfolg haben willst.",
				"Your victim shouldn't look at you, if you want to succeed.");
		end
	else
		base.common.TempInformNLS(User,
			"Du musst zu deinem Opfer sehen.",
			"You have to look at your victim.");
	end
	return false;
end

function UseItem(User,SourceItem,TargetItem,Counter,Param, ltstate)

	--if (ltstate == Action.abort) then
       -- User:talkLanguage(Character.say, Player.german, "#me verschüttet den Trank.");
        --User:talkLanguage(Character.say, Player.english, "#me spills the potion.");
        --world:erase(SourceItem,1);
        -- Chance for a new bottle 19/20
        --if(math.random(20) == 1) then
           -- base.common.TempInformNLS(Character, "Die Flasche zerbricht.", "The bottle breaks.");
        --else
            --User:createItem(164, 1, 333, 0);
        --end
        --return
    --end

    if User.attackmode then
        base.common.TempInformNLS(User,
			"Du kannst den Trank nicht benutzen während du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	if not base.common.IsItemInHands(SourceItem) then
		base.common.TempInformNLS(User,
			"Du musst die Flasche in die Hand nehmen.",
			"You have to take the bottle in your hand.");
		return;
	end
	
    --if (ltstate == Action.none) then
		--local frontChar = base.common.GetFrontCharacter(Character);
		--if frontChar then
			--if not PoisonCharacter(Character, SourceItem, frontChar) then
				--return;
			--end
		--else
			--User:startAction(20,0,0,12,25);
			--User:talkLanguage(Character.say, Player.german, "#me beginnt einen Trank zu trinken.");
			--User:talkLanguage(Character.say, Player.english, "#me starts to drink a potion.");
			--return;
		--end
    --else
		-- drink self
		DrinkPotion(User, SourceItem);
	--end
	
	world:erase(SourceItem,1);

    if( math.random( 20 ) <= 1 ) then
        base.common.TempInformNLS( User, "Die Flasche zerbricht.", "The bottle breaks.");
    else
        User:createItem( 164, 1, 333,0);
    end
end

function LookAtItem(User,Item)
    local PotionLabel = Item:getValue(1);
	if (Item:getValue(1) ~= nil) then
	    if (User:getPlayerLanguage()==0) then
           world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: " ..PotionLabel);
        else
            world:itemInform(User,Item,"You look at a sticker telling: "..PotionLabel);
        end
    else
        if (User:getPlayerLanguage()==0) then
           world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"");
        else
            world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"");
        end
    end
end