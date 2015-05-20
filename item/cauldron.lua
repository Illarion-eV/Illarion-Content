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

-- UPDATE items SET itm_script='item.cauldron' WHERE itm_id IN (1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018);

local common = require("base.common")

local M = {}

local cauldronContents

function M.UseItem(User, SourceItem)

    if (User:getQuestProgress(539) == 1) and SourceItem:getData("ratmanCauldron") ~= "" then--OK, the player does the quest 1
        cauldronContents(User, SourceItem)
    end
    
    if (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) == 0) and SourceItem.pos == position(594, 172, -3) then --OK, the player does the quest 2 yellow
        User:inform(
            "Irgendwie schaffst du es, eine Flasche mit dem gelben Trank von Kaefity zu klauen. Du solltest sie zu Pasinn bringen.",
            "You manage somehow to steal a bottle of the yellow potion from Kaefity, You should take it to Pasinn.")
        User:setQuestProgress(542, 1)
        return
    elseif (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) >= 0) and SourceItem.pos == position(594, 172, -3) then --player has a bottle
            User:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end
    
    if (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) == 0) and SourceItem.pos == position(596, 173, -3) then --OK, the player does the quest 2 orange
        User:inform(
            "Du siehst verdutzt zu, wie sich die Flasche in deinen Händen auflöst. Diesen Trank wirst du wohl nicht abfüllen können. Du solltest es woanders versuchen.",
            "You look on in amazement as the bottle dissolves in your hands. There will be no obtaining this potion you should try elsewhere.")
        world:gfx(52, User.pos) -- swirly
        world:makeSound(13, User.pos)
        return
    elseif (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) >= 0) and SourceItem.pos == position(596, 173, -3) then --player has a bottle
            User:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end
    
    if (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) == 0) and SourceItem.pos == position(598, 175, -3) then --OK, the player does the quest 2 blue
        User:inform(
            "Als der Inhalt des Kessels deine Flasche berührt, fängt der Trank an, Blasen zu werfen und explodiert. Glasscherben fliegen durch die Gegend und verletzen dich.",
            "When the contents of the cauldron hit your bottle the potion bubbles then causes an explosion. Glass shards fly causing you harm.")
        world:gfx(44, User.pos) -- explosion gfx
        world:makeSound(5, User.pos) --a loud boom
        User:increaseAttrib("hitpoints", -1000) -- player loses health
        return
    elseif (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) >= 0) and SourceItem.pos == position(598, 175, -3) then -- player has a bottle
            User:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end
    
    if (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) == 0) and SourceItem.pos == position(598, 177, -3) then --OK, the player does the quest 2 dark green
        User:inform(
            "Irgendwie schaffst du es, eine Flasche des dunkelgrünen Tranks von Kaefity zu stehlen. Du solltest sie zu Pasinn bringen.",
            "You manage somehow to steal a bottle of the dark green potion from Kaefity, You should take it to Pasinn.")
        User:setQuestProgress(542, 3)
        return
    elseif (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) >= 0) and SourceItem.pos == position(598, 177, -3) then -- player has a bottle
                User:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end
    
    if (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) == 0) and SourceItem.pos == position(597, 180, -3) then --OK, the player does the quest 2 pink
        User:inform(
            "Irgendwie schaffst du es, eine Flasche des rosanen Tranks von Kaefity zu klauen. Du solltest sie zu Pasinn bringen.",
            "You manage somehow to steal a bottle of the pink potion from Kaefity, You should take it to Pasinn.")
        User:setQuestProgress(542, 1)
        return
    elseif (User:getQuestProgress(539) == 3) and (User:getQuestProgress(542) >= 0) and SourceItem.pos == position(597, 180, -3) then --player has a bottle
        User:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end
end

function cauldronContents(User, cauldronItem)

    -- skip if already tripped in the last 5 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = cauldronItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
        User:inform("Du findest dieses mal keinerlei Münzen im Kessel. Vielleicht hat der verrückte Rattenalchemist vor, später mehr zu machen.",
                "You don't find any coins in the cauldron at this time. Maybe the crazy rat alchemist will make more later.")
        return
    end
    -- safe tripping time
    cauldronItem:setData("tripping_time", serverTime)
    world:changeItem(cauldronItem)

    User:inform("Du findest eine Gifttaler.","You discover a poison coin.")
        local notCreated = User:createItem(3078, 1, 333, nil) -- silver coin
        if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
            world:createItemFromId(3078, notCreated, User.pos, true, 333, nil)
            common.HighInformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.")
        end
end

return M
