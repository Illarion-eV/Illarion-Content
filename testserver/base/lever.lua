require("base.class")

module("base.lever", package.seeall)

Lever = base.class.class(function(lev, posi, twoState)    -- defines a class
    lev.pos = posi;                             -- this is the constructor!!!!
    lev.twoState = (twoState == true);          -- left-middle-right or just l-r
    lev.broken = false;                         -- broken lever? bring someone to repair!
    lev.minStrength = 0;                        -- need a strong man to handle stuff?
    lev.state, lev.type, lev.movingTo = lev:findType(posi);   
                                                -- state=0: zero position ("left"); 1=middle etc.
                                                -- movingTo: 0 moves from N->S/E->W, 1 other direction
                                                
 	lev.itemstruct = world:getItemOnField(posi);
 	if (lev.itemstruct~=nil) then
		lev.itemstruct.quality = 333; --defined quality to prevent "unfinished levers"
		world:changeItem(lev.itemstruct);
	end
end);

            -- here, we have all methods of the above class. enjoy!

function Lever:findType(lpos)                   -- returns leverstate, levertype, movingTo
    if (world:isItemOnField(lpos)==true) then
        leverItem=world:getItemOnField(lpos);
        itemid=leverItem.id;
        itemData=tonumber(leverItem:getData("leverMvTo"))
		if itemData == nil then 
		    itemData = 0
		end	
        mvTo=itemData;                          -- default: 0 (moves standard), else 1. Shouldn't happen, as the mapeditor can't set data, but who knows.
        if (itemid>=434 and itemid<=436) then   -- NS-lever
            if (itemid==436) then mvTo=1 end;   -- set moveTo;
            return itemid-434,1,mvTo;           -- 0: N, 1: m, 2: S; lever-type 1; movingTo: 0/1
        elseif (itemid>=437 and itemid<=439) then   -- WE-lever
            if (itemid==439) then mvTo=1 end;   -- set moveTo;
            return itemid-437,2,mvTo;           -- 0: E, 1: m, 2: W; lever-type 2; movingTo: 0/1
        else
            return -2,0,0;                      -- no lever item
        end
    else
        return -1,0,0;                          -- no item there
    end
end

function Lever:getPosition()                    -- do as the name says
    return self.pos;
end

function Lever:setMinStrength(str)              -- strengh needed to switch the lever
    self.minStrength=str;
    return str;
end

function Lever:switchLever(Char)                    -- switch the lever; return new state
    thisState, thisType, thisMovingTo = self:findType(self.pos);
    newMovingTo=0;
    if Char==nil then
        chrStr=self.minStrength+1;
    else
        chrStr=Char:increaseAttrib("strength",0);
    end
    if (self.broken~=true) then
        if (chrStr>=self.minStrength) then
            if (self.twoState~=true) then
                if ((thisState==0) or (thisState==2)) then  -- switch to m (3-state)
                    if (thisState==0) then 
                        newMovingTo=0;
                    else
                        newMovingTo=1;
                    end
                    newState=1;
                    newItemid=435+(self.type-1)*3;      -- this will be the new item-ID (middle pos)
                elseif (thisState==1) then              -- switch to one of the outer position
                    if (thisMovingTo==0) then           -- switch N-m-S or E-m-W
                        newState=2;
                        newMovingTo=1;
                        newItemid=436+(self.type-1)*3;
                    else                                -- switch S-m-N or W-m-E
                        newState=0;
                        newMovingTo=0;
                        newItemid=434+(self.type-1)*3;
                    end
                end
            else                                        -- only 2 states
                if (thisState==0) then                  -- switch N-S or E-W
                    newState=1;
                    newItemid=436+(self.type-1)*3;
                else                                    -- switch S-N or W-E
                    newState=0;
                    newItemid=434+(self.type-1)*3;
                end
            end
                                                        -- now actually perform the switching!
            leverItem=world:getItemOnField(self.pos);
            leverItem.id=newItemid;
            leverItem:setData("leverMvTo",newMovingTo)
            world:changeItem(leverItem);
                                                        -- loop through bindings?
            key=self.pos.x*1024*1024+self.pos.y*1024+self.pos.z;
            if (bindList[key]~=nil) then                -- look if there is an action at this lever
                for i, actionPair in ipairs(bindList[key]) do
                    if (actionPair[1]==newState) then    -- loop through actions and find out if...
                        actionPair[2]:execute();        -- ... state matches. Execute, if so.
                    end
                end
            end
        else

            return thisState;
        end
        
        return newState;
    else
        return -1;           -- broken!
    end 
end

function Lever:bind(levState, action)                       -- bind an action to a specific state
    if (bindList==nil) then 
        bindList={};
    end
    key=self.pos.x*1024*1024+self.pos.y*1024+self.pos.z;
    if (bindList[key]==nil) then
        bindList[key]={};
    end
    thisAction={levState,action};                           -- put everything into the list
    table.insert(bindList[key],thisAction);
end
