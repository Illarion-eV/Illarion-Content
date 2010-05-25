-- mining mit Schaufel

-- Arbeitscyclus: 1s - 4s

-- UPDATE common SET com_script='I_24_schaufel.lua' WHERE com_itemid=24;

require("base.common")
dofile( "base_lookat.lua" );
require("base.treasure")

function UseItemWithField( User, SourceItem, TargetPos, Counter, Param, ltstate )
    base.common.ResetInterruption( User, ltstate );
    if (StoneList==nil) then
        StoneList={ 914, 915, 1245, 1246, 1273, 1276 };
        foundTreasureAt = {};
    end

    if equapos( position( 99, 40, 0 ), TargetPos ) then
        User:warp( position( 99, 40, -3 ) );
        base.common.InformNLS(User,
        "Du gräbst ein Loch und der Boden bricht unter dir weg und so fällst du in eine Höhle",
        "You dig a hole and the ground under you collapses and you fall into a cave..." );
        return
    end

    local groundTile = world:getField( TargetPos ):tile();
    local GroundType = base.common.GetGroundType( groundTile );

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

    if ( SourceItem:getType() ~= 4 ) then
        base.common.InformNLS( User,
        "Nimm die Schaufel fest in beide Hände.",
        "Take the shovel firmly in your hands." );
        return
    end

    if not base.common.CheckItem( User, SourceItem ) then
        return
    end

    if (GroundType ~= 5) and base.treasure.DigForTreasure( User, TargetPos, (User:getSkill("mining")/10)+1,
                                                base.common.GetNLS( User,
                                                    "Du gräbst mit deiner Schaufel in den Boden und stößt auf etwas hartes, von dem ein hölzerner Klang ausgeht. Noch einmal graben und du hältst den Schatz in deinen Händen.",
                                                    "You dig with your shovel into the ground and hit suddenly something hard and wooden sounding. You only have to dig another time to get the treasure." ), false ) then
        return;
    end

    if (( groundTile ~= 3 ) and ( groundTile ~= 8 )) then
        if ( GroundType == 1 ) then
            base.common.InformNLS( User,
            "Du gräbst ein kleines Loch in den Ackerboden doch findest du hier gar nichts.",
            "You dig a small hole into the farming ground. But you find nothing.");
        elseif ( GroundType == 2 ) then
            base.common.InformNLS( User,
            "Du gräbst ein kleines Loch in den Waldboden doch findest du hier gar nichts.",
            "You dig a small hole into the forest ground. But you find nothing.");
        elseif ( GroundType == 4 ) then
            base.common.InformNLS( User,
            "Du gräbst ein kleines Loch in die Wiese doch findest du hier gar nichts.",
            "You dig a small hole into the grass. But you find nothing.");
        elseif ( GroundType == 5 ) then
            base.common.InformNLS( User,
            "Der Boden besteht hier aus solidem Stein. Mit einer Schaufel hast du eindeutig das falsche Werkzeug.",
            "The ground here is heavy stone. With a shovel you have the wrong tool here for sure.");
        elseif ( GroundType == 6 ) then
            base.common.InformNLS( User,
            "Im Wasser mit einer Schaufel zu graben geht zwar relativ leicht, doch der Effekt ist recht gering.",
            "To dig with a shovel in the water is pretty easy. But sadly there is no effect in doing this.");
        else
            base.common.InformNLS(User,
            "Du versuchst an dieser Stelle zu graben, findest aber nichts.",
            "You attempt to dig here, but you don't find anything.");
        end
        return
    end

    if base.common.ToolBreaks( User, SourceItem, true) then
        base.common.InformNLS(User,
        "Die alte und abgenutzte Schaufel in deinen Händen zerbricht.",
        "The old and used shovel in your hands breaks.");
        return
    end

    if not base.common.IsLookingAt( User, TargetPos ) then
        base.common.TurnTo( User, TargetPos );
    end
    if not LocationCheck(TargetPos,groundTile) then
        if ( groundTile == 3 ) then
            base.common.InformNLS( User,
            "Der Wind hat hier allen Sand fortgeweht.",
            "The wind has blown away the whole sand." );
            return
        else
            base.common.InformNLS( User,
            "Der Boden ist hier nicht feucht genug.",
            "The ground is not wet enough here." );
            return
        end
    end
    if ( ltstate == Action.none ) then
        User:startAction( GenWorkTime(User,SourceItem), 0, 0, 0, 0);
        if ( world:getField( TargetPos ):tile() == 3 ) then
            User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt nach Sand zu graben.");
            User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts to dig for sand.");
        else
            User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt nach Lehm zu graben.");
            User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts to dig for clay.");
        end
        return
    end

	if ( groundTile == 3 ) then
		if not sanddigging:FindRandomItem(User) then
			return;
		end
	else
		if not claydigging:FindRandomItem(User) then
			return;
		end
	end

    User:learn( 2, "mining", 2, 50 );
    local Skill = User:getSkill( "mining" );
    gem1, str1, gem2, str2=getBonusFromItem(SourceItem);
    step=0;
    if gem1==3 then     --ruby gives skill
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    Skill=Skill+step;
    if not checkSuccess( User, Skill ) then
        User:startAction( GenWorkTime(User,SourceItem), 0, 0, 0, 0);
        return
    end
    local numberSand=getNumb( User, Skill );
    if ( world:getField( TargetPos ):tile() == 3 ) then
        ItemID = 726;
    else
        ItemID = 26;
    end
    local left = User:createItem(ItemID,numberSand,333,0);
    if (left<0) then
        world:createItemFromId( ItemID, numberSand, User.pos, true, 333 ,0);
        if ( world:getField( TargetPos ):tile() == 3 ) then
            base.common.InformNLS(User,
            "Du kannst nicht noch mehr Sand halten und er rieselt zu Boden.",
            "You can't carry more sand and it falls to the ground.");
        else
            base.common.InformNLS(User,
            "Du kannst nicht noch mehr Lehm halten und er fällt zu Boden.",
            "You can't carry more clay and it falls to the ground.");
        end
    end
    User:startAction( GenWorkTime(User,SourceItem), 0, 0, 0, 0);
