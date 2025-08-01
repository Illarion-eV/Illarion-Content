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
-- Long Time Effect Script - Character Regeneration
-- by Nitram

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local crossPosition = {}

--Where are the cross NPCS?

crossPosition[0]= position(690,324,0)       -- Wilderland
crossPosition[1]= position(102,562,0)       -- Cadomyr
crossPosition[2]= position(918,775,0)       -- Runewick
crossPosition[3]= position(345,266,0)       -- Galmair

local TimeFactor = 1 -- Time between two effect calls in seconds. All effects scale with this number. Attention: If you change this number, also change it in server.standardfighting
local EffectID = 2

local getLimit
local leadToCross
local showRespawnDialog
local leaveSavely
local no_regeneration
local ChangeAttrib
local getWounds

function M.addEffect( Effect, Character)

    -- It is needed to add at least value to make sure the effect does not get deleted right after the first call
    Effect:addValue("10",0)

end

function M.callEffect( Effect, Char ) -- Effect called

if Char:idleTime() < 300 then -- Absolutely no regeneration effect if the player is afk for more than five minutes

    -----------------------READ VALUES------------------------------------
    local Hitpoints   = Char:increaseAttrib("hitpoints",0)   -- Hitpoints einlesen    ( 0 - 10000 )
    local Manapoints  = Char:increaseAttrib("mana",0)        -- Manapoints einlesen   ( 0 - 10000 )
    local Foodvalue   = Char:increaseAttrib("foodlevel",0)   -- Foodvalue einlesen    ( 0 - 60000 )
    local Poisonvalue = Char:getPoisonValue()                -- Poisonvalue einlesen  ( 0 - 10000 )

    local Const        = Char:increaseAttrib("constitution",0) -- Konstitution einlesen ( 0 - 20 )
    local Essence      = Char:increaseAttrib("essence",0)      -- Essenze einlesen      ( 0 - 20 )
    local Race         = Char:getRace()                       -- Rasse einlesen
    -----------------------VALUES DONE------------------------------------

    -----------------------PREPARE LIMITS-----------------------------
    local maxHitpoints = getLimit( Effect, "maxHP", 10000 )
    local maxManapoints = getLimit( Effect, "maxMP", 10000 )
    local maxFoodvalue = getLimit( Effect, "maxFP", 60000 )
    --------------------------LIMITS DONE-----------------------------

    --------------------------RESPAWN BEGIN-----------------------------
    if ( Hitpoints == 0 ) and not (Char:getType()==Character.monster) then -- Character is dead

        leadToCross( Char , Effect ) -- Warp char to cross

      return leaveSavely( Effect )

    else

        local foundValue = Effect:findValue( "cycleCounter" ) -- Is the cycleCounter still there? Can happen when somebody is revived by another method than the cross or runs to the cross himself

        if foundValue then
            Effect:removeValue("cycleCounter") -- Getting rid of the old counter
        end

    end

    --------------------------RESPAWN DONE-----------------------------

    if no_regeneration( Effect ) then -- Regeneration prevented by LTE variable
        return leaveSavely( Effect )
    end

    -----------------------HITPOINTS BEGIN-----------------------------------
    if ( Hitpoints < maxHitpoints and Poisonvalue == 0 ) then -- HP not at maximum and not poisoned -> Regeneration

        if ( Foodvalue >= maxFoodvalue/12 ) and Char:getType()==Character.player then -- Quick regeneration, using foodpoints

            Hitpoints = math.min( maxHitpoints, Hitpoints + 10*TimeFactor + ( 70*TimeFactor * ( 14 / 20 ) ) ) --Due to the double dipping of const giving it way too much impact, this has been changed to be what 14 const used to give before, for all.
            Foodvalue = Foodvalue - math.min(40*TimeFactor,(10000-Hitpoints) * ( 2*TimeFactor / 14 ) )

        elseif (Foodvalue ~= 0) and Char:getType()==Character.player then  -- Slow regeneration for hungry characters

            Hitpoints = math.min( maxHitpoints, Hitpoints + 10 * TimeFactor )  -- Full regeneration from 0-10000 in around 17 minutes

        end
    end

    if ((Race ~= 10) and (Race ~= 11) and (Race ~= 20) and (Race ~= 26) and (Race ~= 29)) and Char:getType()==Character.player then -- Undeads don't get hungry

        if ( Foodvalue == 0 ) then -- Out of food - starvation!

            Hitpoints = math.max(0,Hitpoints - 20 * TimeFactor) -- Death by starvation in around eight minutes

            if ( Hitpoints > 0 ) then -- Losing HP, but still alive

                if ( math.random(1,20/TimeFactor) == 2 ) then -- Send the message once each 20 seconds

                    common.TempInformNLS(Char,
                        "Dein Magen schmerzt. Du bist am verhungern.",
                        "Your stomach hurts. You are going to die of hunger.")

                end

            else -- Deathy by starvation

                common.TempInformNLS(Char,
                    "Dein Magen verkrampft sich und du merkst nur noch wie dein K�rper auf dem Boden aufschl�gt, bevor alles um dich dunkel wird.",
                    "Your stomach cramps and the last thing you feel is your body hitting the ground before everything goes dark.")

            end

        end

    end

    if ( Poisonvalue > 0 ) then -- Poisoned

        Poisonvalue = math.max( 0,Poisonvalue - 15 * TimeFactor ) -- 10000 poison takes around 11 minutes to vanish

        if ( Poisonvalue == 0 ) then -- Poison is gone

            common.TempInformNLS(Char,
                "Du f�hlst wie das Gift in deinem K�rper seine Wirkung verliert",
                "You feel the poison in your body losing its effect.")

        else

            Hitpoints = math.max( 0,Hitpoints - ( ( Poisonvalue * 0.07 ) * ( ( 30 - Const ) / 20 ) * TimeFactor ) ) --Magic numbers, might need a rework

            if ( Hitpoints > 0 ) then -- Poisoned, but still alive

                if ( math.random(1,40/TimeFactor) == 2 or not Effect:findValue("poison") ) then -- Send the message once each 40 seconds

                    common.TempInformNLS(Char,
                        "Du f�hlst wie dein K�rper von innen heraus geschw�cht wird.",
                        "You feel your body becoming weaker.")

                    Effect:addValue("poison",1)

                end

            else -- Death by poison

                Poisonvalue = 0 -- Remove the poison, mission accomplished

                common.TempInformNLS(Char,
                    "Du f�hlst ein Brennen in deinem K�rper und wie sich der Speicheln in deinem Mund zusammen zieht, ehe die Welt um dich herum dunkel wird.",
                    "You feel a burning sensation in your body and your mouth watering before everything goes dark.")

            end

        end

    elseif Effect:findValue("poison") then

        Effect:removeValue("poison")

    end
    -----------------------HITPOINTS DONE-----------------------------------

    -----------------------MANA BEGIN----------------------------------
    if ( ( ( Char:getMagicType( ) == 0 ) and ( Char:getMagicFlags( 0 ) > 0 ) ) or ( ( Char:getMagicType( ) == 0 ) and ( Char:getQuestProgress(37) ~= 0) ) ) and Char:getType()==Character.player then -- Character is a mage. Please rework this condition once we have a working magic system ~Estralis

        if Char:getQuestProgress(246) == 0 then --used in rune magic spell LTE that stops mana regen for a time period

            if ( Manapoints < maxManapoints ) then -- Mana not at maximum -> Regeneration

                if ( Foodvalue >= maxFoodvalue/12 ) then -- Quick mana regeneration with food consumption

                    Manapoints = math.min( maxManapoints, Manapoints + ( ( 5*TimeFactor + 35*TimeFactor * ( Essence / 20 ) ) ) ) -- Full regeneration from 0-10000 in around 7.4 minutes at ESS 10. That is about 1/2 of HP regeneration. 4.16 minutes for 20 ESS. 3.18 min for 27 ess.
                    Foodvalue = Foodvalue - math.min(20*TimeFactor,(10000-Manapoints) * ( 1*TimeFactor / Essence ) ) -- A filled foodbar lasts 50 minutes of regeneration

                else -- Slow mana regeneration without food consumption

                    Manapoints = math.min( maxManapoints, Manapoints + ( 2 * TimeFactor ) );  -- Full regeneration from 0-10000 in around 83 minutes

                end
            end
        end
   else

      Manapoints = 0

   end

    -----------------------MANA DONE----------------------------------

    -----------------------FOODPOINTS ANFANG----------------------------------
    if ((Race ~= 10) and (Race ~= 11) and (Race ~= 20) and (Race ~= 26) and (Race ~= 29)) and Char:getType()==Character.player then -- Undeads won't get hungry

        if (Char:isAdmin() == false) or (Char.name == "Testserver One") then

            if ( Foodvalue > 0 ) then -- Consume food

                Foodvalue = math.max( 0, (Foodvalue - 1 * TimeFactor )) -- A filled foodbar lasts 16 hours 40 minutes of idle time

                --------------- Warnings ---------------------------------
                if ( ( Foodvalue < 15000 ) and ( Foodvalue > 6000 ) ) then

                    if ( math.random(1,1800/TimeFactor) == 2 ) then

                        common.TempInformNLS(Char,
                        "Du f�hlst ein leichtes Grummeln in deinem Magen.",
                        "You feel a slight grumble in your stomach.")

                    end

                elseif ( ( Foodvalue < 6000 ) and ( Foodvalue > 3000 ) ) then

                    if ( math.random(1,900/TimeFactor) == 2 ) then

                        common.TempInformNLS(Char,
                        "Dein Magen knurrt leicht.",
                        "You hear your stomach grumbling.")

                    end

                elseif ( ( Foodvalue < 3000 ) and ( Foodvalue > 1000 ) ) then

                    if ( math.random(1,600/TimeFactor) == 2 ) then
                        common.TempInformNLS(Char,"Du scheinst Hunger zu haben, ein leises Magenknurren ist zu vernehmen.", "Your stomach grumbles slightly.")
                    end

                elseif ( ( Foodvalue < 1000 ) and ( Foodvalue > 100 ) ) then

                    if ( math.random(1,180/TimeFactor) == 2 ) then

                        common.TempInformNLS(Char,"Du scheinst Hunger zu haben, ein gut h�rbares Magenknurren ist zu vernehmen.", "Your stomach grumbles quite audibly.")

                    end

                elseif ( Foodvalue < 100 ) then

                    if ( math.random(1,10/TimeFactor) == 2 ) then

                        common.TempInformNLS(Char,"Du scheinst Hunger zu haben, ein lautes Magenknurren ist zu vernehmen.", "Your stomach grumbles loudly.")

                    end

                end
                --------------- Warnings done ---------------------------------
            end

        end

    end

    if ( Hitpoints == 0 ) then

        Foodvalue = math.max(Foodvalue,5000) -- Raising foodpoints to avoid reskill

    end
    -----------------------FOODPOINTS DONE----------------------------------

    -----------------------OVERLOAD BEGIN-----------------------------
    Hitpoints   = common.Limit( Hitpoints,   0, maxHitpoints  ) -- Lebenspunkte
    Manapoints  = common.Limit( Manapoints,  0, maxManapoints ) -- Manapunkte
    Poisonvalue = common.Limit( Poisonvalue, 0, 10000         ) -- Giftpunkte
    Foodvalue   = common.Limit( Foodvalue,   0, maxFoodvalue  ) -- Nahrungspunkte
    -----------------------OVERLOAD DONE-----------------------------

    --------------�NDERUNGEN PR�FEN UND DURCHF�HREN ANFANG--------------------
    if ( getWounds( Char, Effect ) == 0 ) then

        ChangeAttrib( Char, "hitpoints", Hitpoints )

    end

    ChangeAttrib( Char, "mana", Manapoints )

    if ( Char:getPoisonValue() ~= Poisonvalue ) then

        Char:setPoisonValue( Poisonvalue )

    end

    ChangeAttrib( Char, "foodlevel", Foodvalue )

    --------------�NDERUNGEN PR�FEN UND DURCHF�HREN FERTIG--------------------

