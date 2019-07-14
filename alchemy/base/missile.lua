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
local character = require("base.character")
local scheduledFunction = require("scheduled.scheduledFunction")

local M = {}

local function fieldOfRadius1( Item )
    local posi = Item.pos
    local actionfield = { };

    for x=-1,1 do
        for y=-1,1 do
            table.insert( actionfield, position( posi.x+x, posi.y+y, posi.z ) );
        end
    end
    return actionfield;
end

local function fieldOfRadius( Item, radius )
    local posi = Item.pos
    local actionfield = { };

    if radius == nil then
        radius = 2
    end

    for x=(-1*radius),radius do
        for y=(-1*radius),radius do
            if math.abs(x) + math.abs(y) < radius*2 then
                table.insert( actionfield, position( posi.x+x, posi.y+y, posi.z ) );
            end
        end
    end
    return actionfield;
end

local function createSlime(User, Item, targetArea )
    local slime
    local lifeTime = 100*(math.floor(((Item.quality)/100))) -- 10-90 sec depending on quality + 1-20 sec by random chance, see below

    for i, posi in pairs(targetArea) do
        if not world:isCharacterOnField( posi ) then
            slime = world:createMonster(1054,posi,-20);
            if isValidChar(slime) then
                character.DeathAfterTime(slime,(lifeTime+(math.random(10,200))),11,9)
            end
        end
    end
end

local function causeDamage(User, Item, DamagedArea, DamagedAttrib, ShieldAttribs, gfxid, sfxid, modifier )
    local Person;
    local AttribEffect;
    local Schaden;
    local Stiffness;

    if modifier == nil then
        modifier = 1;
    end

    local baseDamage -- the bigger the area, the lower the base damage
    if #DamagedArea == 1 then
        baseDamage = 555
    elseif #DamagedArea == 9 then
        baseDamage = 370
    else
        baseDamage = 277
    end

    for i, posi in pairs(DamagedArea) do
        if world:isCharacterOnField( posi ) then
            Person = world:getCharacterOnField( posi );

            -- damage depends on quality and baseDamage determined by area size
            -- 277HP - 4995HP
            local qual = Item.quality;
            qual = common.Limit(math.floor(qual/100), 1, 9)

            Schaden = baseDamage * qual;

            -- Ermittle Summe der als schützend angegebene Attribute
            AttribEffect = 0;
            for k, attrib in pairs(ShieldAttribs) do
                AttribEffect = AttribEffect + Person:increaseAttrib( attrib, 0 );
            end
            -- Teile durch die Menge der angegebenen Attribute um den Mittelwert zu erhalten
            -- 0 - 20
            AttribEffect = AttribEffect / #ShieldAttribs;

            -- Schützender Einfluss der Attribute besteht sich aus dem Quadrat des Mittelwertes * 2
            -- 0 - 800
            AttribEffect = ( AttribEffect * AttribEffect * 2 );

            -- Schützender AttributeEffekt vom Schaden abziehen
            Schaden = Schaden - AttribEffect;

            -- Steifheit der Rüstung ermitteln. Je steifer die Rüstung deszo mehr wird der Schaden durch die Rüstung abgefangen
            -- 0 - 360
            Stiffness = common.GetStiffness( Person );

            -- Der dreifache Wert der Rüstungssteifheit wird vom Schaden abgezogen ( max. -1080 )
            Schaden = Schaden - Stiffness * 2;

            -- Modifier für Attribute mit mehr als 10000 Punkten
            Schaden = math.ceil(Schaden * modifier);

            -- minimal damage
            local minDamage = math.ceil(75*qual*modifier)
            if minDamage > Schaden then
                Schaden = minDamage
            end

            -- deal damage
            Person:increaseAttrib( DamagedAttrib, -Schaden );
        end
        if ( gfxid ~= 0 ) then
            world:gfx( gfxid, posi );
        end
        if ( sfxid ~= 0 ) then
            world:makeSound( sfxid, posi );
        end
    end
end

-- Zähle alle Charakter auf einem bestimmten Gebiet
local function countCharacters( targetPosis )
    local cnt = 0;
    for i, posi in pairs(targetPosis) do
        if world:isCharacterOnField( posi ) then
            cnt = cnt + 1;
        end
    end
    return cnt;
end

