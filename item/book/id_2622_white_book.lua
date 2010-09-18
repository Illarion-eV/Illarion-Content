require("base.common");
module("item.book.id_2622_white_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2622_white_book' WHERE com_itemid = 2622;

function InitBook()
	if (Init == nil) then
		bookTitleDE = {}; -- The german title of the book.
		bookTitleEN = {}; -- The english title of the book.
		bookLanguage = {}; -- The ingame language skill name in which the book is written.
		bookminimumLanguage = {}; -- The minimum language skill needed to read that book.
		bookID = {}; -- The id of that book.
		
		-- Testbook (1)
		bookTitleDE[1] = "Das Buch der Priester Eldans";
		bookTitleEN[1] = "Book of the priests of Eldan";	
		bookLanguage[1] = "common language";			
		bookMinimumLanguage[1] = 0;			
		bookID[1] = 1;
		
		Init = true;
	end
end

function UseItem(User, SourceItem, TargetItem, Counter, Param)
	InitBook();
	if (User:getSkill(bookLanguage[SourceItem.data]) >= bookMinimumLanguage) then
		User:sendBook(bookID[SourceItem.data]);
	else
		base.common.InformNLS(User, Item, 
			"Das Buch ist in einer Sprache geschrieben, von der du zu wenig Kenntnisse hast.",
			"The book is written in a language in what your knowledge is not advanced enough.");
	end
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.common.GetNLS(bookTitleDE[Item.data], bookTitleEN[Item.data]));
end