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

-- INSERT INTO triggerfields VALUES (697, 616, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (700, 613, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (702, 615, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (699, 617, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (695, 655, -6,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (696, 655, -6,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (699, 659, -6,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (699, 660, -6,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (739, 640, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (725, 616, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (725, 638, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (728, 627, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (709, 649, -6,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (731, 616, -3,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (850, 666, 1,'triggerfield.dragon_cave_triggers');
-- INSERT INTO triggerfields VALUES (850, 665, 1,'triggerfield.dragon_cave_triggers');

--Triggerfield events in the Volcano and Dragon Cave

local common = require("base.common")

local M = {}

local firetrigger = {}
firetrigger[1] = position(697, 616, -3) -- Level -3
firetrigger[2] = position(700, 613, -3)
firetrigger[3] = position(702, 615, -3)
firetrigger[4] = position(699, 617, -3)
firetrigger[5] = position(695, 655, -6) -- Level -6
firetrigger[6] = position(696, 655, -6)
firetrigger[7] = position(699, 659, -6)
firetrigger[8] = position(699, 660, -6)


function M.MoveToField(User)
    if User:getType() ~= Character.player then
        return
    end

    local theFiretrigger = 0
    for i = 1, #firetrigger do
        if User.pos == firetrigger[i] then
            theFiretrigger = i
            break
        end
    end

    if Random.uniform(1, 3) == 1 and theFiretrigger >= 1 and theFiretrigger <=  4 then  -- trigger fire
        common.InformNLS(User,
            "Flammen schie�en neben dir in die H�he. Die Hitze wird fast unertr�glich.",
            "Flames shoot up nearby, giving off an unexpected wall of heat.")
        world:gfx(38, position(700, 615, -3)) --a flame
        world:makeSound(5, position(700, 615, -3)) --a flame

    elseif Random.uniform(1, 3) == 1 and theFiretrigger >= 5 and theFiretrigger <= 8 then -- trigger fire
        common.InformNLS(User,
            "Ein riesiges Feuer explodiert in der N�he. Funken und Feuerb�lle prasseln hernieder.",
            "Giant flames explode nearby, shooting sparks and fireballs all over the area.")
        world:gfx(38, position(700, 654, -6)) --a flame
        world:makeSound(5, position(700, 654, -6)) --a flame
    elseif Random.uniform(1, 4) == 1 and User.pos == position(739, 640, -3) then -- vision
        common.InformNLS(User,
            "Dir erscheint die Vision eines Bergtrolls, der einen prallen kleinen Halbling �ber einem lodernden Feuer br�t.",
            "You see a vision of a mountain troll roasting what appears to be a plump little�halfling over a roaring fire.")
        world:gfx(5, position(739, 642, -3))
        world:makeSound(13, position(739, 642, -3))
    elseif Random.uniform(1, 4) == 1 and User.pos == position(725, 616, -3) then -- vision
        common.InformNLS(User,
            "Dir erscheint die Vision von zwei Drachen im Kampf miteinander, die gro�e Verw�stung an den L�ndereien ringsherum anrichten.",
            "You see a vision of two dragons in battle with each other, causing much destruction to the land around them.")
        world:gfx(5, position(723, 618, -3))
        world:makeSound(13, position(723, 618, -3))
    elseif Random.uniform(1, 4) == 1 and User.pos == position(725, 638, -3) then -- vision
        common.InformNLS(User,
            "Dir erscheint die Vision von einem Drachenbaby, das gerade die Schale durchbricht.",
            "You see�a vision of a baby dragon breaking through its shell.")
        world:gfx(5, position(728, 638, -3))
        world:makeSound(13, position(728, 638, -3))
    elseif Random.uniform(1, 4) == 1 and User.pos == position(728, 627, -3) then -- vision
        common.InformNLS(User,
            "Dir erscheint die Vision eines sehr alten Drachens, der friedlich zu einer Gruppe Menschen spricht.",
            "You see a vision of a very old dragon, speaking peacefully in common to a group of humans.")
        world:gfx(5, position(728, 631, -3))
        world:makeSound(13, position(728, 631, -3))
    elseif Random.uniform(1, 2) == 1 and User.pos == position(709, 649, -6) then -- skull trigger from feeding pen to dragon lair
        common.InformNLS(User,
            "Als Du auf den Sch�del trittst, h�rst Du ein merkw�rdiges Klicken und Du befindest Dich in der Drachenh�hle.",
            "As you step on the skull, you hear an odd click and find yourself whisked away to the dragon's lair.")
        world:gfx(41, User.pos)
        world:makeSound(11, User.pos)
        User:warp(position(703, 619, -6))
        world:gfx(41, User.pos)
        world:makeSound(11, User.pos)
    elseif User:getQuestProgress(510) == 18 and User.pos == position(731, 616, -3) then -- vision for quest
        common.InformNLS(User,
            "Dir erscheint die Vision eines Zwerges, der von einem Drachen angegriffen wird. Der Zwerg ist in Flammen eingeh�llt, ehe er von den Krallen des Drachens vom Boden gepfl�ckt wird. Gehen Sie zur�ck und sagen, Obsidimine.",
            "You see a vision of a dwarf being attacked by a dragon. The dwarf is engulfed in flames before he is plucked from the ground by the talons of the dragon. Go back and tell Obsidimine.")
        User:setQuestProgress(510, 19)
        world:gfx(5, position(728, 616, -3))
        world:makeSound(13, position(728, 616, -3))
    elseif Random.uniform(1, 4) == 1 and User.pos == position(731, 616, -3) then -- vision
        common.InformNLS(User,
            "Dir erscheint die Vision eines Zwerges, der von einem Drachen angegriffen wird. Der Zwerg ist in Flammen eingeh�llt, ehe er von den Krallen des Drachens vom Boden gepfl�ckt wird.",
            "You see a vision of a dwarf being attacked by a dragon. The dwarf is engulfed in flames before he is plucked from the ground by the talons of the dragon.")
        world:gfx(5, position(728, 616, -3))
        world:makeSound(13, position(728, 616, -3))
    elseif Random.uniform(1, 4) == 1 and User.pos == position(850, 666, 1) or User.pos == position(850, 665, 1) then -- Inform
        common.InformNLS(User,
            "Der Anblick da vorne, mit dem kleinen Becken und dem Sandh�gel, ist seltsam. Irgendwie scheinen sie miteinander verbunden, voneinander abh�ngig.",
            "The visage ahead is curious with the small pool and mound of sand. They somehow seem to be tied together, dependant.")
    end
end

return M
