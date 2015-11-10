--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- Generic Routine Collection
local M = {}

--- Select the proper text upon the language flag of the character
-- @param User The character who's language flag matters
-- @param textInDe german text
-- @param textInEn english text
-- @return Text german or english text version

function M.GetNLS(User, textInDe, textInEn)
    return (User:getPlayerLanguage() == Player.german and textInDe or textInEn);
end;

--- Send a inform to the player in the language the player speaks
-- @param User The character who receives the message
-- @param textInDe german text
-- @param textInEn english text
-- @param informPriority Player.[low|medium|high]Priority

-- Default: Medium priority
function M.InformNLS(User, textInDe, textInEn)
    User:inform(textInDe, textInEn)
end

-- Temp: Low priority
function M.TempInformNLS(User, textInDe, textInEn)
    User:inform(textInDe, textInEn, Player.lowPriority)
end

-- High: High priority
function M.HighInformNLS(User, textInDe, textInEn)
    User:inform(textInDe, textInEn, Player.highPriority)
end

function M.TalkNLS(User, method, textInDe, textInEN)
    User:talk(method, textInDe, textInEN)
end

--- Get a text based on the gender of the character.
-- @param User The character used to choose the text
-- @param textMale The text returned in case the character is male
-- @param textFemale The text returned in case the character is female
-- @return textMale or textFemale, based on the gender of User
function M.GetGenderText(User, textMale, textFemale)
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
function M.Chance(Value, Base)
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
function M.IsLookingAt(User, Location)
    if not User or not Location then
        return false;
    end;

    if User.pos == Location then
        return true;
    end

    local richtung = User:getFaceTo();

    return (((richtung == Character.north) and (Location.y < User.pos.y)) or
            ((richtung == Character.northeast) and
                ((Location.y < User.pos.y) and (Location.x > User.pos.x))) or
            ((richtung == Character.east) and (Location.x > User.pos.x)) or
            ((richtung == Character.southeast) and
                ((Location.y > User.pos.y) and (Location.x > User.pos.x))) or
            ((richtung == Character.south) and (Location.y > User.pos.y)) or
            ((richtung == Character.southwest) and
                ((Location.y > User.pos.y) and (Location.x < User.pos.x))) or
            ((richtung == Character.west) and (Location.x < User.pos.x)) or
            ((richtung == Character.northwest) and
                ((Location.y < User.pos.y) and (Location.x < User.pos.x))));
end;

--- Check if a character sequence (string) is nil or empty.
-- @param the variable to check
-- @return true in case the text is nil or equal to a empty string
function M.IsNilOrEmpty(text)
    return ((text == nil) or (text == ""));
end;

--- Determine the direction from one position to another one
-- @param StartPosition The start position. The place you get the direction you have to look towards to see the target location
-- @param TargetPosition The target position
-- @return value for the direction, possible values are: Character.dir_north, Character.dir_northeast, Character.dir_east, Character.dir_southeast, Character.dir_south, Character.dir_southwest, Character.dir_west, Character.dir_northwest
function M.GetDirection(StartPosition, TargetPosition)
    if (StartPosition.z < TargetPosition.z) then
        return Character.dir_up;
    elseif (StartPosition.z > TargetPosition.z) then
        return Character.dir_down;
    end

    local phi = M.GetPhi(StartPosition, TargetPosition);

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
function M.TurnTo(User, Location)
    local oldDir = User:getFaceTo();
    local newDir = M.GetDirection(User.pos, Location);

    if (newDir ~= oldDir) then
        User:turn(newDir);
    end;
end;

function M.GetDirectionVector(dir)
    if dir == Character.dir_up then
        return 0, 0, 1
    elseif dir == Character.dir_down then
        return 0, 0, -1
    elseif dir == Character.north then
        return 0, -1, 0
    elseif dir == Character.northeast then
        return 1, -1, 0
    elseif dir == Character.east then
        return 1, 0, 0
    elseif dir == Character.southeast then
        return 1, 1, 0
    elseif dir == Character.south then
        return 0, 1, 0
    elseif dir == Character.southwest then
        return -1, 1, 0
    elseif dir == Character.west then
        return -1, 0, 0
    elseif dir == Character.northwest then
        return -1, -1, 0
    else
        error("Unexpected value for parameter \"dir\"")
    end
end

--- Get the position right in front of a character in looking direction
-- @param User The character the front position is wanted
-- @return The position in front of the character
function M.GetFrontPosition(User, distance, dir)
    local direct = dir or User:getFaceTo()
    local d = distance or 1
    local vX, vY = M.GetDirectionVector(direct)

    return position(User.pos.x + vX * d, User.pos.y + vY * d, User.pos.z)
end

--- Get the item that is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The item that was found or nil
function M.GetFrontItem(User, dir)
    local Posi = M.GetFrontPosition(User, 1, dir);

    if world:isItemOnField(Posi) then
        return world:getItemOnField(Posi);
    else
        return nil;
    end;
end;

