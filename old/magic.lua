require("base.common")
module("lte.magic", package.seeall)

---------------------------
---- Long time effect for each magic char
-----------------------------
function addEffect(magicEffect, Character)
    magicEffect:addValue("magicWater",50);
    magicEffect:addValue("magicFire",50);
--    magicEffect:addValue("magicAir",50);
--    magicEffect:addValue("magicEarth",50);
--    magicEffect:addValue("magicSpirit",50);
--    magicEffect:addValue("magicEvil",50);
end

-----------------------------------------------
---- Character is affected by the effect --
-------------------------------------------------
function callEffect(magicEffect, Character)    -- Effekt wird ausgeführt
return true;
end


function removeEffect( Effect, Character )

end

function loadEffect(Effect, Character)

end

