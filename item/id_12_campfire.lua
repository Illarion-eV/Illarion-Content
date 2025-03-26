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

-- UPDATE items SET itm_script='item.id_12_campfire' where itm_id=12;

local common = require("base.common")

local roasting = require("craft.final.roasting")

local M = {}

function M.UseItem(User, SourceItem, ltstate)

    roasting.roasting:showDialog(User, SourceItem)

end

function M.CharacterOnField(User)
    if User:getType() ~= Character.player then
        return
    end

    common.InformNLS( User,
      "Du f�hlst die aufsteigende Hitze des Feuers.",
      "You feel the heat of the fire." );

    if not (User:getQuestProgress(2) > 0) and not (User:increaseAttrib("hitpoints",0) < 2000) then
        User:increaseAttrib("hitpoints",-math.random(200,400));
    end
end

return M

