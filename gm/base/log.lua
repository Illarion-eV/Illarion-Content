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
