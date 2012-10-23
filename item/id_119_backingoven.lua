-- Backofen

-- Mehl(2) und Wasser(52) zu Teig(5)

-- Arbeitscyclus: 2s - 8s
-- Zusätzliches Werkzeug: Nudelholz ( 118 )

-- UPDATE common SET com_script='item.id_119_backingoven' WHERE com_itemid IN (119,120);

require("base.common")

module("item.id_119_backingoven", package.seeall);

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate );
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Arbeiten.",
        "Your armor disturbs while working." );
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then -- Sicherheitscheck
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then -- Blickrichtung
        base.common.TurnTo( User, SourceItem.pos ); -- Drehen wenn nötig
    end
    
    if not base.common.FitForWork( User ) then -- Kein Hunger
        return
    end
    
    if (User:countItemAt("body",118)==0) then -- kleine Zange
        base.common.InformNLS( User,
        "Du benötigst ein Nudelholz um hier zu arbeiten.",
        "You need a rolling pin to work here." );
        return
    end
    
    local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 118)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
    end
    
    if base.common.ToolBreaks( User, Tool, true) then -- Zange beschädigen
        base.common.InformNLS( User, 
        "Dein Nudelholz zerbricht.",
        "Your pin roll breaks." );
        return
    end
    
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
    
    if (User:countItemAt("belt",2) == 0) then -- Mehl gefunden
        base.common.InformNLS( User, 
        "Du brauchst Mehl um hier Teig zu machen.", 
        "You need flour to make dough" );
        return
    end
    
    if (User:countItemAt("belt",52) == 0) then -- Mehl gefunden
        base.common.InformNLS( User, 
        "Du brauchst einen Eimer Wasser um hier Teig zu machen.", 
        "You need a bucket of water to make dough" );
        return
    end
    
    if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
        User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
        User:talkLanguage( Character.say, Player.german, "#me beginnt Teig zu kneten.");
        User:talkLanguage( Character.say, Player.english, "#me starts to make dough.");
        return              
    end
    
    if base.common.IsInterrupted( User ) then
        base.common.InformNLS(User,
        "Du schüttest dir aus Versehen eine Ladung Wasser an die Kleidung.",
        "You accidentally pour some water on your clothes.");
        return
    end
    
    local handleAtOnce = math.min(5,User:countItemAt("belt",2));
    
    User:eraseItem(2,handleAtOnce);
    User:eraseItem(52,1);
    local notCreated = User:createItem(51,1,333,0);
    local startagain = true;
    if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
        world:createItemFromId( 51, notCreated, User.pos, true, 333 ,0);
        base.common.InformNLS(User,
        "Du kannst nichts mehr halten.",
        "You can't carry any more.");
        startagain = false;
    end
    
    notCreated = User:createItem(5,handleAtOnce,333,0);
    if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
        world:createItemFromId( 5, notCreated, User.pos, true, 333 ,0);
        base.common.InformNLS(User,
        "Du kannst nichts mehr halten.",
        "You can't carry any more.");
        startagain = false;
    end
    
    if startagain then
        User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
    end
    
    --User:learn(Skill.baking, 2, 20, User:increaseAttrib("dexterity", 0));
	--Replace with new learn function, see learn.lua 
    base.common.GetHungry( User, 200 );
end
    
    
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = User:getSkill(Skill.cooking);     -- Backen: 0 - 100
    
    return math.floor(-0.5 * (Attrib + Skill) + 80);
end
