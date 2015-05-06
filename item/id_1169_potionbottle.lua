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
local lookat = require("base.lookat")

local M = {}

-- UPDATE items SET itm_script='item.desk' WHERE itm_id IN (1169);

function M.UseItem(User, SourceItem)

    if SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(533) == 0) and (User:getQuestProgress(534) == 0) and (User:getQuestProgress(535) == 0) and (User:getQuestProgress(536) == 0) 
        and (User:getQuestProgress(537) == 0) and (User:getQuestProgress(538) == 0) then --then player has started combining potions
        User:inform(
            "",
            "You pick up the bottle and look for another potion to combine it with.")
        User:setQuestProgress(533, 1)
    elseif SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(533) == 1) then -- player trying to combine two red potions
        User:inform(
            "",
            "Combining the potion with itself does not result in anything new. You should try another bottle.")
    elseif SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(534) == 1) then -- player adding yellow potion to the red
        world:gfx(8, User.pos) -- poison cloud gfx
        User:inform(
            "",
            "The combination of these potions makes a poisonous cloud that wafts over your face, making you feel ill. You feel your health declining.")
        User:increaseAttrib("hitpoints", -1000) -- player loses health
        User:setQuestProgress(533, 0)
    elseif SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(535) == 1) and (User:getQuestProgress(541) > 0) then -- player adding violet potion to the red but already has a heath buff
        User:inform(
            "",
            "Your body has already received an effect from this combination so nothing happens at this time. Benefit can only be received periodically.")
        User:setQuestProgress(533, 0)
    elseif SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(535) == 1) then -- player adding violet potion to the red
        world:gfx(16, User.pos) -- nice gfx
        User:inform(
            "",
            "The combination of these potions makes you feel wonderful. You feel your health increasing.")
        User:increaseAttrib("hitpoints", 1000) -- player gains health
        User:setQuestProgress(533, 0)
        User:setQuestProgress(541, 60) -- setting and lte cool down for the healing buff to prevent player abuse, buff only receivable every 5 hours
    elseif SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(536) == 1) then -- player adding green potion to the red
        world:gfx(44, User.pos) -- explosion gfx
        world:makeSound(5, User.pos) --a loud boom
        User:inform(
            "",
            "The combination of these potions causes an explosion. You feel your health declining.")
        User:increaseAttrib("hitpoints", -1000) -- player loses health
        User:setQuestProgress(533, 0)
    elseif SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(537) == 1) then -- player adding dark blue potion to the red
        world:gfx(44, User.pos) -- explosion gfx
        world:makeSound(5, User.pos) --a loud boom
        User:inform(
            "",
            "The combination of these potions causes an explosion. You feel your health declining.")
        User:increaseAttrib("hitpoints", -1000) -- player loses health
        User:setQuestProgress(533, 0)
    elseif SourceItem.pos == position(606, 176, -3) and (User:getQuestProgress(538) == 1) then -- player adding light green potion to the red
        User:inform(
            "",
            "Nothing happens at all when you combine these potions. You may have better luck with other combinations.")
        User:setQuestProgress(533, 0)
    end
end

return M
