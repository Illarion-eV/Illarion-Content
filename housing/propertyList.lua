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

local factions = require("base.factions")

local M = {}

M.propertyTable = {
    -- 1property name, 2DE name, 3position, 4default rent, 5keyID, 6doorID, 7town, 8required rank, 9required rank name, 10DE rank name, 11 estate(boolean)
    -- Some of the information is not used and was there for a fully automated version of housing. It is kept in case of future need.
    --Cadomyr
    {"Villa Annabeth", "Villa Annabeth",position(93,617,0),40000,3054,340, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"]},
    {"Villa Edward", "Villa Edward",position(89,606,0),40000,3054,341, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"]},
    {"Villa Reginald", "Villa Reginald",position(94,561,0),30000,3054,342, "Cadomyr","6",factions.CadomyrRankListMale[6]["eRank"],factions.CadomyrRankListMale[6]["gRank"]},
    {"Flat Faith and Obedience", "Wohnung Glaube und Gehorsam",position(137,605,0),5000,2558,361, "Cadomyr","4",factions.CadomyrRankListMale[4]["eRank"],factions.CadomyrRankListMale[4]["gRank"]},
    {"Flat Truth and Justice", "Wohnung Ehrlichkeit und Gerechtigkeit",position(136,609,0),10000,2558,363, "Cadomyr","5",factions.CadomyrRankListMale[5]["eRank"],factions.CadomyrRankListMale[5]["gRank"]},
    {"Flat Patriarchy", "Wohnung Patriarchat",position(135,614,0),15000,2558,365, "Cadomyr","5",factions.CadomyrRankListMale[5]["eRank"],factions.CadomyrRankListMale[5]["gRank"]},
    --Runewick
    {"First Fire Apartment", "Erstes Feuerapartment",position(945,756,0),30000,2558,240, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
    {"Second Fire Apartment", "Zweites Feuerapartment",position(950,756,0),30000,2558,241, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
    {"Third Fire Apartment", "Drittes Feuerapartment",position(958,758,0),60000,2558,242, "Runewick","6",factions.RunewickRankListMale[6]["eRank"],factions.RunewickRankListMale[6]["gRank"]},
    {"Fourth Fire Apartment", "Viertes Feuerapartment",position(957,756,1),80000,2558,243, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"]},
    {"First Air Apartment", "Erstes Luftapartment",position(958,839,1),70000,2558,210, "Runewick","6",factions.RunewickRankListMale[6]["eRank"],factions.RunewickRankListMale[6]["gRank"]},
    {"Second Air Apartment", "Zweites Luftapartment",position(956,835,1),50000,2558,211, "Runewick","5",factions.RunewickRankListMale[5]["eRank"],factions.RunewickRankListMale[5]["gRank"]},
    {"First Earth Apartment", "Erstes Erdapartment",position(901,762,1),30000,2558,230, "Runewick","4",factions.RunewickRankListMale[4]["eRank"],factions.RunewickRankListMale[4]["gRank"]},
    {"Second Earth Apartment", "Zweites Erdapartment",position(902,763,1),30000,2558,231, "Runewick","4",factions.RunewickRankListMale[4]["eRank"],factions.RunewickRankListMale[4]["gRank"]},
    {"Third Earth Apartment", "Drittes Erdapartment",position(899,759,-3),30000,2558,233, "Runewick","4",factions.RunewickRankListMale[4]["eRank"],factions.RunewickRankListMale[4]["gRank"]},
    {"Fourth Earth Apartment", "Viertes Erdapartment",position(899,769,-3),20000,2558,234, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
    {"Fifth Earth Apartment", "Fünftes Erdapartment",position(902,755,-3),20000,2558,235, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
    {"Sixth Earth Apartment", "Sechstes Erdapartment",position(900,755,-3),20000,2558,236, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
    {"Cottage", "Landhaus",position(791,795,0),30000,2558,251, "Runewick","5",factions.RunewickRankListMale[5]["eRank"],factions.RunewickRankListMale[5]["gRank"]},
    {"Quadruped Red Bird","Vierbeiniger Roter Vogel",position(745,803,0),100000,2558,250, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"]},
    --Galmair
    {"House of Malachite","Malachithaus",position(372,323,0), 100000, 3056, 110, "Galmair", "7",factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"]},
    {"Villa Goldvein","Villa Goldader", position(300, 281, 0), 80000, 3055, 111, "Galmair", "7",factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"]},
    {"Flat Irmorom","Wohnung Irmorom",position(373,216,-6), 30000,2558,120, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
    {"Flat Elara","Wohnung Elara",position(384,219,-6), 30000,2558,121, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
    {"Flat Adron","Wohnung Adron",position(383,230,-6), 20000,2558,122, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
    {"Flat Malachin","Wohnung Malachín",position(382,240,-6),20000,2558,123, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
    {"Flat Oldra","Wohnung Oldra",position(376,238,-6),30000,2558,124, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
    {"Flat Nargun","Wohnung Nargùn",position(384,240,-5),20000,2558,125, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
    {"Flat Ronagan","Wohnung Ronagan",position(385,228,-5),20000,2558,126, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
    {"Flat Sirani","Wohnung Sirani",position(386,220,-5),30000,2558,127, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
    {"Flat Zhambra","Wohnung Zhambra",position(373,214,-5),30000,2558,128, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
    {"Lucky Copper","Glückskupfer",position(416,289,1),40000,2558,113, "Galmair","5",factions.GalmairRankListMale[5]["eRank"],factions.GalmairRankListMale[5]["gRank"]},
    {"Silver Profit","Silberner Verdienst",position(419,294,1),50000,2558,114, "Galmair","5",factions.GalmairRankListMale[5]["eRank"],factions.GalmairRankListMale[5]["gRank"]},
    {"Golden Deal","Goldener Abschluss",position(419,291,1),60000,2558,115, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
    {"Flat Sapphire","Wohnung Saphir",position(400,222,1),50000,2558,131, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
    {"Flat Diamond","Wohnung Diamant",position(406,222,1),60000,2558,132, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
    {"Flat Obsidian","Wohnung Obsidian",position(428,216,1),60000,2558,133, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
    --Estates, Galmair
    {"Syrita Estate","Grundstück Syrita",position(447,124,0),200000, 2558, 134, "Galmair", "7", factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"], true},
    {"Nargun Estate","Grundstück Nargun",position(527,263,0),200000, 2558, 135, "Galmair", "7", factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"], true},
    {"Rumil Estate","Grundstück Rumil",position(381,354,0),200000, 2558, 136, "Galmair", "7", factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"], true},
    --Cadomyr
    {"Cadomyr Harbour Estate", "Hafengrundstück in Cadomyr",position(77,786,0),200000, 2558,368, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"], true},
    {"Kantabi Estate", "Grundstück Kantabi",position(173,674,0),200000, 2558,369, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"], true},
    {"Siba Estate", "Grundstück Siba",position(91,686,0),200000, 2558,370, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"], true},
    --Runewick
    {"Anthil Estate", "Grundstück Anthil",position(775,740,0),200000, 2558,252, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"], true},
    {"Oldra Estate", "Grundstück Oldra",position(841,884,0),200000, 2558,253, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"], true},
    {"Merryglade Estate", "Grundstück Merryglade",position(834,728,0),200000, 2558,254, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"], true},
    --Outlaw
    {"Pauldron Estate", "Grundstück Schulterplatte",position(213,97,0),200000,2558,504,"Outlaw","0","None","None", true}
    }

M.properties = {}
--Cadomyr houses
table.insert(M.properties, {name = "Villa Annabeth", lower = position(93,610,0), upper = position(104,619,1)})
table.insert(M.properties, {name = "Villa Annabeth", lower = position(119, 625, -7), upper = position(131, 643, -7)})
table.insert(M.properties, {name = "Villa Edward", lower = position(85,597,0), upper = position(97,606,1)})
table.insert(M.properties, {name = "Villa Reginald", lower = position(89,552,0), upper = position(97,561,0)})
table.insert(M.properties, {name = "Flat Faith and Obedience", lower = position(138,602,0), upper = position(144,605,0)})
table.insert(M.properties, {name = "Flat Faith and Obedience", lower = position(139,601,1), upper = position(145,605,1)})
table.insert(M.properties, {name = "Flat Truth and Justice", lower = position(137,606,0), upper = position(144,611,0)})
table.insert(M.properties, {name = "Flat Truth and Justice", lower = position(139,606,1), upper = position(145,611,1)})
table.insert(M.properties, {name = "Flat Patriarchy", lower = position(136,612,0), upper = position(146,617,0)})
table.insert(M.properties, {name = "Flat Patriarchy", lower = position(137,613,1), upper = position(147,618,1)})
--Runewick houses
table.insert(M.properties, {name = "First Fire Apartment", lower = position(946,748,0), upper = position(950,754,0)})
table.insert(M.properties, {name = "Second Fire Apartment", lower = position(951,748,0), upper = position(955,754,0)})
table.insert(M.properties, {name = "Third Fire Apartment", lower = position(960,748,0), upper = position(965,758,0)})
table.insert(M.properties, {name = "Third Fire Apartment", lower = position(956,748,0), upper = position(960,753,0)})
table.insert(M.properties, {name = "Fourth Fire Apartment", lower = position(955,748,1), upper = position(965,759,1)})
table.insert(M.properties, {name = "Fourth Fire Apartment", lower = position(950,748,1), upper = position(965,755,1)})
table.insert(M.properties, {name = "First Air Apartment", lower = position(959,835,1), upper = position(963,844,1)})
table.insert(M.properties, {name = "First Air Apartment", lower = position(956,841,11), upper = position(963,844,1)})
table.insert(M.properties, {name = "Second Air Apartment", lower = position(954,828,1), upper = position(961,833,1)})
table.insert(M.properties, {name = "First Earth Apartment", lower = position(901,757,1), upper = position(909,762,1)})
table.insert(M.properties, {name = "Second Earth Apartment", lower = position(901,763,1), upper = position(909,768,1)})
table.insert(M.properties, {name = "Third Earth Apartment", lower = position(901,758,-3), upper = position(907,762,-3)})
table.insert(M.properties, {name = "Third Earth Apartment", lower = position(903,758,-3), upper = position(907,766,-3)})
table.insert(M.properties, {name = "Fourth Earth Apartment", lower = position(901,767,-3), upper = position(907,770,-3)})
table.insert(M.properties, {name = "Fifth Earth Apartment", lower = position(893,766,-3), upper = position(897,773,-3)})
table.insert(M.properties, {name = "Sixth Earth Apartment", lower = position(893,758,-3), upper = position(897,765,-3)})
table.insert(M.properties, {name = "Cottage", "Landhaus", lower = position(785,795,0), upper = position(792,789,0)})
table.insert(M.properties, {name = "Quadruped Red Bird", lower = position(740,795,0), upper = position(755,803,0)})
table.insert(M.properties, {name = "Quadruped Red Bird", lower = position(741,795,1), upper = position(745,799,1)})
table.insert(M.properties, {name = "Quadruped Red Bird", lower = position(741,796,2), upper = position(744,799,2)})
--Galmair houses
table.insert(M.properties, {name = "House of Malachite", lower = position(367,309,0), upper = position(377,323,0)})
table.insert(M.properties, {name = "Villa Goldvein", lower = position(294,269,0), upper = position(309,281,0)})
table.insert(M.properties, {name = "Flat Irmorom", lower = position(372,207,-6), upper = position(384,214,-6)})
table.insert(M.properties, {name = "Flat Elara", lower = position(386,217,-6), upper = position(396,223,-6)})
table.insert(M.properties, {name = "Flat Adron", lower = position(384,224,-6), upper = position(395,233,-6)})
table.insert(M.properties, {name = "Flat Malachin", lower = position(383,234,-6), upper = position(395,242,-6)})
table.insert(M.properties, {name = "Flat Oldra", lower = position(369,224,-6), upper = position(376,236,-6)})
table.insert(M.properties, {name = "Flat Nargun", lower = position(386,234,-5), upper = position(396,243,-5)})
table.insert(M.properties, {name = "Flat Ronagan", lower = position(387,224,-5), upper = position(396,232,-5)})
table.insert(M.properties, {name = "Flat Sirani", lower = position(388,214,-5), upper = position(397,223,-5)})
table.insert(M.properties, {name = "Flat Zhambra", lower = position(371,205,-5), upper = position(386,212,-5)})
table.insert(M.properties, {name = "Lucky Copper", lower = position(409,289,1), upper = position(414,300,1)})
table.insert(M.properties, {name = "Silver Profit", lower = position(415,296,1), upper = position(426,300,1)})
table.insert(M.properties, {name = "Golden Deal", lower = position(420,286,1), upper = position(426,295,1)})
table.insert(M.properties, {name = "Golden Deal", lower = position(420,286,2), upper = position(426,292,2)})
table.insert(M.properties, {name = "Flat Sapphire", lower = position(394,212,1), upper = position(404,222,1)})
table.insert(M.properties, {name = "Flat Diamond", lower = position(405,206,1), upper = position(415,222,1)})
table.insert(M.properties, {name = "Flat Obsidian", lower = position(420,206,1), upper = position(432,220,1)})
--Estates, Galmair
table.insert(M.properties, {name = "Syrita Estate", lower = position(449,124,0), upper = position(459,139,2), estate = true})
table.insert(M.properties, {name = "Syrita Estate", lower = position(449,124,-21), upper = position(459,139,-21), estate = true})
table.insert(M.properties, {name = "Nargun Estate", lower = position(529,256,0), upper = position(543,265,2), estate = true})
table.insert(M.properties, {name = "Nargun Estate", lower = position(529,256,-21), upper = position(543,265,-21), estate = true})
table.insert(M.properties, {name = "Rumil Estate", lower = position(384,351,0), upper = position(391,364,2), estate = true})
table.insert(M.properties, {name = "Rumil Estate", lower = position(384,351,-21), upper = position(391,364,-21), estate = true})
table.insert(M.properties, {name = "Rumil Estate", lower = position(378,359,0), upper = position(384,364,2), estate = true})
table.insert(M.properties, {name = "Rumil Estate", lower = position(378,359,-21), upper = position(384,364,-21), estate = true})

--Cadomyr
table.insert(M.properties, {name = "Cadomyr Harbour Estate", lower = position(77,772,0), upper = position(92,782,2), estate = true})
table.insert(M.properties, {name = "Cadomyr Harbour Estate", lower = position(77,772,-21), upper = position(92,782,-21), estate = true})
table.insert(M.properties, {name = "Kantabi Estate", lower = position(175,673,0), upper = position(185,688,2), estate = true})
table.insert(M.properties, {name = "Kantabi Estate", lower = position(175,673,-21), upper = position(185,688,-21), estate = true})
table.insert(M.properties, {name = "Siba Estate", lower = position(79,672,0), upper = position(94,682,2), estate = true})
table.insert(M.properties, {name = "Siba Estate", lower = position(79,672,-21), upper = position(94,682,-21), estate = true})
--Runewick
table.insert(M.properties, {name = "Anthil Estate", lower = position(767,728,0), upper = position(781,737,2), estate = true})
table.insert(M.properties, {name = "Anthil Estate", lower = position(767,728,-21), upper = position(781,737,-21), estate = true})
table.insert(M.properties, {name = "Oldra Estate", lower = position(844,871,0), upper = position(853,885,2), estate = true})
table.insert(M.properties, {name = "Oldra Estate", lower = position(844,871,-21), upper = position(853,885,-21), estate = true})
table.insert(M.properties, {name = "Merryglade Estate", lower = position(828,716,0), upper = position(834,726,2), estate = true})
table.insert(M.properties, {name = "Merryglade Estate", lower = position(821,716,-21), upper = position(836,726,-21), estate = true})
--Outlaw
table.insert(M.properties, {name = "Pauldron Estate", lower = position(967,343,0), upper = position(983,362,2), estate = true, outlaw = true})
table.insert(M.properties, {name = "Pauldron Estate", lower = position(967,343,-21), upper = position(983,362,-21), estate = true, outlaw = true})

return M
