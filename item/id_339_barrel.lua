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

-- UPDATE items SET itm_script='item.id_339_barrel' WHERE itm_id IN (339,1410,1411);

local common = require("base.common")
local brewing = require("craft.final.brewing")
local tutorial = require("content.tutorial")

local M = {}

function M.UseItem(User, SourceItem, ltstate)

    --Tutorial
    if User:getQuestProgress(325) == 1 and User:getQuestProgress(340) == 0 then --Accepted tutorial messages, didn't get the message before
        User:setQuestProgress(340, 1) --remember that the message was received
        local callbackNewbie = function(informNewbie)
            User:inform(tutorial.getTutorialInformDE("barrel"),tutorial.getTutorialInformEN("barrel"))
            brewing.brewing:showDialog(User, SourceItem)
        end --end callback
        local dialogText = common.GetNLS(User,tutorial.getTutorialTextDE("barrel"),tutorial.getTutorialTextEN("barrel"))
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        User:requestMessageDialog(dialogNewbie)
    else
        brewing.brewing:showDialog(User, SourceItem)
    end

end

return M
