-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")

module("item.id_456_snowball", package.seeall)

Round=1;

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if Round==1 then
        User:talk(Character.say, "#me wirft einen Schneeball.", "#me throws a snowball.")
		Round=2;
	else
		Round=1;
	end
end