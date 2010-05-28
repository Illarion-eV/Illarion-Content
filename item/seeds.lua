-- base_seeds - sew seeds on fields
-- a number of seeds appears on the field dependent on user's skill
-- Nop & Nitram
require("base.common")

module("item.id_seeds", package.seeall)

-- UPDATE common SET com_script='item.id_seeds' WHERE com_itemid IN (259,291,534,2494,2917,728);

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 247 WHERE com_itemid = 246;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 248 WHERE com_itemid = 247;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 246 WHERE com_itemid = 248;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 259 WHERE com_itemid = 259;

-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 289 WHERE com_itemid = 288;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 290 WHERE com_itemid = 289;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 291 WHERE com_itemid = 290;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 291 WHERE com_itemid = 291;

-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 536 WHERE com_itemid = 535;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 537 WHERE com_itemid = 536;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 534 WHERE com_itemid = 537;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 534 WHERE com_itemid = 534;

-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 2491 WHERE com_itemid = 2490;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 2492 WHERE com_itemid = 2491;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2494 WHERE com_itemid = 2492;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2494 WHERE com_itemid = 2494;

-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 539 WHERE com_itemid = 538;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 540 WHERE com_itemid = 539;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2917 WHERE com_itemid = 540;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2917 WHERE com_itemid = 2917;

-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 730 WHERE com_itemid = 729;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 731 WHERE com_itemid = 730;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 732 WHERE com_itemid = 731;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 732 WHERE com_itemid = 732;

