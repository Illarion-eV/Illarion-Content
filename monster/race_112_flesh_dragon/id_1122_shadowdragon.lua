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
-- ID 1122, Shadow Dragon, Level 7, Armourtype: light, Weapontype: slashing

local base = require("monster.base.base")
local monstermagic = require("monster.base.monstermagic")
local fleshDragons = require("monster.race_112_flesh_dragon.base")

local M = fleshDragons.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end
end

local magic = monstermagic()

magic.addSummon{probability = 0.0250, monsters = {43,44,41}} -- orcs
magic.addSummon{probability = 0.0050, monsters = {45,42}} -- orcs
magic.addSummon{probability = 0.0001, monsters = {1121, 903}} -- night Dragon, shadow imp

return magic.addCallbacks(M)

--[[
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1122,'Shadow Dragon',112,10000,'walk',true,false,'monster.race_112_flesh_dragon.id_1122_shadowdragon',90,110,'Schattendrache');

INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'willpower',25,33);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'strength',25,33);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'perception',25,33);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'intelligence',25,33);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'essence',25,33);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'dexterity',25,33);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'constitution',25,33);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1122,'agility',25,33);

INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,21);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,22);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,23);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,24);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,25);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,26);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,27);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,28);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,29);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1122,70,80,37);

INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1122','head','7','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1122','breast','362','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1122','right hand','3035','1','1');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1122','1','0.2','447','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1122','1','0.1','449','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1122','1','0.01','738','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1122','1','0.01','505','1','1','6','7','99','99');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1122','2','0.5','450','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1122','2','0.02','2534','1','1','7','8','77','88');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1122','3','1','3077','10','30','7','7','73','73');
]]
