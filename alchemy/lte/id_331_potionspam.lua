-- LTE für das Druidensystem
-- by Blay09

module("alchemy.lte.id_331_potionspam", package.seeall)

-- INSERT INTO longtimeeffects VALUES (331, 'alchemy_potionspam', 'alchemy.lte.id_331_potionspam');

function addEffect(Effect, Character)               -- Nur beim ersten Aufruf

end

function callEffect(Effect,Character)               -- Effect wird ausgeführt
	-- Tritt nur einmal auf. Nach 4 Stunden. Breche den Effekt also ab.
	return false;
end

function loadEffect(Effect,Character)               -- wenn der Charakter erneut einloggt

end

function removeEffect(Effect,Character)         

end
