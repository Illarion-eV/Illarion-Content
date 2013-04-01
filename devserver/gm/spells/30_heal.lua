-- GM Rune 30 / 536870912 / Vollst&auml;ndige Heilung eines Characters

require("gm.base.log")

module("gm.spells.30_heal", package.seeall)

--[[
INSERT INTO spells VALUES (2^29,0,'gm.spells.30_heal');
INSERT INTO spells VALUES (2^29,1,'gm.spells.30_heal');
INSERT INTO spells VALUES (2^29,2,'gm.spells.30_heal');
INSERT INTO spells VALUES (2^29,3,'gm.spells.30_heal');
]]
function CastMagicOnCharacter(Caster,TargetCharacter)
    while (TargetCharacter:increaseAttrib("hitpoints", 0) < 10000) do
        TargetCharacter:increaseAttrib("hitpoints", 10000);
    end;
    
    while (TargetCharacter:increaseAttrib("mana", 0) < 10000) do
        TargetCharacter:increaseAttrib("mana", 10000);
    end;
    
    while (TargetCharacter:increaseAttrib("foodlevel", 0) < 60000) do
        TargetCharacter:increaseAttrib("foodlevel", 10000);
    end;
    
    while (TargetCharacter:getPoisonValue() > 0) do
        TargetCharacter:increasePoisonValue(-10000);
    end;
    
    gm.base.log.Write(User, User.name .. "(" .. User.id .. ") healed " .. TargetCharacter.name .. "(" .. TargetCharacter.id .. ")");
end
