function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    if User.id ~= 64 then
        User:inform("e-Vil says: You are not allowed to use this!");
        return;
    end;
    world:createDynamicNPC("Test1",50,position(User.pos.x-1,User.pos.y,User.pos.z),0,"I_9_vilarion.lua");
    world:createDynamicNPC("Test2",1,position(User.pos.x+1,User.pos.y,User.pos.z),0,"I_9_vilarion.lua");
end

function useNPC(User,counter,param)
    User:inform("Name: " .. thisNPC.name .. ", Id: " .. thisNPC.id);
end
