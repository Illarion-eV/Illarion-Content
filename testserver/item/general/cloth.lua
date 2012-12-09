require("base.lookat")

module("item.general.cloth", package.seeall)

-- Normal Items:
-- UPDATE common SET com_script='item.general.cloth' WHERE com_itemid IN (34,48,53,55,180,181,182,183,193,195,196,326,356,357,358,362,363,364,365,366,367,368,369,370,371,385,457,458,459,460,461,526,527,547,548,558,697,698,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,2295,2377,2378,2380,2384,2416,2418,2419,2420,2421);

-- Priest Items:
-- UPDATE common SET com_script='item.general.cloth' WHERE com_itemid IN ();

-- Weapons:
-- UPDATE common SET com_script='item.general.cloth' WHERE com_itemid IN (89);

function LookAtItem(user, item)
    world:itemInform(user, item, base.lookat.GenerateLookAt(user, item, base.lookat.CLOTH));
end;