end -- All above is only conducted for players that aren't afk for more than five minutes

    return leaveSavely( Effect )

end

function M.removeEffect( Effect, Character )

    local newEffect = LongTimeEffect(2,10*TimeFactor)
    local found, value = Effect:findValue( "no_reg" )

    if found then
        newEffect:addValue( "no_reg", value )
    end

    found, value = Effect:findValue( "maxHP" )
    if found then
        newEffect:addValue( "maxHP", value )
    end

    found, value = Effect:findValue( "maxFP" )
    if found then
        newEffect:addValue( "maxFP", value )
    end

    found, value = Effect:findValue( "maxMP" )
    if found then
        newEffect:addValue( "maxMP", value )
    end

    found, value = Effect:findValue( "poison" )
    if found then
        newEffect:addValue( "poison", value )
    end

    Character.effects:addEffect( newEffect )
end

function M.loadEffect(Effect, Character)

end

function getLimit( Effect, name, default )
    local foundValue, Value = Effect:findValue( name )
    if foundValue and Value > 0 and Value < default then
        return Value
    else
        return default
    end
end

function leadToCross( Char , Effect )

    local foundValue, cycleCounter = Effect:findValue( "cycleCounter" ) --Read the cycleCounter

    if not foundValue then
        Effect:addValue("cycleCounter",1) --Start counting
    end

    local respawnTime=10 --10 seconds until we get priests to resurrect (60 seconds is default)

    if cycleCounter>=(respawnTime/TimeFactor) then

        world:gfx(31,Char.pos) --GFX, alternatively 16
        world:makeSound(13,Char.pos) --Healing sound

        local factionValues=factions.getFaction(Char) --reading the faction values
        local relation = factions.getPlayerRelation(Char, factionValues.tid)

        if (relation == factions.RELATION_AGGRESSIVE) or (relation == factions.RELATION_HOSTILE) then --Character is banned from his home town
            Char:warp(crossPosition[0]) --warp to default cross
        else
            Char:warp(crossPosition[factionValues.tid]) --warp to home cross
        end

        Effect:removeValue("cycleCounter") --stop counting
        showRespawnDialog(Char)

    elseif cycleCounter<(respawnTime/TimeFactor) then
        Effect:addValue("cycleCounter",cycleCounter+1) --Counting
    end
