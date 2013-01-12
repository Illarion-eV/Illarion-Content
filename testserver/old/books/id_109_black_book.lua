require("base.books")
require("druid.content.druids")

module("item.book.id_109_black_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_109_black_book' WHERE com_itemid = 109;

function UseItem(User, SourceItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            druid.content.druid.loadBook(0);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        druid.content.druid.loadTitle(0);
    end
    base.books.GetBookItemInform(User,Item);
end
