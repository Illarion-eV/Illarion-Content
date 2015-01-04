--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local common = require("base.common")

local M = {}

local function HitVictims(Posi,Hitpoints,CenterPos)
	if world:isCharacterOnField(Posi) then
		local explosionVictim = world:getCharacterOnField(Posi);

		if (explosionVictim:getType() == 2) then --dont touch npcs
		return;
		end

		local posX;
		local posY;
		if (Posi == CenterPos) then -- code path not reached
		posX = explosionVictim.pos.x+math.random(-9,9)
		posY = explosionVictim.pos.y+math.random(-9,9)
		else
			local Distance = explosionVictim:distanceMetricToPosition(CenterPos);
			local Diffx = CenterPos.x - explosionVictim.pos.x;
			local Diffy = CenterPos.y - explosionVictim.pos.y;
			if (Distance == 1) then
				Diffx = 6*Diffx;
				Diffy = 6*Diffy;
			elseif (Distance == 2) then
				Diffx = 2*Diffx;
				Diffy = 2*Diffy;
			end
			posX = explosionVictim.pos.x-Diffx
			posY = explosionVictim.pos.y-Diffy
		end

		local listOfStuff = world:LoS(explosionVictim.pos, position(posX,posY,explosionVictim.pos.z))

		if listOfStuff ~= nil then
			local minDistance = explosionVictim:distanceMetricToPosition(position(posX,posY,explosionVictim.pos.z));

			for i, listEntry in pairs(listOfStuff) do
				local itemPos = listEntry.OBJECT.pos
				local field = world:getField(itemPos)
				local tempX = posX;
				local tempY = posY;
				-- something not passable is in the way, recalculate position
				if not field:isPassable() then

					local phi = common.GetPhi(explosionVictim.pos, itemPos);
					if (phi < math.pi / 8) then
						tempX = itemPos.x - 1
					elseif (phi < 3 * math.pi / 8) then
						tempX = itemPos.x - 1
						tempY = itemPos.y - 1
					elseif (phi < 5 * math.pi / 8) then
						tempY = itemPos.y - 1
					elseif (phi < 7 * math.pi / 8) then
						tempX = itemPos.x + 1
						tempY = itemPos.y - 1
					elseif (phi < 9 * math.pi / 8) then
						tempX = itemPos.x + 1
					elseif (phi < 11 * math.pi / 8) then
						tempX = itemPos.x + 1
						tempY = itemPos.y + 1
					elseif (phi < 13 * math.pi / 8) then
						tempY = itemPos.y + 1
					elseif (phi < 15 * math.pi / 8) then
						tempX = itemPos.x - 1
						tempY = itemPos.y + 1
					else
						tempX = itemPos.x - 1
					end;

					local tempDistance = explosionVictim:distanceMetricToPosition(position(tempX,tempY,explosionVictim.pos.z));
					if (  tempDistance < minDistance) then
						minDistance = tempDistance;
						posX = tempX;
						posY = tempY;
					end
				end
			end
		end

		explosionVictim:warp(position(posX,posY,explosionVictim.pos.z));
		common.InformNLS(explosionVictim,
			"Getroffen von der Detonation wirst du davon geschleudert.",
			"Hit by the detonation, you get thrown away.");
		explosionVictim:increaseAttrib("hitpoints",-Hitpoints);
	end;
end;

local function CreateExplosionCircle(HitPos,gfxid,Damage,CenterPos,setFlames)

	world:gfx(gfxid,HitPos);
	HitVictims(HitPos,Damage,CenterPos);

	if setFlames then
		if (math.random(1,5)==1) then
			world:createItemFromId(359,1,HitPos,true,math.random(200,600),nil);
		end
	end
end;

--[[
    CreateExplosion
    Provide an explosion that also throws characters away, in a radios of 3 fields
    @param integer - Center of the explosion
]]
function M.CreateExplosion(CenterPos)
	local function CreateOuterCircle(HitPos)
		CreateExplosionCircle(HitPos, 1,250,CenterPos,false);
		return true;
	end
	local function CreateMiddleCircle(HitPos)
		CreateExplosionCircle(HitPos,9,750,CenterPos,true);
		return true;
	end
	local function CreateInnerCircle(HitPos)
		CreateExplosionCircle(HitPos, 44,1000,CenterPos,true);
		return true;
	end

	common.CreateCircle(CenterPos, 3, CreateOuterCircle);
	common.CreateCircle(CenterPos, 2, CreateMiddleCircle);
	common.CreateCircle(CenterPos, 1, CreateInnerCircle);
	world:gfx(36,CenterPos);
	world:makeSound(5,CenterPos);
end

return M