end

function getNumb( Char, skillValue )
    UPerc=Char:increaseAttrib( "perception", 0 );
    return math.max(1, math.ceil( math.random( math.ceil(( skillValue+UPerc*2 )/30 )) ) );
end

function checkSuccess( Char, skillValue )
    local usertest= 0.46*(2*Char:increaseAttrib( "dexterity", 0 )+skillValue)+30;
    if ( usertest > math.random( 0, 100 )) then
        return true
    else
        return false
    end
end


-- dig out a tree stump
function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    if (listofstumps == nil) then
        listofstumps = {125,309,541,542,584,585,587};
    end

    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        TargetItem = base.common.GetFrontItem( User );
    end

    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        UseItemWithField( User, SourceItem, base.common.GetFrontPosition( User ), Counter, Param, ltstate );
        return
    end

    local stumpOkay = false;
    for i,stumpID in listofstumps do
        if (stumpID == TargetItem.id) then
            stumpOkay = true;
        end
    end

    if not stumpOkay then
        UseItemWithField( User, SourceItem, TargetItem.pos, Counter, Param, ltstate );
        return
    end

    if not base.common.FitForWork( User ) then
        base.common.InformNLS( User, "Du bist zu hungrig um jetzt große Arbeit zu verrichten.", "You are too hungry to do heavy work. " );
        return
    end

    if ( SourceItem:getType() ~= 4 ) then
        base.common.InformNLS( User, "Nimm die Schaufel fest in beide Hände.", "Take the shovel firmly in your hands." );
        return
    end

    if not base.common.IsLookingAt( User, TargetItem.pos ) then
        base.common.TurnTo( User, TargetItem.pos );
    end

    local skill = User:getSkill( "lumberjacking" )+ User:increaseAttrib( "strength", 0 );
    if ( skill > math.random( 100 ) ) then
        world:erase( TargetItem, 1 )
        if ( math.random(1) == 1 ) then
            	world:createItemFromId( 152, 1, TargetItem.pos, true, 999 ,0);
            	base.common.InformNLS(User,
            	"Unter dem Baumstumpf findest du seltsame Wurzeln.",
            	"Below the tree stump you find strange roots.");
        end
    else
        base.common.InformNLS( User, "Die Wurzeln sind stark und tief und halten deiner Kraft stand.", "This roots are deep and strong. They resist you strength." );
    end
    User:learn( 2, "lumberjacking", 2, 50 )
    base.common.GetHungry( User, 200 );
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 1, false, false ));
end

-- Arbeitszeit generieren
function GenWorkTime(User,toolItem)
    local Attrib = User:increaseAttrib("constitution",0); -- Geschicklichkeit: 0 - 20
    local Skill  = math.min(100,User:getSkill("mining")*5);     -- Schneidern: 0 - 100

    gem1, str1, gem2, str2=base.common.GetBonusFromTool(toolItem);
    step=0;
    if gem1==3 then     -- ruby modifies skill!
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    Skill=Skill+step;
    step=0;
    if gem1==6 then     -- amethyst modifies time needed
        step=str1;
    end
    if gem2==6 then
        step=step+str2;
    end
    step=step*1.75;
    return math.floor((-0.25 * (Attrib + Skill) + 40)*(100-step)/100);
end

function LocationCheck(TargetPos,DigginType)
    if (DigginType == 3) then -- sand
        local testPos;
        local foundStone = false;
        for Xoff=-1, 1 do
            for Yoff=-1, 1 do
                testPos=position( TargetPos.x+Xoff, TargetPos.y+Yoff, TargetPos.z );
                if world:isItemOnField( testPos ) then
                    for i, stoneID in pairs(StoneList) do
                        if ( stoneID == world:getItemOnField( testPos ).id ) then
                            return true;
                        end
                    end
                end
            end
        end
        return false;
    else -- Lehm
        if ((( TargetPos.x > -409 ) and ( TargetPos.x < -257 ) and ( TargetPos.y > -245 ) and ( TargetPos.y < -187 )) or
        (( TargetPos.x >  114 ) and ( TargetPos.x <  178 ) and ( TargetPos.y > -129 ) and ( TargetPos.y <  -75 ))) then
            return true;
        else
            return false;
        end
    end
    return false
end