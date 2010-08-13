-- Herblore mit Sichel und Ausbreitung der Pflanzen

-- UPDATE common SET com_script='item.id_126_sickle' WHERE com_itemid=126;

require("item.general.metal")
require("base.common")

module("item.id_126_sickle", package.seeall, package.seeall(item.general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	InitHerblore();
	
	base.common.ResetInterruption(User, ltstate);
	if (ltstate == Action.abort) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex", 0) == 0) then
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

    if not base.common.CheckItem(User, SourceItem) then -- Sicherheitscheck
        return
    end
    
	if ( ltstate == Action.success ) then         -- Unterbrechungsmeldungen
        if base.common.IsInterrupted( User ) then
            local selectMessage = math.random(1,5);
            if ( selectMessage == 1 ) then
                        base.common.InformNLS( User,
                        "Du wischst dir den Schweiß von der Stirn.",
                        "You wipe sweat off your forehead.");
                    elseif ( selectMessage == 2 ) then
                        base.common.InformNLS( User,
                        "Ein kleines pelziges Tier springt aus dem Gebüsch und rennt davon. Für einen Moment bist du fürchterlich erschrocken.",
                        "A small, furry critter jumps out of a bush and darts off. That really surprised you.");
                    elseif ( selectMessage == 3 ) then
                        base.common.InformNLS( User,
                        "Du greifst mit der Hand in eine Blattlauskolonie. Verärgert wischt du dir die Hand an der Hose ab.",
                        "The plant is crowded with lice. Annoyed, you wipe your hand clean on your trousers.");
                    elseif ( selectMessage == 4 ) then
                        base.common.InformNLS( User,
                        "Während du nach Kräutern suchst, verhakt sich deine Sichel und rutscht dir fast aus der Hand.",
            			"While searching for herbs your sickle gets stuck and it nearly slides out of your hand.");
					else
                        base.common.InformNLS( User,
                        "Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.",
                        "An annoying bug buzzes around your head. You strike at it in order to drive it away.");
            end
            return
        end
    end
    
    if base.common.Encumbrence(User) then    -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert dabei Kräuter zu sammeln.",
        "Your armor disturbes you collecting herbs." );
        return
    end
    	
	 if not base.common.BC_CheckItem( User, SourceItem ) then -- Sicherheitscheck
        return
    end

    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        TargetItem = base.common.BC_GetFrontItem( User );
    end

    if not TargetItem then
        base.common.BC_InformNLS( User,
        "Hier kannst du nichts finden.",
        "You can't find anything here.");
        return;
    end

    if not base.common.BC_IsLookingAt( User, TargetItem.pos ) then
        base.common.BC_TurnTo( User, TargetItem.pos );
    end

    local harvestList = harvestItem[ TargetItem.id ];
    if harvestList == nil then
        return
    end

    if ( SourceItem:getType() ~= 4 ) then
        base.common.BC_InformNLS( User,
        "Du musst die Sichel in der Hand haben um damit zu arbeiten",
        "You have to hold the sickle in your hand to work with it.");
        return
    end

    local GroundTile = world:getField( TargetItem.pos );

    local TileID = GroundTile:tile();
    local boden = base.common.BC_GetGroundType( TileID );

    local skill = User:getSkill( "herb lore" );

    --gem1, str1, gem2, str2=base.common.BC_GetBonusFromTool(SourceItem);
    --step=0;
    --if gem1==3 then     -- ruby modifies skill!
    --    step=str1;
    --end
    --if gem2==3 then
    --    step=step+str2;
    --end
    --skill=skill+step;

    --month=world:getTime("month");
    --if (month == 0) then
        month = 16;
    --end
    season=math.ceil(month/4);

    for i, harvest in pairs(harvestList) do
        groundok=false;
        if( harvest[ 1 ] == 0 or harvest[ 1 ] == boden ) then
            groundok = true;
        elseif ( harvest[ 1 ] < 0 ) then
            if SearchTileInRange( harvest[ 1 ] * ( -1 ), 3, TargetItem.pos ) then
                groundok = true;
            end
        end
        if groundok then

            if base.common.BC_ToolBreaks( User, SourceItem ) then -- Zange beschädigen
                base.common.BC_InformNLS( User,
                "Die Sichel zerbricht.",
                "The sickle breaks." );
                return
            end

            if not base.common.BC_FitForWork( User ) then
                return false;
            end

            success = false;
            if ( harvest[ 2 ] == 0 ) and ( harvest[ 4 ] ~= 0 ) then
                success = true;
            elseif ( harvest[ 2 ] > skill ) then
                success = false;
		skilluse=1;
	        base.common.BC_InformNLS( User,
                      "Deine Kenntnisse in der Kräuterkunde sind nicht ausreichend, um hier etwas Brauchbares zu sammeln.",
                      "Your knowlege in herblore is not sufficiently to collect herbs here.");
            elseif ( harvest[ 4 ] ~= 0 ) then
                if( math.random( 100 ) < 80 ) then
                    success = true;
                end
            elseif ( harvest[ 4 ] == 0 ) then
                if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                    User:startAction(content.gathering.herbgathering:GenWorkTime(User,SourceItem), 0, 0, 0, 0 );
                    User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt nach Kräutern zu suchen.");
                    User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts to search for herbs.");
                    return
                end

                if base.common.BC_IsInterrupted( User ) then
                    local selectMessage = math.random(1,4);
                    if ( selectMessage == 1 ) then
                        base.common.BC_InformNLS(User,
                        "Du wischst dir den Schweiß von der Stirn.",
                        "You wipe sweat off your forehead.");
                    elseif ( selectMessage == 2 ) then
                        base.common.BC_InformNLS(User,
                        "Ein kleines pelziges Tier springt aus dem Gebüsch und rennt davon. Für einen Moment bist du fürchterlich erschrocken.",
                        "A small, furry critter jumps out of a bush and darts off. That really surprised you.");
                    elseif ( selectMessage == 3 ) then
                        base.common.BC_InformNLS(User,
                        "Du greifst mit der Hand in eine Blattlauskolonie. Verärgert wischt du dir die Hand an der Hose ab.",
                        "The plant is crowded with lice. Annoyed, you wipe your hand clean on your trousers.");
                    else
                        base.common.base.common.BC_InformNLS(User,
                        "Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.",
                        "An annoying bug buzzes around your head. You strike at it in order to drive it away.");
                    end
                    return
                end

                User:startAction(content.gathering.herbgathering:GenWorkTime(User,SourceItem), 0, 0, 0, 0 );
                AreaHerb=GetAreaHerbs(TargetItem.pos);
                chance=100*(1.00037765/(1+(35.1237078*math.exp(-0.71059788*AreaHerb))));
                if chance < 1 then
                    chance = 1;
                end
                -- User:inform( "chance is "..chance );
                if( math.random( 100 ) < chance ) then
                    --User:inform( "success!" );
                    success = true;
                end
            end

            if ( harvest[ 4 ] == 0 ) then
                if( success ) then
                    if( harvest[ 5 ][ season ] >= math.random(10) ) then
                        success = true;
                    else
                        success = false;
                    end
                end
            end

			success = true;

            -- harvest fruit
            if( success ) then
                step=0;
                if gem1==7 then     -- topas modifies skill!
                    step=str1;
                end
                if gem2==7 then
                    step=step+str2;
                end
                --User:inform( "creating harvest" );

                -- replace item with follow up item
                if( harvest[ 4 ] ~= 0 ) then
                    --User:inform( "changing item" );
                    world:erase( TargetItem, 1 );
                else
                    DecreaseAreaHerbs(TargetItem.pos,1);
                end

				-- Hier wird das neue Item erschaffen
	            leftHand = User:getItemAt(CCharacter.left_tool);
	            rightHand = User:getItemAt(CCharacter.right_tool);
				-- Korb dabei? dann wird dort hinein gesammelt
	            if (leftHand.id==799) or (rightHand.id==799) then
	                User:inform("nu wird im Körbchen gesammelt");
					
	            else
					User:inform("Wie zuvor wird nun einzeln gesammelt");
					--Quality (Standard 333, da stapelbar)	                
	                User:createItem( harvest[ 3 ], 1, 333, harvest[ 6 ] );
				end

                User.movepoints=User.movepoints-4;
                if( harvest[ 2 ] > 0 ) then
                    User:learn( 2, "herb lore", 2, 100 );
                    base.common.BC_GetHungry( User, 100 );
                else
                    User:learn( 2, "herb lore", 2, 5 );
                end

                if base.common.BC_ToolBreaks( User, SourceItem ) then
                    base.common.BC_InformNLS(User,
                    "Die alte und abgenutzte Sichel in deinen Händen zerbricht.",
                    "The old and used sickle in your hands breaks.");
                end
            end

            if( (not success ) and (skilluse~=1) ) then
                if( boden == 1 ) then
                    base.common.BC_InformNLS( User,
                    "Deine Hände graben durch die Erde, aber Du findest nichts.",
                    "Your hands muckrake through the dirt, but you do not find anything." );
                elseif( boden == 2 ) then
                    base.common.BC_InformNLS( User,
                    "Altes Laub und Nadeln sind alles was Du findest.",
                    "Dry leaves are all you find." );
                elseif( boden == 3 ) then
                    base.common.BC_InformNLS( User,
                    "Du findest nichts außer trockenem Sand.",
                    "You find nothing but dry sand" );
                elseif( boden == 4 ) then
                    base.common.BC_InformNLS( User,
                    "Du findest nichts außer Unkraut und Gras.",
                    "You find nothing but weed and grass." );
				else
                    base.common.BC_InformNLS( User,
                    "Du findest nichts.",
                    "You  do not find anything." );
                end
            end -- right tile
            return
        end
    end -- for harvestList
    
    User:startAction(content.gathering.herbgathering:GenWorkTime(User, SourceItem), 0, 0, 0, 0);
end

function InitHerblore()
    if (harvestItem == nil) then

        harvestItem = { };
        AreaHerbs = { };
        AreaTime = { };
        -- Format of entry: boden, difficulty, product, followup item, aviable in seasons[0..10]{spring,summer,fall,winter}
        -- Acker: = 1
        -- Wald:  = 2
        -- Sand:  = 3
        -- Wiese: = 4
        -- Fels:  = 5
        -- Wasser:= 6
        -- Dreck: = 7

        harvestItem[ 159 ] = {                       -- Fliegenpilz
        { 0, 0, 159, 0, {6,3,10,4}, 11 }};             -- Alle: Fliegenpilz

         harvestItem[ 161 ] = {                       -- Hirtenpilz
        { 0, 0, 161, 0, {3,6,10,1}, 11 }};             -- Alle: Hirtenpilz

        harvestItem[ 426 ] = {                       -- Pilz
        { 0, 0, 162, 0, {10,5,3,1}, 11 }};             -- Alle: Geburtspilz

        harvestItem[ 421 ] = {                       -- grüner Leuchtpilz
        { 0, 0, 158, 0, {5,3,6,10}, 11 }};             -- Alle: Knollenschwamm

        harvestItem[ 410 ] = {                       -- grüner Leuchtpilz
        { 0, 0, 158, 0, {5,3,6,10}, 11 }};             -- Alle: Knollenschwamm

        harvestItem[ 411 ] = {                       -- grüner Leuchtpilz
        { 0, 0, 158, 0, {5,3,6,10}, 11 }};             -- Alle: Knollenschwamm

        harvestItem[ 203 ] = {                       -- Palme
        { 0, 0, 157, 0, {8,4,5,10}, 11 }};             -- Alle: Faulbaumrinde

        harvestItem[ 273 ] = {                       -- Blume
        { 2, 5, 144, 0, {5,0,2,10}, 37 },               -- Wald: Jungfernkraut
        { 3, 5, 137, 0, {3,1,4,10}, 25 },               -- Sand: Flammkelchblüte
        { 4, 7, 135, 0, {10,6,3,0}, 17 },               -- Wiese: Gelbkraut
        { 5, 0, 148, 0, {2,10,3,0}, 47 },               -- Fels: Firnisblüte
        { 7,50, 138, 0, {2, 2,9,5}, 26 } };             -- Dreck: Nachengelsblüte

        harvestItem[ 274 ] = {                       -- Farn
        { 2,30, 140, 0, {10,2,7,3}, 27 },               -- Wald: Donfblatt
        { 3, 0, 156, 0, {10,1,2,4}, 61 },               -- Sand: Steppenfarn
        { 4,10, 153, 0, {10,4,1,0}, 52 },               -- Wiese: Fußblatt
        { 5,20, 153, 0, {4,10,3,0}, 52 } };             -- Fels: Fußblatt

        harvestItem[ 290 ] = {                       -- Kohl
        { 0, 0, 290, -1, {6,10,9,0}, 11 } };             -- Alle: Kohl

        harvestItem[ 301 ] = {                       -- Hecke
        { 2, 0, 147, 0, {0,3,10,5}, 46 },               -- Wald: Brombeere
        { 3, 5, 142, 0, {2,3,10,6}, 35},                -- Sand: Sandbeere
        { 4, 0, 143, 0, {0,5,10,5}, 36},                -- Wiese: Roter Holunder
        { 7,50, 136, 0, {4,3,10,7}, 18 } };             -- Dreck: Wutbeere

        harvestItem[ 308 ] = {                       -- Tannenbaum
        { 0,0, 149, 0, {8,4,5,10}, 11 } };             -- Alle: Tannensetzling

        harvestItem[ 338 ] = {                       -- Schilf
        { 4, 5, 134, 0, {6,1,5,10}, 16 },               -- Wiese: Einbeere
        { 6,30, 155, 0, {4,10,5,1}, 54} };              -- Wasser: Sibanac Blatt

        harvestItem[ 537 ] = {                       -- reife Zwiebeln
        { 0, 0, 201, -1, {6,10,9,0}, 74 } };            -- Alle: Zwiebeln

        harvestItem[ 540 ] = {                       -- reife Tomaten
        { 0, 0, 200, -1, {6,10,9,0}, 82 } };            -- Alle: Tomaten

        harvestItem[ 731 ] = {                       -- Hopfen
        { 0, 0, 154, -1, {6,10,9,0}, 53 } };            -- Alle: Hopfen

        harvestItem[ 732 ] = {                       -- alter Hopfen
        { 0, 0, 728, -1, {6,10,9,0}, 11 } };            -- Alle: Hopfenwurzel

        harvestItem[ 1782 ] = {                      -- Gras
        { 2, 0, 151, 0, {10,3,1,0}, 48 },               -- Wald: Erdbeere
        { 3, 5, 146, 0, {3,5,10,0}, 28 },               -- Sand: Wüstenhimmelskapsel
        { 4,20, 141, 0, {0,4,10,3}, 38 },             -- Wiese:Distel
        { 4,20, 145, 0, {10,6,3,0}, 38 } };             -- Stein:Heideblüte

        harvestItem[ 1783 ] = {                      -- Gras
        { 2, 0, 151, 0, {10,3,1,0}, 48 },               -- Wald: Erdbeere
        { 3, 5, 146, 0, {3,5,10,0}, 28 },               -- Sand: Wüstenhimmelskapsel
        { 4,20, 141, 0, {0,4,10,3}, 38 },               -- Wiese:Distel
        { 4,20, 145, 0, {10,6,3,0}, 38 } };             -- Stein:Heideblüte

        harvestItem[ 1790 ] = {                      -- Pilzkreis
        { 0, 0, 163, 0, {1,6,10,2}, 73 } };             -- Alle: Champignon

        harvestItem[ 1791 ] = {                      -- Sonnenblumen
        { 4,30, 133, 0 , {8,10,2,0}, 15 } };            -- Wiese: Sonnenkraut

        harvestItem[ 1812 ] = {                      -- kleine Palme
        { 3,20, 80, 0, {3,8,5,0}, 11 } };               -- Sand: Banane

        harvestItem[ 1813 ] = {                      -- kleine Palme
        { 3,20, 80, 0, {3,8,5,0}, 11 } };               -- Sand: Banane

        harvestItem[ 2169 ] = {                      -- Alter Baumstamm
        { 2,30, 157, 0, {6,10,9,0}, 11 },                -- Wald: Faulbaumrinde
        { 7,10, 157, 0, {6,10,9,0}, 11 } };              -- Dreck: Faulbaumrinde

        harvestItem[ 2170 ] = {                      -- Alter Baumstamm
        { 2,30, 157, 0, {6,10,9,0}, 11 },                -- Wald: Faulbaumrinde
        { 7,10, 157, 0, {6,10,9,0}, 11 } };              -- Dreck: Faulbaumrinde

        harvestItem[ 2492 ] = {                      -- reife Karotten
        { 0, 0, 2493, -1, {6,10,9,0}, 11 } };            -- Alle: Karotten

		harvestItem[ 782 ] = {                      -- reifes Zuckerrohr
        { 0, 0, 778, -1, {6,10,9,0}, 73 } };            -- Alle: Zuckerrohr

        harvestItem[ 777 ] = {                      -- reifer Tabak
        { 0, 0, 772, -1, {6,10,9,0}, 82 } };            -- Alle: Tabak
    end
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, GetItemDescription( User, Item, 1 ));
end

