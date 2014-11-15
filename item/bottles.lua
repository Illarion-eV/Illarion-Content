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

-- UPDATE items SET itm_script='item.bottles' WHERE itm_id IN (2500, 2496, 2497, 2501, 2499);

local common = require("base.common")
local lookat = require("base.lookat")
local evilrock = require("triggerfield.evilrock")

local M = {}

function InitDrinks()
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

        -- init descriptions
        BottleQualDe={"Randvolle ","Volle ","Halbvolle ","Fast leere "};
        BottleQualEn={"Brimfull ", "Full ","Half full ","Almost empty "};

        BottleQualLm={8,6,3,1};
    end
end



function M.UseItem(User, SourceItem)

    if firstcall==nil then
        InitDrinks();
        firstcall=1;
    end

    local progress = User:getQuestProgress(1);

    local food = drinkList[ SourceItem.id ];
    if (food ~= nil ) then
	Evilrockentrance(User, SourceItem, ltstate)
	local TargetItem = common.GetTargetItem(User, SourceItem);
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
							common.InformNLS( User,
							"Die leere Flasche ist angeschlagen und unbrauchbar.",
							"The empty bottle is broken and no longer usable.");
						else
							local dataCopy = {descriptionDe=SourceItem:getData("descriptionDe"), descriptionEn=SourceItem:getData("descriptionEn")};
							local notCreated = User:createItem( food[3], 1, 333, dataCopy); -- create the remnant item
							if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
								world:createItemFromId(food[3], notCreated, User.pos, true, 333, dataCopy);
								common.HighInformNLS(User, "Du kannst nichts mehr halten.", "You can't carry any more.");
							end
						end
						world:erase(SourceItem,1);
					end

                    -- cancel after one found item
                    break;
                end -- found item
            end -- search loop
        else
            common.InformNLS( User,
                "Nimm die Flasche und ein Trinkgefäß in deine Hände.",
                "Take the bottle and a drinking vessel in your hands.");
        end
    else
        --User:inform("unkown bottle item ");
    end
end


function M.LookAtItem(User, Item)
    local lookAt = lookat.GenerateLookAt(User, Item)

    if firstcall==nil then
        InitDrinks();
        firstcall=1;
    end

    local food = drinkList[ Item.id ];
    if food == nil then
        return lookAt
    end

    -- decode item quality, extract duration
    local itemDura=math.fmod(Item.quality,100);
    local itemQual=(Item.quality-itemDura)/100;
    --User:inform("portions "..itemQual);

	-- build description

    local DisplayText="";

    -- build quality text
    for i,qualLimit in pairs(BottleQualLm) do
        if (itemQual>=qualLimit ) then
            DisplayText = common.GetNLS( User, BottleQualDe[i], BottleQualEn[i] );
            break;
        end
    end

    DisplayText = DisplayText..common.GetNLS( User, food[1], food[2] );
	if lookAt.description ~= nil then -- append the label
		DisplayText = DisplayText..". "..lookAt.description;
	end
    lookAt.description = DisplayText

    return lookAt
end



function Evilrockentrance(User, SourceItem, ltstate)
  local checkBucket = world:getItemOnField(position(997,199,2))
  if checkBucket.id == 51 and SourceItem.id == 2496 then
	local foundSource
	-- check for empty bucket
	TargetItem = common.GetItemInArea(User.pos, 51);
	if (TargetItem ~= nil) then
		common.TurnTo( User, position(997,199,2) ); -- turn if necessary
		foundSource=true
	end


	if not foundSource then
	-- nothing found to fill the bucket.
	common.InformNLS(User,"Du solltest schon einen anderen Eimer zum Umfüllen haben.","You should have another container to transfer the water.");
	return
	end

	if ( ltstate == Action.none ) then
		User:startAction( 20, 21, 5, 10, 25);
		User:talk(Character.say, "#me beginnt den Eimer zu befüllen.", "#me starts to fill bucket.")
		return
	end

	world:swap(checkBucket,52,999)
--[[		local checkFullBucket = world:getItemOnField(position(997,199,3))
		if checkFullBucket.id == 52 then
			checkFullBucket.wear=255
			world:changeItem(checkFullBucket)
		end ]]
	evilrock.RemoveEntranceTrap(User)


	local notCreated = User:createItem( 2498, 1, 999, nil ); -- create the new produced items
	if SourceItem.number == 1 then
		world:erase(SourceItem,1)
		return
	end
  end
end


return M

