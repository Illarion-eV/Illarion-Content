-- Harvest various fruits
require("base.common")
require("content.gathering")

module("item.harvest", package.seeall)

-- UPDATE common SET com_script='item.harvest' WHERE com_itemid IN (14,300,387, 1809);

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
    local fruitgathering = content.gathering.fruitgathering;

    --User:inform( "harvesting" );
    SourceItem = world:getItemOnField( SourceItem.pos );

    if( harvestItem == nil ) then
        --User:inform( "Init harvest" );
        harvestItem = {  };

        raceBonus = { 0, -20, 10, 5, 0, 0 };   -- malus for dwarfs, bonus for halflings and elves

        -- Format of entry: ground type, difficulty, product, followup item, available in seasons {spring,summer,fall,winter} (probability [0...10])
        -- ground types:
		-- -- all = 0
		-- -- Acker: = 1
        -- -- Wald:  = 2
        -- -- Sand:  = 3
        -- -- Wiese: = 4
        -- -- Fels:  = 5
        -- -- Wasser:= 6
        -- -- Dreck: = 7

        harvestItem[ 14 ] = {                        -- Apfelbaum
        { 0, 0, 15, 11, {5,8,10,0}, 81, 10 } };             -- Alle: Apfel

        harvestItem[ 300 ] = {                       -- Kirschbaum
        { 0, 0, 302, 299, {6,10,9,0}, 83, 20 } };           -- Alle: Kirsche
		
		harvestItem[ 1809 ] = {                        -- Eldan-Eiche
        { 0, 0, 759, 0, {5,0,10,10}, 83, 20 } };             -- Alle: N¸sse

        harvestItem[ 387 ] = {                       -- Strauch
        { 2, 0, 81,  386, {5,8,10,0}, 11,  5 },             -- Wald: Beeren
        { 3, 0, 199, 386, {6,10,9,0}, 11,  7 },             -- Sand: Mandarinen
        { 4, 0, 388, 386, {6,10,9,0}, 84, 10 } };           -- Wiese: Weintrauben
        --User:inform( "Init done" );
    end

    -- check orientation
    if not base.common.IsLookingAt( User, SourceItem.pos ) then
		base.common.TurnTo(User, SourceItem.pos);
    end

    --User:inform( "getting tile" );
    local GroundTile = world:getField( SourceItem.pos );

    local TileID = GroundTile:tile();
    local boden = base.common.GetGroundType( TileID );
    --User:inform( "tile is ".:tile()ID );
    --User:inform( "boden is "..boden );

    --User:inform( "getting skill" );

    -- get configuration for current item
    local harvestList = harvestItem[ SourceItem.id ];
    if harvestList == nil then
        User:inform( "unkown harvest item " );
        return
    end

    local chance = 0;
    local success = false;
    local groundok = false;

    month=world:getTime("month");
    if (month == 0) then
        month = 16;
    end
    season=math.ceil(month/4);

    -- go through all fruits
    for i, harvest in pairs(harvestList) do
        -- only on proper tile
        --User:inform( "checking tile" );
        if( harvest[ 1 ] == 0 or harvest[ 1 ] == boden ) then
            groundok = true;
        else
            groundok=false;
        end
        if groundok then
            
            if ( harvest[ 4 ] == 0 ) then
                if( harvest[ 5 ][ season ] >= math.random(10) ) then
                    success = true;
                else
                    success = false;
                end
            else
                success = true;
            end
            if (ltstate==Action.abort) then
            	return
            end
            if (ltstate==Action.none) then
                fruitgathering.SavedWorkTime[User.id] = fruitgathering:GenWorkTime(User,nil,true);
				User:talkLanguage(Character.say, Player.german, "#me f‰ngt an Fr¸chte zu sammeln.");
                User:talkLanguage(Character.say, Player.english,"#me starts to collect fruits.");
                User:startAction(fruitgathering.SavedWorkTime[User.id],0,0,0,0);
        		return
        	end
			
			if not fruitgathering:FindRandomItem(User) then
				return
			end
			
			-- harvest fruit
            if( success ) then
                -- Qualit‰t nach Zufall:
                QualWert = math.random(111,999)
                --User:inform( "creating harvest" );
                User:createItem( harvest[ 3 ], 1, QualWert, harvest[ 6 ] );

				-- always enough fruits on Noobia
				local onNoobia = false;
				if User.pos.z == 100 or User.pos.z == 101 then
					onNoobia = true;
				end

                -- replace item with follow up item
                if( harvest[ 4 ] ~= 0 ) then
                    if( harvest[ 4 ] > 0 ) then
                        if ( harvest[ 7 ] ~= nil ) then
                            -- always enough fruits
							if (SourceItem.data == 1) or ((harvest[ 5 ][ season ] == 0) and not onNoobia) then
                                SourceItem.id = harvest[ 4 ];
                                SourceItem.quality = QualWert;
                                SourceItem.data = 0;
                                SourceItem.wear = ( onNoobia and 1 or math.floor(-3.6 * harvest[ 5 ][ season ] + 42) );
                                world:changeItem(SourceItem);
                            else
                                if (SourceItem.data == 0) then
                                    SourceItem.data = harvest[ 7 ] - 2;
                                else
                                    SourceItem.data = SourceItem.data - 1;
                                end
                                world:changeItem(SourceItem);
                            end
                        else
                            SourceItem.id = harvest[ 4 ];
                            SourceItem.quality = QualWert;
                            SourceItem.wear = math.floor(2 * harvest[ 5 ][ season ] + 22);
                            world:changeItem(SourceItem);
                        end
                    else
                        world:erase( SourceItem, 1 );
                    end
                end
                
                User:learn( fruitgathering.LeadSkill, fruitgathering.LeadSkillGroup, fruitgathering.SavedWorkTime[User.id], 30, User:increaseAttrib(fruitgathering.LeadAttribute,0) );
            end
            if (SourceItem.data > 0) then
                fruitgathering.SavedWorkTime[User.id] = fruitgathering:GenWorkTime(User,nil,true);
            	User:startAction(fruitgathering.SavedWorkTime[User.id],0,0,0,0);
            end

            if( not success )then
                if( boden == 1 ) then
                    base.common.InformNLS( User,
                    "Deine H‰nde graben durch die Erde, aber Du findest nichts.",
                    "Your hands muckrake through the dirt, but you do not find anything." );
                elseif( boden == 2 ) then
                    base.common.InformNLS( User,
                    "Altes Laub und Nadeln sind alles was Du findest.",
                    "Dry leaves are all you find." );
                elseif( boden == 3 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts auﬂer trockenem Sand.",
                    "You find nothing but dry sand" );
                elseif( boden == 4 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts auﬂer Unkraut und Gras.",
                    "You find nothing but weed and grass." );
                else
                    base.common.InformNLS( User,
                    "Du findest nichts.",
                    "You  do not find anything." );
                end
            end

        end -- right tile
    end -- for harvestList
end
