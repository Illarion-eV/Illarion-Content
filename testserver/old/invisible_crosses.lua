module("scheduled.invisible_crosses", package.seeall)

function InvisibleCross()
    local ListPos = 0;
    local makeCircle = false
    repeat
        ListPos = ListPos + 1;
        listfine,posi,lineGFX,rescureGFX,randGFX = CrossPositions(ListPos);
        if not listfine then break; end
        players = world:getPlayersInRangeOf(posi,4);
        makeCircle = false;
        if (table.getn(players)>0) then
            for i, player in pairs(players) do
                if (player:increaseAttrib("hitpoints",0) == 0) then
                    makeCircle = true;                  
                    
                    world:gfx(rescureGFX,player.pos);
                    
                    player:increaseAttrib("hitpoints",1); -- Da lebt er wieder
                    if (player:increaseAttrib("foodlevel",0) < 10000) then
                        player:increaseAttrib("foodlevel",-(player:increaseAttrib("foodlevel",0)-10000))
                    end
                    player:setPoisonValue(0);
                    langSkill = player:getSkill(Character.commonLanguage);
                    if ((langSkill > 0) and (langSkill < 100 )) then
                        player:increaseSkill(1,Character.commonLanguage,100-langSkill);
                    end
                    SkillName = LangSkillName(player:getRace());
                    langSkill = player:getSkill(SkillName);
                    if ((langSkill > 0) and (langSkill < 100 )) then
                        player:increaseSkill(1,SkillName,100-langSkill);
                    end
                    fndRes, resEffect = player.effects:find(400);      -- was he just resurrected?
                    if not fndRes then                                  -- if not...
                        player.effects:addEffect( LongTimeEffect(400,1) );     -- add effect (400) to resurrected player
                    else            -- if he has the effect already...
                        player.effects:removeEffect( resEffect );    -- reset it!
                        player.effects:addEffect( LongTimeEffect(400,1) );
                    end
                end
            end
            if makeCircle then
                CreateCircle(lineGFX,posi,4);
            elseif ((math.random(1,5) == 1) and (randGFX ~= 0)) then                
                world:gfx(randGFX,position(posi.x+math.random(-2,2),posi.y+math.random(-2,2),posi.z));
            end            
        end
    until (false)
end
        
        
function CrossPositions(ListID)
    if (ListID == 1) then     return true,position(-249,  41,-25), 9,44, 0; -- Obsidian Temple
    elseif (ListID == 2) then return true,position( 295,-341, -6),32,45, 0; -- Northerot
    elseif (ListID == 3) then return true,position( -26,-213, -3),46,31, 0; -- Grey Rose
    elseif (ListID == 4) then return true,position(-366,-474,  0),52,31,46; -- Northmark
    end
    return false;
end  

function CreateCircle(GFXid,CenterPos,Radius)
    if (GFXid == 0) then
        return
    end
    local irad = math.ceil(Radius);
    local dim = 2*(irad+1);
    local x;
    local y;
    local map = {} ;        
    for x = -irad-1, irad do
        map[x] = {};
        for y = -irad-1, irad do
            map[x][y] = (x+0.5)*(x+0.5)+(y+0.5)*(y+0.5)-irad*irad > 0
        end;
    end;
    
    for x = -irad, irad do
        for y = -irad, irad do
            if not( map[x][y] and  map[x-1][y] and map[x][y-1] and map[x-1][y-1] )
               and( map[x][y] or   map[x-1][y] or  map[x][y-1] or  map[x-1][y-1] ) then
                world:gfx(GFXid,position( CenterPos.x + x, CenterPos.y + y, CenterPos.z ));
            end
        end
    end
end  

function LangSkillName(Race)
    if (Race == 0) then return Character.humanLanguage;
    elseif (Race == 1) then return Character.dwarfLanguage
    elseif (Race == 2) then return Character.halflingLanguage
    elseif (Race == 3) then return Character.elfLanguage
    elseif (Race == 4) then return Character.orcLanguage
    elseif (Race == 5) then return Character.lizardLanguage
    end
end
