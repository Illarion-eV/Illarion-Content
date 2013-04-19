-- Basic functions for walking of characters

module("npc.base.walking", package.seeall)

blocked = {};
last_dir = {};
blocking_items = {8,11,14,30,31,32,33,37,38,93,99,100,203,232,233,238,239,240,241,242,243,244,245,250,260,261,262,263,266,267,270,272,275,276,286,287,299,300,301,304,305,308,313,318,321,339,340,341,342,343,344,345,346,347,348,349,350,351,352,361,382,384,386,387,470,471,472,473,474,475,480,481,482,483,486,487,488,489,490,491,492,493,494,495,496,497,500,501,502,503,504,506,507,508,509,510,511,512,514,515,516,517,518,519,520,521,586,600,613,622,623,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,672,673,674,675,676,677,678,679,680,681,682,683,688,689,690,691,700,701,702,703,704,705,706,707,708,709,710,711,716,717,718,719,720,721,722,723,853,854,855,856,857,858,859,860,861,862,863,864,869,870,871,872,873,874,875,876,903,904,905,906,907,908,909,914,915,918,919,920,921,922,925,926,1005,1245,1246,1250,1251,1254,1257,1273,1276,1278,1367,1792,1793,1794,1795,1796,1797,1804,1807,1808,1809,1812,1813,1817,2207,2805,2830,3081,3082,3083,3084,3085,3086,3087,3088,3089,3090,3091,3092,3097,3098,3099,3100,3104,3105,3106,3107,3108};
passable_items = {42,601,602,603,604,605,606,607,608,609,610,611,612,615,616,618,619,620,621};

function BW_OneStepToPosition( Character, TargetPos )
    local XOff = Character.pos.x - TargetPos.x;
    local YOff = Character.pos.y - TargetPos.y;
    if ((math.abs(XOff) < math.abs(YOff)) and not blocked) or ((math.abs(XOff) > math.abs(YOff)) and blocked[Character.id]) then
        if not BW_intern_MoveX(Character,XOff,false) then
            if not BW_intern_MoveY(Character,YOff,false) then
                BW_intern_MoveX(Character,XOff,true);
                blocked[Character.id] = true;
            else
                blocked[Character.id] = false;
            end
        else
            blocked[Character.id] = false;
        end
    else
        if not BW_intern_MoveY(Character,YOff,false) then
            if not BW_intern_MoveX(Character,XOff,false) then
                BW_intern_MoveY(Character,YOff,true);
                blocked[Character.id] = true;
            else
                blocked[Character.id] = false;
            end
        else
            blocked[Character.id] = false;
        end
    end
end

