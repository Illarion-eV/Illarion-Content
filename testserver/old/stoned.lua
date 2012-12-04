require("base.common")
module("lte.stoned", package.seeall)

---------------------------
------ Character starts to smoke
-------------------------------
function addEffect(stonedEffect, Character)       
    --Character:inform("AddEffect ausgeführt");
    --stonedEffect:addValue("stonedIndex",1);
    --stonedEffect:addValue("clearIndex",1);
end

-----------------------------------------------
------ Character is affected 
-----------------------------------------------
function callEffect(stonedEffect, Character)    -- Effect wird ausgeführt

    if (Character:increaseAttrib("sex",0) == 0) then
        gText = "seine";
        eText = "his";
        eTextm = "him";
    else
        gText = "ihre";
        eText = "her";
        eTextm = "her";
    end

    found,stonedIndex_n = stonedEffect:findValue("stonedIndex");    -- get the strength of the effect
    if found then
	if stonedIndex_n>=1 then
	    found,clearIndex_n = stonedEffect:findValue("clearIndex");
	    if found then
 	        if clearIndex_n<3 then
	            clearIndex_n=clearIndex_n+1;
	        elseif clearIndex_n == 3 then
	            stonedIndex_n=stonedIndex_n-1;
	    	    clearIndex_n=1;
	        end
	    end
	else
	    return false;
	end

    end

    stonedEffect.nextCalled =math.random(200,300);       -- call it again in 300-600 seconds

    -- Character:inform("HL: "..stonedIndex_n);
    -- Character:inform("CI: "..clearIndex_n);

    stonedEffect:addValue("stonedIndex",stonedIndex_n);
    stonedEffect:addValue("clearIndex",clearIndex_n);

    -- Effekte nach Stärke des Effekts
    stonedEffectType = math.random(1,2);
    if ((stonedIndex_n>=1) and (stonedIndex_n<5)) then
    	if ((stonedIndex_n==3) and (clearIndex_n==2))then
            base.common.InformNLS( Character,
            "Dir ist ein wenig schummrig.",
            "You feel a little bit dizzy." );
	end
	if (stonedEffectType == 1) then
	    Character:talkLanguage(Character.say,Player.german ,"#me grinst.");
            Character:talkLanguage(Character.say,Player.english,"#me grins.");
	else
            Character:talkLanguage(Character.say,Player.german ,"#me seufzt tief.");
            Character:talkLanguage(Character.say,Player.english,"#me sighs deeply.");
	end

    elseif ((stonedIndex_n>=5) and (stonedIndex_n<10)) then
        if ((stonedIndex_n==8) and (clearIndex_n==2))then
            base.common.InformNLS( Character,
            "Du hast das Gefühl, dass dein Blick irgendwie getrübt ist.",
            "You have the feeling that your sight is hazy." );
        end
	if (stonedEffectType == 1) then
            Character:talkLanguage(Character.say,Player.german ,"#me blinzelt irritiert.");
            Character:talkLanguage(Character.say,Player.english,"#me blinks irritatedly.");
        else
            Character:talkLanguage(Character.say,Player.german ,"#me sieht sich verwirrt um.");
            Character:talkLanguage(Character.say,Player.english,"#me looks around like a lunatic.");
        end
    elseif ((stonedIndex_n>=10) and (stonedIndex_n<15)) then
        if ((stonedIndex_n==13) and (clearIndex_n==2)) then
            base.common.InformNLS( Character,
            "Dein Kopf fühlt sich an wie mit Watte gefüllt.",
            "Your mind feels like a bunch of entangled wool." );
        end
        if (stonedEffectType == 1) then
            Character:talkLanguage(Character.say,Player.german ,"#me summt gedankenverloren eine Melodie vor sich hin.");
            Character:talkLanguage(Character.say,Player.english,"#me hums a melody absentmindedly to "..eTextm.."self.");
        else
            Character:talkLanguage(Character.say,Player.german ,"#me kneift die geröteten Augen zusammen.");
            Character:talkLanguage(Character.say,Player.english,"#me squints "..eText.." reddened eyes.");
        end
    elseif ((stonedIndex_n>=15) and (stonedIndex_n<20)) then
        if ((stonedIndex_n==18) and (clearIndex_n==2)) then
            base.common.InformNLS( Character,
            "Du nimmst deine Umgebung nur noch schleierhaft wahr.",
            "You notices the surroundings look fuzzy due to your unclear vision." );
        end
        if (stonedEffectType == 1) then
            Character:talkLanguage(Character.say,Player.german ,"#me wiegt sich langsam vor und zurück.");
            Character:talkLanguage(Character.say,Player.english,"#me sways slowly back and forth");
        else
            Character:talkLanguage(Character.say,Player.german ,"#me sieht mit weit aufgerissenen Augen plötzlich hinter sich.");
            Character:talkLanguage(Character.say,Player.english,"#me suddenly looks behind "..eTextm.."self with eyes wide open.");
        end

    elseif stonedIndex_n>=20 then
        if ((stonedIndex_n==23) and (clearIndex_n==2)) then
            base.common.InformNLS( Character,
            "Du möchtest am liebsten einfach umfallen und einschlafen.",
            "You feel like you want to just topple down and fall asleep." );
        end
        if (stonedEffectType == 1) then
            Character:talkLanguage(Character.say,Player.german ,"#me fallen immer wieder die Augen zu.");
            Character:talkLanguage(Character.say,Player.english,"#me closes "..eText.." eyes every now and then.");
        else
            Character:talkLanguage(Character.say,Player.german ,"#me murmelt unverständliches Zeug.");
            Character:talkLanguage(Character.say,Player.english,"#me murmurs nothing but gibberish.");
        end



    end
  


    return true;
end


----------------------------------------------
---- Character lost effect
----------------------------------------------

function removeEffect( Effect, Character )
    LogString=os.date()..": Patient "..Character.name.."completely healed because the cold ended.\n";
    logToFile(LogString);
    --base.common.InformNLS(Character,
    --"Du fühlst dich endlich wieder klarer.",
    --"You finally feel sober now.");
end
	 
function loadEffect(Effect, Character)
end


