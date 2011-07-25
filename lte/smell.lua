require("base.common")
module("lte.smell", package.seeall)

---------------------------
---- Character begins to smell --
-----------------------------
function addEffect(stinkEffect, Character)         -- Smell starts
    --base.common.InformNLS(Character,
    --"Du fühlst dich etwas unwohl.",
    --"You feel a little sickish.");
  --  stinkEffect:addValue("stinkIndex",1); disabled
end


-----------------------------------------------
---- Character is affected by the smell he got. --
-------------------------------------------------
function callEffect(stinkEffect, Character)    -- Effect wird ausgeführt
   -- Character:inform("callEffect 1");
    found,stinkIndex_n = stinkEffect:findValue("stinkIndex");    -- get the strength of the effect
    if found then
        npcs = world:getNPCSInRangeOf(Character.pos,2);
        for i, npc in pairs(npcs) do
	    if npc:getRace() == 37 then
	       stinkIndex_n=stinkIndex_n+1;
	    end   
	end
    end
    stinkEffect.nextCalled =math.random(300,600);       -- call it again in 300-600 seconds
    --Character:inform("callEffect 2");
    --Character:inform("SI: "..stinkIndex_n);
    stinkEffect:addValue("stinkIndex",stinkIndex_n);
    --Character:inform("callEffect 3");
    if ((stinkIndex_n>10) and (stinkIndex_n<20)) then
        Character:talkLanguage(Character.say,Player.german ,"#me müffelt leicht nach Kuh.");
        Character:talkLanguage(Character.say,Player.english,"#me smells a bit of cow.");
    elseif ((stinkIndex_n>=20) and (stinkIndex_n<30)) then
        Character:talkLanguage(Character.say,Player.german ,"#me riecht dezent nach Kuh.");
	      Character:talkLanguage(Character.say,Player.english,"#me smells decently of cow.");
    elseif ((stinkIndex_n>=30) and (stinkIndex_n<40)) then
        Character:talkLanguage(Character.say,Player.german ,"#me riecht deutlich nach Kuhmist.");
	      Character:talkLanguage(Character.say,Player.english,"#me smells noticeably of cow dung.");
    elseif ((stinkIndex_n>=40) and (stinkIndex_n<50)) then
        Character:talkLanguage(Character.say,Player.german ,"#me stinkt regelrecht nach Kuh.");
        Character:talkLanguage(Character.say,Player.english,"#me stinks a lot of cow.");
    elseif stinkIndex_n>=50 then
        Character:talkLanguage(Character.say,Player.german ,"#me stinkt bestialisch nach Kuhmist.");
        Character:talkLanguage(Character.say,Player.english,"#me stinks terribly of cow dung.");
    end

    return true;
end


function removeEffect( Effect, Character )
    --LogString=os.date()..": Patient "..Character.name.."completely healed because the cold ended.\n";
    --logToFile(LogString);
    --base.common.InformNLS(Character,
    --"Du fühlst dich endlich wieder besser.",
    --"You finally feel better now.");
end

function loadEffect(Effect, Character)

end

