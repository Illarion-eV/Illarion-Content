-- Schleifstein ( 270 )

-- Rohe Edelsteine  --> geschliffene Edelsteine

-- Arbeitscyclus: 1s - 5s
-- Zusätzliches Werkzeug: Zange ( 2140 )

-- UPDATE common SET com_script='items.270_grindstone' WHERE com_itemid IN (270);

require("base.common");

module("items.270_grindstone", package.seeall())

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate )
    if (GemList==nil) then
        GemList= { };
        GemList[251]={ 7,197}; --Amethyst
        GemList[252]={ 5,283}; --Schwarzstein
        GemList[253]={10,284}; --Blaustein
        GemList[254]={60,285}; --Diamant
        GemList[255]={30, 46}; --Rubine
        GemList[256]={15, 45}; --Smaragd
        GemList[257]={45,198}; --Topas
    end
    
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert dabei Edelsteine zu schleifen.",
        "Your armor disturbes you grinding gems." );
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then -- Sicherheitscheck
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then -- Blickrichtung
        base.common.TurnTo( User, SourceItem.pos ); -- Drehen wenn nötig
    end
    
    if (User:countItemAt("body",2140)==0) then -- kleine Zange
        base.common.InformNLS( User,
        "Du benötigst eine kleine Zange um den Edelstein zu halten.",
        "You need small tongs to cut the gems." );
        return
    end
    
    local Tool = User:getItemAt(CCharacter.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 2140)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(CCharacter.right_tool); -- In anderer Hand nachsehen
    end
    
    if base.common.ToolBreaks( User, Tool ) then -- Zange beschädigen
        base.common.InformNLS( User, 
        "Die Zange bricht am Schleifstein ab.", 
        "The tongs break at the gem grinder." );
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
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
        return
    end

    if not base.common.FitForWork( User ) then -- Kein Hunger
        return
    end
    
    for i, Gem in GemList do -- Edelsteine Absuchen
        if (User:countItemAt("belt",i)>0) then -- Edelsteine gefunden
            if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                User:startAction( GenWorkTime(User,Gem[1]), 0, 0, 0, 0 );
                User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt Edelsteine zu schleifen.");
                User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts to cut gemstones.");
                return                
            end
            if base.common.IsInterrupted( User ) then
                base.common.InformNLS(User,
                "Der "..world:getItemName(Gem[2],0).." rutscht dir aus der Hand und fällt zu Boden. Du musst kurz suchen ehe du den Stein wieder findest.",
                "The "..world:getItemName(Gem[2],1).." slips out of your hand and falls down to the ground. You have to search for a moment to find it again.");
                return
            end
            User:eraseItem(i,1); -- Rohen Edelstein entfernen
            if CheckSuccess(User,Gem[1]) then -- Erfolgsprüfung
                local notCreated = User:createItem(Gem[2],1,333,0); -- geschliffenen Edelstein erstellen
                if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
                    world:createItemFromId( Gem[2], notCreated, User.pos, true, 333 ,0);
                    base.common.InformNLS(User,
                    "Du kannst nichts mehr halten.",
                    "You can't carry any more.");
                else
                    User:startAction( GenWorkTime(User,Gem[1]), 0, 0, 0, 0 );
                end
            else -- kein Erfolg
                base.common.InformNLS(User,
                "Der "..world:getItemName(Gem[2],0).." zerbröckelt in deinen Händen",
                "The "..world:getItemName(Gem[2],1).." breaks in your hands.");
                User:startAction( GenWorkTime(User,Gem[1]), 0, 0, 0, 0 );
            end
            User:learn(2,"gemcutting",2,100); -- Lernen
            base.common.GetHungry( User, 200 ); -- Hunger
            return
        end
    end
    if (ltstate ~= Action.success) then
        base.common.InformNLS( User, 
        "Du hast keinen Rohen Edelstein den du schleifen könntest.", 
        "You don't have a raw gemstone you could cut." );
    end
end

-- Erfolgsprüfung
function CheckSuccess(User,Difficulty) -- Erfolgsprüfung
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = User:getSkill("gemcutting");     -- Edelstein schleifen: 0 - 100
    
    local Try = 0.5 * (Attrib + Skill - Difficulty) + 20;
    
    if (math.random(0,100) <= Try) then
        return true;
    else
        return false;
    end
end

-- Arbeitszeit generieren
function GenWorkTime(User,Difficulty)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = User:getSkill("gemcutting");     -- Edelstein schleifen: 0 - 100
    
    return math.floor(-0.3 * (Attrib + Skill - Difficulty) + 50);
end