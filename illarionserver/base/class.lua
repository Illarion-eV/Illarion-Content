--- Base Script: Class
--
-- The use of this script is to offer a generic class implementation that allows
-- to use the object orientated programming in a easy way.
-- Using this class its possible to extend other classes by new ones and
-- checking the class of a object.
--
-- The concept for this script is taken from lua-users.
--
-- This script requires Lua 5.1
--
-- @release 1.1
-- @author http://lua-users.org/

module("base.class", package.seeall)

--- Create a new class.
-- This function creates and returns a new class. It allows the usage of a
-- initialization function and a base class that is extended by the new class.
-- <br><br>
-- @param base the base class that is extended by the new class or the
--      initialization function in case no base class is needed
-- @param init the initialization function in case a base class is set. In case
--      its left nil there is no initialization function used
-- <br><br>
-- @usage Create any new classes using this function. The most basic functions
--      for classes will be implemented by default then.<br>
--      newClass = class(function(obj, a) obj.test = a; end);<br>
--      New object are created then using:<br>
--      newObject = newClass(10);<br>
--      That will result in: newObject.test == 10<br>
--      <br>
--      To create a class with another class as super class it will work this
--      way:<br>
--      newClass2 = class(newClass, function(obj, a, b)<br>
--          newClass:init(obj, a);<br>
--          obj.test2 = b;<br>
--      end);<br>
--      Creating a new object works then using:<br>
--      newObject2 = newClass2(10, 20);<br>
--      This will result in newObject2.test == 10 and newObject.test2 == 20<br>
--      <br>
--      Checking the class of a object works using the is_a function. See the
--      following examples:<br>
--      newObject:is_a(newClass) == true<br>
--      newObject:is_a(newClass2) == false<br>
--      newObject2:is_a(newClass) == true<br>
--      newObject2:is_a(newClass2) == true<br>
-- <br>
-- @return the newly created class
function class(base, init)
    local c = {}    -- a new class instance
    if not init and type(base) == 'function' then
        init = base;
        base = nil;
    elseif type(base) == 'table' then
        -- our new class is a shallow copy of the base class!
        for i, v in pairs(base) do
            c[i] = v;
        end;
        c._base = base;
    end;
    -- the class will be the metatable for all its objects,
    -- and they will look up their methods in it.
    c.__index = c;

    -- expose a constructor which can be called by <classname>(<args>)
    local mt = {};
    mt.__call = function(class_tbl, ...)
        local obj = {};
        setmetatable(obj,c);
        if init then
            init(obj,...);
        else 
            -- make sure that any stuff from the base class is initialized!
            if base and base.init then
                base.init(obj, ...);
            end;
        end;
        return obj;
    end;
    
    c.init = init;
    c.is_a = __default_is_a;
    
    setmetatable(c, mt);
    return c;
end;

--- This is a support function that is used as is_a function in each created
-- class. Its only needed to store this outside the class function to avoid that
-- it is created new for each class. That is done to save some memory.<br>
-- <br>
-- @param self the object this function is called for
-- @param klass the class the object is compared with
-- <br><br>
-- @return true in case the object is a instance of the class, false if not
function __default_is_a(self, klass)
    local m = getmetatable(self);
    while m do 
        if m == klass then
            return true;
        end;
        m = m._base;
    end;
    return false;
end;
