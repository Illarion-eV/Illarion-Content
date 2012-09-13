-- Generic Routine Collection
module("base.common", package.seeall)

--- Select the proper text upon the language flag of the character
-- @param User The character who's language flag matters
-- @param textInDe german text
-- @param textInEn english text
-- @return Text german or english text version

function GetNLS(User, textInDe, textInEn)
    return (User:getPlayerLanguage() == Player.german and textInDe or textInEn);
end;

--- Send a inform to the player in the language the player speaks
-- @param User The character who receives the message
-- @param textInDe german text
-- @param textInEn english text
-- @param informPriority Player.[low|medium|high]Priority

-- Default: Medium priority
function InformNLS(User, textInDe, textInEn)
    User:inform(textInDe, textInEn)
end

-- Temp: Low priority
function TempInformNLS(User, textInDe, textInEn)
    User:inform(textInDe, textInEn, Player.lowPriority)
end

-- High: High priority
function HighInformNLS(User, textInDe, textInEn)
    User:inform(textInDe, textInEn, Player.highPriority)
end

--- Triggers a multi language talking for a character
-- In case there is no player in range who could hear the talking nothing is
-- said
-- @param User The character who should say the message
-- @param method The method that is used to speak Character.say, Character.yell, Character.whisper
-- @param textInDe german text
-- @param textInEn english text
function TalkNLS(User, method, textInDe, textInEN)
    if (User == nil) then
        return;
    end
    local Range = 0;
    if (method == Character.whisper) then
        Range = 2;
    elseif (method == Character.yell) then
        Range = 30;
    else
        Range = 12;
        method = Character.say;
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
        if (char:getPlayerLanguage() == Player.german) then
            foundDE = true;
        else
            foundEN = true;
        end;

        if foundDE and foundEN then
            break;
        end;
    end;

    if foundDE then
        User:talkLanguage(method, Player.german,  textInDe);
    end;

    if foundEN then
        User:talkLanguage(method, Player.english, textInEN);
    end;
end;

--- Get a text based on the gender of the character.
-- @param User The character used to choose the text
-- @param textMale The text returned in case the character is male
-- @param textFemale The text returned in case the character is female
-- @return textMale or textFemale, based on the gender of User
function GetGenderText(User, textMale, textFemale)
    return (User:increaseAttrib("sex", 0) == 1 and textFemale or textMale);
end;

--- This function uses the random value generator to produce a random chance.
-- This function returns true in a specified amount of cases. The optional
-- Base parameter is used to set the value of 100%. By default this value is 1.
-- For example in case the value is set to 80 and the base is set to 100 the
-- function will return true in 80% of the calls. The same result would be
-- produced in case the value is set to 8 and the base is set to 10 or in case
-- the Value is set to 0.8 and the base is not set, or set to 1.
-- @param Value The chance value
-- @param Base The value of 100% (optional)
-- @return true in (Value/Base*100)% of the calls
function Chance(Value, Base)
    if (Base ~= nil and Value >= Base) or (Base == nil and Value >= 1) then
        return true;
    end;
    if (Value <= 0) then
        return false;
    end;
    
    if (Base ~= nil) and (Base ~= 1) then
        Value = Value / Base;
    end;
    
    return (math.random() <= Value);
end;

--- Determine if a character is looking at a position or not
-- @param User The character whos looking direction matters
-- @param Location The position the character should look at
-- @return true in case the character looks at the position, else false
function IsLookingAt(User, Location)
    if not User or not Location then
        return false;
    end;

    if equapos(User.pos, Location) then
        return true;
    end

    local richtung = User:getFaceTo();

    return (((richtung == Character.north) and (Location.y < User.pos.y)) or
            ((richtung == Character.northeast) and
                ((Location.y < User.pos.y) or (Location.x > User.pos.x))) or
            ((richtung == Character.east) and (Location.x > User.pos.x)) or
            ((richtung == Character.southeast) and
                ((Location.y > User.pos.y) or (Location.x > User.pos.x))) or
            ((richtung == Character.south) and (Location.y > User.pos.y)) or
            ((richtung == Character.southwest) and
                ((Location.y > User.pos.y) or (Location.x < User.pos.x))) or
            ((richtung == Character.west) and (Location.x < User.pos.x)) or
            ((richtung == Character.northwest) and
                ((Location.y < User.pos.y) or (Location.x < User.pos.x))));
