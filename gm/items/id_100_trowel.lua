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
-- UPDATE common SET com_script='gm.items.id_100_trowel' WHERE com_itemid = 100;

require("base.common")
module("gm.items.id_100_trowel", package.seeall)

function UseItem(User, SourceItem)
	local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if not TargetItem then
		TargetItem = base.common.GetFrontItem(User);
	end
	if (TargetItem ~= nil and TargetItem.id > 0) then
	        if string.find(string.lower(User.lastSpokenText), "setnumber (%d+)") then
			local a,b, value = string.find(string.lower(User.lastSpokenText), "setnumber (%d+)");
			world:increase(TargetItem, value - TargetItem.number);
			User:logAdmin("modifies stack size of item " .. world:getItemName(TargetItem.id, Player.english) .. "(" .. TargetItem.id .. ") from " .. TargetItem.number .. " to " .. value)
			return
		end
	end

	-- check if a number was said, if not: don't do anything
	local a,b, value = string.find(User.lastSpokenText, "(%d+)");
	if value == nil or tonumber(value) == nil then
		return
	end

	local target = base.common.GetFrontPosition(User);

	local itemId = tonumber(value);
	local itemQual = 333;
	local itemData = nil
	local newItem = world:createItemFromId(itemId, 1, target, true, itemQual, itemData);
	newItem.wear = 255;
	world:changeItem(newItem);
	User:logAdmin("creates static item " .. world:getItemName(itemId, Player.english) .. "(" .. itemId .. ") at " .. tostring(target))
end

