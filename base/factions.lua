require("base.common")
--THE EDITABLE PART FOR NEW TOWNS OR GUILDS IS SOME LINES BELOW

-- NOTE: town IDs for:
--- Cadomyr: 1
--- Runewick: 2
--- Galmair: 3

module("base.factions", package.seeall)



function InitFactionLists()
   
	notaryNames = {"Torina Scibrim"}
   
	--Lists for Functions--
	NpcLocation = {};   --holds the location(townID) of the NPC
	TextRepeatCnt={}; --a value/counter to allow text repeation(e.g.for questions)
	
	--Towns--
	TownList={};
    
	TownMainKey={};
	TownJailKey={};
    --Guilds
    GuildIDList={};
    GuildNameGList={};
    GuildNameEList={};
    GuildMainKey={};
	GuildJailKey={};
	
	--OtherLists


	PriceListForDecreeAndKey = {2, 10, 30, 2, 2}; --prices of the membership decrees for a guild and for the keys(in SILVERCOINS!)

    GuildRanklist = { {gusage = "(Anwärter)", eusage = "(aspirant)"},
					  {gusage = "(vollständiges Mitglied)", eusage = "(full member)"},
			 		  {gusage = "(Anführer)", eusage = "(leader)"} };
	--A list with the Ranks, Rank 8 and Rank 9 can not be reached with faction points(e.g. npc quests), only with GM help, don't give any normal player rank 9!
	TownRankList = { {gRank = "Leibeigener", eRank = "serf"},                --rank 1
					 {gRank = "Bauer", eRank = "peasant"},           --rank 2
					 {gRank = "Arbeiter", eRank = "worker"},         --rank 3
					 {gRank = "Plebejer", eRank = "plebeian"},       --rank 4
					 {gRank = "Bürger", eRank = "citizen"},          --rank 5
					 {gRank = "Edelmann", eRank = "knight"},         --rank 6
					 {gRank = "Patrizier", eRank = "patrician"},     --rank 7
					 {gRank = "Adliger", eRank = "noble"},           --rank 8
					 {gRank = "Herrscher", eRank = "sovereign"}};    --rank 9
					 
	TownRankList[0] = {gRank="Geächteter", eRank="outcast"};         --rank 0
end

if not InitFaction then
	InitFactionLists();
	InitFaction = true;
	RANK_OFFSET = 2;      --needed to know from where the ranks for each town begin (look return value of get)
	RANKPOINTS_OFFSET = 8;--needed to know from where the rankpoints for each town begin (look return value of get)
    citizenRank = 1;
    outcastRank = 0;
    leaderRank = 9;

--==================================ADD NEW TOWNS AND GUILDS HERE===============
--AddTown(TownID,TownName), IDs from 1-9
--AddAdditionalTownName(German Trigger, English Trigger)
--AddTownMainKey(TownID, KeyID, KeyQuality, KeyData)

AddTown(1,"Cadomyr");
AddTownMainKey(1,2121, 333, 5030);
AddTownJailKey(12,2121, 333, 5031);
AddTown(2,"Runewick");
AddTown(3,"Galmair");

--[[AddTown(12,"Silberbrand","Silverbrand", 1022, 102, 111);
AddTownMainKey(12,2121, 333, 5030);
AddTownJailKey(12,2121, 333, 5031);   ]]--




-------The Guilds        Same as above IDs from 11-99 only!
AddGuild(11,"Graue Rose","Grey Rose");
AddGuildMainKey(11,2121, 333,5014);
AddGuildJailKey(11,2121, 333,5015);
AddGuild(12,"Die Illarion Gruppe", "The Illarion Group");
AddGuild(13,"Stadtwache Cadomyr","Townguard Cadomyr");
AddGuildJailKey(13,2121, 333,5015);
AddGuild(14,"Stadtwache Runewick","Townguard Runewick");
AddGuild(15,"Stadtwache Galmair","Townguard Galmair");
end
--==================================END OF THE EDITABLE PART====================


