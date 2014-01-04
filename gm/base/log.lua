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
-- Log System von GM Actionen
require("base.common");
module("gm.base.log", package.seeall)

function Write(User, Text)
    if (Text~=nil and Text~="") then
        --filepoint,errmsg=io.open("/home/nitram/gmlog/gmlog_rs.log","r+");  --RS
        filepoint,errmsg=io.open("/home/nitram/gmlog/gmlog_ts.log","r+");  --TS
        if (filepoint~=nil) then
            filepoint:seek("end");
            filepoint:write(base.common.GetRealDateTimeString() .." - "..Text.."\n");
            filepoint:close();
        else
            User:inform("Error while opening Logfile");
        end
    else
        User:inform("Error while generating log text");
    end
    return
end
