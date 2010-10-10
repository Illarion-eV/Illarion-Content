require("base.keys")
require("base.common")

module("item.keys", package.seeall)

-- UPDATE common SET com_script='item.keys' WHERE com_itemid IN (2121,2122,2123,2124,2141,2144,2145,2161,2556,2558,3054,3055,3056);

function UseItem(User,SourceItem,TargetItem,counter,param)
    local WALLPOS = position(-470,241,0);
    local DoorItem = base.common.GetFrontItem( User );
    if DoorItem == nil or DoorItem.id == 0 then
		-- try to sentence a character
		local targetChar = base.common.GetFrontCharacter(User);
		if targetChar then
			SentenceCharacter(User,SourceItem,targetChar,counter,param);
		end
        return;
    end

    if SourceItem.data == 7300 and DoorItem.id == 287 and DoorItem.pos == WALLPOS then

		world:erase(DoorItem,1);
		local charList = world:getPlayersInRangeOf(WALLPOS,15);
		for i,char in pairs(charList) do
			if char.pos.z == WALLPOS.z then
				char:inform(char:getPlayerLanguage()==0 and
					"#w Du hörst das Geräusch von sich verschiebendem Gestein." or
					"#w You hear the sound of moving stone.");
			end
		end
	elseif base.keys.CheckKey(SourceItem,DoorItem) then
        if base.keys.LockDoor(DoorItem) then
            base.common.InformNLS(User,"Du sperrst die Tür ab.","You lock the door.");
        elseif base.keys.UnlockDoor(DoorItem,User) then             -- User eingefuegt
            base.common.InformNLS(User,"Du sperrst die Tür auf.","You unlock the door.");
        end
    else
        base.common.InformNLS(User,"Der Schlüssel passt hier nicht.","The key doesn't fit here.");
    end
end

function SentenceCharacter(User,SourceItem,TargetChar,Counter,Param)
	if prisonPosition == nil then
		prisonPosition = {};
		prisonPosition[1] = position(122, 520, 0); -- cadomyr (queen rosaline)
		prisonPosition[2] = position(898, 775, 2); --runewick (      archmage elvaine)
		prisonPosition[3] = position(337, 215, 0); --galmair (      don valerio)
	end  
	
	if SourceItem.data>0 and SourceItem.data<=3 and User:isInRangeToPosition(prisonPosition[SourceItem.data],5) then
          User:talkLanguage(CCharacter.say,CPlayer.german,"#me verurteilt "..TargetChar.name.." zu "..(Counter*10).." Ressourcen."); 
          User:talkLanguage(CCharacter.say,CPlayer.english,"#me sentences "..TargetChar.name.." to "..(Counter*10).." resources."); 
          TargetChar:setQuestProgress(25,(Counter*10)); 
          TargetChar:setQuestProgress(26, SourceItem.data); --sets the town the char got arrested from as imprisoner id
          
          --[[filepoint,errmsg,errno=io.open("/home/SOMEWHERE/SOMETHING","w+"); 
          filepoint:write(os.date()..":"..user.name.." sentenced "..character.." to "..counter*10.."resources."); 
          filepoint:close();  ]]--
          world:gfx(41,TargetChar.pos); 
          world:makeSound(1,TargetChar.pos); 
          TargetChar:warp( position(-492,-484,-40) );    --position of the forced labour camp
          world:gfx(41,TargetChar.pos); 
     else 
          base.common.InformNLS( User, "Du scheiterst dabei, den Gauner zu verurteilen. Dies ist nur mit gefesselten Strolchen im Beisein des Anführers möglich.", "You failed to sentence the thug. This works only with tied up rogues in presence of the leader.");
     end
     
end



