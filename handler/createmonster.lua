require("base.class")

module("handler.createmonster", package.seeall)



createMonster = base.class.class(function(cremonst, posi, ID, mvpoints, amnt)
	cremonst.pos=posi;
	cremonst.monsterID=ID;
	cremonst.movepoints=mvpoints;
end);
	
function createMonster:execute()
	i = 1
	while i  <= amnt do
	world:createMonster(self.monsterID, self.pos, self.movepoints);
	i = i + 1
end