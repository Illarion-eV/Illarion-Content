module("item.book.id_105_selfawareness", package.seeall)

-- UPDATE common SET com_script='item.book.id_105_selfawareness' WHERE com_itemid = 105;
-- TODO: needs to be adapted to the new skills

function InitRanks()
    AddRank("untaught","unwissend");
    AddRank("unskilled","ungeübt");
    AddRank("a beginner","ein Anfänger");    
    AddRank("skilled","geübt");
    AddRank("a assistant","ein Geselle");
    AddRank("a master","ein Meister");
    AddRank("a senior master","ein Altmeister");
    AddRank("a grand master","ein Großmeister");
end

function UseItem(User, SourceItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if InitBook() then
            AddGermanBookText("\n \n Das Buch der \n Selbsterkenntniss",105,0);
            AddGermanBookText("\n   Geschrieben \n      von \n       Nitram",0,0);
            AddGermanBookText("\n \n        Wissen \n           der \n       Sprachen",0,0);
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der gemeinsammen Sprache aller Völker",0,"common language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Menschen",0,"human language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Zwerge",0,"dwarf language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Elfen",0,"elf language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Halblinge",0,"halfling language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Echsenmenschen",0,"lizard language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Orks",0,"orc language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Gnome",0,"gnome language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Goblins",0,"goblin language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Feen",0,"fairy language");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Sprache der Alten",0,"ancient language");
        
            AddGermanBookText("\n \n       Wissen \n           der \n       Handwerke",0,0);
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Schmiedens",23,"smithing");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Goldschmiedens",236,"goldsmithing");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Schneiderns",6,"tailoring");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Schreinerns",9,"carpentry");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Bergbaus",2763,"mining");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Kochens",227,"cookingAndBaking");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Anbauens",271,"peasantry");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Holzfällens",74,"lumberjacking");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Edelstein schleifens",270,"gemcutting");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Glasblasens",313,"glass blowing");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Angelns",72,"fishing");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Kräutersammelns",126,"herb lore");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst der Alchemie",58,"alchemy");
        
            AddGermanBookText("\n \n       Wissen \n           der \n       Magie",0,0);
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst der Rechersche",266,"library research");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der alten Kunst des Transformo",0,"transformo");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der alten Kunst des Transfreto",0,"transfreto");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der alten Kunst des Pervestigatio",0,"pervestigatio");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der alten Kunst des Desicio",0,"desicio");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der alten Kunst des Commotio",0,"commotio");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der alten Kunst des magischen Widerstandes",0,"magic resistance");
        
            AddGermanBookText("\n \n       Wissen \n           des \n       Kampfes",0,0);
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Benutzung von Hiebwaffen",2731,"slashing weapons");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Benutzung von Schlagwaffen",226,"concussion weapons");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Benutzung von Stichwaffen",192,"puncture weapons");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Benutzung von Fernwaffen",2708,"distance weapons");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Anwendung des Ringens",0,"wrestling");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Vergiftens",2668,"poisoning");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Anwendung von Taktik",0,"tactics");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Ausweichens",0,"dodge");
            AddGermanBookText("\n Es scheint als seid ihr ~level~ in der Kunst des Parierens",0,"parry");
            
            AddEnglishBookText("\n \n The book of \n Selfawareness",105,0);
            AddEnglishBookText("\n   written \n      by \n       Nitram",0,0);
            AddEnglishBookText("\n \n        Knowledge \n         of the \n      Languages",0,0);
            AddEnglishBookText("\n It seems you are ~level~ in the common language of all races",0,"common language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the humans",0,"human language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the dwarfs",0,"dwarf language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the elves",0,"elf language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the halflings",0,"halfling language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the lizards",0,"lizard language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the orcs",0,"orc language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the gnomes",0,"gnome language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the goblins",0,"goblin language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the fairies",0,"fairy language");
            AddEnglishBookText("\n It seems you are ~level~ in the Language of the ancients",0,"ancient language");
        
            AddEnglishBookText("\n \n       Knowledge \n         of \n       Crafting",0,0);
            AddEnglishBookText("\n It seems you are ~level~ in the Art of smithing",23,"smithing");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of gold smithing",236,"goldsmithing");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of tailoring",6,"tailoring");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of carpentry",9,"carpentry");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of mining",2763,"mining");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of baking",227,"cookingAndBaking");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of peasantry",271,"peasantry");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of lumberjacking",74,"lumberjacking");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of gemcutting",270,"gemcutting");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of glass blowing",313,"glass blowing");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of fishing",72,"fishing");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of herb loreing",126,"herb lore");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of alchemy",58,"alchemy");
        
            AddEnglishBookText("\n \n       Wissen \n           der \n       Magie",0,0);
            AddEnglishBookText("\n It seems you are ~level~ in the Art of library research",266,"library research");
            AddEnglishBookText("\n It seems you are ~level~ in the ancient Art of transformo",0,"transformo");
            AddEnglishBookText("\n It seems you are ~level~ in the ancient Art of transfreto",0,"transfreto");
            AddEnglishBookText("\n It seems you are ~level~ in the ancient Art of pervestigatio",0,"pervestigatio");
            AddEnglishBookText("\n It seems you are ~level~ in the ancient Art of desicio",0,"desicio");
            AddEnglishBookText("\n It seems you are ~level~ in the ancient Art of commotio",0,"commotio");
            AddEnglishBookText("\n It seems you are ~level~ in the ancient Art of magic resistance",0,"magic resistance");
        
            AddEnglishBookText("\n \n       Wissen \n           des \n       Kampfes",0,0);
            AddEnglishBookText("\n It seems you are ~level~ in the using of slashing weapons",2731,"slashing weapons");
            AddEnglishBookText("\n It seems you are ~level~ in the using of concussion weapons",226,"concussion weapons");
            AddEnglishBookText("\n It seems you are ~level~ in the using of puncture weapons",192,"puncture weapons");
            AddEnglishBookText("\n It seems you are ~level~ in the using of distance weapons",2708,"distance weapons");
            AddEnglishBookText("\n It seems you are ~level~ in the using of wrestling",0,"wrestling");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of poisoning",2668,"poisoning");
            AddEnglishBookText("\n It seems you are ~level~ in the using of tactics",0,"tactics");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of dodge",0,"dodge");
            AddEnglishBookText("\n It seems you are ~level~ in the Art of parry",0,"parry");
        end
        SendBookPage(User,Counter)
        --User:learn(4,"library research",2,100)
		--Replace with new learn function, see learn.lua
    end
