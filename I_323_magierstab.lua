-- Funktion: 	Magierstab mit spezieller Funktion
-- Updated by:	Kadiya
-- Last update:	25.06.08


dofile( "base_lookat_wood.lua" );
require("base.common")


function LookAtItem(User,Item)
    if ( (Item.data > 600) and (Item.data < 650) ) then  -- Stab für Maggi
	if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Du siehst einen schmalen, fast schwarz wirkenden Holzstab auf dem eisblau leuchtende Runen eingraviert sind.")
	else
	    world:itemInform(User,Item,"You see a small ebony staff, engraved with iceblue shiny runes.")
	end
    else
        world:itemInform(User,Item,GetItemDescription(User,Item,4,false,false ));
    end
end

function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
    if (User:increaseAttrib("sex",0) == 0) then
        gText = "seinem";
        eText = "his";
    else
        gText = "ihrem";
        eText = "her";
    end


    if ( (SourceItem.data > 600) and (SourceItem.data < 650) ) then  -- Stab für Maggi
	if ( (SourceItem.itempos == 5) or (SourceItem.itempos == 6) ) then
            User:talkLanguage( CCharacter.say, CPlayer.german, "#me schlägt das untere Ende des Stabes auf den Boden, woraufhin ein bunter Funkenregen aus der Stabspitze hervorbricht.");
            User:talkLanguage( CCharacter.say, CPlayer.english, "#me stombs "..eText.." staff to the ground and a rain of sparks bursts out of the top of "..eText.." staff");
	    world:gfx(45,User.pos);
	    SourceItem.data=SourceItem.data+1;
	    world:changeItem(SourceItem);
	end
    elseif (SourceItem.data == 650) then
        if ( (SourceItem.itempos == 5) or (SourceItem.itempos == 6) ) then
	    User:talkLanguage( CCharacter.say, CPlayer.german, "#me versucht das untere Ende des Stabes auf den Boden zu schlagen, doch der Stab zerbricht mit einem grellen Blitz.");
            User:talkLanguage( CCharacter.say, CPlayer.english, "#me tries to stombs "..eText.." staff to the ground, but the staff breaks with a glare lighting");
	    world:erase(SourceItem,1);
	    world:gfx(2,User.pos);
	end
    end
    return;
end

