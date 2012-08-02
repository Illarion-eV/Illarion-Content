-- Collection of helper functions for the handling of characters
module("base.character", package.seeall)

--- Change the hitpoints value of a character.
-- @param User The characters that receives the hitpoints change.
-- @param Value The value the hitpoints are changed by.
-- @return true in case the character is alive after the change of the hitpoints
function ChangeHP(User, Value)
    return User:increaseAttrib("hitpoints", Value) > 0;
end;

--- Check if a character would surive if a amount of hitpoints get reduced
-- @param User The character that is tested
-- @param Value The value of hitpoints that are supposed to be reduced
-- @return true in case the character would survive
function WouldDie(User, Value)
    return User:increaseAttrib("hitpoints", 0) <= Value;
end;

--- Check if the character is at the brink of death. Means that the character
-- has only one hitpoint left.
-- @param User The character to check
-- @return true in case the character is at the brink of death
function AtBrinkOfDeath(User)
    return WouldDie(User, 1);
end;

--- Bring a character to the brink of death. Means that he has only one hitpoint
-- left.
-- @param User The character to bring to the brink of death
function ToBrinkOfDeath(User)
    ChangeHP(User, 1 - User:increaseAttrib("hitpoints", 0));
end;

--- Kill a character.
-- @param User The character to kill
-- @return true in case the player was killed successfully
function Kill(User)
    ChangeHP(User, -10000);
    return true;
end;

--- Change the movepoints of a character by the value handed over.
-- @param User The character thats movepoints are supposed to change
-- @param Value The amount of movepoints that are added
function ChangeMovepoints(User, Value)
    User.movepoints = User.movepoints + Value;
end;

--- Change the fighting points of a character by the value handed over.
-- @param User The character thats fightingpoints are supposed to change
-- @param Value The amount of fightingpoints that are added
-- @info This is currently set to change the movepoints also because the
--          fighting points do not seem to work on the current server
function ChangeFightingpoints(User, Value)
    User.fightpoints = User.fightpoints + Value;
end;

--- Check if the character is a player character.
-- @param User The character to check
-- @return true in case the character is a player character
function IsPlayer(User)
    return User:getType() == 0;
end;

-- Kills immediately after a defined period of time
-- @param Character The character (e.g. summoned monster) supposed to die
-- @param deathAfter The period of time after which the character dies in 1/10 sec
-- @param deathGfx The GFX shown on the characters' death, nil for no GFX
function DeathAfterTime(Character,deathAfter,deathGfx)
    find, myEffect = Character.effects:find(36)
	if find then 
	    return
	else
	    myEffect = LongTimeEffect(36,deathAfter)
		if not deathGfx == nil then
		    myEffect:addValue("deathGfx",deathGfx)
        end
		Character.effects:addEffect(myEffect)
    end
end	