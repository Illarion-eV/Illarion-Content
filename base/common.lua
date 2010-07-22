-- Generic Routine Collection
module("base.common", package.seeall)

--- Select the proper text upon the language flag of the character
-- @param User The character who's language flag matters
-- @param textInDe german text
-- @param textInEn english text
-- @return Text german or english text version
function GetNLS(User, textInDe, textInEn)
    return (User:getPlayerLanguage() == CPlayer.german and textInDe or textInEn);
end;

--- Send a inform to the player in the language the player speaks
-- @param User The character who receives the message
-- @param textInDe german text
-- @param textInEn english text
function InformNLS(User, textInDe, textInEn)
    User:inform(GetNLS(User, textInDe, textInEn));
end;

--[[
    TempInformNLS
    Send a temporary inform to the player that is not stored in the logfile
    @param CharacterStruct - The character who receives the message
    @param Text - german text
    @param Text - english text
]]
function TempInformNLS(User, textInDe, textInEn)
    User:inform("#w " .. GetNLS( User, textInDe, textInEn));
end;

--[[
    TalkNLS
    Triggers a multi language talking for a character
    In case there is no player in range who could hear the talking nothing is said
    @param CharacterStruct - The character who should say the message
    @param int - The method that is used to speak CCharacter.say, CCharacter.yell, CCharacter.whisper
    @param Text - german text
    @param Text - english text
]]
function TalkNLS(User, method, textInDe, textInEN)
    if (User == nil) then
        return;
    end
    local Range = 0;
    if (method == CCharacter.whisper) then
        Range = 2;
    elseif (method == CCharacter.yell) then
        Range = 30;
    else
        Range = 12;
        method = CCharacter.say;
    end;

    local players = world:getPlayersInRangeOf(User.pos, Range);

    if (table.getn(players) == 0) then
        return;
    end;

    if (textInDe == nil and textInEN ~= nil) then
        User:talk( method, textInEN );
        return;
    elseif (textInDe ~= nil and textInEN == nil) then
        User:talk( method, textInDe );
        return;
    end;

    local foundDE = false;
    local foundEN = false;

    for _, char in pairs(players) do
        if (char:getPlayerLanguage() == CPlayer.german) then
            foundDE = true;
        else
            foundEN = true;
        end;

        if foundDE and foundEN then
            break;
        end;
    end;

    if foundDE then
        User:talkLanguage(method, CPlayer.german,  textInDe);
    end;

    if foundEN then
        User:talkLanguage(method, CPlayer.english, textInEN);
    end;
end

--[[
    IsLookingAt
    Determine if a character is looking at a position or not
    @param CharacterStruct - The character whos looking direction matters
    @param PositionStruct - The position the character should look at
    @return boolean - true in case the character looks at the position, else false
]]
function IsLookingAt(User, Location)

    if not User or not Location then
        return false;
    end;

    if equapos(User.pos, Location) then
        return true;
    end

    local richtung = User:get_face_to();

    return (((richtung == CCharacter.north) and (Location.y < User.pos.y)) or
            ((richtung == CCharacter.northeast) and ((Location.y < User.pos.y) or (Location.x > User.pos.x))) or
            ((richtung == CCharacter.east) and (Location.x > User.pos.x)) or
            ((richtung == CCharacter.southeast) and ((Location.y > User.pos.y) or (Location.x > User.pos.x))) or
            ((richtung == CCharacter.south) and (Location.y > User.pos.y)) or
            ((richtung == CCharacter.southwest) and ((Location.y > User.pos.y) or (Location.x < User.pos.x))) or
            ((richtung == CCharacter.west) and (Location.x < User.pos.x)) or
            ((richtung == CCharacter.northwest) and ((Location.y < User.pos.y) or (Location.x < User.pos.x))));
end;

--[[
    GetDirection
    Determine the direction from one position to another one
    @param PositionStruct - The start position. The place you get the direction you have to look towards to see the target location
    @param PositionStruct - The target position
    @return integer - value for the direction ( 0=north, 2=east, ... )
]]
function GetDirection(StartPosition, TargetPosition)
    if (StartPosition.z < TargetPosition.z) then
        return CCharacter.dir_up;
    elseif (StartPosition.z > TargetPosition.z) then
        return CCharacter.dir_down;
    end

    local phi = GetPhi(StartPosition, TargetPosition);

    if (phi < math.pi / 8) then
        return CCharacter.dir_east;
    elseif (phi < 3 * math.pi / 8) then
        return CCharacter.dir_southeast;
    elseif (phi < 5 * math.pi / 8) then
        return CCharacter.dir_south;
    elseif (phi < 7 * math.pi / 8) then
        return CCharacter.dir_southwest;
    elseif (phi < 9 * math.pi / 8) then
        return CCharacter.dir_west;
    elseif (phi < 11 * math.pi / 8) then
        return CCharacter.dir_northwest;
    elseif (phi < 13 * math.pi / 8) then
        return CCharacter.dir_north;
    elseif (phi < 15 * math.pi / 8) then
        return CCharacter.dir_northeast;
    else
        return CCharacter.dir_east;
    end;
