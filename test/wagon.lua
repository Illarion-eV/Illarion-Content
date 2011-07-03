module("test.wagon", package.seeall)

function LookAtItem(player, item)
  if player:getPlayerLanguage() == Player.german then
    world:itemInform(player, item, "Wagen")
  else
    world:itemInform(player, item, "wagon")
  end
end

