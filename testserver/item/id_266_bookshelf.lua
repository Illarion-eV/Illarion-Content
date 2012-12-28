-- UPDATE common SET com_script='item.id_266_bookshelf' WHERE com_itemid IN (266, 267);

require("base.common")

module("item.id_266_bookshelf", package.seeall)

ALCHEMY = 0
CRAFTING = 1
FAIRYTALES = 2

GODS1 = 10
GODS2 = 11
GODS3 = 12

function addBook(id, germanTitle, englishTitle, bookItemId)
    books = books or {}
    books[id] = {["german"] = germanTitle, ["english"] = englishTitle, ["itemId"] = ((bookItemId~=nil) and bookItemId or 116) }
end

function addBookshelf(pos, containedBooks)
    bookshelves = bookshelves or {}
    bookshelves[pos.x] = bookshelves[pos.x] or {}
    bookshelves[pos.x][pos.y] = bookshelves[pos.x][pos.y] or {}
    bookshelves[pos.x][pos.y][pos.z] = {}
    local bookshelf = bookshelves[pos.x][pos.y][pos.z]

    for i=1, #containedBooks do
        table.insert(bookshelf, containedBooks[i])
    end
end

addBook(ALCHEMY, "Alchemie", "Alchemy")
addBook(CRAFTING, "Handwerk", "Crafting")
addBook(FAIRYTALES, "Märchen", "Fairy Tales")
addBook(GODS1, "Götterkunde", "Lore of the Gods", 111)
addBook(GODS2, "Illarions Götterwelt", "Gods of Illarion", 113)
addBook(GODS3, "Götterkunde", "Lore of the Gods", 3114)

addBookshelf(position(10, 10, 0), {CRAFTING, FAIRYTALES})
addBookshelf(position(7, 7, 0), {CRAFTING})
addBookshelf(position(897, 833, 1), {GODS1, GODS2, GODS3})


function LookAtItem(user, item)
    local lookAt = base.lookat.GenerateLookAt(user, item)
    
    if item:getType() == scriptItem.field then 
        local pos = item.pos
        local bookshelf = getBookshelf(pos)

        if bookshelf then
            local bookCount = #bookshelf

            if bookCount == 0 then
                lookAt.description = base.common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
            elseif bookCount == 1 then
                lookAt.description = base.common.GetNLS(user, "Hier steht ein einzelnes Buch:", "There is one single book:")
                lookAt.description = lookAt.description .. "\n" .. base.common.GetNLS(user, books[bookshelf[1]].german, books[bookshelf[1]].english) 
            else
                lookAt.description = base.common.GetNLS(user, "Hier stehen " .. bookCount .. " Bücher:", "There are " .. bookCount .. " books here:")
                
                for i=1, bookCount do
                    lookAt.description = lookAt.description .. "\n" .. base.common.GetNLS(user, books[bookshelf[i]].german, books[bookshelf[i]].english)
                end
            end
        else
            lookAt.description = base.common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
        end
    end

    world:itemInform(user, item, lookAt)
end

function UseItem(user, item, target, counter, param, ltstate)
    if item:getType() ~= scriptItem.field then
        return
    end

    local pos = item.pos
    local bookshelf = getBookshelf(pos)

    if bookshelf then
        local bookCount = #bookshelf
        
        if bookCount == 1 then
            user:sendBook(bookshelf[1])
        elseif bookCount > 1 then
            local callback = function(dialog)
                local success = dialog:getSuccess()

                if success and isUserNextTo(user, pos) then
                    local selected = dialog:getSelectedIndex() + 1
                    user:sendBook(bookshelf[selected])
                end
            end
            
            local title = base.common.GetNLS(user, "Bücherregal", "Bookshelf")
            local description = base.common.GetNLS(user, "Welches Buch möchtest du lesen?", "Which book do you want to read?")
            local dialog = SelectionDialog(title, description, callback)
            
            for i=1, bookCount do
				local book = books[bookshelf[i]];
                dialog:addOption(book.itemId, base.common.GetNLS(user, book.german, book.english))
            end
            
            user:requestSelectionDialog(dialog)
        end
    end
end

function getBookshelf(pos)
    return bookshelves and bookshelves[pos.x] and bookshelves[pos.x][pos.y] and bookshelves[pos.x][pos.y][pos.z]
end

function isUserNextTo(user, pos)
    return user.pos.z == pos.z and math.max(math.abs(user.pos.x - pos.x), math.abs(user.pos.y - pos.y)) <= 1
end
