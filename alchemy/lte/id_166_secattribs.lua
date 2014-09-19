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
-- LTE für das Druidensystem
-- by Falk
-- complete new version by Merung

local M = {}

-- INSERT INTO longtimeeffects VALUES (166, 'alchemy_secattribs', 'alchemy.lte.id_166_secattribs');

function M.addEffect(Effect, User)               -- we start with adding the effect
	--User:inform("debug func addEffect")
end

function M.callEffect(Effect,User) 
    local findCounter,counterPink = Effect:findValue("counterPink")
    
	local findHitpointsIn,hitpointsIncrease = Effect:findValue("hitpointsIncrease")
    local findManaIn,manaIncrease = Effect:findValue("manaIncrease")
    local findFoodlevelIn,foodlevelIncrease = Effect:findValue("foodlevelIncrease")
    local findPoisonvalueIn,poisonvalueIncrease = Effect:findValue("poisonvalueIncrease")
	
	local findHitpointsDe,hitpointsDecrease = Effect:findValue("hitpointsDecrease")
    local findManaDe,manaDecrease = Effect:findValue("manaDecrease")
    local findFoodlevelDe,foodlevelDecrease = Effect:findValue("foodlevelDecrease")
    local findPoisonvalueDe,poisonvalueDecrease = Effect:findValue("poisonvalueDecrease")
	
	if User:increaseAttrib("hitpoints",0) == 0 then
		return false
	end
    
	if findCounter then 
       if counterPink > 0 then
           
		   if findHitpointsIn then
              User:increaseAttrib("hitpoints",hitpointsIncrease);
           end
           if findManaIn then   
              User:increaseAttrib("mana",manaIncrease);
           end
           if findFoodlevelIn then
              User:increaseAttrib("foodlevel",foodlevelIncrease);
           end
           if findPoisonvalueIn then    
	          poisonvalueIncrease = base.common.Limit( (User:getPoisonValue() - poisonvalueIncrease) , 0, 10000 ); 
	          User:setPoisonValue( poisonvalueIncrease );
	       end
	      
		   if findHitpointsDe then
              User:increaseAttrib("hitpoints",-hitpointsDecrease);
           end
           if findManaDe then   
              User:increaseAttrib("mana",-manaDecrease);
           end
           if findFoodlevelDe then
              User:increaseAttrib("foodlevel",-foodlevelDecrease);
           end
           if findPoisonvalueDe then    
	          poisonvalueDecrease = base.common.Limit( (User:getPoisonValue() + poisonvalueDecrease) , 0, 10000 ); 
	          User:setPoisonValue( poisonvalueDecrease );
	       end
		  
		   if findCounter then
		      counterPink = counterPink - 1;
	          Effect:addValue("counterPink",counterPink)
	       end
	       
		   if counterPink <= 0 then
		        world:gfx(45,User.pos)
				base.common.InformNLS(User,"Die Wirkungsphase des Heiltranks endet.","The effect phase of the healing potion ends.")
				return false
	       end
       end
   end
  Effect.nextCalled = 70
  return true
end

function M.loadEffect(Effect, User)
    
end	

function M.removeEffect(Effect,User)         

end
return M

