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
-- ID 1121, Night Dragon, Level 6, Armourtype: heavy, Weapontype: concussion
local monsterId = 1121

local base = require("monster.base.base")
local monstermagic = require("monster.base.monstermagic")
local fleshDragons = require("monster.race_112_flesh_dragon.base")
local icefield = require("item.id_360_icefield")

local M = fleshDragons.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end
end

local magic = monstermagic()

magic.addIcecone{probability = 0.09, damage = {from = 1250, to = 2000}, range = 6,
    itemProbability = 0.055, quality = {from = 1, to = 2}}
magic.addIcecone{probability = 0.009, damage = {from = 1500, to = 2300}, range = 3,
    itemProbability = 0.055, quality = {from = 2, to = 3}}

icefield.setIceImmunity(monsterId)

return magic.addCallbacks(M)

--[[
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1121,'Night Dragon',112,10000,'walk',true,false,'monster.race_112_flesh_dragon.id_1121_nightdragon',80,90,'Nachtdrache');

INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'willpower',18,25);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'strength',18,25);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'perception',18,25);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'intelligence',18,25);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'essence',18,25);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'dexterity',18,25);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'constitution',18,25);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1121,'agility',18,25);

INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,21);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,22);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,23);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,24);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,25);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,26);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,27);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,28);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,29);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1121,60,70,37);

INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1121','head','2303','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1121','breast','2402','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1121','right hand','1041','1','1');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1121','1','0.2','447','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1121','1','0.1','449','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1121','1','0.01','738','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1121','1','0.01','505','1','1','6','7','99','99');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1121','2','0.5','450','1','1','7','8','77','88');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1121','3','1','3077','2','5','7','7','73','73');
]]
