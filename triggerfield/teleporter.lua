--Some GFX and SFX for teleporters

-- Cadomyr: 127 647 0
-- Runewick: 788 826 0
-- Galmair: 424 245 0
-- Wilderland: 684 307 0

require("base.common")

module("triggerfield.teleporter", package.seeall)

function MoveFromField(User)

    world:makeSound(13,User.pos);
    world:gfx(41,User.pos);

end