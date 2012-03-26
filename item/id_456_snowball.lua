-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);

module("item.id_456_snowball", package.seeall)

function MoveItemBeforeMove(User, SourceItem, TargetItem)
	if Round==nil then
	MyTile=world:getField(TargetItem.pos)
	TileID = MyTile.tile
	Round=1;
	end
	if Round==1 then
		if (TileID==6) then 
		User:talkLanguage(Character.say,Player.german,"#me wirft ein Steinchen ins Wasser.");
		User:talkLanguage(Character.say,Player.english,"#me throws a pebble into the water.");
		world:gfx(1,TargetItem.pos);
		world:makeSound(9,TargetItem.pos);
		world:erase(Item,1);
	Round=2 
	else 
	Round=nil;	
	return true
	end
	end
return false
end