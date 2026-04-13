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

local meditation = require("lte.druid_tutorial_meditation")

local M = {}

function M.MoveToField(user)

    local foundEffect = user.effects:find(332)

    if foundEffect then
        return -- Already in progress
    end

    if (user:getQuestProgress(692) == 1 and meditation.isOnIsle(user))
    or (user:getQuestProgress(694) == 3 and meditation.isInMushroomCluster(user))
    or (user:getQuestProgress(693) == 3 and meditation.isUnderMevrannonTree(user))
    or (user:getQuestProgress(696) == 3 and meditation.onTheEldanOakStone(user))
    or (user:getQuestProgress(695) == 3 and meditation.inUsharasGarden(user))
    or (user:getQuestProgress(697) == 3 and meditation.inLibertyQuarry(user)) then

        local myEffect = LongTimeEffect(332, 600)

        user.effects:addEffect(myEffect)

    end


end

return M
