-- UPDATE common SET com_script='item.id_1266_stone' WHERE com_itemid = 1266;
--Quest 112: The Ghost Oak, NPC Madoquar

require("base.common")
module("item.id_1266_stone", package.seeall)

function SkipStone
	User:talkLanguage(Character.say,Player.german,"#me wirft ein Steinchen ins Wasser.");
    User:talkLanguage(Character.say,Player.english,"#me throws a pebble into the water.");
    world:gfx(1,Item.pos);
    world:makeSound(9,Item.pos);
    world:erase(Item,1);
end;

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if (TargetItem:GroundType()==6) then
	SkipStone(Item.pos);
	else 
	return false
end

function GetGroundType(TileID)
if (TileID == 4) then -- field
        return GroundType.field;
    elseif (TileID == 6) then -- water
        return GroundType.water;
    elseif (TileID == 9) then -- forest
        return GroundType.forest;
    elseif (TileID == 3 or TileID == 12) then -- sand
        return GroundType.sand;
    elseif (TileID == 11) then -- gras
        return GroundType.gras;
    elseif (TileID == 2 or TileID == 15) then -- rocks
        return GroundType.rocks;
    elseif (TileID == 8 or TileID == 16) then -- dirt
        return GroundType.dirt;
    elseif (TileID == 10) then -- snow
        return GroundType.snow;
    end;

    return GroundType.unknown;
end;

GroundType = {
    ["unknown"] = 0,
    ["field"] = 1,
    ["forest"] = 2,
    ["sand"] = 3,
    ["gras"] = 4,
    ["rocks"] = 5,
    ["water"] = 6,
    ["dirt"] = 7,
    ["snow"] = 8
};
end



function InformChar(User,gText,eText)
    User:inform(User:getPlayerLanguage()==0 and gText or eText);
end;