--- Get the ID of the item that is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The ID of the item in front of the character or 0 in case there is none
function M.GetFrontItemID(User, dir)
    local theItem = M.GetFrontItem(User, dir);

    if not theItem then
        return 0;
    else
        return theItem.id;
    end;
end;

--- Get character who is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The character in front of the parameter character or nil
function M.GetFrontCharacter(User)
    local Posi = M.GetFrontPosition(User);

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
function M.GetBehindPosition(User, distance)

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
function M.GetBehindItem(User)
    local Posi = M.GetBehindPosition(User);

    if world:isItemOnField(Posi) then
        return world:getItemOnField(Posi);
    else
        return nil;
    end;
end;

--- Get the ID of the item that is behind the character in case there is one
-- @param User The character whos back area is searched
-- @return The ID of the item in front of the character or 0 in case there is none
function M.GetBehindItemID(User)
    local theItem = M.GetBehindItem(User);

    if not theItem then
        return 0;
    else
        return theItem.id;
    end;
end;

--- Get character who is behind the character in case there is one
-- @param User The character whos front area is searched
-- @return The character in front of the parameter character or nil
function M.GetBehindCharacter(User)
    local Posi = M.GetBehindPosition(User);

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
function M.GetInArea(User, Pos1, Pos2)
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

--- Get all free positions at and around a center location. The search is performed with a square mask. So the search
--  area is actually a rectangle with the with a side length of searchRadius + 1
-- @param centerPosition the center of the search
-- @param searchRadius the radius of the search
-- @param allowPassableItems this has to be set to true in case tiles that contain items that are passable are valid.
--                           in case this is set to false. tiles that do contain items are in general invalid
--                           (optional, defaults to false)
-- @param shuffle randomize the order the tiles are returned in (optional, defaults to false)
-- @return a function that can be used as iterator that gives all the free locations one by one
function M.GetFreePositions(centerPosition, searchRadius, allowPassableItems, shuffle)
    local coords = {}
    for x = -searchRadius, searchRadius do
        for y = -searchRadius, searchRadius do
            table.insert(coords, {centerPosition.x + x, centerPosition.y + y})
        end
    end
    if shuffle then
        coords = M.Shuffle(coords)
    end

    local currentIndex = 1
    local lastIndex = #coords
    return function()
        while currentIndex <= lastIndex do
            local xyCoords = coords[currentIndex]
            local targetPos = position(xyCoords[1], xyCoords[2], centerPosition.z)

            currentIndex = currentIndex + 1

            local field = world:getField(targetPos)
            if field ~= nil then
                if field:isPassable() and not world:isCharacterOnField(targetPos) then
                    if allowPassableItems or not world:isItemOnField(targetPos) then
                        return targetPos
                    end
                end
            end
        end
        return nil
    end
end

-- Get one random free location
function M.getFreePos(CenterPos, Rad)
    local pos = M.GetFreePositions(CenterPos, Rad, false, true)()
    if pos == nil then
        return CenterPos
    end
    return pos
end

--- Check if a ItemStruct is valid for a special character
-- @param User Character who should own the item
-- @param Item Item that shall be checked if its still valid
-- @param altIDs alternative ItemIDs the item could have changed to and is still valid
-- @return True if everything is fine, else false
function M.CheckItem(User, Item, altIDs)
    local ItemCheck
    if Item:getType() == scriptItem.field then
        if world:isItemOnField(Item.pos) then
            ItemCheck = world:getItemOnField(Item.pos)
        end
    elseif Item:getType() == scriptItem.container then
        local found
        found, ItemCheck = User:getBackPack():viewItemNr(Item.itempos)
        if not found then
            ItemCheck = nil
        end
    else
        ItemCheck = User:getItemAt(Item.itempos)
    end
    if ItemCheck then
        if Item.id == ItemCheck.id then
            return true
        elseif altIDs ~= nil then
            for _, altID in pairs(altIDs) do
                if ItemCheck.id == altID then
                    return true
                end
            end
        end
    end
    return false
end;

--- Checks if the Character has a minimal default amount of food points. If not
-- it prints out a inform message.
-- @param User The character whos foodpoints are checked
-- @return True in case the character has enougth food points, false if not
function M.FitForWork(User)
    return M.FitForHardWork(User, 1000);
end;

--- Checks if the Character has a minimal amount of food points. If not it
-- prints out a inform message-
-- @param User The character whos foodpoints are checked
-- @param required Amount of foodpoints that are required
-- @return True in case the character has enougth food points, false if not
function M.FitForHardWork(User, required)
    if (User:increaseAttrib("foodlevel", 0) < required) then
        M.InformNLS(User,
        "Du bist daf�r zu ersch�pft.",
        "You are too exhausted for that.");
        return false;
    end;
    return true;
end;

