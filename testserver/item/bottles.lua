-- empty container with drink

-- UPDATE common SET com_script='item.bottles' WHERE com_itemid IN (2500, 2496, 2497, 2501, 2499);

-- uses items of the new client - don't put this on the RS yet!
require("base.common")

module("item.bottles", package.seeall)

function InitDrinks()  -- initialisiert die coolen softdrinks in da hood.
    if ( drinkList == nil) then
        -- nameDE, nameEN, leftover item, { {empty target container, filled target container}, ...}
        drinkList={};
        drinkList[2500] = {  "Weinflasche", "bottle of wine", 2498,
        {{1858, 1860}, {224, 1857}, {2055, 2057}, {1840, 1842}, {2185, 2187}} };  -- Kelch, Goldkelch, Glas, Kupferkelch, Holzbecher

        drinkList[2496] = {  "Wasserflasche", "bottle of water", 2498,
        { {1858, 1855}, {224, 1854}, {2055, 2058},{1840, 1841}, {2185, 2186} } };

        drinkList[2497] = {  "Metflasche", "bottle of mead", 2498,
        { {1858, 1853}, {224, 1856}, {2055, 2056},{1840, 1843}, {2185, 2188} } };

        drinkList[2501] = {  "Bierflasche", "bottle of dark beer", 2498,
        { {1908, 1909} } };             -- Krug

        drinkList[2499] = {  "Ciderflasche", "bottle of cider", 2498,
        { {1858, 1859}, {224, 1861},{2055, 2059},{1840, 1844}, {2185, 2189} } };
		
		drinkList[1319] = {  "Rumflasche", "bottle of rum", 1317, nil};

        -- init descriptions
        BottleQualDe={"randvolle ","volle ","halbvolle ","fast leere "};
        BottleQualEn={"brimfull ", "full ","half full ","almost empty "};

        BottleQualLm={8,6,3,1};
    end
end



function UseItem(User,SourceItem,TargetItem,Counter,Param)

    if firstcall==nil then
        InitDrinks();
        firstcall=1;
    end

    local progress = User:getQuestProgress(1);

    local food = drinkList[ SourceItem.id ];
    if (food ~= nil ) then

        local TargetItem = base.common.GetTargetItem(User, SourceItem);
        if( TargetItem ) then
            for i, combo in pairs(food[4]) do
                if combo[1] == TargetItem.id then
					-- fill drink
					if (TargetItem.number > 1) then
						world:erase( TargetItem, 1 );
						User:createItem( combo[2], 1, 333,nil);
					else
						TargetItem.id = combo[2];
						world:changeItem(TargetItem);
					end
					world:makeSound(10,User.pos)

					-- create leftovers
					if( SourceItem.quality > 199 ) then
						-- reduce one portion
						world:changeQuality( SourceItem, -100 );
					else
						if( math.random( 50 ) <= 1 ) then
							base.common.InformNLS( User,
							"Die leere Flasche ist angeschlagen und unbrauchbar.",
							"The empty bottle is broken and no longer usable.");
							world:erase(SourceItem,1);
						else
							SourceItem.id = food[3];
							SourceItem.quality = 333;
							world:changeItem(SourceItem);
						end
					end

                    -- cancel after one found item
                    break;
                end -- found item
            end -- search loop
        else
            base.common.InformNLS( User,
                "Nimm die Flasche und ein Trinkgefäß in deine Hände.",
                "Take the bottle and a drinking vessel in your hands.");
        end
    else
        User:inform("unkown bottle item ");
    end
end


function LookAtItem(User, Item)
    local lookAt = base.lookat.GenerateLookAt(User, Item)

    if firstcall==nil then
        InitDrinks();
        firstcall=1;
    end

    local food = drinkList[ Item.id ];
    if food == nil then
        User:inform("unkown bottle item ");
        return
    end

    -- decode item quality, extract duration
    local itemDura=math.mod(Item.quality,100);
    local itemQual=(Item.quality-itemDura)/100;
    --User:inform("portions "..itemQual);

	-- build description

    local DisplayText="";

    -- build quality text
    for i,qualLimit in pairs(BottleQualLm) do
        if (itemQual>=qualLimit ) then
            DisplayText = base.common.GetNLS( User, BottleQualDe[i], BottleQualEn[i] );
            break;
        end
    end
        
    DisplayText = DisplayText..base.common.GetNLS( User, food[1], food[2] );
    lookAt.description = DisplayText

    world:itemInform(User, Item, lookAt)
end
