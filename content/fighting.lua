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

--[[
    Returns the attack value of a race wrestling

    @param  int requested race
    @return int attack value
]]
function M.GetWrestlingAttack(Race)
     return 10;
end;

--[[
    Returns the Movepoints of a race wrestling

    @param  int requested race
    @return int movepoints
]]
function M.GetWrestlingMovepoints( Race )
     return 25;
end;

--[[
    Returns the parry value if the race is in a wrestling fight against another character

    @param  int requested race
    @return int parry value
]]
function GetWrestlingParry(Race)
     return 10;
end;

--[[
    Returns the Accuracy of a race wrestling

    @param  int requested race
    @return int accuracy
]]
function GetWrestlingAccuracy( Race )
    return 50;
end

--[[
    Get the GFX Id of a wrestling attack for the character

    @param  CharacterTable  Character table of the attacking character
    @return int ID if the gfx for the wrestling attack
]]
function GetWrestlingGFX( Attacker )
    if ( Attacker.Race == 25 ) and ( Attacker.Char:getType() == 1 ) then
        local monID = Attacker.Char:getMonsterType();
        if (monID == 515 or monID == 516) then
            return 44;
        elseif (monID == 503 or monID == 504) then
            return 3;
        elseif (monID == 505 or monID == 506) then
            return 2;
        elseif (monID == 507 or monID == 508) then
            return 32;
        elseif (monID == 509 or monID == 510) then
            return 37;
        end
    end

    if ( Attacker.Race == 0 )      then return 22; -- human
    elseif ( Attacker.Race == 1 )  then return 22; -- dwarf
    elseif ( Attacker.Race == 2 )  then return 22; -- halfling
    elseif ( Attacker.Race == 3 )  then return 22; -- elf
    elseif ( Attacker.Race == 4 )  then return 22; -- orc
    elseif ( Attacker.Race == 6 )  then return 22; -- gnome
    elseif ( Attacker.Race == 7 )  then return 22; -- fairy
    elseif ( Attacker.Race == 8 )  then return 22; -- goblin
    elseif ( Attacker.Race == 31 ) then return 22; -- mgoblin
    elseif ( Attacker.Race == 34 ) then return 22; -- mdrow
    elseif ( Attacker.Race == 35 ) then return 22; -- fdrow
    else return 21;
    end;
end

--[[
    Get if the race is a unholy one or not

    @param  int race ID
    @return boolean true if it is a unholy race, false if not
]]
function GetUnholyRace(Race)
    if (Race == 10) then return true;     -- mummy
    elseif (Race == 11) then return true; -- skeleton
    elseif (Race == 12) then return true; -- beholder
    elseif (Race == 20) then return true; -- demon skeleton
    elseif (Race == 22) then return true; -- demon
    elseif (Race == 26) then return true; -- scull
    elseif (Race == 29) then return true; -- shadow skeleton
    elseif (Race == 36) then return true; -- lower demon
    elseif (Race == 46) then return true; -- fallen
    else return false; -- all others
    end
end

--[[
    Get the weakness modifier of a race against copper

    @param  int race ID
    @return int weakness modifier
]]
function GetWeaknessCopper( Race )
    if ( Race == 0 )      then return 13; --human
    elseif ( Race == 1 )  then return 13; --dwarf
    elseif ( Race == 2 )  then return 13; --halfling
    elseif ( Race == 3 )  then return 7 ; --elf
    elseif ( Race == 5 )  then return 7 ; --lizard
    elseif ( Race == 6 )  then return -3; --gnome
    elseif ( Race == 7 )  then return 7 ; --fairy
    elseif ( Race == 9 )  then return -3; --troll
    elseif ( Race == 10 ) then return -3; --mummy
    elseif ( Race == 11 ) then return -3; --skeleton
    elseif ( Race == 17 ) then return 13; --insects
    elseif ( Race == 18 ) then return 13; --sheep
    elseif ( Race == 19 ) then return -3; --spider
    elseif ( Race == 21 ) then return -3; --rotworm
    elseif ( Race == 22 ) then return -3; --red demon
    elseif ( Race == 24 ) then return 13; --pig
    elseif ( Race == 26 ) then return -3; --skull
    elseif ( Race == 27 ) then return 7 ; --wasp
    elseif ( Race == 28 ) then return 7 ; --forest troll
    elseif ( Race == 29 ) then return -3; --shadow skeleton
    elseif ( Race == 31 ) then return -3; --male goblin
    elseif ( Race == 32 ) then return -3; --gnoll
    elseif ( Race == 33 ) then return -3; --dragon
    elseif ( Race == 34 ) then return 7 ; --male drow
    elseif ( Race == 35 ) then return 7 ; --female drow
    elseif ( Race == 36 ) then return -3; --lesser demon
    elseif ( Race == 37 ) then return 13; --cow
    elseif ( Race == 38 ) then return 13; --deer
    elseif ( Race == 39 ) then return 13; --wolf
    elseif ( Race == 40 ) then return 13; --panther
    elseif ( Race == 41 ) then return 13; --rabbit
    elseif ( Race == 43 ) then return 7 ; --fairy
    elseif ( Race == 44 ) then return -3; --male gnome
    elseif ( Race == 45 ) then return -3; --female gnome
    else return 0;
    end
