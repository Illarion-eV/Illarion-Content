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
--ID 1131, Rabbit
--ID 1132, Hare
--ID 1133, Forest Rabbit
--ID 1134, Forest Hare
--ID 1135, Desert Rabbit
--ID 1136, Desert Hare

local deers = require("monster.race_113_rabbit.base")
return deers.generateCallbacks()

--[[
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1131,'Rabbit',113,10000,'walk',false,false,'monster.race_113_rabbit.default',80,100,'Kaninchen');
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1132,'Hare',113,10000,'walk',false,false,'monster.race_113_rabbit.default',100,120,'Hase');
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1133,'Forest Rabbit',113,10000,'walk',false,false,'monster.race_113_rabbit.default',80,100,'Waldkaninchen');
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1134,'Forest Hare',113,10000,'walk',false,false,'monster.race_113_rabbit.default',100,120,'Waldhase');
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1135,'Desert Rabbit',113,10000,'walk',false,false,'monster.race_113_rabbit.default',80,100,'Wüstenkaninchen');
INSERT INTO "monster" ("mob_monsterid","mob_name_en","mob_race","mob_hitpoints","mob_movementtype","mob_canattack","mob_canhealself","script","mob_minsize","mob_maxsize","mob_name_de")
VALUES (1136,'Desert Hare',113,10000,'walk',false,false,'monster.race_113_rabbit.default',100,120,'Wüstenhase');


INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1131','1','1','63','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1131','2','0.5','553','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1132','1','1','63','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1132','2','0.5','553','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1133','1','1','63','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1133','2','0.5','553','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1134','1','1','63','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1134','2','0.5','553','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1135','1','1','63','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1135','2','0.5','553','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1136','1','1','63','1','1','3','3','33','33');
INSERT INTO "monster_drop" ("md_monsterid","md_category","md_probability","md_itemid","md_amount_min","md_amount_max","md_quality_min","md_quality_max","md_durability_min","md_durability_max")
VALUES ('1136','2','0.5','553','1','1','3','3','33','33');
]]
