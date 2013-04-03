-- by Merung
require("development.renting")

module("development.renting", package.seeall)

-- renting system
-- here, I will script from time to time functions which we will need for a renting system


function initRenting()
    if buildingList == nil then
	    buildingList = {}
		buildingList["Cadomyr"] = {}
	end
    AddBuilding("Cadomyr","Cadomyr #1",5000,3,{138,604,0},"cadomyr flat 1")
end

function AddBuilding(town, adress, rent, rank, doorPos, area)
    buildingList[town][adress] = {}
	buildingList[town][adress]["rent"] = rent
	buildingList[town][adress]["rank"] = rank
	buildingList[town][adress]["doorPos"] = doorPos
	buildingList[town][adress]["area"] = area
end

function getTown(SourceItem)

    --if SourceItem.pos == position(952,767,5) then
	   -- return "Runewick"
	if SourceItem.pos == position(134,621,0) then
	    return "Cadomyr"
	--elseif SourceItem.pos == position(376,222,0) then
       -- return "Galmair"
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


