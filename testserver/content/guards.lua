module("content.guards", package.seeall)

function InitGuards()
  if (Init == nil) then
    debug("init guards");
    Init = 1;
    Guards = {};
    AddGuard(4278190318, 1, position(114, 639, 0), 3, "cadomyr guard 1");  -- horatio milenus
  end
end

function AddGuard(GuardId, FactionId, WarpPos, Radius, AreaName)
  Guards[GuardId] = {
    faction = FactionId,
    warpPos = WarpPos,
    radius = Radius,
    areaName = AreaName
  };
end