end

--[[
    Get the weakness modifier of a race against silver

    @param  int race ID
    @return int weakness modifier
]]
function GetWeaknessSilver( Race )
    if ( Race == 0 )      then return -3; --human
    elseif ( Race == 1 )  then return -3; --dwarf
    elseif ( Race == 2 )  then return -3; --halfling
    elseif ( Race == 3 )  then return -3; --elf
    elseif ( Race == 4 )  then return 13; --orc
    elseif ( Race == 6 )  then return 13; --gnome
    elseif ( Race == 8 )  then return 13; --goblin
    elseif ( Race == 9 )  then return 13; --troll
    elseif ( Race == 12 ) then return -3; --beholder
    elseif ( Race == 18 ) then return -3; --sheep
    elseif ( Race == 19 ) then return 13; --spider
    elseif ( Race == 20 ) then return -3; --demon skeleton
    elseif ( Race == 23 ) then return -3; --scorpion
    elseif ( Race == 24 ) then return 7 ; --pig
    elseif ( Race == 27 ) then return 13; --wasp
    elseif ( Race == 28 ) then return 13; --forest troll
    elseif ( Race == 30 ) then return -3; --stone golem
    elseif ( Race == 31 ) then return 13; --male goblin
    elseif ( Race == 34 ) then return -3; --male drow
    elseif ( Race == 35 ) then return -3; --female drow
    elseif ( Race == 37 ) then return 7 ; --cow
    elseif ( Race == 38 ) then return 7 ; --deer
    elseif ( Race == 39 ) then return 7 ; --wolf
    elseif ( Race == 40 ) then return 7 ; --panther
    elseif ( Race == 41 ) then return 7 ; --rabbit
    elseif ( Race == 42 ) then return 13; --female goblin
    elseif ( Race == 44 ) then return 13; --male gnome
    elseif ( Race == 45 ) then return 13; --female gnome
    elseif ( Race == 46 ) then return 7 ; --fallen
    else return 0;
    end
end

--[[
    Get the weakness modifier of a race against gold

    @param  int race ID
    @return int weakness modifier
]]
function GetWeaknessGold( Race )
    if ( Race == 4 )      then return 7 ; --orc
    elseif ( Race == 5 )  then return 13; --lizard
    elseif ( Race == 6 )  then return 7 ; --gnome
    elseif ( Race == 7 )  then return -3; --fairy
    elseif ( Race == 8 )  then return 7 ; --goblin
    elseif ( Race == 9 )  then return 7 ; --troll
    elseif ( Race == 10 ) then return 13; --mummy
    elseif ( Race == 11 ) then return 13; --skeleton
    elseif ( Race == 12 ) then return 7 ; --beholder
    elseif ( Race == 17 ) then return -3; --insects
    elseif ( Race == 18 ) then return 7 ; --sheep
    elseif ( Race == 19 ) then return 7 ; --spider
    elseif ( Race == 20 ) then return 7 ; --demon skeleton
    elseif ( Race == 21 ) then return 13; --rotworm
    elseif ( Race == 22 ) then return 7 ; --red demon
    elseif ( Race == 23 ) then return 7 ; --scorpion
    elseif ( Race == 24 ) then return -3; --pig
    elseif ( Race == 26 ) then return 13; --skull
    elseif ( Race == 27 ) then return -3; --wasp
    elseif ( Race == 29 ) then return 13; --shadow skeleton
    elseif ( Race == 30 ) then return 7 ; --stone golem
    elseif ( Race == 31 ) then return 7 ; --male goblin
    elseif ( Race == 32 ) then return 13; --gnoll
    elseif ( Race == 33 ) then return 7 ; --dragon
    elseif ( Race == 34 ) then return 13; --male drow
    elseif ( Race == 35 ) then return 13; --female drow
    elseif ( Race == 36 ) then return 7 ; --lesser demon
    elseif ( Race == 37 ) then return -3; --cow
    elseif ( Race == 38 ) then return -3; --deer
    elseif ( Race == 39 ) then return -3; --wolf
    elseif ( Race == 40 ) then return -3; --panther
    elseif ( Race == 41 ) then return -3; --rabbit
    elseif ( Race == 42 ) then return 7 ; --female goblin
    elseif ( Race == 43 ) then return -3; --fairy
    elseif ( Race == 44 ) then return 7 ; --male gnome
    elseif ( Race == 45 ) then return 7 ; --female gnome
    elseif ( Race == 46 ) then return -3; --fallen
    else return 0;
    end
end

