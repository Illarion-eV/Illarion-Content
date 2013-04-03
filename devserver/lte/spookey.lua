require("base.common")
module("lte.spookey", package.seeall)

---------------------------
---- Spook starts --
-----------------------------
function addEffect(spookeyEffect, Character)         -- Smell starts
    --base.common.InformNLS(Character,
    --"Du fühlst dich etwas unwohl.",
    --"You feel a little sickish.");
	CharRace=Character:getRace()
    spookeyEffect:addValue("OriginalRace",CharRace);
end


-----------------------------------------------
---- Character is affected by the smell he got. --
-------------------------------------------------
function callEffect(spookeyEffect, Character)    -- Effect wird ausgeführt
    spookeyEffect.nextCalled =math.random(3000,6000);       -- call it again in 300-600 seconds

    return true;
end


function removeEffect( Effect, Character )
    --base.common.InformNLS(Character,
    --"Du fühlst dich endlich wieder besser.",
    --"You finally feel better now.");
end

function loadEffect(Effect, Character)

end

