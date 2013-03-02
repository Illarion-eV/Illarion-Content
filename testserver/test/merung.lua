require("base.common")
require("base.lookat")
require("base.money")
require("content.areas")
require("triggerfield.potionToTeacher")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
	
	if User.lastSpokenText == "inform" then
	    local myItem = world:getItemOnField(position(957,95,0))
		lookAt = ItemLookAt()
		lookAt.name = "Was ist das?"
		lookAt.description = "Du bemerkst ein seltsames Glitzern im Gras vor der Eiche."
	    LookAtItem(User, myItem)
	    lookAt = nil
	end
    
end

function LookAtItem(player, item)
    if lookAt then
	    world:itemInform(User,myItem,lookAt)
	end	
end	