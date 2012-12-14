require("base.lookat")

module("item.general.metal", package.seeall)

-- Normal Items:
-- UPDATE common SET com_script='item.general.metal' WHERE com_itemid IN (4,7,9,16,18,19,20,94,95,96,101,184,185,186,187,202,324,325,528,529,530,531,696,699,770,771,916,2111,2112,2113,2114,2116,2117,2172,2284,2286,2287,2290,2291,2302,2303,2357,2359,2360,2363,2364,2365,2367,2369,2388,2389,2390,2393,2395,2399,2400,2402,2403,2407,2439,2441,2444,2495,2526,2542,2562,2563,2564,2565,2568,2569,2647,2707,2709,2710,2711,2746,2751);

-- Priest Items:
-- UPDATE common SET com_script='item.general.metal' WHERE com_itemid IN ();

-- Weapons:
-- UPDATE common SET com_script='item.general.metal' WHERE com_itemid IN (1,25,27,77,78,84,85,88,91,98,123,188,189,190,204,205,206,226,230,231,297,383,389,2626,2627,2629,2635,2636,2642,2645,2654,2655,2656,2658,2660,2662,2668,2671,2672,2675,2689,2693,2694,2701,2704,2705,2723,2725,2731,2737,2740,2742,2757,2775,2777,2778,2788);

function LookAtItem(user, item)
    world:itemInform(user, item, base.lookat.GenerateLookAt(user, item, base.lookat.METAL));
end
