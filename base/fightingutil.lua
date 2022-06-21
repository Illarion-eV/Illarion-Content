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

--[[
Reasoning of this lua-script: The standardfighting script is messy.
With features like ranged physical fighting, melee and upcoming magic fighting
there is a huge difference in how attacks are evaluated but only one entrypoint.
To reduce confusion it is advised to split every attack-type into its own script.
However shared functions must be accessible and not be copied.

This script is only a first step (as it contains fighting logic which it shouldnt)
Better state (imo) would be:
- standardfighting as entrypoint
- melee.lua, ranged.lua, staff.lua (spells should be handeled separatly)
- standardfighting owning all shared scripts
-- with no internal fighting-logic (like special cases for difference fightforms)
-- with smallest functions possible:
--- e.g.: checkRange checking also blocking is a confusing behavior
--- better: change function name to match behavior better
--- even better: split function into checkRange and checkBlocked (or so)
]]
local common = require("base.common")

local M = {}

--[[ Check the range from the attacker to the defender and ensure that it is
---- within weapon distance.
---- @param attackerStruct The table that stores the data of the attacker
---- @param defender The character who is attacked
---- @return true in case the range is fine, else false
---- @return distance between attacker and defender]]
function M.checkRangeAndView(attackerStruct, defender)
    local distance = attackerStruct.Char:distanceMetric(defender)

    if distance > 1 then
        local blockList = world:LoS(attackerStruct.Char.pos, defender.pos)
        local next = next

        -- see if there is a "next" (first) object in blockList!
        if (next(blockList)~=nil) then
                return false, distance
        end
    end

    if distance <= 2 and attackerStruct.AttackKind == 4 then
        return false, distance
    end

    if attackerStruct.IsWeapon then
        return distance <= attackerStruct.Weapon.Range, distance
    end

    return distance <= 1, distance
end

-- Load all weapon data for a character.
-- The data is added to the given parameter table
-- @param charStruct The table of the character the weapons are supposed to be load for
-- @returns the modified charStruct
function M.loadWeapons(charStruct)
    local rItem = charStruct.Char:getItemAt(Character.right_tool)
    local lItem = charStruct.Char:getItemAt(Character.left_tool)

    local items = {rItem, lItem}

    -- Unequip broken weapons
    for _, theItem in pairs(items) do -- Both items in hand are checked one after the other
        if theItem and theItem.id ~= 0 and common.isBroken(theItem) then -- Makes sure the item actually exists then checks if it is broken
            local itemIsWeapon, theWeaponStruct = world:getWeaponStruct(theItem.id)
            if itemIsWeapon then -- Makes sure the item is a weapon, not a tool or anything else
                local weaponType = theWeaponStruct.WeaponType
                if not (weaponType == WeaponStruct.arrow or weaponType == WeaponStruct.bolt or weaponType == WeaponStruct.stone) then -- Ammunition counts as a weapon, so this excludes that from the check if there is somehow a broken arrow or something
                    if not common.moveItemToBackpack(charStruct.Char, theItem) then
                        world:erase(theItem, theItem.number)
                        world:createItemFromItem(theItem, charStruct.Char.pos, true)
                    end
                end
            end
        end
    end

    -- items are fetched again in case they were unequipped above
    rItem = charStruct.Char:getItemAt(Character.right_tool)
    lItem = charStruct.Char:getItemAt(Character.left_tool)
    local rAttFound, rAttWeapon = world:getWeaponStruct(rItem.id)
    local lAttFound, lAttWeapon = world:getWeaponStruct(lItem.id)

    -- the right item is ALWAYS used as the weapon now!
    local isRWp = 1
    local isLWp = 1

    if rAttFound then
        local WType = rAttWeapon.WeaponType
        if WType==10 or WType==11 or WType==12 or WType==14 then -- Ammo or shield in right hand: switch r and l hand!
            isRWp=0
        end
    else
        isRWp=0
    end

    if lAttFound then
        local WType = lAttWeapon.WeaponType
        if WType==10 or WType==11 or WType==12 or WType==14 then -- Ammo or shield in right hand: switch r and l hand!
            isLWp=0
        end
    else
        isLWp=0
    end

    if isRWp==0 and isLWp==1 then -- switch weapons
        rItem,lItem = lItem,rItem
        rAttFound,lAttFound = lAttFound,rAttFound
        rAttWeapon,lAttWeapon = lAttWeapon,rAttWeapon
    end

    charStruct["WeaponItem"] = rItem
    charStruct["IsWeapon"] = rAttFound
    charStruct["Weapon"] = rAttWeapon

    charStruct["SecWeaponItem"] = lItem
    charStruct["SecIsWeapon"] = lAttFound
    charStruct["SecWeapon"] = lAttWeapon

    return charStruct
end

function M.isMagicUser(Attacker)
    if Attacker:getMagicType() == 0 and (Attacker:getQuestProgress(37) ~= 0 or Attacker:getMagicFlags(0) > 0) then
        return true
    end

    return false
end


local selectedEnemies = {}

-- Stores the current attacked enemy's id as the selected target of the character
function M.setSelectedEnemyId(theCharId, selectedEnemyId)
    selectedEnemies[theCharId] = {enemyId = selectedEnemyId, timestamp = world:getTime("unix")}
end

-- Returns the id of the currently selected enemy
-- Currently selected means that onAttack has been called at least within the last two seconds for that target
function M.getSelectedEnemyId(theCharId)
    if selectedEnemies[theCharId] then
        if world:getTime("unix")-2 <= selectedEnemies[theCharId].timestamp then
            return selectedEnemies[theCharId].enemyId
        end
    end

    return false
end

return M