local function fruitBombInsectsSpawning(CENTERS, CENTER)

    if CENTERS[1] == nil then
        return
    end

    local WASPS = {}
    WASPS["id"] = {271,272,273,274}
    --'Wasp','Hornet','Wasp Queen','Wasp Drone'
    WASPS["emotes"] = {}
    WASPS["emotes"]["de"] = {"#me kommt vom süßen Geruch angelockt summend angeschworren.", "#me fliegt dem Duft folgend daher.", "#me kommt angerauscht und fliegt zu der Quelle des süßen Geruchs.","#me stürtzt mit ausgestreckten Fühlern zum Ursprung des Duftes."}
    WASPS["emotes"]["en"] = {"#me comes closer humming, drawn in by the sweet smell.","#me flies along, following the sweet scent.","#me rushes to the source of the sweet smell.","#me moves with stretched out antennas to the source of the scent."}

    local removeCounterCENTERS = 0
    for i=1,#CENTERS do

        local theCenter = CENTERS[i-removeCounterCENTERS]

        local removeCounterCENTER = 0
        for j=1,#CENTER[theCenter] do

            local quality = CENTER[theCenter][j-removeCounterCENTER][1]
            local counter = CENTER[theCenter][j-removeCounterCENTER][2]
            local targetArea = CENTER[theCenter][j-removeCounterCENTER][3]

            local removeAt = quality*2

            if counter >= 2 then

                if counter % 2 == 0 then -- even numbers

                local checkedCounter = 1
                local check = false
                while check == false do
                    local thePos = targetArea[math.random(1,#targetArea)]
                    local theField = world:getField(thePos)
                    if theField:isPassable() then
                        local wasp = world:createMonster(WASPS["id"][math.random(1,#WASPS["id"])],thePos,-20)
                        world:gfx(7, thePos)
                        if counter == 2 then
                            local players = world:getPlayersInRangeOf(thePos,9)
                            for i=1,#players do
                                players[i]:inform("Ein Summen ist zu vernehmen. Wespen werden von dem Duft angelockt!", "A buzzing can be heard and gets closer. Wasps are allured by the sweet scent.")
                            end
                        end
                        if math.random(1,2)==1 or counter == 2 then
                            local rnd = math.random(1,#WASPS["emotes"]["de"])
                            wasp:talk(Character.say,WASPS["emotes"]["de"][rnd],WASPS["emotes"]["en"][rnd])
                        end
                        check = true
                    elseif checkedCounter == #targetArea then -- we have checked the whole area, no free position; abort
                    check = true
                    end
                end
                end
            end
            CENTER[theCenter][j-removeCounterCENTER][2] = counter + 1
            if counter == removeAt then
                table.remove(CENTER[theCenter],j)
            end
        end

        if #CENTER[theCenter] == 0 then
            table.remove(CENTERS,i)
        end
    end
    scheduledFunction.registerFunction(5, function() fruitBombInsectsSpawning(CENTERS, CENTER) end)
end

local function fruitBomb(User, Item, targetArea)
    local FRUITS_FLOWERS = {15,80,81,143,148,144,147,151,199,302}
    local CENTERS = {}
    local CENTER = {}

    local posAsString = "".. Item.pos.x .." ".. Item.pos.y .." "..Item.pos.z
    if CENTER[posAsString] then
        world:gfx(1,Item.pos)
        return
    end

    local quality = math.floor(Item.quality/100)
    local tries = #targetArea/7+(2*quality)
    local theField
    local thePos
    for i=1,tries do
        local rnd = math.random(#targetArea)
        thePos = targetArea[rnd]
        theField = world:getField(thePos)
        if theField:isPassable() and thePos~=Item.pos then
            world:createItemFromId(FRUITS_FLOWERS[math.random(#FRUITS_FLOWERS)],1,thePos,true,333,nil)
        else
            table.remove(targetArea,rnd)
        end
    end
    for i=1, math.floor(tries/2) do
        world:gfx(52, targetArea[math.random(#targetArea)])
    end

    local posAsString = "".. Item.pos.x .." ".. Item.pos.y .." "..Item.pos.z
    local found = false
    for i=1,#CENTERS do
        if CENTERS[i] == posAsString then
            found = true
        end
    end

    if not found then
        table.insert(CENTERS,posAsString)
        CENTER[posAsString] = {}
    end

    quality = quality/2
    if quality % 2 ~= 0 then
        if math.floor(2)==1 then
            quality = quality + 1
        end
    end
    quality = math.floor(quality)

    table.insert(CENTER[posAsString],{quality, 0, targetArea})

    local players = world:getPlayersInRangeOf(Item.pos,9)
    for i=1,#players do
        players[i]:inform("Ein süßlicher Duft, der an Blumen und Früchte erinnert, breitet sich aus.", "A sweet scent, reminding one of flowers and fruits, starts to spread.")
    end
    scheduledFunction.registerFunction(5, function() fruitBombInsectsSpawning(CENTERS, CENTER) end)
end


---- HITPOINT WURFBOMBEN ----

-- Voller Hitpoint-Schaden auf 1er-Feld
function M.effect_1(User,Item)
    causeDamage(User, Item, { Item.pos }, "hitpoints", { "strength", "constitution" }, 12, 5 );
end

-- Voller Hitpoint-Schaden auf 9er-Feld
function M.effect_2(User,Item)
    causeDamage(User, Item, fieldOfRadius1( Item ), "hitpoints", { "strength", "constitution" }, 12, 5 );
end

-- Aufgeteilter Hitpoint-Schaden auf 9er Feld
function M.effect_3(User,Item)
    local hitArea = fieldOfRadius1( Item );
    causeDamage(User, Item, hitArea, "hitpoints", { "strength", "constitution" }, 12, 5, 1/countCharacters( hitArea ) );
end

-- Voller Hitpoint-Schaden auf 21er-Feld
function M.effect_4(User,Item)
    causeDamage(User, Item, fieldOfRadius( Item ), "hitpoints", { "strength", "constitution" }, 12, 5 );
end

-- Aufgeteilter Hitpoint-Schaden auf 21er Feld
function M.effect_5(User,Item)
    local hitArea = fieldOfRadius( Item );
    causeDamage(User, Item, hitArea, "hitpoints", { "strength", "constitution" }, 12, 5, 1/countCharacters( hitArea ) );
end


---- MANA WURFBOMBEN ----

-- Voller Mana-Schaden auf 1er-Feld
function M.effect_6(User,Item)
    causeDamage(User, Item, { Item.pos }, "mana", { "willpower", "essence" }, 4, 5 );
end

-- Voller Mana-Schaden auf 9er-Feld
function M.effect_7(User,Item)
    causeDamage(User, Item, (fieldOfRadius1( Item ) ), "mana", { "willpower", "essence" }, 4, 5 );
end

-- Aufgeteilter Mana-Schaden auf 9er Feld
function M.effect_8(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    causeDamage(User, Item, hitArea, "mana", { "willpower", "essence" }, 4, 5, 1/countCharacters( hitArea ) );
end

-- Voller Mana-Schaden auf 21er-Feld
function M.effect_9(User,Item)
    causeDamage(User, Item, (fieldOfRadius( Item ) ), "mana", { "willpower", "essence" }, 4, 5 );
end

-- Aufgeteilter Mana-Schaden auf 21er Feld
function M.effect_10(User,Item)
    local hitArea = (fieldOfRadius( Item ) );
    causeDamage(User, Item, hitArea, "mana", { "willpower", "essence" }, 4, 5, 1/countCharacters( hitArea ) );
end


---- FOODLEVEL WURFBOMBEN ----

-- Voller Sattmacher-Schaden auf 1er-Feld
function M.effect_11(User,Item)
    causeDamage(User, Item, { Item.pos }, "foodlevel", { "constitution", "agility" }, 5, 5, 6 );
end

-- Voller Sattmacher-Schaden auf 9er-Feld
function M.effect_12(User,Item)
    causeDamage(User, Item, (fieldOfRadius1( Item ) ), "foodlevel", { "constitution", "agility" }, 5, 5, 6 );
end

-- Aufgeteilter Sattmacher-Schaden auf 9er Feld
function M.effect_13(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    causeDamage(User, Item, hitArea, "foodlevel", { "constitution", "agility" }, 4, 5, 6/countCharacters( hitArea ) );
end

-- Voller Sattmacher-Schaden auf 21er-Feld
function M.effect_14(User,Item)
    causeDamage(User, Item, (fieldOfRadius( Item ) ), "foodlevel", { "constitution", "agility" }, 4, 5, 6 );
end

-- Aufgeteilter Sattmacher-Schaden auf 21er Feld
function M.effect_15(User,Item)
    local hitArea = (fieldOfRadius( Item ) );
    causeDamage(User, Item, hitArea, "foodlevel", { "constitution", "agility" }, 4, 5, 6/countCharacters( hitArea ) );
end

---- MONSTER UM DEN WEG ZU BLOCKIEREN ----

--Schleimbarriere auf 9er-Feld
function M.effect_16(User,Item)
    createSlime(User, Item, (fieldOfRadius1( Item ) ) );
end

--Schleimbarriere auf 21er-Feld
function M.effect_17(User,Item)
    createSlime(User, Item, (fieldOfRadius( Item ) ) );
end

----- OTHERS -------

--Create fruits and smell which allures insects
function M.effect_18(User,Item)
    fruitBomb(User, Item, fieldOfRadius( Item, 6 ))
end


return M
