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
module("content.lightmasters", package.seeall)

LightmasterList = {};
--[[
INDEX int  					the next free index
name String  				the NPC's name
pos posStruct  				the start position, should be a waiting point, at least a waypoint
race int  					the race, important for creating the NPC
sex int						0=male, 1=female
script String				the script name
]]