end

function AddRank(eName,gName)
    table.insert(Rank,{eName,gName});
end

function InitBook()
    if (gBookText==nil) then
        gBookText={};
        eBookText={};
        return true
    else
        return false
    end
end

function AddGermanBookText(Text,ItemID,Diff)
    AddToTable(gBookText,Text,ItemID,Diff)
end

function AddEnglishBookText(Text,ItemID,Diff)
    AddToTable(eBookText,Text,ItemID,Diff)
end

function SendBookPage(User,Counter)
    local BookTexts=nil;
    if (User:getPlayerLanguage()==0) then
        BookTexts=gBookText;
    else
        BookTexts=eBookText;
    end
    local pages=table.getn(BookTexts);
    local SendText=BookTexts[math.min(Counter,pages)][1];
    local PicID=BookTexts[math.min(Counter,pages)][2];
    if (SendText==nil) then SendText="" end
    if (PicID==nil) then PicID=0 end
    SendText=ModifyText(User,SendText,BookTexts[math.min(Counter,pages)][3])
    User:inform("#b|"..math.min(Counter,pages).."|"..PicID.."|"..SendText);
end

function AddToTable(TargetList,Text,ItemID,Difficult)
    local done=false;
    local outputted=false;
    repeat
        Len=string.len(Text)
        if (Len>200) then
            i=201;
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
                outText=string.sub(Text,1,200);
                Text=string.sub(Text,201,Len);
                table.insert(TargetList,{outText,ItemID,Difficult});
            end
        else
            done=true;
            table.insert(TargetList,{Text,ItemID,Difficult});
        end
    until done
end

function ModifyText(User,Text,Skillname)
    if (vocals==nil) then
        vocals={65,69,73,79,85};
    end
    local retText="";
    local Skill=0;
    if (Skillname~=0) then Skill=User:getSkill(Skillname) end;
    local Level=math.floor((Skill/100)*table.getn(Rank)-1)+1;
    return string.gsub(Text,"~level~",Rank[Level][2]);
end
