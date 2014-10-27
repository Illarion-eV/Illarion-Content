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


local M = {}

-- Checks if a monster archer is in range to its target.
-- Return true if the monster is an archer AND in range. Otherwise false.
function M.isMonsterArcherInRange(archer, target)

	return false;

end


-- Checks if a monster is within 6 fields to its target. Also slows monster down
-- Return false if monster should go ahead and aggro the target.
function M.isMonsterInRange(monster, target)

	return false;
end

M.noDropList = {}
-- Saves a monster as one that should not drop
function M.setNoDrop(theMonster)

	M.noDropList[theMonster.id] = true

end

-- Check if the the monster is in the noDropList
-- set keepInList to true in case it should stay in the list (e.g. if it hasn't died yet)
function M.checkNoDrop(theMonster, keepInList)
	
	if M.noDropList[theMonster.id] then
		if not keepInList then
			M.noDropList[theMonster.id] = nil
		end
		return true
	end
	return false
end

M.unattackableList = {}
function M.setUnattackability(theMonster,messageGerman, messageEnglish)
	
	M.unattackableList[theMonster.id] = {}
	M.unattackableList[theMonster.id]["messageGerman"] = messageGerman
	M.unattackableList[theMonster.id]["messageEnglish"] = messageEnglish

end

function M.checkUnattackability(theMonster, attacker)
	
	if M.unattackableList[theMonster.id] then
		if attacker and M.unattackableList[theMonster.id]["messageGerman"] and M.unattackableList[theMonster.id]["messageEnglish"] then
			local currentTime = world:getTime("unix")
			if (not M.unattackableList[theMonster.id][attacker.id]) or currentTime - M.unattackableList[theMonster.id][attacker.id] > 9 then
				attacker:inform(M.unattackableList[theMonster.id]["messageGerman"],M.unattackableList[theMonster.id]["messageEnglish"])
				M.unattackableList[theMonster.id][attacker.id] = currentTime
			end
		end
		return true
	end
	return false
end

-- That function should awalys be called when an unattackable monster dies, in order to clean up the list
function M.removeUnattackability(theMonster)

	M.unattackableList[theMonster.id] = nil

end

return M