
-- Generic lookat routine
-- Nop & Nitram


	-- custom lookat
	-- pharse

	require("base.common")
	require("content.genus")
	require("content.bonusitems")
	require("content.lookat.custom")
	require("content.lookat.unique")

-- generic function to get description for looking at items
-- Nop
-- material:    1=metal
--              2=wood
--              3=cloth
--              4=jewelry
-- German and english name (for RS)
-- returns a description string

module("base.lookat", package.seeall, package.seeall(content.bonusitems))

function GetItemDescription(User,Item,material,Weapon,Priest)
    --User:inform("generic lookAt called");

    -- safety checks
    if( User == nil ) then
        return "User required";
    end
    if( Item == nil ) then
        return "Item required";
    end
    if( material < 1) or (material > 4) then
        return "Unknown material";
    end
    if (Weapon==nil) then
        Weapon=false;
    end
    if (Priest==nil) then
        Priest=false;
    end

	checkForAdminChar(User,Item);
    checkGemsOnItem(User,Item);

    -- initialize arrays if not already done
    if GenericQualDe == nil then
        -- init german descriptions
        GenericQualDe={"perfekte","exzellente","sehr gute","gute","normale","mäßige","schlechte","sehr schlechte","schreckliche","furchtbare"};
        GenericDuraDe={};
        GenericDuraDe[1]={"nagelneue" ,"neue"     ,"fast neue","gebrauchte","leicht abgenutzte","abgenutzte","sehr abgenutzte","alte"   ,"rostige"       ,"klapprige"  };
        GenericDuraDe[2]={"nagelneue" ,"neue"     ,"fast neue","gebrauchte","leicht abgenutzte","abgenutzte","sehr abgenutzte","alte"   ,"morsche"       ,"zerfallende"};
        GenericDuraDe[3]={"nagelneue" ,"neue"     ,"fast neue","gebrauchte","leicht abgenutzte","abgenutzte","sehr abgenutzte","alte"   ,"fadenscheinige","zerfetzte"  };
        GenericDuraDe[4]={"funkelnde","strahlende","glänzende","gebrauchte","angekratzte",      "zerkratzte","matte",          "alte"   ,"stumpfe",       "brüchige"   };

        -- init english descriptions
        GenericQualEn={"perfect","excellent","very good","good","normal","average","bad","very bad","awful","horrible"};
        GenericDuraEn={};
        GenericDuraEn[1]={"brand new","new"     ,"almost new","used","slightly scraped"  ,"scraped"  ,"highly scraped"  ,"old","rusty"     ,"corroded"      };
        GenericDuraEn[2]={"brand new","new"     ,"almost new","used","slightly scratched","scratched","highly scratched","old","rotten"    ,"nearly decayed"};
        GenericDuraEn[3]={"brand new","new"     ,"almost new","used","slightly torn"     ,"torn"     ,"highly torn"     ,"old","threadbare","torn"          };
        GenericDuraEn[4]={"sparkling","shiny"    ,"glittery","used","slightly scraped","scraped"  ,"highly scraped"  ,"old","tarnished" ,"fragile"};

        -- genders
        GenericGender = { "r", "", "s" };

            -- init border values
        GenericQualLm={9,8,7,6,5,4,3,2,1,0};
        GenericDuraLm={90,80,70,60,50,40,30,15,0};

        -- init required skills
        GenericSkillName={ "smithing", "carpentry", "tailoring", "goldsmithing" };
    end

	-- init custom lookat
	if CustomLookAt == nil then
		content.lookat.custom.InitCustomLookAt();
		CustomLookAt = content.lookat.custom.CustomLookAt;
	end

	-- set default values for custom lookat
	local customText = "";
	local noQuality = false;
	local noName = false;
	local newGender = false;
	local ItemId = Item.id;
	local ItemData = Item.data;
	if ItemData > 2^30 then
		if CustomLookAt[ItemId] ~= nil then
			ItemData = ItemData - 2^30;
			if CustomLookAt[ItemId][ItemData] ~= nil then
				customText = base.common.GetNLS(User,CustomLookAt[ItemId][ItemData][1],CustomLookAt[ItemId][ItemData][2]);
				noQuality = CustomLookAt[ItemId][ItemData][3];
				noName = CustomLookAt[ItemId][ItemData][4];
				newGender = CustomLookAt[ItemId][ItemData][5];
			end
		end
	end

    -- calculate values

   -- decode item quality, extract duration
    local itemDura=math.mod(Item.quality,100);
    local itemQual=(Item.quality-itemDura)/100;

    if not ((User:getItemAt(5).id == 336) or (User:getItemAt(6).id == 336)) then
        -- get attribute and skill values
        local Per=User:increaseAttrib("perception",0);    --0-20
        local Skl=User:getSkill(GenericSkillName[material]);              --0-100
        -- modify duration with perception attribute
        local limit=(20-Per);
        if limit<0 then
            limit=0 ;
        end

        math.randomseed(User.id+Skl+Per+Item.id);   -- set seed to produce identical series of rand numbers each time
        local ranval=0;
        if (limit>0) then ranval=math.random(0,limit) end;        -- generates a number from 0-limit
        itemDura=itemDura+(ranval-limit/2);     --

        -- modify quality with skill value
        limit=math.floor((100-Skl)/40);  --5-0
        if limit<0 then
            limit=0;
        end
        ranval=0;
        if (limit>0) then ranval=math.random(0,limit) end;
        itemQual=itemQual+(ranval-limit/2);
    end;

    -- build description

    local gender = content.genus.GenusData( Item.id );
	if newGender then
		gender = newGender;
	end
    local genderExtension = GenericGender[gender + 1];

    local lang = User:getPlayerLanguage();
    local DisplayText="";
    local duraText = "";

    -- build quality text
	if not noQuality then
	    for i,qualLimit in pairs(GenericQualLm) do
	        if (itemQual>=qualLimit) then
	            if( lang == 0 ) then
	                if string.len(GenericQualDe[i])>2 then
	                    DisplayText = GenericQualDe[i]..genderExtension;
	                end
	            else
	                DisplayText=GenericQualEn[i];
	            end
	            break;
	        end
	    end

	    -- build durability text
	    Found=false;
	    for i,duraLimit in pairs(GenericDuraLm) do
	        if (itemDura>=duraLimit and Found==false) then
	            Found=true;
	            local dura = {};
	            if( lang == 0 ) then
	                dura = GenericDuraDe[material];
	                if string.len(dura[i])>2 then
	                    duraText = dura[i]..genderExtension;
	                end
	            else
	                dura = GenericDuraEn[material];
	                duraText=dura[i];
	            end
	        end
	    end

	    -- concatenate descriptive texts
	    if( (string.len(duraText)>2) and (string.len(DisplayText)>2)) then
	        DisplayText=DisplayText..", "..duraText;
	    else
	        DisplayText=DisplayText..duraText;
	    end
	end

    local ItemName="";
    if noName then
		-- nothing
	elseif Item.data>2^30 then
		ItemName=world:getItemName(Item.id, lang);
	--[[elseif Weapon then
        ItemName=MagicalName(User,Item);]]
    elseif Priest then
        ItemName=getNameWithTitle(Item, lang, genderExtension);
    else
        ItemName=world:getItemName(Item.id, lang);
    end

    if (User:getItemAt(5).id == 336) or (User:getItemAt(6).id == 336) then
        DisplayText=base.common.GetNLS( User,"Mit des Spiegels Hilfe siehst du","With the mirrors aid you see").." "..DisplayText.." "..ItemName.." "..customText;
	-- Edelstein-Item??
	--
    elseif ( (Item.data>=10 and Item.data<=79) or (Item.data>=1010 and Item.data<=7979) ) then
		if (math.floor(math.mod(Item.data,10)/1) >0) and (math.floor(math.mod(Item.data,10)/1) <10) then
			Suffix=content.lookat.unique.getSuffix(User,Class,math.floor(math.mod(Item.data,100)/10),math.floor(math.mod(Item.data,10)/1));
		else
			Suffix="";
		end
		if (math.floor(math.mod(Item.data,1000)/100) >0) and (math.floor(math.mod(Item.data,1000)/100) <10) then
	      	Praefix=content.lookat.unique.getPraefix(User,Class,math.floor(math.mod(Item.data,10000)/1000),math.floor(math.mod(Item.data,1000)/100));
		else
			Praefix="";
		end
		Praefix=Praefix..genderExtension;
		if ((math.floor(math.mod(Item.data,100)/10))==(math.floor(math.mod(Item.data,10000)/1000))) and (math.floor(math.mod(Item.data,10)/1)<=4) and (math.floor(math.mod(Item.data,1000)/100)<=4) then
			Suffix="";
		end

		DisplayText=base.common.GetNLS( User,"Du siehst","You see").." "..Praefix.." "..DisplayText.." "..ItemName.." "..Suffix;
	else
        DisplayText=base.common.GetNLS( User,"Du siehst","You see").." "..DisplayText.." "..ItemName.." "..customText;
    end;
    return DisplayText;
