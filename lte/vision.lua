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

require("base.common")
require("content.vision")
module("lte.vision", package.seeall)

TypeStory={}
AmountStory={}

function addEffect(Effect,User)               				

end

function callEffect(Effect,User)
	local theQuestStatus=User:getQuestProgress(664)
--User:inform("queststatus"..theQuestStatus,"queststatus"..theQuestStatus)
--debug("AmountStoryName: "..User.name)
--	if User:getQuestProgress(664) == 0 then
	if User:getQuestProgress(664) == 1 then
		findAmountStory, AmountStory = Effect:findValue("AmountStory") --find variable
		findTypeStory, TypeStory = Effect:findValue("TypeStory") --find variable
		StoriesAreSet = true
	end
--[[	local AmountAreas = #triggerfield.evilrock.EvilRockAreaNames
	if User:getQuestProgress(664) == 1 then
		for i = 1,AmountAreas do
			if content.areas.PointInArea(User.pos,triggerfield.evilrock.EvilRockAreaNames[i]) then
				AmountStory = #content.vision.VisionTextDE[i]
				TypeStory = i
				StoriesAreSet = true
			end
		end
	end ]]--


	if StoriesAreSet ~= true then
	else
		if AmountStory == nil then
			local AmountStory = 0
			return false
		elseif User:getQuestProgress(664) <= AmountStory then
			content.vision.vision(User,TypeStory)
			User:setQuestProgress(664,User:getQuestProgress(664)+1)
		else
			User:setQuestProgress(664,1)
			StoriesAreSet = false
			return false
		end 
	end
	Effect.nextCalled = 200 --Effect gets called each 10 seconds
	return true
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
