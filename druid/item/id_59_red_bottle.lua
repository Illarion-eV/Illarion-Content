--ds_059_rote_flasche
--Druidensystem in Arbeit
--Falk
--Delay added by Blay09

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_59_red_bottle",package.seeall); --, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_59_red_bottle' WHERE com_itemid = 59;

topBorder = 30;
bottomBorder = 2;
taste = {};
attribList ={"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
taste[0]   ={"fruchtig","herb"     ,"bitter"    ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"   ,"süß"};
taste[1]   ={"fruity"  ,"tartly"   ,"bitter"    ,"putrefactive","acidly"      ,"salt"   ,"hot"      ,"sweet"};

function DoDruidism(Character,SourceItem)

	
    local dataZList = SplitBottleData(Character,Sourceitem.id_data);

--    for i=1,8 do
--      Character:inform("PIN "..i..": "..dataZList[i])
--    end

	druid.base.alchemy.generateTasteMessage(Character,dataZList);

    -- Hier kommt die Sache mit dem Langzeiteffekt:
    foundEffect, myEffect = Character.effects:find(59);
    if not foundEffect then
        myEffect=LongTimeEffect(59,1000);
    end

    found, cnt = myEffect:findValue("effects");
    cnt = found and cnt+1 or 1;
    myEffect:addValue("effects",cnt);

    myEffect:addValue("zaehler_"..cnt,math.floor(Sourceitem.id_quality/100)+myEffect.numberCalled);


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

    if (ltstate == Action.abort) then
        Character:talkLanguage(Character.say, Player.german, "#me verschüttet den Trank.");
        Character:talkLanguage(Character.say, Player.english, "#me spills the potion.");
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
        User:talkLanguage(Character.say, Player.german, "#me beginnt einen Trank zu trinken.");
        User:talkLanguage(Character.say, Player.english, "#me starts to drink a potion.");
        return
    end

	if Sourceitem.id_data == 0 then
		-- Keine Funktion
	else
        -- Hier verweisen wir auf die Wirkung
        DoDruidism(Character,SourceItem)

        world:erase(SourceItem,1);

        if( math.random( 20 ) <= 1 ) then
			base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
		else
			Character:createItem( 164, 1, 333,0);
		end

		Character.movepoints=Character.movepoints-50;
	end
end

function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"")
    else
        world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"")
    end
end
