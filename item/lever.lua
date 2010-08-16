require("base.common")
require("base.lever")
require("handler.deleteitem")
require("handler.lockdoor")
require("handler.unlockdoor")
require("handler.opendoor")
require("handler.closedoor")
require("handler.createitem")
require("handler.createbridge")
require("handler.deletebridge")
require("handler.settile")
require("handler.createeffect")
require("handler.createsound")
require("handler.sendmessage")
require("handler.movelever")

require("quest.leverRiddleA")       -- controlls the behaviour of the levers
require("quest.leverquest")         -- main class for the whole quest

module("item.lever", package.seeall)

-- UPDATE common SET com_script='item.lever' WHERE com_itemid IN (434, 435, 436, 437, 438, 439);

function init()
    leverList={};
    --[[myLev1 = base.lever.Lever(position(124,637,0),true);
    myLev2 = base.lever.Lever(position(125,637,0),false);
    myLev1:bind(0,handler.movelever.moveLever(myLev2));
    testlever = base.lever.Lever(position(119,637,0),true);
    testlever2 = base.lever.Lever(position(120,637,0),true);
      ]]--

    -- THIS IS THE DOCUMENTATION FOR FAL-FAL'S LEVER QUEST
    -- IT IS DONE WITH OOP LUA CODING, WHICH MIGHT BE CONFUSING AT A FIRST SIGHT
    -- BUT TURNS OUT TO BE RATHER SIMPLE AND FOLLOWS A CLEAR CONCEPT.
  
    questA=quest.leverquest.LeverQuest();   -- at the first execution, create an object of that class.
                                            -- The LeverQuest class holds all the information that is unique for
                                            -- the LeverQuest, such as the position of the levers, the condition
                                            -- when it is sucessfully finished and the actual state of the
                                            -- pressed levers.
                                            -- We just need it here to get the positions of the levers. No need
                                            -- to use the same instance as inside the levers (where we do need just
                                            -- one instance, otherwise we would compile several different
                                            -- QuestStrings...)
    
    riddleLever1 = base.lever.Lever(questA.levPos1,true);       -- initialize the lever positions with the usual
    riddleLever2 = base.lever.Lever(questA.levPos2,true);       -- Lever-initialization. Use the positions as
    riddleLever3 = base.lever.Lever(questA.levPos3,true);       -- stored in the LeverQuest class
    riddleLever4 = base.lever.Lever(questA.levPos4,true);
    riddleLever5 = base.lever.Lever(questA.levPos5,true);
        
    riddleLever1:bind(1,quest.leverRiddleA.LeverRiddleAClass("1"));     -- bind the action that is executed when moving
    riddleLever2:bind(1,quest.leverRiddleA.LeverRiddleAClass("2"));     -- a lever and set the string that should be
    riddleLever3:bind(1,quest.leverRiddleA.LeverRiddleAClass("3"));     -- appended ("1",...). In the corresponding
    riddleLever4:bind(1,quest.leverRiddleA.LeverRiddleAClass("4"));     -- execute-function, this is appended to the
    riddleLever5:bind(1,quest.leverRiddleA.LeverRiddleAClass("5"));     -- questString.
    
    AddToLevers(riddleLever1);      -- Just add those levers to the list of levers...
    AddToLevers(riddleLever2);    
    AddToLevers(riddleLever3);
    AddToLevers(riddleLever4);
    AddToLevers(riddleLever5);
    
    --[[for x=117,119 do
        for y=632,636 do
            testlever2:bind(0,deleteItem(position(x,y,0),0));
        end
    end
    for x=117,118 do
        for y=637,639 do
            testlever2:bind(0,deleteItem(position(x,y,0),0));
        end
    end--]]
    --testlever:setMinStrength(200);
    --testlever:bind(2,deleteItem(position(119,635,0),2));
--[[    testlever:bind(1,handler.closedoor.closeDoor(position(119,639,0)));
    testlever:bind(1,handler.lockdoor.lockDoor(position(119,639,0)));
    testlever:bind(1,handler.deleteitem.deleteItem(position(118,639,0),2));
    --testlever:bind(1,deleteBridge(position(117,635,0)));
    --testlever:bind(1,deleteBridge(position(113,636,0))); -- geht
    --testlever:bind(1,deleteBridge(position(118,635,0))); --geht nicht
    --testlever:bind(1,deleteBridge(position(117,640,0))); -- geht
    
    testlever:bind(0,handler.unlockdoor.unlockDoor(position(119,639,0)));
    testlever:bind(0,handler.opendoor.openDoor(position(119,639,0)));
    --testlever:bind(0,handler.createbridge.createBridge(position(117,635,0),0,4));
    --testlever:bind(0,createBridge(position(113,636,0),1,4)); -- geht
    --testlever:bind(0,createBridge(position(118,635,0),2,4)); -- geht
    --testlever:bind(0,createBridge(position(117,640,0),3,4)); -- geht
    testlever:bind(0,handler.createitem.createItem(position(118,639,0),2,333,0,1));
    AddToLevers(testlever);
    AddToLevers(testlever2);
    AddToLevers(myLev1);
    AddToLevers(myLev2);
    ]]--
    

	 
end

function generateKey(posX,posY,posZ)
    return posX*1024*1024+posY*1024+posZ;
end

function UseItem (User,SourceItem,TargetItem,counter,param,ltstate)
    User:inform("debug1");
   -- if (initi==nil) then
   --     myLevers=init();
   --     User:inform("initialize");
   --     initi=1;
   -- end
   -- User:inform("debug2");
   -- key=SourceItem.pos.x*1024*1024+SourceItem.pos.y*1024+SourceItem.pos.z;
   -- if leverList[key]~=nil then
   --     leverList[key]:switchLever(User);
   -- else
   --     User:inform("Does not work!");
   -- end
end

--function LookAtItem(User, Item)
    
--end

function AddToLevers(myLever)
    if (world:isItemOnField(myLever.pos)==true) then    -- item on field?
        itemID=world:getItemOnField(myLever.pos).id;
        if (itemID>=434 and itemID<=439) then           -- is item a lever?
            key=myLever.pos.x*1024*1024+myLever.pos.y*1024+myLever.pos.z;
            leverList[key]=myLever;                     -- calculate unique key
            return 1;                                   -- put into list and return 1
        else
            return -2;                                  -- item is no lever
        end
    else
        return -1;                                      -- no item there
    end
end