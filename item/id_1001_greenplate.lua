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

local texts = require("magic.arcane.base.texts")
local lookat = require("base.lookat")
local common = require("base.common")
local hints = texts.offeringHints
local plateText = texts.offeringPlate

local M = {}

local function checkPlatePosition(item)

    for _, hint in pairs(hints) do
        if hint.location == item.pos then
            return true
        end
    end

    return false
end

local function getHint(item)

    for _, hint in pairs(hints) do
        if hint.location == item.pos then
            return hint.hint.german, hint.hint.english
        end
    end

    return false
end

local function hintDialogue(user, item)
    local hintDe, hintEn = getHint(item)

    local callback = function(dialog)
    end

    local dialog = MessageDialog(common.GetNLS(user, plateText.name.german, plateText.name.english), common.GetNLS(user, hintDe, hintEn), callback)

    user:requestMessageDialog(dialog)
end

function M.UseItem(user, item)

    local offeringPlate = checkPlatePosition(item)

    if offeringPlate then
        user:inform(plateText.use.german, plateText.use.english)
        hintDialogue(user, item)
    end

end

function M.LookAtItem(user, item)

    local offeringPlate = checkPlatePosition(item)

    local lookAt = lookat.GenerateLookAt(user, item)

    if offeringPlate then
        lookAt.name = common.GetNLS(user, plateText.name.german, plateText.name.english)
        lookAt.description = common.GetNLS(user, plateText.description.german, plateText.description.english)
    end

    return lookAt

end


return M
