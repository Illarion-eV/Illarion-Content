require("base.common")
require("base.lookat")

-- UPDATE common SET com_script='item.id_623_rockface' WHERE com_itemid IN (623);

module("item.id_623_rockface", package.seeall)

function UseItem(User, SourceItem, ltstate)

  -- entrance to the cave
  local pos = position(894, 627, 0);
  if (SourceItem.pos ~= pos) then
		return
  end

  -- open on keyword
  local spokenText = User.lastSpokenText;
  if (string.find(spokenText, "[Ff][Oo][Xx]") ~= nil or
	  string.find(spokenText, "[Ff][Uu][Cc][Hh][Ss]") ~= nil) then

	world:erase(SourceItem, 1);

	base.common.InformNLS(User,
      "Die Steinwand verschwindet als du sie berührst!",
      "The rock wall disappears as you touch it!");


    local Characters = world:getPlayersInRangeOf(pos, 5);
    for i, Char in pairs(Characters) do
	  if (User.id ~= Char.id) then
        base.common.InformNLS(Char,
	    "Eine Steinwand verschwindet einfach.",
	    "A rock wall just disappears.");
	  end
    end

  else
	base.common.InformNLS(User,
      "Nichts passiert als du die Steinwand berührst.",
      "Nothing happens as you touch the rock wall.");
  end
end

function LookAtItem(User, Item)
  if (Item.pos == position(894, 627, 0)) then
		base.lookat.SetSpecialDescription(Item, "Eine merkwürdige Steinwand.", "A peculiar rock wall.");
  end
  world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end
