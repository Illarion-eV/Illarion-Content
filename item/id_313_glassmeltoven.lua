-- Glasschmelzofen

-- Sand(316) und Asche(314) zu Glasbarren(41)
-- Lehm(26) zu Ungebrannten Ziegel(736)
-- Ungebrannte Ziegel(736) zu Ziegeln(2588)

-- Arbeitscyclus: 2s - 5s
-- Zusätzliches Werkzeug: Glasblasrohr ( 311 )
-- Zusätzliches Werkzeug: Ziegelform ( 734 )

-- UPDATE common SET com_script='item.id_313_glassmeltoven' WHERE com_itemid IN (313);

require("base.common")

module("item.id_313_glassmeltoven", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate );
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim arbeiten.",
        "Your armour disturbs while working." );
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
    
    local toolFound = false;
    local didSomething = false;
    local missingRess = "";
    if (User:countItemAt("body",311)~=0) then
        toolFound = true;
        if ((User:countItemAt("belt",316)>0) and (User:countItemAt("belt",314)>0)) then
            if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                User:startAction( GenWorkTime(User,"glass blowing"), 0, 0, 0, 0 );
                User:talkLanguage( Character.say, Player.german, "#me beginnt Glas zu schmelzen.");
                User:talkLanguage( Character.say, Player.english, "#me starts to melt glass.");
                return                
            end
            if base.common.IsInterrupted( User ) then
                local selectMessage = math.random(1,6);
                if ( selectMessage == 1 ) then
                    base.common.InformNLS(User,
                    "Du wischst dir den Schweiß von der Stirn.",
                    "You wipe sweat off your forehead.");
                elseif ( selectMessage == 2 ) then
                    base.common.InformNLS(User,
                    "Dir rutscht eine Kelle mit Sand aus der Hand und der Sand verteilt sich über den Boden. Nun wirst du erst den Sand aufkehren müssen.",
                    "Some sand slips out of your hand, and you stop to try to scoop it up.");
                elseif ( selectMessage == 3 ) then
                    base.common.InformNLS(User,
                    "Dir rutscht eine Kelle mit Asche aus der Hand und die Asche verteilt sich über den Boden. Nun wirst du erst die Asche aufkehren müssen.",
                    "Some ash falls out of your hand, and you try your best to scoop it up.");
                elseif ( selectMessage == 4 ) then
                    base.common.InformNLS(User,
                    "Der fertige Barren klemmt in der Form. Du klopfst sehr stark auf die Rückseite der Form bis er endlich heraus füllt.",
                    "The finished ingot is jamed in the mold. You clap a few times on the back of the mold until it gets loose.");
                elseif ( selectMessage == 5 ) then
                    base.common.InformNLS(User,
                    "Für einen Moment hast du vergessen wo du die Kelle zum Sand schaufeln hingelegt hast und musst nach ihr suchen.",
                    "You forgot for a moment where you placed the throwle for the sand and so you have to look for it.");
                else
                    base.common.InformNLS(User,
                    "Du beseitigst eine Verstopfung des Glasblasrohres.",
                    "You remove an obstruction from the glass-blowing rod.");
                end
                return
            end
            User:eraseItem(316,1);
            User:eraseItem(314,1); 
            notCreated = User:createItem(41,1,333,0);
            if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
                world:createItemFromId( 41, notCreated, User.pos, true, 333 ,0);
                base.common.InformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.");
            else
                User:startAction( GenWorkTime(User,"glass blowing"), 0, 0, 0, 0 );
            end
            local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
            if ((Tool == nil) or (Tool.id ~= 311)) then -- Wenn das Item nicht die Zange ist
                Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
            end
            if base.common.ToolBreaks( User, Tool ) then -- Zange beschädigen
                base.common.InformNLS( User, 
                "Das Glasblasrohr zerbricht.", 
                "The glasblow pipe breaks." );
                return
            end
            --User:learn(2,"glass blowing",2,20);
			--Replace with new learn function, see learn.lua 
            base.common.GetHungry( User, 300 );
            didSomething = true;
        else
            missingRess = base.common.GetNLS(User,
            "Du brauchst Sand und Asche und Glasblöcke herzustellen",
            "You need sand and ash to make glas ingots.");
        end
    end
    
    if ((User:countItemAt("body",734)~=0) and not didSomething) then
        if (User:countItemAt("belt",736)>4) then
            if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                User:startAction( GenWorkTime(User,"fireing bricks"), 0, 0, 0, 0 );
                User:talkLanguage( Character.say, Player.german, "#me beginnt Ziegel zu brennen.");
                User:talkLanguage( Character.say, Player.english, "#me starts to fire bricks.");
                return                
            end
            if base.common.IsInterrupted( User ) then
                local selectMessage = math.random(1,4);
                if ( selectMessage == 1 ) then
                    base.common.InformNLS(User,
                    "Du wischst dir den Schweiß von der Stirn.",
                    "You wipe sweat off your forehead.");
                elseif ( selectMessage == 2 ) then
                    base.common.InformNLS(User,
                    "Du bekommst den Ziegel nicht aus der Form und musst deshalb stark auf die Form klopfen bis er heraus fällt.",
                    "A brick refuses to come out of the mould, it takes some time for you to get it out.");
                elseif ( selectMessage == 3 ) then
                    base.common.InformNLS(User,
                    "Bevor du weiter machst reinigst du deine Hände kurz vom feuchten Lehm der an den Fingern klebt.",
                    "You wash your hands of the wet clay.");
                else
                    base.common.InformNLS(User,
                    "Du holst einen Stein aus dem Lehm. Zum Glück hast du ihn noch vor dem brennen bemerkt, sonst wäre der Ziegel bestimmt gebrochen.",
                    "You fish out a stone from the wet clay.");
                end
                return
            end
            User:eraseItem(736,5);
            notCreated = User:createItem(2588,5,333,0);
            if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
                world:createItemFromId( 2588, notCreated, User.pos, true, 333 ,0);
                base.common.InformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.");
            else
                User:startAction( GenWorkTime(User,"fireing bricks"), 0, 0, 0, 0 );
            end
            --User:learn(2,"fireing bricks",2,100);
			--Replace with new learn function, see learn.lua 
            base.common.GetHungry( User, 300 );
            didSomething = true;
        elseif (User:countItemAt("belt",26)>0) then
            if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                User:startAction( GenWorkTime(User,"fireing bricks"), 0, 0, 0, 0 );
                User:talkLanguage( Character.say, Player.german, "#me beginnt Ziegel zu brennen.");
                User:talkLanguage( Character.say, Player.english, "#me starts to fire bricks.");
                return              
            end
            if base.common.IsInterrupted( User ) then
                local selectMessage = math.random(1,4);
                if ( selectMessage == 1 ) then
                    base.common.InformNLS(User,
                    "Du wischst dir den Schweiß von der Stirn.",
                    "You wipe sweat off your forehead.");
                elseif ( selectMessage == 2 ) then
                    base.common.InformNLS(User,
                    "Du bekommst den Ziegel nicht aus der Form und musst deshalb stark auf die Form klopfen bis er heraus fällt.",
                    "A brick refuses to come out of the mould, it takes some time for you to get it out.");
                elseif ( selectMessage == 3 ) then
                    base.common.InformNLS(User,
                    "Bevor du weiter machst reinigst du deine Hände kurz vom feuchten Lehm der an den Fingern klebt.",
                    "You wash your hands of the wet clay.");
                else
                    base.common.InformNLS(User,
                    "Du holst einen Stein aus dem Lehm. Zum Glück hast du ihn noch vor dem brennen bemerkt, sonst wäre der Ziegel bestimmt gebrochen.",
                    "You fish out a stone from the wet clay.");
                end
                return
            end
            User:eraseItem(26,1);
            notCreated = User:createItem(736,1,333,0);
            if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
                world:createItemFromId( 736, notCreated, User.pos, true, 333 ,0);
                base.common.InformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.");
            else
                User:startAction( GenWorkTime(User,Skill.firingBricks), 0, 0, 0, 0 );
            end
            --User:learn(2,"fireing bricks",2,100);
			--Replace with new learn function, see learn.lua 
            base.common.GetHungry( User, 200 );
            didSomething = true;
        elseif toolFound then
            missingRess = base.common.GetNLS(User,
            "Du brauchst Sand und Asche und Glasblöcke herzustellen oder Lehm und ungebrannte Ziegel um Ziegel zu fertigen.",
            "You need sand and ash to make glas ingots or clay and unfired bricks to make bricks.");
        else
            missingRess = base.common.GetNLS(User,
            "Du brauchst Lehm und ungebrannte Ziegel um Ziegel zu fertigen.",
            "You need clay and unfired bricks to make bricks.");
        end
        if didSomething then
            local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
            if ((Tool == nil) or (Tool.id ~= 734)) then -- Wenn das Item nicht die Zange ist
                Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
            end
            if base.common.ToolBreaks( User, Tool ) then -- Zange beschädigen
                base.common.InformNLS( User, 
                "Deine Ziegelform geht zu bruch.", 
                "Your brick mold breaks." );
                return
            end
        end
        toolFound = true;
    end
    
    if not toolFound then
        base.common.InformNLS(User,
        "Du brauchst ein Glasblasrohr oder eine Ziegelform um hier zu arbeiten.",
        "You need a glasblowpipe or a brick mold to work here.");
    else
        User:inform(missingRess);
    end
end

function GenWorkTime(User,Skill)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = User:getSkill(Skill);     -- Edelstein schleifen: 0 - 100
    
    return math.floor(-0.3 * (Attrib + Skill) + 50);
end
