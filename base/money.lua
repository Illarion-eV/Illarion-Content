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
--- This script contains a set of helper methods to work with money in the game.
--  This functions should be used for any interaction with money.
--
--  Author: Martin Karing (Nitram)
local M = {}

--- The Item ID of the item used as gold coins.
local GoldCoinsID = 61

--- The Item ID of the item used as silver coins.
local SilverCoinsID = 3077

--- The Item ID of the item used as copper coins.
local CopperCoinsID = 3076

--- This method calculates the values of the 3 valid existing coin types (gold,
--  silver, copper) into a single value that represents the total money value
--  of the coins. It basically recalculates silver and gold coins to copper
--  coins in value and adds it to the copper coins and returns this value.
--
--  @param gCoins - number - the amount of gold coins
--  @param sCoins - number - the amount of silver coins
--  @param cCoins - number - the amount of copper coins
--  @return number - the total amount of the money in copper coins
function M.CoinsToMoney(gCoins, sCoins, cCoins)
    return (gCoins * 100 + sCoins) * 100 + cCoins
end

--- This method returns the total amount of money in copper coins the char has
--  in his inventory. This method takes all three types of coins into
--  consideration.
--
--  @param char - CharStruct - the char the money count is wanted from
--  @return number - the total amount of money in copper coins the player has
function M.CharCoinsToMoney(char)
    return M.CoinsToMoney(char:countItem(GoldCoinsID),
        char:countItem(SilverCoinsID), char:countItem(CopperCoinsID))
end

--- Get the coins a character has in his inventory.
--
--  @param char - CharStruct - the char the coins are wanted from
--  @return number - the amount of gold coins the character has
--  @return number - the amount of silver coins the character has
--  @return number - the amount of copper coins the character has
--  @note The values returned by this function are not normalized. So its
--      possible that the values for silver and copper coins are greater 100
function  M.CharCoins(char)
    return char:countItem(GoldCoinsID), char:countItem(SilverCoinsID),
        char:countItem(CopperCoinsID)
end

--- This method returns the total amount of money in copper coins the char has
--  in his depot. This method takes all three types of coins into
--  consideration.
--
--  @param char - CharStruct - the char the money count is wanted from
--  @param depNr - the ID of the depot to check
--  @return number - the total amount of money in copper coins the player has
function M.DepotCoinsToMoney(char, depNr)
    local depot = char:getDepot(depNr)
    if depot then
        local copper = depot:countItem(CopperCoinsID)
        local silver = depot:countItem(SilverCoinsID)
        local gold = depot:countItem(GoldCoinsID)
        return M.CoinsToMoney(gold, silver, copper)
    else
        return 0
    end
end

--- Get the coins a character has in his Depot.
--
--  @param char - CharStruct - the char the money count is wanted from
--  @param depNr - the ID of the depot to check
--  @return number - the amount of gold coins the depot has
--  @return number - the amount of silver coins the depot has
--  @return number - the amount of copper coins the depot has
function M.DepotCoins(char, depNr)
    local depot = char:getDepot(depNr)
    if depot then
        local copper = depot:countItem(CopperCoinsID)
        local silver = depot:countItem(SilverCoinsID)
        local gold = depot:countItem(GoldCoinsID)
        return gold, silver, copper
    else
        return 0, 0, 0
    end
end

--- Split of a total money value in copper coins into the three valid coin
--  types.
--
--  @param money - number - the total amount of money in copper coins
--  @return number - the amount of gold coins in the total amount of money
--  @return number - the amount of silver coins in the total amount of money
--  @return number - the amount of copper coins in the total amount of money
function M.MoneyToCoins(money)
    local gCoins = math.floor(money / 10000)
    local sCoins = math.floor((money % 10000) / 100)
    local cCoins = money % 100
    return gCoins, sCoins, cCoins
end

--- Check if a player has at least a certain amount of money.
--
--  @param char - CharStruct - the char who needs to have the money
--  @param money - number - the money needed at least
--  @return boolean - true in case the player has the needed amount of money
function M.CharHasMoney(char, money)
    return M.CharCoinsToMoney(char) >= money
end