--- Decrease the foodpoints of a character and show a warning if the foodpoints
-- are running low.
-- @param User The character that loses foodpoints
-- @param units The amount of foodpoints that are removed
function M.GetHungry(User, units)
    local food = User:increaseAttrib("foodlevel", -units);
    if ((food > 1000 + units * 5) and (food <= 1000 + units * 6)) then
        M.InformNLS(User,
        "Die Arbeit macht Dich langsam m�de und hungrig.",
        "You are getting tired and hungry from your work.");
    end;
end;

--- Checks if are gems integrated in a item and returns the strength one or both
-- gems.<br />
-- Gem index:
-- <ol><li>dimond</li><li>smaragd</li><li>ruby</li><li>obsidian</li>
-- <li>sapphire</li><li>amethyst</li><li>topas</li></ol>
-- @param toolItem The item that shall be checked
-- @return Index value of the first gem
-- @return Strength of the first gem
-- @return Index value of the second gem
-- @return Strength of the second gem
function M.GetBonusFromTool(toolItem)
    local dataValue=0; --toolItem.data;
        -- TODO get correct bonus
    if ((dataValue > 9) and (dataValue < 100)) then
        local str1 = math.fmod(dataValue, 10) + 1;
        dataValue = dataValue - str1 + 1;
        local stone1 = math.floor(dataValue / 10);
        return stone1, str1, 0, 0;
    elseif ((dataValue > 1009) and (dataValue < 10000)) then
        local str1 = math.fmod(dataValue, 10) + 1;
        dataValue = dataValue - str1 + 1;
        local stone1 = math.fmod(dataValue, 100) / 10;
        dataValue = dataValue - stone1 * 10;
        local str2 = math.fmod(dataValue, 1000) / 100 + 1;
        local stone2 = math.floor(dataValue / 1000);
        return stone1, str1, stone2, str2;
    end;
    return 0, 0, 0, 0;
end;

function M.GatheringToolBreaks(user, item, workTime)

  if not user or not item then
    return false;
  end;

  -- WorkTime is between 12-60 cycles depending on skill, +/-20% is the tool influence
  -- Reduce durability at 4-20%, meaning a tool will last 500-2500 actions.

  if (math.random(1, 100) < (workTime/3)) then

    local durability = math.fmod(item.quality, 100);
    local quality = (item.quality - durability) / 100;

    if (durability == 0) then
      world:erase(item, 1);
      return true;
    end

    durability = durability - 1;
    item.quality = quality * 100 + durability;
    world:changeItem(item);

    if (durability < 10) then
      M.InformNLS(user,
      "Das Werkzeug wird nicht mehr lange halten. Du solltest dich nach einem neuen umschauen.",
      "The tool looks like it could break soon. You should try to get a new one.");
    end
  end
  return false;
end

--- Damage an item
-- @param user The character who has the item
-- @param item The item that gets damaged
-- @return true if the item breaks, false if not
function M.ToolBreaks(user, item)
    if not user or not item then
        return false;
    end;

    local durability = math.fmod(item.quality, 100)
    local quality = (item.quality - durability) / 100

    if durability == 0 then
        world:erase(item, 1)

        if math.random(1, 100) == 1 then
            if math.random(1, 2) == 1 then
                M.InformNLS(user,
                    "Das Werkzeug zerbricht. Du bist am Boden zerst�rt und wirst es sehr vermissen.",
                    "The tool breaks. You are devastated and will miss it very much.")
            else
                M.InformNLS(user,
                    "Das Werkzeug zerbricht. Du hast mehr Drama erwartet, aber es ist einfach kaputt.",
                    "The tool breaks. You expected more drama, but it is just broken.")
            end
        else
            M.InformNLS(user,
                "Das Werkzeug zerbricht.",
                "The tool breaks.")
        end

        return true
    else
        durability = durability - 1
        item.quality = quality * 100 + durability
        world:changeItem(item)

        if durability < 10 then
            M.InformNLS(user,
                "Das Werkzeug wird nicht mehr lange halten. Du solltest dich nach einem neuen umschauen.",
                "The tool looks like it could break soon. You should try to get a new one.")
        end
    end

    return false
end

-- Check if a cooldown for an item is expired (e.g. if using it)
-- Set a new cooldown if the old one is expired (or none set yet)
-- @param Item the item to be checked
-- @param dataKey the key of the data the timestamp is saved in (and the new one is saved in if cooldown ran up)
-- @param cooldownDuration length of the cooldown in seconds
-- @return true if the cooldown is expired (or there was none yet) and new one has been set;
-- false if the cooldown is still valid
function M.ItemCooldown(User,Item, dataKey, cooldownDuration)
    local timeNow = M.GetCurrentTimestamp()
    local timeThen = tonumber(Item:getData(dataKey))
    if (timeThen == nil) or ((timeNow - timeThen) >= cooldownDuration) then
        Item:setData(dataKey,timeNow)
        world:changeItem(Item)
        return true
    else
        return false
    end
end