end;

function IsNilOrEmpty(text)
	return ((text == nil) || (text == ""));
end;

--- Determine the direction from one position to another one
-- @param StartPosition The start position. The place you get the direction you have to look towards to see the target location
-- @param TargetPosition The target position
-- @return value for the direction, possible values are: Character.dir_north, Character.dir_northeast, Character.dir_east, Character.dir_southeast, Character.dir_south, Character.dir_southwest, Character.dir_west, Character.dir_northwest
function GetDirection(StartPosition, TargetPosition)
    if (StartPosition.z < TargetPosition.z) then
        return Character.dir_up;
    elseif (StartPosition.z > TargetPosition.z) then
        return Character.dir_down;
    end

    local phi = GetPhi(StartPosition, TargetPosition);

    if (phi < math.pi / 8) then
        return Character.dir_east;
    elseif (phi < 3 * math.pi / 8) then
        return Character.dir_southeast;
    elseif (phi < 5 * math.pi / 8) then
        return Character.dir_south;
    elseif (phi < 7 * math.pi / 8) then
        return Character.dir_southwest;
    elseif (phi < 9 * math.pi / 8) then
        return Character.dir_west;
    elseif (phi < 11 * math.pi / 8) then
        return Character.dir_northwest;
    elseif (phi < 13 * math.pi / 8) then
        return Character.dir_north;
    elseif (phi < 15 * math.pi / 8) then
        return Character.dir_northeast;
    else
        return Character.dir_east;
    end;
end;

--- Turn a character towards a location
-- @param User The character who shall be turned
-- @param Location The position the character shall turn to
function TurnTo(User, Location)
    local oldDir = User:getFaceTo();
    local newDir = GetDirection(User.pos, Location);

    if (newDir ~= oldDir) then
        User:setAttrib("faceto", newDir);
    end;
end;

--- Get the position right in front of a character in looking direction
-- @param User The character the front position is wanted
-- @return The position in front of the character
function GetFrontPosition(User, distance)
    local direct = User:getFaceTo();
    local d = distance or 1;
	
    if (direct == Character.north) then
        return position(User.pos.x, User.pos.y - d, User.pos.z);
    elseif (direct == Character.northeast) then
        return position(User.pos.x + d, User.pos.y - d, User.pos.z);
    elseif (direct == Character.east) then
        return position(User.pos.x + d, User.pos.y, User.pos.z);
    elseif (direct == Character.southeast) then
        return position(User.pos.x + d, User.pos.y + d, User.pos.z);
    elseif (direct == Character.south) then
        return position(User.pos.x, User.pos.y + d, User.pos.z);
    elseif (direct == Character.southwest) then
        return position(User.pos.x - d, User.pos.y + d, User.pos.z);
    elseif (direct == Character.west) then
        return position(User.pos.x - d, User.pos.y, User.pos.z);
    elseif (direct == Character.northwest) then
        return position(User.pos.x - d, User.pos.y - d, User.pos.z);
    end;

    return User.pos;
end;

--- Get the item that is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The item that was found or nil
function GetFrontItem(User)
    local Posi = GetFrontPosition(User);

    if world:isItemOnField(Posi) then
        return world:getItemOnField(Posi);
    else
        return nil;
    end;
end;

--- Get the ID of the item that is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The ID of the item in front of the character or 0 in case there is none
function GetFrontItemID(User)
    local theItem = GetFrontItem(User);

    if not theItem then
        return 0;
    else
        return theItem.id;
    end;
