require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User,SourceItem,TargetItem,counter,param)
    if (User.lastSpokenText == "glas") then
        User:increaseSkill(Character.glassBlowing,100)
    end
	if (User.lastSpokenText == "farming") then
        User:increaseSkill(Character.farming,100)
    end
	local a,b,lockId = string.find(User.lastSpokenText,"lockId (%d+)")
    if a ~= nil then
	    local myItem=base.common.GetFrontItem(User)
		myItem:setData("lockId",lockId)
		world:changeItem(myItem)
	end	
end