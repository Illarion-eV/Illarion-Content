dofile("base_class.lua")

spawnMonster = class(function(spwnMon, posi, monId)
    spwnMon.pos=posi;
    spwnMon.id=monId;
end);

function moveLever:execute()
    world:createMonster(self.id, self.pos, 100); 
end
