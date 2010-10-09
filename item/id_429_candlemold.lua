-- zus�tzliches Werkzeug 428 Kerzentisch (statisch)
-- Wachs (431) zu Kerzen (43)
-- Arbeitszeit 2s

-- UPDATE common SET com_script='item.id_429_candlemold' WHERE com_itemid IN (429);

require("base.common")

module("item.id_429_candlemold", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate );
    math.randomseed( os.time() );


    local TargetItem = base.common.GetFrontItem( User );

	if (TargetItem.id ~= 428) then
    	base.common.InformNLS( User,
        "Nur an einem Kerzenziehertisch kannst du Kerzen herstellen.",
        "You need to work in front of a chandler table." );
        return
	end


    if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
        return
    end

    if (SourceItem:getType()~=4) then
        base.common.InformNLS(User,
        "Du musst die Kerzenform in der Hand halten.",
        "You have to hold the candle mold in your hands!");
        return
    end

    if not base.common.CheckItem( User, SourceItem ) then
        return
    end

    if not base.common.FitForWork( User ) then
        return
    end

    if ( User:countItemAt("belt",431) < 1 ) then --  Wachs ist nicht vorhanden
        Char = base.common.GetFrontCharacter( User );
        if (Char ~=nil) then
            UseItemWithCharacter(User,SourceItem, Char, Counter, Param,ltstate)
        elseif (ltstate ~= Action.success) then
            base.common.InformNLS( User,
            "Du brauchst Wachs um daraus Kerzen zu machen.",
            "You neeed wax to make candles.");
        end
        return
    end

    if ( ltstate == Action.none ) then
        User:startAction( 20, 0, 0, 0, 0);
        User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt Kerzen zu ziehen.");
        User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts to make candles.");
        return
    end

    if base.common.IsInterrupted( User ) then
        local selectMessage = math.random(1,2);
        if ( selectMessage == 1 ) then
            base.common.InformNLS(User,
            "Du wischst dir den Schwei� von der Stirn.",
            "You wipe sweat off your forehead.");
        elseif ( selectMessage == 2 ) then
            base.common.InformNLS(User,
            "Die Kerzen bleiben dir in der Form h�ngen. Es nimmt einige M�he in Anspruch sie endlich heraus zu bekommen.",
            "The candle gets stuck in the mold, it takes you a few tries to force it out.");
        end
        return
    end

    User:eraseItem( 431, 1 );
    User:createItem(43,1,333,0);

    if base.common.ToolBreaks( User, SourceItem, true ) then
        base.common.InformNLS(User,
        "Die alte Kerzenform ist abgenutzt.",
        "The old candle mold is over used.");
    else
        User:startAction( 20, 0, 0, 0, 0);
    end

    base.common.GetHungry( User, 100 );

end

function LookAtItem( User, Item )
    world:itemInform( User, Item, GetItemDescription( User, Item, 1, false, false ));
end