end;

--[[
    TurnTo
    Turn a character towards a location
    @param CharacterStruct - The character who shall be turned
    @param PositionStruct - The position the character shall turn to
]]
function TurnTo(User, Location)
    local oldDir = User:get_face_to();

    local newDir = GetDirection(User.pos, Location);

    if (newDir ~= oldDir) then
        User:setAttrib("faceto", newDir);
    end;
end;

--[[
    GetFrontPosition
    Get the position right in front of a character in looking direction
    @param CharacterStruct - The character the front position is wanted
    @return PositionStruct - The front position
]]
function GetFrontPosition(User)
    local direct = User:get_face_to(  );

    if (direct == CCharacter.north) then
        return position(User.pos.x, User.pos.y - 1, User.pos.z);
    elseif (direct == CCharacter.northeast) then
        return position(User.pos.x + 1, User.pos.y - 1, User.pos.z);
    elseif (direct == CCharacter.east) then
        return position(User.pos.x + 1, User.pos.y, User.pos.z);
    elseif (direct == CCharacter.southeast) then
        return position(User.pos.x + 1, User.pos.y + 1, User.pos.z);
    elseif (direct == CCharacter.south) then
        return position(User.pos.x, User.pos.y + 1, User.pos.z);
    elseif (direct == CCharacter.southwest) then
        return position(User.pos.x - 1, User.pos.y + 1, User.pos.z);
    elseif (direct == CCharacter.west) then
        return position(User.pos.x - 1, User.pos.y, User.pos.z);
    elseif (direct == CCharacter.northwest) then
        return position(User.pos.x - 1, User.pos.y - 1, User.pos.z);
    end;

    return User.pos;
end;

--[[
    GetFrontItem
    Get the item that is in front of the character in case there is one
    @param CharacterStruct - The character whos front area is searched
    @return ItemStruct - The item that was found or nil
]]
function GetFrontItem(User)
    local Posi = GetFrontPosition(User);

    if world:isItemOnField(Posi) then
        return world:getItemOnField(Posi);
    else
        return nil;
    end;
end;

--[[
    GetFrontItemID
    Get the ID of the item that is in front of the character in case there is one
    @param CharacterStruct - The character whos front area is searched
    @return integer - the id of the item or 0
]]
function GetFrontItemID(User)
    local theItem = GetFrontItem(User);

    if not theItem then
        return 0;
    else
        return theItem.id;
    end;
end;

--[[
    GetFrontCharacter
    Get character who is in front of the character in case there is one
    @param CharacterStruct - The character whos front area is searched
    @return CharacterStruct - The character in front of the parameter character or nil
]]
function GetFrontCharacter(User)
    local Posi = GetFrontPosition(User);

    if world:isCharacterOnField(Posi) then
        return world:getCharacterOnField(Posi);
    else
        return nil;
    end;
end;

--[[
    GetInArea
    Check if a character is within a area determined with 2 positions
    @param CharacterStruct - The character who is checked for being within the area
    @param PositionStruct - The first position to determine the area
    @param PositionStruct - The second position to determine the area
    @return boolean - true if the character is in the area, false if not
]]
function GetInArea(User, Pos1, Pos2)
    if (User.pos.x <= math.min(Pos1.x, Pos2.x) or User.pos.x >= math.max(Pos1.x, Pos2.x)) then
        return false;
    elseif (User.pos.y <= math.min(Pos1.y, Pos2.y) or User.pos.y >= math.max(Pos1.y, Pos2.y)) then
        return false;
    elseif (User.pos.z <= math.min(Pos1.z, Pos2.z) or User.pos.z >= math.max(Pos1.z, Pos2.z)) then
        return false;
    end
    return true;
end

--[[
    CheckItem
    Check if a ItemStruct is valid for a special character
    @param CharacterStruct - Character who could own the item
    @param ItemStruct - Item that shall be checked if its still valid
    @param List of integer - alternative ItemIDs the item could have changed to and is still valid
    @return boolean - true if everything is fine, else false
]]
function CheckItem(User, Item, altIDs)
    local ItemCheck = nil;
    if (Item:getType() == 3) then
        if world:isItemOnField(Item.pos) then
            ItemCheck = world:getItemOnField(Item.pos);
        end;
    else
        ItemCheck = User:getItemAt(Item.itempos);
    end;
    if ItemCheck then
        if (Item.id == ItemCheck.id) then
            return true;
        elseif (altIDs ~= nil) then
            for _, altID in pairs(altIDs) do
                if (ItemCheck.id == altID) then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;

