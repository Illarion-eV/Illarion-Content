require("base.common")
require("base.factions")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697 ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)

	if(User.lastSpokenText == "time") then
		local questState, questLastChanged = User:getQuestProgress(666);
		getRLDateFromUnixTimestamp(questLastChanged)
	end

end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end

daysPerMonth = {31,28,31,30,31,30,31,31,30,31,30,31}
TIMEZONE=+1
DST=0

function getRLDateFromUnixTimestamp(timestamp)
	year=math.floor(1970+ timestamp /31556926)
	ds=((1970+timestamp/31556926)-y)*31556926
	month=math.floor(ds/2629743)+1
	d=math.floor(ds/86400)+1
	day=math.floor(((ds/2629743+1)-m)*daysPerMonth[m])+1
	if(m==3)then if(md>=14)then DST=1 else DST=0 end end
	if(m==11)then if(md>=7)then DST=0 else DST=1 end end
	hour=math.floor(math.fmod(timestamp,60*60*24)/3600) + 5 + (TIMEZONE) + (DST)
	minute= math.floor(math.fmod(timestamp,60*60*24)/60 - 60*(h-DST))
	second= math.floor(math.fmod(math.fmod(timestamp,60*60*24),60))
	debug("Date: [dd.mm.yyyy hh:mm:ss]: "..day.."."..month.."."..year.." "..hour..":"..minute..":"..second..)
end