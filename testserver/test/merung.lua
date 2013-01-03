require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User,SourceItem,TargetItem,counter,param)
    if (User.lastSpokenText == "noMaic") then
        User:setMagicType(0)
		User:teachMagic(0,0)
		User:teachMagic(1,0)
		User:teachMagic(2,0)
		User:teachMagic(3,0)
	end
    if (User.lastSpokenText == "mage") then
		User:setMagicType(0)
		User:teachMagic(0,1)
	end
  	if (User.lastSpokenText == "alchemist") then
		User:setMagicType(3)
		User:teachMagic(3,1)
	end
end