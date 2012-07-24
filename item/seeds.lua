-- base_seeds - sew seeds on fields
-- a number of seeds appears on the field dependent on user's skill
-- Nop & Nitram
require("base.common")

module("item.seeds", package.seeall)

-- UPDATE common SET com_script='item.seeds' WHERE com_itemid IN (259,291,534,2494,2917,728);

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

function SetSeeds( User, SourceItem, TargetPos, ltstate )
    content.gathering.InitGathering();
	local farming = content.gathering.farming;
    
    base.common.ResetInterruption(User, ltstate);
	if (ltstate == Action.abort) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex", 0) == 0) then
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
    
    if seedList == nil then
        seedList = {  };
		
		-- ID der Pflanze, Skill für 3 Pflanzen, Skill für 2 Pflanze, Skill für 1 Pflanze, anbaubar in {spring,summer,fall,winter}, Regionale Einschränkung x-Koord., Regionale Einschränkung Y-Koord.		
        
        seedList[  259 ] = { 
          246,50,30,10,              -- Getreide: -V247 -V248 (sense) -V249 ( Skript dreschen )- 246
          {true,true,true,false},
          {nil,nil},{nil,nil} }; 
           
        seedList[  291 ] = {
          288,30,15, 5,              -- Kohl: Fruchtfolge: 291  -V288 -V -V -291
          {true,true,true,false},
          {nil,nil},{nil,nil} }; 
              
        seedList[  534 ] = {
          535,40,30,10,
          {true,true,true,false},
          {nil,nil},{nil,nil} };     -- Zwiebeln: 535 - 536 - 537 (ernten)
          
        seedList[ 2494 ] = {
          2490,45,20,10,
          {true,true,true,false},
          {nil,nil},{nil,nil} };     -- Karotten: 2490 - 2491 - 2492 - 2493( fertige Möhren )
          
        seedList[ 2917 ] = { 
          538,10, 3, 0,
          {true,true,true,false},
          {nil,nil},{nil,nil} };      -- Tomaten: 538 - 539 - 540 (ernten)
          
        seedList[  728 ] = {
          729,30,10, 5,
          {true,true,true,false},
          {nil,nil},{nil,nil} };     -- Hopfen: 729 - 730 - 731 (Hopfen ernten) - 732 ( Wurzel ernten ) 

		seedList[  773 ] = {
          774,30,10, 5,
          {true,true,true,false},
          {nil,nil},{nil,nil} };     -- Tabak: 774 - 775 - 776 - 777 (Tabak ernten)

		seedList[  779 ] = {
          780,30,10, 5,
          {true,true,true,false},
          {nil,nil},{nil,nil} };     -- Zuckerrohr: 780 - 781 - 782 (Zuckerrohr ernten)
          
    end

    local seed = seedList[ SourceItem.id ];
    if( seed == nil ) then
        User:inform( "[Error] Unknown seed item. Please inform a developer." );
        return
    end
    
    local Field = world:getField( TargetPos )
    local boden = base.common.GetGroundType( Field:tile() );
    if ( boden ~= 1 ) then
        base.common.InformNLS(User,
        "Du kannst nur auf Ackerboden planzen.",
        "You can only plant on farm land.");
        return
    end
	
-- I see no use in "put seed in hands"-restrictions ~Estralis
--[[
    if ( SourceItem:getType() < 4 ) then
        base.common.InformNLS( User,
        "Du brauchst zur Aussaat Saatgut im Gürtel oder in der Hand.",
        "You'd better carry some seed in your belt or in your hands." );
        return
    end]]
    
    local month=world:getTime("month");
    local season=math.ceil(month/4);
    if not seed[5][season] then
            if (season == 1) then
                base.common.InformNLS(User,
                "Es ist noch zu kalt und es scheint zu wenig Sonne um das anzubauen.",
                "It's still too cold and there is not enough sun to plant this.");
            elseif (season == 2) then
                base.common.InformNLS(User,
                "Es ist viel zu warm um das anzubauen.",
                "It's much too warm to plant this.");
            elseif (season == 3) then
                base.common.InformNLS(User,
                "Es ist zu kalt um das anzubauen.",
                "It's much too cold to plant this.");
            elseif (season == 4) then
                base.common.InformNLS(User,
                "Der Boden ist tief gefroren. Hier wirst du nichts anbauen können.",
                "The ground is frozen deeply. You won't be able to plant anything here.");
            end
            return
    end

    if (seed[6][1] ~= nil) then
        if ((TargetPos.x < seed[6][1]) or (TargetPos.x > seed[6][2])) then
            base.common.InformNLS(User,
            "Diese Pflanze wird hier nicht wachsen.",
            "This plant won't grow here.");
            return
        end
    end
    
    if (seed[7][1] ~= nil) then
        if ((TargetPos.y < seed[7][1]) or (TargetPos.y > seed[7][2])) then
            base.common.InformNLS(User,
            "Diese Pflanze wird hier nicht wachsen.",
            "This plant won't grow here.");
            return
        end
    end

    if not base.common.FitForWork( User ) then
        return
    end
    
    if not base.common.IsLookingAt( User, TargetPos ) then
        base.common.TurnTo( User, TargetPos );
    end
    
    if (ltstate == Action.none) then -- user does nothing
        farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,nil,true);
		User:startAction(farming.SavedWorkTime[User.id], 0, 0, 0, 0);
        if farming.SavedWorkTime[User.id] > 10 then
            base.common.InformNLS(User, -- TODO
                "Du säst Saatgut aus.",
                "You sow seeds.");
        end
        return
    end
    
	if not farming:FindRandomItem(User) then
		return
	end
    
    local skillwert = User:getSkill( farming.LeadSkill );
    local chance = math.random( 100 );
      
    if( chance  < ( skillwert+seed[4] ) ) then
        world:createItemFromId( seed[1], 1, TargetPos, false, 233 ,3);
    elseif ( chance  < ( skillwert+seed[3] ) ) then
        world:createItemFromId( seed[1], 1, TargetPos, false, 233 ,2);
    elseif ( chance  < ( skillwert+seed[2] ) ) then
        world:createItemFromId( seed[1], 1, TargetPos, false, 233 ,1);
    end
    
    User:learn( farming.LeadSkill, farming.LeadSkillGroup, farming.SavedWorkTime[User.id], 100, User:increaseAttrib(farming.LeadAttribute,0) );
    world:erase( SourceItem, 1 );

    base.common.GetHungry( User, 100 );
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate)
    if ((TargetItem ~= nil) and (TargetItem.id ~= 0)) then
        if (TargetItem:getType() == 3) then
            if ((TargetItem.id == 2862) or (TargetItem.id == 2863)) then
                SetSeeds( User, SourceItem, base.common.GetFrontPosition(User), ltstate );
            end
        end
    else
        local TestItem = base.common.GetFrontItem( User );
        if ((TestItem ~= nil) and (TestItem.id ~= 0)) then
            if ((TestItem.id == 2862) or (TestItem.id == 2863)) then
                SetSeeds( User, SourceItem, base.common.GetFrontPosition(User), ltstate );
            end
        else
            SetSeeds( User, SourceItem, base.common.GetFrontPosition(User), ltstate );
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