--[[
    AddTown
	Add a Town to the Faction System(be carefull, adding a new town needs further changes in the whole script!)
    @param TownID		- the ID of the town(1-9 allowed)
    @param TownName		- the Townname 
]]
function AddTown(TownID, TownName)
	table.insert(TownList,{townID=TownID, townName=TownName});
end
--[[
    AddGuild
	Add a Guild to the Faction System
    @param GuildID              - the ID of the guild(11-99) allowed
    @param GuildNameG,GuildNameE - the Guildname in German and English
]]
function AddGuild(GuildID, GuildNameG, GuildNameE)
	table.insert(GuildIDList,GuildID);
	table.insert(GuildNameGList,GuildID,{ GuildNameG});
    table.insert(GuildNameEList,GuildID,{GuildNameE});
end

--Add an additional Name for the Guild(e.g. Trollsbane Guards, Trolls Bane Guards,..)
function AddAdditionalGuildName(GuildNameG,GuildNameE)
    table.insert(GuildNameGList[table.getn(GuildNameGList)],GuildNameG)
    table.insert(GuildNameEList[table.getn(GuildNameEList)],GuildNameE)
end

--[[
    AddTownMainKey/ AddTownJailKey / AddGuildMainKey / AddGuildJailKey
	Add the Main Key/Jail Key of the town of a faction with the Faction ID (TownMID)
    @param TownMID                  - the ID of the town the key shall be added
    @param KeyID,KeyQuality,KeyData - the ID,Quality and Data of the Key
]]
function AddTownMainKey(TownMID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(TownMainKey,TownMID, {KeyID,KeyQuality,KeyData});
end

function AddTownJailKey(TownJID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(TownJailKey,TownJID, {KeyID,KeyQuality,KeyData});
end

function AddGuildMainKey(GuildMID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(GuildMainKey,GuildMID,{KeyID,KeyQuality,KeyData});
end

function AddGuildJailKey(GuildJID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(GuildJailKey,GuildJID, {KeyID,KeyQuality,KeyData});
end

function getTownNameByID(TownID)
	for i=1, #(TownList) do
		if (TownList[i].townID == TownID) then
			return TownList[i].townName
		end
	end
end


--[[
    CheckTheName
	Looks up whether the Guild the Player mentioned in "message" exists or not 
    @param message					- The Message the Player said
    @param originator				- The Player Struct
    
	@return bool					- true if GuildName found else false
]]
function CheckTheName(message,ListIndex,originator) --looks up for a trigger
    local TheList;

	--[[if originator:getPlayerLanguage()==0 then
		TheList=GuildNameGList;
	else
		TheList=GuildNameEList;
	end --]]
	TheList=GuildNameEList;
	
	if TheList[ListIndex]~=nil then
		for i,pattern in pairs(TheList[ListIndex]) do
	        if (string.find( message, string.lower(pattern) )~=nil) then
	            return true;
	        end
	    end
		
		TheList=GuildNameGList;
		                  
		for i,pattern in pairs(TheList[ListIndex]) do
	        if (string.find( message, string.lower(pattern) )~=nil) then
	            return true;
	        end
	    end
	    
	end
    return false;
end

--[[
    setLocation
	Looks in which town the npc is placed and sets and returns the townID of the town, needs to get executed in the initalizeNpc - Function
    @param thisNPC -- the NPCStruct

    @return digit - the townID of the town the npc is placed in
]]
-- function setLocation(thisNPC)
	-- local townID = 0;
	-- if (border==nil) then
		-- border={}
	-- end
			--border-Xpos-left, border-Xpos-right, border-Ypos-top, border-Ypos-bottom
	-- border[1]={             0,                500,             415,                845};  --cadomyrs borders
			--border-Xpos-left, border-Xpos-right, border-Ypos-top, border-Ypos-bottom
	-- border[2]={           650,               1000,             380,                950}; --runewicks borders
			--border-Xpos-left, border-Xpos-right, border-Ypos-top, border-Ypos-bottom
	-- border[3]={           220,                650,             100,                415}; --galmairs borders

	-- if thisNPC.pos.x>border[1][1] and thisNPC.pos.x<border[1][2] then         --checks the x-Coordinates with the borders
	    -- if thisNPC.pos.y>border[1][3] and thisNPC.pos.y<border[1][4] then     --checks the y-Coordinates with the borders
			-- townID = 1;
		-- end
	-- end
	-- if thisNPC.pos.x>border[2][1] and thisNPC.pos.x<border[2][2] then         --checks the x-Coordinates with the borders
	    -- if thisNPC.pos.y>border[2][3] and thisNPC.pos.y<border[2][4] then     --checks the y-Coordinates with the borders
			-- townID = 2;
		-- end
	-- end
	-- if thisNPC.pos.x>border[3][1] and thisNPC.pos.x<border[3][2] then         --checks the x-Coordinates with the borders
	    -- if thisNPC.pos.y>border[3][3] and thisNPC.pos.y<border[3][4] then     --checks the y-Coordinates with the borders
			-- townID = 3;
		-- end
	-- end
	-- NpcLocation[thisNPC.id]=townID;
	-- return townID;
-- end

--[[ returns "rankC", "rankG" ... for easier writing the faction values over the id in the faction struct
example:
	local factionv = getFactionInformations(originator);
	factionv[r_index(1)] = 5; --sets factionvalue of cadomyr to 5

]]--
-- function r_index(townid)
	-- return DigitToIndex[townid+RANK_OFFSET];
-- end

--same like the above function, only for the rankpoints
-- function rp_index(townid)
	-- return DigitToIndex[townid+RANKPOINTS_OFFSET];
-- end


--[[
    get_Faction
	Looks up to which Faction a Character belongs and checks also his rank
    @param originator -- the CharacterStruct

    @return Array - 1. a counter how often a Char changed the town, 2.the Town he belongs to ,
					3-5 the Ranks/Reputation in the Towns Cadomyr, Runewick and Galmair
]]
function get_Faction(originator)

	--format of questprogress 2 digits faction change counter, 1 digit town id, 1 digit town rank
	local qpg = originator:getQuestProgress(200);
	if qpg==nil or qpg == 0 then
		originator:setQuestProgress(200,0100); --set the qpg to "zero"
	end

	local towncnt = math.floor(qpg/10^2); -- a counter which states how often a char switched the faction
	local 	  tid = math.floor ((qpg-towncnt*10^2)/10);   -- the id of the town the char belongs to
	local rankTown = math.floor(qpg-(towncnt*10^2+ tid*10));

	return { towncnt = towncnt, tid = tid, rankTown = rankTown};
end

--[[
    get_Guild
	Looks up to which Guild a Character belongs and his Rank in this guild
    @param originator -- the CharacterStruct

    @return Array - 1.the Guild the Char belongs to, 2. the Rank in the Guild
]]
function get_Guild(originator)

	local qpg = originator:getQuestProgress(201);
	if qpg==nil or qpg == 0 then
		originator:setQuestProgress(201,110); --set the qpg to "zero" default: rank 1 and guild 10(== no guild)
	end

	local rankGuild = math.floor(qpg/100); -- the rank in the Guild(1 digit)
	local 		gid = (qpg - rankGuild*100);-- the Guild ID(2 digits(10-99))

	return {rankGuild = rankGuild, gid = gid};
end
--[[
    get_Rankpoints
	Looks up how much Rankpoints a Character has
    @param originator -- the CharacterStruct

    @return qpg - rankpoints in realm
]]
function get_Rankpoints(originator)

	local qpg = originator:getQuestProgress(202); -- digit 1&2 = rankpoints
	if qpg==nil or qpg == 0 then
		originator:setQuestProgress(202,00); --set the qpg to "zero"
	end

	return gpg;
end

--[[
    get
	Looks up to which Guild and Town a Character belongs to and his Rank
    @param originator -- the CharacterStruct

    @return Array - all values about Factionmembership, Guildmembership and Rankpoints
]]--
function getFactionInformations(originator)

	local Faction = get_Faction(originator);
	local Guild = get_Guild(originator);
	local Rankpoints = get_Rankpoints(originator);

	return {towncnt = Faction.towncnt, tid = Faction.tid, rankTown = Faction.rankTown,
			rankGuild = Guild.rankGuild, gid = Guild.gid,
			rankpoints = Rankpoints};
end

--[[
    put_Faction//Guild
	Saves the Factionchanges of the Char//Guildchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Faction//Guild - the Array which includes the values to be changed

]]
function put_Faction(originator,Faction)

	--------don't allow unknown ranks-----
	if Faction.rankTown>9 then Faction.rankTown = 9 elseif Faction.rankTown<0 then Faction.rankTown = 0; end
	-------------write changes------------
	
	local qpg=tonumber(Faction.towncnt..Faction.tid..Faction.rankTown);
	originator:setQuestProgress(200,qpg);
end

function put_Guild(originator,Guild)
	if Guild.gid ~= nil or Guild.rankGuild ~= nil then
		local qpg=(Guild.rankGuild..Guild.gid)+1-1;
		originator:setQuestProgress(201,qpg);
	else
		--nothing
	end
end



function IncreaseRank(rankpoints,rank)
	local overflow = 99;
	if (rankpoints-overflow) > 89 then rankpoints = overflow; else rankpoints = 10 + (rankpoints-99); end --max. number of rankpoints to add is 89!
	if rank<7 and rank>0 then
		rank = rank + 1;     --raise the Rank
	end
	return rankpoints,rank;
end

function DecreaseRank(rankpoints,rank)
	local underflow = 10;
	if (underflow - rankpoints>89) then rankpoints = underflow; else rankpoints = (99 + rankpoints) -10; end
	if rank<=8 and rank>0 then
		rank = rank - 1;     --sink the Rank
	end
	return rankpoints,rank;

end
--[[
    put_Rankpoints
	Saves the Factionchanges of the Char//Guildchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Rankpoints - the value Rankpoints

]]
function put_Rankpoints(originator, rankpoints)
	local Faction = getFactionInformations(originator);
	 ---increase rank ----
	if (Faction.rankpoints >99) then
		local rank = Faction.rankTown; 
		Faction.rankpoints, Faction.rankTown = IncreaseRank(Faction.rankpoints,Faction.rankTown);
		if Faction.rankTown>rank then  
			base.common.InformNLS( originator, "Du hast soeben einen neuen Rang in "..getTownNameByID(Faction.tid).." erreicht.", 
				"You reached a new town rank in "..getTownNameByID(Faction.tid).. ) end
	end
	----lower rank----------
	if (Faction.rankpoints <10) then
		local rank = Faction.rankTown; 
		Faction.rankpoints,Faction.rankTown = DecreaseRank(Faction.rankpoints,Faction.rankTown);
		if Faction.rankTown<rank then  
			base.common.InformNLS( originator, "Durch deine ständigen Konflikte mit dem Gesetz ist dein Rang in "..getTownNameByID(Faction.tid).." um eine Stufe gesunken.", 
				"Because of your permanent conflicts with the law your rank sinks for a degree in "..getTownNameByID(Faction.tid).. ) end
	end

	------save changes----------------
	put_Faction(originator,Faction);
	originator:setQuestProgress(202,rankpoints);
end
--[[
    put_
	Saves the Factionchanges of the Char//Guildchanges of the Char//Rankpoints
    @param CharacterStruct - The character who gets the new Questprogress
    @param Faction - the Array which includes the values Rankpoints//Guild Values//Town Values

]]
function setFactionInformations(originator,Factionvalues)
	--town
    put_Faction(originator,Factionvalues);
	-----------------------
	--guild
    put_Guild(originator,Factionvalues);
	-----------------------
	--rankpoints town
	put_Rankpoints(originator,Factionvalues);
end




function CalcSilverCopper(CAmount)
    local GAmount=math.floor(CAmount/10000);
    local SAmount=math.floor((CAmount-GAmount*10000)/100);
    local CAmount=CAmount-(SAmount*100+GAmount*10000);
    return GAmount,SAmount,CAmount
end

-- Geldprüfung
-- Return 1 (bool) genug Geld - nicht genug Geld
function CheckMoney(User,Gold,Silber,Kupfer)
    local UserGold=User:countItem(61);
    local UserSilber=User:countItem(3077);
    local UserKupfer=User:countItem(3076);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local UserAmount=(UserGold*10000)+(UserSilber*100)+UserKupfer;
    if (Amount<=UserAmount) then
        return true
    else
        return false
    end
end

-- Bezahlen Funktion
-- Versucht Silber/Kupfermünzen passend zu nehmen
-- Wenn nicht möglich: Weicht auf andere Münzen aus

-- Folgende Liste wird nicht korrekt zurückgegeben (Gold fehlt). Die ts-Version hat sie nicht (Schlamperei).  An Vilarion wenden(dalli).
-- Return 1: Liste {Bezahltes Silber (int), Bezahltes Kupfer (int)}
function Pay(User,Gold,Silber,Kupfer)

    local GoldID=61;
    local SilberID=3077;
    local KupferID=3076;
    local PayGold=0;
    local PaySilber=0;
    local PayKupfer=0;
    local MissGold=Gold;
    local MissSilber=Silber;
    local MissKupfer=Kupfer;
    local UserGold=User:countItem(GoldID);
    local UserSilber=User:countItem(SilberID);
    local UserKupfer=User:countItem(KupferID);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local GoldAlsKupfer=0;
    local SilberAlsKupfer=0;
    local GoldAlsSilber=0;

    GoldAlsKupfer = math.min( MissGold, math.floor( UserKupfer/10000 ) );
    PayKupfer = GoldAlsKupfer * 10000;
    MissGold = MissGold - GoldAlsKupfer;
    UserKupfer = UserKupfer - PayKupfer;

    GoldAlsKupfer = math.floor( UserKupfer/100 );
    GoldAlsSilber = 100 - GoldAlsKupfer;
    if ((MissGold > 0) and (GoldAlsKupfer > 0) and (UserSilber >= GoldAlsSilber)) then
        PayKupfer = PayKupfer + 100 * GoldAlsKupfer;
        PaySilber = PaySilber + GoldAlsSilber;
        MissGold = MissGold - 1;
        UserKupfer = UserKupfer - 100 * GoldAlsKupfer;
        UserSilber = UserSilber - GoldAlsSilber;
    end;

    SilberAlsKupfer = math.min( MissSilber, math.floor( UserKupfer/100 ) );
    PayKupfer = PayKupfer + SilberAlsKupfer * 100;
    MissSilber = MissSilber - SilberAlsKupfer;
    UserKupfer = UserKupfer - SilberAlsKupfer * 100;

    if (UserKupfer >= MissKupfer) then
        PayKupfer = PayKupfer + MissKupfer;
    else
        MissSilber = MissSilber + 1;
        PayKupfer = PayKupfer + MissKupfer - 100;
    end;

    GoldAlsSilber = math.min( MissGold, math.floor( UserSilber/100 ) );
    PaySilber = PaySilber + GoldAlsSilber * 100;
    MissGold = MissGold - GoldAlsSilber;
    UserSilber = UserSilber - GoldAlsSilber * 100;

    if (UserSilber >= MissSilber) then
        PayGold = MissGold;
        PaySilber = PaySilber + MissSilber;
    else
        PayGold = MissGold + 1;
        PaySilber = PaySilber + MissSilber - 100;
    end;


    if (PayGold>0) then
        User:eraseItem(GoldID,PayGold);
    end
    if (PaySilber>0) then
        User:eraseItem(SilberID,PaySilber);
    elseif (PaySilber<0) then
        User:createItem(SilberID,PaySilber*(-1),333,0);
    end
    if (PayKupfer>0) then
        User:eraseItem(KupferID,PayKupfer);
    elseif (PayKupfer<0) then
        User:createItem(KupferID,PayKupfer*(-1),333,0);
    end
end



--[[
    makeCharMemberOfTown
	makes the char citizen of the town//or leader if the char is a gm
    @param originator -- the PlayerStruct
    @param Factionvalues -- the List with the Factionvalues of the Char
    @param theRank(number) -- the rank the char shall get in the town
]]
function makeCharMemberOfTown(originator,fv,theRank, theTown)
	NPCList = world:getNPCSInRangeOf(originator.pos, 3);
	for i = 1, #(NPCList) do
		for j=1, #(notaryNames) do
			if NPCList[i].name == notaryNames[j] then
				thisNPC = NPCList[i]
			end
		end
	end
	
	if theRank==leaderRank then --make char to leader of this town
		fv.tid = theTown; --make him member of this town
		fv.rankTown = leaderRank; --give him the leader rank
		fv = put_Faction(originator,fv);
		return;

	elseif theRank==citizenRank then --make char to citizen
		if (fv.tid == theTown) then --already citizen
		 	gText="Ihr seid bereits Bürger dieser Stadt!";
			eText="You're already citizen of this town!";
			outText=base.common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
		end

		local GAmount, SAmount,CAmount = CalcSilverCopper(100*(2^fv.towncnt));
		if not CheckMoney(originator,GAmount,SAmount,CAmount) then --not enough money!
		 	gText="Ihr habt nicht genug Geld dabei!";
			eText="You don't have enough money with you!";
			outText=base.common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
		end
		
		fv.rankpoints = 20 -- set default value for rankpoints
		fv.tid = theTown; --set new Town ID
				
		if (fv.towncnt<99) then fv.towncnt = fv.towncnt+1; end; -- raise the town counter
		put_Faction(originator,fv); --write fv in Questprogress
		Pay(originator,GAmount,SAmount,CAmount); --take money

		gText="Ihr seid nun als Bürger dieser Stadt eingetragen.";
		eText="You're now registered as citizen of this town.";
		outText=base.common.GetNLS(originator,gText,eText);
        thisNPC:talk(Character.say, outText);
	end
	return;
end


--[[
    deleteDecree
	Exchanges a decree against guild membership etc., 
    @param originator -- the PlayerStruct
]]
--[[function deleteDecree(originator)
	thisNPC = world:getNPCSInRangeOf(originator.pos, 3);
	
	if not ((originator:countItem(3110))==0) then --does he really have decrees
			fv = getFactionInformations(originator); --read faction values
			  decree= originator:getItemList(3110); --get a list of decrees

			if decree[1].quality == 750 then --guild decree

				fv.rankGuild = math.floor(decree[1].data/100); -- the rank in the Guild(1 digit)
				fv.gid	    = (decree[1].data - fv.rankGuild*100);-- the Guild ID(2 digits(10-99))

				gText="Gut, ich werde euch als "..GuildRanklist[fv.rankGuild].gusage.." in der Gilde "..GuildNameGList[fv.gid][1].." eintragen.";
    			eText="Good, I will write your name down as "..GuildRanklist[fv.rankGuild].eusage.." in the guild "..GuildNameEList[fv.gid][1];
            	fv = setFactionInformations(originator,fv); --write faction values
				world:erase(decree[1],1); --deletes 1 decree
			elseif decree[1].quality == 751 then -- unban decree
			
				if (fv[r_index(decree[1].data)] == 0) then --really banned in the town?
					gText = "Ihr wurdet aus der Verbanntenliste gestrichen, nun könnt ihr Bürger dieser Stadt werden wenn Ihr es wollt.";
					eText = "You're now deleted from the banned register, now you can join this town as citizen, if you want.";
					fv[r_index(decree[1].data)] = 1; --set rank to 1
					fv = setFactionInformations(originator,fv); --write faction values
					world:erase(decree[1],1);
				else
					gText = "Ihr seid in dieser Stadt nicht verbannt!";
					eText = "You're not banned in this town!";
				end
			else
				gText="Dieses Dekret ist nicht einlösbar";
				eText="This decree is not exchangeable";
			end
			
			outText=base.common.GetNLS(originator,gText,eText);
			thisNPC:talk(Character.say, outText);
			return;
	else
			gText="Es tut mir leid, aber ihr habt kein Dekret bei euch!";
			eText="I'm sorry but you have no decree with you!";
			outText=base.common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
	end
end]]--
