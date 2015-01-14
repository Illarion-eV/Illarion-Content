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
-- INSERT INTO scheduledscripts VALUES('scheduled.scheduledFunction_proxy', 1, 1, 'onExecute');

-- This is a proxy script that works around the issue that the server does not properly handle the require function.
-- If this issue is ever fixed this script can be removed.
-- Ask Nitram for further details on this script

return require("scheduled.scheduledFunction")