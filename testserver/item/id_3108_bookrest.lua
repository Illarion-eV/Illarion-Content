require("base.common")

-- UPDATE common SET com_script='item.id_3108_bookrest' WHERE com_itemid = 3108;

-- Bookrest for the Salavesh dungeon!

module("item.id_3108_bookrest", package.seeall)

function LookAtItem(User,Item)
	
    if (Item.pos == position(741,406,-3)) then
	
	    lookAt = ItemLookAt();
		lookAt.rareness = ItemLookAt.rareItem;
        	
	    if (User:getPlayerLanguage()==0) then
	        lookAt.name = "Tagebuch des Abtes Elzechiel";
			lookAt.description = "Dieses Buch ist von einer schaurigen Schönheit. Du bist versucht, es dennoch zu lesen..."
	    else
	        lookAt.name = "Journal of Abbot Elzechiel";
			lookAt.description = "This item has an evil presence. You are tempted to read it, though..."
	    end
		
        world:itemInform(User, Item, lookAt); --custom lookAt
    
	else
	    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0)); --default lookAt
	end
end

function UseItem(User,SourceItem,TargetItem)

    if (SourceItem.pos == position(741,406,-3)) then
	    User:sendBook(201);
	end
	
end
