require("base.common")
require("base.lookat")
require("content.areas")
require("triggerfield.potionToTeacher")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
    if (User.lastSpokenText == "glas") then
        User:increaseSkill(Character.glassBlowing,100)
    end
	if (User.lastSpokenText == "farming") then
        User:increaseSkill(Character.farming,100)
    end
	if (User.lastSpokenText == "carpentry") then
        User:increaseSkill(Character.carpentry,100)
    end
	if (User.lastSpokenText == "attribute") then
        User:increaseAttrib("essence",10)
		User:increaseAttrib("perception",10)
		User:increaseAttrib("intelligence",10)
    end
	local a,b,lockId = string.find(User.lastSpokenText,"lockId (%d+)")
    if a ~= nil then
	    local myItem=base.common.GetFrontItem(User)
		myItem:setData("lockId",lockId)
		world:changeItem(myItem)
	end
    local a,b,monsterId = string.find(User.lastSpokenText,"monster (%d+)")
    if a ~= nil then
	    local monsterId = tonumber(monsterId)
		local posi = base.common.GetFrontPosition(User, 5)
		world:createMonster(monsterId, posi, 10)
	end
	if (User.lastSpokenText == "kill") then
        myTargets = world:getMonstersInRangeOf(User.pos,8)
		for i=1,#myTargets do
		    myTargets[i]:increaseAttrib("hitpoints",-15000)
        end			
    end
    
    if (User.lastSpokenText == "area") then
        local checkArea = content.areas.PointInArea(User.pos, "cadomyr flat 1")
		if checkArea then
		    User:inform("im gebiet")
		else
          	User:inform("nicht im gebiet")
        end			
	end
	
	local a,b,recipe = string.find(User.lastSpokenText,"monster (%d+)")
    if a ~= nil then
	    local recipe = tonumber(recipe)
		triggerfield.potionToTeacher.TellRecipe(User, recipe)
	end
	
end
