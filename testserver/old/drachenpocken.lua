--- *** Drachenpocken *** ---


require("base.common")
module("lte.drachenpocken", package.seeall)


------------------------------
-- Character gets a disease --
------------------------------
function addEffect(diseaseEffect, Patient)         -- Infection starts
    --diseaseEffect:addValue("diseaseStr",2); Disabled
end

------------------------
-- Infect player char --
------------------------
function infect(Char)
    found,diseaseEffect = Char.effects:find(28);    -- look if he already has disease
	
--Disabled	
--    if not found then                               -- if not...
--        Char.effects:addEffect(LongTimeEffect(28,math.random(30000,40000)));    -- give disease to the patient
--       Char:inform("du wurdest infizier!");
--    end                                       -- first call in about 1 hour.
end

------------------------------------
-- Searches for players to infect --
------------------------------------
function startInfection(User,InfectRange)
    newPatients = world:getPlayersInRangeOf(User.pos,InfectRange);    -- get list of all player around
            -- found at least one
--    for i, newPat in pairs(newPatients) do
--        if newPat.id~=User.id then              -- don't infect yourself
--           foundSchn, eff=newPat.effects:find(3);  -- does the new patient already have the infection?
--          if not foundSchn then
--                if (math.random(1,2)==2) then       -- infect with 50% chance
--                    infect(newPat);
 --               end
 --           end
 --       end 
 --   end
end


function heal(User)     -- check if a fire is near the character
    retVal=false;
    -- do the healing process
    return retVal;
end


function logToFile(theString)
    if true then
        return true;
    end
    retVal=false;
    diseaseLog,errMsg=io.open("/home/martin/diseaseLog.txt","a");
    if (diseaseLog~=nil) then
        diseaseLog:write(theString);
        diseaseLog:close();
        retVal=true;
    else
        retVal=false;
    end
    return retVal;
end

--------------------------------------------------
-- Character is affected by the disease he got. --
--------------------------------------------------
function callEffect(diseaseEffect, Patient)    -- Effect wird ausgeführt
    Patient:inform("callEffect called");
    found,diseaseStr = diseaseEffect:findValue("diseaseStr");   -- get the strength of the effect
    diseaseEffect.nextCalled =math.random(150,250);            -- call it again in 15-25 seconds
    if found then           --  still having the disease?
        startInfection(Patient,2);  -- infection Range
        if (not heal(Patient)) then             -- will he be healed?
            --if (not Patient:isAdmin()) then     -- is he admin? admins do not sneeze.
                rnd=math.random(1,10);
                if rnd==2 then
                    Patient:talkLanguage(Character.say, Player.german, "#me kratzt sich.");
                    Patient:talkLanguage(Character.say, Player.english, "#me has a scratch.");
                elseif rnd==3 then
                    base.common.InformNLS(Patient,"Du fühlst dich verwundbar.","You feel vulnerable.");
                elseif rnd==4 then
                    base.common.InformNLS(Patient,"Du fühlst dich verwundbar.","You feel vulnerable.");
                end
            --end
            if diseaseStr==2 then                       -- not so strong yet (alter attribs by 2)
                if diseaseEffect.numberCalled==1 then   -- fresh!
                    if Patient:increaseAttrib("constitution",-2)<1 then
                        Patient:setAttrib("constitution",1);
                    end
                    Patient:increaseAttrib("perception",2);
                elseif diseaseEffect.numberCalled>100 then
                    diseaseEffect:addValue("diseaaseStr",3) -- disease gets worse!
                end
            elseif diseaseStr==3 then
                
            end
            return true;        -- illnes goes on, so return "true".
        else                    -- he will be healed!
            LogString=os.date()..": Patient "..Patient.name.." healed by healing-mechanism. (Immune now)\n";
            base.common.InformNLS(Patient,
            "Du fühlst dich endlich wieder besser.",
            "You finally feel better now.");
            diseaseEffect:addValue("diseaseStr",150);
			return true;
        end
        return false;

    else
        return false;
    end
end

function removeEffect( Effect, Character )
    
end

function loadEffect(diseaseEffect, Patient)     -- load altered stats
    found,diseaseStr = diseaseEffect:findValue("diseaseStr");
    if found then
        if diseaseStr==2 then
            newConst=Patient:increaseAttrib("constitution",-2);
            if newConst<1 then
                diseaseEffect:addValue("changedConst",newConst+1)
                Patient:setAttrib("constitution",1);
            end
            Patient:increaseAttrib("perception",2);
        elseif diseaseStr==3 then
            newConst=Patient:increaseAttrib("constitution",-2);
            if newConst<1 then
                Patient:setAttrib("constitution",1);
                diseaseEffect:addValue("changedConst",newConst+4)
            end
            Patient:increaseAttrib("perception",5);
        end
    end
end
