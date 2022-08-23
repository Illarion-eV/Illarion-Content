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

local playerInventedPotions = require("alchemy.teaching.playerInventedPotions")

local M = {}

local cauldronContents

function M.UseItem(user, SourceItem)

    if (user:getQuestProgress(539) == 1) and SourceItem:getData("ratmanCauldron") ~= "" then--OK, the player does the quest 1
        cauldronContents(user, SourceItem)
    end
    if (user:getQuestProgress(539) == 1) and SourceItem.pos == position(598, 177, -3) then -- player tries to get coins from green cauldron
        user:inform(
            "Bis auf eine Flüssigkeit, vermutlich die Reste eines Trankes, ist der Kessel leer.",
            "You find nothing in this cauldron but a liquid, most likely residuals of an unknown potion.")
    end
    if (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) == 0) and SourceItem.pos == position(594, 172, -3) then --OK, the player does the quest 2 yellow
        user:inform(
            "Irgendwie schaffst du es, eine Flasche mit dem gelben Trank von Kaefity zu klauen. Du solltest sie zu Pasinn bringen.",
            "You manage somehow to steal a bottle of the yellow potion from Kaefity. You should take it to Pasinn.")
        common.CreateItem(user, 2504, 1, 333, {descriptionEn = "Mysterious Yellow Potion", descriptionDe = "Geheimnisvoller Gelber Trank "}) -- yellow potion
        user:setQuestProgress(542, 1)
        return
    elseif (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) >= 0) and SourceItem.pos == position(594, 172, -3) then --player has a bottle
        user:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end

    if (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) == 0) and SourceItem.pos == position(596, 173, -3) then --OK, the player does the quest 2 orange
        user:inform(
            "Du siehst verdutzt zu, wie sich die Flasche in deinen Händen auflöst. Diesen Trank wirst du wohl nicht abfüllen können. Du solltest es woanders versuchen.",
            "You look on in amazement as the bottle dissolves in your hands. There will be no obtaining this potion you should try elsewhere.")
        world:gfx(52, user.pos) -- swirly
        world:makeSound(13, user.pos)
        return
    elseif (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) >= 0) and SourceItem.pos == position(596, 173, -3) then --player has a bottle
        user:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end

    if (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) == 0) and SourceItem.pos == position(598, 175, -3) then --OK, the player does the quest 2 blue
        user:inform(
            "Als der Inhalt des Kessels deine Flasche berührt, fängt der Trank an, Blasen zu werfen und explodiert. Glasscherben fliegen durch die Gegend und verletzen dich.",
            "When the contents of the cauldron hit your bottle the potion bubbles then causes an explosion. Glass shards fly causing you harm.")
        world:gfx(44, user.pos) -- explosion gfx
        world:makeSound(5, user.pos) --a loud boom
        user:increaseAttrib("hitpoints", -1000) -- player loses health
        return
    elseif (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) >= 0) and SourceItem.pos == position(598, 175, -3) then -- player has a bottle
        user:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end

    if (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) == 0) and SourceItem.pos == position(598, 177, -3) then --OK, the player does the quest 2 dark green
        user:inform(
            "Irgendwie schaffst du es, eine Flasche des dunkelgrünen Tranks von Kaefity zu stehlen. Du solltest sie zu Pasinn bringen.",
            "You manage somehow to steal a bottle of the dark green potion from Kaefity. You should take it to Pasinn.")
        common.CreateItem(user, 2506, 1, 333, {descriptionEn = "Mysterious Green Potion", descriptionDe = "Geheimnisvoller Grün Trank "}) -- yellow potion
        user:setQuestProgress(542, 3)
        return
    elseif (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) >= 0) and SourceItem.pos == position(598, 177, -3) then -- player has a bottle
            user:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end

    if (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) == 0) and SourceItem.pos == position(597, 180, -3) then --OK, the player does the quest 2 pink
        user:inform(
            "Irgendwie schaffst du es, eine Flasche des rosanen Tranks von Kaefity zu klauen. Du solltest sie zu Pasinn bringen.",
            "You manage somehow to steal a bottle of the pink potion from Kaefity. You should take it to Pasinn.")
        common.CreateItem(user, 2503, 1, 333, {descriptionEn = "Mysterious Violet Potion", descriptionDe = "Geheimnisvoller Violett Trank "}) -- yellow potion
        user:setQuestProgress(542, 2)
        return
    elseif (user:getQuestProgress(539) == 3) and (user:getQuestProgress(542) >= 0) and SourceItem.pos == position(597, 180, -3) then --player has a bottle
        user:inform(
            "Du hast bereits eine Flasche, du solltest sie Pasinn zeigen, ehe du mehr sammelst.",
            "You already have a bottle, you should show it to Pasinn before collecting more.")
        return
    end

    --Default
    user:inform(
        "Alchemisten können in diesem Kessel Tränke brauen, indem sie den Gegenstand benutzen, der in den Kessel getan werden soll. Jene, die selbst Tränke erfunden haben, können anderen hier beibringen, wie diese Tränke gebraut werden.",
        "Alchemists can brew potions in this cauldron by using the item that shall be added to the potion. Those who have invented potions of their own may also use it to teach others how to brew them.")

    if playerInventedPotions.hasPlayerInventedAnyPotions(user) then
        playerInventedPotions.dialogueToTeachPotions(user, SourceItem.pos)
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

    User:inform("Du findest einen Gifttaler.","You discover a poison coin.")
    common.CreateItem(User, 3078, 1, 333, nil)
end

return M