--- Get a timestamp based on the current server time. Resolution in RL seconds.
-- @return The current timestamp
function M.GetCurrentTimestamp()
    return M.GetCurrentTimestampForDate(world:getTime("year"),
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
function M.GetCurrentTimestampForDate(year, month, day, hour, minute, second)
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
function M.TimestampToDate(timestamp)
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
function M.GetGroundType(TileID)
    if (TileID == 4) then -- field
        return M.GroundType.field;
    elseif (TileID == 6) then -- water
        return M.GroundType.water;
    elseif (TileID == 9) then -- forest
        return M.GroundType.forest;
    elseif (TileID == 3 or TileID == 12) then -- sand
        return M.GroundType.sand;
    elseif (TileID == 11) then -- grass
        return M.GroundType.grass;
    elseif (TileID == 2 or TileID == 15) then -- rocks
        return M.GroundType.rocks;
    elseif (TileID == 8 or TileID == 16) then -- dirt
        return M.GroundType.dirt;
    elseif (TileID == 10) then -- snow
        return M.GroundType.snow;
    end;

    return M.GroundType.unknown;
end;

--- This list contains the constants that are returned by GetGroundType.
-- @class Enumerator
M.GroundType = {
    ["unknown"] = 0,
    ["field"] = 1,
    ["forest"] = 2,
    ["sand"] = 3,
    ["grass"] = 4,
    ["rocks"] = 5,
    ["water"] = 6,
    ["dirt"] = 7,
    ["snow"] = 8
};

--- Create random number with normal distribution.
-- @param minVal Minimal value of the random number range
-- @param maxVal Maximal value of the random number range
-- @return The random number
function M.NormalRnd(minVal, maxVal)
    return M.NormalRnd2(minVal, maxVal, 10);
end;

--- Create random number with normal distribution.
-- @param minVal Minimal value of the random number range
-- @param maxVal Maximal value of the random number range
-- @param count How often will be diced
-- @return The random number
function M.NormalRnd2(minVal, maxVal, count)
    local base = 0;
    for _ = 1, count do
        base = base + math.random(maxVal - minVal + 1) - 1;
    end;
    return math.ceil(base / count) + minVal;
end;

--[[
    DeleteItemFromStack
    Searches for an item with given properties in a stack and deletes it.
    @param PositionStruct - Position of the stack
    @param List - A list containing the properties of the item to be deleted
    @return boolean

]]
function M.DeleteItemFromStack(stackPosition, itemProperties)

    if not world:isItemOnField(stackPosition) then
        return false
    end

    local theField = world:getField(stackPosition)
    local counter = 1
    local foundItem = false
    while counter <= theField:countItems() do
        local checkItem = theField:getStackItem(theField:countItems()- counter )
        if (itemProperties.itemId == checkItem.id) and (not itemProperties.deleteAmount or checkItem.number <= itemProperties.deleteAmount) and (not itemProperties.quality or checkItem.number == itemProperties.deleteAmount) then
            if itemProperties.data then
                for i=1,#itemProperties.data do
                    if not checkItem:getData(itemProperties["data"][1]["dataKey"]) == itemProperties["data"][1]["dataValue"] then
                        break
                    end
                end
            end
            foundItem = true
            break
        end
        counter = counter + 1
    end

    if not foundItem then
        return false
    end

    local deletedItems = {}
    for i=1,counter do
        local deleteItem = world:getItemOnField(stackPosition)
        if i ~= counter then
            table.insert(deletedItems,1,deleteItem)
            world:erase(deleteItem, deleteItem.number)
        else
            world:increase(deleteItem, -(itemProperties.deleteAmount or deleteItem.number))
        end
    end
    for i=1,#deletedItems do
        world:createItemFromItem(deletedItems[i],stackPosition,true)
    end

    return true

end

--[[
    GetItemsOnField
    Get a list of all items on a field
    IMPORTAINT: All items but the one on top are read only
    @param PositionStruct - The position of the tile that shall be checked
    @return List of ItemStructs - The list of all items on that field
]]
function M.GetItemsOnField(Fieldpos)
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
    GetItemInInventory
    Search the whole Inventory of a character for a Item and a Data value
    @param CharacterStruct - The characters who's inventory is checked
    @param integer - The item ID we are looking for
    @param list(list(string)) - Optional list of key-value pairs of the sought item. Default is an empty list.
            E.g. { {"amount", "4"}, {"valid", "true"} }. NOTE: key & value have to be both strings.
    @return mixed - The itemstruct of the first found item or nil.
]]
function M.GetItemInInventory(User, ItemID, DataValues)
  local ItemList = User:getItemList(ItemID);
  if (DataValues == nil) then
    DataValues = {};
  end
  for _, item in pairs(ItemList) do
    local dataOk = true;
    for _,d in pairs(DataValues) do
      if (item:getData(d[1]) ~= d[2]) then
        dataOk = false;
        break;
      end
    end
    if (dataOk) then
      return item;
    end;
  end;
  return nil;
end;