end;

--- Get character who is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The character in front of the parameter character or nil
function GetFrontCharacter(User)
    local Posi = GetFrontPosition(User);

    if world:isCharacterOnField(Posi) then
        return world:getCharacterOnField(Posi);
    else
        return nil;
    end;
end;

--- Get the position right behind a character 
-- @param User The character the back position is wanted
-- @param distance How far behind the char? Defaults to 1.
-- @return The position behind the character
function GetBehindPosition(User, distance)

    local d = distance or 1;
    local direct = User:getFaceTo();

    if (direct == Character.north) then
        return position(User.pos.x, User.pos.y + d, User.pos.z);
    elseif (direct == Character.northeast) then
        return position(User.pos.x - d, User.pos.y + d, User.pos.z);
    elseif (direct == Character.east) then
        return position(User.pos.x - d, User.pos.y, User.pos.z);
    elseif (direct == Character.southeast) then
        return position(User.pos.x + d, User.pos.y - d, User.pos.z);
    elseif (direct == Character.south) then
        return position(User.pos.x, User.pos.y - d, User.pos.z);
    elseif (direct == Character.southwest) then
        return position(User.pos.x + d, User.pos.y - d, User.pos.z);
    elseif (direct == Character.west) then
        return position(User.pos.x + d, User.pos.y, User.pos.z);
    elseif (direct == Character.northwest) then
        return position(User.pos.x + d, User.pos.y + d, User.pos.z);
    end;

    debug("Invalid user direction");
end;

--- Get the item that is behind the character in case there is one
-- @param User The character whos back area is searched
-- @return The item that was found or nil
function GetBehindItem(User)
    local Posi = GetBehindPosition(User);

    if world:isItemOnField(Posi) then
        return world:getItemOnField(Posi);
    else
        return nil;
    end;
end;

--- Get the ID of the item that is behind the character in case there is one
-- @param User The character whos back area is searched
-- @return The ID of the item in front of the character or 0 in case there is none
function GetBehindItemID(User)
    local theItem = GetBehindItem(User);

    if not theItem then
        return 0;
    else
        return theItem.id;
    end;
end;

--- Get character who is behind the character in case there is one
-- @param User The character whos front area is searched
-- @return The character in front of the parameter character or nil
function GetBehindCharacter(User)
    local Posi = GetBehindPosition(User);

    if world:isCharacterOnField(Posi) then
        return world:getCharacterOnField(Posi);
    else
        return nil;
    end;
end;

--- Check if a character is within a area determined with 2 positions. The
-- rectangle of the area is determined by the grid of the tiles
-- @param User The character who is checked for being within the area
-- @param Pos1 The first position to determine the area
-- @param Pos2 The second position to determine the area
-- @return True if the character is in the area, false if not
function GetInArea(User, Pos1, Pos2)
    if (User.pos.x <= math.min(Pos1.x, Pos2.x) or
        User.pos.x >= math.max(Pos1.x, Pos2.x)) then
        return false;
    elseif (User.pos.y <= math.min(Pos1.y, Pos2.y) or
        User.pos.y >= math.max(Pos1.y, Pos2.y)) then
        return false;
    elseif (User.pos.z <= math.min(Pos1.z, Pos2.z) or
        User.pos.z >= math.max(Pos1.z, Pos2.z)) then
        return false;
    end
    return true;
end

--- Check if a ItemStruct is valid for a special character
-- @param User Character who should own the item
-- @param Item Item that shall be checked if its still valid
-- @param altIDs alternative ItemIDs the item could have changed to and is still valid
-- @return True if everything is fine, else false
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

--- Checks if the Character has a minimal default amount of food points. If not
-- it prints out a inform message.
-- @param User The character whos foodpoints are checked
-- @return True in case the character has enougth food points, false if not
function FitForWork(User)
    return FitForHardWork(User, 1000);
end;

