require("base.books")
require("content.books.history")
require("content.books.magestones")

module("item.book.id_116_grey_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_116_grey_book' WHERE com_itemid = 116;

function UseItem(User, SourceItem, TargetItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            content.books.history.loadBook(0);
            content.books.magestones.loadBook(1);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        content.books.history.loadTitle(0);
        content.books.magestones.loadTitle(1);
    end
    base.books.GetBookItemInform(User,Item);
end
