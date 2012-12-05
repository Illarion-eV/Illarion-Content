-- Gras tiles are shown as snow tiles at winter. Copy the function of the snow
-- tiles during this time.

-- UPDATE tiles SET til_script='tile.id_11_gras' WHERE til_id = 11;
require("tile.id_10_snow")

module("tile.id_11_gras", package.seeall)

function useTile(User,Position,counter,param)
	if (world:getTime("month") <= 13) then
		tile.id_10_snow.useTile(User, Position, counter, param)
		return;
	end;
end