end

function showRespawnDialog(rebornPlayer)

    local callback = function(nothing) end --empty callback
    local dialog
    if rebornPlayer:getPlayerLanguage() == 0 then
        dialog = MessageDialog("Wiederbelebung", "Der Eintritt in Chergas Reich der Toten wird dir verwehrt. Deine Taten auf Illarion sind noch nicht vor�ber. Die G�tter gew�hren dir eine weitere Chance auf die Ebene der Lebenden zur�ckzukehren.", callback)
    else
        dialog = MessageDialog("Respawn", "You are denied access to Cherga's Realm of the Dead. Your deeds on Illarion are not over. The gods grant you another chance to return to the Mortal Plane.", callback)
    end

    rebornPlayer:requestMessageDialog(dialog) --showing the text

end


function leaveSavely( Effect )

   if ( Effect.numberCalled <= 254 ) then
        Effect.nextCalled = 10*TimeFactor
        return true
    else
        return false
    end
end

function no_regeneration( Effect )
    local foundValue, Value = Effect:findValue( "no_reg" )
    if not foundValue then
        return false
    end
    if ( Value == 0 ) then
        Effect:removeValue( "no_reg" )
    else
        Effect:addValue( "no_reg", Value - 1 )
    end
    return true
end

function M.stallRegeneration(Char, Loops)
    local foundEffect, effect = Char.effects:find(EffectID)
    if not foundEffect then
        return
    end

    local foundValue, value = effect:findValue("no_reg")
    if foundValue and value >= Loops then
        return
    end

    effect:addValue("no_reg", Loops)
end

function ChangeAttrib( Char, name, newVal )

    if ( Char:increaseAttrib(name,0) ~= newVal ) then
        Char:increaseAttrib(name,-(Char:increaseAttrib(name,0)-newVal))
    end

end

function getWounds( Char, Effect )
    local foundEffect, bleedingEffect = Char.effects:find( 21 )
    if not foundEffect then
        return 0
    end

    local foundWounds, Wounds = bleedingEffect:findValue( "wounds" )
    if not foundWounds then
        return 0
    end

    return Wounds
end

return M
