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


module("monster.base.base", package.seeall)

-- Checks if a monster archer is in range to its target.
-- Return true if the montser is an archer AND in range. Otherwise false.
function isMonsterArcherInRange(archer,target)

	local lItem = archer:getItemAt(Character.left_tool)
	local rItem = archer:getItemAt(Character.right_tool)
	local rAttFound, rAttWeapon = world:getWeaponStruct(rItem.id)
    local lAttFound, lAttWeapon = world:getWeaponStruct(lItem.id)
	
	local range = false
	if lAttFound and lAttWeapon.WeaponType == 7 then
		range = lAttWeapon.Range
	elseif rAttFound and rAttWeapon.WeaponType == 7 then
		range = rAttWeapon.Range
	end
	
	if range then
		return (archer:distanceMetric(target) <= range)
	else
		return false
	end

end