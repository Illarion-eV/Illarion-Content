require("base.common")

module("base.books", package.seeall)

function InitBook()
    if (gBookText==nil) then
        gBookText={};
        eBookText={};
        BookLang ={};
        return true
    else
        return false
    end
end

function InitTitle()
    if (gBookTitle==nil) then
        gBookTitle={};
        eBookTitle={};
		return true
	else
		return false
	end
end

function AddGermanBookTitle(Title,ItemID,DataValue)
    gBookTitle[ItemID][DataValue] = Title;
end

function AddEnglishBookTitle(Title,ItemID,DataValue)
    eBookTitle[ItemID][DataValue] = Title;
end

function AddGermanBookText(Text,ItemID,Diff,DataValue)
    if (gBookText[DataValue] == nil) then
        gBookText[DataValue] = {};
    end
    AddToTable(gBookText[DataValue],Text,ItemID,Diff)
end

function AddEnglishBookText(Text,ItemID,Diff,DataValue)
    if (eBookText[DataValue] == nil) then
        eBookText[DataValue] = {};
    end
    AddToTable(eBookText[DataValue],Text,ItemID,Diff)
end

function AddLanguage(Skillname,BookID)
    BookLang[BookID] = Skillname;
end

function SendBookPage(User,DataVal,Counter)
    local BookTexts=nil;
    if (User:getPlayerLanguage()==0) then
        BookTexts=gBookText[DataVal];
    else
        BookTexts=eBookText[DataVal];
    end
    if (BookTexts == nil) then
        User:inform("#b|1|0| ");
    else
        local pages=table.getn(BookTexts);
        if ( Counter > pages ) then
            base.common.InformNLS(User,
            "Dieses Buch hat nur " .. pages .. " Seiten.",
            "This book only has " .. pages .. " pages.");
            return;
        end
        --local SendText=BookTexts[math.min(Counter,pages)][1];
        --local PicID=BookTexts[math.min(Counter,pages)][2];
        local SendText=BookTexts[Counter][1];
        local PicID=BookTexts[Counter][2];
        if (SendText==nil) then SendText="" end
        if (PicID==nil) then PicID=0 end
        if (BookLang[DataVal] == nil) then BookLang[DataVal]="common language" end
        --SendText=ModifyText(User,SendText,BookTexts[math.min(Counter,pages)][3],BookLang[DataVal]);
        SendText=ModifyText(User,SendText,BookTexts[Counter][3],BookLang[DataVal]);
        --User:inform("#b|"..math.min(Counter,pages).."|"..PicID.."|"..SendText);
        User:inform("#b|"..Counter.."|"..PicID.."|"..SendText);
        --User:learn(4,"library research",2,100)
		--Replace with new learn function, see learn.lua 
    end
end

function GetBookItemInform(User,Item)
    if (User:getPlayerLanguage()==0) then
        if (gBookTitle[Item.id][Item.data] == nil) then
        	world:itemInform(User,Item,"Du siehst "..world:getItemName(Item.id,0));

        else
        	world:itemInform(User,Item,"Du siehst "..gBookTitle[Item.id][Item.data]);

        end
    else
        if (eBookTitle[Item.id][Item.data] == nil) then
            world:itemInform(User,Item,"You see "..world:getItemName(Item.id,1));
        else
            world:itemInform(User,Item,"You see "..eBookTitle[Item.id][Item.data]);
        end  
    end
end      

function AddToTable(TargetList,Text,ItemID,Difficult)
    local done=false;
    local outputted=false;
    repeat
        Len=string.len(Text)
        if (Len>220) then
            i=221;
            outputted=false;
            repeat
                i=i-1;
                Char=string.sub(Text,i,i);
                if (Char==" ") then
                    outText=string.sub(Text,1,i-1);
                    Text=string.sub(Text,i+1,Len);
                    table.insert(TargetList,{outText,ItemID,Difficult});
                    outputted=true;
                end
            until i==0 or outputted;
            if (Len==string.len(Text)) then
                outText=string.sub(Text,1,220);
                Text=string.sub(Text,221,Len);
                table.insert(TargetList,{outText,ItemID,Difficult});
            end
        else
            done=true;
            table.insert(TargetList,{Text,ItemID,Difficult});
        end
    until done
end

function ModifyText(User,Text,Difficult,CharLangSkillName)
    if (vocals==nil) then
        vocals={65,69,73,79,85};
    end
    local retText="";
    local Skill=0; --TODO: User:getSkill("library research");
    local CharLangSkill = User:getSkill(CharLangSkillName);
    local Char="";
    local DoChange = false;
    local currentByte = 0;
    if (Text~="") then
        math.randomseed(string.byte(Text,1)+Difficult);
        for i=1,string.len(Text) do
            currentChar=string.sub(Text,i,i);
            currentByte=string.byte(currentChar,1);
            if (((currentByte>64) and (currentByte<91)) or ((currentByte>97) and (currentByte<123))) then
                if ((Skill<=Difficult) or (CharLangSkill<=80)) then
                    DoChange = false;
                    if ((math.random()*Difficult)<=(Difficult-Skill)) then
                        DoChange = true;
                    elseif ((math.random()*80)<=(80-CharLangSkill)) then
                        DoChange = true;
                    end
                    if (DoChange) then
                        local UpLowChar=0;
                        if (string.lower(currentChar)==currentChar) then
                            UpLowChar=1;
                        end
                        vocal=false
                        for k=1,5 do
                            if (currentByte==(vocals[k]+(35*UpLowChar))) then
                                vocal=true
                            end
                        end
                        if vocal then
                            Char=string.char(vocals[math.random(1,5)]+(32*UpLowChar));
                        else
                            repeat
                                fineChar=true;
                                Char=string.char(math.random(65+(32*UpLowChar),90+(32*UpLowChar)));
                                for k=1,5 do
                                    if (currentByte==(vocals[k]+(35*UpLowChar))) then
                                        fineChar=false;
                                    end
                                end
                            until fineChar;
                        end
                        retText=retText..Char;
                    else
                        retText=retText..currentChar;
                    end
                else
                    retText=retText..currentChar;
                end
            else
                retText=retText..currentChar;
            end
        end
    end
    return retText
end
