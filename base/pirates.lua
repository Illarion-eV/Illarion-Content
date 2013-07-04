require("base.common")
--require("item.bookrests")

module("base.pirates", package.seeall)


function piratesattack(User)
  User:inform("names: ","names: ")
travler = world:getPlayersInRangeOf(SourceItem.pos, 5);
					for i,player in ipairs(travler) do
						player:inform("Piraten nähern sich eurem Schiff, dir stehen folgende Möglichkeiten zur Wahl.", "Pirates are coming closer to your ship. You can choose between following options.")
						world:gfx(1,player.pos)
						world:makeSound(9,player.pos);
						player:warp(position(352,870,1))
						world:gfx(11,player.pos)
						world:makeSound(9,player.pos);	
					end


end
