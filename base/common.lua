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
    return (User:getPlayerLanguage() == Player.german and textInDe or textInEn)
end

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

---
-- Notify user about an error, write it to log and raise exception (stop the execution)
-- @param User The character who receives the message
-- @param message The error message as string. In English. Should end with "."
function M.informError(User, message)
    User:inform("[ERROR] " .. message .. " Please inform a developer.")
    error(message)
end

---
-- Show selection dialog with defined properties
-- @param User - the character to receive the dialog
-- @param title - string - the dialog title
-- @param description - string - the text below the title
-- @param buttons - a list of tables that define dialog options, with following fields:
--          icon - itemId of the icon to be displayed
--          text - text to be displayed
--          func - function to be called if this button is pressed, if nil than nothing is done
--          args - arguments to be passed to func
-- @param onclose - a table that defines what happens if dialog is closed, if nil than nothing is done
--          func - function to be called
--          args - arguments to be passed to func
-- @param closeOnMove - whether dialog closes when char moves, default is `true`
--
function M.selectionDialogWrapper(User, title, description, buttons, onclose, closeOnMove)
    onclose = onclose or { func = function() end, args = {} }
    if closeOnMove == nil then
        closeOnMove = true
    end
    -- User:inform("#buttons = " .. #buttons)
    buttons = buttons or {}
    local callback = function(dialog)
        if (not dialog:getSuccess()) then
            onclose.func(table.unpack(onclose.args))
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index >= 1 and index <= #buttons then
            if buttons[index].func ~= nil then
                buttons[index].func(table.unpack(buttons[index].args))
            end
        else
            User:inform("[ERROR] No valid function. Please inform a developer.")
        end
    end
    local sd = SelectionDialog(title, description, callback)
    for _, btn in ipairs(buttons) do
        local icon = btn.icon or 0
        local text = btn.text or ""
        sd:addOption(icon, text)
    end
    if closeOnMove then
        sd:setCloseOnMove()
    end
    User:requestSelectionDialog(sd)
end


--- Get a text based on the gender of the character.
-- @param User The character used to choose the text
-- @param textMale The text returned in case the character is male
-- @param textFemale The text returned in case the character is female
-- @return textMale or textFemale, based on the gender of User
function M.GetGenderText(User, textMale, textFemale)
    return (User:increaseAttrib("sex", 0) == 1 and textFemale or textMale)
end

--[[ Get the frst letter in a text uppercase.
@param text: "the text"
@return text: "The text" ]]--
function M.firstToUpper(text)
    if M.IsNilOrEmpty(text) then
        return text
    end
    text = tostring(text)
    return (text:gsub("^%l", string.upper))
end

--[[ Replace Umlaute by possible character.
@param text: "the text with an ä."
@return text: "the text with an ae."]]--
function M.replaceUmlaut(text)
    if M.IsNilOrEmpty(text) then
        return text
    end
    text = tostring(text)
    text = text:gsub("ä","ae")
    text = text:gsub("ö","oe")
    text = text:gsub("ü","ue")
    text = text:gsub("Ä","Ae")
    text = text:gsub("Ö","Oe")
    text = text:gsub("Ü","Ue")
    text = text:gsub("ß","ss")
    return text
end

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
        return true
    end
    if (Value <= 0) then
        return false
    end

    if (Base ~= nil) and (Base ~= 1) then
        Value = Value / Base
    end

    return (math.random() <= Value)
end

--- Determine if a character is looking at a position or not
-- @param User The character whos looking direction matters
-- @param Location The position the character should look at
-- @return true in case the character looks at the position, else false
function M.IsLookingAt(User, Location)
    if not User or not Location then
        return false
    end

    if User.pos == Location then
        return true
    end

    local richtung = User:getFaceTo()

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
                ((Location.y < User.pos.y) and (Location.x < User.pos.x))))
end

--- Check if a character sequence (string) is nil or empty.
-- @param the variable to check
-- @return true in case the text is nil or equal to a empty string
function M.IsNilOrEmpty(text)
    return ((text == nil) or (text == ""))
end

--- Determine the direction from one position to another one
-- @param StartPosition The start position. The place you get the direction you have to look towards to see the target location
-- @param TargetPosition The target position
-- @return value for the direction, possible values are: Character.dir_north, Character.dir_northeast, Character.dir_east, Character.dir_southeast, Character.dir_south, Character.dir_southwest, Character.dir_west, Character.dir_northwest
function M.GetDirection(StartPosition, TargetPosition)
    if (StartPosition.z < TargetPosition.z) then
        return Character.dir_up
    elseif (StartPosition.z > TargetPosition.z) then
        return Character.dir_down
    end

    local phi = M.GetPhi(StartPosition, TargetPosition)

    if (phi < math.pi / 8) then
        return Character.dir_east
    elseif (phi < 3 * math.pi / 8) then
        return Character.dir_southeast
    elseif (phi < 5 * math.pi / 8) then
        return Character.dir_south
    elseif (phi < 7 * math.pi / 8) then
        return Character.dir_southwest
    elseif (phi < 9 * math.pi / 8) then
        return Character.dir_west
    elseif (phi < 11 * math.pi / 8) then
        return Character.dir_northwest
    elseif (phi < 13 * math.pi / 8) then
        return Character.dir_north
    elseif (phi < 15 * math.pi / 8) then
        return Character.dir_northeast
    else
        return Character.dir_east
    end
end

--- Turn a character towards a location
-- @param User The character who shall be turned
-- @param Location The position the character shall turn to
function M.TurnTo(User, Location)
    local oldDir = User:getFaceTo()
    local newDir = M.GetDirection(User.pos, Location)

    if (newDir ~= oldDir) then
        User:turn(newDir)
    end
end

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
    local Posi = M.GetFrontPosition(User, 1, dir)

    if world:isItemOnField(Posi) then
        return world:getItemOnField(Posi)
    else
        return nil
    end
end

--- Get the ID of the item that is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The ID of the item in front of the character or 0 in case there is none
function M.GetFrontItemID(User, dir)
    local theItem = M.GetFrontItem(User, dir)

    if not theItem then
        return 0
    else
        return theItem.id
    end
end

--- Get character who is in front of the character in case there is one
-- @param User The character whos front area is searched
-- @return The character in front of the parameter character or nil
function M.GetFrontCharacter(User)
    local Posi = M.GetFrontPosition(User)

    if world:isCharacterOnField(Posi) then
        return world:getCharacterOnField(Posi)
    else
        return nil
    end
end

--- Get the position right behind a character
-- @param User The character the back position is wanted
-- @param distance How far behind the char? Defaults to 1.
-- @return The position behind the character
function M.GetBehindPosition(User, distance)

    local d = distance or 1
    local direct = User:getFaceTo()

    if (direct == Character.north) then
        return position(User.pos.x, User.pos.y + d, User.pos.z)
    elseif (direct == Character.northeast) then
        return position(User.pos.x - d, User.pos.y + d, User.pos.z)
    elseif (direct == Character.east) then
        return position(User.pos.x - d, User.pos.y, User.pos.z)
    elseif (direct == Character.southeast) then
        return position(User.pos.x + d, User.pos.y - d, User.pos.z)
    elseif (direct == Character.south) then
        return position(User.pos.x, User.pos.y - d, User.pos.z)
    elseif (direct == Character.southwest) then
        return position(User.pos.x + d, User.pos.y - d, User.pos.z)
    elseif (direct == Character.west) then
        return position(User.pos.x + d, User.pos.y, User.pos.z)
    elseif (direct == Character.northwest) then
        return position(User.pos.x + d, User.pos.y + d, User.pos.z)
    end

    debug("Invalid user direction")
end

--- Get the item that is behind the character in case there is one
-- @param User The character whos back area is searched
-- @return The item that was found or nil
function M.GetBehindItem(User)
    local Posi = M.GetBehindPosition(User)

    if world:isItemOnField(Posi) then
        return world:getItemOnField(Posi)
    else
        return nil
    end
end

