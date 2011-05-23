require("base.books")
require("content.books.cooking")

module("item.book.id_129_blue_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_129_blue_book' WHERE com_itemid = 129;

function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            content.books.cooking.loadBook(0);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        content.books.cooking.loadTitle(0);
    end
    base.books.GetBookItemInform(User,Item);
end
