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

-- UPDATE items SET itm_script='item.harvest' WHERE itm_id IN (14,300,386,387,1195,11,299,386,1193,1194,3612,3613,3742,3743,3892,3893);

local common = require("base.common")
local fruitgathering = require("craft.gathering.fruitgathering")
local woodchopping = require("craft.gathering.woodchopping")
local tree = require("item.tree")

local M = {}

local fruitSources = {4246, 4255, 4238, 4245, 4341, 4253, 14, 300, 387, 1195, 3613, 3743, 3867, 3892}

local function isFruitSource(sourceId)

    for _, source in pairs(fruitSources) do
        if source == sourceId then
            return true
        end
    end

    return false

end

function M.UseItem(User, SourceItem, ltstate)

    if isFruitSource(SourceItem.id) then
        fruitgathering.StartGathering(User, SourceItem, ltstate);
    elseif SourceItem.id == 386 or SourceItem.id == 3612 or SourceItem.id == 3742 or SourceItem.id == 3866 or SourceItem.id == 3893 then
        common.HighInformNLS( User,"Diese Pflanze tr�gt keine Fr�chte.","This plant bears no fruits." );
    elseif SourceItem.id == 1193 or SourceItem.id == 1194 then
        common.HighInformNLS( User,"Dieser Baum tr�gt keine Fr�chte.","This tree bears no fruits." );
    elseif SourceItem.id == 11 or SourceItem.id == 299 then
        woodchopping.StartGathering(User, SourceItem, ltstate);
    else
        common.HighInformNLS( User,"[FEHLER] Unbekannter Baum/Strauch, bitte informiere einen Entwickler.","[ERROR] Unknown bush/tree, please inform a developer." );
    end

end

M.LookAtItem = tree.LookAtItem

return M