--[[
    FitForWork
    Checks if the Character has a minimal default amount of food points
    If not it prints out a inform message
    @param CharacterStruct - The character whos foodpoints are checked
    @return boolean - true in case the character has enougth food points, false if not
]]
function FitForWork(User)
    return FitForHardWork(User, 1000);
end;

--[[
    FitForHardWork
    Checks if the Character has a minimal amount of food points
    If not it prints out a inform message
    @param CharacterStruct - The character whos foodpoints are checked
    @param integer - amount of foodpoints that are required
    @return boolean - true in case the character has enougth food points, false if not
]]
function FitForHardWork(User, required)
    if (User:increaseAttrib("foodlevel", 0) < required) then
        InformNLS(User,
        "Du bist daf�r zu ersch�pft.",
        "You are too exhausted for that.");
        return false;
    end;
    return true;
end;

--[[
    GetHungry
    Decrease the foodpoints of a character and show a warning if the foodpoints are running low
    @param CharacterStruct - The character that loses foodpoints
    @param integer - The amount of foodpoints that are removed
]]
function GetHungry(User, units)
    local food = User:increaseAttrib("foodlevel", -units);
    if ((food > 1000 + units * 5) and (food <= 1000 + units * 6)) then
        InformNLS(User,
        "Die Arbeit macht Dich langsam m�de und hungrig.",
        "You are getting tired and hungry from your work.");
    end;
end;

--[[
    GetBonusFromTool
    Checks if are gems integrated in a item and returns the strength one or both gems
    Gem Index:  1: dimond
                2: smaragd
                3: ruby
                4: blackstone
                5: bluestone
                6: amethyst
                7: topas
    @param ItemStruct - The item that shall be checked
    @return int - index value of the first gem
    @return int - strength of the first gem
    @return int - index value of the second gem
    @return int - strength of the second gem
]]
function GetBonusFromTool(toolItem)
    local dataValue=toolItem.data;
    if ((dataValue > 9) and (dataValue < 100)) then
        str1 = math.mod(dataValue, 10) + 1;
        dataValue = dataValue - str1 + 1;
        stone1 = math.floor(dataValue / 10);
        return stone1, str1, 0, 0;
    elseif ((dataValue > 1009) and (dataValue < 10000)) then
        str1 = math.mod(dataValue, 10) + 1;
        dataValue = dataValue - str1 + 1;
        stone1 = math.mod(dataValue, 100) / 10;
        dataValue = dataValue - stone1 * 10;
        str2 = math.mod(dataValue, 1000) / 100 + 1;
        stone2 = math.floor(dataValue / 1000);
        return stone1, str1, stone2, str2;
    end;
    return 0, 0, 0, 0;
end;

--[[
    ToolBreaks
    Damage a item upon a random try involving the dexterity and the strength of the owner of the item
    @param CharacterStruct - The character who has the item
    @param ItemStruct - The item that might gets damaged
    @return boolean - true of the item breaks, false if not
]]
function ToolBreaks(User, theItem, fast)
    if not User or not theItem then
        return false;
    end;
    local factor;
    if fast then
        factor = 0.05;
    else
        factor = 0.093;
    end;

    local      dura = math.mod( theItem.quality, 100 ); -- Dura-Wert zwischen 1 und 99
    local      qual = (theItem.quality - dura) / 100;   -- Qual-Wert zwischen 1 und 9
    local durabrake = 0.5 * (100 - dura);               -- Bremse des Duraverlusts bei niedriger Dura
    local qualbrake = 0.5 * (10  - qual);               -- Bremse beim Senken von Qual, wenn Qual schon niedrig

    --Zerst�rung des Werkzeugs bei Minimum an Quality oder niedriger Durabilit�t
    if (theItem.quality <= 101) or (dura <=1) then
        world:erase( theItem, 1 );
        return true;

        --theItem.quality wird um 1 gesenken (Dura)

    elseif (math.random(95) > (theItem.quality * factor + durabrake)) then
        gem1, str1, gem2, str2 = GetBonusFromTool(theItem);
        step = 0;
        if (gem1 == 1) then         -- diamond increases durability of item
            step = str1;          -- 1-10
        end;
        if (gem2 == 1) then
            step = step + str2;
        end;
        if math.random(1,20) > step then      -- for step 20, it becomes indestructable!
            dura = dura - 1;
            theItem.quality = qual * 100 + dura;
            world:changeItem( theItem );

            if (dura == 20) then
                InformNLS(User,
                "Das Werkzeug wird nicht mehr lange halten. Du solltest dich nach einem besseren umschauen.",
                "The tool looks like it could break soon. You should buy a better one.");

            end;
        end;

        --the Item.quality wird um 90 gesenkt (Qual-Wechsel mit minimalem Dura-Anstieg auf max 29),
        --wenn dura < 20. Wird nur bei jeder 10. Aktion abgefragt
    elseif (math.random(30) > 27) then
        if ((1 > dura) or (dura < 20)) and (math.random(10) > qual + qualbrake) then
            if (qual == 1) then
                world:erase(theItem, 1);
                return true;
            end;
            theItem.quality = qual * 100 + dura - 90;
            world:changeItem(theItem);
            InformNLS(User,
            "Das Werkzeugs erleidet durch dauernde Beanspruchung einen Qualit�tsverlust.",
            "The quality of the tool is lowered by overuse.");
        end;
    end;

    return false;
