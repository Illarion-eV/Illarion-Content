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
-- UPDATE items SET itm_script = 'item.id_917_cursedshield' WHERE itm_id = 917;

local common = require("base.common")
local metal = require("item.general.metal")
local lookat = require("base.lookat")
local checks = require("item.general.checks")

module("item.id_917_cursedshield", package.seeall, package.seeall(item.general.metal))


function MoveItemBeforeMove( User, SourceItem, TargetItem )

	if TargetItem:getType() == 4 then --inventory, not belt

		return checks.checkLevel(User,SourceItem);

	else

		-- if shield was purified, then no possibility of curse
		if ( tonumber(SourceItem:getData("cursedShield")) == 1 ) then return true; end;

		-- if the shield is cursed, make it impossible to unequip
		if ( tonumber(SourceItem:getData("cursedShield")) == 2 ) and ( ( SourceItem.itempos == 5 ) or ( SourceItem.itempos == 6 ) ) then

			-- if successfully removed
			if ( math.random( 2000 ) <= User:increaseAttrib( "willpower", 0 ) * 4 ) then
				common.InformNLS( User, "Mit deinem starken Willen und Ausdauer schaffst du es, das verfluchte Schild von deiner Hand zu lösen.", "With a strong will and perseverance, you manage to detach the cursed shield from your hand." )
				return true;
			end;

			-- else unable to remove shield

			common.InformNLS( User, "Eine dunkle Energie scheint dich daran zu hindern das Schild loszulassen.", "Some kind of dark energy seems to prohibit you from releasing the shield." );
			return false;
		end;

    end;

    return true;
end;

function MoveItemAfterMove( User, SourceItem, TargetItem )
    -- if shield equipped in hands
    if ( TargetItem.itempos == 5 ) or ( TargetItem.pos == 6 )then
        -- if curse gets in effect
        local curseChance = math.random( 5 + User:increaseAttrib( "essence", 0 ) + math.floor( User:getSkill(Character.magicResistance) / 5 ) );
        -- if shield curse had already been effected, but user managed to remove it
        if ( tonumber(SourceItem:getData("cursedShield")) == 2 ) then curseChance = 1; end;

        if ( curseChance == 1 ) then
            TargetItem:setData("cursedShield",2);
            world:changeItem( TargetItem );
            common.InformNLS( User, "Eine plötzliche dunkle Energie strömt aus dem Schild und scheint deine Hand zu packen.", "A sudden dark energy emenates from the shield and seems to clutch to your hand." );
            return true;
        end;
    end;

    return true;
end;

function LookAtItem(User,Item)
    return metal.LookAtItem(User,Item)
end
