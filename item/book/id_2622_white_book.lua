-- BIG HEAVY WHITE BOOK WITH BLACK SIGN

require("base.books")

module("item.book.id_2622_white_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2622_white_book' WHERE com_itemid = 2622;

function UseItem(User, SourceItem, TargetItem, Counter, Param)
	User:sendBook(0); -- testbook
end