end;

--[[
    GetCurrentTimestamp
    Get a timestamp based on the current server time
    Resolution: RL Seconds

    @return integer - The current timestamp
]]
function GetCurrentTimestamp()
    return GetCurrentTimestampForDate(world:getTime("year"),world:getTime("month"),world:getTime("day"),world:getTime("hour"),world:getTime("minute"),world:getTime("second"));
end

--[[
    GetCurrentTimestampForDate
    converts a given date to a timestamp
    Resolution: RL Seconds

    @return integer - The current timestamp
]]
function GetCurrentTimestampForDate(year, month, day, hour, minute, second)
    return math.floor(
          (( year  - 1 ) * 31536000 + -- (year-1)*((15*24) + 5)*24*60*60;
           ( month - 1 ) *  2073600 + -- (month-1)*24*24*60*60;
           ( day   - 1 ) *    86400 + -- (day-1)*24*60*60;
            hour         *     3600 + -- hour*60*60
            minute       *       60 + -- minute*60
            second
           )/3
     );
end


--[[
    converts an ig timestamp to a concrete date
    ]]--
function TimestampToDate(timestamp)
    local year = math.floor(timestamp / 31536000);
    timestamp = timestamp - (year * 31536000);

    --Calculating day
    --86400 = 60*60*24
    local day = math.floor(timestamp / 86400);
    timestamp = timestamp - (day * 86400);
    day = day + 1;

    -- Calculating month
    -- 24 days per month
    month = math.floor(day / 24);
    day = day - (month * 24);

    -- checking for range borders and fixing the date
    if (day == 0) then
        if (month > 0 and month < 16) then
            day = 24;
        else
            day = 5;
        end
    else
        month=month+1;
    end

    if (month == 0) then
        month = 16;
        year = year - 1;
    end


    -- Calculate the time of day
    -- Calculating hour
    -- 3600 = 60 * 60
    local hour = math.floor(timestamp / 3600);
    timestamp = timestamp - (hour * 3600);
    --Calculating minute
    local minute = math.floor(timestamp / 60);
    --seconds
    timestamp = timestamp - (minute * 60);
    return year,month,day,hour,minute,timestamp;
end

--[[
    GetGroundType
    Determines the type of ground a tile has
    @param integer - ID of the tile
    @return integer - the ground typ as one of the following constants:
        GroundType.unknown, GroundType.field, GroundType.forest,
        GroundType.sand, GroundType.gras, GroundType.rocks,
        GroundType.water, GroundType.dirt
]]
function GetGroundType(TileID)
    if (TileID == 4) then -- field
        return GroundType.field;
    elseif (TileID == 6) then -- water
        return GroundType.water;
    elseif (TileID == 9) then -- forest
        return GroundType.forest;
    elseif (TileID == 3) then -- sand
        return GroundType.sand;
    elseif (TileID == 11) then -- gras
        return GroundType.gras;
    elseif (TileID == 2 or TileID == 15) then -- rocks
        return GroundType.rocks;
    elseif (TileID == 8) then -- dirt
        return GroundType.dirt;
    end;

    return GroundType.unknown;
end;

--[[
    This list contains the constants that are returned by GetGroundType.
]]
GroundType = {
    ["unknown"] = 0,
    ["field"] = 1,
    ["forest"] = 2,
    ["sand"] = 3,
    ["gras"] = 4,
    ["rocks"] = 5,
    ["water"] = 6,
    ["dirt"] = 7
};

--[[
    NormalRnd
    create random number with normal distribution
    @param integer - minimal value of the random number range
    @param integer - maximal value of the random number range
    @return integer - the random number
]]
function NormalRnd(minVal, maxVal)
    return NormalRnd2(minVal, maxVal, 10);
end;

--[[
    NormalRnd2
    create random number with normal distribution
    @param integer - minimal value of the random number range
    @param integer - maximal value of the random number range
    @param integer - how often will be diced
    @return integer - the random number
]]
function NormalRnd2( minVal, maxVal, count )
    local base = 0;
    for _ = 1, count do
        base = base + math.random(maxVal - minVal + 1) - 1;
    end;
    return math.ceil(base / 10) + minVal;
end;

