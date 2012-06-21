require("base.common")
require("base.doors")

module("item.doors", package.seeall)

-- UPDATE common SET com_script='item.doors' WHERE com_itemid IN (86, 87,927,317,476,477,478,479,499,900,901,902,484,485,924,923,668,669,660,661,684,685,664,665,670,666,671,667,662,686,663,687,715,714,712,713,497,922,925,926,480,481,482,483,903,904,905,906,486,487,496,920,656,657,648,649,652,653,644,645,658,654,659,655,650,646,651,647,711,710,708,709);

function UseItem(User,SourceItem,TargetItem,counter,param)

    if base.doors.CloseDoor(SourceItem) then
	
	    if User.pos.z==100 or User.pos.z==101 then --On Noobia: Doors must not be closed.
		
	        base.common.InformNLS(User,"Die Tür klemmt und kann nicht geschlossen werden.","The door is jammed and won't close.");
	        return; --bailing out
			
	    end --Noobia end
		
        base.common.InformNLS(User,"Du schließt die Tür.","You close the door.");

		else
		
        local OpenDoor,OpenOK=base.doors.OpenDoor(SourceItem);
		
        if OpenOK then
		
            base.common.InformNLS(User,"Du öffnest die Tür.","You open the door.");
			
        elseif OpenDoor then
		
            base.common.InformNLS(User,"Du versuchst die Tür zu öffnen, doch sie ist verschlossen.","You try to open the door, but the door is locked.");
			
        end
		
    end
	
end

function LookAtItem(User,Item)
    local DataVal=Item.data;
    if (specialnames==nil) then
        specialnames={};
        specialnames[4050]={"Seahorse","Seahorse"};
        specialnames[4051]={"Zimmer 1","Room 1"};
        specialnames[4052]={"Zimmer 2","Room 2"};
        specialnames[4053]={"Badezimmer","Bathroom"};
        specialnames[4054]={"Zimmer 3","Room 3"};
        specialnames[4040]={"Wohnhaus 1 - Silas Farron","residential house 1 - Sillas Farron"};
        specialnames[4080]={"Garons Goldschmiede","Garons goldsmith workshop"};
        specialnames[5014]={"Graue Zuflucht","Grey Refuge"}
        specialnames[5015]={"Kerker","Cells"}
        specialnames[7100]={"Greenbriar Taverne","Greenbriar Taverne"};
        specialnames[7101]={"Greenbriar 1","Greenbriar 1"};
        specialnames[7102]={"Greenbriar 2","Greenbriar 2"};
        specialnames[7103]={"Greenbriar 3","Greenbriar 3"};
        specialnames[1060]={"Varshikar 1","Varshikar 1"};
        specialnames[1061]={"Varshikar 2","Varshikar 2"};
        specialnames[1062]={"Varshikar 3","Varshikar 3"};
        specialnames[1063]={"Varshikar 4","Varshikar 4"};
        specialnames[1064]={"Varshikar 5","Varshikar 5"};
        specialnames[1065]={"Varshikar 6","Varshikar 6"};
        specialnames[1066]={"Varshikar 7","Varshikar 7"};
    end
    local lang=User:getPlayerLanguage();
    if (specialnames[DataVal]~=nil) then
        if (lang==0) then
            world:itemInform(User,Item,world:getItemName(Item.id,0).." \""..specialnames[DataVal][1].."\"");
        else
            world:itemInform(User,Item,world:getItemName(Item.id,1).." \""..specialnames[DataVal][2].."\"");
        end
    else
        if (lang==0) then
            world:itemInform(User,Item,world:getItemName(Item.id,0));
        else
            world:itemInform(User,Item,world:getItemName(Item.id,1));
        end
    end
end
