require("questsystem.base")
require("base.polygons")
require("base.common")
module("questsystem.secondTest.questStart", package.seeall)

local QUEST_NUMBER = 10001
local POSITION = position(681,319, 0)
local AREA = {position(0,0,0),position(20,0,0),position(20,20,0),position(0,20,0),position(0,0,0)};
local PUTDOWN_TEXT_DE = "Als du das Mehl hinlegst, überkommt dich ein kalter Schauer."
local PUTDOWN_TEXT_EN = "As you put down the flour, you feel a cold shiver."
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 0

function MoveItemAfterMove(player, itemBefore, itemAfter)
player:inform("TEST");
  if AREA ~= nil then
    player:inform("not nil");
    zLevel = {AREA[1].z}
    validArea = base.polygons.Polygon(AREA,zLevel);
    if itemAfter.pos~=nil then
        thePosition=itemAfter.pos;
    else
        thePosition=player.pos;
    end
    player:inform("done with pos: "..thePosition.x.."  "..thePosition.y.."  "..thePosition.z);
    --debug("now calling pip");
    if validArea:pip(thePosition)==false then
        player:inform("not in polygon!");
        return false;
    end
  end
player:inform("survived if");
  if questsystem.base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    base.common.InformNLS(player, PUTDOWN_TEXT_DE, PUTDOWN_TEXT_EN)
    questsystem.base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

