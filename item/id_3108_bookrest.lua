require("base.common")

-- UPDATE common SET com_script='item.id_3108_bookrest' WHERE com_itemid = 3108;

-- Bookrest for the Salavesh dungeon!

module("item.id_3108_bookrest", package.seeall)

function LookAtItem(User,Item)

    if (Item.pos == position(741,406,-3)) then
	    if (User:getPlayerLanguage()==0) then
	        world:itemInform(User,Item,"Tagebuch des Abtes Elzechiel");
	    else
	        world:itemInform(User,Item,"Journal of Abbot Elzechiel");
	    end
	end
end

function UseItem(User,SourceItem,TargetItem,counter,param)
	base.common.InformNLS(User,"Bitte hier das Lesen des Salavesh-Buches implementieren!","Please implement reading the Salavesh book here!");
	--Please implement reading the Salavesh book here!
end
