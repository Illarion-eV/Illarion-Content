-- Werkbank

-- Holzstücke zu Brettern

-- Arbeitscyclus: 2s - 5s
-- Zusätzliches Werkzeug: Säge ( 9 )

-- UPDATE common SET com_script='item.id_724_workbench' WHERE com_itemid IN (724,725);

require("base.common")

module("item.id_724_workbench", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate );
    if (Woodlist==nil) then
        Woodlist= { };
        Woodlist[   3]=2543; --Nadelholz
        Woodlist[ 543]= 545; --Kirschholz
        Woodlist[ 544]= 546; --Naldorholz
        Woodlist[2560]=2716; --Apfelholz
    end
    
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Holz sägen.",
        "Your armour disturbs while sawing wood." );
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then -- Sicherheitscheck
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then -- Blickrichtung
        base.common.TurnTo( User, SourceItem.pos ); -- Drehen wenn nötig
    end
    
    if (User:countItemAt("body",9)==0) then -- Säge
        base.common.InformNLS( User,
        "Du benötigst eine Säge um das Holz zu zersägen.",
        "You need a saw to saw the wood." );
        return
    end
    
    local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 9)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
    end
    
    if base.common.ToolBreaks( User, Tool, true ) then -- Zange beschädigen
        base.common.InformNLS( User, 
        "Die Säge wird stumpf.", 
        "The saw wents blunt" );
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

    if not base.common.FitForWork( User ) then -- Kein Hunger
        return
    end
    
    for i, Wood in pairs(Woodlist) do -- Edelsteine Absuchen
        if (User:countItemAt("belt",i)>0) then -- Holz gefunden
            if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                --User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
                User:startAction( GenWorkTime(User), 0, 0, 11, 25 );
                User:talkLanguage( Character.say, Player.german, "#me beginnt Bretter zu sägen.");
                User:talkLanguage( Character.say, Player.english, "#me starts to saw logs into boards.");
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
                    "Du bekommst einige Späne in den Mund und mußt husten.",
                    "A cloud of fine splints makes you cough.");
                elseif ( selectMessage == 3 ) then
                    base.common.InformNLS(User,
                    "Du überprüfst kurz die Maße des Brettes.",
                    "You briefly check the measurements of the board.");
                elseif ( selectMessage == 4 ) then
                    base.common.InformNLS(User,
                    "Du bekommst einen Holzsplitter in den Finger und mußt Pause machen, um ihn zu entfernen.",
                    "A splinter pierces your finger. You have to take a break to remove it.");
                else
                    base.common.InformNLS(User,
                    "Du bekommst einige Sägespäne ins Auge und reibst dir kurz die Augen.",
                    "Fine splints make you rub your eyes.");
                end
                return
            end;
            
            User:eraseItem(i,1); -- Holz Scheite entfernen
            notCreated = User:createItem(Wood,1,333,0); -- Holzbretter erstellen
            if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
                world:createItemFromId( Wood, notCreated, User.pos, true, 333 ,0);
                base.common.InformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.");
            else
                User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
            end
            --User:learn(2,"carpentry",2,20); -- Lernen
			--Replace with new learn function, see learn.lua 
            base.common.GetHungry( User, 200 ); -- Hunger
            return
        end
    end
    if (ltstate ~= Action.success) then
        base.common.InformNLS( User, 
        "Du hast kein Holz das du zersägen könntest.", 
        "You don't have any wood you could saw." );
    end
end

-- Arbeitszeit generieren
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = User:getSkill(Character.carpentry);     -- Edelstein schleifen: 0 - 100
    
    return math.floor(-0.3 * (Attrib + Skill) + 50);
end