function LookAtItem(User,Item)
    local DataVal=Item.data;
    if (specialnames==nil) then
        specialnames={};
        specialnames[3001]={"Zwergenschlüssel","dwarven key"};
        specialnames[3002]={"Zwergenschlüssel","dwarven key"};
        specialnames[4080]={"Garons Schmieden Schlüssel","Garons goldsmith workshop key"};
        specialnames[4036]={"Gefängnissschlüssel #1","Prisonkey #1"};
        specialnames[4037]={"Gefängnissschlüssel #2","Prisonkey #2"};
        specialnames[4001]={"Stadttor Schlüssel","Towngate key"};
        specialnames[5014]={"Graue Zuflucht Schlüssel #1","Grey Refuge key #1"}
        specialnames[5015]={"Graue Zuflucht Schlüssel #2","Grey Refuge key #2"}
        specialnames[7100]={"Greenbriar Tavernen Schlüssel","Greenbriar Taverne key"};
        specialnames[7101]={"Greenbriar 1 Schlüssel","Greenbriar 1 key"};
        specialnames[7102]={"Greenbriar 2 Schlüssel","Greenbriar 2 key"};
        specialnames[7103]={"Greenbriar 3 Schlüssel","Greenbriar 3 key"};
        specialnames[1060]={"Varshikar 1 Schlüssel","Varshikar 1 key"};
        specialnames[1061]={"Varshikar 2 Schlüssel","Varshikar 2 key"};
        specialnames[1062]={"Varshikar 3 Schlüssel","Varshikar 3 key"};
        specialnames[1063]={"Varshikar 4 Schlüssel","Varshikar 4 key"};
        specialnames[1064]={"Varshikar 5 Schlüssel","Varshikar 5 key"};
        specialnames[1065]={"Varshikar 6 Schlüssel","Varshikar 6 key"};
        specialnames[1066]={"Varshikar 7 Schlüssel","Varshikar 7 key"};
        specialnames[4031]={"Schlüssel zur Arena","Key to the Arena"};
        specialnames[4050]={"Schlüssel zum Seahorse","Key to the Sea Horse"};
        specialnames[4051]={"Schlüssel zum Seahorse #1","Key to the Sea Horse #1"};
        specialnames[4052]={"Schlüssel zum Seahorse #2","Key to the Sea Horse #2"};
        specialnames[4053]={"Schlüssel zum Badezimmer","Key to the Bathroom"};
        specialnames[4054]={"Schlüssel zum Seahorse #3","Key to the Sea Horse #3"};
		specialnames[666]={"Schlüssel der Erde","Key of earth"};
		specialnames[667]={"Schlüssel des Feuers","Key of fire"};
		specialnames[668]={"Schlüssel des Windes","Key of air"};
		specialnames[669]={"Schlüssel des Wassers","Key of water"};
		
		specialnames[1]={"Gefängnisschlüssel von Cadomyr","Prison key of Cadomyr"};
		specialnames[2]={"Gefängnisschlüssel von Runewick","Prison key of Runewick"};
		specialnames[3]={"Gefängnisschlüssel von Galmair","Prison key of Galmair"};
    end
    local lang=User:getPlayerLanguage();
    if (specialnames[DataVal]~=nil) then
        if (lang==0) then
            world:itemInform(User,Item,"Du siehst "..specialnames[DataVal][1]);
        else
            world:itemInform(User,Item,"You see "..specialnames[DataVal][2]);
        end
    else
        if (lang==0) then
            world:itemInform(User,Item,"Du siehst "..world:getItemName(Item.id,0));
        else
            world:itemInform(User,Item,"You see "..world:getItemName(Item.id,1));
        end
    end
end

function MoveItemBeforeMove(User, SourceItem, TargetItem)
    if ((TargetItem.data~=3001) and (TargetItem.data~=3002)) then
        return true;
    end

    if (User:get_race() == 1) then
        return true;
    end

    if User:isAdmin() then
        return true;
    end

    if (TargetItem:getType()~=3) then
        base.common.InformNLS(User,
        "Der Schlüssel rutscht dir seltsamer Weise aus der Hand.",
        "The key slips out of your hand for a strange reason.");
        return false;
    end
    return true;
end

function MoveItemAfterMove( User, SourceItem, TargetItem )
    return true;
end
