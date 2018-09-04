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

-- This script handles the small features of the group treasure chest in the Akaltut Dungeon.
-- INSERT INTO triggerfields VALUES (669,640,-6,'triggerfield.volcano_chest);
-- INSERT INTO triggerfields VALUES (687,622,-6,'triggerfield.volcano_chest);
-- INSERT INTO triggerfields VALUES (700,645,-6,'triggerfield.volcano_chest);
-- INSERT INTO triggerfields VALUES (680,659,-6,'triggerfield.volcano_chest);


local common = require("base.common")
local lookat = require("base.lookat")
local treasureBase = require("item.base.treasure")
local globalvar = require("base.globalvar")

local triggerFields = {
position(669,640,-6),
position(687,622,-6),
position(700,645,-6),
position(680,659,-6)}

local posLever = {
position(667,624,-6),
position(692,638,-6),
position(665,658,-6)}

local moveBackRelations = {
--triggerFieldID, Lever1ID, Lever2ID
{1,3},
{1,2},
{1,2},
{2,3}}

local TRESURE_CHEST_ID = 2830
local LEVER_OK_ID = 434
local LEVER_WRONG_ID = 435
local DEATH_DRAGON_ID = 1123

local M = {}

M.positionChest = position(703, 616, -6)


local function switchLeverToZero(leverItem)
    leverItem.id = LEVER_WRONG_ID
    world:changeItem(leverItem)
end

function M.MoveToField(user)
    if common.isInList(user.pos, triggerFields) then
        local itemAtPosition
        local totalMovedLever = 0
        for i=1,#triggerFields do
            if user.pos == triggerFields[i] then
                for j=1,2 do
                    itemAtPosition = world:getItemOnField(posLever[moveBackRelations[i][j]])
                    if itemAtPosition.id == LEVER_OK_ID then
                        totalMovedLever = totalMovedLever +1
                        switchLeverToZero(itemAtPosition)
                    end
                end
            end
        end
        if totalMovedLever > 0 then
            common.InformNLS(user,
                "Irgendwo klackt etwas so als ob sich etwas löst.",
                "With a loud click a lever switches into another position.")
        end
    end
end

function M.openChest(user, sourceItem, level)
    local posi=sourceItem.pos

    -- dragon around, bad idea!
    local monsters =  world:getMonstersInRangeOf(M.positionChest, 50)
    for _, monster in ipairs(monsters) do
        if monster:getMonsterType() == DEATH_DRAGON_ID then
            monster:forceWarp(posi)
            common.InformNLS(user,
                "Es war wohl keine gute Idee den Schatz zu stehlen während der Drache noch anwesend ist.",
                "Stealing a dragon trasure while the owner is around was not your brigtest idea today.")
            monster:talk(Character.yell,"Roaaarrrrr!")
            return
        end
    end

    for i=1, #posLever do
        local itemAtPosition = world:getItemOnField(posLever[i])
        if itemAtPosition.id ~= LEVER_OK_ID then -- at lest one lever in wrong position
            common.InformNLS(user,
                "Irgendeine Mechanik verhindert, dass du die Schatzkiste öffnen kannst. Kann es sein, dass diese Hebel damit zu tun haben?",
                "Some mechanics prevent you from opening the treasure chest. Could it be that these levers are connected to the chest anyhow?")
            return
        end
        switchLeverToZero(itemAtPosition)
    end
    -- all buttons occupied, open chest
    world:erase(sourceItem, sourceItem.number)
    if (level ~= nil) and (level~=0) and (level < 10) then
        world:gfx(globalvar.gfxRAIN,posi)
        world:makeSound(globalvar.sfxSNARING,posi)
        treasureBase.dropTreasureItems(posi, level)
    end
end

function M.useLever(user, leverItem)
    if leverItem.id == LEVER_OK_ID then
        leverItem.id = LEVER_WRONG_ID
        world:changeItem(leverItem)
        common.InformNLS(user,
            "Es scheint als ob der Hebel jetzt ohne Eingriff ist.",
            "The lever seems to be in an idle position now.")
    elseif leverItem.id == LEVER_WRONG_ID then
        leverItem.id = LEVER_OK_ID
        world:changeItem(leverItem)
        common.InformNLS(user,
            "Du spürst wie eine Mechanik ausgelöst wird.",
            "It feels as if the mechanics connected to the lever is engaged.")
    end
end

return M