--[[
    GetStiffness
    Generate the sum of all stiffness values of the armor parts a character wears
    @param CharacterStruct - The character whos stiffness is checked
    @return integer - the stiffness value
    Reworked by Flux
]]
function M.GetStiffness(Character)

    local StiffnessVal = 0;
    local Item;
    local found;
    local Armor;

    local Equipmentposition = {1, 3, 4, 9, 10, 11};
    local counter;

    for counter = 1, #Equipmentposition do
                Item = Character:getItemAt(Equipmentposition[counter]);
                if Item and (Item.id ~= 0 ) then
                        found, Armor=world:getArmorStruct(Item.id);
                        if found then
                StiffnessVal = StiffnessVal + Armor.Stiffness
                        end;
                end;

    end


    --Old system
--[[
    if not InventoryFieds then
        InventoryFieds = {Character.Head, Character.Coat, Character.breast, Character.hands, Character.legs, Character.feet};
    end;
    for _, place in pairs(InventoryFieds) do
        Item=Character:getItemAt( place );
        if Item and (Item.id ~= 0) then
            found, Armor=world:getArmorStruct(Item.id);
            if found then
                StiffnessVal = StiffnessVal + Armor.Stiffness;
            end;
        end;
    end;]]
    return StiffnessVal;
end;

--[[
    ResetInterruption
    Resets the interruption counter state, in case the action did not success
    @param CharacterStruct - The character whos state is resetted
    @param LongTimeActionState - The state of the current action
]]
function M.ResetInterruption(Character, ltstate)
    if (ltstate ~= Action.success) and interruptTable then
        interruptTable[Character.id] = nil;
    end;
end;

--[[
    IsInterrupted
    Checks if a characters action is interrupted has a minimal amount of actions that
    will succeed all time before a interruption is possible.
    @param CharacterStruct - The character who is checked for a interruption
    @return boolean - true in case the action is interruped, false if not
]]
function M.IsInterrupted(Character)
    if not interruptTable then
        interruptTable = {};
        interruptTable[Character.id] = 2;
        return false;
    elseif not interruptTable[Character.id] then
        interruptTable[Character.id] = 2;
        return false;
    end;
    local rnd = math.random(20, 50);
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
function M.ParalyseCharacter(Target, Time, Cumulative, forced)

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
function M.IsCharacterParalysed(Character)

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

local circleCache = {}
--[[
    CreateCircle
    Calculates a circle based on a center position and a radius. It triggers a Event function
    on every position of the circle with the position of the circle as parameter
    @param PositionStruct - Center position of the circle
    @param integer - Radius of the circle
    @param function(PositionStruct) - Event function that is triggered for every position
]]
function M.CreateCircle(CenterPos, Radius, Event)
    if not Event then
        return
    end
    if not circleCache[Radius] then
        local irad = math.ceil(Radius);
        local dim = 2*(irad+1);
        local map = {} ;
        circleCache[Radius] = {};

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
                    table.insert(circleCache[Radius], position(x, y, 0));
                end;
            end;
        end;
    end;
    local go_on;
    for _, posi in pairs(circleCache[Radius]) do
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
function M.CreateLine(StartPos, TargetPos, Event)
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
function M.CreateTangentLine(CenterPos, TargetPos, ArmLength, Event)
    local phi = M.GetPhi( CenterPos, TargetPos ) + math.pi/2;

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
            first_go_on = Event(position(M.Round(TargetPos.x + i * xoffset),
                M.Round(TargetPos.y + i * yoffset), TargetPos.z));
            first_go_on = (first_go_on ~= nil and first_go_on or true);
        end;
        if second_go_on then
            second_go_on = Event(position(M.Round(TargetPos.x - i * xoffset),
                M.Round(TargetPos.y - i * yoffset), TargetPos.z));
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
function M.Scale(ScBegin, ScEnd, value)
    return M.ScaleUnlimited(ScBegin, ScEnd, M.Limit(value, 0, 100));
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
function M.ScaleUnlimited(ScBegin, ScEnd, value)
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
function M.Limit(value, min, max)
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
function M.Round(value, precision)
    if not precision then
        precision = 0;
    end;

    value = value * 10 ^ precision;

    if (math.fmod(value, 1) >= 0.5) then
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
function M.GetPhi(StartPos, TargetPos)
    if StartPos == TargetPos then
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
    ChangeAttribute
    Change a attribute by a given value and return the effective change
    @param CharacterStruct - The character whos attribute shall be changed
    @param string - The attribute that shall be changed
    @param integer - The value that the attribute shall be changed by
    @param integer - The bottom border [optional]
    @param integer - The top border [optional]
    @return integer - Change Value
]]
function M.ChangeAttribute( Character, attrib, value, bottomBorder, topBorder )
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
        value = bottomBorder - newValue;
        newValue = bottomBorder;
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
function M.RevertAttribute(Character, attrib, value)
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
function M.CopyPosition(Posi)
    return position(Posi.x, Posi.y, Posi.z);
end

