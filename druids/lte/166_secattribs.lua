-- LTE f�r das Druidensystem
-- by Falk

module("druids.lte.166_secattribs", package.seeall)

-- INSERT INTO longtimeeffects VALUES (166, 'druids_secattribs', 'druids.lte.166_secattribs');

function getAction(User,Effect,Runde)
	--User:inform("Hier passiert etwas")
	--Hier die eigentlichen Aktionen eintragen  
end

function addEffect(Effect, Character)               -- Nur beim ersten Aufruf
	-- Character:inform("debug func addEffect")  
end

function callEffect(Effect,Character)               -- Effect wird ausgef�hrt
	--Character:inform("debug func callEffect")
	find,zaehler = Effect:findValue("zaehler")
	if find then
		zaehler = zaehler -1
		Effect:addValue("zaehler", zaehler)
		--Character:inform("Runde "..zaehler) 
		Effect.nextCalled = 10  -- n�chster Aufruf in 1 Sekunde 
		if zaehler == 0 then  
      
			find, luc = Effect:findValue("luck")
			find, att = Effect:findValue("attitude")
			find, hei = Effect:findValue("height")
			find, wei = Effect:findValue("weight")
      
			Character:setAttrib("luck",luc)
			Character:setAttrib("attitude",att)
			Character:setAttrib("height",hei)
			Character:setAttrib("weight",wei)

			return false
		else
			return true
		end
	end
end

function loadEffect(Effect,Character)               -- wenn der Charakter erneut einloggt
	--Character:inform("debug func loadEffect") 
	find,zaehler = Effect:findValue("zaehler")
	if not find then 
		Character:inform("LTE-Error 2: please call dev")
	end
	
	find, luc = Effect:findValue("luc_x")
	if find then 
		Character:setAttrib("luck",luc)
	end  
	
	find, att = Effect:findValue("att_x")
	if find then 
		Character:setAttrib("attitude",att)
	end
	  
	find, hei = Effect:findValue("hei_x")
	if find then
		Character:setAttrib("height",hei)
	end  

	find, wei = Effect:findValue("wei_x")
	if find then 
		Character:setAttrib("weight",wei)
	end
end

function removeEffect(Effect,Character)         
	--Character:inform("debug func removeEffect")
	world:gfx(45,Character.pos)  
  
end
