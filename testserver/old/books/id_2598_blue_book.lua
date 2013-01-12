require("base.books")
require("content.books.cakebible")
require("content.books.dwarfpoems")
require("content.books.culturegoblins")

module("item.book.id_2598_blue_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2598_blue_book' WHERE com_itemid = 2598;

function UseItem(User, SourceItem, TargetItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            content.books.cakebible.loadBook(0);
            content.books.dwarfpoems.loadBook(1);
            content.books.culturegoblins.loadBook(2);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        content.books.cakebible.loadTitle(0);
        content.books.dwarfpoems.loadTitle(1);
        content.books.culturegoblins.loadTitle(2);
    end
    base.books.GetBookItemInform(User,Item);
end