--[[
    GetItemsOnField
    Get a list of all items on a field
    IMPORTAINT: All items but the one on top are read only
    @param PositionStruct - The position of the tile that shall be checked
    @return List of ItemStructs - The list of all items on that field
]]
function GetItemsOnField(Fieldpos)
    local Field = world:getField(Fieldpos);
    if (Field == nil) then
        return {};
    end
    local ItemsCount = Field:countItems();
    local retList = {};
    if (ItemsCount > 0) then
        for i=0, ItemsCount-1 do
            Item = Field:getStackItem(i);
            table.insert(retList, Item);
        end;
    end;
    return retList
end;

--[[
    GetItemsOnField
    Search the whole Inventory of a character for a Item and a Data value
    @param CharacterStruct - The characters who's inventory is checked
    @param integer - The item ID we are looking for
    @param integer - The data value we are looking for
    @return mixed - The itemstruct of the first found item or false
]]
function GetItemInInventory(User, ItemID, DataValue)
    local ItemList = User:getItemList(ItemID);
    for _, item in pairs(ItemList) do
        if (DataValue == nil or item.data == DataValue) then
            return item;
        end;
    end;

    return false;
end;

--[[
    GetStiffness
    Generate the sum of all stiffness values of the armor parts a character wears
    @param CharacterStruct - The character whos stiffness is checked
    @return integer - the stiffness value
]]
function GetStiffness(Character)
    local StiffnessVal = 0;
    local Item;
    local found;
    local Armor;

    if not InventoryFieds then
        InventoryFieds = {CCharacter.head, CCharacter.coat, CCharacter.breast, CCharacter.hands, CCharacter.legs, CCharacter.feet};
    end;
    for _, place in pairs(InventoryFieds) do
        Item=Character:getItemAt( place );
        if Item and (Item.id ~= 0) then
            found, Armor=world:getArmorStruct(Item.id);
            if found then
                StiffnessVal = StiffnessVal + Armor.Stiffness;
            end;
        end;
    end;
    return StiffnessVal;
end;

--[[
    Encumbrence
    Check if a character is encumbered by the armor he wears
    @param CharacterStruct - The character whos encombrence is checked
    @return boolean - true if encumbered, false if not
]]
function Encumbrence(Character)
    return (GetStiffness(Character) > 100);
end;

--[[
    ResetInterruption
    Resets the interruption counter state, in case the action did not success
    @param CharacterStruct - The character whos state is resetted
    @param LongTimeActionState - The state of the current action
]]
function ResetInterruption(Character, ltstate)
    if (ltstate ~= Action.success) and interruptTable then
        interruptTable[Character.id] = nil;
    end;
end;

--[[
    IsInterrupted
    Checks if a characters action is interrupted has a minimal amount of actions that
    will succeed all time before a interruption is possible. Wearing gloves increases this minimal amount
    @param CharacterStruct - The character who is checked for a interruption
    @return boolean - true in case the action is interruped, false if not
]]
function IsInterrupted(Character)
    if not interruptTable then
        interruptTable = {};
        interruptTable[Character.id] = 2;
        return false;
    elseif not interruptTable[Character.id] then
        interruptTable[Character.id] = 2;
        return false;
    end;
    local rnd = math.random(10, 30);
    local gloves = Character:getItemAt(4);
    if (gloves.id == 2259) or (gloves.id == 48) then
        rnd = rnd + 10;
    end;
    if ( interruptTable[Character.id] > rnd ) then
        interruptTable[Character.id] = nil;
        return true;
    end;
    interruptTable[Character.id] = interruptTable[Character.id] + 1;
    return false;
end;

--[[
    ParalyseCharacter
    Paralyzes a character with a lte or by the actionpoints for setted time
    @param CharacterStruct - The character that shall be paralyzed
    @param integer - The time in seconds the character shall be paralyzed
    @param boolean - true if the time shall be added to an exsisting paralizing, false if the old values shall just be overwritten
    @param boolean - true(default) if a LTE shall be used to stunn the character. In this case its not intended to release the stunn any time ealier. False if not
    @return boolean - true if anything was done. false if not.
]]
function ParalyseCharacter(Target, Time, Cumulative, forced)

    if not Time or (Time == 1) then
        return false;
    end;

    if (forced == nil) then
        forced = true;
    end;

    if not forced then
        if Cumulative then
            Target.actionpoints = Target.actionpoints - ( Time * 10 );
        else
            Target.actionpoints = 30 - ( Time * 10 )
        end
        return true;
    end;

    local foundEffect, Paralysis = Target.effects:find(23);
    local timeLeft = 0;

    if not foundEffect then
        if (Time < 1) then
            return false;
        end
        Paralysis = CLongTimeEffect(23, 1);
        Target.effects:addEffect(Paralysis);
    else
        local foundTime;
        foundTime, timeLeft = Paralysis:findValue("timeLeft");
        if not foundTime then
            timeLeft=0;
        end
    end;

    if (0 < Time and Cumulative) or (Time < 0) then
        Time = Time + timeLeft;
    else
        Time = math.max(Time, timeLeft);
    end;

    if (Time ~= timeLeft) then
        Paralysis:addValue("timeLeft", math.max(0,Time));
        return true;
    end;

    return false;
