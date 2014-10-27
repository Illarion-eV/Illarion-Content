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

--- Change the hitpoints value of a character.
-- @param User The characters that receives the hitpoints change.
-- @param Value The value the hitpoints are changed by.
-- @return true in case the character is alive after the change of the hitpoints
function M.ChangeHP(User, Value)
    return User:increaseAttrib("hitpoints", Value) > 0;
end;

--- Check if a character would surive if a amount of hitpoints get reduced
-- @param User The character that is tested
-- @param Value The value of hitpoints that are supposed to be reduced
-- @return true in case the character would survive
function M.WouldDie(User, Value)
    return User:increaseAttrib("hitpoints", 0) <= Value;
end;

--- Check if the character is at the brink of death. Means that the character
-- has only one hitpoint left.
-- @param User The character to check
-- @return true in case the character is at the brink of death
function M.AtBrinkOfDeath(User)
    return WouldDie(User, 1);
end;

--- Bring a character to the brink of death. Means that he has only one hitpoint
-- left.
-- @param User The character to bring to the brink of death
function M.ToBrinkOfDeath(User)
    ChangeHP(User, 1 - User:increaseAttrib("hitpoints", 0));
end;

--- Kill a character.
-- @param User The character to kill
-- @return true in case the player was killed successfully
function M.Kill(User)
    ChangeHP(User, -10000);
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
    return User:getType() == 0;
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
end;

-- Create item after a defined period of time
-- @param Character The character (e.g. summoned monster) that is supposed to create
-- @param createItemTimeB How often the script shall run with var1
-- @param createItemTimeBB How often the script shall run with var2
-- @param createItemID The ID of the item that is supposed to create
-- @param createItemAmountA The min amount of the item that is supposed to be created
-- @param createItemAmountB The max amount of the item that is supposed to be created
-- @param createItemXA The min X-position of the item that is supposed to be created
-- @param createItemXB The max X-position of the item that is supposed to be created
-- @param createItemYA The min Y-position of the item that is supposed to be created
-- @param createItemYB The max Y-position of the item that is supposed to be created
-- @param createItemZA The min Z-position of the item that is supposed to be created
-- @param createItemZB The max Z-position of the item that is supposed to be created
-- @param createItemQualA The min quality of the item that is supposed to be created
-- @param createItemQualB The max quality of the item that is supposed to be created
-- @param createAfterA The min period of time after which the item is created in 1/10 sec
-- @param createAfterB The max period of time after which the item is created in 1/10 sec
-- @param createRepeatA The min repeat of the item that is supposed to be created
-- @param createRepeatB The max repeat of the item that is supposed to be created
-- @param createItemPos check position of item, nil for no check
-- @param createItemTextDE The German text shown on the created item, nil for no text
-- @param createItemTextEN The English text shown on the created item, nil for no text
-- @param createGfx The GFX shown on the created item, nil for no GFX
-- @param createSound The sound played on created item, nil for no sound
-- @param createItemFieldAccess Should field of created item be accessable, nil or 0 for accessable
function M.CreateAfterTime(Character,createItemTimeB,createItemTimeBB,createItemID,createItemIDB,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB,createItemText,createItemPos,createItemFieldAccess)
    local find, myEffect = Character.effects:find(80)
    if find then
        return
    else
        createAfter=math.random(createAfterA,createAfterB)
        myEffect = LongTimeEffect(80,createAfter)
        if createItemTimeB ~= nil then
            myEffect:addValue("createItemTimeB",createItemTimeB)
        end
        if createItemTimeBB ~= nil then
            myEffect:addValue("createItemTimeBB",createItemTimeBB)
        end
        if createItemID ~= nil then
            myEffect:addValue("createItemID",createItemID)
        end
        if createItemIDB ~= nil then
            myEffect:addValue("createItemIDB",createItemIDB)
        end
        if createItemAmountA ~= nil then
            myEffect:addValue("createItemAmountA",createItemAmountA)
        end
        if createItemAmountB ~= nil then
            myEffect:addValue("createItemAmountB",createItemAmountB)
        end
        if createItemXA ~= nil then
            myEffect:addValue("createItemXA",createItemXA)
        end
        if createItemXB ~= nil then
            myEffect:addValue("createItemXB",createItemXB)
        end
        if createItemYA ~= nil then
            myEffect:addValue("createItemYA",createItemYA)
        end
        if createItemYB ~= nil then
            myEffect:addValue("createItemYB",createItemYB)
        end
        if createItemZA ~= nil then
            myEffect:addValue("createItemZA",createItemZA)
        end
        if createItemZB ~= nil then
            myEffect:addValue("createItemZB",createItemZB)
        end
        if createItemQualA ~= nil then
            myEffect:addValue("createItemQualA",createItemQualA)
        end
        if createItemQualB ~= nil then
            myEffect:addValue("createItemQualB",createItemQualB)
        end
        if createAfterA ~= nil then
            myEffect:addValue("createAfterA",createAfterA)
        end
        if createAfterB ~= nil then
            myEffect:addValue("createAfterB",createAfterB)
        end
        if createRepeatA ~= nil then
            myEffect:addValue("createRepeatA",createRepeatA)
        end
        if createRepeatB ~= nil then
            myEffect:addValue("createRepeatB",createRepeatB)
        end
        if createItemFieldAccess ~= nil then
            myEffect:addValue("createItemFieldAccess",createItemFieldAccess)
        end
        if createItemPos ~= nil then
            myEffect:addValue("createItemPos",createItemPos)
        end
        if createItemText ~= nil then
            myEffect:addValue("createItemText",createItemText)
        end
        if createGfx ~= nil then
            myEffect:addValue("createGfx",createGfx)
               end
        if createSound ~= nil then
            myEffect:addValue("createSound",createSound)  
        end
        Character.effects:addEffect(myEffect)
    end
end

return M