require("base.class")

module("handler.createeffect", package.seeall)

createEffect = base.class.class(function(creff, posi, gfxid)
    creff.pos=posi;
    creff.effectId=gfxid;
end);

function createEffect:execute()
    world:gfx(self.effectId, self.pos);
end
