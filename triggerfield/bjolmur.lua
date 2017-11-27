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
-- INSERT INTO triggerfields VALUES (451,543,0,'triggerfield.bjolmur');
-- INSERT INTO triggerfields VALUES (451,544,1,'triggerfield.bjolmur');

local common = require("base.common")

local M = {}

local gemDE = {"Je einen latenten magischen Smaragd, Rubin, Obsidian, Saphir, Amethyst und Topas.","Je einen bedingten magischen Smaragd, Rubin, Obsidian, Saphir, Amethyst und Topas.","Je einen leichten magischen Smaragd, Rubin, Obsidian, Saphir, Amethyst und Topas."}
local gemEN = {"One latent magical emerald, ruby, obsidian, sapphire, amethyst and topaz.","One limited magical emerald, ruby, obsidian, sapphire, amethyst and topaz.","One slight magical emerald, ruby, obsidian, sapphire, amethyst and topaz."}
local gemItem = {3523,3521,3524,3522,3519,3525}

local function PlayerHasTheRightGems(char, requiredGems)
    local GemsOnBody = 0
    local AmountGemsTypes = #gemItem
    for i = 1,AmountGemsTypes do
        if char:countItemAt("all", gemItem[i], {["gemLevel"]=requiredGems}) >= 1 then
            GemsOnBody = GemsOnBody +1
        end
    end
    if GemsOnBody == 6 then
        return true
    else
        return false
    end
end

local function WrapPlayerUp(char, requiredGems)
    local AmountGemsTypes = #gemItem
    for i = 1,AmountGemsTypes do
        if char:countItemAt("all", gemItem[i], {["gemLevel"]=requiredGems}) >= 1 then
            char:eraseItem(gemItem[i],1, {["gemLevel"]=requiredGems})
        end
    end
    world:gfx(37,char.pos);
    world:makeSound(13,char.pos);
    char:warp(position(451,543,1))
    world:gfx(41,char.pos);
    world:makeSound(13,char.pos);
    char:setQuestProgress(682,0)
end

local function PayGemsToMeetHer(char)
    local names
    local namesgems
    local AmountGems = #gemDE

    local requiredGems
    if char:getQuestProgress(682) == 0 then
        requiredGems = math.random(1,3)
    else
        requiredGems = char:getQuestProgress(682)
    end
    if  char:getPlayerLanguage() == Player.german then
        names = gemDE[requiredGems]
    else
        names = gemEN[requiredGems]
    end
    local items = gemItem[math.random(1,6)]
    char:setQuestProgress(682,requiredGems)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()
            if PlayerHasTheRightGems(char,requiredGems) == true then
                char:inform("Du hörst etwas flüstern: 'Du bist würdig und sollst eintreten.'", "You hear a whisper: 'You prove yourself worthy and shall enter.'")
                WrapPlayerUp(char,requiredGems)
            else
                char:inform("Du hörst etwas flüstern: 'Willst du mich provozieren? Bringe, was ich fordere oder es wird dein Ende sein!'", "You hear a whisper: 'Do you want to provoke me? Bring what I demand or it will be your end!'")
                if (char:increaseAttrib("hitpoints",0)>5000) then
                    char:increaseAttrib("hitpoints", -5000)
                    world:makeSound(3,char.pos);
                end
            end
        end
    end

    local dialog
    if char:getPlayerLanguage() == Player.german then
        dialog = SelectionDialog("Tribut", "Zahle den Tribut, wenn du eintreten möchtest.", callback)
    else
        dialog = SelectionDialog("Tribute", "Pay the tribute if you wish to enter.", callback)
    end
    dialog:setCloseOnMove()
    dialog:addOption(items,names)
    char:requestSelectionDialog(dialog)
end

local function PlayerIsNaked(char)
    local ItemsOnBody = 0
    local itemsOnChar = {};
    local itemPosOnChar = {};
    for i=17,0,-1 do
        local item = char:getItemAt(i);
        if (item.id > 0) then
            table.insert(itemsOnChar, item);
        end
    end
    for i,item in ipairs(itemsOnChar) do
        local statsofItemsOnChar = world:getItemStatsFromId(item.id)
        local statsofItemsOnCharWeight = statsofItemsOnChar.Weight
        local numberofItemsOnChar
        if item.itempos >= 1 and item.itempos <= 12 then
            numberofItemsOnChar = char:countItemAt("body",item.id)
        else
            numberofItemsOnChar = 0
        end
        local weightofItemsOnChar = numberofItemsOnChar * statsofItemsOnCharWeight
        ItemsOnBody = ItemsOnBody + weightofItemsOnChar
    end
    if ItemsOnBody == nil or ItemsOnBody >= 1 then
        return false
    else
        return true
    end
end

function M.MoveToField(char)
    if char:getType() ~= Character.player then
        return
    end
    if char.pos == position(451, 543, 0) then
        if PlayerIsNaked(char) == true then
            PayGemsToMeetHer(char)
        elseif char.pos == position(451, 543, 0) then
            common.InformNLS(char, "Du hörst etwas flüstern: 'Du hast zu viel an.'", "You hear a whisper: 'You wear too much still.'")
        end
    end
end

return M
