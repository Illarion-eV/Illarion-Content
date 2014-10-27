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

--This function checks whether the user has the necessary level for the item or not
function M.checkLevel(User,Item) 

	if checkSkill(User,Item) then
	
		return true;
		
	else
	
		common.HighInformNLS(User, "Deine Fertigkeit '"..skillString.."' reicht nicht aus, um das volle Potential dieses Gegenstandes zu nutzen.", "Your skill '"..skillString.."' is not high enough to exploit the full potential of this item."); --inform
		return true; --Change this to FALSE if you want to prevent equipping. For now, set to true because we do not have enough items.
	
	end

	return true; --Just in case
	
end


function checkSkill(User,Item)

	isWeapon, weapon = world:getWeaponStruct(Item.id); --Is it a weapon? Loads the struct.
	isArmour, armour = world:getArmorStruct(Item.id); --Is it an armour? Loads the struct.
	
	if isWeapon then
	
		skillValue,skillString = weaponSkillLevel(User,weapon);
		
		if  skillValue < weapon.Level then
	
			return false; --level too low
		
		else
		
			return true; --level is high enough
		
		end
	
	elseif isArmour then
	
		skillValue,skillString = armourSkillLevel(User,armour);
		
		if skillValue < armour.Level then
		
			return false; --level too low
		
		else
		
			return true; --level is high enough
			
		end
	
	else --neither weapon nor armour
	
		return true; --default: User may use/equip the item
	
	end
	
end

function weaponSkillLevel(User,weapon)

    if (weapon.WeaponType == 1) or (weapon.WeaponType == 4) then
	
        return User:getSkill(Character.slashingWeapons),User:getSkillName(Character.slashingWeapons);

    elseif (weapon.WeaponType == 2) or (weapon.WeaponType == 5) then

        return User:getSkill(Character.concussionWeapons),User:getSkillName(Character.concussionWeapons);

    elseif (weapon.WeaponType == 3) or (weapon.WeaponType == 6) then

		return User:getSkill(Character.punctureWeapons),User:getSkillName(Character.punctureWeapons);

    elseif (weapon.WeaponType == 7) or (weapon.WeaponType == 255) then --distance

		return User:getSkill(Character.distanceWeapons),User:getSkillName(Character.distanceWeapons);
		
	elseif (weapon.WeaponType == 14) then --shields

		return User:getSkill(Character.parry),User:getSkillName(Character.parry);
		
    else

		return 100; --if all fails, the character may equip the item
		
	end;
end;

function armourSkillLevel(User,armour)

	if armour.Type == 4 then
		
		return User:getSkill(Character.heavyArmour),User:getSkillName(Character.heavyArmour);

	elseif armour.Type == 3 then
		
		return User:getSkill(Character.mediumArmour),User:getSkillName(Character.mediumArmour);
		
	elseif armour.Type == 2 then
	
		return User:getSkill(Character.lightArmour),User:getSkillName(Character.lightArmour);
	
	else
		skillString="";
		return 100,skillString; --if all fails, the character may equip the item
		
	end;
end;

return M