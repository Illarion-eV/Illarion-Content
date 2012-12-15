module("content.guards", package.seeall)

function InitGuards()
  if (Init == nil) then
    debug("init guards");
    Init = 1;
    Guards = {};
    AddGuard("Horatio Milenus", 1, position(114, 643, 0), 6, "cadomyr guard 1");  -- horatio milenus
  end
end

function AddGuard(GuardName, FactionId, WarpPos, Radius, AreaName)
  Guards[GuardName] = {
    faction = FactionId,
    warpPos = WarpPos,
    radius = Radius,
    areaName = AreaName
  };
end