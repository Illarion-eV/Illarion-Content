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
-- ID 1123, Dragon of Death, Level 8, Armourtype: medium, Weapontype: stabbing
local monsterId = 1123

local base = require("monster.base.base")
local monstermagic = require("monster.base.monstermagic")
local fleshDragons = require("monster.race_112_flesh_dragon.base")
local poisonfield = require("item.id_372_poisonfield")
local M = fleshDragons.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end
end

local magic = monstermagic()

magic.addPoisoncone{probability = 0.075, damage = {from = 1750, to = 2000}, range = 6,
    itemProbability = 0.055, quality = {from = 2, to = 3}}
magic.addPoisoncone{probability = 0.003, damage = {from = 1800, to = 2500}, range = 6,
    itemProbability = 0.025, quality = {from = 3, to = 4}}
magic.addPoisoncone{probability = 0.009, damage = {from = 2300, to = 3000}, range = 6,
    itemProbability = 0.012, quality = {from = 4, to = 5}}

poisonfield.setPoisonImmunity(monsterId)

return magic.addCallbacks(M)

--[[
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1123,'Dragon of Death',112,10000,'walk',true,false,'monster.race_112_flesh_dragon.id_1123_deathdragon',110,120,'Todesdrache');

INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'willpower',32,41);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'strength',32,41);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'perception',32,41);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'intelligence',32,41);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'essence',32,41);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'dexterity',32,41);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'constitution',32,41);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1123,'agility',32,41);

INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,21);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,22);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,23);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,24);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,25);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,26);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,27);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,28);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,29);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1123,80,90,37);

INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1123','head','2286','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1123','breast','2400','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1123','right hand','1051','1','1');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','1','0.2','447','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','1','0.1','449','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','1','0.01','738','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','1','0.01','505','1','1','6','7','99','99');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','2','0.5','450','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','2','0.02','2534','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','2','0.01','2553','1','1','7','8','77','88');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1123','3','1','3077','30','90','7','7','73','73');
]]