function GetAreaHerbs(TargetPosi)
    local AreaFieldX=math.floor((TargetPosi.x+500))+1;
    local AreaFieldY=math.floor((TargetPosi.y+500))+1;
    if (AreaHerbs[AreaFieldX]==nil) then
        AreaHerbs[AreaFieldX] = { };
    end
    if (AreaTime[AreaFieldX]==nil) then
        AreaTime[AreaFieldX] = { };
    end
    if (AreaHerbs[AreaFieldX][AreaFieldY]==nil) then
        AreaHerbs[AreaFieldX][AreaFieldY] = 20;
    end
    if (AreaTime[AreaFieldX][AreaFieldY]==nil) then
        AreaTime[AreaFieldX][AreaFieldY] = GetServerSeconds();
    end
    IncreaseAreaHerbs(TargetPosi)
    return AreaHerbs[AreaFieldX][AreaFieldY]
end

function DecreaseAreaHerbs(TargetPosi,Amount)
    local AreaFieldX=math.floor((TargetPosi.x+500))+1;
    local AreaFieldY=math.floor((TargetPosi.y+500))+1;
    AreaHerbs[AreaFieldX][AreaFieldY]=AreaHerbs[AreaFieldX][AreaFieldY]-Amount;
    AreaTime[AreaFieldX][AreaFieldY]=GetServerSeconds();
    return
