module("base.log", package.seeall)

function logToFile(theString)
    retVal=false;
    coldLog,errMsg=io.open("/home/martin/scriptlog.txt","a");
    if (coldLog~=nil) then
        coldLog:write(os.date()..": "..theString.."\n");
        coldLog:close();
        retVal=true;
    else
        retVal=false;
    end
    return retVal;
end
