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
local createSpell = require("magic.arcane.createSpell")
local portalCrafting = require("craft.final.portals")
local grimoireCreation = require("magic.arcane.grimoireCreation")

local M = {}

local function quillIsInHand(user)

    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)
    local quill = false

    if common.isInList(leftTool.id, {Item.quill}) and not common.isBroken(leftTool)then
        quill = leftTool
    elseif common.isInList(rightTool.id, {Item.quill}) and not common.isBroken(rightTool) then
        quill = rightTool
    end


    if not quill then
        user:inform("Du brauchst eine Schreibfeder um an diesem Tisch arbeiten zu können.", "You need a quill to do any work at a desk.")
        return false
    end

    return true
end

local function bookFound(user)

    for _, book in pairs(grimoireCreation.books) do
        if user:countItemAt("body",book,{["magicBook"]="true"}) ~= 0 then
            return true
        end
    end

    return false
end

function M.mainDialog(user, sourceItem)

    if not quillIsInHand(user) then
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        if index == 1 then

            if createSpell.checkForDialogOptions2(user) then

                if bookFound(user) and user:countItemAt("body",463) ~= 0 then
                    createSpell.slotSelection(user)
                else
                    user:inform("Du musst ein magisches Buch und eine Schreibfeder in deinen Händen halten.", "You must hold a magic book and quill in your hands.")
                end

            else

                user:inform("Du musst zuerst lernen wie man eine primäre Rune nutzt bevor du einen Zauberspruch erstellen kannst.", "You must first learn how to use a primary rune before you can create a spell.")

            end

        elseif index == 2 then

            portalCrafting.portalBookCreation(user, sourceItem)

        elseif index == 3 then

            grimoireCreation.enchantGrimoire(user)

        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Zauberspruch Erstellung", "Spell Creation"), common.GetNLS(user, "Wähle eine Möglichkeit.", "Pick an option."), callback)
    dialog:addOption(0, common.GetNLS(user, "Erschaffe einen Zauberspruch.", "Create a spell"))
    dialog:addOption(0, common.GetNLS(user, "Erschaffung von Portalbüchern", "Portal Book Creation"))
    dialog:addOption(0, common.GetNLS(user, "Verzaubere ein Buch in ein Grimoire", "Enchant a book into a Grimoire"))

    user:requestSelectionDialog(dialog)
end

return M
