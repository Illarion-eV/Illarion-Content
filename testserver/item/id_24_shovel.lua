-- UPDATE common SET com_script='item.id_24_shovel' WHERE com_itemid=24;

require("base.common")
require("item.general.metal")
require("base.treasure")
require("content.gathering")

module("item.id_24_shovel", package.seeall, package.seeall(item.general.metal))

LookAtItem = item.general.metal.LookAtItem

function UseItem( User, SourceItem, TargetItem, ltstate )
	content.gathering.InitGathering();
	-- the craft has to be determined according to ground type, see below
	if ( StoneList == nil ) then
		StoneList={ 914, 915, 1245, 1246, 1273, 1276 };
	end
	
	local TargetPos = base.common.GetFrontPosition(User);
	local groundTile = world:getField( TargetPos ):tile();
    local groundType = base.common.GetGroundType( groundTile );
	local gt = base.common.GroundType;

	base.common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
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

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end
	
	if (SourceItem:getType() ~= 4) then -- tool in Hand
		base.common.HighInformNLS( User,
		"Du musst die Schaufel in der Hand haben!",
		"You have to hold the shovel in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, TargetPos ) then -- check looking direction
		base.common.TurnTo( User, TargetPos ); -- turn if necessary
	end
	
	-- first check for a treasure
	if (groundType ~= gt.rocks) and
			base.treasure.DigForTreasure( User, TargetPos, (User:getSkill(Character.mining)/10)+1,
			base.common.GetNLS( User,
				"Du gräbst mit deiner Schaufel in den Boden und stößt auf etwas hartes, von dem ein hölzerner Klang ausgeht. Noch einmal graben und du hältst den Schatz in deinen Händen.",
				"You dig with your shovel into the ground and hit suddenly something hard and wooden sounding. You only have to dig another time to get the treasure." ),
			false ) then
		return;
    end
	
	-- neither sand nor dirt => find nothing
    if (( groundType ~= gt.sand ) and ( groundType ~= gt.dirt )) then
        if ( groundType == gt.field ) then
            base.common.HighInformNLS( User,
            "Du gräbst ein kleines Loch in den Ackerboden doch findest du hier gar nichts.",
            "You dig a small hole into the farming ground. But you find nothing.");
        elseif ( groundType == gt.forest ) then
            base.common.HighInformNLS( User,
            "Du gräbst ein kleines Loch in den Waldboden doch findest du hier gar nichts.",
            "You dig a small hole into the forest ground. But you find nothing.");
        elseif ( groundType == gt.grass ) then
            base.common.HighInformNLS( User,
            "Du gräbst ein kleines Loch in die Wiese doch findest du hier gar nichts.",
            "You dig a small hole into the grass. But you find nothing.");
        elseif ( groundType == gt.rocks ) then
            base.common.HighInformNLS( User,
            "Der Boden besteht hier aus solidem Stein. Mit einer Schaufel hast du eindeutig das falsche Werkzeug.",
            "The ground here is heavy stone. With a shovel you have the wrong tool here for sure.");
        elseif ( groundType == gt.water ) then
            base.common.HighInformNLS( User,
            "Im Wasser mit einer Schaufel zu graben geht zwar relativ leicht, doch der Effekt ist recht gering.",
            "To dig with a shovel in the water is pretty easy. But sadly there is no effect in doing this.");
        else
            base.common.HighInformNLS(User,
            "Du versuchst an dieser Stelle zu graben, findest aber nichts.",
            "You attempt to dig here, but you don't find anything.");
        end
        return
    end
	
	-- since we're here, we're digging in sand or dirt
	
	-- check location, only succeed if there is a stone / water nearby
	if not LocationCheck(TargetPos,groundType, User) then
        if ( groundType == gt.sand ) then
            base.common.HighInformNLS( User,
            "Der Wind hat hier allen Sand fortgeweht. Vielleicht solltest du es in der Nähe eines Steins versuchen.",
            "The wind has blown away the whole sand. Maybe you should try it somewhere near a rock." );
            return
        else
            base.common.HighInformNLS( User,
            "Der Boden ist hier nicht feucht genug. Vielleicht solltest du es in der Nähe von Wasser versuchen.",
            "The ground is not wet enough here. Maybe you should try it somewhere near water." );
            return
        end
    end
	
	local theCraft;
	local digForDE, digForEN, digForID;
	if ( groundType == gt.sand ) then
		theCraft = content.gathering.sanddigging;
		digForDE = "Sand";
		digForEN = "sand";
		digForID = 726;
	else
		theCraft = content.gathering.claydigging;
		digForDE = "Lehm";
		digForEN = "clay";
		digForID = 26;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,SourceItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt nach " .. digForDE .. " zu graben.");
		User:talkLanguage( Character.say, Player.english, "#me starts to dig for " .. digForEN .. "."); 
		return
	end

	-- since we're here, we're working

	if theCraft:FindRandomItem(User) then
		return
	end

	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], 20);
	local amount = math.random(1,4); -- set the amount of items that are produced
	local notCreated = User:createItem( digForID, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( digForID, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten.",
		"You can't carry any more.");
	else -- character can still carry something
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,SourceItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schaufel zerbricht.",
		"Your old shovel breaks.");
		return
	end
end

function LocationCheck(TargetPos,DigginType, User)
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
    elseif (DigginType == gt.dirt) then
		-- check for nearby water tiles
		local waterCount = 0;
		local testPos;
        for Xoff=-1, 1 do
            for Yoff=-1, 1 do
                testPos=position( TargetPos.x+Xoff, TargetPos.y+Yoff, TargetPos.z );
				if ( base.common.GetGroundType(world:getField(testPos):tile()) == gt.water ) then
					waterCount = waterCount + 1;
                end
				if waterCount >= 2 then
					return true;
				end
            end
        end
        return false;
    end
    return false
end
