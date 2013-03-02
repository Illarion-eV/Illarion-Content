require("base.common")
require("base.lookat")
require("base.money")
require("content.areas")
require("triggerfield.potionToTeacher")
require("alchemy.base.teacher")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
	
	if User.lastSpokenText == "inform" then
	    local myItem = world:getItemOnField(position(432,238,0))
		alchemy.base.teacher.LookAtItem(User, myItem)
	end
    
end

function LookAtItem(player, item)
    if lookAt then
	    world:itemInform(User,myItem,lookAt)
	end	
end	