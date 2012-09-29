-- Chisel ( 737 )

-- raw stones  --> stone blocks + small stones
-- stone blocks --> small stones

-- Arbeitscyclus: 4s - 5s

-- UPDATE common SET com_script='item.id_737_chisel' WHERE com_itemid IN (737);

require("item.general.metal")
require("item.base.crafts")

module("item.id_737_chisel", package.seeall, package.seeall(item.general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    base.common.ResetInterruption( User, ltstate )
    if ( ltstate == Action.abort ) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
        return
    end
      
    if not base.common.CheckItem( User, SourceItem ) then -- Sicherheitscheck
        return
    end
    
    if base.common.Encumbrence(User) then -- Durch Steife Rüstung behindert
        base.common.InformNLS( User,
        "Deine Rüstung behindert Dich beim behauen der Steine",
        "Your armour disturbs you while working the stones" );
        return
    end
    
    if (SourceItem:getType() ~= 4) then -- Dreschflegel in der Hand
        base.common.InformNLS( User,
        "Du musst den Meisel in der Hand haben!",
        "You need to hold the chisel in your hand!" );
        return
    end
    
    if ( User:countItemAt( "body", 23 ) == 0 ) then
        base.common.InformNLS( User,
        "Du brauchst einen Hammer in der Hand um die Steine zu behauen.",
        "You need a hammer in your hand to work the stones." );
        return
    end
    
    if not base.common.FitForWork( User ) then -- Nicht erschöpft
        return
    end
    
    if (User:countItemAt("belt",735)==0) and (User:countItemAt("belt",733)==0) then -- Getreidebündel im Gürtel
        if (ltstate ~= Action.success) then
            base.common.InformNLS( User, 
            "Wenn du keine Steine hast, kannst du auch keine behauen.", 
            "In case you have not stones, you can't work stones." );
        end
        return
    end
    
    if ( ltstate == Action.none ) then -- Arbeit noch nicht begonnen -> Los gehts
        if (User:countItemAt("belt",735)>0) then
            User:startAction( 50-math.floor( 10 * ( User:increaseAttrib( "strength", 0 ) / 10 ) ), 0, 0, 8, 15);
        else
            User:startAction( 60-math.floor( 10 * ( User:increaseAttrib( "strength", 0 ) / 10 ) ), 0, 0, 8, 15);
        end
        User:talkLanguage( Character.say, Player.german, "#me beginnt Steine zu behauen");
        User:talkLanguage( Character.say, Player.english, "#me starts to work stones"); 
        return
    end
    
    if base.common.IsInterrupted( User ) then
        base.common.InformNLS(User,
        "Du schlägst daneben und triffst mit dem Hammer deine Finger.",
        "You miss the chisel and hit your fingers.");
        return
    end
    
    if base.common.ToolBreaks( User, SourceItem ) then -- Dreschflegen beschädigen
        base.common.InformNLS(User,
        "Der Meisel zerbricht.",
        "The chisel breaks.");
        return
    end
               
    if (User:countItemAt("belt",735)>0) then
        User:eraseItem( 735, 1 ); -- roher Stein weg.
        local notCreated = User:createItem( 733, 1, 333 ,0); -- behauener Stein her.
        local stop_working = false;
        if ( notCreated > 0 ) then
            world:createItemFromId( 733, 1, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
            stop_working = true;
        end
        if not stop_working and (User:countItemAt("belt",735)>0) then
            User:startAction( 50-math.floor( 10 * ( User:increaseAttrib( "strength", 0 ) / 10 ) ), 0, 0, 8, 15);
        end
    elseif (User:countItemAt("belt",733)>0) then
        User:eraseItem( 733, 1 ); -- roher Stein weg.
        local notCreated = User:createItem( 1266, 25, 333 ,0); -- kleine Steiner erstellen.
        if ( notCreated > 0 ) then
            world:createItemFromId( 1266, notCreated, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        elseif (User:countItemAt("belt",733)>0) then
            User:startAction( 60-math.floor( 10 * ( User:increaseAttrib( "strength", 0 ) / 10 ) ), 0, 0, 8, 15);
        end
    end     
                  
    --User:learn( 2, "mining", 2, 100 ); -- Lernen
	--Replace with new learn function, see learn.lua 
    base.common.GetHungry( User, 200 ); -- Hungrig werden
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 1, false, false) );
end
