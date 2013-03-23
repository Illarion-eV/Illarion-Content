require("base.common")
require("base.lookat")
require("base.money")
require("content.areas")
require("triggerfield.potionToTeacher")
require("alchemy.base.teacher")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
	
	User:increaseAttrib("essence",30)
    
end

function LookAtItem(player, item)
    
end	