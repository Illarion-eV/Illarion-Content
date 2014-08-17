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
require("base.common")
require("base.factions")
require("alchemy.teaching.transformation_dog")
require("item.id_266_bookshelf")

module("item.id_3110_scroll", package.seeall)

-- UPDATE common SET com_script = 'item.id_3110_scroll' WHERE com_itemid = 3110;

function LookAtItem(User,Item)
    if Item:getData("bookId") ~= "" then
		local bookId = tonumber(Item:getData("bookId"))
		if bookId ~= nil then
			if item.id_266_bookshelf.books[bookId] ~= nil then
				base.lookat.SetSpecialName(Item, item.id_266_bookshelf.books[bookId].german, item.id_266_bookshelf.books[bookId].english)
			end
		end
	end
	return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
end

function UseItem(User, SourceItem, ltstate)

	if SourceItem:getData("teachDogTransformationPotion") == "true" then
		alchemy.teaching.transformation_dog.UseSealedScroll(User, SourceItem)
		return
	end

	if SourceItem:getData("bookId") ~= "" then
		local bookId = tonumber(SourceItem:getData("bookId"))
		if bookId == nil then
			return
		end
		if item.id_266_bookshelf.books[bookId] ~= nil then
			User:sendBook(bookId)
		end
		return
	end

	-- teleport character on use
		local destCoordX = tonumber(SourceItem:getData("destinationCoordsX"))
		local destCoordY = tonumber(SourceItem:getData("destinationCoordsY"))
		local destCoordZ = tonumber(SourceItem:getData("destinationCoordsZ"))
		if destCoordX and destCoordY and destCoordZ then
			User:talk(Character.say, "#me öffnet eine Schriftrolle und verschwindet in einem hellen Leuchten.","#me opens a scroll and disappears in a bright light.")
			world:gfx(31,User.pos)
			world:gfx(41,User.pos)
			User:warp(position(destCoordX,destCoordY,destCoordZ))
			world:gfx(41,User.pos)
			world:erase(SourceItem,1)
			return
		end
end
