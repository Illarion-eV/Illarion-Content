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
