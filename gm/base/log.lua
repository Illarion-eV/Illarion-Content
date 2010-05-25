-- Log System von GM Actionen
module("gm.base.log", package.seeall())

function Write(User, Text)
    if (Text~=nil and Text~="") then
        --filepoint,errmsg=io.open("/home/nitram/gmlog/gmlog_rs.log","r+");  --RS
        filepoint,errmsg=io.open("/home/nitram/gmlog/gmlog_ts.log","r+");  --TS
        if (filepoint~=nil) then
            filepoint:seek("end");
            filepoint:write(os.date().." - "..Text.."\n");
            filepoint:close();
        else
            User:inform("Error while opening Logfile");
        end
    else
        User:inform("Error while generating log text");
    end
    return
end