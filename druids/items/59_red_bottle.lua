--ds_059_rote_flasche
--Druidensystem in Arbeit
--Falk

require("base.common")
require("druids.base.alchemy")

module("druids.items.59_red_bottle", package.seeall(druids.base.alchemy))

-- UPDATE common SET com_script='druids.items.59_red_bottle' WHERE com_itemid = 59;

topBorder = 30;
bottomBorder = 2;
taste = {};
attribList ={"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
taste[0]   ={"fruchtig","herb"     ,"bitter"    ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"   ,"süß"};
taste[1]   ={"fruity"  ,"tartly"   ,"bitter"    ,"putrefactive","acidly"      ,"salt"   ,"hot"      ,"sweet"};

function DoDruidism(Character,SourceItem,TargetItem,Counter,Param)

    local dataZList = SplitBottleData(Character,SourceItem.data);

--    for i=1,8 do
--      Character:inform("PIN "..i..": "..dataZList[i])
--    end

    Character:inform(generateTasteMessage(Character:getPlayerLanguage(),dataZList));

    if SourceItem.data == 75357464 and Character.effects:find(28) then
        Character.effects:removeEffect(28);
        return;
    elseif SourceItem.data == 75676578 and Character.effects:find(29) then
        Character.effects:removeEffect(29);
        return;
    end

    -- Hier kommt die Sache mit dem Langzeiteffekt:
    foundEffect, myEffect = Character.effects:find(59);
    if not foundEffect then
        myEffect=CLongTimeEffect(59,1000);
    end

    found, cnt = myEffect:findValue("effects");
    cnt = found and cnt+1 or 1;
    myEffect:addValue("effects",cnt);

    myEffect:addValue("zaehler_"..cnt,math.floor(SourceItem.quality/100)+myEffect.numberCalled);


    for i, attrib in pairs(attribList) do
        --den bisherigen Attributswert laden
        attribValue = Character:increaseAttrib(attrib,0);

        if (attribValue + dataZList[i] - 5) > topBorder then
            dataZList[i] = topBorder - attribValue + 5;
        elseif (attribValue + dataZList[i] - 5) < bottomBorder then
            dataZList[i] = bottomBorder - attribValue + 5;
        end

        if dataZList[i] ~= 5 then
            Character:increaseAttrib(attrib,dataZList[i]-5);
            myEffect:addValue(attrib.."_"..cnt,dataZList[i]);
        end
    end

    if not foundEffect then
        Character.effects:addEffect( myEffect );
    end
end

function UseItem(Character,SourceItem,TargetItem,Counter,Param)

	if SourceItem.data == 0 then
		-- VORÜBERGEHEND DAS ALTE SKRIPT AUSFÜHREN
    	if not Character.attackmode then
			world:erase(SourceItem,1);
			world:makeSound(12,Character.pos);
			if( math.random( 20 ) <= 1 ) then
				base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
			else
				Character:createItem( 164, 1, 333,0);
			end
			A=math.random(7500)+5000;
      	      Character:setPoisonValue( base.common.Limit( (Character:getPoisonValue() - A) , 0, 10000) );
			--Character:increasePoisonValue(-1 * A);
			Character.movepoints=Character.movepoints-50;
			Character:increaseAttrib("foodlevel",1000);
			if (Character:increaseAttrib("foodlevel",0)> 60000) then
				base.common.InformNLS( Character,"Du bekommst kaum noch was runter und dir wird schlecht.","You hardly manage to eat something more and get sick!");
				Character:increaseAttrib("hitpoints",-1000);
			elseif  (Character:increaseAttrib("foodlevel",0) > 40000) then
				base.common.InformNLS( Character, "Du bist satt.", "You are stuffed.");
			else
				base.common.InformNLS( Character, "Du trinkst die Flasche aus und fühlst wie das Gift aus deinem Körper weicht.", "You drink up the bottle, and you feel the poison leave your body.");
			end
		else
			base.common.InformNLS(Character,"Du kannst nichts trinken während du kämpfst.", "You can't drink something while fighting.");
		end

	else
		-- DAS NEUE SKRIPT AUSFÜHREN
    	if not Character.attackmode then
        	-- Hier verweisen wir auf die Wirkung
        	DoDruidism(Character,SourceItem,TargetItem,Counter,Param)

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
end

function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"")
    else
        world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"")
    end
end