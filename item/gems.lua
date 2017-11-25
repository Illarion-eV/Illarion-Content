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
local gems = require("base.gems")
local magicsmith = require("base.magicsmith")
local common = require("base.common")
local lookat = require("base.lookat")
local analysis = require("alchemy.base.analysis")
local vision = require("content.vision")

-- UPDATE items SET itm_script='item.gems' WHERE itm_id IN (45, 46, 197, 198, 283, 284, 285);

local M = {}

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)

    local data = {}
    data.gemLevel = tonumber(item:getData(gems.levelDataKey))

    lookAt = gems.lookAtFilter(user, lookAt, data)

    return lookAt
end

function M.UseItem(User, SourceItem, ltstate)
    if SourceItem:getData(gems.levelDataKey) == "" then
        analysis.AnalysisMain(User,SourceItem)
        return
    end

    local TargetItemEvilRock = common.GetItemInArea(User.pos, 2805);
    local AmountDarkColumnEvilrock = #vision.darkColumnEvilrock
    if TargetItemEvilRock ~= nil then
        for i = 1,AmountDarkColumnEvilrock do
            if TargetItemEvilRock.pos == vision.darkColumnEvilrock[i] then
                common.TurnTo(User,TargetItemEvilRock.pos); -- turn if necessary
                vision.UseDarkColumns(User,TargetItemEvilRock,ltstate)
                return
            end
        end
    end

    magicsmith.handleSocketing(User, SourceItem)
end

return M