end;

--[[
    IsCharacterParalysed
    Checks if the character is stunned by the stunning LTE
    @param CharacterStruct - The character that shall be checked
    @return integer - The amount of setting remaining in the stunn or nil if not stunned
]]
function IsCharacterParalysed(Character)

    local foundEffect, Paralysis = Character.effects:find(23);
    if not foundEffect then
        return nil;
    else
        local foundTime, timeLeft = Paralysis:findValue("timeLeft");
        if foundTime then
            return timeLeft;
        end;
    end;
    return nil;
end;

--[[
    CreateCircle
    Calculates a circle based on a center position and a radius. It triggers a Event function
    on every position of the circle with the position of the circle as parameter
    @param PositionStruct - Center position of the circle
    @param integer - Radius of the circle
    @param function(PositionStruct) - Event function that is triggered for every position
]]
function CreateCircle(CenterPos, Radius, Event)
    if not Event then
        return;
    end;
    if not storedCircle then
        storedCircle = {};
    end;
    if not storedCircle[Radius] then
        local irad = math.ceil(Radius);
        local dim = 2*(irad+1);
        local map = {} ;
        storedCircle[Radius] = {};

        for x = -irad - 1, irad do
            map[x] = {};
            for y = -irad - 1, irad do
                map[x][y] = (x + 0.5) * (x + 0.5) + (y + 0.5) * (y + 0.5) - irad * irad > 0;
            end;
        end;

        for x = -irad, irad do
            for y = -irad, irad do
                if not (map[x][y] and map[x-1][y] and map[x][y-1] and map[x-1][y-1])
                   and (map[x][y] or map[x-1][y] or map[x][y-1] or map[x-1][y-1]) then
                    table.insert(storedCircle[Radius], position(x, y, 0));
                end;
            end;
        end;
    end;
    local go_on;
    for _, posi in pairs(storedCircle[Radius]) do
        go_on = Event(position(CenterPos.x + posi.x, CenterPos.y + posi.y, CenterPos.z));
        if (go_on == false and go_on ~= nil) then
            return true;
        end;
    end;
end;

--[[
    CreateLine
    Calculates a straight line between 2 position and triggers a Event function for every position
    @param PositionStruct - First position of the line
    @param PositionStruct - Second position of the line
    @param function(PositionStruct) - Event function that is triggered for every position
]]
function CreateLine(StartPos, TargetPos, Event)
    local XDiff2 = math.abs(StartPos.x - TargetPos.x);
    local YDiff2 = math.abs(StartPos.y - TargetPos.y);
    local PriDiff = math.max(XDiff2, YDiff2);
    local SecDiff = math.min(YDiff2, XDiff2);
    local XMod = (StartPos.x < TargetPos.x and -1 or 1);
    local YMod = (StartPos.y < TargetPos.y and -1 or 1);
    local PathPos;
    local go_on;
    for i = 1, PriDiff do
        if (PriDiff == XDiff2) then
            PathPos = position(StartPos.x - XMod * i, StartPos.y - YMod * math.floor(i / PriDiff * SecDiff), StartPos.z );
        else
            PathPos = position(StartPos.x - XMod * math.floor(i / PriDiff * SecDiff), StartPos.y - YMod * i, StartPos.z );
        end;
        go_on = Event(PathPos);
        if (go_on == false and go_on ~= nil) then
            return true;
        end;
    end;
end;

--[[
    CreateTangentLine
    Calculates a tangent line from the perspective of the center pos with the middle on the TargetPos
    @param PositionStruct - The center position
    @param PositionStruct - the target position (center of this line is on this position)
    @param integer - length of one arm of the line. Effective length is ArmLength*2+1
    @param function(PositionStruct) - Event function that is triggered for every position
]]
function CreateTangentLine(CenterPos, TargetPos, ArmLength, Event)
    local phi = GetPhi( CenterPos, TargetPos ) + math.pi/2;

    local xoffset = math.cos( phi );
    local yoffset = math.sin( phi );
    local maxoffset = math.max( math.abs( xoffset ), math.abs( yoffset ) );

    yoffset = yoffset * ( 1 / maxoffset );
    xoffset = xoffset * ( 1 / maxoffset );

    local go_on = Event( TargetPos );
    if (go_on == false and go_on ~= nil) then
        return;
    end

    local posi;
    local first_go_on = true;
    local second_go_on = true;
    for i=1, ArmLength do
        if first_go_on then
            first_go_on = Event(position(Round(TargetPos.x + i * xoffset), Round(TargetPos.y + i * yoffset), TargetPos.z));
            first_go_on = (first_go_on ~= nil and first_go_on or true);
        end;
        if second_go_on then
            second_go_on = Event(position(Round(TargetPos.x - i * xoffset), Round(TargetPos.y - i * yoffset), TargetPos.z));
            second_go_on = ( second_go_on ~= nil and second_go_on or true );
        end;
        if not first_go_on and not second_go_on then
            return;
        end;
    end;
