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
-- @param deathSound The sound played on characters' death, nil for no sound
function DeathAfterTime(Character,deathAfter,deathGfx,deathSound)
    find, myEffect = Character.effects:find(36)
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
		Character.effects:addEffect(myEffect)
    end
end	

-- Get a string that is nicely usable for a character reference in the logfile
-- @param character the character
-- @return the reference string to the character for the logfile
function LogText(character)
	return string.format("%s (%u)", character.name, character.id);
end;

-- Create item after a defined period of time
-- @param Character The character (e.g. summoned monster) that is supposed to create
-- @param createItemTimeB How often the script shall run
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
-- @param createItemTextDE The German text shown on the created item, nil for no text
-- @param createItemTextEN The English text shown on the created item, nil for no text
-- @param createGfx The GFX shown on the created item, nil for no GFX
-- @param createSound The sound played on created item, nil for no sound
function CreateAfterTime(Character,createItemTimeB,createItemID,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB,createItemTextDE,createItemTextEN)
	find, myEffect = Character.effects:find(80)
	if find then
		return
	else
		createAfter=math.random(createAfterA,createAfterB);
		myEffect = LongTimeEffect(80,createAfter)
		myEffect:addValue("createItemTimeB",createItemTimeB)
		myEffect:addValue("createItemID",createItemID)
		myEffect:addValue("createItemAmountA",createItemAmountA)
		myEffect:addValue("createItemAmountB",createItemAmountB)
		myEffect:addValue("createItemXA",createItemXA)
		myEffect:addValue("createItemXB",createItemXB)
		myEffect:addValue("createItemYA",createItemYA)
		myEffect:addValue("createItemYB",createItemYB)
		myEffect:addValue("createItemZA",createItemZA)
		myEffect:addValue("createItemZB",createItemZB)
		myEffect:addValue("createItemQualA",createItemQualA)
		myEffect:addValue("createItemQualB",createItemQualB)
		myEffect:addValue("createAfterA",createAfterA)
		myEffect:addValue("createAfterB",createAfterB)
		myEffect:addValue("createRepeatA",createRepeatA)
		myEffect:addValue("createRepeatB",createRepeatB)
		if createGfx ~= nil then
			myEffect:addValue("createItemTextDE",createItemTextDE)
		end
		if createGfx ~= nil then
			myEffect:addValue("createItemTextEN",createItemTextEN)
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
