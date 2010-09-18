--I_166_lila_flasche
--Druidensystem in Arbeit
--Falk
--Delay added by Blay09

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_166_pink_bottle", package.seeall)

-- UPDATE common SET com_script='druid.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000      ,100          ,50000      ,100   ,10000        ,9000      ,800             ,7000}
attribList ={"hitpoints","body_height","foodlevel","luck","poisonvalue","attitude","mental capacity","mana"};


function DoDruidism(Character,SourceItem,TargetItem,Counter,Param)

	if (druid.base.alchemy.checkPotionSpam(Character)) then
		base.common.InformNLS(Character, "Dein exzessives Trinken von Tränken hat wohl dazu gefährt, dass Tränke vorrübergehend ihre Wirkung nicht mehr entfachen.", "The excessive drinking of potions seems to led to the fact that potions have no effects on you temporary.");
		return;
	end

	local dataZList = druid.base.alchemy.SplitBottleData(Character,SourceItem.data);

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

	Character:inform(druid.base.alchemy.generateTasteMessage(Character:getPlayerLanguage(),dataZList));

    -- Dieser Abschnitt wurde von 3.Seite eingebaut und gehï¿½rt nicht in das DS
    if SourceItem.data == 75357464 and Character.effects:find(28) then
        Character.effects:removeEffect(28);
        return;
    elseif SourceItem.data == 75676578 and Character.effects:find(29) then
        Character.effects:removeEffect(29);
        return;
    end
    --

end

function UseItem(Character,SourceItem,TargetItem,Counter,Param)

    if (ltstate == Action.abort) then
        Character:talkLanguage(CCharacter.say, CPlayer.german, "#me verschüttet den Trank.");
        Character:talkLanguage(CCharacter.say, CPlayer.english, "#me spills the potion.");
        world:erase(SourceItem,1);
        -- Chance for a new bottle 19/20
        if(math.random(20) == 1) then
            base.common.InformNLS(Character, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            Character:createItem(164, 1, 333, 0);
        end
        return
    end

    if Character.attackmode then
        base.common.InformNLS(Character, "Du kannst nichts trinken während du kämpfst.", "You can't drink something while fighting.");
		return
	end
	
    if (ltstate == Action.none) then
        User:startAction(20,0,0,12,25);
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt einen Trank zu trinken.");
        User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts to drink a potion.");
        return
    end
	
	-- Hier verweisen wir auf die Wirkung
    if SourceItem.data==0 then
		--keine Wirkungen
    else
		DoDruidism(Character,SourceItem,TargetItem,Counter,Param)
    end
    world:erase(SourceItem,1);

    if( math.random( 20 ) <= 1 ) then
        base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
    else
        Character:createItem( 164, 1, 333,0);
    end

    Character.movepoints=Character.movepoints-50;

end

function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"")
    else
        world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"")
    end
end