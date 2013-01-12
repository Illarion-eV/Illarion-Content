-- IG Voting System

-- Eingestellt auf: Wahl des Statthalters von TB

function UseItem(User, SourceItem)
    if (UserStat == nil) then
        UserStat = {};
    end
    if (VotingTargets(SourceItem.data) == "") then
        return
    end
    if ((world:getTime("month")<=9) and (world:getTime("year")<=19) and (world:getTime("day")<9)) then
        if (User:getPlayerLanguage()==0) then
            User:inform("Du versuchst in das Buch zu schreiben, aber auf dem Pergament scheint keine Tinte zu haften. Stattdessen erscheint kurz die Zeile \"Die Wahl hat noch nicht begonnen.\"");
        else
            User:inform("You try to write into the book, the ink doesn't stay on the pergament. Instead of it the line appears: \"The voting didn't start yet.\"");
        end
        return
    end
    if ((world:getTime("month")>=9) and (world:getTime("year")>=19) and (world:getTime("day")>=23) and (world:getTime("hour")>17) ) then
        if (User:getPlayerLanguage()==0) then
            User:inform("Du versuchst in das Buch zu schreiben, aber auf dem Pergament scheint keine Tinte zu haften. Stattdessen erscheint kurz die Zeile \"Die Wahl ist bereits vorbei.\"");
        else
            User:inform("You try to write into the book, the ink doesn't stay on the pergament. Instead of it the line appears: \"The voting is allready over.\"");
        end
        return
    end
    if not (CheckAllowed(User.id)) then
        if (User:getPlayerLanguage()==0) then
            User:inform("Du versuchst in das Buch zu schreiben, aber auf dem Pergament scheint keine Tinte zu haften. Stattdessen erscheint kurz die Zeile \"Ihr dürft hier nicht abstimmen.\"");
        else
            User:inform("You try to write into the book, the ink doesn't stay on the pergament. Instead of it the line appears: \"You are not allowed to vote here.\"");
        end
        return
    end
    if (User:getQuestProgress(100) == 0) then
        if (UserStat[User.id]~=SourceItem.data) then
            UserStat[User.id]=SourceItem.data;
            if (User:getPlayerLanguage()==0) then
                User:inform("Möchtest du wirklich für "..VotingTargets(SourceItem.data).." abstimmen? Dann benutze das Lesepult erneut");
            else
                User:inform("Do you really want to vote for "..VotingTargets(SourceItem.data).."? Then use the bookrest again");
            end
        else
            User:setQuestProgress(100,SourceItem.data);
            if (User:getPlayerLanguage()==0) then
                User:inform("Du schreibst deinen Namen auf das Pergament und deine Schrift ist nur einen Moment sichtbar ehe sie verschwindet. Trotzdem bist du dir nun sicher für "..VotingTargets(SourceItem.data).." abgestimmt zu haben.");
            else
                User:inform("You write your name on the pergament and your writing is just a moment visible, before it disappears. But your are sure, you voted for "..VotingTargets(SourceItem.data)..".");
            end
            UserStat[User.id]=nil;
        end
    else
        if (User:getPlayerLanguage()==0) then
            User:inform("Du versuchst in das Buch zu schreiben, aber auf dem Pergament scheint keine Tinte zu haften. Stattdessen erscheint kurz die Zeile \"Ihr habt bereits abgestimmt.\"");
        else
            User:inform("You try to write into the book, the ink doesn't stay on the pergament. Instead of it the line appears: \"You voted allready.\"");
        end
    end
end

function CheckAllowed(CharID)
    if (AllowedChar == nil) then
        AllowedChar = {};
        AllowedChar[249155209] = true;
        AllowedChar[1762406997] = true;
        AllowedChar[1507483473] = true;
        AllowedChar[786327046] = true;
        AllowedChar[1526226241] = true;
        AllowedChar[1000352604] = true;
        AllowedChar[287856974] = true;
        AllowedChar[489234769] = true;
        AllowedChar[1931824705] = true;
        AllowedChar[640240820] = true;
        AllowedChar[2023791632] = true;
        AllowedChar[51902034] = true;
        AllowedChar[681636187] = true;
        AllowedChar[1196208970] = true;
        AllowedChar[2019258712] = true;
        AllowedChar[1869548822] = true;
        AllowedChar[1413805587] = true;
        AllowedChar[84634791] = true;
        AllowedChar[1922030615] = true;
        AllowedChar[844066994] = true;
        AllowedChar[100328531] = true;
        AllowedChar[148425105] = true;
        AllowedChar[1444642249] = true;
        AllowedChar[1285033099] = true;
        AllowedChar[2132515498] = true;
        AllowedChar[463586217] = true;
        AllowedChar[896004470] = true;
        AllowedChar[1325549935] = true;
        AllowedChar[623038377] = true;
        AllowedChar[512984946] = true;
        AllowedChar[698634671] = true;
        AllowedChar[731932687] = true;
        AllowedChar[1968547853] = true;
        AllowedChar[1428460990] = true;
        AllowedChar[1573103159] = true;
        AllowedChar[90713753] = true;
        AllowedChar[202724543] = true;
        AllowedChar[41940907] = true;
        AllowedChar[531715934] = true;
        AllowedChar[410716928] = true;
        AllowedChar[192693739] = true;
        AllowedChar[1873353822] = true;
        AllowedChar[1418249948] = true;
        AllowedChar[1413966800] = true;
        AllowedChar[1173495179] = true;
        AllowedChar[1158785880] = true;
        AllowedChar[1649783172] = true;
        AllowedChar[2021208675] = true;
        AllowedChar[1264282940] = true;
        AllowedChar[1863252300] = true;
        AllowedChar[1233877297] = true;
        AllowedChar[1064873426] = true;
        AllowedChar[143067905] = true;
        AllowedChar[197957889] = true;
        AllowedChar[1153599598] = true;
        AllowedChar[1946617545] = true;
        AllowedChar[539921000] = true;
        AllowedChar[1467958675] = true;
        AllowedChar[1111146812] = true;
        AllowedChar[1206012819] = true;
        AllowedChar[363819149] = true;
        AllowedChar[49393887] = true;
        AllowedChar[1882127731] = true;
        AllowedChar[1060725825] = true;
        AllowedChar[1781588520] = true;
        AllowedChar[92852365] = true;
        AllowedChar[998660865] = true;
        AllowedChar[1114500763] = true;
        AllowedChar[153045458] = true;
        AllowedChar[1453583611] = true;
        AllowedChar[483536100] = true;
        AllowedChar[1318948010] = true;
        AllowedChar[1744333371] = true;
        AllowedChar[1540361124] = true;
        AllowedChar[1963302371] = true;
    end
    if (AllowedChar[CharID] == true) then
        return true
    else
        return false
    end
end

function VotingTargets(TarID)
    if (TarID == 1) then
        return "Brer Beothach";
    elseif (TarID == 2) then
        return "Liles";
    else
        return "";
    end
end

function LookAtItem(User,Item)
    if (VotingTargets(Item.data) ~= "") then
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Du siehst ein fast leeres Buch. Nur eine Zeile steht dort: \"Schreibt hier euren Namen ein um für "..VotingTargets(Item.data).." zu stimmen.\"");
        else
            world:itemInform(User,Item,"You see a nearly empty book. Only one line is written: \"Write down your name here to vote for "..VotingTargets(Item.data)..".\"");
        end
    else
        world:itemInform(User,Item,world:getItemName(Item.id,User:getPlayerLanguage()));
    end
end