--- Get the ID of the item that is behind the character in case there is one
-- @param User The character whos back area is searched
-- @return The ID of the item in front of the character or 0 in case there is none
function M.GetBehindItemID(User)
    local theItem = M.GetBehindItem(User)

    if not theItem then
        return 0
    else
        return theItem.id
    end
end

--- Get character who is behind the character in case there is one
-- @param User The character whos front area is searched
-- @return The character in front of the parameter character or nil
function M.GetBehindCharacter(User)
    local Posi = M.GetBehindPosition(User)

    if world:isCharacterOnField(Posi) then
        return world:getCharacterOnField(Posi)
    else
        return nil
    end
end

--- Check if a character is within a area determined with 2 positions. The
-- rectangle of the area is determined by the grid of the tiles
-- @param User The character who is checked for being within the area
-- @param Pos1 The first position to determine the area
-- @param Pos2 The second position to determine the area
-- @return True if the character is in the area, false if not
function M.GetInArea(User, Pos1, Pos2)
    if (User.pos.x <= math.min(Pos1.x, Pos2.x) or
        User.pos.x >= math.max(Pos1.x, Pos2.x)) then
        return false
    elseif (User.pos.y <= math.min(Pos1.y, Pos2.y) or
        User.pos.y >= math.max(Pos1.y, Pos2.y)) then
        return false
    elseif (User.pos.z <= math.min(Pos1.z, Pos2.z) or
        User.pos.z >= math.max(Pos1.z, Pos2.z)) then
        return false
    end
    return true
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

--Counts passable fields around a center location. The search is performed with a square mask. So the search
--  area is actually a rectangle with the with a side length of searchRadius + 2
-- @param centerPosition the center of the search
-- @param searchRadius the radius of the search
-- @return number of passable fields
function M.getNumberOfPassableFieldsInArea(centerPos, searchRadius)
    local countPos = 0
    for x = -searchRadius, searchRadius do
        for y = -searchRadius, searchRadius do
            local pos = position(centerPos.x + x, centerPos.y + y, centerPos.z)
            local field = world:getField(pos)
            if field ~= nil then
                if field:isPassable() then
                    countPos = countPos + 1
                end
            end
        end
    end
    return countPos
end

--Counts passable fields around a center location. The search is performed with a given relativ mask.
-- @param centerPos the center of the search
-- @param relativePoss table of reltive positions
-- @return number of passable fields
function M.getNumberOfPassableFieldsFromList(centerPos, relativePos)
    local countPos = 0
    if relativePos == nil or #relativePos == 0 then
        return 0
    else
        for i=1, #relativePos do
            local pos = position(centerPos.x + relativePos[i][1], centerPos.y + relativePos[i][2], centerPos.z + relativePos[i][3])
            local field = world:getField(pos)
            if field ~= nil then
                if field:isPassable() then
                    countPos = countPos + 1
                end
            end
        end
    end
    return countPos
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
end

--- Checks if the Character has a minimal default amount of food points. If not
-- it prints out a inform message.
-- @param User The character whos foodpoints are checked
-- @return True in case the character has enougth food points, false if not
function M.FitForWork(User)
    return M.FitForHardWork(User, 1000)
end

--- Checks if the Character has a minimal amount of food points. If not it
-- prints out a inform message-
-- @param User The character whos foodpoints are checked
-- @param required Amount of foodpoints that are required
-- @return True in case the character has enougth food points, false if not
function M.FitForHardWork(User, required)

    if (User:increaseAttrib("foodlevel", 0) < required) or (User:increaseAttrib("foodlevel", 0) < 1000) then
        M.InformNLS(User,
        "Du bist dafür zu erschöpft. Du solltest etwas essen.",
        "You are too exhausted for that. You should eat something.")
        return false
    end
    
    return true
    
end

--- Decrease the foodpoints of a character and show a warning if the foodpoints
-- are running low.
-- @param User The character that loses foodpoints
-- @param units The amount of foodpoints that are removed
function M.GetHungry(User, units)

    local food = User:increaseAttrib("foodlevel", -units)
    
    if (food <= 6000) and ((food + units) > 6000) then
        M.InformNLS(User,
        "Die Arbeit macht dich langsam müde und hungrig.",
        "You are getting tired and hungry from your work.")
    end
    
end

--- Damage an item
-- @param user The character who has the item
-- @param item The item that gets damaged
-- @param workTime The time the item is used
-- @return true if the item breaks, false if not
function M.ToolBreaks(user, item, workTime)

    if not user or not item or not workTime then
        return false
    end
    
    loss=math.floor(workTime/180) --Each durability point equals 18 seconds of crafting time. Hence, a new tool lasts 30 minutes.
    remainder=workTime-loss
    
    if (math.random(1, 100) < (remainder/1.8)) then 
        loss=loss+1
    end

    local durability = math.fmod(item.quality, 100)
    local quality = (item.quality - durability) / 100

    durability = durability - loss
    
    if (durability <= 0) then
    
        world:erase(item, 1)
        return true
      
    end

    item.quality = quality * 100 + durability
    world:changeItem(item)

    if (durability <= 10) and (loss > 0) then
      M.InformNLS(user,
      "Das Werkzeug wird nicht mehr lange halten. Du solltest dich nach einem neuen umschauen oder es reparieren lassen.",
      "The tool looks like it could break soon. You should try to get a new one or get it repaired.")
    end

    return false

end

--[[function set for item quality and durability
item.quality contains quality and durability
637 means: quality=6, durability=37
default value is 333
]]--
M.ITEM_MAX_QUALITY = 9
M.ITEM_DEFAULT_QUALITY = 3
M.ITEM_MAX_DURABILITY = 99
M.ITEM_DEFAULT_DURABILITY = 33

-- Get durability of an item
-- @param item the item to be checked
-- @return durability (1-99)
function M.getItemDurability(item)
    local durability = math.fmod(item.quality, 100)
    return durability
end

-- Set durability of an item
-- @param item the item to be changed
-- @param newDurability (1-99)
function M.setItemDurability(item, newDurability)
    local quality = M.getItemQuality(item)
    item.quality = M.calculateItemQualityDurability(quality, newDurability)
    world:changeItem(item)
end

-- Get quality of an item
-- @param Item the item to be checked
-- @return quality (1-9)
function M.getItemQuality(item)
    local durability = math.fmod(item.quality, 100)
    local quality = (item.quality - durability) / 100
    return quality
end

-- Set quality of an item
-- @param item the item to be changed
-- @param newQuality (1-9)
function M.setItemQuality(item, newQuality)
    local durability = M.getItemDurability(item)
    item.quality = M.calculateItemQualityDurability(newQuality, durability)
    world:changeItem(item)
end

-- Set quality and durability of an item
-- @param item the item to be checked
-- @param newQuality (1-9)
-- @param newDurability (1-99)
function M.setItemQualityDurability(item, newQuality, newDurability)
    item.quality = M.calculateItemQualityDurability(newQuality, newDurability)
    world:changeItem(item)
end

-- calculates and verify the item state for item.quality
-- @param quality (1-9)
-- @param durability (1-99)
-- @return value for item.quality
-- default value is 333
-- calculateItemQualityDurability (nil, nil) = 333
function M.calculateItemQualityDurability (quality, durability)
    local qualityNumber
    if M.IsNilOrEmpty(quality) then
        qualityNumber = ITEM_DEFAULT_QUALITY
    else
        qualityNumber= tonumber(quality)
    end
    if qualityNumber < 1 or qualityNumber > M.ITEM_MAX_QUALITY then
        qualityNumber = ITEM_DEFAULT_QUALITY
    end
    
    local durabilityNumber = tonumber(durability)
    if M.IsNilOrEmpty(durability) then
        durabilityNumber = M.ITEM_DEFAULT_DURABILITY
    else
        durabilityNumber= tonumber(durability)
    end
    if durabilityNumber < 1 or durabilityNumber > M.ITEM_MAX_DURABILITY then
        durabilityNumber = M.ITEM_DEFAULT_DURABILITY
    end
    
    return qualityNumber * 100 + durabilityNumber
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
        world:getTime("second"))
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
     )
