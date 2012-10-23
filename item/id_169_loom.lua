-- Webstuhl ( 169 )

-- Wollknäule  --> grauer Stoff

-- Arbeitscyclus: 1s - 4s
-- Zusätzliches Werkzeug: Schere ( 6 )

-- UPDATE common SET com_script='item.id_169_loom' WHERE com_itemid IN (169);

require("base.common")

module("item.id_169_loom", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
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
        "Deine Rüstung behindert dich bei deiner Arbeit.",
        "Your armor disturbs you while working." );
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then
        base.common.TurnTo( User, SourceItem.pos );
    end
    
    if not base.common.FitForWork( User ) then
        return
    end
    
    if (User:countItemAt("body",6)==0) then -- Schere
        base.common.InformNLS( User,
        "Du brauchst eine Schere, um hir zu arbeiten.",
        "You need scissors to work here." );
        return
    end
    
    local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 6)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
    end
    
    if base.common.ToolBreaks( User, Tool, true ) then -- Schere
        base.common.InformNLS( User, 
        "Die Schere wird stumpf.", 
        "The scissors went blunt." );
        return
    end
    
    if (User:countItemAt("belt",170) < 5) then
        base.common.InformNLS( User, 
        "Du brauchst ein Knäuel Wolle in deinem Gürtel, um Stoff herzustellen.", 
        "You need some wool in your belt to make cloth." );
        return
    end
    
    if ( ltstate == Action.none ) then
        User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
        User:talkLanguage( Character.say, Player.german, "#me beginnt, Stoff zu weben.");
        User:talkLanguage( Character.say, Player.english, "#me starts to weave cloth.");
        return
    end
    
    if base.common.IsInterrupted( User ) then
        base.common.InformNLS(User,
        "Dir reisst der Faden beim weben durch.",
        "The yarn rips while weaving");
        return
    end
    
    User:eraseItem(170,5); --takes 5 wool to produce 1 unit of cloth
    local notcreated = User:createItem(176,1,333,0);
    if (notcreated > 0) then
        world:createItemFromId( 176, 1, User.pos, true, 333 ,0);
        base.common.InformNLS(User,
        "Du kannst nichts mehr halten.",
        "You can't carry any more.");
    else
        User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
    end
    
    base.common.GetHungry( User, 100 );
    --User:learn( 2, "tailoring", 2, 10 );
	--Replace with new learn function, see learn.lua 
    
end -- function

-- Arbeitszeit generieren
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = math.min(100,User:getSkill(Skill.tailoring)*10);     -- Schneidern: 0 - 100
    
    return math.floor(-0.25 * (Attrib + Skill) + 40);
end
