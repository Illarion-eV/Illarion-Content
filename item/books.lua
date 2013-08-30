require("base.common");
require("item.id_266_bookshelf")
module("item.books", package.seeall)

-- UPDATE common SET com_script='item.books' WHERE com_itemid = 2622;

-- 2622 is the alchemy book. dont use it otherwise.

function InitBook()
	--[[ -- needs a check
	if (Init == nil) then
		bookTitleDE = {}; -- The german title of the book.
		bookTitleEN = {}; -- The english title of the book.
		bookLanguage = {}; -- The ingame language skill name in which the book is written.
		bookminimumLanguage = {}; -- The minimum language skill needed to read that book.
		
		-- Book of the priests of Eldan (1)
		bookTitleDE[1] = "Das Buch der Priester Eldans";
		bookTitleEN[1] = "Book of the priests of Eldan";	
		bookLanguage[1] = Character.commonLanguage;			
		bookMinimumLanguage[1] = 0;			
		
		Init = true;
	end]]
end

function UseItem(User, SourceItem)
	InitBook();
    -- alchemy book; DO NOT CHANGE! STARTER PACK RELEVANT!
	if SourceItem.id == 2622 then
	    User:sendBook(101)
	end	
	-- alchemy end
	if SourceItem:getData("bookId")~="" then
		local bookId =tonumber( SourceItem:getData("bookId"))
		if bookId == nil then
			return
		end
		
		User:sendBook(bookdId)
	end
	
	-- old data! 
	--[[	if (User:getSkill(bookLanguage[SourceItem.data]) >= bookMinimumLanguage) then
		User:sendBook(SourceItem.data);
	else
		base.common.InformNLS(User, Item, 
			"Das Buch ist in einer Sprache geschrieben, von der du zu wenig Kenntnisse hast.",
			"The book is written in a language in what your knowledge is not advanced enough.");
	end]]
end

function LookAtItem(User,Item)
    if Item:getData("bookId")~="" then
		local bookId =tonumber( Item:getData("bookId"))
		if item.id_266_bookshelf.books[bookId] ~= nil then
			base.lookat.SetSpecialName(Item,item.id_266_bookshelf.books[bookId].german,item.id_266_bookshelf.books[bookId].english)
		end
	end
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
end   