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
-- Collection of helper functions for the handling of characters
local M = {}

local HITPOINTS = "hitpoints"

--- Get the current hitpoints of the character
-- @param User the character that is queried
-- @return the hitpoints of the character
function M.GetHP(User)
    return User:increaseAttrib(HITPOINTS, 0)
end

--- Change the hitpoints value of a character.
-- @param User The characters that receives the hitpoints change.
-- @param Value The value the hitpoints are changed by.
-- @return true in case the character is alive after the change of the hitpoints
function M.ChangeHP(User, Value)
    return User:increaseAttrib(HITPOINTS, Value) > 0;
end;

--- Check if a character would surive if a amount of hitpoints get reduced
-- @param User The character that is tested
-- @param Value The value of hitpoints that are supposed to be reduced
-- @return true in case the character would survive
function M.WouldDie(User, Value)
    return M.GetHP(User) <= Value;
end;

--- Check if a character is dead.
-- @param User the character to check
-- @return true in case the character is dead
function M.IsDead(User)
    return M.GetHP(User) == 0
end

--- Check if the character is at the brink of death. Means that the character
-- has only one hitpoint left.
-- @param User The character to check
-- @return true in case the character is at the brink of death
function M.AtBrinkOfDeath(User)
    return M.WouldDie(User, 1);
end;

--- Bring a character to the brink of death. Means that he has only one hitpoint
-- left.
-- @param User The character to bring to the brink of death
function M.ToBrinkOfDeath(User)
    M.ChangeHP(User, 1 - M.GetHP(User));
end;

--- Kill a character.
-- @param User The character to kill
-- @return true in case the player was killed successfully
function M.Kill(User)
    M.ChangeHP(User, -10000);
    return true;
end;

--- Change the movepoints of a character by the value handed over.
-- @param User The character thats movepoints are supposed to change
-- @param Value The amount of movepoints that are added
function M.ChangeMovepoints(User, Value)
    User.movepoints = User.movepoints + Value;
end;

--- Change the fighting points of a character by the value handed over.
-- @param User The character thats fightingpoints are supposed to change
-- @param Value The amount of fightingpoints that are added
-- @info This is currently set to change the movepoints also because the
--          fighting points do not seem to work on the current server
function M.ChangeFightingpoints(User, Value)
    User.fightpoints = User.fightpoints + Value;
end;

--- Check if the character is a player character.
-- @param User The character to check
-- @return true in case the character is a player character
function M.IsPlayer(User)
    return User:getType() == Character.player;
end;

-- Kills immediately after a defined period of time
-- @param Character The character (e.g. summoned monster) supposed to die
-- @param deathAfter The period of time after which the character dies in 1/10 sec
-- @param deathGfx The GFX shown on the characters' death, nil for no GFX
-- @param deathSound The sound played on characters' death, nil for no sound
-- @param blood Boolean determining if blood is dropped or not
function M.DeathAfterTime(Character,deathAfter,deathGfx,deathSound,blood)
    local find, myEffect = Character.effects:find(36)
	if find then
	    return
	else
	    myEffect = LongTimeEffect(36,deathAfter)
		if deathGfx ~= nil then
		    myEffect:addValue("deathGfx",deathGfx)
        end
		if deathSound ~= nil then
		    myEffect:addValue("deathSound",deathSound)
		end
	    if blood then
			myEffect:addValue("blood",1)
		end
		Character.effects:addEffect(myEffect)
    end
end

-- Get a string that is nicely usable for a character reference in the logfile
-- @param character the character
-- @return the reference string to the character for the logfile
function M.LogText(character)
	return string.format("%s (%u)", character.name, character.id);
end

return M
