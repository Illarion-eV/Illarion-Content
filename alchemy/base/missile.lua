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
-- ds_base_missile.lua
-- Druidensystem
-- Effekte für Wurfkörper
-- Falk & Nitram

-- Liste der IDs mit Objekten aus Holz
-- WICHTIG: Liste MUSS aufsteigend geordnet sein

-- few changes by Merung:
-- took checkHit out; replaced rabbits with slime; took out damage on item quality or duration


local common = require("base.common")
local alchemy = require("scheduled.alchemy")

module("alchemy.base.missile", package.seeall);

ListeObjHolz = {39,40,56,57,76,207,208,209,293,323,2782,2783,2784,2785,2786};

function fieldOfRadius1( Item )
    local posi = Item.pos
	local actionfield = { };

    for x=-1,1 do
        for y=-1,1 do
            table.insert( actionfield, position( posi.x+x, posi.y+y, posi.z ) );
        end
    end
	return actionfield;
end

function fieldOfRadius( Item, radius )
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

function createSlime(User, Item, targetArea )
    local slime
    local lifeTime = 100*(math.floor(((Item.quality)/100))) -- 10-90 sec depending on quality + 1-20 sec by random chance, see below

    for i, posi in pairs(targetArea) do
        if not world:isCharacterOnField( posi ) then
            slime = world:createMonster(1054,posi,-20);
            if isValidChar(slime) then
				base.character.DeathAfterTime(slime,(lifeTime+(math.random(10,200))),11,9)
		    end
        end
    end

    -- Sollte sich die Verwendung von Gift bei diesem Effekt als nicht verwertbar herausstellen kann auch ein LTE auf die einzelnen Hasen gelegt werden.
end

function causeDamage(User, Item, DamagedArea, DamagedAttrib, ShieldAttribs, gfxid, sfxid, modifier )
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

