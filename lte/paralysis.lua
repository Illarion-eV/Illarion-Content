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
module("lte.paralysis", package.seeall)
-- Long time effect script for paralysing
-- effect ID: 23

function addEffect( Paralysis, Target )
	
	Target.movepoints = -500;
	Paralysis.nextCalled = 1;
end

function callEffect( Paralysis, Target )
	
	foundTime, timeLeft = Paralysis:findValue("timeLeft");
	
	if not foundTime then
		return false;
	end
	
	if timeLeft>0 then
		Target.movepoints = -500;
		Paralysis.nextCalled = 10;
		Paralysis:addValue("timeLeft", math.max(0, timeLeft-1));
		return true;
	end
	
	return false;
end

function loadEffect( Paralysis, Target )
	
	Target.movepoints = -500;
	Paralysis.nextCalled = 10;
end

function removeEffect( Paralysis, Target )
	
	Target.movepoints = 21;
end
