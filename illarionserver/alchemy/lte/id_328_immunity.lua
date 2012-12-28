-- LTE für das Druidensystem
-- by Falk
-- immunity. Has actually nothing to do with healing potion 328 orange bottle

module("alchemy.lte.id_328_immunity", package.seeall)

-- INSERT INTO longtimeeffects VALUES (328, 'alchemy_immunity', 'alchemy.lte.id_328_immunity');

function getAction(Character,Effect,Runde)
--Hier die eigentlichen Aktionen eintragen  
end

function addEffect(Effect, Character)               -- Nur beim ersten Aufruf
--Character:inform("debug func addEffect") 
end

function callEffect(Effect,Character)                  -- Effect wird ausgeführt
	
	local foundImmunity, immunity, retVal = nil,nil,false;
	for i=1,8 do
		foundImmunity, immunity = Effect:findValue("immunity_"..i);
		if foundImmunity then
			if immunity == 0 then
				Effect:removeValue("immunity_"..i);
			else
				Effect:addValue("immunity_"..i,immunity-1);
				retVal = true;
			end
		end
	end
	Effect.nextCalled = 10;
	return retVal;
end

function removeEffect(Effect,Character)         
--Character:inform("debug func removeEffect")  
end

function loadEffect(Effect,Character)                  -- wenn der Charakter erneut einloggt
--Character:inform("debug func loadEffect")   
end