--[[
    Get the weakness modifier of a race against merinium

    @param  int race ID
    @return int weakness modifier
]]
function GetWeaknessMerinium( Race )
    if ( Race == 0 )      then return 7 ; --human
    elseif ( Race == 1 )  then return 7 ; --dwarf
    elseif ( Race == 2 )  then return 7 ; --halfling
    elseif ( Race == 3 )  then return 13; --elf
    elseif ( Race == 4 )  then return -3; --orc
    elseif ( Race == 5 )  then return -3; --lizard
    elseif ( Race == 7 )  then return 13; --fairy
    elseif ( Race == 8 )  then return -3; --goblin
    elseif ( Race == 10 ) then return 7 ; --mummy
    elseif ( Race == 11 ) then return 7 ; --skeleton
    elseif ( Race == 12 ) then return 13; --beholder
    elseif ( Race == 17 ) then return 7 ; --insects
    elseif ( Race == 20 ) then return 13; --demon skeleton
    elseif ( Race == 21 ) then return 7 ; --rotworm
    elseif ( Race == 22 ) then return 13; --red demon
    elseif ( Race == 23 ) then return 13; --scorpion
    elseif ( Race == 26 ) then return 7 ; --skull
    elseif ( Race == 28 ) then return -3; --forest troll
    elseif ( Race == 29 ) then return 7 ; --shadow skeleton
    elseif ( Race == 30 ) then return 13; --stone golem
    elseif ( Race == 32 ) then return 7 ; --gnoll
    elseif ( Race == 33 ) then return 13; --dragon
    elseif ( Race == 36 ) then return 13; --lesser demon
    elseif ( Race == 42 ) then return -3; --female goblin
    elseif ( Race == 43 ) then return 13; --fairy
    elseif ( Race == 46 ) then return 13; --fallen
    else return 0;
    end
end

--[[
    Returns if the weapon with the ID is a plated weapon

    @param  int ID of the Item
    @return boolean plated weapon or not
]]
function IsPlatedWeapon( ItemID )
    return ( IsMeriniumPlatedWeapon( ItemID ) or IsGoldPlatedWeapon( ItemID ) or IsSilverPlatedWeapon( ItemID ) or IsCopperPlatedWeapon( ItemID ) );
end

--[[
    Returns if the weapon with the ID is a merinium plated weapon

    @param  int ID of the Item
    @return boolean merinium plated weapon or not
]]
function IsMeriniumPlatedWeapon( ItemID )
    return (
        ItemID == 444 or
        ItemID == 296 or
        ItemID == 123
    );
end

--[[
    Returns if the weapon with the ID is a gold plated weapon

    @param  int ID of the Item
    @return boolean gold plated weapon or not
]]
function IsGoldPlatedWeapon( ItemID )
    return (
        ItemID == 297 or
        ItemID == 124 or
        ItemID == 84
    );
end

--[[
    Returns if the weapon with the ID is a silver plated weapon

    @param  int ID of the Item
    @return boolean silver plated weapon or not
]]
function IsSilverPlatedWeapon( ItemID )
    return (
        ItemID == 389 or
        ItemID == 229 or
        ItemID == 98
    );
end

--[[
    Returns if the weapon with the ID is a copper plated weapon

    @param  int ID of the Item
    @return boolean copper plated weapon or not
]]
function IsCopperPlatedWeapon( ItemID )
    return (
        ItemID == 398 or
        ItemID == 192 or
        ItemID == 85
    );
end

--[[
    Returns the ID of the item that is the base item of a plated weapon or 0

    @param  int ID of the Item
    @return int ID of the base item in case its a plated weapon or 0
]]
function GetPlatedBaseWeapon( ItemID )
    if ( ItemID == 444 or ItemID == 398 or ItemID == 389 or ItemID == 297 ) then
        return 190;
    elseif ( ItemID == 192 or ItemID == 229 or ItemID == 296 or ItemID == 124 ) then
        return 2629;
    elseif ( ItemID == 84 or ItemID == 85 or ItemID == 123 or ItemID == 98 ) then
        return 2701;
    end
    return 0;
end

--[[
    Returns if the weapon with the ID is a training weapon

    @param  int ID of the Item
    @return boolean training weapon or not
]]
function M.IsTrainingWeapon( ItemID )
    return ( ItemID == 445 );
end;

--- Get a area that is hit during a attack. Depending on the race the areas that
-- can be hit can alter.
-- @param Race the race of the character who receives the hit
-- @return The area that is hit
function M.GetHitArea(Race)
    local randomValue = math.random(100);
    if ( randomValue < 15 ) then
        return Character.head;
    elseif ( randomValue < 55 ) then
        return Character.breast;
    elseif ( randomValue < 68 ) then
        return Character.hands;
    elseif ( randomValue < 88 ) then
        return Character.legs;
    else
        return Character.feet;
    end;
end;

--- This function is supposed to calculate the bonus on the hit chance.
-- @param Attacker The table of the attacker values
-- @param Defender The table of the defender values
function BonusHitChance(Attacker, Defender)
    return 0;
end;

--- This function is supposed to calculate the bonus on the dodge chance.
-- @param Attacker The table of the attacker values
-- @param Defender The table of the defender values
function BonusDodgeChance(Attacker, Defender)
    return 0;
end;

return M