--[[
    split
    splits a string into different parts
    @param str - the string which should be splitted
    @return pat - the pattern around what the string should be splittet
    example = split("hello:my:split:world",":") returns {"hello","my","split","world"}

    In case the pattern is only one character it is better to use string.gmatch.
]]
function M.split(str, pat)
    local t = {}
    if (string.len(pat) == 1) then
        for element in string.gmatch(str, "([^" .. pat .. "]+)[" .. pat .. "]?") do
            table.insert(t, element);
        end;
    else
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
        end;
    end;
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
function M.Split_number(Number, AmountOfDigits)

    local temptable = {};
    local tempcnt = 0;


    for i = (AmountOfDigits-1), 0, -1 do
        tempcnt = tempcnt + 1;
        temptable[tempcnt] = math.floor(math.fmod((Number / (10^i)), 10) + 0.5);
    end
    return temptable;
end


--[[
    Converts a given hour of day to a string like: early morning, morning,
    @param hour the hour which should be converted
    @return ger, eng strings
]]
function M.Hour_To_String(hour)
    if (hour >= 0 and hour < 2 or hour == 24) then
        return "gegen Mitternacht", "around midnight";
    elseif (hour >= 2 and hour < 4) then
        return "nach Mitternacht", "after midnight";
    elseif (hour >= 4 and hour < 6) then
        return "vor Sonnenaufgang", "before sunrise";
    elseif (hour >= 6 and hour < 8) then
        return "fr�her Morgen", "in the early morning";
    elseif (hour >= 8 and hour < 10) then
        return "morgens", "in the morning";
    elseif (hour >= 10 and hour < 12) then
        return "vormittags", "before noon";
    elseif (hour >= 12 and hour < 14) then
        return "gegen Mittag", "around noon";
    elseif (hour >= 14 and hour < 16) then
        return "nachmittags", "in the afternoon";
    elseif (hour >= 16 and hour < 18) then
        return "fr�her Abend", "in the early evening";
    elseif (hour >= 18 and hour < 20) then
        return "abends","in the evening";
    elseif (hour >= 20 and hour < 22) then
        return "sp�ter Abend", "in the late evening";
    else
        return "vor Mitternacht", "before midnight";
    end;
end;

--[[
    Converts a numeric month to a string like: Elos, Tanos,...
    @param month the moth which should be converted
    @return string
]]
function M.Month_To_String(month)

    MonthNames = {"Elos", "Tanos", "Zhas", "Ushos", "Siros", "Ronas", "Bras", "Eldas", "Irmas", "Malas", "Findos", "Olos", "Adras", "Naras", "Chos", "Mas"}; --List of our months

    if (month >= 1) and (month <= 16) then --only valid months
        return MonthNames[month]; --return the month as string
    else
        return "[ERROR] Corrupted date, please inform a developer.";
    end

end;

function M.fold(ar, f, neutral)
    result = neutral;
    for i,v in ipairs(ar) do
        result = f(result, v)
    end
    return result;
end

function M.map(ar, f)
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
function M.isItemIdInFieldStack( id, pos )

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
function M.removeItemIdFromFieldStack( id, pos )

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
function M.ExtgetPlayersInRangeOf(posi, radius)

    local ext = 2;
    plyList=world:getPlayersInRangeOf(posi, radius+ext);

    for i, player in pairs(plyList) do
        -- player not in rect, remove from list
        if not M.isInRect(player.pos, posi, radius) then
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
function M.isInRect(targetpos, posi, range)

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
function M.IsMonsterDocile( id )
    local docileList = {6,16,26,36,46,56,96,106,116,181,182,241,242,243,244,371,372,373,396,581,584,591,615,616,621,1054,1131,1132,1133,1134,1135,1136,1151,1152,1161,1162,1163,1164,1165}
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
function M.IsItemInHands( item )
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
function M.GetTargetItem( character, source )
    if not M.IsItemInHands(source) then
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
function M.GetRealDateTimeString()
    local year, month, day, hour, minute, second = M.GetRealDate();
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
function M.GetRealDateString()
    local year, month, day, hour, minute, second = M.GetRealDate();
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
function M.GetRealTimeString()
    local year, month, day, hour, minute, second = M.GetRealDate();
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
function M.GetRealDate()
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

-- Returns an NPC in case it is found within a given range of a give position
-- @param centerPosition Position structure that is the center of the search area.
-- @param radius Radius within which is searched
-- @param npcId The id of the npc to search for
-- @param npcName Name of the npc to search for
-- @return Returns the NPC in case it was found else false
function getNpc(centerPosition, radius, npcId, npcName)

    local npcs = world:getNPCSInRangeOf(centerPosition, radius)
    for _, candidateNpc in pairs(npcs) do
        if (npcName and candidateNpc.name == npcName) or (npcId and candidateNpc.name == npcName) then
            return candidateNpc
        end
    end

    return false

end

function M.PositionToText(pos)
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
function M.ListToNumber(NumberList)

   local result=NumberList[1];

   for i = 2, #NumberList do

      result = result ..NumberList[i];


   end
   result = tonumber(result);    --convert the string result   into a number
   return result;

