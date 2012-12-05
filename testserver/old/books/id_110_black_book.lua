-- BIG THIN BLACK BOOK

require("base.books")
require("content.books.guidingtruths")

module("item.book.id_110_black_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_110_black_book' WHERE com_itemid = 110;

function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            content.books.guidingtruths.loadBook(0);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        content.books.guidingtruths.loadTitle(0);
    end
    base.books.GetBookItemInform(User,Item);
end
