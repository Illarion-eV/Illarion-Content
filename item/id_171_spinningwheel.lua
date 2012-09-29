-- Spinnrad ( 270 )

-- Wolle  --> Wollkneul
-- Sibanac --> Garn

-- Arbeitscyclus: 1s - 4s
-- Zusätzliches Werkzeug: Schere ( 6 )

-- UPDATE common SET com_script='item.id_171_spinningwheel' WHERE com_itemid IN (171);

require("base.common")
require("content.gathering")

module("item.id_171_spinningwheel", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	content.gathering.InitGathering();
	local woolcutting = content.gathering.woolcutting;
	
    base.common.ResetInterruption( User, ltstate );
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
    
    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Spinnen.",
        "Your armour disturbs you while spinning." );
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then
        base.common.TurnTo( User, SourceItem.pos );
    end
    
    if (User:countItemAt("body",6)==0) then -- Schere
        base.common.InformNLS( User,
        "Du benötigst eine Schere um die Wolle oder Sibanac zu spinnen.",
        "You need scissors to spin the wool or sibanac." );
        return
    end
    
    local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 6)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
    end
    
    if base.common.ToolBreaks( User, Tool, true) then -- Schere beschädigen
        base.common.InformNLS( User, 
        "Die Schere wird stumpf.", 
        "The scissors went blunt." );
        return
    end
    
    if ((User:countItemAt("belt",170) < 1) and (User:countItemAt("belt",155) < 3)) then
        if (ltstate ~= Action.success) then
            base.common.InformNLS( User, 
            "Du benötigst Wolle oder Sibanac um am Spinnrad zu arbeiten.", 
            "You need some wool or sibanac to work at the spinning wheel." );
        end
        return
    end
    
    if ( ltstate == Action.none ) then
        User:startAction( GenWorkTime(User), 0, 0, 0, 0);
        User:talkLanguage( Character.say, Player.german, "#me beginnt Wolle zu spinnen.");
        User:talkLanguage( Character.say, Player.english, "#me starts to spin wool.");
        return
    end
    
	if not woolcutting:FindRandomItem(User) then
		return false;
	end
	
    if (User:countItemAt("belt",170) > 1) then --Removes 2 wool, and returns 1 thread for each
        User:eraseItem( 170, 2 );
        local notcreated = User:createItem(50, 1, 333 ,0 );
        if (notcreated > 0) then
            world:createItemFromId( 50, 1, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        else
            User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
        end
    else
        User:eraseItem( 155, 3 );
        local notcreated = User:createItem(50, 1, 333 ,0 );
        if (notcreated > 0) then
            world:createItemFromId( 50, 1, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        else
            User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
        end
    end

    --User:learn( 2, "tailoring", 2, 10 );
	--Replace with new learn function, see learn.lua 
    
end -- function

-- Arbeitszeit generieren
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = math.min(100,User:getSkill("tailoring")*10);     -- Schneidern: 0 - 100
    
    return math.floor(-0.25 * (Attrib + Skill) + 40);
end