end

--[[
    \fn:    Shuffle
    \brief: Shuffles the elements of a list (with consecutively number indices, no key strings!) using the modern Fisher-Yates algorithm.
    \usage: list = {5,2,7,9,1};
         list = Shuffle(list) shuffles the list and could return: list ={1,7,5,9,2}

   @param List The list that shall be shuffled
    @return The shuffled list
]]
function M.Shuffle(List)
    local j = 0
    local minIndex = 1
    local maxIndex = #List
    if (List[0] ~= nil) then -- check if zero index is used
        minIndex = 0
        maxIndex = maxIndex - 1
    end
    for i = maxIndex, minIndex+1, -1 do -- shuffle all elements
        j = Random.uniform(minIndex, i)
        List[i], List[j] = List[j], List[i]
    end
    return List
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
function M.CreateRandomNumberList(AmntElements, minval, maxval)

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
--     if not, nil]]

function M.CheckIfOnline(playername)
    playerlist = world:getPlayersOnline();

    for i = 1, #(playerlist) do
        if playerlist[i].name == playername then
        return playerlist[i]
        end
    end
    return nil
end

--- Looks up the name of the defined lead attribute of a given skill name.
-- @param Skill  The name of the skill.
-- @return String  The name of the corresponding lead attribute.
--                 NOTE: in case there is no lead attribute, nil will be returned.
function M.GetLeadAttributeName(Skill)

  if leadAttribTable==nil then

    leadAttribTable={};

    --Dexterity: All crafting skills for final products
    leadAttribTable[Character.tailoring]="dexterity"
    leadAttribTable[Character.smithing]="dexterity"
    leadAttribTable[Character.gemcutting]="dexterity"
    leadAttribTable[Character.carpentry]="dexterity"
    leadAttribTable[Character.cookingAndBaking]="dexterity"
    leadAttribTable[Character.goldsmithing]="dexterity"
    leadAttribTable[Character.glassBlowing]="dexterity"
    
    --Dexterity: Instruments (please remove these skills in future)
    leadAttribTable[Character.harp]="dexterity"
    leadAttribTable[Character.horn]="dexterity"
    leadAttribTable[Character.flute]="dexterity"
    leadAttribTable[Character.lute]="dexterity"

    --Constitution: All gathering skills
    leadAttribTable[Character.herblore]="constitution"
    leadAttribTable[Character.mining]="constitution"
    leadAttribTable[Character.fishing]="constitution"
    leadAttribTable[Character.firingBricks]="constitution"
    leadAttribTable[Character.farming]="constitution"
    leadAttribTable[Character.woodcutting]="constitution"

    --Agility: Defensive fighting skills
    leadAttribTable[Character.parry]="agility"
    leadAttribTable[Character.heavyArmour]="agility"
    leadAttribTable[Character.mediumArmour]="agility"
    leadAttribTable[Character.lightArmour]="agility"

    --Perception: Archery
    leadAttribTable[Character.distanceWeapons]="perception"

    --Strength: Offensive fighting skills
    leadAttribTable[Character.slashingWeapons]="strength"
    leadAttribTable[Character.wrestling]="strength"
    leadAttribTable[Character.concussionWeapons]="strength"
    leadAttribTable[Character.punctureWeapons]="strength"

    --Essence: Alchemy
    leadAttribTable[Character.alchemy]="essence"

    --Intelligence: Magic
    --No skills yet

    --Willpower: Priests
    --No skills yet

    --Deactivated skills
    --leadAttribTable[Character.dodge]="agility" --deactivated
    --leadAttribTable[Character.tactics]="perception" --deactivated
    --leadAttribTable[Character.magicResistance]="wilpower" --please reconsider once you work on magic
    --leadAttribTable[Character.poisoning]="perception" --deactivated

  end

  return leadAttribTable[Skill]

end

--- Looks up the lead attribute value of a given skill name.
-- @param Skill  The name of the skill.
-- @param user   The character whose attributes are evaluated
-- @return The value of the corresponding lead attribute.
--                 NOTE: in case there is no lead attribute, 10 will be returned.

function M.GetLeadAttrib(user, Skill)

  local leadAttribName = M.GetLeadAttributeName(Skill)
  
  if leadAttribName ~= nil then
  
    return user:increaseAttrib(leadAttribName, 0)
    
  end
    
  return 10 --10 should be default
  
end

--- Calculates an universal attribute bonus
-- Recommendation: Use together with GetLeadAttrib to calculate the bonus of a lead attribute on a skill related action
-- @param attribute  The value of the attribute
-- @param range   The range of the bonus (1 +/- range)
-- @return  The value of the bonus
--                 NOTE: 1 will be returned if something goes wrong

function M.GetAttributeBonus (attribute,range)

    if attribute ~= nil and attribute ~= 0 then
        bonus=math.min(1+2*range, (1-range) + range * (attribute / 10)) --1 +/- range for attributes 0-20. Bonus capped at attribute 30
    else
        bonus=1 --default
    end
    
    return bonus

