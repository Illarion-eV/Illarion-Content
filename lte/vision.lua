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
-- Vision, id 83
-- controll the vision stories in .content.vision

local common = require("base.common")
local vision = require("content.vision")
local areas = require("content.areas")
local M = {}

local TypeStory={}
local AmountStory={}

function M.addEffect(Effect,User)

end

function M.callEffect(Effect,User)
--[[
	if StoriesAreSet ~= true then
	else
		if AmountStory == nil then
			local AmountStory = 0
			return false
		elseif User:getQuestProgress(664) <= AmountStory then
			vision.vision(User,TypeStory)
			User:setQuestProgress(664,User:getQuestProgress(664)+1)
		else
			User:setQuestProgress(664,1)
			StoriesAreSet = false
			return false
		end
	end
]]
	Effect.nextCalled = 200 --Effect gets called each 10 seconds
	return true
end

function M.removeEffect(Effect,User)

end

function M.loadEffect(Effect,User)

end

return M