end

function IncreaseAreaHerbs(TargetPosi)
    local AreaFieldX=math.floor((TargetPosi.x+500))+1;
    local AreaFieldY=math.floor((TargetPosi.y+500))+1;
    if (AreaHerbs[AreaFieldX][AreaFieldY]<20) then
        local TimeDiff=GetServerSeconds()-AreaTime[AreaFieldX][AreaFieldY];
        if (TimeDiff>600) then
            AreaHerbs[AreaFieldX][AreaFieldY]=AreaHerbs[AreaFieldX][AreaFieldY]+math.min(20,math.floor(TimeDiff/600));
            AreaTime[AreaFieldX][AreaFieldY]=GetServerSeconds();
        end
    end
    return
end

function GetServerSeconds()
    local retVal=0;
    retVal=retVal+world:getTime("second");
    retVal=retVal+world:getTime("minute")*60;
    retVal=retVal+world:getTime("hour")*60*60;
    retVal=retVal+world:getTime("day")*24*60*60;
    local month=world:getTime("month");
    if (month==0) then
        retVal=retVal+16*6*24*60*60;
    else
        retVal=retVal+month*24*24*60*60;
    end
    retVal=retVal+world:getTime("year")*366*24*60*60;
    return math.floor(retVal/4)
end

function SearchTileInRange(GroundType,Radius,Posi)
    local i=-Radius;
    local k=-Radius
    local found=false;
    repeat
    k=-Radius;
    repeat
    SearchPos=position(Posi.x+i,Posi.y+k,Posi.z)
    field = world:getField( SearchPos )
    TileID = field:tile();
    bodenart = BC_GetGroundType( TileID )
    for itn=1,table.getn(GroundType) do
        if (bodenart==GroundType[itn]) then
            found=true
        end
    end
    k=k+1;
    until (found or k==Radius+1)
    i=i+1;
    until (found or i==Radius+1)
    return found
