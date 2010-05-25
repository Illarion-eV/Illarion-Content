-- Sieb ( 727 )

-- grober Sand (726) --> Quarz Sand (316)

-- Arbeitscyclus: 1s - 4s
-- Zusätzliches Werkzeug: Holzkelle ( 312 )

-- UPDATE common SET com_script='I_727_sieb.lua' WHERE com_itemid IN (727);

require("base.common")

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
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert dich beim sieben",
        "Your armor disturbs you while sieving" );
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then
        base.common.TurnTo( User, SourceItem.pos );
    end
    
    if not base.common.FitForWork( User ) then
        return
    end
    
    if (User:countItemAt("body",312)==0) then -- Schere
        base.common.InformNLS( User,
        "Du brauchst eine Holzkelle um den Sand auf das Sieb zu schaufeln.",
        "You need a wooden shovel to put the sand on the sieve" );
        return
    end
    
    local Tool = User:getItemAt(CCharacter.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 312)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(CCharacter.right_tool); -- In anderer Hand nachsehen
    end
    
    if base.common.ToolBreaks( User, Tool, true ) then -- Schere beschädigen
        base.common.InformNLS( User, 
        "Die Holzkelle bricht ab.", 
        "The wooden shovel breaks." );
        return
    end
    
    if (User:countItemAt("belt",726) < 1) then
        if (ltstate ~= Action.success) then
            base.common.InformNLS( User, 
            "Du benötigst groben Sand um diesen zu sieben.", 
            "You need coarse sand to sieve it." );
        end
        return
    end
    
    if ( ltstate == Action.none ) then
        User:startAction( GenWorkTime(User), 0, 0, 0, 0);
        User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt zu sieben.");
        User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts to sieve.");
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
            "Eine Windböe erfasst den Sand als du ihn gerade sieben willst und bläßt dir den Sand ins Gesicht.",
            "A gust grabs your sand when you tried to sieve it and blows it into your face.");
        elseif ( selectMessage == 3 ) then
            base.common.InformNLS(User,
            "Du machst eine kürzere Pause um die größeren Steine aus dem Rüttelsieb zu entfernen.",
            "You toss out some small pebbles from the sieve.");
        elseif ( selectMessage == 4 ) then
            base.common.InformNLS(User,
            "Du klopfst dir kurz den Sand aus der Kleidung, da er beginnt auf der Haut zu scheuern.",
            "You blow sand away from your clothes.");
        else
            base.common.InformNLS(User,
            "Für einen Moment dachtest du einen Edelstein im Sieb gefunden zu haben, es war aber doch nur ein Stück Glas.",
            "You look with glee at a shining stone in the sand, but then realise its only a piece of glass.");
        end
        return
    end
    
    if (User:countItemAt("belt",726) > 0) then
        User:eraseItem( 726, 1 );
        local notcreated = User:createItem(316, 1, 333 ,0 );
        if (notcreated > 0) then
            world:createItemFromId( 316, 1, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        else
            if (math.random(0,3000) == 1) then
                notcreated = User:createItem(198, 1, 333 ,0 );
                if (notcreated > 0) then
                    world:createItemFromId( 198, 1, User.pos, true, 333 ,0);
                    base.common.InformNLS(User,
                    "Du kannst nichts mehr halten.",
                    "You can't carry any more.");
                else
                    base.common.InformNLS(User,
                    "Du findest einen Topas im Sand.",
                    "You find a topaz in the sand.");
                    User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
                end
            else
                User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
            end
        end
    end

    base.common.GetHungry( User, 100 );
    User:learn( 2, "mining", 2, 10 );
    
end -- function

-- Arbeitszeit generieren
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = math.min(100,User:getSkill("mining")*10);     -- Schneidern: 0 - 100
    
    return math.floor(-0.25 * (Attrib + Skill) + 40);
end
