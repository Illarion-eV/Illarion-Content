require("base.common")

module("base.doors", package.seeall)

OpenDoors = {};
ClosedDoors = {};

--[[
    AddToDoorList
    This is a helper function to fill the door list. It is removed after the initialisation.
    @param integer - the ID of the opened door of a opened closed door pair
    @param integer - the ID of the closed door of a opened closed door pair
]]
function AddToDoorList(openedID, closedID)
    OpenDoors[openedID] = closedID;
    ClosedDoors[closedID] = openedID;
end;

AddToDoorList(86, 497);
AddToDoorList(87, 922);
AddToDoorList(927, 925);
AddToDoorList(317, 926);
AddToDoorList(476, 480);
AddToDoorList(477, 481);
AddToDoorList(478, 482);
AddToDoorList(479, 483);
AddToDoorList(499, 903);
AddToDoorList(900, 904);
AddToDoorList(901, 905);
AddToDoorList(902, 906);
AddToDoorList(484, 486);
AddToDoorList(485, 487);
AddToDoorList(924, 496);
AddToDoorList(923, 920);
AddToDoorList(668, 656);
AddToDoorList(669, 657);
AddToDoorList(660, 648);
AddToDoorList(661, 649);
AddToDoorList(684, 652);
AddToDoorList(685, 653);
AddToDoorList(664, 644);
AddToDoorList(665, 645);
AddToDoorList(666, 654);
AddToDoorList(670, 658);
AddToDoorList(671, 659);
AddToDoorList(667, 655);
AddToDoorList(662, 650);
AddToDoorList(686, 646);
AddToDoorList(663, 651);
AddToDoorList(687, 647);
AddToDoorList(715, 711);
AddToDoorList(714, 710);
AddToDoorList(712, 708);
AddToDoorList(713, 709);
AddToDoorList(865, 861);
AddToDoorList(866, 862);
AddToDoorList(867, 863);
AddToDoorList(868, 864);
AddToDoorList(944, 943);
AddToDoorList(946, 945);
AddToDoorList(948, 947);
AddToDoorList(950, 949);
AddToDoorList(1112, 1108);
AddToDoorList(1113, 1109);
AddToDoorList(1114, 1110);
AddToDoorList(1115, 1111);
AddToDoorList(3168, 3164);
AddToDoorList(3169, 3165);
AddToDoorList(3170, 3166);
AddToDoorList(3171, 3167);
AddToDoorList(3228, 3224);
AddToDoorList(3229, 3225);
AddToDoorList(3230, 3226);
AddToDoorList(3231, 3227);
AddToDoorList(3234, 3232);
AddToDoorList(3235, 3233);
AddToDoorList(3238, 3236);
AddToDoorList(3239, 3237);
AddToDoorList(3318, 3314);
AddToDoorList(3319, 3315);
AddToDoorList(3320, 3316);
AddToDoorList(3321, 3317);
AddToDoorList(3481, 3477);
AddToDoorList(3482, 3478);
AddToDoorList(3483, 3479);
AddToDoorList(3484, 3480);
AddToDoorList(3489, 3485);
AddToDoorList(3490, 3486);
AddToDoorList(3491, 3487);
AddToDoorList(3492, 3488);
AddToDoorList(3284, 3200);
AddToDoorList(3285, 3201);
AddToDoorList(3202, 3282);
AddToDoorList(3203, 3283);

AddToDoorList = nil;

--[[
    GetDoorItem
    Check if there is a item that is a door at a specified location and
    get the item struct of this item.
    @param PositionStruct - the position that shall be searched
    @return ItemStruct - the door item that was found or nil
]]
function GetDoorItem(Posi)
    local items = base.common.GetItemsOnField(Posi);
    for _, item in pairs(items) do
        if (OpenDoors[item.id] or ClosedDoors[item.id]) then
            return item;
        end;
    end;
    return nil;
end;

--[[
    CheckOpenDoor
    Check if this a item ID is a opened door.
    @param integer - the ID of the item that shall be checked
    @return boolean - true in case the item is a opened door, else false
]]
function CheckOpenDoor(DoorID)
    return (OpenDoors[DoorID] ~= nil);
end;

--[[
    CheckClosedDoor
    Check if this a item ID is a closed door.
    @param integer - the ID of the item that shall be checked
    @return boolean - true in case the item is a closed door, else false
]]
function CheckClosedDoor(DoorID)
    return (ClosedDoors[DoorID] ~= nil);
end;

--[[
    CloseDoor
    Close a opened door item by swapping the item.
    @param ItemStruct - the door item that shall be turned to a closed door
    @ewruen boolean - true in case the door got closed, false if something went
        wrong
]]
function CloseDoor(Door)
    if OpenDoors[Door.id] then
        world:swap(Door, OpenDoors[Door.id], 233);
        world:makeSound(21, Door.pos);
        return true;
    end;
    return false;
end;

--[[
    OpenDoor
    Open a closed door item by swapping the item. That function performs the
    check if the door is unlocked or has no lock and only opens the door in this
    case.
    @param ItemStruct - the door item that shall be turned to a opened door
    @return boolean, boolean - the first return value is true in case the door
        item was found and it wound be possible to open it, the second value is
        true in case the door really got opened and false if it was locked
]]
function OpenDoor(Door)
    if ClosedDoors[Door.id] then
        if Door:getData("lockId") == "" or Door:getData("doorLock")=="unlocked" then
            world:swap(Door, ClosedDoors[Door.id], 233);
            world:makeSound(21, Door.pos);
            return true, true;
        end
        return true, false;
    end
    return false, false;
end