end

--
--
function checkGemsOnItem(User,Item)
	gems=nil;
	if ( (Item.data >= 10) and (Item.data <= 79) )then
		gems=1;
	elseif ((Item.data >= 1010) and (Item.data <= 7979) ) then
		gems=2;
	end
	if gems~=nil then
    content.lookat.unique.itemList();
		Class=content.lookat.unique.ItemClass[Item.id];
		ItemCl=content.lookat.unique.writeClass(User,Class);

	    if ItemCl == nil then
	        return;
	    end

        FirstGemStr   = content.lookat.unique.writeStr(User,math.floor(math.mod(Item.data,10)/1)); -- Erste Stelle - Stärke des ersten Steins
		FirstGemName  = content.lookat.unique.writeGem(User,math.floor(math.mod(Item.data,100)/10));   -- Zweite Stelle - Art des ersten Steins
		SecondGemStr="";
		SecondGemName="";
		if gems==2 then
	        SecondGemStr   = content.lookat.unique.writeStr(User,math.floor(math.mod(Item.data,1000)/100));       -- Dritte Stelle - Stärke des zweiten Steins
			SecondGemName  = content.lookat.unique.writeGem(User,math.floor(math.mod(Item.data,10000)/1000));       -- Vierte Stelle - Art des zweiten Steins
		end
		if gems==2 then
			firstPart_de=" und ein ";
			firstPart_en=" and a ";
			space=" ";
		else
			firstPart_de="";
			firstPart_en="";
			space="";
		end
		if User:getPlayerLanguage() == 0 then
			User:inform("#w Du siehst, dass in "..ItemCl.." ein "..FirstGemStr.." "..FirstGemName..""..firstPart_de..""..SecondGemStr..""..space..""..SecondGemName.." eingelassen wurde.");
		else
			User:inform("#w You see, that there was set a "..FirstGemStr.." "..FirstGemName..""..firstPart_en..""..SecondGemStr..""..space..""..SecondGemName.." into the "..ItemCl..".");
		end
   end
end

function checkForAdminChar(User, Item)

	-- by pharse: Lydia Crowford, the tailor
	if User.id == 425144028 or User:isAdmin() then
		if string.find(User.lastSpokenText,"setcustomdata (%d+)") then
			a,b,newData = string.find(User.lastSpokenText,"setcustomdata (%d+)");
			if newData+1-1 == 0 then
				Item.data = 0;
			else
				Item.data = newData+2^30;
			end
			User:inform("Custom Data of "..world:getItemName(Item.id,0).." set to "..Item.data-2^30);
			world:changeItem(Item);
		elseif string.find(User.lastSpokenText,"initme") then
			User:increaseSkill(2,"tailoring",100-User:getSkill("tailoring"));
		elseif string.find(User.lastSpokenText,"showdata") then
			User:inform("ID: "..Item.id.." Data: "..(Item.data<=2^30 and "normal: "..Item.data or "custom: "..Item.data-2^30));
		end
	end
end