--- Checks if the Character has a minimal amount of food points. If not it
-- prints out a inform message-
-- @param User The character whos foodpoints are checked
-- @param required Amount of foodpoints that are required
-- @return True in case the character has enougth food points, false if not
function FitForHardWork(User, required)
    if (User:increaseAttrib("foodlevel", 0) < required) then
        InformNLS(User,
        "Du bist dafür zu erschöpft.",
        "You are too exhausted for that.");
        return false;
    end;
    return true;
end;

--- Decrease the foodpoints of a character and show a warning if the foodpoints
-- are running low.
-- @param User The character that loses foodpoints
-- @param units The amount of foodpoints that are removed
function GetHungry(User, units)
    local food = User:increaseAttrib("foodlevel", -units);
    if ((food > 1000 + units * 5) and (food <= 1000 + units * 6)) then
        InformNLS(User,
        "Die Arbeit macht Dich langsam müde und hungrig.",
        "You are getting tired and hungry from your work.");
    end;
end;

--- Checks if are gems integrated in a item and returns the strength one or both
-- gems.<br />
-- Gem index:
-- <ol><li>dimond</li><li>smaragd</li><li>ruby</li><li>blackstone</li>
-- <li>bluestone</li><li>amethyst</li><li>topas</li></ol>
-- @param toolItem The item that shall be checked
-- @return Index value of the first gem
-- @return Strength of the first gem
-- @return Index value of the second gem
-- @return Strength of the second gem
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

--- Damage a item upon a random try involving the dexterity and the strength of
-- the owner of the item
-- @param User The character who has the item
-- @param theItem The item that might gets damaged
-- @param fast True in case the breaking speed should be faster then usually
-- @return True of the item breaks, false if not
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

    --Zerstörung des Werkzeugs bei Minimum an Quality oder niedriger Haltbarkeit
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
            "Das Werkzeugs erleidet durch dauernde Beanspruchung einen Qualitätsverlust.",
            "The quality of the tool is lowered by overuse.");
        end;
    end;

    return false;
end;

--- Get a timestamp based on the current server time. Resolution in RL seconds.
-- @return The current timestamp
function GetCurrentTimestamp()
    return GetCurrentTimestampForDate(world:getTime("year"),
        world:getTime("month"),
        world:getTime("day"),
        world:getTime("hour"),
        world:getTime("minute"),
        world:getTime("second"));
end

--- Converts a date into a timestamp in with the resolution in RL seconds.
-- @param year the year of the date to convert
-- @param month the month of the date to convert
-- @param day the day of the date to convert
-- @param hour the hour of the date to convert
-- @param minute the minute of the date to convert
-- @param second the second of the date to convert
-- @return The timestamp of the date
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
end;


--- Convert a timestamp back into a full data. This is the inverse function of
-- GetCurrentTimestamp() and GetCurrentTimestampForData(...).
-- @param timestamp The timestamp that shall be converted
-- @return The year of the resulting data and time
-- @return The month of the resulting data and time
-- @return The day of the resulting data and time
-- @return The hour of the resulting data and time
-- @return The minute of the resulting data and time
-- @return The second of the resulting data and time
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

--- Determines the type of ground a tile has.
-- @param TileID ID of the tile that should be checked
-- @return The ground typ as one of the following constants:  GroundType.unknown, GroundType.field, GroundType.forest, GroundType.sand, GroundType.gras, GroundType.rocks, GroundType.water, GroundType.dirt
function GetGroundType(TileID)
    if (TileID == 4) then -- field
        return GroundType.field;
    elseif (TileID == 6) then -- water
        return GroundType.water;
    elseif (TileID == 9) then -- forest
        return GroundType.forest;
    elseif (TileID == 3 or TileID == 12) then -- sand
        return GroundType.sand;
    elseif (TileID == 11) then -- gras
        return GroundType.gras;
    elseif (TileID == 2 or TileID == 15) then -- rocks
        return GroundType.rocks;
    elseif (TileID == 8 or TileID == 16) then -- dirt
        return GroundType.dirt;
    elseif (TileID == 10) then -- snow
        return GroundType.snow;
    end;

    return GroundType.unknown;