function BW_StepAlongRoad( Character )
    local direct = Character:getFaceTo(  );
    local newpos;
    if (last_dir[Character.id] and math.random(0,1)==1) then
        if (last_dir[Character.id] == 1) then
            if (direct == 0) then
                direct = 2;
            else
                direct = 0;
            end
        elseif (last_dir[Character.id] == 3) then
            if (direct == 2) then
                direct = 4;
            else
                direct = 2;
            end
        elseif (last_dir[Character.id] == 5) then
            if (direct == 4) then
                direct = 6;
            else
                direct = 4;
            end
        elseif (last_dir[Character.id] == 7) then
            if (direct == 6) then
                direct = 0;
            else
                direct = 6;
            end
        end
    end
    
    if (direct == 0) then
        newpos = position( Character.pos.x, Character.pos.y - 1, Character.pos.z );
    elseif (direct == 4) then
        newpos = position( Character.pos.x, Character.pos.y + 1, Character.pos.z );
    elseif (direct == 2) then
        newpos = position( Character.pos.x + 1, Character.pos.y, Character.pos.z );
    elseif (direct == 6) then
        newpos = position( Character.pos.x - 1, Character.pos.y, Character.pos.z );
    end
    
    if BW_intern_pos_okay( newpos ) then
        Character:move( direct, true );
        return;
    end
    
    if not last_dir[Character.id] then
        last_dir[Character.id] = direct;
        if (direct == 0) or (direct == 4) then
            direct = math.floor(math.random(0,1))*4+2;
        else
            direct = math.floor(math.random(0,1))*4;
        end
        if (last_dir[Character.id]==0 and direct==2) or (last_dir[Character.id]==2 and direct==0) then
            last_dir[Character.id] = 1;
        elseif (last_dir[Character.id]==2 and direct==4) or (last_dir[Character.id]==4 and direct==2) then
            last_dir[Character.id] = 3;
        elseif (last_dir[Character.id]==4 and direct==6) or (last_dir[Character.id]==6 and direct==4) then
            last_dir[Character.id] = 5;
        elseif (last_dir[Character.id]==6 and direct==0) or (last_dir[Character.id]==0 and direct==6) then
            last_dir[Character.id] = 7;
        end
    else
        if (last_dir[Character.id] == 1) then
            if (direct == 0) then
                direct = 2;
            else
                direct = 0;
            end
        elseif (last_dir[Character.id] == 3) then
            if (direct == 4) then
                direct = 2;
            else
                direct = 4;
            end
        elseif (last_dir[Character.id] == 5) then
            if (direct == 4) then
                direct = 6;
            else
                direct = 4;
            end
        elseif (last_dir[Character.id] == 7) then
            if (direct == 0) then
                direct = 6;
            else
                direct = 0;
            end
        else
            if (direct == 0) or (direct == 4) then
                direct = math.floor(math.random(0,1))*4+2;
            else
                direct = math.floor(math.random(0,1))*4;
            end
        end
    end
    
    if (direct == 0) then
        newpos = position( Character.pos.x, Character.pos.y - 1, Character.pos.z );
    elseif (direct == 4) then
        newpos = position( Character.pos.x, Character.pos.y + 1, Character.pos.z );
    elseif (direct == 2) then
        newpos = position( Character.pos.x + 1, Character.pos.y, Character.pos.z );
    elseif (direct == 6) then
        newpos = position( Character.pos.x - 1, Character.pos.y, Character.pos.z );
    end
    
    if BW_intern_pos_okay( newpos ) then
        Character:move( direct, true );
        return;
    end
    
    direct = Character:getFaceTo(  );
    
    if (last_dir[Character.id] == 1) then
        if (direct==0) then
            direct = 6;
            last_dir[Character.id] = 7;
        elseif (direct==2) then
            direct = 4;
            last_dir[Character.id] = 3;
        end
    elseif (last_dir[Character.id] == 3) then
        if (direct==2) then
            direct = 0;
            last_dir[Character.id] = 1;
        elseif (direct==4) then
            direct = 6;
            last_dir[Character.id] = 5;
        end
    elseif (last_dir[Character.id] == 5) then
        if (direct==4) then
            direct = 2;
            last_dir[Character.id] = 3;
        elseif (direct==6) then
            direct = 0;
            last_dir[Character.id] = 7;
        end
    elseif (last_dir[Character.id] == 7) then
        if (direct==0) then
            direct = 2;
            last_dir[Character.id] = 1;
        elseif (direct==6) then
            direct = 4;
            last_dir[Character.id] = 3;
        end
    else
        if (direct == 0) or (direct == 4) then
            direct = math.floor(math.random(0,1))*4+2;
        else
            direct = math.floor(math.random(0,1))*4;
        end
    end
    
    if (direct == 0) then
        newpos = position( Character.pos.x, Character.pos.y + 1, Character.pos.z );
    elseif (direct == 4) then
        newpos = position( Character.pos.x, Character.pos.y - 1, Character.pos.z );
    elseif (direct == 2) then
        newpos = position( Character.pos.x - 1, Character.pos.y, Character.pos.z );
    elseif (direct == 6) then
        newpos = position( Character.pos.x + 1, Character.pos.y, Character.pos.z );
    end
    
    if BW_intern_pos_okay( newpos ) then
        Character:move( direct, true );
        return;
    end
    
    direct = Character:getFaceTo(  );
    if (direct == 0) then
        direct = 4;
        if (last_dir[Character.id] == 1) then
            last_dir[Character.id] = 3;
        elseif (last_dir[Character.id] == 7) then
            last_dir[Character.id] = 5;
        end
        newpos = position( Character.pos.x, Character.pos.y + 1, Character.pos.z );
    elseif (direct == 4) then
        direct = 0;
        if (last_dir[Character.id] == 3) then
            last_dir[Character.id] = 1;
        elseif (last_dir[Character.id] == 5) then
            last_dir[Character.id] = 7;
        end
        newpos = position( Character.pos.x, Character.pos.y - 1, Character.pos.z );
    elseif (direct == 2) then
        direct = 6;
        if (last_dir[Character.id] == 1) then
            last_dir[Character.id] = 7;
        elseif (last_dir[Character.id] == 3) then
            last_dir[Character.id] = 5;
        end
        newpos = position( Character.pos.x - 1, Character.pos.y, Character.pos.z );
    elseif (direct == 6) then
        direct = 2;
        if (last_dir[Character.id] == 7) then
            last_dir[Character.id] = 1;
        elseif (last_dir[Character.id] == 5) then
            last_dir[Character.id] = 3;
        end
        newpos = position( Character.pos.x + 1, Character.pos.y, Character.pos.z );
    end
    
    if BW_intern_pos_okay( newpos ) then
        Character:move( direct, true );
        return;
    end
end

function BW_intern_MoveX(Character,XOff,forced)
    if (XOff == 0) and not forced then
        return false;
    end
    
    local old_pos = Character.pos;
    if (XOff > 0) then
        Character:move(6,true);
    else
        Character:move(2,true);
    end
    if (old_pos == Character.pos) then
        if forced and (XOff == 0) then
            Character:move(6,true);
            if not (old_pos == Character.pos) then
                return true;
            end
        end
        return false;
    else
        return true;
    end
end

function BW_intern_MoveY(Character,YOff,forced)
    if (YOff == 0) and not forced then
        return false;
    end
    
    local old_pos = Character.pos;
    if (YOff > 0) then
        Character:move(0,true);
    else
        Character:move(4,true);
    end
    if (old_pos == Character.pos) then
        if forced and (YOff == 0) then
            Character:move(0,true);
            if not (old_pos == Character.pos) then
                return true;
            end
        end
        return false;
    else
        return true;
    end
end

function BW_intern_IDinList( id , lower, upper, list )
    if lower > upper then
        return false;
    end;
    margin = math.floor((lower+upper)/2);
    if list[margin] == id then
        return true;
    elseif list[margin] < id then
        return BW_intern_IDinList( id, margin+1, upper, list );
    else
        return BW_intern_IDinList( id, lower, margin-1, list );
    end;
end

function BW_intern_pos_okay( posi )
    if world:isCharacterOnField( posi ) then
        return false;
    end
    
    if world:getField(posi):tile() == 7 then
        if world:isItemOnField( posi ) then
            local Itemid = world:getItemOnField( posi ).id;
            if BW_intern_IDinList( Itemid, 1, table.getn( blocking_items ), blocking_items ) then
                return false;
            end
        end
    else
        if not world:isItemOnField( posi ) then
            return false;
        end
        
        local Itemid = world:getItemOnField( posi ).id;
        if not BW_intern_IDinList( Itemid, 1, table.getn( passable_items ), passable_items ) then
            return false;
        end
    end
    
    return true;
end