--- Give a exact configuration of coins to a character. This method does either
--  give all coins or none. If there is a problem while creating the items the
--  coins are removed again.
--
--  @param char - CharStruct - the char that shall receive the coins
--  @param gCoins - number - the amount of gold coins the char shall receive
--  @param sCoins - number - the amount of silver coins the char shall receive
--  @param cCoins - number - the amount of copper coins the char shall receive
--  @return boolean - true in case all items were created properly
function M.GiveCoinsToChar(char, gCoins, sCoins, cCoins)
    if (gCoins > 0) then
	    local notCreated = char:createItem(GoldCoinsID, gCoins, 333, nil)
	    if (notCreated > 0) then
	        char:eraseItem(GoldCoinsID, gCoins - notCreated)
	        return false
	    end
	end

    if (sCoins > 0) then
        local notCreated = char:createItem(SilverCoinsID, sCoins, 333, nil)
        if (notCreated > 0) then
            char:eraseItem(SilverCoinsID, sCoins - notCreated)
            if (gCoins > 0) then
                char:eraseItem(GoldCoinsID, gCoins)
            end
            return false
        end
    end

    if (cCoins > 0) then
        local notCreated = char:createItem(CopperCoinsID, cCoins, 333, nil)
        if (notCreated > 0) then
            char:eraseItem(CopperCoinsID, cCoins - notCreated)
            if (sCoins > 0) then
                char:eraseItem(SilverCoinsID, sCoins)
            end

            if (gCoins > 0) then
                char:eraseItem(GoldCoinsID, gCoins)
            end
            return false
        end
    end

    return true
end

--- Give some money to a character. This function tries to give money to the
--  character with the least amount of coin items as possible. This method gives
--  either everything or nothing. In case even one item can't be created no item
--  is given to the char.
--
--  @param char - CharStruct - the character that is supposed to receive the
--      money
--  @param money - number - the money the char is suposed to receive
--  @return boolean - true in case all items were created properly
function M.GiveMoneyToChar(char, money)
    local gCoins, sCoins, cCoins = M.MoneyToCoins(money)
    return M.GiveCoinsToChar(char, gCoins, sCoins, cCoins)
end

--- Give a exact configuration of coins to a position. This will create the
--  coin items on the tile at the specified location.
--
--  @param pos - PositionStruct - the target position for the coins
--  @param gCoins - number - the amount of gold coins to be created at pos
--  @param sCoins - number - the amount of silver coins to be created at pos
--  @param cCoins - number - the amount of copper coins to be created at pos
function M.GiveCoinsToPosition(pos, gCoins, sCoins, cCoins)
	local maxStack = 1000
    local noData = {}

    while (cCoins > maxStack) do
        world:createItemFromId(CopperCoinsID, maxStack, pos, true, 333, noData)
        cCoins = cCoins - maxStack
    end
	if (cCoins > 0) then
		world:createItemFromId(CopperCoinsID, cCoins, pos, true, 333, noData)
    end

    while (sCoins > maxStack) do
        world:createItemFromId(SilverCoinsID, maxStack, pos, true, 333, noData)
        sCoins = sCoins - maxStack
    end
	if (sCoins > 0) then
		world:createItemFromId(SilverCoinsID, sCoins, pos, true, 333, noData)
    end

    while (gCoins > maxStack) do
        world:createItemFromId(GoldCoinsID, maxStack, pos, true, 333, noData)
        gCoins = gCoins - maxStack
    end
	if (gCoins > 0) then
		world:createItemFromId(GoldCoinsID, gCoins, pos, true, 333, noData)
	end
end

--- Give a amount of money to a specified position. This will create the money
--  with the least amount of coin items as possible on the target location.
--
--  @param pos - PositionStruct - the position that shall receive the money
--  @param money - number - the amount of money that shall be created on the position
function M.GiveMoneyToPosition(pos, money)
    local gCoins, sCoins, cCoins = M.MoneyToCoins(money)
    return M.GiveCoinsToPosition(pos, gCoins, sCoins, cCoins)
end

