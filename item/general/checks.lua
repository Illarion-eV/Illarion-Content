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

local common = require("base.common")

local M = {}

local function weaponSkillLevel(user, weapon)

    if (weapon.WeaponType == 1) or (weapon.WeaponType == 4) then
        return user:getSkill(Character.slashingWeapons), user:getSkillName(Character.slashingWeapons)
    elseif (weapon.WeaponType == 2) or (weapon.WeaponType == 5) then
        return user:getSkill(Character.concussionWeapons), user:getSkillName(Character.concussionWeapons)
    elseif (weapon.WeaponType == 3) or (weapon.WeaponType == 6) then
        return user:getSkill(Character.punctureWeapons), user:getSkillName(Character.punctureWeapons)
    elseif (weapon.WeaponType == 7) or (weapon.WeaponType == 255) then --distance
        return user:getSkill(Character.distanceWeapons), user:getSkillName(Character.distanceWeapons)
--    elseif (weapon.WeaponType == 14) then --shields
--        return user:getSkill(Character.parry), user:getSkillName(Character.parry)
    else
        return 100, "" --if all fails, the character may equip the item
    end
end

local function armourSkillLevel(user, armour)

    if armour.Type == 4 then
        return user:getSkill(Character.heavyArmour), user:getSkillName(Character.heavyArmour)
    elseif armour.Type == 3 then
        return user:getSkill(Character.mediumArmour), user:getSkillName(Character.mediumArmour)
    elseif armour.Type == 2 then
        return user:getSkill(Character.lightArmour), user:getSkillName(Character.lightArmour)
    else
        return 100, "" --if all fails, the character may equip the item
    end
end

local function checkSkill(user, item)
    local isWeapon, weapon = world:getWeaponStruct(item.id) --Is it a weapon? Loads the struct.
    local isArmour, armour = world:getArmorStruct(item.id) --Is it an armour? Loads the struct.
    local itemLevel = world:getItemStatsFromId(item.id).Level

    if isWeapon then
        local skillValue, skillString = weaponSkillLevel(user, weapon)
        if  skillValue < itemLevel then
            return false, skillString --level too low
        else
            return true, skillString --level is high enough
        end
    elseif isArmour then
        local skillValue, skillString = armourSkillLevel(user, armour)
        if skillValue < itemLevel then
            return false, skillString --level too low
        else
            return true, skillString --level is high enough
        end
    else --neither weapon nor armour
    return true, "" --default: user may use/equip the item
    end
end

local function checkParry(user, item)
    local isWeapon, weapon = world:getWeaponStruct(item.id) --Is it a weapon? Loads the struct.
    local itemLevel = world:getItemStatsFromId(item.id).Level

    if isWeapon then
        local skillValue = user:getSkill(Character.parry)
        local skillString = user:getSkillName(Character.parry)
        if  skillValue < itemLevel then
            return false, skillString --level too low
        else
            return true, skillString --level is high enough
        end
    else -- parry is used for weapons only
        return true, "" --default: user may use/equip the item
    end
end

--This function checks whether the user has the necessary level for the item or not
function M.checkLevel(user, item, targetItem)
    local isArmour, armour = world:getArmorStruct(item.id) --Is it an armour? Loads the struct.
    local skillOK, skillString = checkSkill(user,  item)
    local parryOK, parryString = checkParry(user,  item)
    if isArmour and (targetItem.itempos == Character.left_tool or targetItem.itempos == Character.right_tool) then
        -- nothing
    elseif  not skillOK and not parryOK then
        common.HighInformNLS(user, "Deine Fertigkeiten '"..skillString.."' und '"..parryString.."' reichen nicht aus, um das volle Potential dieses Gegenstandes zu nutzen.", "Your skills '"..skillString.."' and '"..parryString.."' are not high enough to exploit the full potential of this item.")
    elseif not parryOK then
        common.HighInformNLS(user, "Deine Fertigkeit '"..parryString.."' reicht nicht aus, um das volle defensive Potential dieses Gegenstandes zu nutzen.", "Your skill '"..parryString.."' is not high enough to exploit the full defence potential of this item.")
    elseif not skillOK then
        common.HighInformNLS(user, "Deine Fertigkeit '"..skillString.."' reicht nicht aus, um das volle offensive Potential dieses Gegenstandes zu nutzen.", "Your skill '"..skillString.."' is not high enough to exploit the full attack potential of this item.")
    end
    return true
end

return M
