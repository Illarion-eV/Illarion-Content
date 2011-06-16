-- Druidsystem: poison

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_166_pink_bottle", package.seeall)

-- UPDATE common SET com_script='druid.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000      ,100          ,50000      ,100   ,10000        ,9000      ,800             ,7000}
attribList ={"hitpoints","body_height","foodlevel","luck","poisonvalue","attitude","mental capacity","mana"};


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
User:talk(CCharacter.say,"Bin in UseItem");
     if not druid.base.alchemy.ChekIfQuillInHand(User) then
           return;
        end
User:talk(CCharacter.say,"Ich setze auf: "..User.lastSpokenText);
SourceItem:setValue(1,User.lastSpokenText);
User:talk(CCharacter.say,"Ich setze auf: "..User.lastSpokenText);
User:talk(CCharacter.say,"Geschrieben wurde: "..SourceItem.getValue(1));
end	

function DrinkPotion(Character,SourceItem)
     if druid.base.alchemy.CheckIfQuillInHand(User) then 
	    return;
     end
		
	local dataZList = druid.base.alchemy.SplitBottleData(Character,SourceItem.data);
	druid.base.alchemy.generateTasteMessage(Character,dataZList);

	if (druid.base.alchemy.checkPotionSpam(Character)) then
		base.common.TempInformNLS(Character,
			"Dein exzessives Trinken von Tränken hat wohl dazu geführt, dass sie vorrübergehend ihre Wirkung nicht mehr entfalten.",
			"Due to excessive drinking of potions they seem to have temporarily no effect on you.");
	else
		for i=1,8 do
			--Trankwirkung
			local Val = (dataZList[i]-5) * (topBorder[i]/5) * base.common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );
			--Character:inform(""..Val)
			if ( attribList[i] == "poisonvalue" ) then
				Val = base.common.Limit( (Character:getPoisonValue() + Val) , 0, 10000 ); 
				Character:setPoisonValue( Val );
				--Character:increasePoisonValue( Val );
			elseif ( attribList[i] == "mental capacity" ) then
				Val = base.common.Limit( (Character:getMentalCapacity() + Val) , 0, 2400 ); 
				Character:setMentalCapacity( Val );
			elseif ( attribList[i] == "hitpoints" ) then
				Character:LTIncreaseHP(Val / 5, 5, 1000);
			elseif ( attribList[i] == "mana" ) then
				Character:LTIncreaseMana(Val / 5, 5, 1000);
			else
				Character:increaseAttrib(attribList[i],Val);
			end
		end
		Character.movepoints=Character.movepoints-20;
	end
	
	world:makeSound(12,Character.pos);
	
	-- BEGIN: has nothing to do with the DS
    if SourceItem.data == 75357464 and Character.effects:find(28) then
        Character.effects:removeEffect(28);
        return;
    elseif SourceItem.data == 75676578 and Character.effects:find(29) then
        Character.effects:removeEffect(29);
        return;
    end
	-- END
end

-- TODO: implement poisoning of items (also in food script)
-- @return true if poisoning was successful
function PoisonItem(Character,SourceItem,TargetItem)
     if druid.base.alchemy.CheckIfQuillInHand(User) then 
	    return;
     end

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
	if druid.base.alchemy.CheckIfQuillInHand(User) then 
	    return;
     end
	
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

function UseItem(User,Character,SourceItem,TargetItem,Counter,Param, ltstate)
     if druid.base.alchemy.CheckIfQuillInHand(User) then 
	    return;
     end
    
	if (ltstate == Action.abort) then
        Character:talkLanguage(CCharacter.say, CPlayer.german, "#me verschüttet den Trank.");
        Character:talkLanguage(CCharacter.say, CPlayer.english, "#me spills the potion.");
        world:erase(SourceItem,1);
        -- Chance for a new bottle 19/20
        if(math.random(20) == 1) then
            base.common.TempInformNLS(Character, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            Character:createItem(164, 1, 333, 0);
        end
        return
    end

    if Character.attackmode then
        base.common.TempInformNLS(Character,
			"Du kannst den Trank nicht benutzen während du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	if not base.common.IsItemInHands(SourceItem) then
		base.common.TempInformNLS(Character,
			"Du musst die Flasche in die Hand nehmen.",
			"You have to take the bottle in your hand.");
		return;
	end
	
    if (ltstate == Action.none) then
		local frontChar = base.common.GetFrontCharacter(Character);
		if frontChar then
			if not PoisonCharacter(Character, SourceItem, frontChar) then
				return;
			end
		else
			Character:startAction(20,0,0,12,25);
			Character:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt einen Trank zu trinken.");
			Character:talkLanguage(CCharacter.say, CPlayer.english, "#me starts to drink a potion.");
			return;
		end
    else
		-- drink self
		DrinkPotion(Character, SourceItem);
	end
	
	world:erase(SourceItem,1);

    if( math.random( 20 ) <= 1 ) then
        base.common.TempInformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
    else
        Character:createItem( 164, 1, 333,0);
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

