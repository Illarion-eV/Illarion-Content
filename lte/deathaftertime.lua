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
-- DeathAfterTime, id 36
-- to kill a monster (or a char) after some time
-- see base.character.DeathAfterTime(Character,deathAfter,deathGfx,deathSound)

local transformation_dog = require("alchemy.teaching.transformation_dog")
local showGFX = require("scheduled.showGFX")
local M = {}

function M.addEffect(Effect, Character)

end

function M.callEffect(Effect, Character)
  local posOfVic = Character.pos

  local findDeathGfx, deathGfx = Effect:findValue("deathGfx")
  if findDeathGfx then -- in case we defined a Gfx shown on his death
        world:gfx(deathGfx,posOfVic)
   end
   local findDeathSound, deathSound = Effect:findValue("deathSound")
   if findDeathSound then -- if we have defined a sound for the death
        world:makeSound(deathSound,posOfVic)
   end
   local findBlood = Effect:findValue("blood")
   if findBlood then
        if not world:isItemOnField(posOfVic) then
            local Blood = world:createItemFromId(3101, 1, posOfVic, true, 333, nil)
            Blood.wear = 2
            world:changeItem(Blood)
        end
        for x=-1,1 do
            for y=-1,1 do
                local bloodPos=position( posOfVic.x+x, posOfVic.y+y, posOfVic.z )
                if not world:isItemOnField(bloodPos) then
                    local Blood = world:createItemFromId(3101, 1, bloodPos, true, 333, nil)
                    Blood.wear = 2
                    world:changeItem(Blood)
                end
            end
        end
    end

    -- Dog Transformation Quest check
    local find, value = Effect:findValue("transfomationDog")
    if find and value then
        transformation_dog.dropDonfblade(Character)
    end
    -- Dog Transformation Quest check end

   Character:increaseAttrib("hitpoints",-10000) -- die!
   return false
-- callEffect is only needed once, no return true necessary
end

function M.removeEffect(Effect,User)

end

function M.loadEffect(Effect,User)

end

return M
