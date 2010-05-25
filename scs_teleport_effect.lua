function DoEffect()
    if world:isItemOnField(position(-257,33,-25)) then
        local testItem = world:getItemOnField(position(-257,33,-25));
        if (testItem.id == 42) then
            world:gfx(5,position(-254,19,-25));
            world:gfx(5,position(-256,19,-25));
            world:gfx(5,position(-254,21,-25));
            world:gfx(5,position(-256,21,-25));
        end
    end
end