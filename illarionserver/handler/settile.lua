require("base.class")

module("handler.settile", package.seeall)

setTile = base.class.class(function(settl, posi, tlId)
    settl.pos=posi;
    settl.tileId=tlId;
end);

function setTile:execute()
    world:changeTile(self.tlId, self.pos);
end
