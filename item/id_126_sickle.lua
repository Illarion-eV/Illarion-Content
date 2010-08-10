-- Herblore mit Sichel und Ausbreitung der Pflanzen

-- UPDATE common SET com_script='item.id_126_sickle' WHERE com_itemid=126;

require("item.general.metal")
require("base.common")

module("item.id_126_sickle", package.seeall, package.seeall(item.general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	
	-- Krauterliste initialisieren
	InitHerblore();
	
	-- wird die Arbeit durch andere aktion unterbrochen?
    base.common.ResetInterruption( User, ltstate );
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
    
    -- Unterbrechungsmeldungen
	if ( ltstate == Action.success ) then
        if base.common.IsInterrupted( User ) then
            base.common.InformNLS( User,
            "Wï¿½hrend du nach Krï¿½utern suchst, verhakt sich deine Sichel und rutscht dir fast aus der Hand.",
            "While searching for herbs your sickle gets stuck and it nearly slides out of your hand.");
            return
        end
    end
    
     -- Sehr streife Rï¿½stung?
    if base.common.Encumbrence(User) then
        base.common.InformNLS( User,
        "Deine Rï¿½stung behindert dabei Krï¿½uter zu sammeln.",
        "Your armor disturbes you collecting herbs." );
        return
    end
    
    -- Sicherheitscheck
    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    
    -- Ist ueberhaupt ein Item da, in dem gesucht wird?
    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        TargetItem = base.common.GetFrontItem( User );
    end
    if not TargetItem then
        base.common.InformNLS( User,
        "Hier kannst du nicht finden.",
        "You can't find anything here.");
        return;
    end
    
    -- Zum Item drehen, falls dies nicht der Fall ist
    if not base.common.IsLookingAt( User, TargetItem.pos ) then
        base.common.TurnTo( User, TargetItem.pos );
    end

	-- ist die Sichel in der Hand?
    if ( SourceItem:getType() ~= 4 ) then
        base.common.InformNLS( User,
        "Du musst die Sichel in der Hand haben um damit zu arbeiten",
        "You have to hold the sickle in your hand to work with it.");
        return
    end
    
    -- Kraeuterkundeskill des Users laden
    local skill = User:getSkill( "herb lore" );

	-- Boni durch magische Edelsteine in der Sichel? Rubine modifizieren den skill!
    gem1, str1, gem2, str2=base.common.GetBonusFromTool(SourceItem);
    step=0;
    if gem1==3 then   
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    skill=skill+step;
	
	local notcreated=User:createItem(currentHerb,1,333,0);

    if (notcreated~=0) then
        world:createItemFromId(currentHerb,1,User.pos,true,333,0);
        base.common.InformNLS(User,
        "Du kannst nicht noch mehr halten.",
        "You can't carry any more.");
    else
        User:startAction( base.gcraft.GenWorkTime(User), 0, 0, 8, 15);
    end
	

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
    local AreaFieldX=math.floor((TargetPosi.x))+1;
    local AreaFieldY=math.floor((TargetPosi.y))+1;
    AreaHerbs[AreaFieldX][AreaFieldY]=AreaHerbs[AreaFieldX][AreaFieldY]-Amount;
    AreaTime[AreaFieldX][AreaFieldY]=GetServerSeconds();
    return
end

function IncreaseAreaHerbs(TargetPosi)
    local AreaFieldX=math.floor((TargetPosi.x))+1;
    local AreaFieldY=math.floor((TargetPosi.y))+1;
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
function GenWorkTime(User,toolItem)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = math.min(100,User:getSkill("herb lore")*10);     -- Schneidern: 0 - 100
    gem1, str1, gem2, str2=BC_GetBonusFromTool(toolItem);
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
    return math.floor((-0.2 * (Attrib + Skill) + 40)*(100-step)/100);
end