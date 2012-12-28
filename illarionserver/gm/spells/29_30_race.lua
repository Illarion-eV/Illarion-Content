--GM-Runenkombi 29 + 30 / Rasse des Character verwandeln

require("gm.base.log")

module("gm.spells.29_30_race", package.seeall)

--[[
INSERT INTO spells VALUES (2^28 + 2^29,0,'gm.spells.29_30_race');
INSERT INTO spells VALUES (2^28 + 2^29,1,'gm.spells.29_30_race');
INSERT INTO spells VALUES (2^28 + 2^29,2,'gm.spells.29_30_race');
INSERT INTO spells VALUES (2^28 + 2^29,3,'gm.spells.29_30_race');
]]

function CastMagicOnCharacter(User, TargetCharacter, Counter, Param)
    local oldRace = TargetCharacter:increaseAttrib("racetype", 0);
    local a,b,value=string.find(User.lastSpokenText,"(%d+)");
    value = tonumber(value);
    TargetCharacter:setAttrib("racetyp",value); 
    gm.base.log.Write(User, User.name .. "(" .. User.id .. ") changed race of " .. TargetCharacter.name .. "(" .. TargetCharacter.id .. ") from " .. oldRace .. " to " .. value);
end;
