-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);

module("item.id_2_flour", package.seeall)

require("test.martin")

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
	if User.id==42 then
		test.martin.UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
	end

	return;
end
