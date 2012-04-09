require("base.class")

module("handler.createmonster", package.seeall)



createMonster = base.class.class(function(cremonst, posi, ID, mvpoints)
	cremonst.pos=posi;
	cremonst.monsterID=ID;
	cremonst.movepoints=mvpoints;
end);
	
function createMonster:execute()
	world:createMonster(self.monsterID, self.pos, self.movepoints);
end