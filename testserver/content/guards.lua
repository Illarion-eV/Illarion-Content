module("content.guards", package.seeall)

function InitGuards()
  if (Init == nil) then
    debug("init guards");
    Init = 1;
    Guards = {};
    AddGuard(238, 1, position(114, 639, 0), 3, "cadomyr guard 1");  -- horatio milenus
  end
end

function AddGuard(GuardId, FactionId, WarpPos, Radius, AreaName)
  Guard[guardId] = {
    faction = factionId,
    warpPos = warpPos,
    radius = Radius,
    areaName = AreaName
  };
end