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
local M = {}
-- In work! By Avalyon
-- Boni or curse for the cursed ring

function M.callEffect(eff, User)
 eff.nextCalled = 65535;
   return true;
end

function M.addEffect (eff, User)
eff:addValue( "curse", 1)
      if (tonumber(User:getItemAt( 8 ):getData("ringData")) == User.id) or (tonumber(User:getItemAt( 7 ):getData("ringData")) == User.id) then
                User:increaseAttrib ("agility", 3);
                User:increaseAttrib ("intelligence", 3);
                User:inform ("You feel a slight pain as the ring tightens arround your finger. A dark energy is released inside the body, making you feel as powerful as you have ever been.");
                
      else
                User:increaseAttrib ("agility", -3);
                User:increaseAttrib ("intelligence", -3);
                User:inform ("You feel as the ring powerfully tightens arround your finger, making you shiver in pain. A dark energy is released inside the body, making you feel dizzy and weak.");
      end
   return true
end

function M.removeEffect (eff,User)
eff:removeValue ("curse");
end

function M.loadEffect (eff, User)
end



return M