end


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
    local year = math.floor(timestamp / 31536000)
    timestamp = timestamp - (year * 31536000)

    --Calculating day
    --86400 = 60*60*24
    local day = math.floor(timestamp / 86400)
    timestamp = timestamp - (day * 86400)
    day = day + 1

    -- Calculating month
    -- 24 days per month
    local month = math.floor(day / 24)
    day = day - (month * 24)

    -- checking for range borders and fixing the date
    if (day == 0) then
        if (month > 0 and month < 16) then
            day = 24
        else
            day = 5
        end
    else
        month=month+1
    end

    if (month == 0) then
        month = 16
        year = year - 1
    end


    -- Calculate the time of day
    -- Calculating hour
    -- 3600 = 60 * 60
    local hour = math.floor(timestamp / 3600)
    timestamp = timestamp - (hour * 3600)
    --Calculating minute
    local minute = math.floor(timestamp / 60)
    --seconds
    timestamp = timestamp - (minute * 60)
    return year,month,day,hour,minute,timestamp
end

--- Determines the type of ground a tile has.
-- @param TileID ID of the tile that should be checked
-- @return The ground typ as one of the following constants:  GroundType.unknown, GroundType.field, GroundType.forest, GroundType.sand, GroundType.gras, GroundType.rocks, GroundType.water, GroundType.dirt
function M.GetGroundType(TileID)
    if (TileID == 4) then -- field
        return M.GroundType.field
    elseif (TileID == 6) then -- water
        return M.GroundType.water
    elseif (TileID == 9) then -- forest
        return M.GroundType.forest
    elseif (TileID == 3 or TileID == 12) then -- sand
        return M.GroundType.sand
    elseif (TileID == 11) then -- grass
        return M.GroundType.grass
    elseif (TileID == 2 or TileID == 15) then -- rocks
        return M.GroundType.rocks
    elseif (TileID == 8 or TileID == 16) then -- dirt
        return M.GroundType.dirt
    elseif (TileID == 10) then -- snow
        return M.GroundType.snow
    end

    return M.GroundType.unknown
end

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
}

--- Create random number with normal distribution.
-- @param minVal Minimal value of the random number range
-- @param maxVal Maximal value of the random number range
-- @return The random number
function M.NormalRnd(minVal, maxVal)
    return M.NormalRnd2(minVal, maxVal, 10)
end

--- Create random number with normal distribution.
-- @param minVal Minimal value of the random number range
-- @param maxVal Maximal value of the random number range
-- @param count How often will be diced
-- @return The random number
function M.NormalRnd2(minVal, maxVal, count)
    local base = 0
    for _ = 1, count do
        base = base + math.random(maxVal - minVal + 1) - 1
    end
    return math.ceil(base / count) + minVal
end

