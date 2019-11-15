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

--[[
DELETE FROM triggerfields WHERE tgf_script = 'triggerfield.asparktoaflame';
DELETE FROM triggerfields WHERE tgf_script = 'triggerfield.altars';
DELETE FROM triggerfields WHERE tgf_script = 'triggerfield.altars_temple_of_five';

DROP FUNCTION IF EXISTS altar_triggers(int[], triggerfields.tgf_script%TYPE);
CREATE FUNCTION altar_triggers(int[], triggerfields.tgf_script%TYPE) RETURNS void AS $$
DECLARE
  arr int[];
BEGIN
  FOREACH arr SLICE 1 IN ARRAY $1
  LOOP
    FOR x in (arr[1]-1) .. (arr[1]+1) LOOP
      FOR y in (arr[2]-1) .. (arr[2]+1) LOOP
        INSERT INTO triggerfields (tgf_posx, tgf_posy, tgf_posz, tgf_script) VALUES (x, y, arr[3], $2);
      END LOOP;
    END LOOP;
  END LOOP;
END;
$$ LANGUAGE plpgsql;


SELECT altar_triggers(ARRAY[
[563,548,-6],
[783,299,-9],
[763,336,-9],
[312,232,1 ],
[299,265,-5],
[385,262,-6],
[961,843,2 ],
[970,784,1 ],
[908,850,-3],
--[551,133,0 ], -- altars_temple_of_five
--[556,135,0 ], -- altars_temple_of_five
--[549,138,0 ], -- altars_temple_of_five
--[556,141,0 ], -- altars_temple_of_five
--[551,143,0 ], -- altars_temple_of_five
[734,312,0 ],
[892,388,0 ],
[786,443,0 ],
[657,681,0 ],
[960,768,0 ],
[912,785,0 ],
[802,797,0 ],
[919,827,0 ],
[1001,833,0],
[99,536,0  ],
[386,552,0 ],
[142,564,0 ],
[176,761,0 ],
--[176,762,0 ], -- duplicate
[683,408,2 ],
[783,289,-3],
[913,625,1 ],
[146,678,1 ]
], 'triggerfield.altars');

SELECT altar_triggers(ARRAY[
[551,133,0 ],
[556,135,0 ],
[549,138,0 ],
[556,141,0 ],
[551,143,0 ]
], 'triggerfield.altars_temple_of_five');

 ]]

local common = require("base.common")
local gods = require("content.gods")

local _IS_ALTAR_ID = common.setFromList({
    -- The list was obtained by SQL command:
    -- SELECT itm_id FROM items WHERE itm_script = 'item.altars' ORDER BY itm_id
    361 ,
    1162,
    1163,
    1879,
    1880,
    2801,
    2857,
    2872,
    3891,

    -- Elara's statue
    464,
})

local _MAX_DISTANCE = 1

local M = {}

function M.PutItemOnField(Item, User)
    -- Find the relevant altar, it sould be close to the item
    local z = Item.pos.z
    for x = (Item.pos.x - _MAX_DISTANCE), (Item.pos.x + _MAX_DISTANCE) do
        for y = (Item.pos.y - _MAX_DISTANCE), (Item.pos.y + _MAX_DISTANCE) do
            local field = world:getField(position(x,y,z))
            for alt_item_idx = 0,(field:countItems()-1) do
                local alt_item = field:getStackItem(alt_item_idx)
                if _IS_ALTAR_ID[alt_item.id] then
                    local god = tonumber(alt_item:getData("god"))
                    god = god or gods.GOD_NONE
                    if gods.GODS[god] then
                        gods.sacrifice(User, god, Item)
                        return
                    end
                end
            end
        end
    end
    -- Valid altar not found!
    User:inform("[ERROR] Sacrificing near invalid altar. Please inform a developer.")
end

return M