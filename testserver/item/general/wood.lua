require("base.lookat")

module("item.general.wood", package.seeall)

-- Normal Items:
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN (17,39,40,57,65,70,76,207,208,209,212,213,214,215,216,217,218,219,263,312,522,524,532,533, 550,551,2193,2194,2445,2448,2525,2527,2528,2530,2541,2544,2548,2549,2561,2566,2567,2570,2572,2573,2584,2585,2646,2659,2664,2685,2708,2714,2718,2727,2739,2780,2782,2783,2784,2785,2875,2876,2877,2878,2879,2880,2885,2913,2914,2915,2916);

-- Priest Items
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN ();

-- Weapons:
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN ();

function LookAtItem(user, item)
    world:itemInform(user, item, base.lookat.GenerateLookAt(user, item, base.lookat.WOOD));
end
