--I_166_lila_flasche
--Druidensystem in Arbeit
--Falk

require("base.common")
require("druids.base.alchemy")

module("druids.items.166_pink_bottle", package.seeall(druids.base.alchemy))

-- UPDATE common SET com_script='druids.items.166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
taste = {};
topBorder = {10000      ,100          ,60000      ,100   ,10000        ,9000      ,2400             ,10000}
attribList ={"hitpoints","body_height","foodlevel","luck","poisonvalue","attitude","mental capacity","mana"};
taste[0]   ={"fruchtig","herb"     ,"bitter"    ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"   ,"süß"};
taste[1]   ={"fruity"  ,"tartly"   ,"bitter"    ,"putrefactive","sour"        ,"salty"  ,"hot"      ,"sweet"};

function DoDruidism(Character,SourceItem,TargetItem,Counter,Param)

	local dataZList = SplitBottleData(Character,SourceItem.data);

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
     	  else
            Character:increaseAttrib(attribList[i],Val);
        end

    end

	Character:inform(generateTasteMessage(Character:getPlayerLanguage(),dataZList));

    -- Dieser Abschnitt wurde von 3.Seite eingebaut und gehört nicht in das DS
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

    if not Character.attackmode then
        -- Hier verweisen wir auf die Wirkung
        if SourceItem.data==0 then
          --keine Wirkungen
        else
          DoDruidism(Character,SourceItem,TargetItem,Counter,Param)
        end
        world:erase(SourceItem,1);
        world:makeSound(12,Character.pos);

        if( math.random( 20 ) <= 1 ) then
            base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            Character:createItem( 164, 1, 333,0);
        end

        Character.movepoints=Character.movepoints-50;

    else
        base.common.InformNLS(Character,"Du kannst nichts trinken während du kämpfst.", "You can't drink something while fighting.");
    end

end

function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"")
    else
        world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"")
    end
end