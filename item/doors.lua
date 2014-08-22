--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
require("base.common")
require("base.doors")

module("item.doors", package.seeall)

-- UPDATE items SET itm_script='item.doors' WHERE itm_id IN (86, 87,927,317,476,477,478,479,499,900,901,902,484,485,924,923,668,669,660,661,684,685,664,665,670,666,671,667,662,686,663,687,715,714,712,713,497,922,925,926,480,481,482,483,903,904,905,906,486,487,496,920,656,657,648,649,652,653,644,645,658,654,659,655,650,646,651,647,711,710,708,709);

function UseItem(User, SourceItem)

	if User.pos.z==100 or User.pos.z==101 then --On Noobia: Doors must not be closed.
		
	    base.common.InformNLS(User,"Die Tür klemmt und kann nicht geschlossen werden.","The door is jammed and won't close.");
	    return; --bailing out
			
	end --Noobia end
		
    if base.doors.CloseDoor(SourceItem) then
		
	    base.common.InformNLS(User,"Du schließt die Tür.","You close the door.");
     
	else
		
		local OpenDoor,OpenOK=base.doors.OpenDoor(SourceItem);
		
        if OpenOK then
		
            base.common.InformNLS(User,"Du öffnest die Tür.","You open the door.");
			
        elseif OpenDoor then
		
            base.common.InformNLS(User,"Du versuchst die Tür zu öffnen, doch sie ist verschlossen.","You try to open the door, but the door is locked.");
			
        end
		
    end
	
end

function LookAtItem(User,Item)
    return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
end