end;

--[[
    Scale
    Calculates a linear interpolation between two values based upon a third value
    @param integer - Start of the linear interpolation. Value at 0
    @param integer - End of the linear interpolation. Value at 100
    @param integer - Value for the interpolation. Causes the function to return the first value if its set to 0 and the second if its set to 100
                     For any value between 0 and 100 it returns a value between the start and the end value
    @return integer - interpolated value
]]
function Scale(ScBegin, ScEnd, value)
    return ScaleUnlimited(ScBegin, ScEnd, Limit(value, 0, 100));
end;

--[[
    ScaleUnlimited
    Calculates a linear interpolation between two values based upon a third value
    In case the value is aboth 100 the return value will be aboth the end value
    @param integer - Start of the linear interpolation. Value at 0
    @param integer - End of the linear interpolation. Value at 100
    @param integer - Value for the interpolation. Causes the function to return the first value if its set to 0 and the second if its set to 100
                     For any value between 0 and 100 it returns a value between the start and the end value
    @return integer - interpolated value
]]
function ScaleUnlimited(ScBegin, ScEnd, value)
    return (ScEnd - ScBegin) / 100 * value + ScBegin;
end;

--[[
    Limit
    Sets the value into the given borders. If the borders are set to nil or false, they are interpreted as non-exsistant
    @param integer - The value that shall be checked
    @param integer - The minimal border. The return value will be not smaller then this
    @param integer - The maximal border. The return value will not be bigger then this
    @return integer - the value or the border in case the value is bigger or smaller then the given range
]]
function Limit(value, min, max)
    if min and (value < min) then
        return min;
    end;
    if max and (value > max) then
        return max;
    end;
    return value;
end;

--[[
    Round
    Round a value at a given precision up at x.5 and bigger, down in any other cases
    @param integer - the value that shall be rounded
    @param integer - the precision, default 0
    @return integer - the rounded value
]]
function Round(value, precision)
    if not precision then
        precision = 0;
    end;

    value = value * 10 ^ precision;

    if (math.mod(value, 1) >= 0.5) then
        value = math.ceil( value );
    else
        value = math.floor( value );
    end;

    value = value / 10 ^ precision;
    return value;
end;

--[[
    GetPhi
    Calculate phi between 2 positions
    @param PositionStruct - The start position
    @param PositionStruct - The target position
    @return float - phi
]]
function GetPhi(StartPos, TargetPos)
    if equapos(StartPos, TargetPos) then
        return math.random()*2;
    end
    local dx = TargetPos.x - StartPos.x;
    local dy = TargetPos.y - StartPos.y;
    local phi;
    if (dx == 0) then
        if (dy > 0) then
            phi = math.pi / 2;
        else
            phi = math.pi + math.pi / 2;
        end;
    elseif (dx > 0) then
        if (dy >= 0) then
            phi = math.atan(dy / dx);
        else
            phi = math.atan(dy / dx) + 2 * math.pi;
        end;
    else
        phi = math.atan(dy / dx) + math.pi;
    end;
    return phi;
end

--[[
    PositionToData
    Encodes a position into a value that would fit into the data value of a item
    Use DataToPosition to get the PositionStruct again
    @param PositionStruct - The position that should be encoded
    @return integer - The value that contains the position
]]
function PositionToData(posi)
    return 1048576 * (500 + posi.x) + 1024 * (500 + posi.y) + (500 + posi.z);
end;

--[[
    DataToPosition
    Converts a value encoded with PositionToData back to the PositionStruct
    @param integer - The value that contains the encoded position
    @return PositionStruct - The PositionStruct that was encoded in the value
]]
function DataToPosition(value)
    local z = math.mod(value, 1024) - 500;
    value = math.floor(value / 1024);
    local y = math.mod(value, 1024) - 500;
    value = math.floor(value / 1024);
    local x = math.mod(value, 1024) - 500;
    return position(x,y,z);
end;

