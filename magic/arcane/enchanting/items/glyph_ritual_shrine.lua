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

-- UPDATE items SET itm_script='item.id_3498_glyphforge' WHERE itm_id IN (3498);

local common = require("base.common")
local lookat = require("base.lookat")
local enchantingRituals = require("magic.arcane.enchanting.core.rituals")
local wands = require("item.wands")
local magic = require("base.magic")
local learnMagic = require("magic.arcane.learn")

local M = {}

function M.UseItem(user, shrine, actionstate)

    local wand = common.getItemInHand(user, magic.wandIds)
    local isMage = user:getMagicType() == 0 and (user:getQuestProgress(37) ~= 0 or user:getMagicFlags(0) > 0)

    if not wand then
        user:inform("Du musst einen Zauberstab in der Hand halten, um hier arbeiten zu k�nnen.", "You need a wand in hand to work here.")
        return
    end

    if not isMage then
        learnMagic.useMagicWand(user, wand)
        return
    end

    if actionstate == Action.none then
        wands.enchantingSelection(user, wand, actionstate)
    else
        wands.UseItem(user, wand, actionstate)
    end
end

function M.LookAtItem(user, shrine)

    local lookAt = lookat.GenerateLookAt(user, shrine)

    if shrine.wear <= 3 then
        lookAt.description = common.GetNLS(user, "Die Steine br�ckeln. Die Magie des Ortes scheint fast v�llig verschwunden.",
                                                 "The stones of the shrine are crumbling, the magic having almost disappeared.")
    elseif enchantingRituals.candleRitualExists(shrine) then
        lookAt.description = common.GetNLS(user, "Die notwendigen Rituale wurden ausgef�hrt und der Schrein kann genutzt werden.",
                                                 "The appropriate rituals have been performed and the shrine is ready for use.")
    else
        lookAt.description = common.GetNLS(user, "Das Ritual f�r die Glyphen muss noch vorbereitet werden, bevor der Schrein genutzt werden kann.",
                                                 "The glyph ritual still needs to be prepared before the shrine can be used.")
    end

    return lookAt
end

return M

