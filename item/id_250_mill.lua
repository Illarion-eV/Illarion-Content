-- Mühlstein ( 250 )

-- Getreidekörner  --> Mehl

-- Arbeitscyclus: 0.5s - 3s
-- Zusätzliches Werkzeug: Holzkelle ( 312 )

-- UPDATE common SET com_script='item.id_250_mill' WHERE com_itemid IN (250);

require("base.common")

module("item.id_250_mill", package.seeall)

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
    
    if base.common.Encumbrence(User) then -- Durch Steife Rüstung behindert
        base.common.InformNLS( User,
        "Deine Rüstung behindert Dich beim Mehl Mahlen.",
        "Your armor disturbs you when grinding grain" );
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then
        base.common.TurnTo( User, SourceItem.pos );
    end
    
    if not base.common.FitForWork( User ) then
        return
    end
    
    if (User:countItemAt("belt",259) == 0) then
        if (ltstate ~= Action.success) then
            base.common.InformNLS( User, 
            "Du hast nichts was du hier zermahlen könntest.", 
            "You have nothing that you can grind here." );
        end
        return
    end 
    
    if (User:countItemAt("body",312)==0) then -- Holzkelle
        base.common.InformNLS( User,
        "Du benötigst eine Holzkelle um das Getreide in die Mühle zu bekommen.",
        "You need a wooden shovel to get the grain into the mill." );
        return
    end
    
    local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 312)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
    end
    
    if base.common.ToolBreaks( User, Tool ) then -- Holzkelle beschädigen
        base.common.InformNLS( User, 
        "Die Holzkelle zerbricht.", 
        "The wooden shovel breaks." );
        return
    end  
    
    if ( ltstate == Action.none ) then
        User:startAction( GenWorkTime(User), 0, 0, 0, 0);
        User:talkLanguage( Character.say, Player.german, "#me beginnt Getreide zu mahlen.");
        User:talkLanguage( Character.say, Player.english, "#me starts to grind grain.");
        return
    end
    
    if base.common.IsInterrupted( User ) then
        local selectMessage = math.random(1,5);
        if ( selectMessage == 1 ) then
            base.common.InformNLS(User,
            "Du wischst dir den Schweiß von der Stirn.",
            "You wipe sweat off your forehead.");
        elseif ( selectMessage == 2 ) then
            base.common.InformNLS(User,
            "Dir rutscht die Holzkelle aus der Hand und fällt in den Mühlstein. Nach einigen Versuchen kannst du sie wieder heraus holen.",
            "Your wooden shovel falls into the mill stone. After some tries you are able to get it out again.");
        elseif ( selectMessage == 3 ) then
            base.common.InformNLS(User,
            "Du klopfst dir das Mehl aus der Kleidung, da du das Gefühl hast wie ein Geist auszusehen.",
            "You beat the flour out of your clothes so that you do not look like a ghost anymore.");
        elseif ( selectMessage == 4 ) then
            base.common.InformNLS(User,
            "Du säuberst kurz den Mühlstein um eine bessere Qualität des Mehls zu erreichen.",
            "You clean the millstone.");
        else
            base.common.InformNLS(User,
            "Gerade noch kannst du verhindern, dass ein Stein, der sich wohl ins Korn gemogelt hatte, in den Mühlstein fällt.",
            "You made it to get a stone out the the grain short time before it falls into the millstone");
        end
        
        return
    end
    
    User:eraseItem(259,1);
    notCreated = User:createItem(2,1,333,0);
    if (notCreated > 0) then
        world:createItemFromId( 2, 1, User.pos, true, 333 ,0);
        base.common.InformNLS(User,
        "Du kannst nichts mehr halten.",
        "You can't carry any more.");
    else
        User:startAction( GenWorkTime(User), 0, 0, 0, 0);
    end
    base.common.GetHungry( User, 200 );
    --User:learn( 2, "baking", 2, 10 );
	--Replace with new learn function, see learn.lua 
end -- function UseItem()

-- Arbeitszeit Generieren
function GenWorkTime(User)
    local Skill  = math.min(100,User:getSkill(Character.cooking)*10);
    local Attrib = User:increaseAttrib( "dexterity", 0 );
    
    return math.floor( -0.2 * (Skill+Attrib) + 30);
end
