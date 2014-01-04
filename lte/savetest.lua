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
module("lte.savetest", package.seeall)
function addEffect( theEffect, User )
    User:inform("Testeffekt added");
	theEffect:addValue("testvalue2",20);
end

function callEffect(theEffect, User )
    theEffect.nextCalled = 5; --erneut in 5 sec
	User:inform("Testeffekt called");
    return true;
end

function removeEffect( theEffect, User )
    User:inform("Testeffekt removed");
end

function loadEffect( theEffect, User)
    User:inform("Testeffekt loaded");
end
