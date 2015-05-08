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

-- UPDATE items SET itm_script='item.id_1168_potionbottle' WHERE itm_id IN (1168);

function M.UseItem(User, SourceItem)

    if SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(533) == 0) and (User:getQuestProgress(534) == 0) and (User:getQuestProgress(535) == 0) and (User:getQuestProgress(536) == 0) 
        and (User:getQuestProgress(537) == 0) and (User:getQuestProgress(538) == 0) then --then player has started combining potions
        User:inform(
            "Du nimmst die Flasche auf und blickst dich nach einem anderen Trank zum kombinieren um.",
            "You pick up the bottle and look for another potion to combine it with.")
        User:setQuestProgress(534, 1)
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(534) == 1) then -- player trying to combine two yellow potions
        User:inform(
            "Das Mischen des Tranks mit sich selbst bringt keine neuen Ergebnisse. Du solltest eine andere Flasche versuchen.",
            "Combining the potion with itself does not result in anything new. You should try another bottle.")
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(533) == 1) then -- player adding yellow potion to the red
        world:gfx(8, User.pos) -- poison cloud gfx
        User:inform(
            "Die Mischung dieser Tränke erzeugt eine giftige Wolke die um dein Gesicht wabert und dir ein kränkliches Gefühl gibt. Du spürst, wie deine Gesundheit sich verschlechtert.",
            "The combination of these potions makes a poisonous cloud that wafts over your face, making you feel ill. You feel your health declining.")
        User:increaseAttrib("hitpoints", -1000) -- player loses health
        User:setQuestProgress(533, 0)
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(536) == 1) and (User:getQuestProgress(541) > 0) then -- player adding yellow potion to the green but already has a heath buff
        User:inform(
            "Dein Körper hat durch diese Mischung bereits positive Auswirkungen erfahren, weshalb dieses mal nichts passiert. Erwünschenswerte Effekte können nur mit einem gewissen zeitlichen Abstand erhalten werden.",
            "Your body has already received an effect from this combination so nothing happens at this time. Benefit can only be received periodically.")
        User:setQuestProgress(536, 0)
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(536) == 1) then -- player adding yellow potion to the green
        world:gfx(16, User.pos) -- nice gfx
        User:inform(
            "Die Mischung dieser Tränke sorgt dafür, dass du dich wunderbar fühlst. Du spürst, wie deine Gesundheit sich verbessert.",
            "The combination of these potions makes you feel wonderful. You feel your health increasing.")
        User:increaseAttrib("hitpoints", 1000) -- player gains health
        User:setQuestProgress(536, 0)
        User:setQuestProgress(541, 60) -- setting and lte cool down for the healing buff to prevent player abuse, buff only receivable every 5 hours
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(535) == 1) then -- player adding yellow potion to the violet
        world:gfx(44, User.pos) -- explosion gfx
        world:makeSound(5, User.pos) --a loud boom
        User:inform(
            "Die Mischung dieser Tränke verursacht eine Explosion. Du fühlst, wie sich deine Gesundheit verschlechtert.",
            "The combination of these potions causes an explosion. You feel your health declining.")
        User:increaseAttrib("hitpoints", -1000) -- player loses health
        User:setQuestProgress(535, 0)
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(538) == 1) then -- player adding yellow potion to the light green
        world:gfx(44, User.pos) -- explosion gfx
        world:makeSound(5, User.pos) --a loud boom
        User:inform(
            "Die Mischung dieser Tränke verursacht eine Explosion. Du fühlst, wie sich deine Gesundheit verschlechtert.",
            "The combination of these potions causes an explosion. You feel your health declining.")
        User:increaseAttrib("hitpoints", -1000) -- player loses health
        User:setQuestProgress(538, 0)
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(537) == 1) and (User:getQuestProgress(540) == 1) then -- player adding yellow potion to the dark blue  and has already got the special potion
        User:inform(
            "Obwohl die mit dieser Mischung schon einmal Erfolg hattest, scheint Narguns Glück nicht länger auf deiner Seite zu sein.",
            "Although you have had previous success with this combination, the luck of Nargun is no longer with you.")
        User:setQuestProgress(537, 0)
    elseif SourceItem.pos == position(607, 177, -3) and (User:getQuestProgress(537) == 1) then -- player adding yellow potion to the dark blue
        local notCreated = User:createItem(329, 1, 222, {["potionEffectId"] = 521, descriptionEn = "Halfling female transformation potion", descriptionDe = "Wandeltrank Halblingsfrau"}) -- halfing transformation potion
                if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
                world:createItemFromId(329, notCreated, User.pos, true, 222, {["potionEffectId"] = 521, descriptionEn = "Halfling female transformation potion", descriptionDe = "Wandeltrank Halblingsfrau"})
                common.HighInformNLS(User,
                    "Du kannst nichts mehr halten.",
                    "You can't carry any more.")
                 end
        User:inform(
            "Du hast diese Tränke vermischt und es irgendwie geschafft, einen Halblingsverwandlungstrank zu erschaffen. Das wirst du wahrscheinlich nie wieder hinbekommen!",
            "You have combined these potions and somehow manage to make a halfling transformation potion. You will likely never create this again!")
        User:setQuestProgress(537, 0)
        User:setQuestProgress(540, 1)
    end
end

return M
