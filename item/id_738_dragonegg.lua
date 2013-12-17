-- UPDATE common SET com_script='item.id_738_dragonegg' WHERE com_itemid IN (738);

module("item.id_738_dragonegg", package.seeall)


function MoveItemBeforeMove(User, SourceItem, TargetItem)

	if SourceItem:getData("spawnSpiders") == "true" then
		User:inform("Das schleimige Spinnenei rutscht dir aus der Hand.","The slimy spider egg slips from your hands.")
		return false
	end

	return true

end