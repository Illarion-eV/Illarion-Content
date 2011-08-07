require("questsystem.base")
module("questsystem.firstTest.node2", package.seeall)

local QUEST_NUMBER = 10000
local POSITION = position(682, 324, 0)
local LOOKAT_TEXT_DE = "Du packst den Hamster und steckst ihn in die nächste Gefriertruhe. Vielleicht wird er ja in der Zunkunft nochmal jemandem nützlich sein."
local LOOKAT_TEXT_EN = "You get a hold of the hamster and put him in the next freezer. Maybe he will be of use to somebody in the future."
local PRECONDITION_QUESTSTATE = 2
local POSTCONDITION_QUESTSTATE = 3

function LookAtItem(player, item)
  if questsystem.base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE)
      and item.pos == POSITION then
    itemInformNLS(player, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
    questsystem.base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function itemInformNLS(player, item, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    world:itemInform(player, item, textDe)
  else
    world:itemInform(player, item, textEn)
  end
end
