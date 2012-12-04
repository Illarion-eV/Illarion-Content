require("base.class")

module("handler.movelever", package.seeall)

moveLever = base.class.class(function(mvLev, lev)
    mvLev.lever=lev;
end);

function moveLever:execute()
    self.lever:switchLever(nil);
end
