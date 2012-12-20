require("base.common")

module("triggerfield.traps", package.seeall)

-- INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.traps');

function InitTraps()
	--AddFireTrap(POSITION, STRENGTH, GFX, SOUND, {DE_INFORM, EN_INFORM});
	--AddMonsterTrap(POSITION, MONSTERID, GFX, SOUND, {DE_INFORM, EN_INFORM});
	--AddPoisonTrap(POSITION, STRENGTH, GFX, SOUND, {DE_INFORM, EN_INFORM});
	--AddExplosionTrap(POSITION, STRENGTH, GFX, SOUND, {DE_INFORM, EN_INFORM});
	
	AddMonsterTrap(position(527, 573, 0), 2, 8, 23, {"Du löst eine Monsterfalle aus, du dummer Noob.", "Too lazy to write it in english as well."}); -- For Testing
	
	-- ADD TRAPS HERE
	
end

function AddFireTrap(pos, strength, gfx, sound, inform)
	table.insert(TrapFields, pos);
	table.insert(TrapTag, strength);
	table.insert(TrapSound, sound);
	table.insert(TrapGFX, gfx);
	table.insert(TrapTypes, 1);
	table.insert(TrapInformsDE, inform[1]);
	table.insert(TrapInformsEN, inform[2]);
end

function AddMonsterTrap(pos, monster, gfx, sound, inform)
	table.insert(TrapFields, pos);
	table.insert(TrapSound, sound);
	table.insert(TrapGFX, gfx);
	table.insert(TrapTag, monster);
	table.insert(TrapTypes, 2);
	table.insert(TrapInformsDE, inform[1]);
	table.insert(TrapInformsEN, inform[2]);
end

function AddPoisonTrap(pos, strength, gfx, sound, inform)
	table.insert(TrapFields, pos);
	table.insert(TrapTag, strength);
	table.insert(TrapSound, sound);
	table.insert(TrapGFX, gfx);
	table.insert(TrapTypes, 3);
	table.insert(TrapInformsDE, inform[1]);
	table.insert(TrapInformsEN, inform[2]);
end

function AddExplosionTrap(pos, strength, gfx, sound, inform)
	table.insert(TrapFields, pos);
	table.insert(TrapTag, strength);
	table.insert(TrapSound, sound);
	table.insert(TrapGFX, gfx);
	table.insert(TrapTypes, 4);
	table.insert(TrapInformsDE, inform[1]);
	table.insert(TrapInformsEN, inform[2]);
end

function MoveToField(User)
	if(Init == nil) then
		TrapFields = {};
		TrapTypes = {};
		TrapSound = {};
		TrapGFX = {};
		TrapTag = {};
		TrapInformsDE = {};
		TrapInformsEN = {};
		LastTime = {};
		
		InitTraps();
		
		Init = 1;
	end
	
	local AktTime = {world:getTime("day"),world:getTime("hour"),world:getTime("minute")};
	
	for i,v in pairs(TrapFields) do
		if(User.pos == TrapFields[i]) then
			-- Falle nur maximal 1 mal pro Minute ausloesen
			local PosVal = User.pos.x + User.pos.y + User.pos.z;
			if (LastTime[PosVal] ~= nil) then
				if (AktTime[1] == LastTime[PosVal][1]) and (AktTime[2] == LastTime[PosVal][2]) and (AktTime[3] == LastTime[PosVal][3]) then
					return;
				end
			end
			LastTime[PosVal] = AktTime;
			if(TrapTypes[i] == 1) then
				User:increaseAttrib("hitpoints", -TrapTag[i]);
				world:makeSound(TrapSound[i], User.pos);
				world:gfx(TrapGFX[i], User.pos);
				base.common.InformNLS(User, TrapInformsDE[i], TrapInformsEN[i]);
				return;
			end
			if(TrapTypes[i] == 2) then
				if(world:getMonstersInRangeOf(User.pos, 10)[1] ~= nil) then
					return;
				end
				world:gfx(TrapGFX[i], User.pos);
				world:makeSound(TrapSound[i], User.pos);
				world:createMonster(TrapTag[i], base.common.GetFrontPosition(User), 20);
				base.common.InformNLS(User, TrapInformsDE[i], TrapInformsEN[i]);
				return;
			end
			if(TrapTypes[i] == 3) then
				User:increasePoisonValue(TrapTag[i]);
				world:gfx(TrapGFX[i], User.pos);
				world:makeSound(TrapSound[i], User.pos);
				base.common.InformNLS(User, TrapInformsDE[i], TrapInformsEN[i]);
				return;
			end
			if(TrapTypes[i] == 4) then
				ExplosionDamage(User.pos, TrapGFX[i], TrapTag[i]);
				CreateCircleCustom(User.pos, 1, TrapGFX[i], TrapTag[i]);
				world:makeSound(TrapSound[i], User.pos); -- Sound nur einmal spielen
				base.common.InformNLS(User, TrapInformsDE[i], TrapInformsEN[i]);
				return;
			end
		end
	end
	if(User:isAdmin()) then
		User:inform("Trap is not registered in the script!");
	end
end

function CreateCircleCustom(Center, Range, GFX, Damage)
    if not storedCircle then
        storedCircle = {};
    end;
    if not storedCircle[Range] then
        local irad = math.ceil(Range);
        local dim = 2*(irad+1);
        local map = {} ;
        storedCircle[Range] = {};

        for x = -irad - 1, irad do
            map[x] = {};
            for y = -irad - 1, irad do
                map[x][y] = (x + 0.5) * (x + 0.5) + (y + 0.5) * (y + 0.5) - irad * irad > 0;
            end;
        end;

        for x = -irad, irad do
            for y = -irad, irad do
                if not (map[x][y] and map[x-1][y] and map[x][y-1] and map[x-1][y-1])
                   and (map[x][y] or map[x-1][y] or map[x][y-1] or map[x-1][y-1]) then
                    table.insert(storedCircle[Range], position(x, y, 0));
                end;
            end;
        end;
    end;
    for _, posi in pairs(storedCircle[Range]) do
        ExplosionDamage(position(Center.x + posi.x, Center.y + posi.y, Center.z), GFX, Damage);
    end;
end

function ExplosionDamage(Pos, GFX, Damage)
	world:gfx(GFX, Pos);
	if(world:isCharacterOnField(Pos)) then
		local user = world:getCharacterOnField(Pos);
		user:increaseAttrib("hitpoints", -Damage);
	end
end
