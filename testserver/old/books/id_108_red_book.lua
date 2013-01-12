require("base.books")
require("druid.content.amethyst")

module("item.book.id_108_red_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_108_red_book' WHERE com_itemid = 108;

function UseItem(User, SourceItem, TargetItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            druid.content.amethyst.loadBook(1);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        druid.content.amethyst.loadTitle(1);
    end
    base.books.GetBookItemInform(User,Item);
end
