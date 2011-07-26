-- UPDATE common SET com_script='item.id_97_leatherbag' WHERE com_itemid=97;

module("item.id_97_leatherbag", package.seeall)

BAG_LABEL_KEY = "bagLabel"
BAG_LABEL_COMMAND = "!bag"
MAX_LABEL_LENGTH = 100

function LookAtItem(User,Item)
    local description
    if User:getPlayerLanguage() == 0 then
        description = "Ledertasche"
    else
        description = "leather bag"
    end

    local bagLabel = Item:getData(BAG_LABEL_KEY)
    if bagLabel ~= "" then
        description = description .. " (" .. bagLabel .. ")" 
    end

    world:itemInform(User, Item, description)
end

function UseItem( User, Item, TargetItem, Counter, Param )
    local itemType = Item:getType()
    if (itemType == scriptItem.field)
    or (itemType == scriptItem.inventory)
    or (itemType == scriptItem.belt) then
        local lastText = User.lastSpokenText
        if lastText == "!bag" then
            Item:setData(BAG_LABEL_KEY, "")
            world:changeItem(Item)
            if User:getPlayerLanguage() == 0 then
                User:inform("Du entfernst die Beschriftung von der Ledertasche.")
            else
                User:inform("You tear off the leather bag's label.")
            end
        else
            local lastTextLength = string.len(lastText)
            local commandLength = string.len(BAG_LABEL_COMMAND) + 1
            if (string.sub(lastText, 1, commandLength) == BAG_LABEL_COMMAND .. " ")
            and (lastTextLength > commandLength) then
                local labelBeginIndex = commandLength + 1
                local maxInputLength = commandLength + MAX_LABEL_LENGTH
                local labelEndIndex = math.min(lastTextLength, maxInputLength)
                local label = string.sub(lastText, labelBeginIndex, labelEndIndex)
                Item:setData(BAG_LABEL_KEY, label)
                world:changeItem(Item);
                if User:getPlayerLanguage() == 0 then
                    User:inform("Du beschriftest die Ledertasche mit "..label..".")
                else
                    User:inform("You label the leather bag with "..label..".")
                end 
            end               
        end
    end
end
