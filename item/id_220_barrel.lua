-- F‰rberfass ( 220 )

-- Stoffrolle (grau) + weiﬂe Farbe --> Stoffrolle (weiﬂ)
-- Stoffrolle (weiﬂ) + Farbe --> Stoffrolle (farbig)

-- Arbeitscyclus: 1s - 4s
-- Zus‰tzliches Werkzeug: F‰rberstab ( 2781 )

-- UPDATE common SET com_script='item.id_220_barrel' WHERE com_itemid IN (220);

require("base.common")

module("item.id_220_barrel", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate );
    if (dyersList == nil) then
        dyersList = { };
        dyersList[2678] = {178,175}; -- Schwarze Farbe
        dyersList[2679] = {178, 54}; -- Gr¸ne Farbe
        dyersList[2680] = {178,179}; -- Blaue Farbe
        dyersList[2681] = {178,174}; -- Rote Farbe
        dyersList[2682] = {178,177}; -- Gelbe Farbe
        dyersList[2683] = {176,178}; -- Weiﬂe Farbe
    end

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

    if base.common.Encumbrence(User) then -- Sehr streife R¸stung?
        base.common.InformNLS( User,
        "Deine R¸stung behindert beim f‰rben.",
        "Your armour disturbs you while dying." );
        return
    end

    if not base.common.IsLookingAt( User, SourceItem.pos ) then
        base.common.TurnTo( User, SourceItem.pos );
    end

    if not base.common.FitForWork( User ) then
        return
    end

    if (User:countItemAt("body",2781)==0) then -- Schere
        base.common.InformNLS( User,
        "Du benˆtigst einen F‰rberstab um Stoffe zu f‰rben oder zu bleichen.",
        "You need dyers wand to dye or white clothes." );
        return
    end

    local Tool = User:getItemAt(Character.left_tool); -- Item in Linker Hand auslesen
    if ((Tool == nil) or (Tool.id ~= 2781)) then -- Wenn das Item nicht die Zange ist
        Tool = User:getItemAt(Character.right_tool); -- In anderer Hand nachsehen
    end

    if base.common.ToolBreaks( User, Tool, true ) then -- R¸hrstab besch‰digen
        base.common.InformNLS( User,
        "Der F‰rberstab zerbricht.",
        "The dyers wand breaks." );
        return
    end

    for i, Dye in pairs(dyersList) do -- Farben Absuchen
        if (User:countItemAt("belt",i)>0) then -- Farbe gefunden
            if (User:countItemAt("belt",Dye[1])>0) then -- passenden Stoff gefunden
                if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                    User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
                    User:talkLanguage( Character.say, Player.german, "#me beginnt Stoff zu f‰rben.");
                    User:talkLanguage( Character.say, Player.english, "#me starts to dye clothes.");
                    return
                end
                UsedDye = nil;

                if base.common.IsInterrupted( User ) then
                    base.common.InformNLS(User,
                    "Der F‰rberstab f‰llt dir in den Farbeimer. Nach einigem suchen findest du ihn darin wieder. Die Qualit‰t deiner Farbe hast du gleich mal mit deinen H‰nden getestet.",
                    "You drop the dyers wand into the bucket with color. After a while of searching you find it again. You can see the quality of your color at your hands now.");
                    return
                end

                for ipos=12,17 do
                    dyeItem = User:getItemAt(ipos);
                    if (dyeItem.id == i) then
                        if (dyeItem.quality >= 100) then
                            UsedDye = dyeItem;
                            break;
                        end
                    end
                end

                    if (UsedDye ~= nil) then
                    if (UsedDye.quality <= 100) then
						UsedDye.quality = 333;
						UsedDye.data = 0;
						UsedDye.id = 51;
                        world:changeItem(UsedDye);
                    else
                        UsedDye.quality = UsedDye.quality - 100;
                        world:changeItem(UsedDye);
                    end

                    User:eraseItem(Dye[1],1);

                    notCreated = User:createItem(Dye[2],1,333,0); -- Gef‰rbten Stoff erstellen
                    if ( notCreated > 0 ) then
                        world:createItemFromId( Dye[2], notCreated, User.pos, true, 333 ,0);
                        base.common.InformNLS(User,
                        "Du kannst nichts mehr halten.",
                        "You can't carry any more.");
                    else
                        User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
                    end

                    --User:learn(2,"tailoring",2,100); -- Lernen
					--Replace with new learn function, see learn.lua 
                    base.common.GetHungry( User, 200 ); -- Hunger
                    return

                end
            end
        end
    end
    if (ltstate ~= Action.success) then
        base.common.InformNLS( User,
		"Zum F‰rben brauchst du weiﬂe Stoffe und Farbe.",
        "To dye cloth you need white cloth and dye." );
    end

end -- function

-- Arbeitszeit generieren
function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = math.min(100,User:getSkill(Skill.tailoring)*10);     -- Schneidern: 0 - 100

    return math.floor(-0.25 * (Attrib + Skill) + 40);
end