end

function SearchItemInRange(ItemIDs,Radius,Posi)
    local i=-Radius;
    local k=-Radius
    local found=false;
    repeat
    k=-Radius;
    repeat
    SearchPos=position(Posi.x+i,Posi.y+k,Posi.z)
    if world:isItemOnField(SearchPos) then
        for itn=1,table.getn(ItemIDs) do
            if (Item.id==ItemIDs[itn]) then
                found=true
            end
        end
    end
    k=k+1;
    until (found or k==Radius+1)
    i=i+1;
    until (found or i==Radius+1)
    return found
end

function CheckValidHerb(HerbID,TargetPos)
    return true;
end

-- Arbeitszeit generieren
--function GenWorkTime(User,toolItem)
--    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
--    local Skill  = math.min(100,User:getSkill("herb lore")*10);     -- Schneidern: 0 - 100
--    gem1, str1, gem2, str2=BC_GetBonusFromTool(toolItem);
--    step=0;
--    if gem1==3 then     -- ruby modifies skill!
--        step=str1;
--    end
--    if gem2==3 then
--        step=step+str2;
--    end
--    Skill=Skill+step;
--    step=0;
--    if gem1==6 then     -- amethyst modifies time needed
--        step=str1;
--    end
--    if gem2==6 then
--        step=step+str2;
--    end
--    step=step*1.75;
--    return math.floor((-0.2 * (Attrib + Skill) + 40)*(100-step)/100);
--end