function Ini()
    ListName={};
    ItemList={};
    ListName[1]="GM-Stuff";
    ItemList[1]={97,10,93,99,100,321,382,359,360,372,374,375,376,377,378,379,380,381};
    ListName[2]="Daggers";
    ItemList[2]={27,28,91,189,190,2668,2670,2671,2672,2687,2689,2690,2740,2741,2742};
    ListName[3]="Swords I";
    ItemList[3]={1,13,25,26,78,204,206,2649,2653,2654,2655,2656,2657,2658,2675,2676};
    ListName[4]="Swords II";
    ItemList[4]={2677,2693,2694,2695,2701,2703,2704,2705,2706,2731,2732,2733,2755,2756,2757,2758,2759,2775};
    ListName[5]="Swords III";
    ItemList[5]={2776,2777,2778,2788,2789,2790,3035};
    ListName[6]="Axes I";
    ItemList[6]={88,188,205,383,2625,2626,2627,2628,2629,2630,2631,2634,2635,2636,2637,2639,2640,2641};
    ListName[7]="Axes II";
    ItemList[7]={2642,2643,2644,2645,2660,2661,2662,2711,2712,2713,2723,2724,2725,2726,2946,3079,3080};
    ListName[8]="Concussion Weapons";
    ItemList[8]={226,230,231,2729,2735,2736,2737};
    ListName[9]="Staffs & Wands";
    ItemList[9]={39,40,56,57,76,77,207,208,209,323,2781,2782,2783,2784,2785,2786};
    ListName[10]="Distance Weapons";
    ItemList[10]={64,65,70,89,237,293,294,322,2646,2684,2708,2714,2718,2727,2739,2780};
    ListName[11]="Shields";
    ItemList[11]={17,18,19,20,95,96,186,498,916,917,2284,2388,2439,2445,2447,2448};
    ListName[12]="Helmets";
    ItemList[12]={7,16,94,184,185,187,202,225,324,2286,2287,2290,2291,2302,2303,2441,2444};
    ListName[13]="Body Armor I";
    ItemList[13]={4,101,180,181,182,362,363,364,365,2355,2357,2358,2359,2360,2363,2364,2365,2367};
    ListName[14]="Body Armor II";
    ItemList[14]={2369,2389,2390,2392,2393,2395,2399,2400,2402,2403,2407,2408,2410,2415};
    ListName[15]="Leg Armor & Trousers";
    ItemList[15]={34,183,366,367,2111,2112,2113,2114,2116,2117,2172,2173,2193,2194};
    ListName[16]="Gloves & Boots & Amulettes";
    ItemList[16]={48,325,384,2295,53,326,369,62,222,334};
    ListName[17]="Hats";
    ItemList[17]={356,357,358,370,371};
    ListName[18]="Capes & Robes";
    ItemList[18]={55,180,181,182,193,194,195,196,368,385,2377,2378,2380,2384,2416,2418,2419,2420,2421};
    ListName[19]="Rings";
    ItemList[19]={68,235,277,278,279,280,281,282,2559};
    ListName[20]="Gems";
    ItemList[20]={45,46,197,198,251,252,253,254,255,256,257,283,284,285};
    ListName[21]="Keys";
    ItemList[21]={2121,2122,2123,2124,2141,2144,2145,2161,2162,2556,2558,3054,3055,3056};
    ListName[22]="Food I";
    ItemList[22]={15,80,81,199,200,201,302,388,73,355,306,307,227,1005,2031,2276,2277,2278,2456,2459};
    ListName[23]="Food II";
    ItemList[23]={2647,2922,2923,2934,2935,2940,2952,3051,1008,2488};
    ListName[24]="Potions I";
    ItemList[24]={59,164,165,166,167,327,328,329,330,331,517,518,1315,1316,1317,1318,1319};
    ListName[25]="Potions II";
    ItemList[25]={2496,2497,2498,2499,2500,2501,2502};
    ListName[26]="Goblets I";
    ItemList[26]={223,224,310,1853,1854,1855,1856,1857,1858,1859,1860,1861};
    ListName[27]="Goblets II";
    ItemList[27]={1906,1907,1908,1909,1910,2183,2184,2185,2457};
    ListName[28]="Books I";
    ItemList[28]={105,106,107,108,109,110,111,112,113,114,115,116,117,127,128,129,130,131};
    ListName[29]="Books II";
    ItemList[29]={1060,1061,1089,2598,2602,2604,2605,2606,2607,2608,2609,2610,2615,2616,2617,2619,2620,2621,2622};
    ListName[30]="Lights & Lamps";
    ItemList[30]={92,1862,2850,2851,2852,2853,2854,2855,2856};
    ListName[31]="Other Equipment";
    ItemList[31]={90,332,333,335,336,2696,2719,2744,2745,2746,2760};
    ListName[32]="Tools I";
    ItemList[32]={6,9,23,24,47,51,52,58,72,74,126,227,258,271,311,312};
    ListName[33]="Tools II";
    ItemList[33]={2140,2495,2659,2697,2709,2710,2715,2749,2750,2751,2752,2763,2948};
    ListName[34]="Metals";
    ItemList[34]={61,3076,3077,3078,93,104,236,2535,2537,2550,2571,21,22,234,2534,2536};
    ListName[35]="Components I";
    ItemList[35]={2525,2527,2528,2530,2541,2544,2548,2549,2561,2566,2567};
    ListName[36]="Components II";
    ItemList[36]={2570,2572,2573,2584,2585,2717,2738};
    ListName[37]="Tailoring";
    ItemList[37]={47,50,54,63,168,170,54,174,175,176,177,178,179,69,2547,2586};
    ListName[38]="Dyers";
    ItemList[38]={51,52,2055,2056,2057,2679,2681,2682};
    ListName[39]="Farming & Planting I";
    ItemList[39]={2,5,49,132,139,149,150,191,246,247,248,249,250,258,259,271};
    ListName[40]="Farming & Planting II";
    ItemList[40]={288,289,290,291,303,353,354,2490,2491,2492,2493,2494,2917};
    ListName[41]="Wood";
    ItemList[41]={3,12,298,314,2543,2560,2716,545,546};
    ListName[42]="Herbs I";
    ItemList[42]={132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149};
    ListName[43]="Herbs II";
    ItemList[43]={150,151,152,153,154,155,156,157,158,159,160,161,162,163};
    ListName[44]="Flowers";
    ItemList[44]={273,274,275,276,301,338,386,387,1782,1783,1790,1791};
    ListName[45]="Trees";
    ItemList[45]={11,14,125,203,299,300,308,309,1804,1807,1808,1809,1812,1813,1817,2169,2170};
    ListName[46]="Big Rocks";
    ItemList[46]={232,233,914,915,1245,1246,1247,1250,1251,1254,1257,1265,1266,1272,1273,1276,1278};
    ListName[47]="Caves & stairs";
    ItemList[47]={29,35,287,319,1003,2832};
    ListName[48]="Walls I";
    ItemList[48]={30,31,32,33,37,38,238,239,240,241,242,243,244,245,260,261,262,263};
    ListName[49]="Walls II";
    ItemList[49]={286,287,340,341,342,343,344,345,346,347,348,349,350,351,352};
    ListName[50]="Walls III";
    ItemList[50]={470,471,472,473,474,475,488,489,490,491,492,493,494,495};
    ListName[51]="Walls IV";
    ItemList[51]={907,908,909,918,919,921,1792,1793,1794,1795,1796,1797};
    ListName[52]="Doors I";
    ItemList[52]={86,87,317,318,476,477,478,479,480,481,482,483,484,485,486,487,496,497,499};
    ListName[53]="Doors II";
    ItemList[53]={900,901,902,903,904,905,906,920,922,923,924,925,926,927,928,929,930};
    ListName[54]="Wall Decoration";
    ItemList[54]={210,211,221,264,265,268,269,295,1914,1915,2905,2907,2908,3075};
    ListName[55]="Containers";
    ItemList[55]={8,97,1360,1361,1362,1367,2830};
    ListName[56]="Chairs";
    ItemList[56]={212,213,214,215,216,217,218,219,2875,2876,2877,2878,2913,2914,2915,2916};
    ListName[57]="Tables & Altars";
    ItemList[57]={36,320,550,551,2879,2880,2885,361,1879,1880,2801,2857,2872};
    ListName[58]="Static Tools";
    ItemList[58]={169,171,172,250,266,267,270,304,305,313,339,2052,2207,2835,2836};
    ListName[59]="Decoration";
    ItemList[59]={75,220,266,267,272,292,315,337,339,1911,1912,2038,2041,2079,2207,2805,2873,2874};
    ListName[60]="Post & Signs";
    ItemList[60]={2046,2069,2862,2863,2924,2925,2926,2927,3081,3082,3083,3084};
    ListName[61]="Other";
    ItemList[61]={173,228,316,1005,2529,2588,2937,2551,2552,2553,2554};
    ListName[62]="Druidensystem";
    ItemList[62]={164,165,166,167,328,329,330,331,1008,127,128,129,3104,3105,3111,3112,3113,3114};
end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Verwende die Kelle zum aufrufen der Funktionen (create items).", "Use the trowel to pick a function (create items).");
	base.lookat.SetSpecialName(Item, "Kelle", "Trowel");
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.METAL));
end
