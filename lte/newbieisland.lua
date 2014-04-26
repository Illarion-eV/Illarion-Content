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
-- Long Time Effect Script: Newbie Island
-- Effect ID: 13
-- Values: newbiePosX, newbiePosY, newbiePosZ, itemid_1, itemnumber_1, itemdata_1, itemquality_1 (1-18)
-- Reworked by Merung for NewNoobia
-- Pimped by Estralis

require("base.common")
module("lte.newbieisland", package.seeall)



function addEffect(newbieEffect, Character)
end

function callEffect(newbieEffect,Character)
    
	if (Character.pos.z ~= 100) and (Character.pos.z ~= 101) then
	    return false; --removing the effect
	end	
	
	foundRoundCount, roundCount = newbieEffect:findValue("roundCount"); 

	if foundRoundCount then 
		
		roundCount = roundCount + 1; --Counting
		
		if roundCount == 30 then --Let us check for players that required more than thirty minutes for Noobia.

            Character:pageGM("This player could use assistance on Noobia.");
				
		end
		
	else
	    roundCount = 1;
	end
	
	newbieEffect:addValue("roundCount",roundCount); --whatever this is. Merung, learn to use comments ;-)
	newbieEffect.nextCalled=600; --One minute
	return true; --bailing out in any case
	
end

function removeEffect(newbieEffect, Character)
end
