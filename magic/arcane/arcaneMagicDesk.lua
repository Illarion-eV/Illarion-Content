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
local texts = require("magic.base.texts")
local portalCrafting = require("craft.final.portals")

local M = {}

local createSpellTexts = texts.createSpellTexts


function M.mainDialog(user, sourceItem)

    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)
    local quill = false

    if common.isInList(leftTool.id, {Item.quill}) and not common.isBroken(leftTool)then
        quill = leftTool
    elseif common.isInList(rightTool.id, {Item.quill}) and not common.isBroken(rightTool) then
        quill = rightTool
    end


    if not quill then
        user:inform(createSpellTexts.quill.german, createSpellTexts.quill.english)
        return
    end

    portalCrafting.portalBookCreation(user, sourceItem)

end

return M