end

--- Searches in an area for an item id.
-- @param CenterPos  Position struct of the center position of the area.
-- @param ItemId  The ID of the sought item.
-- @param Radius  Around the CenterPos, an area of +/-Radius is queried in x and y direction.
--                Default value is 1.
-- @param OnlyWriteable  Bool that defines if only writeable items should be returned.
--                       Default value is false.
-- @return scrItem  If an item with ItemId is found, this is the first one found. Otherwise it is nil.
-- @return bool  Writeable flag. If there are multiple items on the field, only the top one is writeable.
--               If none is found, nil is returned.
function M.GetItemInArea(CenterPos, ItemId, Radius, OnlyWriteable)
  if (Radius == nil) then
    Radius = 1;
  end
  if (OnlyWriteable == nil) then
    OnlyWriteable = false;
  end
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local field = world:getField(position(CenterPos.x + x, CenterPos.y + y, CenterPos.z));
      local itemCount = field:countItems();
      if (itemCount > 0) then
        if (OnlyWriteable) then
          itemCount = 1;
        end
        for i=0,itemCount-1 do
          local item = field:getStackItem(i);
          if (item.id == ItemId) then
            item.pos.x = CenterPos.x + x;
            item.pos.y = CenterPos.y + y;
            return item, (i==0);
          end
        end
      end
    end
  end
  return nil, nil;
end

-- Checks if a given position is located on the tutorial island Noobia.
-- @param posStruct Pos  The position to check.
-- @return bool  True if position is located on Noobia, false otherwise.
function M.isOnNoobia(Pos)
  if (Pos.z == 100) then
    return true;
  end
  return false;
end

-- Checks if a given position is located in the prison mine.
-- @param posStruct Pos  The position to check.
-- @return bool  True if position is located in Prison mine, false otherwise.
function M.isInPrison(Pos)
  if (Pos.z == -40) then
    return true;
  end
  return false;
end

--- Convert a RGB color to a HSV color.
-- @param red the red color component in a range from 0 to 255
-- @param green the green color component in a range from 0 to 255
-- @param blue the blue color component in a range from 0 to 255
-- @return hue, saturation, value color components. Hue in a range from 0� to 360�. Saturation and value in a range
--         from 0 to 1
function M.RGBtoHSV(red, green, blue)
    local max = math.max(red, green, blue)
    local min = math.min(red, green, blue)
    if max > 255 or min < 0 then
        error("The color values are rgb to hsv conversation are out of bounds.")
    end

    local delta = max - min
    local hue
    if delta == 0 then
        hue = 0
    elseif max == red and green >= blue then
        hue = 60 * (green - blue) / delta
    elseif max == red and green < blue then
        hue = 60 * (green - blue) / delta + 360
    elseif max == green then
        hue = 60 * (blue - red) / delta + 120
    elseif max == blue then
        hue = 60 * (red - green) / delta + 240
    end

    local saturation
    if max == 0 then
        saturation = 0
    else
        saturation = 1 - min/max
    end

    return hue, saturation, max / 255
end

--- Convert a HSV color value to a RGB color value.
-- @param hue The hue value in degrees. Values larger then 360� are wrapped until they fit the range from 0� to 360�
-- @param saturation The saturation value in a range from 0 to 1
-- @param value The color value in a range from 0 to 1
-- @return red, green, blue color value in a range from 0 to 255 as integer value
function M.HSVtoRGB(hue, saturation, value)
    local realHue = hue % 360
    if saturation < 0 or saturation > 1 then
        error("Saturation is out of bounds: " + saturation)
    end
    if value < 0 or value > 1 then
        error("Saturation is out of bounds: " + value)
    end

    local c = saturation * value
    local x = c * (1 - math.abs(((realHue / 60) % 2) - 1))
    local m = value - c
    local red = 0
    local green = 0
    local blue = 0
    if realHue >= 0 and realHue < 60 then
        red = c
        green = x
    elseif realHue >= 60 and realHue < 120 then
        red = x
        green = c
    elseif realHue >= 120 and realHue < 180 then
        green = c
        blue = x
    elseif realHue >= 180 and realHue < 240 then
        green = x
        blue = c
    elseif realHue >= 240 and realHue < 300 then
        red = x
        blue = c
    elseif realHue >= 300 and realHue < 360 then
        red = c
        blue = x
    end

    local function fixValue(v)
        return math.floor((v + m) * 255 + 0.5)
    end

    return fixValue(red), fixValue(green), fixValue(blue)
end

-- Checks wether an item has a special name, description or the specialItem data set
-- @param the item to be checked
-- @return bool  True if it is special, else false
function M.isSpecialItem(item)
    if item:getData("nameEn") ~= "" or item:getData("descriptionEn") ~= "" or item:getData("specialItem") ~= "" then
        return true
    end
    return false
end

return M