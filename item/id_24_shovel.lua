-- mining mit Schaufel

-- Arbeitscyclus: 1s - 4s

-- UPDATE common SET com_script='item.id_24_shovel' WHERE com_itemid=24;

require("base.common")
require("item.general.metal")
require("base.treasure")
require("content.gathering")

module("item.id_24_shovel", package.seeall, package.seeall(item.general.metal))

function UseShovelWithField( User, SourceItem, TargetPos, ltstate )
    base.common.ResetInterruption( User, ltstate );
    if (StoneList==nil) then
        StoneList={ 914, 915, 1245, 1246, 1273, 1276 };
        foundTreasureAt = {};
    end

	-- old Illarion: graveyard
    -- if equapos( position( 99, 40, 0 ), TargetPos ) then
        -- User:warp( position( 99, 40, -3 ) );
        -- base.common.InformNLS(User,
        -- "Du gräbst ein Loch und der Boden bricht unter dir weg und so fällst du in eine Höhle",
        -- "You dig a hole and the ground under you collapses and you fall into a cave..." );
        -- return
    -- end

    local groundTile = world:getField( TargetPos ):tile();
    local GroundType = base.common.GetGroundType( groundTile );
	local gt = base.common.GroundType;

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

    if ( SourceItem:getType() ~= 4 ) then
        base.common.InformNLS( User,
        "Nimm die Schaufel fest in beide Hände.",
        "Take the shovel firmly in your hands." );
        return
    end

    if not base.common.CheckItem( User, SourceItem ) then
        return
    end

    if (GroundType ~= gt.rocks) and
			base.treasure.DigForTreasure( User, TargetPos, (User:getSkill("mining")/10)+1,
			base.common.GetNLS( User,
				"Du gräbst mit deiner Schaufel in den Boden und stößt auf etwas hartes, von dem ein hölzerner Klang ausgeht. Noch einmal graben und du hältst den Schatz in deinen Händen.",
				"You dig with your shovel into the ground and hit suddenly something hard and wooden sounding. You only have to dig another time to get the treasure." ),
			false ) then
		return;
    end

	-- neither sand nor dirt => find nothing
    if (( GroundType ~= gt.sand ) and ( GroundType ~= gt.dirt )) then
        if ( GroundType == gt.field ) then
            base.common.InformNLS( User,
            "Du gräbst ein kleines Loch in den Ackerboden doch findest du hier gar nichts.",
            "You dig a small hole into the farming ground. But you find nothing.");
        elseif ( GroundType == gt.forest ) then
            base.common.InformNLS( User,
            "Du gräbst ein kleines Loch in den Waldboden doch findest du hier gar nichts.",
            "You dig a small hole into the forest ground. But you find nothing.");
        elseif ( GroundType == gt.gras ) then
            base.common.InformNLS( User,
            "Du gräbst ein kleines Loch in die Wiese doch findest du hier gar nichts.",
            "You dig a small hole into the grass. But you find nothing.");
        elseif ( GroundType == gt.rocks ) then
            base.common.InformNLS( User,
            "Der Boden besteht hier aus solidem Stein. Mit einer Schaufel hast du eindeutig das falsche Werkzeug.",
            "The ground here is heavy stone. With a shovel you have the wrong tool here for sure.");
        elseif ( GroundType == gt.water ) then
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
    if not LocationCheck(TargetPos,GroundType) then
        if ( GroundType == gt.sand ) then
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
	
	local theCraft;
	if ( GroundType == gt.sand ) then
		theCraft = content.gathering.sanddigging;
	else
		theCraft = content.gathering.claydigging;
	end
	
    if ( ltstate == Action.none ) then
        User:startAction( theCraft:GenWorkTime(User,SourceItem), 0, 0, 0, 0);
        if ( GroundType == gt.sand ) then
            User:talkLanguage( Character.say, Player.german, "#me beginnt nach Sand zu graben.");
            User:talkLanguage( Character.say, Player.english, "#me starts to dig for sand.");
        else
            User:talkLanguage( Character.say, Player.german, "#me beginnt nach Lehm zu graben.");
            User:talkLanguage( Character.say, Player.english, "#me starts to dig for clay.");
        end
        return
    end
	
	if not theCraft:FindRandomItem(User) then
		return;
	end

	User:learn( theCraft.LeadSkill, theCraft.LeadSkillGroup, theCraft.Movepoints, 50, User:increaseAttrib(theCraft.LeadAttribute,0) );
	
    local Skill = User:getSkill( theCraft.LeadSkill );
    gem1, str1, gem2, str2=base.common.GetBonusFromTool(SourceItem);
    step=0;
    if gem1==3 then     --ruby gives skill
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    Skill=Skill+step;
    if not checkSuccess( User, Skill, theCraft.LeadAttribute ) then
        User:startAction( theCraft:GenWorkTime(User,SourceItem), 0, 0, 0, 0);
        return
    end
    local numberSand=getNumb( User, Skill, theCraft.LeadAttribute );
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
    User:startAction( theCraft:GenWorkTime(User,SourceItem), 0, 0, 0, 0);
end

function getNumb( Char, skillValue, attrib )
    UAttrib=Char:increaseAttrib( attrib, 0 );
    return math.max(1, math.ceil( math.random( math.ceil(( skillValue+UAttrib*2 )/30 )) ) );
end

function checkSuccess( Char, skillValue, attrib )
    local usertest= 0.46*(2*Char:increaseAttrib( attrib, 0 )+skillValue)+30;
    if ( usertest > math.random( 0, 100 )) then
        return true
    else
        return false
    end
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	UseShovelWithField( User, SourceItem, base.common.GetFrontPosition( User ), ltstate );
end

function LocationCheck(TargetPos,DigginType)
    local gt = base.common.GroundType;
	if (DigginType == gt.sand) then
		-- check for a nearby stone
        local testPos;
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
    elseif (DigginType == base.common.GroundType.dirt)
		-- check for nearby water tile
		local testPos;
        for Xoff=-1, 1 do
            for Yoff=-1, 1 do
                testPos=position( TargetPos.x+Xoff, TargetPos.y+Yoff, TargetPos.z );
				if ( base.common.GetGroundType(world:getField(TargetPos)) == gt.water ) then
					return true;
                end
            end
        end
        return false;
    end
    return false
end
