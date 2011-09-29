-- creates a maze

function createWaterCaveMaze()
    local maze = {};
    for x=-26,0 do
        maze[x]={}
        for y=168,200 do
            maze[x][y]=true;
        end
    end
    local curr = { x = math.random( 13 )*2 - 27, y = math.random( 16 )*2 + 167 };
    maze[curr.x][curr.y] = false;
    local stack = {}; local top = -1;
    local visited = 1;
    while visited < 208 do
        local newnb = {};
        local n = 0;
        if curr.x >= -23 then
            if (maze[curr.x-1][curr.y]==true) and (maze[curr.x-3][curr.y]==true) and
               (maze[curr.x-2][curr.y+1]==true) and (maze[curr.x-2][curr.y-1]==true) then
                n = n + 1;
                newnb[n] = {x = curr.x-2, y = curr.y, xs=1, ys=0};
            end;
        end;
        if curr.x <= -3 then
            if (maze[curr.x+1][curr.y]==true) and (maze[curr.x+3][curr.y]==true) and
               (maze[curr.x+2][curr.y+1]==true) and (maze[curr.x+2][curr.y-1]==true) then
                n = n + 1;
                newnb[n] = {x = curr.x+2, y = curr.y, xs=-1, ys=0};
            end;
        end;
        if curr.y >= 171 then
            if (maze[curr.x][curr.y-1]==true) and (maze[curr.x][curr.y-3]==true) and
               (maze[curr.x-1][curr.y-2]==true) and (maze[curr.x+1][curr.y-2]==true) then
                n = n + 1;
                newnb[n] = {x = curr.x, y = curr.y-2, xs=0, ys=1};
            end;
        end;
        if curr.x <= 197  then
            if (maze[curr.x][curr.y+1]==true) and (maze[curr.x][curr.y+3]==true) and
               (maze[curr.x-1][curr.y+2]==true) and (maze[curr.x+1][curr.y+2]==true) then
                n = n + 1;
                newnb[n] = {x = curr.x, y = curr.y+2, xs=0, ys=-1};
            end;
        end;
        if n > 0 then
            local i = math.random( n );
            maze[newnb[i].x+newnb[i].xs][newnb[i].y+newnb[i].ys] = false;
            top = top + 1;
            stack[top] = {x=curr.x, y=curr.y};
            curr.x = newnb[i].x;
            curr.y = newnb[i].y;
            maze[curr.x][curr.y] = false;
            visited = visited + 1;
        else
            curr.x = stack[top].x;
            curr.y = stack[top].y;
            top = top - 1;
        end; 
    end
    for x=-25,-1 do
        for y=169,199 do
            local isItem = world:isItemOnField(position(x, y, -7));
            if isItem ~= maze[x][y] then
                if maze[x][y] then
                    world:createItemFromId( 287, 1, position( x, y, -7), true, 333, 0);
                else
                    if world:isItemOnField( position( x, y, -7) ) then
                        world:erase( world:getItemOnField( position( x, y, -7 ) ), 1 );
                    end;
                end;
            end;
        end;
    end;
end
