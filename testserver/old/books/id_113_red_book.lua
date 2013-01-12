require("base.books")
require("content.books.spinning")

module("item.book.id_113_red_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_113_red_book' WHERE com_itemid = 113;

function UseItem(User, SourceItem, TargetItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            content.books.spinning.loadBook(0);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        content.books.spinning.loadTitle(0);
    end
    base.books.GetBookItemInform(User,Item);
end
