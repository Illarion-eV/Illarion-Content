require("base.lookat")

module("items.general.jewel", package.seeall())

-- UPDATE common SET com_script='items.general.jewel' WHERE com_itemid IN (225);

function LookAtItem(User,Item)
    if (Item.id == 225) then
        if (Item.data == 122) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst die Krone der Nordmark");
            else
                world:itemInform(User,Item,"You see the crown of the Northmark");
            end
            return true;
        elseif ( Item.data == 121 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst die Krone von Greenbriar");
            else
                world:itemInform(User,Item,"You see the crown of Greenbriar");
            end
            return true;
        elseif ( Item.data == 120 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst die Krone von Varshikars");
            else
                world:itemInform(User,Item,"You see the crown of Varshikars");
            end
            return true;
        elseif ( Item.data == 119 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst die Krone der Grauen");
            else
                world:itemInform(User,Item,"You see the crown of the Greys");
            end
            return true;
        elseif ( Item.data == 118 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst die Krone von Trolls Bane");
            else
                world:itemInform(User,Item,"You see the crown of Trolls Bane");
            end
            return true;
        elseif ( Item.data == 123 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst die Krone des Königs von Silberbrand");
            else
                world:itemInform(User,Item,"You see the crown of the king of Silverbrand");
            end
            return true;
        elseif ( Item.data == 201 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst eine alte zerbrochene Goldkrone");
            else
                world:itemInform(User,Item,"You see a old broken gold crown");
            end
            return true;
        elseif ( Item.data == 202 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst eine vollständig edelsteinbestückte Goldkrone");
            else
                world:itemInform(User,Item,"You see a fully jeweled gold crown");
            end
            return true;
		elseif ( Item.data == 666 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst eine silbrig schimmernde, halb durchsichtige Krone.");
            else
                world:itemInform(User,Item,"You see a silver shimmering, half-transperent crown.");
            end
            return true;
        elseif ( Item.data == 10000 ) then
            if (User:getPlayerLanguage() == 0) then
                world:itemInform(User,Item,"Du siehst einen auffälligen Krone");            
            else
                world:itemInform(User,Item,"You see a peculiar crown");
            end
            return true;
        end
    end
    local desc = base.lookat.GetItemDescription(User,Item,4,false,false );
    if ( Item.data == 1 ) then
        world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,false,false )..base.common.GetNLS(User, " mit Gravur Troll's Bane", " with gravure Trolls Bane"));
    elseif ( Item.data == 2 ) then
        world:itemInform(User,Item,base.common.GetNLS(User, "Siegelring der Grauen Rose", "signet ring of the Grey Rose"));
    elseif ( Item.data == 3 ) then
        world:itemInform(User,Item,base.common.GetNLS(User, "Siegelring von Greenbriar", "signet ring of Greenbriar"));
    elseif ( Item.data == 4 ) then
        world:itemInform(User,Item,base.common.GetNLS(User, desc.." mit dem Wappen der Littlethorns", desc.." with the coat of arms of the Littlethorns"));
    elseif ( Item.data == 5 ) then
        world:itemInform(User,Item,base.common.GetNLS(User, "exzellenter Topasring mit der Gravur Faladron Furnir", " excellent topas ring with gravure Faladron Furnir"));
    elseif ( Item.data == 6 ) then
        world:itemInform(User,Item,base.common.GetNLS(User, "exzellenter Topasring mit der Gravur Fayne Furnir", " excellent topas ring with gravure Fayne Furnir"));
    elseif ( Item.data == 7 ) then
        world:itemInform(User,Item,base.common.GetNLS(User, desc.." mit der Gravur einer angebissenen Mandarine und eines sich in den Schwanz beissenden Panthers", desc.." with the gravure of a partly eaten tangerine and a panther biting his own tail"));
    elseif ( Item.data == 8 ) then
        world:itemInform(User,Item,base.common.GetNLS(User, desc.." mit dem Wappen der Heneghans", desc.." with the Heneghan crest"));
    else
        world:itemInform(User,Item,desc);
    end
end

function MoveItemBeforeMove( Character, SourceItem, TargetItem)
        if (Character:increaseAttrib("sex",0) == 0) then
            gText  = "seiner";
            eText  = "his";
			gText2 = "er";
			eText2 = "he";
        else
            gText  = "ihrer";
            eText  = "her";
            gText2 = "sie";
            eText2 = "she";
        end

	if ( SourceItem.data == 666 ) then
		Character:talkLanguage( CCharacter.say, CPlayer.german, "#me fährt mit "..gText.." Hand direkt durch die Krone hindurch. "..gText2.." scheint nicht in der Lage zu sein das Metall zu berühren.");
        Character:talkLanguage( CCharacter.say, CPlayer.english, "#me run's with "..eText.." hand directly through the crown. It seems, that "..eText2.."'s not able to touch the metal.");
        return false;
	end
	return true;
end

