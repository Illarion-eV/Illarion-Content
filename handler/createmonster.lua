require("base.class")

module("handler.createmonster", package.seeall)

createMonsters = base.class.class(function(cremonst, posi, ID, mvpoints)
	cremonst.pos=posi;
	cremonst.monsterID=ID;
	cremonst.movepoints=mvpoints;
end);
	
function createMonsters:execute()
	world:createMonster(self.monsterID, self.pos, self.movepoints);
end