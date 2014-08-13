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
-- Return true if the monster is an archer AND in range. Otherwise false.
function isMonsterArcherInRange(archer, target)

	return false;

end


-- Checks if a monster is within 6 fields to its target. Also slows monster down
-- Return false if monster should go ahead and aggro the target.
function isMonsterInRange(monster, target)

	return false;
end

noDropList = {}
-- Saves a monster as one that should not drop
function setNoDrop(theMonster)

	noDropList[theMonster.id] = true

end

-- Check if the the monster is in the noDropList
-- set keepInList to true in case it should stay in the list (e.g. if it hasn't died yet)
function checkNoDrop(theMonster, keepInList)
	
	if noDropList[theMonster.id] then
		if not keepInList then
			noDropList[theMonster.id] = nil
		end
		return true
	end
	return false
end

unattackableList = {}
function setUnattackability(theMonster,messageGerman, messageEnglish)
	
	unattackableList[theMonster.id] = {}
	unattackableList[theMonster.id]["messageGerman"] = messageGerman
	unattackableList[theMonster.id]["messageEnglish"] = messageEnglish

end

function checkUnattackability(theMonster, attacker)
	
	if unattackableList[theMonster.id] then
		if attacker and unattackableList[theMonster.id]["messageGerman"] and unattackableList[theMonster.id]["messageEnglish"] then
			local currentTime = world:getTime("unix")
			if (not unattackableList[theMonster.id][attacker.id]) or currentTime - unattackableList[theMonster.id][attacker.id] > 9 then
				attacker:inform(unattackableList[theMonster.id]["messageGerman"],unattackableList[theMonster.id]["messageEnglish"])
				unattackableList[theMonster.id][attacker.id] = currentTime
			end
		end
		return true
	end
	return false
end

-- That function should awalys be called when an unattackable monster dies, in order to clean up the list
function removeUnattackability(theMonster)

	unattackableList[theMonster.id] = nil

end