--[[
    ChangeAttribute
    Change a attribute by a given value and return the effective change
    @param CharacterStruct - The character whos attribute shall be changed
    @param string - The attribute that shall be changed
    @param integer - The value that the attribute shall be changed by
    @param integer - The bottom border [optional]
    @param integer - The top border [optional]
    @return integer - Change Value
]]
function ChangeAttribute( Character, attrib, value, bottomBorder, topBorder )
    if (value < -255 or value > 255) then
        return 0;
    end;
    if (bottomBorder <= 0 or bottomBorder >= 255) then
        bottomBorder = 1;
    end;
    if (topBorder <= 0 or topBorder >= 255) then
        topBorder = 255;
    end;
    if bottomBorder >= topBorder then
        bottomBorder = 1;
        topBorder = 255;
    end;
    local oldValue = Character:increaseAttrib(attrib, 0);
    local newValue = oldValue + value;
    if (newValue < bottomBorder) then
        value = bottomValue - newValue;
        newValue = bottomValue;
    elseif (newValue > topBorder) then
        value = newValue - topBorder;
        newValue = topBorder;
    end;
    Character:increaseAttrib(attrib, value);
    return (value + 255);
end;

--[[
    RevertAttribute
    Revert the change of a attribute done with ChangeAttribute
    @param CharacterStruct - The character whos attribute shall be changed
    @param string - The attribute that shall be changed
    @param integer - The value returned by ChangeAttribute
    @return boolean - success or not
]]
function RevertAttribute(Character, attrib, value)
    if (value < 0 or value > 510) then
        return false;
    else
        value = value - 255;
    end;

    Character:increaseAttrib(attrib, -value);
    return true;
end;

--[[
    CopyPosition
    Copies a position struct to a new one
    @param position - the position that shall be copied
    @return position - the new position struct
]]
function CopyPosition(Posi)
    return position(Posi.x, Posi.y, Posi.z);
end

--[[
    split
    splits a string into different parts
    @param str - the string which should be splitted
    @return pat - the pattern around what the string should be splittet
    example = split("hello:my:split:world",":") returns {"hello","my","split","world"}
]]
function split(str, pat)
    local t = {n = 0}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t, cap);
        end;
        last_end = e + 1;
        s, e, cap = str:find(fpat, last_end);
   end;
   if (last_end <= str:len()) then
      cap = str:sub(last_end);
      table.insert(t, cap);
   end
   return t;
end

--[[
    converts a given hour of day to a string like: early morning, morning,
    @param hour the hour which should be converted
    @return ger, eng strings
]]
function Hour_To_String(hour)
    if (hour >= 0 and hour < 2 or hour == 24) then
        return "um Mitternacht", "at midnight";
    elseif (hour >= 2 and hour < 4) then
        return "nach Mitternacht", "after midnight";
    elseif (hour >= 4 and hour < 6) then
        return "vor Sonnenaufgang", "before sunset";
    elseif (hour >= 6 and hour < 8) then
        return "fr�her Morgen", "early morning";
    elseif (hour >= 8 and hour < 10) then
        return "morgens", "at morning";
    elseif (hour >= 10 and hour < 12) then
        return "vor Mittag", "before midday";
    elseif (hour >= 12 and hour < 14) then
        return "mittags", "at midday";
    elseif (hour >= 14 and hour < 16) then
        return "nachmittag", "afternoon";
    elseif (hour >= 16 and hour < 18) then
        return "fr�her abend", "early evening";
    elseif (hour >= 18 and hour < 20) then
        return "abends","at evening";
    elseif (hour >= 20 and hour < 22) then
        return "sp�ter abend", "late evening";
    else
        return "vor Mitternacht", "before midnight";
    end;
end;

function fold(ar, f, neutral)
    result = neutral;
    for i,v in ipairs(ar) do
        result = f(result, v)
    end
    return result;
end

function map(ar, f)
    for i,v in ipairs(ar) do
        ar[i] = f(v);
    end
    return ar;
end

--[[
    This is some strange method written by Vilarion. Its extremly inefficient,
    very creepy and most likely totally buggy.
    Usage is not adviced.
--]]
function isItemIdInFieldStack( id, pos )

    local stack = {};
    local i = -1;
    local found = false;
    local itm;
    while( world:isItemOnField(pos) and (not found) ) do
        itm = world:getItemOnField(pos);
        if( itm.id == id ) then
            found = true;
        else
            i = i + 1;
            stack[i] = itm;
            world:erase( itm, itm.number );
        end;
    end;
    while( i >= 0 ) do
        world:createItemFromItem( stack[i], pos, true );
        i = i - 1;
    end;
    return found;
end

--[[
    This is some strange method written by Vilarion. Its extremly inefficient,
    very creepy and most likely totally buggy.
    Usage is not adviced.
--]]
function removeItemIdFromFieldStack( id, pos )

    local stack = {};
    local i = -1;
    local found = false;
    local itm;
    while( world:isItemOnField(pos) and (not found) ) do
        itm = world:getItemOnField(pos);
        if( itm.id == id ) then
            found = true;
        else
            i = i + 1;
            stack[i] = itm;
        end;
        world:erase( itm, itm.number );
    end;
    while( i >= 0 ) do
        world:createItemFromItem( stack[i], pos, true );
        i = i - 1;
    end;

end