--- Take some coins from a character. This function only does anything in case
--  the player has the required amount of coins.
--
--  @param char - CharStruct - the char the coins are taken from
--  @param gCoins - number - the amount of gold coins taken
--  @param sCoins - number - the amount of silver coins taken
--  @param cCoins - number - the amount of copper coins taken
--  @note This method is able to give coins to the player in case the amount
--      of coins is lesser then 0.
function M.TakeCoinsFromChar(char, gCoins, sCoins, cCoins)
    local charGold, charSilver, charCopper = M.CharCoins(char)

    if (gCoins > charGold or sCoins > charSilver or cCoins > charCopper) then
        return
    end

    if (gCoins > 0) then
        char:eraseItem(GoldCoinsID, gCoins)
    end

    if (sCoins > 0) then
        char:eraseItem(SilverCoinsID, sCoins)
    end

    if (cCoins > 0) then
        char:eraseItem(CopperCoinsID, cCoins)
    end

    if (gCoins < 0 or sCoins < 0 or cCoins < 0) then
        M.GiveCoinsToChar(char, math.min(0, gCoins) * (-1),
            math.min(0, sCoins) * (-1), math.min(0, cCoins) * (-1))
    end
end

--- Take some coins from a character's depot. This function only does
--  something in case the depot has the required amount of coins.
--
--  @param char - CharStruct - the char the coins are taken from
--  @param gCoins - number - the amount of gold coins taken
--  @param sCoins - number - the amount of silver coins taken
--  @param cCoins - number - the amount of copper coins taken
--  @param depotId - number - the ID of the corresponding depot
function M.TakeCoinsFromDepot(char, gCoins, sCoins, cCoins, depotId)
    local charGold, charSilver, charCopper = M.DepotCoins(char,depotId)

    local depot = char:getDepot(depotId)
    if not depot then
        return
    end

    if (gCoins > charGold or sCoins > charSilver or cCoins > charCopper) then
        return
    end

    if (gCoins > 0) then
        depot:eraseItem(GoldCoinsID, gCoins)
    end

    if (sCoins > 0) then
        depot:eraseItem(SilverCoinsID, sCoins)
    end

    if (cCoins > 0) then
        depot:eraseItem(CopperCoinsID, cCoins)
    end

	if (gCoins < 0 or sCoins < 0 or cCoins < 0) then
        M.GiveCoinsToChar(char, math.min(0, gCoins) * (-1),
            math.min(0, sCoins) * (-1), math.min(0, cCoins) * (-1))
    end
end

--- This method takes a certain amount of money from the player. It tries to
--  take the least amount of coins possible. The method takes nothing in case
--  the player does not have enough money. Check this before calling this
--  method.
--
--  @param char - CharStruct - the char the money is taken from
--  @param money - number - the amount of money taken from the char
function M.TakeMoneyFromChar(char, money)
    if not M.CharHasMoney(char, money) then
        return
    end
    local PayGold = 0
    local PaySilver = 0
    local PayCopper = 0
    local MissGold, MissSilver, MissCopper = M.MoneyToCoins(money)
    local charGold, charSilver, charCopper =  M.CharCoins(char)

    local Amount = money
    local GoldInCopper = math.floor(charCopper / 10000)
    GoldInCopper = math.min(MissGold, GoldInCopper)
    PayCopper = GoldInCopper * 10000;
    MissGold = MissGold - GoldInCopper
    charCopper = charCopper - PayCopper

    GoldInCopper = math.floor(charCopper / 100)
    local GoldInSilver = 100 - GoldInCopper
    if ((MissGold > 0) and (GoldInCopper > 0) and
            (charSilver >= GoldInSilver)) then
        PayCopper = PayCopper + 100 * GoldInCopper
        PaySilver = PaySilver + GoldInSilver
        MissGold = MissGold - 1
        charCopper = charCopper - 100 * GoldInCopper
        charSilver = charSilver - GoldInSilver
    end

    local SilverInCopper = math.floor(charCopper / 100)
    SilverInCopper = math.min(MissSilver, SilverInCopper)
    PayCopper = PayCopper + SilverInCopper * 100
    MissSilver = MissSilver - SilverInCopper
    charCopper = charCopper - SilverInCopper * 100

    if (charCopper >= MissCopper) then
        PayCopper = PayCopper + MissCopper
    else
        MissSilver = MissSilver + 1
        PayCopper = PayCopper + MissCopper - 100
    end

    GoldInSilver = math.floor(charSilver / 100)
    GoldInSilver = math.min(MissGold, GoldInSilver)
    PaySilver = PaySilver + GoldInSilver * 100
    MissGold = MissGold - GoldInSilver
    charSilver = charSilver - GoldInSilver * 100

    if (charSilver >= MissSilver) then
        PayGold = MissGold
        PaySilver = PaySilver + MissSilver
    else
        PayGold = MissGold + 1
        PaySilver = PaySilver + MissSilver - 100
    end

    M.TakeCoinsFromChar(char, PayGold, PaySilver, PayCopper)
