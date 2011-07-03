-- I_298 Holzstapel entfachen (Lagerfeuer)

require("base.common")

module("item.id_298_woodstack", package.seeall)

-- UPDATE common SET com_script='item.id_298_woodstack' WHERE com_itemid IN (298);

function callFireMan(User, fireItem)

    --User:inform("checking NPC");
    Npcs=world:getNPCSInRangeOf(position(-105,-84,0),1);
    for i,fireMaster  in Npcs do
        --User:inform("Name: "..fireMaster.name);
        fndFir, firEffect = fireMaster.effects:find(8);
        if not fndFir then                                  -- if not...
            firEffect = LongTimeEffect(8,300);              -- add effect
            firEffect:addValue("fireX1",fireItem.pos.x+100000);
            firEffect:addValue("fireY1",fireItem.pos.y+100000);
            firEffect:addValue("fireZ1",fireItem.pos.z+100000);
            firEffect:addValue("fireN1",0);                 -- next flame index
            firEffect:addValue("lastNumber",1);             -- last flame number
            firEffect:addValue("firstNumber",1);            -- first flame
            fireMaster.effects:addEffect( firEffect );
            --User:inform("NPC angesteckt");
        else            -- if he has the effect already...
            a, lastNumber = firEffect:findValue("lastNumber");
            nextFree = lastNumber + 1;
            firEffect:addValue("fireX"..nextFree,fireItem.pos.x+100000);
            firEffect:addValue("fireY"..nextFree,fireItem.pos.y+100000);
            firEffect:addValue("fireZ"..nextFree,fireItem.pos.z+100000);
            firEffect:addValue("fireN"..lastNumber,nextFree);
            firEffect:addValue("fireN"..nextFree,0);                 -- next flame index
            firEffect:addValue("lastNumber",nextFree);             -- last flame number
            --User:inform("er hats schon.");
        end
    end
end

function logToFile(theString)
    retVal=false;
    coldLog,errMsg=io.open("/home/martin/brandstifter.txt","a");
    if (coldLog~=nil) then
        coldLog:write(theString);
        coldLog:close();
        retVal=retVal;
    else
        retVal=retVal;
    end
    return retVal;
end


function UseItem(User,SourceItem,TargetItem,Counter,Param)
    -- User:inform("start fire");

    if (SourceItem:getType()==3) then
        --User:inform("starting fire");
        SourceItem.wear = 4;
        SourceItem.id = 12;
        SourceItem.number = 3;
        world:changeItem(SourceItem);
        world:makeSound(7,User.pos);
        logStrg=os.date()..": "..User.name.." tried "..SourceItem.pos.x.."/"..SourceItem.pos.y.."/"..SourceItem.pos.z.."\n";
        logToFile(logStrg);
        if SourceItem.data==1 then          -- if data=1 then make a fire!!
            logStrg=os.date()..": "..User.name.." started fire at "..SourceItem.pos.x.."/"..SourceItem.pos.y.."/"..SourceItem.pos.z.."(data=1)\n";
            logToFile(logStrg);
            callFireMan(User,SourceItem);
        elseif (math.random(1,100)==0) and (User.pos.z~=100 and User.pos.z~=101) then      -- Random wildfires deactivated. No fire on Noobia!
			local fld=world:getField(SourceItem.pos);
			local cnt=fld:countItems();
			local SaveFireplace=false;
			local i;
			for i=0, cnt-1 do
				TheItem=fld:getStackItem(i);
				if (TheItem.id==1008) or (TheItem.id==2488) then --Kessel oder Feuerstelle
			        SaveFireplace=true;
				end
			end
			if not SaveFireplace then
				logStrg=os.date()..": "..User.name.." started fire at ("..SourceItem.pos.x.."/"..SourceItem.pos.y.."/"..SourceItem.pos.z.."\n";
	            logToFile(logStrg);
	            callFireMan(User,SourceItem);
	            SaveFireplace=false;
			end
        end
    else
        base.common.InformNLS( User,
            "Du willst Dich nicht selbst verbrennen!",
            "You don't want to burn yourself!");
    end
end
