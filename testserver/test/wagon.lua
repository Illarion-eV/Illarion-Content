module("test.wagon", package.seeall)

function LookAtItem(player, item)
  if player:getPlayerLanguage() == Player.german then
    world:itemInform(player, item, "Wagen Test")
  else
    world:itemInform(player, item, "wagon test")
  end
end