function damageItemDura( Item, targetArea, gfxid, sfxid, modifier, ItemType )
    local Person;
    local slotItem;
    local found;
    local thisArmor;
    local thisWeapon;
    local ItemQual;
    local ItemDura;
    local minReduce;
    local maxReduce;

    local qual = Item.quality;
    if (qual > 999) then
        qual = math.fmod( qual, 1000 );
    end

    for i, posi in pairs(targetArea) do
        if world:isCharacterOnField( posi ) then
            Person = world:getCharacterOnField( posi );

            for slotCount = 1,11 do
                found = false;
                slotItem  = Person:getItemAt( slotCount );
                if ItemType == "armor" then
                    found, thisArmor = world:getArmorStruct( slotItem.id );
                elseif ItemType == "weapon" then
                    found, thisWeapon = world:getWeaponStruct( slotItem.id );
                elseif ItemType == "wood" then
                    found = checkWoody( slotItem.id, 0, #ListeObjHolz );
                else
                    found = true;
                end

                if found then
                    ItemQual = math.floor( slotItem.quality / 100 );
                    ItemDura = slotItem.quality - ItemQual * 100;

                    minReduce = common.Scale(  30, -1, ItemQual * 11 );
                    maxReduce = common.Scale( 100, 50, ItemQual * 11 );

                    ItemDura = common.Limit( ItemDura - math.floor( common.Scale( minReduce, maxReduce, (qual-100)/8.99 ) )*modifier, 1, ItemDura );

                    slotItem.quality = ItemQual*100 + ItemDura;
                    world:changeItem( slotItem );
                end
            end
        end
        if ( gfxid ~= 0 ) then
            world:gfx( gfxid, posi );
        end
        if ( sfxid ~= 0 ) then
            world:makeSound( sfxid, posi );
        end
    end
end

function damageItemQual( Item, targetArea, gfxid, sfxid, modifier, ItemType )
    local Person;
    local slotItem;
    local found;
    local thisArmor;
    local thisWeapon;
    local ItemQual;
    local ItemDura;

    local qual = Item.quality;
    if (qual > 999) then
        qual = math.fmod( qual, 1000 );
    end

    for i, posi in pairs(targetArea) do
        if world:isCharacterOnField( posi ) then
            Person = world:getCharacterOnField( posi );

            for slotCount = 1,11 do
                found = false;
                slotItem  = Person:getItemAt( slotCount );
                if ItemType == "armor" then
                    found, thisArmor = world:getArmorStruct( slotItem.id );
                elseif ItemType == "weapon" then
                    found, thisWeapon = world:getWeaponStruct( slotItem.id );
                elseif ItemType == "wood" then
                    found = checkWoody( slotItem.id, 0, #ListeObjHolz );
                else
                    found = true;
                end

                if found then
                    ItemQual = math.floor( slotItem.quality / 100 );
                    ItemDura = slotItem.quality - ItemQual * 100;

                    ItemQual = common.Limit( ItemDura - math.floor( common.Scale( 1, 9, (qual-100)/8.99 ) )*modifier, 1, 9 );

                    slotItem.quality = ItemQual*100 + ItemDura;
                    world:changeItem( slotItem );
                end
            end
        end
        if ( gfxid ~= 0 ) then
            world:gfx( gfxid, posi );
        end
        if ( sfxid ~= 0 ) then
            world:makeSound( sfxid, posi );
        end
    end
end

function checkWoody( id, lower, upper )
    if lower > upper then
        return false;
    end;
    local margin = math.floor((lower+upper)/2);
    if ListeObjHolz[margin] == id then
        return true;
    elseif ListeObjHolz[margin] < id then
        return checkWoody( id, margin+1, upper );
    else
        return checkWoody( id, lower, margin-1 );
    end
end

-- the function checkHit leads to a strange looking result: it can happen that the center of the explosion is not the position of the bottle
-- it looks strange and would confuse players
-- if it is wanted (I don't like the idea in general, though), MoveItemBeforeMove in id_327_blue_bottle can be used to get the same result (that the the bottle does not hit the exact field the player aimed at)
-- therefore, I don't use it
-- Merung
function checkHit( User, Item )
    local wetter     = world.weather.fog_density + world.weather.thunderstorm; -- 0 - 200
    local dexterity  = User:increaseAttrib( "dexterity", 0 ); -- 3 - 20
    local perception = User:increaseAttrib( "perception", 0 ); -- 3 - 20
    local Skill      = User:getSkill(Character.distanceWeapons); -- 0 - 100
    local distance   = User:distanceMetricToPosition( Item.pos ); -- 1 - 10

    local factor = Skill + dexterity * 2 + perception * 3; -- 15 - 300
    factor = factor - wetter; -- -185 - 300
    factor = factor - distance * distance; -- -285 - 299
    factor = ( factor + 100 ) / 2; -- -92,5 - 199,5

    factor = common.Limit( factor, 0, 100 );

    maxPosiModify = common.Scale( 5, 0, factor );

    if maxPosiModify == 0 then
        return Item.pos;
    end

    local phi = math.random()*2*math.pi;

    local modX = maxPosiModify * math.sin( phi );
    local modY = maxPosiModify * math.cos( phi );

    return position( Item.pos.x + math.floor( modX ), Item.pos.y + math.floor( modY ), Item.pos.z );
end

-- Zähle alle Charakter auf einem bestimmten Gebiet
function countCharacters( targetPosis )
    local cnt = 0;
    for i, posi in pairs(targetPosis) do
        if world:isCharacterOnField( posi ) then
            cnt = cnt + 1;
        end
    end
    return cnt;
end

FRUITS_FLOWERS = {15,80,81,143,148,144,147,151,199,302}

function fruitBomb(User, Item, targetArea)
	local sa = scheduled.alchemy
	local posAsString = "".. Item.pos.x .." ".. Item.pos.y .." "..Item.pos.z
	if sa.CENTER[posAsString] then
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

	local sa = scheduled.alchemy
	local posAsString = "".. Item.pos.x .." ".. Item.pos.y .." "..Item.pos.z
	local found = false
	for i=1,#sa.CENTERS do
		if sa.CENTERS[i] == posAsString then
			found = true
		end
	end

	if not found then
		table.insert(sa.CENTERS,posAsString)
		sa.CENTER[posAsString] = {}
	end

	quality = quality/2
	if quality % 2 ~= 0 then
		if math.floor(2)==1 then
			quality = quality + 1
		end
	end
	quality = math.floor(quality)

	table.insert(sa.CENTER[posAsString],{quality, 0, targetArea})

	local players = world:getPlayersInRangeOf(Item.pos,9)
	for i=1,#players do
		players[i]:inform("Ein süßlicher Duft, der an Blumen und Früchte erinnert, breitet sich aus.", "A sweet scent, reminding one of flowers and fruits, starts to spread.")
	end

end


---- HITPOINT WURFBOMBEN ----

-- Voller Hitpoint-Schaden auf 1er-Feld
function effect_1(User,Item)
    causeDamage(User, Item, { Item.pos }, "hitpoints", { "strength", "constitution" }, 12, 5 );
end

-- Voller Hitpoint-Schaden auf 9er-Feld
function effect_2(User,Item)
    causeDamage(User, Item, fieldOfRadius1( Item ), "hitpoints", { "strength", "constitution" }, 12, 5 );
end

-- Aufgeteilter Hitpoint-Schaden auf 9er Feld
function effect_3(User,Item)
    local hitArea = fieldOfRadius1( Item );
    causeDamage(User, Item, hitArea, "hitpoints", { "strength", "constitution" }, 12, 5, 1/countCharacters( hitArea ) );
end

-- Voller Hitpoint-Schaden auf 21er-Feld
function effect_4(User,Item)
    causeDamage(User, Item, fieldOfRadius( Item ), "hitpoints", { "strength", "constitution" }, 12, 5 );
end

-- Aufgeteilter Hitpoint-Schaden auf 21er Feld
function effect_5(User,Item)
    local hitArea = fieldOfRadius( Item );
    causeDamage(User, Item, hitArea, "hitpoints", { "strength", "constitution" }, 12, 5, 1/countCharacters( hitArea ) );
end


---- MANA WURFBOMBEN ----

-- Voller Mana-Schaden auf 1er-Feld
function effect_6(User,Item)
    causeDamage(User, Item, { Item.pos }, "mana", { "willpower", "essence" }, 4, 5 );
end

-- Voller Mana-Schaden auf 9er-Feld
function effect_7(User,Item)
    causeDamage(User, Item, (fieldOfRadius1( Item ) ), "mana", { "willpower", "essence" }, 4, 5 );
end

-- Aufgeteilter Mana-Schaden auf 9er Feld
function effect_8(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    causeDamage(User, Item, hitArea, "mana", { "willpower", "essence" }, 4, 5, 1/countCharacters( hitArea ) );
end

-- Voller Mana-Schaden auf 21er-Feld
function effect_9(User,Item)
    causeDamage(User, Item, (fieldOfRadius( Item ) ), "mana", { "willpower", "essence" }, 4, 5 );
end

-- Aufgeteilter Mana-Schaden auf 21er Feld
function effect_10(User,Item)
    local hitArea = (fieldOfRadius( Item ) );
    causeDamage(User, Item, hitArea, "mana", { "willpower", "essence" }, 4, 5, 1/countCharacters( hitArea ) );
end


---- FOODLEVEL WURFBOMBEN ----

-- Voller Sattmacher-Schaden auf 1er-Feld
function effect_11(User,Item)
    causeDamage(User, Item, { Item.pos }, "foodlevel", { "constitution", "agility" }, 5, 5, 6 );
end

-- Voller Sattmacher-Schaden auf 9er-Feld
function effect_12(User,Item)
    causeDamage(User, Item, (fieldOfRadius1( Item ) ), "foodlevel", { "constitution", "agility" }, 5, 5, 6 );
end

-- Aufgeteilter Sattmacher-Schaden auf 9er Feld
function effect_13(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    causeDamage(User, Item, hitArea, "foodlevel", { "constitution", "agility" }, 4, 5, 6/countCharacters( hitArea ) );
end

-- Voller Sattmacher-Schaden auf 21er-Feld
function effect_14(User,Item)
    causeDamage(User, Item, (fieldOfRadius( Item ) ), "foodlevel", { "constitution", "agility" }, 4, 5, 6 );
end

-- Aufgeteilter Sattmacher-Schaden auf 21er Feld
function effect_15(User,Item)
    local hitArea = (fieldOfRadius( Item ) );
    causeDamage(User, Item, hitArea, "foodlevel", { "constitution", "agility" }, 4, 5, 6/countCharacters( hitArea ) );
end

---- MONSTER UM DEN WEG ZU BLOCKIEREN ----

--Schleimbarriere auf 9er-Feld
function effect_16(User,Item)
    createSlime(User, Item, (fieldOfRadius1( Item ) ) );
end

--Schleimbarriere auf 21er-Feld
function effect_17(User,Item)
    createSlime(User, Item, (fieldOfRadius( Item ) ) );
end

----- OTHERS -------

--Create fruits and smell which allures insects
function effect_18(User,Item)
    fruitBomb(User, Item, fieldOfRadius( Item, 6 ))
end


-- the folling effect are NOT in use ancymore. They are no good fir fighting, just for annoying players.
-- Therefore, we decided to take them out
--[[
---- SCHADEN AUF RüSTUNGEN - HALTBARKEIT ----

-- Voller Haltbarkeits-Schaden auf Rüstungen auf 1er Feld
function effect_55938556(User,Item)
    damageItemDura( Item, { selectCharacter( fieldOfRadius1( Item ) ) }, 4, 5, 1, "armor" );
end

--Voller Haltbarkeits-Schaden auf Rüstungen auf 9er Feld
function effect_43245354(User,Item)
    damageItemDura( Item, (fieldOfRadius1( Item ) ), 4, 5, 1, "armor" );
end

--Aufgeteilter Haltbarkeits-Schaden auf Rüstungen auf 9er Feld
function effect_95257533(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    damageItemDura( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "armor" );
end

--Voller Haltbarkeits-Schaden auf Rüstungen auf 21er Feld
function effect_59159412(User,Item)
    damageItemDura( Item, (fieldOfRadius1( Item ) ), 4, 5, 1, "armor" );
end

--Aufgeteilter Haltbarkeits-Schaden auf Rüstungen auf 21er Feld
function effect_36557188(User,Item)
    local hitArea = (fieldOfRadius( Item ) );
    damageItemDura( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "armor" );
end

---- SCHADEN AUF RüSTUNGEN - Qualität ----

--Voller Qualitäts-Schaden auf Rüstungen auf 1er Feld
function effect_98538617(User,Item)
    damageItemQual( Item, { selectCharacter( fieldOfRadius1( Item ) ) }, 4, 5, 1, "armor" );
end

--Voller Qualitäts-Schaden auf Rüstungen auf 9er Feld
function effect_79684787(User,Item)
    damageItemQual( Item, (fieldOfRadius1( Item ) ), 4, 5, 1, "armor" );
end

--Aufgeteilter Qualitäts-Schaden auf Rüstungen auf 9er Feld
function effect_32484266(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    damageItemQual( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "armor" );
end

--Voller Qualitäts-Schaden auf Rüstungen auf 21er Feld
function effect_96261935(User,Item)
    damageItemQual( Item, (fieldOfRadius1( Item ) ), 4, 5, 1, "armor" );
end

--Aufgeteilter Qualitäts-Schaden auf Rüstungen auf 21er Feld
function effect_26372612(User,Item)
    local hitArea = (fieldOfRadius( Item ) );
    damageItemQual( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "armor" );
end


---- SCHADEN AUF WAFFEN - HALTBARKEIT ----

--Voller Haltbarkeits-Schaden auf Waffen auf 1er Feld
function effect_56548394(User,Item)
    damageItemDura( Item, { selectCharacter( fieldOfRadius1( Item ) ) }, 4, 5, 1, "weapon" );
end

--Voller Haltbarkeits-Schaden auf Waffen auf 9er Feld
function effect_81876627(User,Item)
    damageItemDura( Item,( fieldOfRadius1( Item ) ), 4, 5, 1, "weapon" );
end

--Aufgeteilter Haltbarkeits-Schaden auf Waffen auf 9er Feld
function effect_86656358(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    damageItemDura( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "weapon" );
end

--Voller Haltbarkeits-Schaden auf Waffen auf 21er Feld
function effect_77254231(User,Item)
    damageItemDura( Item, (fieldOfRadius1( Item ) ), 4, 5, 1, "weapon" );
end

--Aufgeteilter Haltbarkeits-Schaden auf Waffen auf 21er Feld
function effect_32185872(User,Item)
    local hitArea = (fieldOfRadius( Item ) );
    damageItemDura( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "weapon" );
end

---- SCHADEN AUF WAFFEN - Qualität ----

--Voller Qualitäts-Schaden auf Waffen auf 1er Feld
function effect_91357421(User,Item)
    damageItemQual( Item, { selectCharacter( fieldOfRadius1( Item ) ) }, 4, 5, 1, "weapon" );
end

--Voller Qualitäts-Schaden auf Waffen auf 9er Feld
function effect_52761593(User,Item)
    damageItemQual( Item, (fieldOfRadius1( Item ) ), 4, 5, 1, "weapon" );
end

--Aufgeteilter Qualitäts-Schaden auf Waffen auf 9er Feld
function effect_19123643(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    damageItemQual( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "weapon" );
end

--Voller Qualitäts-Schaden auf Waffen auf 21er Feld
function effect_35471525(User,Item)
    damageItemQual( Item, (fieldOfRadius1( Item ) ), 4, 5, 1, "weapon" );
end

--Aufgeteilter Qualitäts-Schaden auf Waffen auf 21er Feld
function effect_32812622(User,Item)
    local hitArea = ( fieldOfRadius( Item ) );
    damageItemQual( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "weapon" );
end

---- SCHADEN AUF HOLZITEMS - HALTBARKEIT ----

--Voller Haltbarkeits-Schaden auf Holzitems auf 1er Feld
function effect_12836431(User,Item)
    damageItemDura( Item, { selectCharacter( fieldOfRadius1( Item ) ) }, 4, 5, 1, "wood" );
end

--Voller Haltbarkeits-Schaden auf Holzitems auf 9er Feld
function effect_43185342(User,Item)
    damageItemDura( Item, ( fieldOfRadius1( Item ) ), 4, 5, 1, "wood" );
end

--Aufgeteilter Haltbarkeits-Schaden auf Holzitems auf 9er Feld
function effect_57771997(User,Item)
    local hitArea = (fieldOfRadius1( Item ) );
    damageItemDura( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "wood" );
end

--Voller Haltbarkeits-Schaden auf Holzitems auf 21er Feld
function effect_13245638(User,Item)
    damageItemDura( Item, ( fieldOfRadius1( Item ) ), 4, 5, 1, "wood" );
end

--Aufgeteilter Haltbarkeits-Schaden auf Holzitems auf 21er Feld
function effect_88343542(User,Item)
    local hitArea =  ( fieldOfRadius( Item ) );
    damageItemDura( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "wood" );
end

---- SCHADEN AUF HOLZITEMS - Qualität ----

--Voller Qualitäts-Schaden auf Holzitems auf 1er Feld
function effect_67589591(User,Item)
    damageItemQual( Item, { selectCharacter( fieldOfRadius1( Item ) ) }, 4, 5, 1, "wood" );
end

--Voller Qualitäts-Schaden auf Holzitems auf 9er Feld
function effect_96566994(User,Item)
    damageItemQual( Item, ( fieldOfRadius1( Item ) ), 4, 5, 1, "wood" );
end

--Aufgeteilter Qualitäts-Schaden auf Holzitems auf 9er Feld
function effect_13983419(User,Item)
    local hitArea =  ( fieldOfRadius1( Item ) );
    damageItemQual( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "wood" );
end

--Voller Qualitäts-Schaden auf Holzitems auf 21er Feld
function effect_42218944(User,Item)
    damageItemQual( Item, ( fieldOfRadius1( Item ) ), 4, 5, 1, "wood" );
end

--Aufgeteilter Qualitäts-Schaden auf Holzitems auf 21er Feld
function effect_69657293(User,Item)
    local hitArea = ( fieldOfRadius( Item ) );
    damageItemQual( Item, hitArea, 4, 5, 1/countCharacters( hitArea ), "wood" );
end]]


--[[
function effect_58731981(User,Item) --globale Wetterveränderung
    return true; -- Script nicht fertig, funktion sofort abbrechen

    m_Weather = world.weather;
    m_Weather.cloud_density=newClouds;
    m_Weather.fog_density=newFog;
    m_Weather.wind_dir=newWindDir;
    m_Weather.gust_strength=newGust
    m_Weather.percipitation_strength=newRain;
    m_Weather.percipitation_type=newPerTyp;
    m_Weather.thunderstorm=newThunder;
    m_Weather.temperature=newTemp;
    logWeather(m_Weather);
    world:setWeather(m_Weather);
end



function effect_59595521(User,Item) --Matschbarriere auf 9er-Feld
    actionfield = fieldOfNine(Item)
    for i = 1,9 do
        --Bodentiles ändern
        local field = world:getField(actionfield[i])
        local tileID= field.tile
        if tileID == 11 then --Wiese     !!!! id prüfen
            world:changeTile(4,actionfield[i])  --Kontrolle: screen update?
            world:sendMapUpdate(actionfield[i],5)
            -- Dieser Effekt sollte nun umgebaut werden zu einem LTE 327 (Zeit vergeht, Effekt aufheben.)
        end
    end
end





function effect_42718255(User,Item) --Einen Effekt vortäuschen

end

function effect_25269755(User,Item)

end

--@ nitram: ich bin beeindruckt

--dura auf Waffen 9er Feld
--dura auf Holz 9er Feld
--dura auf Metall 9er Feld
--das Ganze jeweils für 1er Feld
--das Ganze jeweils für Quality

-- Die Effekt-Nummer kann willkürlich achtstellig sein (ohne Ziffer 0), die Anpassung erfolgt dann in ds_327_blaue_Flasache.lua
-- Datawerte aus Zufallsgenerator
--
--
--

--Zum Vortäuschen eines Effektes: Hier soll ein Dummy des Casters erscheinen, also ein Monster gleicher Rasse, das sich nach einer weile wieder selbst zerstört. Sinn soll sein, einen Gegner zu verwirren, wen er jetzt angreifen muss.
--Eine Steigerung wäre dann ein Dummy, der den Gegner angreift.

--Zu Wettereffekten: Jeweils ein Effekt für je eine Wetteränderung: also 1 Wurfbombe für Nebel, eine für Regen etc. Dauer gemäß Quality des Trankes (LTE)
--Man könnte auch die Intensität über quality steuern, zb aquality = 345 ==> Intensität = 3 (1-9) und Dauer = 45 (11-99)

--Zur Aufhebung der Matschbarriere folgen noch Vorschläge
]]
