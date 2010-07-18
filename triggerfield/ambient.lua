-- triggerfields for better atmosphere

--[[ SQL Statements:
INSERT INTO triggerfields VALUES (-62,-124,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-137,-97,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-138,-97,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-62,-125,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-64,-129,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-66,-116,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-86,-99,-3,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-87,-116,1,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-88,-116,1,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-89,-90,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-91,-115,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-94,-123,1,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-94,-127,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-95,-94,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (-96,-119,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (110,-200,-3,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (111,-200,-3,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (156,-433,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (157,-200,-6,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (157,-433,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (158,-200,-6,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (170,-194,-3,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (186,-337,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (187,-337,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (187,-443,1,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (187,-444,1,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (188,-337,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (189,-337,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (190,-337,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (191,-337,0,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (86,-203,2,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (86,-204,2,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (96,-203,-3,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (96,-211,3,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (97,-203,-3,'triggerfield.ambient');
INSERT INTO triggerfields VALUES (158,-448,0,'triggerfield.ambient');

INSERT INTO triggerfields VALUES (,'triggerfield.ambient');
]]

require("base.common")

module("triggerfield.ambient", package.seeall)

--[[
position: coordinates
dir: 0=North,2=East,4=South,6=West
german/english: text
hours: array with hours when text shall be shown, in range of 0 to 23. Set to nil for always.
months: array with months when text shall be shown, in range of 1 to 16. Set to nil for always.

for script:
AmbientList:add( position(x,y,z), dir, "german", "english", {0,1,23}, {1,2,16} );

for db:
INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.ambient');
]]


AmbientList = {	add = function ( self, pos, dir, german, english, hours, months )
						if not self[pos.x] then
							self[pos.x] = {};
						end
						if not self[pos.x][pos.y] then
							self[pos.x][pos.y] = {};
						end
						if not self[pos.x][pos.y][pos.z] then
							self[pos.x][pos.y][pos.z] = {};
						end
						if not self[pos.x][pos.y][pos.z][dir] then
							self[pos.x][pos.y][pos.z][dir] = {};
						end
						local this = self[pos.x][pos.y][pos.z][dir];
						table.insert(this, {
							german = german or "";
							english = english or "";
							hours = hours or {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
							months = months or {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
							} );
				end
}
AmbientList:add(position(135,640,0),nil,"This Tile should respond no matter which direction you step on it from!","This Tile should respond no matter which direction you step on it from!",nil ,nil);


function MoveToField(Char)
	local this = getAmbient(Char);
	if this then
		base.common.TempInformNLS(Char,this.german,this.english);
	end
end

function getAmbient(Char)
	local pos = Char.pos;
	local dir = Char:get_face_to();
	if AmbientList[pos.x] and AmbientList[pos.x][pos.y] and AmbientList[pos.x][pos.y][pos.z] and (AmbientList[pos.x][pos.y][pos.z][dir] or AmbientList[pos.x][pos.y][pos.z][dir]==nil) then
		local this = AmbientList[pos.x][pos.y][pos.z][dir];
		local list = {};
		for _,ambient in pairs(this) do
			local timeOk, monthOk = false, false;
			for _,that in pairs(ambient.hours) do
				if that==world:getTime("hour") then
					timeOk = true;
					break;
				end
			end
			for _,that in pairs(ambient.months) do
				if that==world:getTime("month") then
					monthOk = true;
					break;
				end
			end
			if timeOk and monthOk then
				table.insert(list,ambient);
			end
		end
		if table.getn(list)>0 then
			return list[math.random(1,table.getn(list))];
		end
	end
	return nil;
end