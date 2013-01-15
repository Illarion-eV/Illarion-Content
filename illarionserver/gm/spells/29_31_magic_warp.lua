-- GM Runenkombination 29 + 31 / 1342177280 / 
-- User Magieskills setzen

require("gm.base.log")

module("gm.spells.29_31_magic_warp", package.seeall)

--[[
INSERT INTO spells VALUES (2^28 + 2^30,0,'gm.spells.29_31_magic_warp');
INSERT INTO spells VALUES (2^28 + 2^30,1,'gm.spells.29_31_magic_warp');
INSERT INTO spells VALUES (2^28 + 2^30,2,'gm.spells.29_31_magic_warp');
INSERT INTO spells VALUES (2^28 + 2^30,3,'gm.spells.29_31_magic_warp');
]]

function CastMagic(User)
		
	wert = 10
    magtyp = User:getMagicType()

    -- MAGIER
    if ( magtyp == 0 ) then
        User:increaseSkill(3,"pervestigatio", wert)
        User:increaseSkill(3,"desicio", wert)
        User:increaseSkill(3,"transformo", wert)
        User:increaseSkill(3,"commotio", wert)
        User:increaseSkill(3,"transfreto", wert)
        gm.base.log.Write(User, User.name .. "(" .. User.id .. ") gave himself magic skills.");
    end

    -- PRIESTER
    --  if ( magtyp == 1 ) then
    --    -- Prim&auml;rskills
    --    User:increaseSkill(7,"spirit", wert)
    --    User:increaseSkill(7,"soul", wert)
    --    -- Terti&auml;rskills
    --    User:increaseSkill(7,"sacrificium", wert)
    --    User:increaseSkill(7,"oraculum", wert)
    --    User:increaseSkill(7,"optestatio", wert)
    --    User:increaseSkill(7,"tranfreto", wert)
    --    User:increaseSkill(7,"genese", wert)
    --    User:increaseSkill(7,"vaticinari", wert)
    --  end
    --
    --  -- BARDE
    --  if ( magtyp == 2 ) then
    --    -- Prim&auml;rskills
    --    User:increaseSkill(8,"air", wert)
    --    User:increaseSkill(8,"aura", wert)
    --    -- Terti&auml;rskills
    --    User:increaseSkill(8,"veneficium", wert)
    --    User:increaseSkill(8,"salutaris", wert)
    --    User:increaseSkill(8,"exsecratio", wert)
    --    User:increaseSkill(8,"commotio", wert)
    --    User:increaseSkill(8,"vaticinari", wert)
    --  end
    --
    --  -- DRUIDE
    --  if ( magtyp == 3 ) then
    --    -- Prim&auml;rskills
    --    User:increaseSkill(6,"nature", wert)
    --    User:increaseSkill(6,"earth", wert)
    --    -- Terti&auml;rskills
    --    User:increaseSkill(6,"pharmacia", wert)
    --    User:increaseSkill(6,"pervestigatio", wert)
    --    User:increaseSkill(6,"salutaris", wert)
    --    User:increaseSkill(6,"transformo", wert)
    --    User:increaseSkill(6,"veneficium", wert)
    --    User:increaseSkill(6,"exsecratio", wert)
    --  end

end

-- Selbst auf ein Feld in Sichtweite warpen
function CastMagicOnField(User,Pos)
    User:warp(Pos);
end
