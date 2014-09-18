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
local common = require("base.common")

module("base.time", package.seeall)

daysPerMonth = {31,28,31,30,31,30,31,31,30,31,30,31}
TIMEZONE=-5

--[[
	Converts a unix timestamp into the RL date
	@param timestamp - unix timestamp
	@return year - the year of the given timestamp
	@return month - the month of the given timestamp
	@return day - the day of the given timestamp
	@return hour - the hour of the given timestamp
	@return minute - the minute of the given timestamp
	@return second - the second of the given timestamp
]]
function getRLDateFromUnixTimestamp(timestamp)
	local year=math.floor(1970+ timestamp /31556926)
	local ds=((1970+timestamp/31556926)-year)*31556926
	local month=math.floor(ds/2629743)+1
	local d=math.floor(ds/86400)+1
	local day=math.floor(((ds/2629743+1)-month)*daysPerMonth[month])+2
	local DST=0;
	
	if(month==3)then 
		if(day>=14)then 
			DST=1 else DST=0
		end
	elseif(month==11)then 
		if(day>=7)then 
			DST=0 else DST=1 
		end 
	end
	local hour=math.floor(math.fmod(timestamp,60*60*24)/3600) + 5 + (TIMEZONE) + (DST)
	local minute= math.floor(math.fmod(timestamp,60*60*24)/60 - 60*(hour-DST))
	local second= math.floor(math.fmod(math.fmod(timestamp,60*60*24),60))
	return year, month, day, hour, minute, second;
end
