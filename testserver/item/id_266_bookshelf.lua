-- UPDATE common SET com_script='item.id_266_bookshelf' WHERE com_itemid IN (266, 267);

require("base.common")

module("item.id_266_bookshelf", package.seeall)

ALCHEMY = 0
CRAFTING = 1
FAIRYTALES = 2

function addBook(id, germanTitle, englishTitle)
    books = books or {}
    books[id] = {german = germanTitle, english = englishTitle}
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

addBookshelf(position(10, 10, 0), {CRAFTING, FAIRYTALES})
addBookshelf(position(7, 7, 0), {CRAFTING})


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
            
        end
    end
end

function getBookshelf(pos)
    return bookshelves and bookshelves[pos.x] and bookshelves[pos.x][pos.y] and bookshelves[pos.x][pos.y][pos.z]
end
