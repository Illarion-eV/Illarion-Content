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
local maxDamage = 23
local minDamage = 17
local healthModifier = 1000

function M.initEffect(victim, duration, tickTime)
    local isBurning, effect = victim.effects:find(800)
    if isBurning then
        effect:addValue("ticks", duration)
        effect.nextCalled = tickTime
    else
        local burningEffect = LongTimeEffect(800, tickTime)
        victim.effects:addEffect(burningEffect)
        burningEffect:addValue("ticks", duration)
        victim:inform("Sengende Flammen zehren an deinem Körper.","Stiching Flames eat your flesh.")
    end
    world:gfx(9,victim.pos)
end

function M.addEffect(burningEffect, victim)
    return true
end

function M.callEffect(burningEffect, victim)
    local _, ticks = burningEffect:findValue("ticks")
    
    if (ticks > 0) then
        burningEffect:addValue("ticks",ticks-1)
        
        if (math.random(1,6) == 1) then
            world:gfx(9,victim.pos)
        else
            world:gfx(9,victim.pos)
        end
        
        local health = victim:increaseAttrib("hitpoints",0)
        local healthDamage = -(health/healthModifier)*math.random(minDamage, maxDamage)
        
        victim:increaseAttrib("hitpoints", healthDamage)
        
        victim:inform("Das Brennen schmerzt dir und schädigt dich um "..healthDamage, "The burning hurts and damages you by "..healthDamage)
        return true
    else
        victim:inform("Das Feuer erlischt und die Schmerzen gehen zurück","The fire extinguishes and your pain reduces")
        return false
    end
end

function M.loadEffect(burningEffect, victim) 
    -- loaded after char was logged out!
    return true
end

function M.removeEffect(burningEffect, victim)
    return true
end

return M