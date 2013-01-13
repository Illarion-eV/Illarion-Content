-- GM Rune 29 - Instant kill

require("gm.base.log")

module("gm.spells.29_kill", package.seeall)

--[[
INSERT INTO spells VALUES (2^28,0,'gm.spells.29_kill');
INSERT INTO spells VALUES (2^28,1,'gm.spells.29_kill');
INSERT INTO spells VALUES (2^28,2,'gm.spells.29_kill');
INSERT INTO spells VALUES (2^28,3,'gm.spells.29_kill');
]]

function CastMagicOnCharacter(Caster, TargetCharacter)
	TargetCharacter:increaseAttrib("hitpoints",-32767);
	gm.base.log.Write(User, User.name .. "(" .. User.id .. ") killed " .. TargetCharacter.name .. "(" .. TargetCharacter.id .. ")");
end;
