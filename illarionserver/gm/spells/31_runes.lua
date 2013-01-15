-- GM Rune 31 /1073741824 /
require("gm.base.log")

module("gm.spells.31_runes", package.seeall)

--[[
INSERT INTO spells VALUES (2^30,0,'gm.spells.31_runes');
INSERT INTO spells VALUES (2^30,1,'gm.spells.31_runes');
INSERT INTO spells VALUES (2^30,2,'gm.spells.31_runes');
INSERT INTO spells VALUES (2^30,3,'gm.spells.31_runes');
]]

function CastMagic(User)
    local magictype = User:getMagicType()
    for i = 1,32 do
        User:teachMagic(magictype,i-1)
    end;
    gm.base.log.Write(User, User.name .. "(" .. User.id .. ") gave himself all runes.");
end;
