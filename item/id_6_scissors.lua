-- I_6.lua garn aus darm

-- UPDATE common SET com_script='item.id_6_scissors' WHERE com_itemid IN (6);

require("item.general.metal")
require("item.base.crafts")

module("item.id_6_scissors", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate );
    math.randomseed( os.time() );
    
    if ( ltstate == Action.abort ) then
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
    
    if (SourceItem:getType()~=4) then
        base.common.InformNLS(User,
        "Du musst die Schere in der Hand halten.",
        "You have to hold the scissors in your hands!");
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    
    if not base.common.FitForWork( User ) then
        return
    end
    
    if ( User:countItemAt("belt",63) < 1 ) then
        Char = base.common.GetFrontCharacter( User );
        if (Char ~=nil) then
            GetWoolFromSheep(User,SourceItem, Char, ltstate)
        elseif (ltstate ~= Action.success) then
            base.common.InformNLS( User,
            "Du brauchst entweder ein Schaf dem du die Wolle abnehmen kannst oder Eingeweide die du zerschneiden kannst.",
            "You either need a sheep you can take the wool from or some entrails you can cut.");
        end
        return
    end
    
    if ( ltstate == Action.none ) then
        User:startAction( 16, 0, 0, 0, 0);
        User:talkLanguage( Character.say, Player.german, "#me beginnt Eingeweide zu zerschneiden.");
        User:talkLanguage( Character.say, Player.english, "#me starts to cut entrails.");
        return
    end
    
    if base.common.IsInterrupted( User ) then
        local selectMessage = math.random(1,3);
        if ( selectMessage == 1 ) then
            base.common.InformNLS(User,
            "Du wischst dir den Schweiﬂ von der Stirn.",
            "You wipe sweat off your forehead.");
        elseif ( selectMessage == 2 ) then
            base.common.InformNLS(User,
            "Die Schere scheint schon ziemlich stumpf zu sein. Du schleifst sie kurz nach.",
            "The scissors got blunt, you sharpen them with a whetstone.");
        else
            base.common.InformNLS(User,
            "Dir tun die Finger weh vom vielen Schneiden und du machst eine kurze Pause.",
            "Your fingers hurt from cutting, you take a short break.");
        end
        return
    end
    
    User:eraseItem( 63, 1 );
    User:createItem(50,1,333,0);
    
    if base.common.ToolBreaks( User, SourceItem, true ) then
        base.common.InformNLS(User,
        "Die alte und abgenutzte Schere in deinen H‰nden zerbricht.",
        "The old and used scissors in your hands breaks.");
    else
        User:startAction( 16, 0, 0, 0, 0);
    end
    
    base.common.GetHungry( User, 100 ); 
end

function GetWoolFromSheep(User,SourceItem, Sheep, ltstate)
    
    math.randomseed( os.time() );
    
    if ( ltstate == Action.abort ) then
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
    
    if (SourceItem:getType()~=4) then
        base.common.InformNLS(User,
        "Du musst die Schere in der Hand halten.",
        "You have to hold the scissors in your hands!");
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    
    if not base.common.FitForWork( User ) then
        return
    end
    
    if (Sheep:getRace()~=18) then
        base.common.InformNLS( User,
        "Du kannst nur Schafen die Wolle abnehmen.",
        "You can only cut wool from sheeps.");
        return
    end
    
    if (math.abs(Sheep.pos.x-User.pos.x) > 1) or (math.abs(Sheep.pos.y-User.pos.y) > 1 ) then
        base.common.InformNLS( User,
        "Das Schaf ist zu weit weg!",
        "The sheep is too far away!");
        return
    end
    
    if ( ltstate == Action.none ) then
        User:startAction( 13, 0, 0, 0, 0);
        User:talkLanguage( Character.say, Player.german, "#me beginnt das Schaf zu scheren");
        User:talkLanguage( Character.say, Player.english, "#me starts to shear the sheep.");
        Sheep.movepoints = Sheep.movepoints - 30;
        return
    end
    
    if base.common.IsInterrupted( User ) then
        local selectMessage = math.random(1,3);
        if ( selectMessage == 1 ) then
            base.common.InformNLS(User,
            "Du wischst dir den Schweiﬂ von der Stirn.",
            "You wipe sweat off your forehead.");
        elseif ( selectMessage == 2 ) then
            base.common.InformNLS(User,
            "Die Schere scheint schon ziemlich stumpf zu sein. Du schleifst sie kurz nach.",
            "The scissors got blunt, you sharpen them with a whetstone.");
        else
            base.common.InformNLS(User,
            "Dir tun die Finger weh vom vielen Schneiden und du machst eine kurze Pause.",
            "Your fingers hurt from cutting, you take a short break.");
        end
        return
    end
    
    User:createItem(170,1,333,0);
    Sheep.movepoints = Sheep.movepoints - 20;
    
    if base.common.ToolBreaks( User, SourceItem ) then
        base.common.InformNLS(User,
        "Die alte und abgenutzte Schere in deinen H‰nden zerbricht.",
        "The old and used scissors in your hands breaks.");
    else
        User:startAction( 13, 0, 0, 0, 0);
    end
    
    base.common.GetHungry( User, 100 ); 
end

function LookAtItem(User,Item)
    item.general.metal.LookAtItem(User,Item)
end
