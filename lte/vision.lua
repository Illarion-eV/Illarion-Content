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
User:inform("queststatus"..theQuestStatus,"queststatus"..theQuestStatus)
--debug("AmountStoryName: "..User.name)
--	if User:getQuestProgress(664) == 0 then
	if User:getQuestProgress(664) == 1 then
		findAmountStory, AmountStory = Effect:findValue("AmountStory") --find variable
		findTypeStory, TypeStory = Effect:findValue("TypeStory") --find variable
		StoriesAreSet = true
	end
--[[	local AmountAreas = table.getn(triggerfield.evilrock.EvilRockAreaNames)
	if User:getQuestProgress(664) == 1 then
		for i = 1,AmountAreas do
			if content.areas.PointInArea(User.pos,triggerfield.evilrock.EvilRockAreaNames[i]) then
				AmountStory = table.getn(content.vision.VisionTextDE[i])
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