function UseItemWithField( User, SourceItem, TargetPos, Counter, Param )
    if seedList == nil then
        seedList = {  };
		
		-- ID der Pflanze, Skill f�r 3 Pflanzen, Skill f�r 2 Pflanze, Skill f�r 1 Pflanze, anbaubar in {spring,summer,fall,winter}, Regionale Einschr�nkung x-Koord., Regionale Einschr�nkung Y-Koord.		
        
        seedList[  259 ] = { 
          246,50,30,10,              -- Getreide: -V247 -V248 (sense) -V249 ( Skript dreschen )- 246
          {true ,true,true ,false},
          {nil,nil},{nil,nil} }; 
           
        seedList[  291 ] = {
          288,30,15, 5,              -- Kohl: Fruchtfolge: 291  -V288 -V -V -291
          {false,true,true ,false},
          {nil,nil},{-100,500} }; 
              
        seedList[  534 ] = {
          535,40,30,10,
          {true ,true,true ,false},
          {nil,nil},{-500,-150} };     -- Zwiebeln: 535 - 536 - 537 (ernten)
          
        seedList[ 2494 ] = {
          2490,45,20,10,
          {false,true,true ,false},
          {nil,nil},{nil,nil} };     -- Karotten: 2490 - 2491 - 2492 - 2493( fertige M�hren )
          
        seedList[ 2917 ] = { 
          538,10, 3, 0,
          {false,true,false,false},
          {nil,nil},{0,500} };     -- Tomaten: 538 - 539 - 540 (ernten)
          
        seedList[  728 ] = {
          729,30,10, 5,
          {false,true,true ,false},
          {nil,nil},{nil,nil} };     -- Hopfen: 729 - 730 - 731 (Hopfen ernten) - 732 ( Wurzel ernten ) 

		seedList[  773 ] = {
          774,30,10, 5,
          {true,true,true,true},
          {-250,0},{-100,100} };     -- Tabak: 774 - 775 - 776 - 777 (Tabak ernten)

		seedList[  779 ] = {
          780,30,10, 5,
          {true,true,true,true},
          {-250,100},{-100,100} };     -- Zuckerrohr: 780 - 781 - 782 (Zuckerrohr ernten)
          
    end

    local seed = seedList[ SourceItem.id ];
    if( seed == nil ) then
        User:inform( "Unknown item" );
        return
    end
    
    local Field = world:getField( TargetPos )
    local boden = base.common.GetGroundType( Field:tile() );
    if ( boden ~= 1 ) then
        base.common.InformNLS(User,
        "Du kannst nur auf Ackerboden planzen.",
        "You can only plant on farm land");
        return
    end

    if ( SourceItem:getType() < 4 ) then
        base.common.InformNLS( User,
        "Du brauchst dazu Saatgut im G�rtel oder in der Hand.",
        "You'd better carry some seed in your belt or in your hands." );
        return
    end
    
    local month=world:getTime("month");
    local season=math.ceil(month/4);
    if not seed[5][season] then
            if (season == 1) then
                base.common.InformNLS(User,
                "Es ist noch zu kalt und es scheint zu wenig Sonne um das anzubauen.",
                "Its still too cold and there is not enough sun to plant this.");
            elseif (season == 2) then
                base.common.InformNLS(User,
                "Es ist viel zu warm um das anzubauen.",
                "Its much to warm to plant this.");
            elseif (season == 3) then
                base.common.InformNLS(User,
                "Es ist zu kalt um das anzubauen.",
                "Its much to cold to plant this.");
            elseif (season == 4) then
                base.common.InformNLS(User,
                "Der Boden ist tief gefroren. Hier wirst du nichts anbauen k�nnen.",
                "The ground is freezed deeply. You won't be able to plant anything here.");
            end
            return
    end

    if (seed[6][1] ~= nil) then
        if ((TargetPos.x < seed[6][1]) or (TargetPos.x > seed[6][2])) then
            base.common.InformNLS(User,
            "Das w�chst hier nicht.",
            "This doesn't grow here.");
            return
        end
    end
    
    if (seed[7][1] ~= nil) then
        if ((TargetPos.y < seed[7][1]) or (TargetPos.y > seed[7][2])) then
            base.common.InformNLS(User,
            "Das w�chst hier nicht.",
            "This doesn't grow here.");
            return
        end
    end

    if not base.common.FitForWork( User ) then
        return
    end
    
    if not base.common.IsLookingAt( User, TargetPos ) then
        base.common.TurnTo( User, TargetPos );
    end
    
    local skillwert = User:getSkill( "peasantry" );
    local chance = math.random( 100 );
      
    if( chance  < ( skillwert+seed[4] ) ) then
        world:createItemFromId( seed[1], 1, TargetPos, false, 233 ,3);
    elseif ( chance  < ( skillwert+seed[3] ) ) then
        world:createItemFromId( seed[1], 1, TargetPos, false, 233 ,2);
    elseif ( chance  < ( skillwert+seed[2] ) ) then
        world:createItemFromId( seed[1], 1, TargetPos, false, 233 ,1);
    end
    
    User:learn( 2, "peasantry", 2, 100 );
    world:erase( SourceItem, 1 );

    base.common.GetHungry( User, 100 );
end

function UseItem( User, SourceItem, TargetItem, Counter, Param)
    if ((TargetItem ~= nil) and (TargetItem.id ~= 0)) then
        if (TargetItem:getType() == 3) then
            if ((TargetItem.id == 2862) or (TargetItem.id == 2863)) then
                UseItemWithField( User, SourceItem, base.common.GetFrontPosition(User), Counter, Param );
            end
        end
    else
        local TestItem = base.common.GetFrontItem( User );
        if ((TestItem ~= nil) and (TestItem.id ~= 0)) then
            if ((TestItem.id == 2862) or (TestItem.id == 2863)) then
                UseItemWithField( User, SourceItem, base.common.GetFrontPosition(User), Counter, Param );
            end
        else
            UseItemWithField( User, SourceItem, base.common.GetFrontPosition(User), Counter, Param );
        end
    end
end

function MoveItemBeforeMove(User, SourceItem, TargetItem)
    if (SourceItem.data > 0) then
        User:createItem( SourceItem.id, SourceItem.number * SourceItem.data, 333, 0 );
	world:erase( SourceItem, SourceItem.number );
	return true;
    end
    return true;
end

---[[
function MoveItemAfterMove(User, SourceItem, TargetItem)
    if (SourceItem.data > 0) then
        world:erase( SourceItem, SourceItem.number );
    end
end
--]]