--- Sample from categorical distribution, e.g. rolling an N-sided die
-- @param cumulativeProb - array of legth N - cumulative sum of probabilities
--          should be monotonic non-decreasing, first element is the probability of first category
--          every other element is sum of previous element and probability of current category
--          last element should be 1
-- @return int - the index of category that won
--
function M.randomCategorical(cumulativeProb)
    local r = math.random()
    local category
    for i,v in ipairs(cumulativeProb) do
        if r <= v then
            category = i
            break
        end
    end
    assert(category, "Failed sampling categorical distribution, last cumulativeProbability was " .. cumulativeProb[#cumulativeProb])
    return category
end

--- Sample from multinomial distribution, i.e. repeated categorical trials
-- @param numTrials - number of categorical trials to simulate. Sum of values in returned array will be equal to this.
-- @param cumulativeProb - cumulative sum of probabilities, same as in randomCategorical function
-- @return array of integers - number of times each category won
--
function M.randomMultinomial(numTrials, cumulativeProb)
    local result = {}
    for i = 1, #cumulativeProb do
        result[i] = 0
    end
    for _ = 1, numTrials do
        local category = M.randomCategorical(cumulativeProb)
        result[category] = result[category] + 1
    end
    return result
end


local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

local TimeList = {}
function M.spamProtect(character, delay)
    if not isValidChar(character) then
        error("The parameter 'character' is not a valid character as it was expected.")
    end

    delay = delay or 1
    if not _isNumber(delay) then
        error("The parameter 'delay' is not a number as it was expected.")
    elseif delay < 1 then
        error("The parameter 'delay' must be a positive number.")
    end

    if TimeList[character.id] ~= nil then
        if (math.abs(world:getTime("unix") - TimeList[character.id])) <= delay then
            return true
        end
    end
    TimeList[character.id] = world:getTime("unix")
    return false
end

--[[
    CreateItem
    Safely create an item
    @return boolean - true if all fits in player's inventory, false if something was created on the ground
]]
function M.CreateItem(character, id, amount, quality, data, wear)
    if not isValidChar(character) then
        error("The parameter 'character' is not a valid character as it was expected.")
    end

    if not _isNumber(id) then
        error("The parameter 'id' is not a number as it was expected.")
    elseif id < 1 then
        error("The parameter 'id' must be a positive number.")
    end

    if not _isNumber(amount) then
        error("The parameter 'amount' is not a number as it was expected.")
    elseif amount < 1 then
        error("The parameter 'amount' must be a positive number.")
    end

    if not _isNumber(quality) then
        error("The parameter 'quality' is not a number as it was expected.")
    elseif quality < 101 or quality > 999 then
        error("The parameter 'quality' must be a number between 101 and 999.")
    end

    if data ~= nil and not _isTable(data) then
        error("The parameter 'data' is not a table as it was expected.")
    end
    
    if wear ~= nil and not _isNumber(wear) then
        error("The parameter 'wear' must be a number.")
    elseif wear ~= nil and (wear < 1 or wear > 254) then
        error("The parameter 'wear' must be a number between 1 and 254.")
    end

    local notCreated = character:createItem(id, amount, quality, data)
    if notCreated == 0 then
        return true
    end

    local maxStack = world:getItemStatsFromId(id).MaxStack
    while (notCreated > 0) do
        -- work around an issue to prevent creation of stacks of unstackable items
        local minimum = math.min(notCreated, maxStack)
        local createdItem = world:createItemFromId(id, minimum, character.pos, true, quality, data)
        createdItem.wear = wear
        notCreated = notCreated - minimum
    end

    if not M.spamProtect(character) then
        character:inform(
            "Du kannst nichts mehr halten und der Rest fällt zu Boden.",
            "You can't carry any more and the rest drops to the ground.",
            Player.highPriority)
    end
    return false
end

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
    local Field = world:getField(Fieldpos)
    if (Field == nil) then
        return {}
    end
    local ItemsCount = Field:countItems()
    local retList = {}
    if (ItemsCount > 0) then
        for i=0, ItemsCount-1 do
            local Item = Field:getStackItem(i)
            table.insert(retList, Item)
        end
    end
    return retList
end

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
  local ItemList = User:getItemList(ItemID)
  local dataOK
  local hasData = true
  if (DataValues == nil or #DataValues == 0) then
    hasData = false
  end
  for _, item in pairs(ItemList) do
    dataOK = true
    if hasData then
        for _, data in pairs(DataValues) do
            if (tostring(item:getData(data[1])) ~= tostring(data[2])) then
                dataOK = false
            end
        end
    end
    if dataOK then
        return item
    end
  end
  return nil
end

--[[
    GetStiffness
    Generate the sum of all stiffness values of the armor parts a character wears
    @param CharacterStruct - The character whos stiffness is checked
    @return integer - the stiffness value
    Reworked by Flux
]]
function M.GetStiffness(Character)

    local StiffnessVal = 0
    local Item
    local found
    local Armor

    local Equipmentposition = {1, 3, 4, 9, 10, 11}
    local counter

    for counter = 1, #Equipmentposition do
                Item = Character:getItemAt(Equipmentposition[counter])
                if Item and (Item.id ~= 0 ) then
                        found, Armor=world:getArmorStruct(Item.id)
                        if found then
                            StiffnessVal = StiffnessVal + Armor.Stiffness
                        end
                end

    end

    return StiffnessVal
end

--[[
    ResetInterruption
    Resets the interruption counter state, in case the action did not success
    @param CharacterStruct - The character whos state is resetted
    @param LongTimeActionState - The state of the current action
]]
function M.ResetInterruption(Character, ltstate)
    if (ltstate ~= Action.success) and interruptTable then
        interruptTable[Character.id] = nil
    end
end

--[[
    IsInterrupted
    Checks if a characters action is interrupted has a minimal amount of actions that
    will succeed all time before a interruption is possible.
    @param CharacterStruct - The character who is checked for a interruption
    @return boolean - true in case the action is interruped, false if not
]]
function M.IsInterrupted(Character)
    if not interruptTable then
        interruptTable = {}
        interruptTable[Character.id] = 2
        return false
    elseif not interruptTable[Character.id] then
        interruptTable[Character.id] = 2
        return false
    end
    local rnd = math.random(20, 50)
    if ( interruptTable[Character.id] > rnd ) then
        interruptTable[Character.id] = nil
        return true
    end
    interruptTable[Character.id] = interruptTable[Character.id] + 1
    return false
end

--[[
    ParalyseCharacter
    Paralyses a character with a lte or by the actionpoints for setted time
    @param CharacterStruct - The character that shall be paralysed
    @param integer - The time in seconds the character shall be paralysed
    @param boolean - true if the time shall be added to an exsisting paralizing, false if the old values shall just be overwritten
    @param boolean - true(default) if a LTE shall be used to stunn the character. In this case its not intended to release the stunn any time ealier. False if not
    @return boolean - true if anything was done. false if not.
]]
function M.ParalyseCharacter(Target, Time, Cumulative, forced)

    if not Time or (Time == 1) then
        return false
    end

    if (forced == nil) then
        forced = true
    end

    if not forced then
        if Cumulative then
            Target.actionpoints = Target.actionpoints - ( Time * 10 )
        else
            Target.actionpoints = 30 - ( Time * 10 )
        end
        return true
    end

    local foundEffect, Paralysis = Target.effects:find(23)
    local timeLeft = 0

    if not foundEffect then
        if (Time < 1) then
            return false
        end
        Paralysis = LongTimeEffect(23, 1)
        Target.effects:addEffect(Paralysis)
    else
        local foundTime
        foundTime, timeLeft = Paralysis:findValue("timeLeft")
        if not foundTime then
            timeLeft=0
        end
    end

    if (0 < Time and Cumulative) or (Time < 0) then
        Time = Time + timeLeft
    else
        Time = math.max(Time, timeLeft)
    end

    if (Time ~= timeLeft) then
        Paralysis:addValue("timeLeft", math.max(0,Time))
        return true
    end

    return false
end

--[[
    IsCharacterParalysed
    Checks if the character is stunned by the stunning LTE
    @param CharacterStruct - The character that shall be checked
    @return integer - The amount of setting remaining in the stunn or nil if not stunned
]]
function M.IsCharacterParalysed(Character)

    local foundEffect, Paralysis = Character.effects:find(23)
    if not foundEffect then
        return nil
    else
        local foundTime, timeLeft = Paralysis:findValue("timeLeft")
        if foundTime then
            return timeLeft
        end
    end
    return nil
end

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
        local irad = math.ceil(Radius)
        local dim = 2*(irad+1)
        local map = {}
        circleCache[Radius] = {}

        for x = -irad - 1, irad do
            map[x] = {}
            for y = -irad - 1, irad do
                map[x][y] = (x + 0.5) * (x + 0.5) + (y + 0.5) * (y + 0.5) - irad * irad > 0
            end
        end

        for x = -irad, irad do
            for y = -irad, irad do
                if not (map[x][y] and map[x-1][y] and map[x][y-1] and map[x-1][y-1])
                   and (map[x][y] or map[x-1][y] or map[x][y-1] or map[x-1][y-1]) then
                    table.insert(circleCache[Radius], position(x, y, 0))
                end
            end
        end
    end
    local go_on
    for _, posi in pairs(circleCache[Radius]) do
        go_on = Event(position(CenterPos.x + posi.x, CenterPos.y + posi.y, CenterPos.z))
        if (go_on == false and go_on ~= nil) then
            return true
        end
    end
end

--[[
    CreateLine
    Calculates a straight line between 2 position and triggers a Event function for every position
    @param PositionStruct - First position of the line
    @param PositionStruct - Second position of the line
    @param function(PositionStruct) - Event function that is triggered for every position
]]
function M.CreateLine(StartPos, TargetPos, Event)
    local XDiff2 = math.abs(StartPos.x - TargetPos.x)
    local YDiff2 = math.abs(StartPos.y - TargetPos.y)
    local PriDiff = math.max(XDiff2, YDiff2)
    local SecDiff = math.min(YDiff2, XDiff2)
    local XMod = (StartPos.x < TargetPos.x and -1 or 1)
    local YMod = (StartPos.y < TargetPos.y and -1 or 1)
    local PathPos
    local go_on
    for i = 1, PriDiff do
        if (PriDiff == XDiff2) then
            PathPos = position(StartPos.x - XMod * i, StartPos.y - YMod * math.floor(i / PriDiff * SecDiff), StartPos.z )
        else
            PathPos = position(StartPos.x - XMod * math.floor(i / PriDiff * SecDiff), StartPos.y - YMod * i, StartPos.z )
        end
        go_on = Event(PathPos)
        if (go_on == false and go_on ~= nil) then
            return true
        end
    end
end

--[[
    CreateTangentLine
    Calculates a tangent line from the perspective of the center pos with the middle on the TargetPos
    @param PositionStruct - The center position
    @param PositionStruct - the target position (center of this line is on this position)
    @param integer - length of one arm of the line. Effective length is ArmLength*2+1
    @param function(PositionStruct) - Event function that is triggered for every position
]]
function M.CreateTangentLine(CenterPos, TargetPos, ArmLength, Event)
    local phi = M.GetPhi( CenterPos, TargetPos ) + math.pi/2

    local xoffset = math.cos( phi )
    local yoffset = math.sin( phi )
    local maxoffset = math.max( math.abs( xoffset ), math.abs( yoffset ) )

    yoffset = yoffset * ( 1 / maxoffset )
    xoffset = xoffset * ( 1 / maxoffset )

    local go_on = Event( TargetPos )
    if (go_on == false and go_on ~= nil) then
        return
    end

    local posi
    local first_go_on = true
    local second_go_on = true
    for i=1, ArmLength do
        if first_go_on then
            first_go_on = Event(position(M.Round(TargetPos.x + i * xoffset),
                M.Round(TargetPos.y + i * yoffset), TargetPos.z))
            first_go_on = (first_go_on ~= nil and first_go_on or true)
        end
        if second_go_on then
            second_go_on = Event(position(M.Round(TargetPos.x - i * xoffset),
                M.Round(TargetPos.y - i * yoffset), TargetPos.z))
            second_go_on = ( second_go_on ~= nil and second_go_on or true )
        end
        if not first_go_on and not second_go_on then
            return
        end
    end
end

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
    return M.ScaleUnlimited(ScBegin, ScEnd, M.Limit(value, 0, 100))
end

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
    return (ScEnd - ScBegin) / 100 * value + ScBegin
end

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
        return min
    end
    if max and (value > max) then
        return max
    end
    return value
end

--[[
    Round
    Round a value at a given precision up at x.5 and bigger, down in any other cases
    @param integer - the value that shall be rounded
    @param integer - the precision, default 0
    @return integer - the rounded value
]]
function M.Round(value, precision)
    if not precision then
        precision = 0
    end

    value = value * 10 ^ precision

    if (math.fmod(value, 1) >= 0.5) then
        value = math.ceil( value )
    else
        value = math.floor( value )
    end

    value = value / 10 ^ precision
    return value
end

--[[
    GetPhi
    Calculate phi between 2 positions
    @param PositionStruct - The start position
    @param PositionStruct - The target position
    @return float - phi
]]
function M.GetPhi(StartPos, TargetPos)
    if StartPos == TargetPos then
        return math.random()*2
    end
    local dx = TargetPos.x - StartPos.x
    local dy = TargetPos.y - StartPos.y
    local phi
    if (dx == 0) then
        if (dy > 0) then
            phi = math.pi / 2
        else
            phi = math.pi + math.pi / 2
        end
    elseif (dx > 0) then
        if (dy >= 0) then
            phi = math.atan(dy / dx)
        else
            phi = math.atan(dy / dx) + 2 * math.pi
        end
    else
        phi = math.atan(dy / dx) + math.pi
    end
    return phi
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
        return 0
    end
    if (bottomBorder <= 0 or bottomBorder >= 255) then
        bottomBorder = 1
    end
    if (topBorder <= 0 or topBorder >= 255) then
        topBorder = 255
    end
    if bottomBorder >= topBorder then
        bottomBorder = 1
        topBorder = 255
    end
    local oldValue = Character:increaseAttrib(attrib, 0)
    local newValue = oldValue + value
    if (newValue < bottomBorder) then
        value = bottomBorder - newValue
        newValue = bottomBorder
    elseif (newValue > topBorder) then
        value = newValue - topBorder
        newValue = topBorder
    end
    Character:increaseAttrib(attrib, value)
    return (value + 255)
end

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
        return false
    else
        value = value - 255
    end

    Character:increaseAttrib(attrib, -value)
    return true
end

--[[
    CopyPosition
    Copies a position struct to a new one
    @param position - the position that shall be copied
    @return position - the new position struct
]]
function M.CopyPosition(Posi)
    return position(Posi.x, Posi.y, Posi.z)
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
            table.insert(t, element)
        end
    else
        local fpat = "(.-)" .. pat
        local last_end = 1
        local s, e, cap = str:find(fpat, 1)
        while s do
            if s ~= 1 or cap ~= "" then
                table.insert(t, cap)
            end
            last_end = e + 1
            s, e, cap = str:find(fpat, last_end)
        end
        if (last_end <= str:len()) then
            cap = str:sub(last_end)
            table.insert(t, cap)
        end
    end
    return t
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

    local temptable = {}
    local tempcnt = 0
    local tempnumber

    tempnumber = math.floor(Number / (10^AmountOfDigits))
    Number = Number - tempnumber * (10^AmountOfDigits)

    for i = (AmountOfDigits-1), 0, -1 do
        tempcnt = tempcnt + 1
        tempnumber = math.floor(Number / (10^i))
        temptable[tempcnt] = tempnumber
        Number = Number - tempnumber * (10^i)
    end
    return temptable
end


--[[
    Converts a given hour of day to a string like: early morning, morning,
    @param hour the hour which should be converted
    @return ger, eng strings
]]
function M.Hour_To_String(hour)
    if (hour >= 0 and hour < 2 or hour == 24) then
        return "gegen Mitternacht", "around midnight"
    elseif (hour >= 2 and hour < 4) then
        return "nach Mitternacht", "after midnight"
    elseif (hour >= 4 and hour < 6) then
        return "vor Sonnenaufgang", "before sunrise"
    elseif (hour >= 6 and hour < 8) then
        return "früher Morgen", "in the early morning"
    elseif (hour >= 8 and hour < 10) then
        return "morgens", "in the morning"
    elseif (hour >= 10 and hour < 12) then
        return "vormittags", "before noon"
    elseif (hour >= 12 and hour < 14) then
        return "gegen Mittag", "around noon"
    elseif (hour >= 14 and hour < 16) then
        return "nachmittags", "in the afternoon"
    elseif (hour >= 16 and hour < 18) then
        return "früher Abend", "in the early evening"
    elseif (hour >= 18 and hour < 20) then
        return "abends","in the evening"
    elseif (hour >= 20 and hour < 22) then
        return "später Abend", "in the late evening"
    else
        return "vor Mitternacht", "before midnight"
    end
end

--[[
    Converts a numeric month to a string like: Elos, Tanos,...
    @param month the moth which should be converted
    @return string
]]
function M.Month_To_String(month)

    local MonthNames = {"Elos", "Tanos", "Zhas", "Ushos", "Siros", "Ronas", "Bras", "Eldas", "Irmas", "Malas", "Findos", "Olos", "Adras", "Naras", "Chos", "Mas"} --List of our months

    if (month >= 1) and (month <= 16) then --only valid months
        return MonthNames[month] --return the month as string
    else
        return "[ERROR] Corrupted date, please inform a developer."
    end

end

function M.fold(ar, f, neutral)
    local result = neutral
    for i,v in ipairs(ar) do
        result = f(result, v)
    end
    return result
end

function M.map(ar, f)
    for i,v in ipairs(ar) do
        ar[i] = f(v)
    end
    return ar
end

---
-- Turn a list into a "set"
-- Use set[item] to check if an item is contained in set
-- Taken from: http://lua-users.org/wiki/SetOperations
-- For more operaions (union, intersection) see the above and also https://www.lua.org/pil/13.1.html
--@param t list of values to be included in the set
function M.setFromList(t)
    local s = {}
    for _,v in pairs(t) do s[v] = true end
    return s
end

---
-- Take two sets and create a union (set containing all items from the sets, without repetition)
-- @param a - a set
-- @param b - a set
function M.setUnion(a, b)
    local s = {}
    for v, _ in pairs(a) do s[v] = true end
    for v, _ in pairs(b) do s[v] = true end
    return s
end


--[[
    This is some strange method written by Vilarion. Its extremly inefficient,
    very creepy and most likely totally buggy.
    Usage is not adviced.
--]]
function M.isItemIdInFieldStack( id, pos )

    local stack = {}
    local i = -1
    local found = false
    local itm
    while( world:isItemOnField(pos) and (not found) ) do
        itm = world:getItemOnField(pos)
        if( itm.id == id ) then
            found = true
        else
            i = i + 1
            stack[i] = itm
            world:erase( itm, itm.number )
        end
    end
    while( i >= 0 ) do
        world:createItemFromItem( stack[i], pos, true )
        i = i - 1
    end
    return found
end

--[[
    This is some strange method written by Vilarion. Its extremly inefficient,
    very creepy and most likely totally buggy.
    Usage is not adviced.
--]]
function M.removeItemIdFromFieldStack( id, pos )

    local stack = {}
    local i = -1
    local found = false
    local itm
    while( world:isItemOnField(pos) and (not found) ) do
        itm = world:getItemOnField(pos)
        if( itm.id == id ) then
            found = true
        else
            i = i + 1
            stack[i] = itm
        end
        world:erase( itm, itm.number )
    end
    while( i >= 0 ) do
        world:createItemFromItem( stack[i], pos, true )
        i = i - 1
    end
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

    local ext = 2
    local plyList = world:getPlayersInRangeOf(posi, radius+ext)

    for i, player in pairs(plyList) do
        -- player not in rect, remove from list
        if not M.isInRect(player.pos, posi, radius) then
            plyList[i] = nil
        end
    end

    return plyList

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
            return true
        else
            return false
        end
    else
        return false
    end
end

--- Check if a given monster is docile
-- @param id The ID of the monster in question
-- @return true if monster is docile
function M.IsMonsterDocile( id )
    local docileList = {6,16,26,36,46,56,96,106,116,181,182,241,242,243,244,371,372,373,396,581,584,591,615,616,621,1054,1131,1132,1133,1134,1135,1136,1151,1152,1161,1162,1163,1164,1165}
    for i,v in pairs(docileList) do
        if id == v then
            return true
        end
    end
    return false
end

--- Checks if an item is in the hand tools slots
-- @param item The item to check
-- @return true if the item is in a hand tools slot, false otherwise
function M.IsItemInHands( item )
    if item:getType() == 4 then
        local itempos = item.itempos
        if itempos == 5 or itempos == 6 then
            return true
        end
    end
    return false
end

--[[Check if a char holds an item from a list in hand
@return true if item with id is in any hand slot]]--
function M.hasItemIdInHand(user, itemIds)
    if type(row) == "table" then
        itemIds = {itemIds}
    end
    local leftTool = user:getItemAt(Character.left_tool)
    if M.isInList(leftTool.id, itemIds) then
        return true
    end
    local rightTool = user:getItemAt(Character.right_tool)
    if M.isInList(rightTool.id, itemIds) then
        return true
    end
    return false
end

--[[Check if a char holds an item from a list in hand
@return item if item with id is in any hand slot]]--
function M.getItemInHand(user, itemIds)
    if type(row) == "table" then
        itemIds = {itemIds}
    end
    local leftTool = user:getItemAt(Character.left_tool)
    if M.isInList(leftTool.id, itemIds) then
        return leftTool
    end
    local rightTool = user:getItemAt(Character.right_tool)
    if M.isInList(rightTool.id, itemIds) then
        return rightTool
    end
    return nil
end


--- Gets the target item for Use-With like commands. Both, source and target items have to be in hand tool slots.
-- @param character The character who wants to use the items
-- @param source The source item that is "used with" the target item
-- @return The target item (in the other hand slot than the source) or nil if no target is found
function M.GetTargetItem( character, source )
    if not M.IsItemInHands(source) then
        return nil
    end
    local tpos = 11 - source.itempos -- either 5 or 6
    local target = character:getItemAt(tpos)
    if target.id == 0 then
        return nil
    end
    return target
end

--[[ Gets the target item for Use-With like commands.
@param character The character who wants to use the items
@param items The items, searched for
Sucess:
one of the items in hand
else#
one of the items in belt
else
one of the items in bag
itemNumber > 1 means in one step more than 1 possible item was found
@return itemNumber (0 if not found), foundItem last found item]]--
function M.GetTargetItemAnywhere(user, itemList)
    local tmpItem
    if type(itemList) ~= "table" then
        itemList = {itemList}
    end
    local countItems = 0
    local foundItem = nil
    for i = 5, 6 do -- hands
        tmpItem = user:getItemAt(i)
        if M.isInList(tmpItem.id, itemList) then
            countItems = countItems + 1
            foundItem = tmpItem
        end
    end
    if countItems > 0 then
        return countItems, foundItem
    end
    for i = 12, 17 do -- belt
        tmpItem = user:getItemAt(i)
        if M.isInList(tmpItem.id, itemList) then
            countItems = countItems + 1
            foundItem = tmpItem
        end
    end
    if countItems > 0 then
        return countItems, foundItem
    end
    local backpack = user:getBackPack()
    if backpack then
        for i = 0, 99 do
            local isItem, tmpItem, tmpContainer = backpack:viewItemNr(i)
            if isItem then
                if M.isInList(tmpItem.id, itemList) then
                    countItems = countItems + 1
                    foundItem = tmpItem
                end
            end
        end
    end
    return countItems, foundItem
end

--- Returns the real date and time as a String
-- @return date and time in format: YYYY-MM-DD | hh:mm:ss
function M.GetRealDateTimeString()
    local year, month, day, hour, minute, second = M.GetRealDate()
    local timeString =
        function(int)
            if int < 10 then
                return "0"..int
            end
            return ""..int
        end
    return timeString(year) .."-".. timeString(month) .."-"..
    timeString(day) .." | ".. timeString(hour) ..":".. timeString(minute) ..":".. timeString(second)
end

--- Returns the real date as a String
-- @return date in format: YYYY-MM-DD
function M.GetRealDateString()
    local year, month, day, hour, minute, second = M.GetRealDate()
    local timeString =
        function(int)
            if int < 10 then
                return "0"..int
            end
            return ""..int
        end
    return timeString(year) .."-".. timeString(month) .."-".. timeString(day)
end

--- Returns the real time as a String
-- @return time in format: hh:mm:ss
function M.GetRealTimeString()
    local year, month, day, hour, minute, second = M.GetRealDate()
    local timeString =
        function(int)
            if int < 10 then
                return "0"..int
            end
            return ""..int
        end
    return timeString(hour) ..":".. timeString(minute) ..":".. timeString(second)
end

--- Converts the unix timestamp to a real date (GMT 0)
-- @return year
-- @return month
-- @return day
-- @return hour
-- @return minute
-- @return second
function M.GetRealDate()
    local timestamp = world:getTime("unix")

    local year, month, day, hour, minute, second, tmp
    year = math.floor(timestamp / 31557600) -- (365.25*24*60*60)
    local leapDays = math.floor( (year+1) / 4 ) -- without the current year
    timestamp = timestamp - (year*365 + leapDays)*86400 -- 24*60*60

    local leapYear = 0
    if (year % 4) == 2 then
        leapYear = 1 -- this year is a leap year
    end
    year = year + 1970 -- unix time starts there

    local dayList = {0,31,59,90,120,151,181,212,243,273,304,334}
    tmp = math.floor(timestamp / 86400) -- days so far this year
    month = 1
    for i=12,2,-1 do
        local check = tmp-dayList[i]
        if i>2 then
            check = check - leapYear
        end
        if check > 0 then
            month = i
            break
        end
    end
    tmp = dayList[month] -- days without current month
    if month > 2 then
        tmp = tmp + leapYear
    end
    timestamp = timestamp - ((tmp-1) * 86400) -- days this month (in seconds)
    day = math.floor(timestamp / 86400)
    timestamp = timestamp - (day * 86400)
    hour = math.floor(timestamp / 3600)
    timestamp = timestamp - (hour * 3600)
    minute = math.floor(timestamp / 60)
    second = timestamp - (minute * 60)
    return year, month, day, hour, minute, second
end

-- Returns an NPC in case it is found within a given range of a give position
-- @param centerPosition Position structure that is the center of the search area.
-- @param radius Radius within which is searched
-- @param npcName Name of the npc to search for
-- @return Returns the NPC in case it was found else false
function M.getNpc(centerPosition, radius, npcName)

    local npcs = world:getNPCSInRangeOf(centerPosition, radius)
    for _, candidateNpc in pairs(npcs) do
        if (npcName and candidateNpc.name == npcName) then
            return candidateNpc
        end
    end

    return false

end

function M.PositionToText(pos)
    if pos ~= nil then
        local retString = "("..pos.x..","..pos.y..","..pos.z..")"
        return retString
    end
    return "nil","nil","nil"
end

--[[
    \fn:    IsInList
    \brief: returns true if an valueChecked is in the valueList

    \attention: valueList must be a list!
]]
function M.isInList(valueChecked, valueList)
    if valueChecked == nil then
        return false
    end
    if type(valueList) ~= "table" then
        valueList = {valueList}
    end
    for _, value in pairs(valueList) do
        if valueChecked == value then
            return true
        end
    end
    return false
end

--[[
    \fn:    posInList
    \brief: returns position of an valueChecked in the valueList

    \attention: valueList must be a list!
]]
function M.posInList(valueChecked, valueList)
    if valueChecked == nil then
        return 0
    end
    if type(valueList) ~= "table" then
        return 0
    end
    for i, value in pairs(valueList) do
        if valueChecked == value then
            return i
        end
    end
    return 0
end

--[[
    \fn:    getOneOutOfList
    \brief: returns one random row out of valueList
    if valueList isn't a table, valueList is returned
]]
function M.getOneOutOfList(valueList)
    if type(valueList) ~= "table" then
        return valueList
    end
    local tmpList = {}
    for i, row in pairs(valueList) do
        table.insert(tmpList, i)
    end
    return valueList[math.random(1,#tmpList)]
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

   local result=NumberList[1]

   for i = 2, #NumberList do

      result = result ..NumberList[i]


   end
   result = tonumber(result)    --convert the string result   into a number
   return result

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
        j = math.random(minIndex, i)
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

   local reslist = {}

   for i = 1, AmntElements do

        reslist[i] = math.random(minval, maxval)

        if (reslist[i] == reslist[i-1]) then -- same number like before, try getting a new number
        reslist[i] = math.random(minval, maxval)
      end

   end

   return reslist
end

--[[Searches the Online List for a Player by name
    if a player was found it returns: true, Char Struct
--     if not, nil]]

function M.CheckIfOnline(playername)
    local playerlist = world:getPlayersOnline()

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
local leadAttribTable = {}
--Dexterity: All crafting skills for final products
leadAttribTable[Character.tailoring]="dexterity"
leadAttribTable[Character.blacksmithing]="dexterity"
leadAttribTable[Character.gemcutting]="dexterity"
leadAttribTable[Character.carpentry]="dexterity"
leadAttribTable[Character.cookingAndBaking]="dexterity"
leadAttribTable[Character.finesmithing]="dexterity"
leadAttribTable[Character.glassBlowing]="dexterity"
leadAttribTable[Character.pottery]="dexterity"
leadAttribTable[Character.armourer]="dexterity"
leadAttribTable[Character.brewing]="dexterity"

--Dexterity: Instruments (please remove these skills in future)
leadAttribTable[Character.harp]="dexterity"
leadAttribTable[Character.horn]="dexterity"
leadAttribTable[Character.flute]="dexterity"
leadAttribTable[Character.lute]="dexterity"

--Constitution: All gathering skills
leadAttribTable[Character.herblore]="constitution"
leadAttribTable[Character.mining]="constitution"
leadAttribTable[Character.fishing]="constitution"
leadAttribTable[Character.farming]="constitution"
leadAttribTable[Character.woodcutting]="constitution"
leadAttribTable[Character.tanningAndWeaving]="constitution"
leadAttribTable[Character.husbandry]="constitution"
leadAttribTable[Character.digging]="constitution"

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

--Perception: Druids
leadAttribTable[Character.alchemy]="perception"

--Intelligence: Magic
leadAttribTable[Character.wandMagic]="intelligence"

--Willpower: Priests
--No skills yet

function M.GetLeadAttributeName(Skill)
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

function M.GetAttributeBonus(attribute, range)

    local bonus
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
    Radius = 1
  end
  if (OnlyWriteable == nil) then
    OnlyWriteable = false
  end
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local field = world:getField(position(CenterPos.x + x, CenterPos.y + y, CenterPos.z))
      if field ~= nil then
      local itemCount = field:countItems()
          if (itemCount > 0) then
            if (OnlyWriteable) then
              itemCount = 1
            end
            for i=0,itemCount-1 do
              local item = field:getStackItem(i)
              if (item.id == ItemId) then
                item.pos.x = CenterPos.x + x
                item.pos.y = CenterPos.y + y
                item.pos.z = CenterPos.z
                return item, (i==0)
              end
            end
          end
      end
    end
  end
  return nil, nil
end

-- Checks if a given position is located on the tutorial island Noobia.
-- @param posStruct Pos  The position to check.
-- @return bool  True if position is located on Noobia, false otherwise.
function M.isOnNoobia(Pos)
  if (Pos.z == 100) then
    return true
  end
  return false
end

-- Checks if a given position is located in the prison mine.
-- @param posStruct Pos  The position to check.
-- @return bool  True if position is located in Prison mine, false otherwise.
function M.isInPrison(Pos)
  if (Pos.z == -40) then
    return true
  end
  return false
end

--- Convert a RGB colour to a HSV color.
-- @param red the red colour component in a range from 0 to 255
-- @param green the green colour component in a range from 0 to 255
-- @param blue the blue colour component in a range from 0 to 255
-- @return hue, saturation, value colour components. Hue in a range from 0° to 360°. Saturation and value in a range
--         from 0 to 1
function M.RGBtoHSV(red, green, blue)
    local max = math.max(red, green, blue)
    local min = math.min(red, green, blue)
    if max > 255 or min < 0 then
        error("The colour values are rgb to hsv conversation are out of bounds.")
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

--- Convert a HSV colour value to a RGB colour value.
-- @param hue The hue value in degrees. Values larger then 360° are wrapped until they fit the range from 0° to 360°
-- @param saturation The saturation value in a range from 0 to 1
-- @param value The colour value in a range from 0 to 1
-- @return red, green, blue colour value in a range from 0 to 255 as integer value
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

--[[Binary functions
Checks whether bit n is set or not
bitN must be a number in between 1 and 15 (limit 16 bit integer)
@return bool: true if set
]]--
function M.isBitSet(checkedValue, bitN)
    local bitNumber = tonumber(bitN)
    local valueNumber = tonumber(checkedValue)
    if bitNumber == nil or valueNumber == nil then
        return false
    end
    if bitNumber < 1 or bitNumber > 15 then
        return false
    end
    local bitValue = math.pow( 2, bitNumber - 1 )
    if bit32.band(valueNumber, bitValue) == 0 then
        return false
    end
    return true
end

--[[Binary functions
Set bit n
bitN must be a number in between 1 and 15 (limit 16 bit integer)
setBit must be a number 
@return int: setValue
]]--
function M.addBit(setValue, bitN)
    local bitNumber = tonumber(bitN)
    local valueNumber = tonumber(setValue)
    if bitNumber == nil or valueNumber == nil then
        return nil
    end
    if bitNumber < 1 or bitNumber > 15 then
        return valueNumber
    end
    if not M.isBitSet(valueNumber, bitNumber) then
        valueNumber = valueNumber + math.pow( 2, bitNumber - 1 )
    end
    return valueNumber
end

--[[Binary functions
Remove bit n
bitN must be a number in between 1 and 15 (limit 16 bit integer)
setBit must be a number 
@return int: setValue
]]--
function M.removeBit(setValue, bitN)
    local bitNumber = tonumber(bitN)
    local valueNumber = tonumber(setValue)
    if bitNumber == nil or valueNumber == nil then
        return nil
    end
    if bitNumber < 1 or bitNumber > 15 then
        return valueNumber
    end
    if M.isBitSet(valueNumber, bitNumber) then
        valueNumber = valueNumber - math.pow( 2, bitNumber - 1 )
    end
    return valueNumber
end

--[[Binary functions
Returns the number of set bits.
setBit must be a number 
@return int: number of bits = 1
]]--
function M.countBit(checkedValue)
    local bitNumber = 1
    local valueNumber = tonumber(checkedValue)
    local countBit = 0
    if valueNumber == nil then
        return 0
    end
    for i=1 , 15 do
        if bit32.band(valueNumber, bitNumber) > 0 then
            countBit = countBit + 1
        end
        bitNumber = bitNumber * 2
    end
    return countBit
end

--[[Item name
Considers special item names
@return string]]--
function M.getItemName(item, lang)
    local specialname = ( lang == Player.german and item:getData("nameDe") or item:getData("nameEn") )
    if ( M.IsNilOrEmpty(specialname) ) then
        return world:getItemName( item.id, lang )
    else
        return specialname
    end
end

--[[warp a character back
@return: real distance (0 if not warped)]]--
function M.pushBack(user,extDistance,extCenterPos)
    local distance = extDistance or 1
    local centerPos = extCenterPos or M.GetFrontPosition(user)

    local diffX = centerPos.x - user.pos.x
    local diffY = centerPos.y - user.pos.y
    if (centerPos.x == user.pos.x and centerPos.y == user.pos.y) then -- any direction
        diffX = math.random(1,5)
        diffY = math.random(1,5)
        if math.random() < 0.5 then
            diffX = - diffX
        end
        if math.random() < 0.5 then
            diffY = - diffY
        end
    else
        diffX = centerPos.x - user.pos.x
        diffY = centerPos.y - user.pos.y
    end
    local alpha = math.atan2(diffX,diffY)
    local distX = math.floor(math.sin(alpha)*distance)
    local distY = math.floor(math.cos(alpha)*distance)

    local posX = user.pos.x - distX
    local posY = user.pos.y - distY
    local posZ = user.pos.z

    local targetPos=user.pos

    local isNotBlocked = function(pos)
        if world:getField(pos):isPassable() then
            targetPos = pos
            return true
        else
            return false
        end
    end

    M.CreateLine(user.pos, position(posX,posY,posZ), isNotBlocked)

    local realDistance = user:distanceMetricToPosition(targetPos)
    user:warp(targetPos)
    return realDistance
end

--[[Find items out of a list from inventory and bag
user: The cheched character
itemIdList: Table of item ID's or item ID
return: hasItem, returnList
hasItem: true if all items are in inventory
returnList: all found items
]]--
function M.userHasItems(user,itemIdList)
    local idItem
    local numberItem
    local numberExists
    local returnList = {}
    local allItems = false
    if type(itemIdList) ~= "table" then
        itemIdList = {itemIdList}
    end
    if user:getType() == Character.player and #itemIdList > 0 then
        allItems = true
        for _, row in pairs(itemIdList) do
            if type(row) == "table" then
                idItem = row[1]
                numberItem = row[2] or 1
            else
                idItem = row
                numberItem = 1
            end
            local l = user:getItemList(idItem)
            numberExists = 0
            for _,i in pairs(l) do
                numberExists = numberExists + i.number
                table.insert(returnList,i)
            end
            if numberExists < numberItem then
                allItems = false
            end
        end
    end
    return allItems, returnList
end


--[[ Drop a blood spot on the ground at a specified location.
@param Posi The location where the blood spot is placed]]--
function M.dropBlood(Posi, bloodWear)
    usedWear = bloodWear or 2
    if world:isItemOnField(Posi) then
        return --no blood on tiles with items on them!
    end
    local field = world:getField(Posi)
    local tileId = field:tile()
    if tileId == 6 or tileId == 0 or tileId == 34 then
        return -- no blood on water and invisible tiles
    end
    
    local Blood = world:createItemFromId(3101, 1, Posi, true, 333, nil)
    Blood.wear = usedWear
    world:changeItem(Blood)
end

--[[ Drop some of blood. This function drops blood on every tile around the centerPos with a certain probability
@param centerPos: The center of the bloody area
@param: bloodProbability 0-1
@param: bllodWear Time the blood remains x 3 min
]]--
function M.dropSomeBlood(centerPos, bloodProbability, bloodWear)
    local usedProbability = bloodProbability or 0.33
    local usedWear = bloodWear or 1
    local centerPosX = centerPos.x - 1
    local centerPosY = centerPos.y - 1
    local centerPosZ = centerPos.z
    for i = 1, 3 do
        for j = 1, 3 do
            if math.random() < usedProbability then
                M.dropBlood(position(centerPosX,centerPosY,centerPosZ), usedWear)
            end
            centerPosX = centerPosX + 1
        end
        centerPosX = centerPosX - 3
        centerPosY = centerPosY + 1
    end
end

--[[ Drop much of blood. This function drops blood on about every 3rd tile around the position set as center.
@param centerPos The center of the bloody area]]--
function M.dropMuchBlood(centerPos)
    M.dropSomeBlood(centerPos, 1, 2)
end

--[[Counts player around a position including the levels -2, -1, +1, +2
center pos: center of search
range: range of search
@return: number of character]]--
function M.countPlayersInRangeOf(centerPos, range)
    local users = world:getPlayersInRangeOf(centerPos, range)
    local count=0
    for _, user in pairs(users) do
        count = count + 1
    end
    return count
end

--[[Direction hints]]--
--[[Translate a distance into text
distance: number of tiles
@return: textDe,textEn]]--
function M.getTextForDistance(distance)
    distance = tonumber(distance)
    if distance == nil then
        return "unscharf", "diffuse"
    elseif distance < 20 then
        return "sehr nah", "very close"
    elseif distance < 60 then
        return "nah", "close"
    elseif distance < 200 then
        return "fern", "far"
    elseif distance < 500 then
        return "sehr fern", "very far"
    else
        return "äußerst fern", "extremely far"
    end
end

--[[Translate a direction into text
direction: direction value
@return: textDe,textEn]]--
function M.getTextForDirection(direction)
    if direction == Character.dir_north then
        return "Norden", "north"
    elseif direction == Character.dir_northeast then
        return "Nordosten", "northeast"
    elseif direction == Character.dir_east then
        return "Osten", "east"
    elseif direction == Character.dir_southeast then
        return "Südosten", "southeast"
    elseif direction == Character.dir_south then
        return "Süden", "south"
    elseif direction == Character.dir_southwest then
        return "Südwesten", "southwest"
    elseif direction == Character.dir_west then
        return "Westen", "west"
    elseif direction == Character.dir_northwest then
        return "Nordwesten", "northwest"
    else
        return false, false
    end
end


--[[Distance hint, a raw expectation where the target position might be
user: start position
targetPos: target position
@return structure with German and English distance and direction]]--
function M.getDistanceHint(user, targetPos)
    if not targetPos then
        return false
    end

    local metricDistance = user:distanceMetricToPosition(targetPos);
    local dir = M.GetDirection(user.pos, targetPos);

    local result = {}
    result.direction = {}
    result.direction.de, result.direction.en = M.getTextForDirection(dir)
    result.distance = {}
    result.distance.de, result.distance.en = M.getTextForDistance(metricDistance)
    return result
end


--[[Number to text
number: integer 0-20
languag: Player language
cardinal: false or nil: number, true: cardinals
@return text]]--
function M.numberToText(number, language, cardinal)
    local usedCardinal = cardinal or false
    local numberTexts = {}
    numberTexts[0] = {"kein",                  "no",             "kein",               "no"}
    numberTexts[1] = {"ein",                   "one",            "erste",              "first"}
    numberTexts[2] = {"zwei",                  "two",            "zweite",             "second"}
    numberTexts[3] = {"drei",                  "three",          "dritte",             "third"}
    numberTexts[4] = {"vier",                  "four",           "vierte",             "fourth"}
    numberTexts[5] = {"fünf",                  "five",           "fünfte",             "fivth"}
    numberTexts[6] = {"sechs",                 "six",            "sechste",            "sixth"}
    numberTexts[7] = {"sieben",                "seven",          "siebente",           "seventh"}
    numberTexts[8] = {"acht",                  "eigth",          "achte",              "eighth"}
    numberTexts[9] = {"neun",                  "nine",           "neunte",             "ninth"}
    numberTexts[10] = {"zehn",                 "ten",            "zehnte",             "tenth"}
    numberTexts[11] = {"elf",                  "eleven",         "elfe",               "eleventh"}
    numberTexts[12] = {"zwölf",                "twelf",          "zwölfte",            "twelfth"}
    numberTexts[13] = {"dreizehn",             "thirteen",       "dreizehnte",         "thirteenth"}
    numberTexts[14] = {"vierzehn",             "fourteen",       "vierzehnte",         "fourteenth"}
    numberTexts[15] = {"fünfzehn",             "fiveteen",       "fünfzehnte",         "fiveteenth"}
    numberTexts[16] = {"sechzehn",             "sixteen",        "sechzehnte",         "sixteenth"}
    numberTexts[17] = {"siebzehn",             "seventeen",      "siebzehnte",         "seventeenth"}
    numberTexts[18] = {"achtzehn",             "eightteen",      "achtzehnte",         "eightteenth"}
    numberTexts[19] = {"neunzehn",             "ninteen",        "neunzehnte",         "ninteenth"}
    numberTexts[20] = {"zwanzig",              "twenty",         "zwanzigste",         "twentieth"}
    local inumber = tonumber(number)
    if M.IsNilOrEmpty(inumber) then
        inumber = 0
    end
    if inumber > 20 then
        if usedCardinal == true then
            return tostring(inumber) .. "."
        else
            return tostring(inumber)
        end
    else
        if usedCardinal == true then
            return (language == Player.german and numberTexts[inumber][3] or numberTexts[inumber][4])
        else
            return (language == Player.german and numberTexts[inumber][1] or numberTexts[inumber][2])
        end
    end
end

--[[Position to number
number: integer
position: related position]]--
function M.positionToNumber(pos)
    local number = pos.x + 1000
    number =  number + (pos.y +1000) * 10000
    number = number + (pos.z +100) * 10000000
    return number
end

--[[Number to postion
number: integer
position: related position]]--
function M.numberToPosition(number)
    number = tonumber(number)
    if number == nil then
        return position(0,0,0)
    end
    local posz = math.floor (number / 10000000 - 100)
    number = number - ((posz +1000) * 100000000)
    local posy = math.floor (number  / 10000 - 1000)
    number = number - ((posy +1000) * 10000)
    local posx = math.floor (number - 1000)
    return position(posx, posy, posz)
end

return M
