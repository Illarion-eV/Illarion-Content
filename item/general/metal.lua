require("base.lookat")

module("item.general.metal", package.seeall)

-- UPDATE common SET com_script='item.general.metal' WHERE com_itemid IN (4,7,16,18,19,20,94,95,96,101,184,185,186,187,202,324,325,916,2111,2112,2113,2114,2116,2117,2172,2284,2286,2287,2290,2291,2302,2303,2363,2364,2365,2367,2369,2388,2389,2390,2393,2395,2399,2400,2402,2403,2407,2439,2441,2444,2495,2526,2542,2562,2563,2564,2565,2568,2569,2647,2707,2709,2710,2711,2746);

function LookAtItem(User,Item)
    -- edit by abcfantasy
    if ( Item.id == 2389 ) and ( Item.data == 16 ) then
        it = string.gsub( base.lookat.GetItemDescription(User,Item,1,false,false ), "salkamaerian armour", "knight's armour" );
        world:itemInform(User,Item,it);
    else
    -- end edit
	
        world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,1,false,false ));
    end;
end
