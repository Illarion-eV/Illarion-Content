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
--ID 1171, Forest Ettin,            Level: 3, Armourtype: medium, Weapontype: puncture
--ID 1172, Wandering Forest Ettin,  Level: 3, Armourtype: light, Weapontype: puncture
--ID 1173, Jackhammer Forest Ettin, Level: 4, Armourtype: medium, Weapontype: concussion
--ID 1174, Canibal Forest Ettin,    Level: 4, Armourtype: heavy, Weapontype: slashing
--ID 1175, Forest Ettin Leader,     Level: 5, Armourtype: heavy, Weapontype: concussion

local ettins = require("monster.race_117_ettin.base")
return ettins.generateCallbacks()


--[[
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1171,'Forest Ettin',117,10000,'walk',true,false,'monster.race_117_ettin.default',80,90,'Waldettin');

INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'willpower',5,9);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'strength',5,9);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'perception',5,9);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'intelligence',5,9);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'essence',5,9);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'dexterity',5,9);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'constitution',5,9);
INSERT INTO "monster_attributes" ("mobattr_monsterid","mobattr_name","mobattr_min","mobattr_max")
VALUES (1171,'agility',5,9);

INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,21);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,22);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,23);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,24);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,25);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,26);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,27);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,28);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,29);
INSERT INTO "monster_skills" ("mobsk_monsterid","mobsk_minvalue","mobsk_maxvalue","mobsk_skill_id")
VALUES (1171,30,40,37);

INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1171','head','2303','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1171','breast','2402','1','1');
INSERT INTO "monster_items" ("mobit_monsterid","mobit_position","mobit_itemid","mobit_mincount","mobit_maxcount")
VALUES ('1171','right hand','1041','1','1');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1171','1','0.2','447','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1171','1','0.1','449','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1171','1','0.01','738','1','1','7','8','77','88');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1171','1','0.01','505','1','1','6','7','99','99');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1171','2','0.5','450','1','1','7','8','77','88');

INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1171','3','1','3076','20','60','7','7','73','73');
]]