end;

--- This list contains the constants that are returned by GetGroundType.
-- @class Enumerator
GroundType = {
    ["unknown"] = 0,
    ["field"] = 1,
    ["forest"] = 2,
    ["sand"] = 3,
    ["gras"] = 4,
    ["rocks"] = 5,
    ["water"] = 6,
    ["dirt"] = 7,
    ["snow"] = 8
};

--- Create random number with normal distribution.
-- @param minVal Minimal value of the random number range
-- @param maxVal Maximal value of the random number range
-- @return The random number
function NormalRnd(minVal, maxVal)
    return NormalRnd2(minVal, maxVal, 10);
end;

--- Create random number with normal distribution.
-- @param minVal Minimal value of the random number range
-- @param maxVal Maximal value of the random number range
-- @param count How often will be diced
-- @return The random number
function NormalRnd2(minVal, maxVal, count)
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
        InventoryFieds = {Character.head, Character.coat, Character.breast, Character.hands, Character.legs, Character.feet};
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
        Paralysis = LongTimeEffect(23, 1);
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
    @return table - Table containing x,y,z positions 
]]
function PositionToData(posi)
    return {["MapPosX"]=posi.x,["MapPosY"]=posi.y,["MapPosZ"]=posi.z}
end;

--[[
    DataToPosition
    Converts a value encoded with PositionToData back to the PositionStruct
    @param posList - List containig x,y,z
    @return PositionStruct - The PositionStruct that was encoded in the list
]]
function DataToPosition(posList)
    return position(tonumber(posList[1]),tonumber(posList[2]),tonumber(posList[3]))
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
    Split_number
    Splits a digit chain into digits and returns it in a table
    Example: split_number(3015,4) returns following table: table = {3, 0, 1, 5}
	@param Number - the number chain that shall be splitted
    @param AmountOfDigits - the amount of digits the number chain has

    @return table - the splitted number chain into digits
]]
function Split_number(Number, AmountOfDigits)

	local temptable = {};
	local tempcnt = 0;


	for i = (AmountOfDigits-1), 0, -1 do
		tempcnt = tempcnt + 1;
		temptable[tempcnt] = math.floor(math.mod((Number / (10^i)), 10) + 0.5);
	end
	return temptable;
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
        return "früher Morgen", "early morning";
    elseif (hour >= 8 and hour < 10) then
        return "morgens", "at morning";
    elseif (hour >= 10 and hour < 12) then
        return "vor Mittag", "before midday";
    elseif (hour >= 12 and hour < 14) then
        return "mittags", "at midday";
    elseif (hour >= 14 and hour < 16) then
        return "nachmittag", "afternoon";
    elseif (hour >= 16 and hour < 18) then
        return "früher abend", "early evening";
    elseif (hour >= 18 and hour < 20) then
        return "abends","at evening";
    elseif (hour >= 20 and hour < 22) then
        return "später abend", "late evening";
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

--[[
    ExtgetPlayersInRangeOf
    An extended Version of the world - function getPlayersInRangeOf
	includes players who are in the diagonal direction in range of the radius

	@param pos - the center position struct from where there shall be looked at
    @param radius - the range at which we want to look for players

    @return struct table - a table with players or nil
]]
function ExtgetPlayersInRangeOf(posi, radius)

	local ext = 2;
	plyList=world:getPlayersInRangeOf(posi, radius+ext);

	for i, player in pairs(plyList) do
	    -- player not in rect, remove from list
		if not isInRect(player.pos, posi, radius) then
			plyList[i] = nil;
	    end
	end
	
	return plyList;

end

