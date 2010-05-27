require("base.books")
require("druids.content.emerald")

module("items.books.115_green_book", package.seeall)

-- UPDATE common SET com_script='items.books.115_green_book' WHERE com_itemid = 115;

function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            druids.content.emerald.loadBook(1);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        druids.content.emerald.loadTitle(1);
    end
    base.books.GetBookItemInform(User,Item);
end