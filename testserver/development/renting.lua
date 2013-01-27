-- by Merung
require("development.renting")

module("development.renting", package.seeall)

-- renting system
-- here, I will script from time to time functions which we will need for a renting system


function getTown(SourceItem)

    if SourceItem.pos == position(952,767,5) then
	    return "Runewick"
	elseif SourceItem.pos == position(137,542,0) then
	    return "Cadomyr"
	elseif SourceItem.pos == position(376,222,0) then
        return "Galmair"
    end		
	return false
end

-- using: open pell id 3109
function UseItem(User, SourceItem)

	if (SourceItem:getType()~=3) then -- no map item
	    return
	end

	local town = getTown(SourceItem)
	if town == false then
	    return
	else
	    SelectFlat( User, SourceItem)
	end	
end

function SelectFlat(User, SourceItem)


end