--[[
    isInRect
	checks whether targetpos is within a rect with distance "range"
	and center position "posi"

	@param targetpos - the target pos that shall be looked for
    @param posi - center position of the rect
    @param range - distance of the rect borders from the center

    @return bool - true when targetpos is in rect else false
]]
function isInRect(targetpos, posi, range)

	if targetpos.x>=(posi.x-range) and targetpos.x<=(posi.x+range) then         --checks the x-Coordinates with the borders
	    if targetpos.y>=(posi.y-range) and targetpos.y<=(posi.y+range) then     --checks the y-Coordinates with the borders
	        return true;
		else
		    return false;
		end
	else
	    return false;
	end
end

--- Check if a given monster is docile
-- @param id The ID of the monster in question
-- @return true if monster is docile
function IsMonsterDocile( id )
	local docileList = {6,16,26,36,46,56,86,107,116,136,191,201,226,236,291,292,293,294,295,296,361,371,381,391,401};
	for i,v in pairs(docileList) do
		if id == v then
			return true;
		end
	end
	return false;
end

--- Checks if an item is in the hand tools slots
-- @param item The item to check
-- @return true if the item is in a hand tools slot, false otherwise
function IsItemInHands( item )
	if item:getType() == 4 then
		local itempos = item.itempos;
		if itempos == 5 or itempos == 6 then
			return true;
		end
	end
	return false;
end

--- Gets the target item for Use-With like commands. Both, source and target items have to be in hand tool slots.
-- @param character The character who wants to use the items
-- @param source The source item that is "used with" the target item
-- @return The target item (in the other hand slot than the source) or nil if no target is found
function GetTargetItem( character, source )
	if not IsItemInHands(source) then
		return nil;
	end
	local tpos = 11 - source.itempos; -- either 5 or 6
	local target = character:getItemAt(tpos);
	if target.id == 0 then
		return nil;
	end
	return target;
end

--- Returns the real date and time as a String
-- @return date and time in format: YYYY-MM-DD | hh:mm:ss
function GetRealDateTimeString()
	local year, month, day, hour, minute, second = GetRealDate();
	local timeString =
		function(int)
			if int < 10 then
				return "0"..int;
			end
			return ""..int;
		end
	return timeString(year) .."-".. timeString(month) .."-".. 
	timeString(day) .." | ".. timeString(hour) ..":".. timeString(minute) ..":".. timeString(second);
end

--- Returns the real date as a String
-- @return date in format: YYYY-MM-DD
function GetRealDateString()
	local year, month, day, hour, minute, second = GetRealDate();
	local timeString =
		function(int)
			if int < 10 then
				return "0"..int;
			end
			return ""..int;
		end
	return timeString(year) .."-".. timeString(month) .."-".. timeString(day);
end

--- Returns the real time as a String
-- @return time in format: hh:mm:ss
function GetRealTimeString()
	local year, month, day, hour, minute, second = GetRealDate();
	local timeString =
		function(int)
			if int < 10 then
				return "0"..int;
			end
			return ""..int;
		end
	return timeString(hour) ..":".. timeString(minute) ..":".. timeString(second);
end

--- Converts the unix timestamp to a real date (GMT 0)
-- @return year
-- @return month
-- @return day
-- @return hour
-- @return minute
-- @return second
function GetRealDate()
	local timestamp = world:getTime("unix");
	
	local year, month, day, hour, minute, second, tmp;
	year = math.floor(timestamp / 31557600) -- (365.25*24*60*60)
	local leapDays = math.floor( (year+1) / 4 ); -- without the current year
	timestamp = timestamp - (year*365 + leapDays)*86400; -- 24*60*60
	
	local leapYear = 0;
	if (year % 4) == 2 then
		leapYear = 1; -- this year is a leap year
	end
	year = year + 1970; -- unix time starts there

	local dayList = {0,31,59,90,120,151,181,212,243,273,304,334};
	tmp = math.floor(timestamp / 86400); -- days so far this year
	month = 1;
	for i=12,2,-1 do
		local check = tmp-dayList[i];
		if i>2 then
			check = check - leapYear;
		end
		if check > 0 then
			month = i;
			break;
		end
	end
	tmp = dayList[month]; -- days without current month
	if month > 2 then
		tmp = tmp + leapYear;
	end
	timestamp = timestamp - ((tmp-1) * 86400); -- days this month (in seconds)
	day = math.floor(timestamp / 86400);
	timestamp = timestamp - (day * 86400);
	hour = math.floor(timestamp / 3600);
	timestamp = timestamp - (hour * 3600);
	minute = math.floor(timestamp / 60);
	second = timestamp - (minute * 60);
	return year, month, day, hour, minute, second;
