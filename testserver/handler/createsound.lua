require("base.class")

module("handler.createsound", package.seeall)

createSound = base.class.class(function(crsnd, posi, sndid)
    crsnd.pos=posi;
    crsnd.soundId=sndid;
end);

function createSound:execute()
    world:makeSound(self.soundId, self.pos);
end
