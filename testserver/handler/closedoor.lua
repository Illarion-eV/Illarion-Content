require("base.class")
require("base.doors")

module("handler.closedoor", package.seeall)

-- A door is locked if its quality is 333 and unlocked if it is 233. Data has to be ~=0.
-- it makes sound 19 (world:makeSound(19, Door.pos);) when the door locks.
-- A key with the same data than a door lock/unlocks it (not important here).

closeDoor = base.class.class(function(door, posi)
    door.pos=posi;
end);

function closeDoor:execute()
    if (world:isItemOnField(self.pos)==true) then
        item=world:getItemOnField(self.pos);
        base.doors.CloseDoor(item);
    else
        return -1;
    end
end