end

--- This method takes a certain amount of money from the depot of a player.
--  It tries to take the least amount of coins possible. The method takes
--  nothing in case the depot does not have enougth money. Check this
--  before calling this method.
--
--  @param char - CharStruct - the char the money is taken from
--  @param money - number - the amount of money taken from the char
--  @param depotId - number - the ID of the depot to take the money from
function M.TakeMoneyFromDepot(char, money, depotId)

    if M.DepotCoinsToMoney(char, depotId)<money then
        return
    end

    local PayGold = 0
    local PaySilver = 0
    local PayCopper = 0
    local MissGold, MissSilver, MissCopper = M.MoneyToCoins(money)
    local charGold, charSilver, charCopper = M.DepotCoins(char,depotId)

    local Amount = money

    local GoldInCopper = 0
    local SilverInCopper = 0
    local GoldInSilver = 0

    GoldInCopper = math.floor(charCopper / 10000)
    GoldInCopper = math.min(MissGold, GoldInCopper)
    PayCopper = GoldInCopper * 10000
    MissGold = MissGold - GoldInCopper
    charCopper = charCopper - PayCopper

    GoldInCopper = math.floor(charCopper / 100)
    GoldInSilver = 100 - GoldInCopper
    if ((MissGold > 0) and (GoldInCopper > 0) and
        (charSilver >= GoldInSilver)) then
        PayCopper = PayCopper + 100 * GoldInCopper
        PaySilver = PaySilver + GoldInSilver
        MissGold = MissGold - 1
        charCopper = charCopper - 100 * GoldInCopper
        charSilver = charSilver - GoldInSilver
    end

    SilverInCopper = math.floor(charCopper / 100)
    SilverInCopper = math.min(MissSilver, SilverInCopper)
    PayCopper = PayCopper + SilverInCopper * 100
    MissSilver = MissSilver - SilverInCopper
    charCopper = charCopper - SilverInCopper * 100

    if (charCopper >= MissCopper) then
        PayCopper = PayCopper + MissCopper
    else
        MissSilver = MissSilver + 1
        PayCopper = PayCopper + MissCopper - 100
    end

    GoldInSilver = math.floor(charSilver / 100)
    GoldInSilver = math.min(MissGold, GoldInSilver)
    PaySilver = PaySilver + GoldInSilver * 100
    MissGold = MissGold - GoldInSilver
    charSilver = charSilver - GoldInSilver * 100

    if (charSilver >= MissSilver) then
        PayGold = MissGold
        PaySilver = PaySilver + MissSilver
    else
        PayGold = MissGold + 1
        PaySilver = PaySilver + MissSilver - 100
    end

    M.TakeCoinsFromDepot(char, PayGold, PaySilver, PayCopper,depotId)
end

function M.IsCurrency(itemId)
    return itemId == CopperCoinsID or itemId == SilverCoinsID or itemId == GoldCoinsID
end

--- This method returns a german and an english string, based on the money amount.
--  @param money - number - the amount of money to be converted
function M.MoneyToString(money)
    local gp, sp, cp = M.MoneyToCoins(money) --converting to gp, sp and cp

	local estring = " "
	local gstring = " "

	if gp ~= 0 then -- at least one gold coin
		estring = estring..gp.." gold coin"
		gstring = gstring..gp.." Goldstück"
		if gp > 1 then
			estring = estring.."s"
			gstring = gstring.."e"
		end
		if sp ~= 0 and cp ~= 0 then
			estring = estring..", "
			gstring = gstring..", "
		elseif sp ~= 0 or cp ~= 0 then
			estring = estring.." and "
			gstring = gstring.." und "
		end
	end

	if sp ~= 0 then -- at least one silver coin
		estring = estring..sp.." silver coin"
		gstring = gstring..sp.." Silberstück"
		if sp > 1 then
			estring = estring.."s"
			gstring = gstring.."e"
		end
		if cp ~= 0 then
			estring = estring.." and "
			gstring = gstring.." und "
		end
	end

	if cp ~= 0 then -- at least one copper coin
		estring = estring..cp.." copper coin"
		gstring = gstring..cp.." Kupferstück"
		if cp > 1 then
			estring = estring.."s"
			gstring = gstring.."e"
		end
	end

    return gstring, estring
end

return M