end

--[[
- BasicNPCChecks
- @param originator CharStruct Character to speaks with the NPC
- @param NPCRange int Talking Range of the NPC
- @return boolean true for talking is okay, false for not okay.
]]
function BasicNPCChecks(originator,NPCRange, npc)
    if not npc:isInRange(originator,NPCRange) then
        return false;
    end

    if (originator.id == npc.id) then
        return false;
    end

    if ( originator:getType() ~= 0 ) then
        return false;
    end

    originator:introduce(npc);
    return true;
end


function PositionToText(pos)
    if pos ~= nil then
        retString="("..pos.x..","..pos.y..","..pos.z..")";
        return retString;
    end
    return "nil","nil","nil"
end

--[[
    \fn:    ListToNumber
    \brief: transforms a number list into a number sequence which can be stored for example as quest status
    \usage: list = {5,2,7,9,1};
         ListToNumber(list) returns following number: 52791
   
   @param NumberList - the number list that shall be transformed into a number 
    @return result - the list as number
   
    \attention: Only Lists holding elements greater 1 are allowed!
]]
function ListToNumber(NumberList)
   
   local result=NumberList[1];

   for i = 2, table.getn(NumberList) do

      result = result ..NumberList[i];
      

   end
   result = tonumber(result);    --convert the string result   into a number   
   return result;

end

--[[
    \fn:    Shuffle
    \brief: Shuffles the elements of a number list random
    \usage: list = {5,2,7,9,1};
         list = Shuffle(list) shuffles the list and could return: list ={1,7,5,9,2}
   
   @param NumberList - the number list that shall be shuffled
    @return list - the shuffled number list
]]
function Shuffle(NumberList)
   
	local temp = 0
	local ReplaceIdx = 0;
   
   for i = 1, table.getn(NumberList) do -- shuffle all elements
   
      ReplaceIdx = math.random(1, table.getn(NumberList));
      temp = NumberList[i];
      NumberList[i] = NumberList[ReplaceIdx];   
      NumberList[ReplaceIdx] = temp;   
   
   end
   
   return list;
end

--[[
    \fn:    CreateRandomNumberList
    \brief: creates a random number list with AmntElements elements
    \usage: list = CreateRandomNumberList(6, 1, 4);
         returned list could hold: list = {3,1,4,2,2,4}
   
   @param AmntElements - the amount of elements the list shall have
   @param minval       - the smallest value an element can have
   @param maxval       - the highest value an element can have
    @return reslist       - a list holding AmntElements elements with values between minval and maxval
]]
function CreateRandomNumberList(AmntElements, minval, maxval)
   
   local reslist = {};
   
   for i = 1, AmntElements do
		
		reslist[i] = math.random(minval, maxval);
   
		if (reslist[i] == reslist[i-1]) then -- same number like before, try getting a new number
        reslist[i] = math.random(minval, maxval);
      end
   
   end
   
   return reslist;
end

--[[Searches the Online List for a Player by name 
	if a player was found it returns: true, Char Struct
-- 	if not, nil]]

function CheckIfOnline(playername)
	playerlist = world:getPlayersOnline();
		   
	for i = 1, #(playerlist) do 
		if playerlist[i].name == playername then
		return playerlist[i]
		end
	end
	return nil
end
