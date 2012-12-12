---------------------------------------------------------------------------
-- Core Script for Simple npc script language
--
-- By martin and nitram
---------------------------------------------------------------------------
require("base.factions")
module("npc.base.autonpcfunctions", package.seeall)

--[[
- GetNLS
- @param User CharStruct
- @param textInDe string german text
- @param textInEn string english text
- @return string one of the input strings depending on the User language
]]
function GetNLS( User, textInDe, textInEn )
    if User:getPlayerLanguage()==0 then
        return textInDe;
    else
        return textInEn;
    end
    return "";
end

--[[
- InitTalkLists
- Preparing the arrays for talk npcs
]]
function InitTalkLists()
    TraderTrig   = { };
    TraderText   = { };
	TraderInform = { };
    CycleText    = { };
    Conditions   = { };
    Consequences = { };
    NPCStatus    = { };
    speakCount   = 1;
    walkCount    = 0;
    verwirrt     = false;
    radius       = 0;
    saidNumber   = 0;
	state        = 0;
	centerPos    = position(thisNPC.pos.x,thisNPC.pos.y,thisNPC.pos.z);
    idle         = true;
    currentTalk  = 0;
    thisNPC:increaseSkill(1,"common language",100);

    TraderFirst  = true;
end

--[[
- AddCycleText
- @param gText string german text
- @param eText string english text
- Adds the german and english text to the list of texts the npc says
  randomly from time to time
]]
function AddCycleText(gText,eText)
    table.insert(CycleText,{gText,eText});
end

--[[
- increaseLangSkill
- @param LangList array list of languages the npc is able to speak
- increases the language skills of the characters so he can speak the
  chosen languages
]]
function increaseLangSkill(LangList)
    for i=1,table.getn(LangList) do
        setLang=true;
        if (LangList[i]==0) then LangSkill="common language";
        elseif (LangList[i]==1) then LangSkill="human language";
        elseif (LangList[i]==2) then LangSkill="dwarf language";
        elseif (LangList[i]==3) then LangSkill="elf language";
        elseif (LangList[i]==4) then LangSkill="lizard language";
        elseif (LangList[i]==5) then LangSkill="orc language";
        elseif (LangList[i]==6) then LangSkill="halfling language";
        elseif (LangList[i]==7) then LangSkill="fairy language";
        elseif (LangList[i]==8) then LangSkill="gnome language";
        elseif (LangList[i]==9) then LangSkill="goblin language";
        elseif (LangList[i]==10) then LangSkill="ancient language";
        else setLang=false;
        end
        if (setLang==true) then
            thisNPC:increaseSkill(1,LangSkill,100);
        end
    end
end

--[[
- LangOK
- @param User CharStruct the character who speaks with the npc
- @param LangList array the list of languages the npc is able to speak
- Checks if the active language of the User is in the list of languages the
  npc is able to speak
]]
function LangOK(User,LangList)
    for i=1,table.getn(LangList) do
        if (User.activeLanguage==LangList[i]) then
            thisNPC.activeLanguage=User.activeLanguage;
            return true;
        end
    end
    return false;
end

--[[
- SetRadius
- @param value number of the new radius
- Makes the npc walking around automatically
]]
function SetRadius( value )
    value = value * 1;
    if ( value > 0 ) then
        radius = value;
    else
        radius = 0;
    end
end

--[[
- AddTraderTrigger
- @param Trigger string the pattern that triggers the answer
- @param Answer string the answer the npc says in case the Trigger is found
- Adds a Trigger with answer, new state and condition to the list of
  NPC Triggers
]]
function AddTraderTrigger(Trigger,Answer)
    Trigger = string.gsub(Trigger,"%%NUMBER","(%%d+)");
    Trigger = string.gsub(string.lower( Trigger )," ",".+");
    table.insert(TraderTrig,{Trigger});
    table.insert(TraderText,{Answer});
end

--[[
- AddAdditionalText
- @param Answer string add a Additional Answer to the last added trigger
]]
function AddAdditionalText(Answer)
    table.insert(TraderText[table.getn(TraderText)],Answer)
end

--[[
- AddAdditionalTrigger
- @param Trigger string add a Additional Patters to the last added trigger
]]
function AddAdditionalTrigger(Trigger)
    Trigger = string.gsub(Trigger,"%%NUMBER","(%%d+)");
    Trigger = string.gsub(string.lower( Trigger )," ",".+");
    table.insert(TraderTrig[table.getn(TraderTrig)],Trigger)
end

--[[
- AddCondition
- @param string Condition Type
- [@param string] Additional Condition Value
- [@param string] Comparing Kind
- @param int compare value
]]
function AddCondition( ... )
    offset = table.getn( TraderTrig );
    if not Conditions[offset] then
        Conditions[offset] = { };
    end
    table.insert( Conditions[offset], arg );
end

--[[
- AddConsequence
- @param string Consequence Type
- [@param string] Additional Consequence Value
- @param int new value
]]
function AddConsequence( ... )
    offset = table.getn( TraderTrig );
    if not Consequences[offset] then
        Consequences[offset] = { };
    end
    table.insert( Consequences[offset], arg );
end

--[[
- TellSmallTalk
- @param message string the message the user said
- @param User CharStruct the User who spoke
- makes the npc reacting on a message
]]
function TellSmallTalk(message,Char)
    --User = Char; -- global User for external function calls
    User = getCharForId(Char.id);
	local i=1;

    message = string.lower(message);
	state = NPCStatus[User.id];

    length = table.getn( TraderTrig );
    while not CheckForTrigger(message,User,i) do
        i = i + 1;
        if ( i > length ) then
            break;
        end
    end
    --[[if ( length < i ) then
        folder = "/home/nitram/npclog/";
        --filepoint,errmsg=io.open(folder.."npclog_rs.log","r+");  --RS
        filepoint,errmsg=io.open(folder.."npclog_ts.log","r+");  --TS
        if (filepoint~=nil) then
            filepoint:seek("end");
            filepoint:write(thisNPC.name.." - "..message.."\n");
            filepoint:close();
        end
    end--]]
    if (table.getn(TraderText[i])>1) then 
        TextSel=math.random(1,table.getn(TraderText[i]));
    else
        TextSel=1;
    end
    PerformConsequences( User, i );
    answer = string.gsub(TraderText[i][TextSel],"%%CHARNAME",User.name);
    answer = string.gsub(answer,"%%NPCNAME",thisNPC.name);
    if QuestID~=nil then answer = string.gsub(answer,"%%QUESTSTATUS",User:getQuestProgress(QuestID)); end
    if not (saidNumber==nil) then
        answer = string.gsub(answer,"%%NUMBER",saidNumber);
    end;
	state = NPCStatus[User.id];
    NPCTalking( thisNPC, answer );
	CharInform( User );
	TraderInform = nil;
end

--[[
- CheckForTrigger
- @param message string the message we have to check
- @param User CharStruct the User who spoke
- @param ListIndex int the Index of the trigger in the triggerlist
- @return boolean returns true of a fitting Trigger was found, else false
]]
function CheckForTrigger(message,User,ListIndex)
    for i,pattern in pairs(TraderTrig[ListIndex]) do
		a,b= string.find( message, pattern );
		_DummyA,_DummyB,saidNumber = string.find(message, "(%d+)"); --a,b,saidNumber = string.find( message, pattern ); 
        if a and CheckConditions( User, ListIndex ) then
            saidNumber = ( saidNumber == nil and 0 or saidNumber*1 );
            return true;
        end
    end
    return false;
end

--[[
- CheckConditions
- @param User CharStruct the User who spoke
- @param ListIndex int the Index of the trigger in the triggerlist
- @return boolean true for conditions fullfilled, else false
]]
function CheckConditions( User, ListIndex )
    trigger_conditions = Conditions[ ListIndex ];
    if ( trigger_conditions == nil ) then
        return true;
    elseif ( table.getn( trigger_conditions ) == 0 ) then
        return true;
    end
    for i, condition in pairs(trigger_conditions) do
        if not CheckCondition( User, condition ) then
            return false
        end
    end
    return true;
end

--[[
- CheckCondition
- @param User CharStruct the User who spoke
- @param condition array the condition informations
- @return boolean true for condition fullfilled, else false
- Checks a single condietion
]]
function CheckCondition( User, condition )
    if ( condition[1] == "state" ) then
        if ( NPCStatus[User.id] == nil ) then
            NPCStatus[User.id] = 0;
        end
        return CompareValues( NPCStatus[User.id], 
                              getNumber( condition[3] ),
                              condition[2] )
    elseif ( condition[1] == "skill" ) then
        return CompareSkill( User, condition[2], condition[3],
                             condition[4] );
    elseif ( condition[1] == "attrib" ) then
        return CompareAttrib( User, condition[2], condition[3],
                            condition[4] );
    elseif ( condition[1] == "money" ) then
        if ( condition[2] == ">" ) then
            return CheckMoney( User, ( getNumber( condition[3] ) + 1 ) );
        elseif ( condition[2] == ">=" ) then
            return CheckMoney( User, getNumber( condition[3] ) );
		else
			return not CheckMoney( User, getNumber( condition[3] ) );
        end
    elseif ( condition[1] == "race" ) then
        return ( User:getRace() == condition[2] );
    elseif ( condition[1] == "item" ) then
        return CompareItem( User, condition[2], condition[3], 
                            condition[4], getNumber( condition[5] ) );
    elseif ( condition[1] == "qpg" ) then
        if ( QuestID == nil ) then
            return false;
        end
        if not CompareValues( User:getQuestProgress( QuestID ),
                              getNumber(condition[3]), condition[2] ) then
            return false;
        end
    elseif ( condition[1] == "lang" ) then
        if ( condition[2] == "german" )
        or ( condition[2] == "deutsch" ) then
            return ( User:getPlayerLanguage() == 0  );
        elseif ( condition[2] == "english" )
        or ( condition[2] == "englisch" ) then
            return ( User:getPlayerLanguage() == 1  );
        end
    elseif ( condition[1] == "chance" ) then
        return ( math.random( 100 ) < condition[2] );
    elseif ( condition[1] == "rune" ) then
        return ( LuaAnd( 
                    User:getMagicFlags( 
                       translateMagictype( condition[2] )
                    ),
                    2^( condition[3] - 1 ) ) ~= 0
                );
    elseif ( condition[1] == "sex" ) then
        if ( condition[2] == "male" ) then
            return ( User:increaseAttrib( "sex", 0 ) == 0 );
        else
            return ( User:increaseAttrib( "sex", 0 ) == 1 );
        end
    elseif ( condition[1] == "fraction" ) then
        fractionID = translateFractionname( condition[2] );
        if ( fractionID == 0 ) then
            return false;
        end
        if not CompareValues( User:getQuestProgress( fractionID ),
                              condition[4], condition[3] ) then
            return false;
        end
    elseif ( condition[1] == "number" ) then
        if not CompareValues( tonumber(saidNumber), tonumber(condition[3]), condition[2] ) then
            return false;
        end
    elseif ( condition[1] == "idlestate" ) then
        if ( condition[2] == "idle" ) then
            if ( radius == 0 ) or ( currentTalk == User.id ) then
                return true;
            end
            return idle;
        elseif ( condition[2] == "busy" ) then
            if ( radius == 0 ) or ( currentTalk == User.id ) then
                return false;
            end
            return not idle;
        end
    elseif ( condition[1] == "town" ) then
    	local Faction = base.factions.getFaction(User); local townID = translateFractionname( condition[3] );
    	if not CompareValues( Faction.tid, townID, condition[2]) then
    		return false;
    	end
	elseif ( condition[1] == "rank" or condition[1] == "rang") then
		local Faction = base.factions.getFaction(User);
		local theName = condition[2];
		if condition[2] == "hometown" then
			if Faction.tid==0 then return false; end
			theName = TownNameEList[Faction.tid][1];
		end
	 	local townID = translateFractionname( theName );
		if not CompareValues ( Faction[DigitToIndex[RANK_OFFSET+townID]] , condition[4], condition[3] ) then
			return false;
		end
	end
    return true;
end
--[[
- CompareSkill
- @param User CharStruct the User that is checked
- @param Skillname string the Skillname of the checked Skill
- @param CompareType string kind of comparing
- @param Value int the Value the Skill is compared with
- @return boolean true if the user has enougth skillpoints, else false
]]--
function CompareSkill( User, Skillname, CompareType, Value )
    local Skillvalue = User:getSkill( Skillname );
    return CompareValues( Skillvalue, Value, CompareType );
end

--[[
- CompareAttrib
- @param User CharStruct the User that is checked
- @param Attribname string the Name of the Attribut of the checked Skill
- @param CompareType string kind of comparing
- @param Value int the Value the Attribut is compared with
- @return boolean true if the user has enougth attribpoints, else false
]]
function CompareAttrib( User, Attribname, CompareType, Value )
    local Attribvalue = User:increaseAttrib( Attribname, 0 );
    return CompareValues( Attribvalue, Value, CompareType );
end

--[[
- CompareItem
- @param User CharStruct the User that is checked
- @param ItemID integer the ID if the Item to count
- @param ItemLocation string the location of the Item
- @param CompareType string kind of comparing
- @param Amount int the Value the Skill is compared with
- @return boolean true if the user has enougth items, else false
]]
function CompareItem( User, ItemID, ItemLocation, CompareType, Amount)
    local ItemAmm = User:countItemAt( ItemLocation, ItemID );
    return CompareValues( ItemAmm, getNumber(Amount), CompareType );
end

--[[
- CompareValues
- @param Value1 integer the first of the two values to compare
- @param Value2 integer the second of the two values to compare
- @param CompareType string kind of comparing
- @return boolean true if the comparing is correct, false if not
]]
function CompareValues( Value1, Value2, CompareType )
    Value1 = tonumber(Value1);
    Value2 = tonumber(Value2);
	if ( CompareType == "=" ) then
        return ( Value1 == Value2 );
    elseif ( CompareType == "<>" ) or
           ( CompareType == "!=" ) or
           ( CompareType == "~=" ) then
        return ( Value1 ~= Value2 );
    elseif ( CompareType == "<=" ) or ( CompareType == "=<" ) then
        return ( Value1 <= Value2 );
    elseif ( CompareType == ">=" ) or ( CompareType == "=>" ) then
        return ( Value1 >= Value2 );
    elseif ( CompareType == ">" ) then
        return ( Value1 > Value2 );
    elseif ( CompareType == "<" ) then
        return ( Value1 < Value2 );
    end
    return false;
end

--[[
- PerformConsequences
- @param User CharStruct The User who receives the consequeces
- @param ListIndex integer the position in the list of conequences
]]
function PerformConsequences( User, ListIndex )
    trigger_consequences = Consequences[ ListIndex ];
    if ( trigger_consequences == nil ) then
        return true;
    elseif ( table.getn( trigger_consequences ) == 0 ) then
        return true;
    end
	TraderInform = {};
    for i, consequence in pairs(trigger_consequences) do
        if ( consequence[1] == "state" ) then
            if ( consequence[2] == "=" ) then
                NPCStatus[User.id] = getNumber( consequence[3] );
            elseif ( consequence[2] == "+" ) then
                NPCStatus[User.id] = NPCStatus[User.id] +
                                     getNumber( consequence[3] );
            elseif ( consequence[2] == "-" ) then
                NPCStatus[User.id] = NPCStatus[User.id] -
                                     getNumber( consequence[3] );
            end
        elseif ( consequence[1] == "skill" ) then
            GroupID = translateSkillgroup( consequence[2] );
            if ( consequence[4] == "+" ) then
                User:increaseSkill( GroupID, consequence[3],
                                    math.abs( consequence[5] ) );
            elseif ( consequence[4] == "-" ) then
                User:increaseSkill( GroupID, consequence[3],
                                    math.abs( consequence[5] ) * -1 );
            elseif ( consequence[4] == "=" ) then
                local currSkill = User:getSkill( consequence[3] );
                local modSkill = consequence[5] - currSkill;
                User:increaseSkill( GroupID, consequence[3],
                                    modSkill );
            end
        elseif ( consequence[1] == "attrib" ) then
            if ( consequence[3] == "+" ) then
                
                User:increaseAttrib( consequence[2], consequence[4]);
            elseif ( consequence[3] == "-" ) then
                User:increaseAttrib( consequence[2], -consequence[4]);
            elseif ( consequence[3] == "=" ) then
                formerValue = User:increaseAttrib(consequence[2],0);
                if ( formerValue == consequence[4] ) then
                    return
                end
                User:increaseAttrib( consequence[2], 
                                     -( formerValue - consequence[4] )
                                   );
            end
            User:increaseAttrib( consequence[2], 1 );
            User:increaseAttrib( consequence[2], -1 );
        elseif ( consequence[1] == "money" ) then
            if ( consequence[2] == "+" ) then
                PayThePlayer( User, tonumber(getNumber( consequence[3] )) );
            elseif ( consequence[2] == "-" ) then
                PayTheNPC( User, tonumber(getNumber( consequence[3] )) );
            end
        elseif ( consequence[1] == "item" ) then
            notcreated = User:createItem( consequence[2],
                                          getNumber( consequence[3] ),
                                          consequence[4], consequence[5] );
            if ( notcreated > 0 ) then
                world:createItemFromId( consequence[2], notcreated,
                                        User.pos, true, consequence[4],
                                        consequence[5] );
            end 
        elseif ( consequence[1] == "deleteitem" ) then
			if consequence[3] == "all" then
				consequence[3] = User:countItem(consequence[2]);
			end
            User:eraseItem( consequence[2], getNumber( consequence[3] ) );
        elseif ( consequence[1] == "qpg" ) then
            if ( QuestID == nil ) then
                return false;
            end
            QuestState = User:getQuestProgress( QuestID );
            if ( consequence[2] == "=" ) then
                User:setQuestProgress( QuestID,
                                       getNumber( consequence[3] ) );
            elseif ( consequence[2] == "+" ) then
                newQuest = QuestState + getNumber( consequence[3] );
                User:setQuestProgress( QuestID, newQuest );
            elseif ( consequence[2] == "-" ) then
                newQuest = QuestState - getNumber( consequence[3] );
                User:setQuestProgress( QuestID, newQuest );
            end
        elseif ( consequence[1] == "rune" ) then
            User:teachMagic( translateMagictype( consequence[2] ),
                             consequence[3] );
        elseif ( consequence[1] == "fraction" ) then
            fractionID = translateFractionname( consequence[2] );
            if ( fractionID == 0 ) then
                return false;
            end
            FractionState = User:getQuestProgress( fractionID );
            if ( consequence[3] == "=" ) then
                User:setQuestProgress( fractionID, consequence[4] );
            elseif ( consequence[3] == "+" ) then
                newQuest = FractionState + consequence[4];
                User:setQuestProgress( fractionID, newQuest );
            elseif ( consequence[3] == "-" ) then
                newQuest = FractionState - consequence[4];
                User:setQuestProgress( fractionID, newQuest );
            end
        elseif ( consequence[1] == "talk" ) then
            if ( consequence[2] == "begin" ) then
                currentTalk = User.id;
                idle=false;
            elseif ( consequence[2] == "end" ) then
                currentTalk = 0;
                idle=true;
            end
        elseif ( consequence[1] == "inform" ) then
			table.insert( TraderInform, consequence[2] );
		elseif ( consequence[1] == "rankpoints" ) then
			local Faction = base.factions.get(User); 
			local theName = consequence[2];
			if consequence[2] == "hometown" then
				if Faction.tid==0 then return false; end
				theName = TownNameEList[Faction.tid][1];
			end
			local townID = translateFractionname( theName ); 
            if ( consequence[3] == "+" ) then
				Faction[DigitToIndex[RANKPOINTS_OFFSET+townID]] = Faction[DigitToIndex[RANKPOINTS_OFFSET+townID]] + (consequence[4]);
            elseif ( consequence[3] == "-" ) then
				Faction[DigitToIndex[RANKPOINTS_OFFSET+townID]] = Faction[DigitToIndex[RANKPOINTS_OFFSET+townID]] - (consequence[4]);
            end
			Faction = base.factions.put(User,Faction);			
		elseif ( consequence[1] == "rank" or consequence[1] == "rang") then		
			
			local Faction = base.factions.getFaction(User); 
			local theName = consequence[2];
			if consequence[2] == "hometown" then
				if Faction.tid==0 then return false; end
				theName = TownNameEList[Faction.tid][1];
			end
			local townID = translateFractionname( theName );				    
			if ( consequence[3] == "=" ) then

 				Faction[DigitToIndex[RANK_OFFSET+townID]] = consequence[4];
            elseif ( consequence[3] == "+" ) then
				Faction[DigitToIndex[RANK_OFFSET+townID]] = Faction[DigitToIndex[RANK_OFFSET+townID]] + (consequence[4]);
            elseif ( consequence[3] == "-" ) then
				Faction[DigitToIndex[RANK_OFFSET+townID]] = Faction[DigitToIndex[RANK_OFFSET+townID]] - (consequence[4]);
            end
			Faction = base.factions.put_Faction(User,Faction);			
		else
			return;
		end       
    end
end

--[[
- translateSkillgroup
- @param GroupName string name of the skillgroup
- @return integer ID of the skillgroup
- translates the name of a skillgroup to the number for it
]]
function translateSkillgroup( GroupName )
    if ( GroupName == "language" ) then
        return 1;
    elseif ( GroupName == "crafts" ) then
        return 2;
    elseif ( GroupName == "magic" ) then
        return 3;
    elseif ( GroupName == "other" ) then
        return 4;
    elseif ( GroupName == "fighting" ) then
        return 5;
    elseif ( GroupName == "druid" ) then
        return 6;
    elseif ( GroupName == "priest" ) then
        return 7;
    elseif ( GroupName == "bard" ) then
        return 8;
    end
    return 0;
end

--[[
- translateMagictype
- @param TypeName string name of the magic type
- @return integer ID of the magic type
- translates the name of a magic type to the number for it
]]--
function translateMagictype( TypeName )
    if ( TypeName == "mage" ) then
        return 0;
    elseif ( TypeName == "priest" ) then
        return 1;
    elseif ( TypeName == "bard" ) then
        return 2;
    elseif ( TypeName == "druid" ) then
        return 3;
    end
    return 0;
end

--[[
- translateFractionname
- @param FractionName string name of the Fraction
- @return integer ID of the Fraction Queststatus
- translates the name of a Fraction to the number for it
]]
function translateFractionname( FractionName )
    FractionName = string.lower( FractionName );
    if ( FractionName == "cadomyr" ) then
		return 1;
	elseif ( FractionName == "runewick" ) then
        return 2;	
	elseif ( FractionName == "galmair" ) then
        return 3;		   
	elseif ( FractionName == "albar" ) then
        return 12;
    elseif ( FractionName == "salkamar" ) then
        return 13;
    elseif ( FractionName == "thief" ) then
        return 14;
    elseif ( FractionName == "explorer" ) then
        return 15;
    elseif ( FractionName == "gynk" ) then
        return 16;
    end
    return 0;
end

--[[
- graps the real number in case the %NUMBER constant was used
- @param value mixed the value of the used number
- @return integer the real number. Eighter the last spoken one or the
                  param value.
]]
function getNumber( value ) 
if ( type( value ) == "function" ) then 
    return value( saidNumber ); -- DO NOT CALL value() anywhere else 
   elseif ( value == "%NUMBER" ) then 
       return saidNumber; 
   else 
       return tonumber(value); 
   end 
   return 0; 
end

--[[
- SpeakerCycle
- Makes the NPC Saying something from time to time on its own
- Users the cycled text
]]--
function SpeakerCycle()
    if not speakCount then
        InitTalkLists()
    end
    
    speakCount = speakCount + 1;
    if ( ( speakCount / 600 ) == math.floor( speakCount / 600 ) ) then
        verwirrt=false;
    end
    
    if ( table.getn( CycleText ) > 0 ) then
        if not speakTime then
            speakTime=math.random(900,3000); --90s to 5 minutes
        end
       
        if ( speakCount>=speakTime ) then
            speakCount=1;
            TextNr=math.random(1,table.getn(CycleText));
          
            thisNPC:talkLanguage(Character.say,
                                 Player.german,
                                 CycleText[TextNr][1]);
            thisNPC:talkLanguage(Character.say,
                                 Player.english,
                                 CycleText[TextNr][2]);
            speakTime=math.random(900,3000);
        end
    end
    
    if ( speakCount > 3002 ) then
        speakCount = 1;
    end

    if ( radius > 0 ) then
        walkCount = walkCount + 1;
        if ( walkCount >= 40 ) then
            walkCount = 0;
            if not idle then
                playersInRange = world:getPlayersInRangeOf( thisNPC.pos,
                                                            3 );
                found = false;
                for i, char in pairs(playersInRange) do
                    if ( char.id == currentTalk ) then
                        found = true;
                        TurnToPlayer( char );
                    end
                end
                
                if not found then
                    idle = true;
                end
            end
            
            if idle then
                if ( math.random( 20 ) <= 9 ) then
                    TurnAround();
                    walkCount = 15;
                else
                    if walk() then
                        walkCount = 0;
                    else
                        walkCount = 15;
                    end
                end
            end
        end
    end            
end

--[[
- TurnAround
- Makes the NPC Turning
]]
function TurnAround()
    faceTo = thisNPC:getFaceTo();
    possDirs = {};
    if ( faceTo == 0 ) or ( faceTo == 4 ) then
        newPos1 = position( thisNPC.pos.x - 1, thisNPC.pos.y, 
                            thisNPC.pos.z );
        newPos2 = position( thisNPC.pos.x + 1, thisNPC.pos.y, 
                            thisNPC.pos.z );
        if ( Distance( newPos1, centerPos ) <= radius ) then
            table.insert( possDirs, 6 );
        end
        if ( Distance( newPos2, centerPos ) <= radius ) then
            table.insert( possDirs, 2 );
        end
    else
        newPos1 = position( thisNPC.pos.x, thisNPC.pos.y - 1, 
                            thisNPC.pos.z );
        newPos2 = position( thisNPC.pos.x, thisNPC.pos.y + 1, 
                            thisNPC.pos.z );
        if ( Distance( newPos1, centerPos ) <= radius ) then
            table.insert( possDirs, 0 );
        end
        if ( Distance( newPos2, centerPos ) <= radius ) then
            table.insert( possDirs, 4 );
        end
    end
    if ( table.getn( possDirs ) == 0 ) then
        thisNPC:warp( centerPos );
    else
        selectedDir = math.random( table.getn( possDirs ) );
        thisNPC:setAttrib( "faceto", possDirs[ selectedDir ] );
    end
end

--[[
- Walk
- makes the Character walking around. But not out of range
]]
function walk()
    faceTo = thisNPC:getFaceTo();
    if ( faceTo == 0 ) then
        newPos = position( thisNPC.pos.x, thisNPC.pos.y - 1, 
                           thisNPC.pos.z );
    elseif ( faceTo == 2 ) then
        newPos = position( thisNPC.pos.x + 1, thisNPC.pos.y, 
                           thisNPC.pos.z );
    elseif ( faceTo == 4 ) then
        newPos = position( thisNPC.pos.x, thisNPC.pos.y + 1, 
                           thisNPC.pos.z );
    elseif ( faceTo == 6 ) then
        newPos = position( thisNPC.pos.x - 1, thisNPC.pos.y, 
                           thisNPC.pos.z );
    end
    if ( Distance( newPos, centerPos ) <= radius ) then
        thisNPC:move( faceTo, true );
    else
        TurnAround();
        return false;
    end
    return true;
end

--[[
- Distance
- @param pos1 position
- @param pos2 position
- @return distance between both positions
]]
function Distance( pos1, pos2 )
    xOff = math.abs( pos1.x - pos2.x );
    yOff = math.abs( pos1.y - pos2.y );
    return math.sqrt( xOff^2 + yOff^2 );
end

--[[
- TurnToPlayer
- @param player characterstruct Charakter the npc has to look at.
- Makes the npc turning towards a character
]]
function TurnToPlayer( player )
    xOff = math.abs( player.pos.x - thisNPC.pos.x );
    yOff = math.abs( player.pos.y - thisNPC.pos.y );
    if ( xOff > yOff ) then
        if ( player.pos.x > thisNPC.pos.x ) then
            newFaceTo = 2;
        else
            newFaceTo = 6;
        end
    else
        if ( player.pos.y > thisNPC.pos.y ) then
            newFaceTo = 4;
        else
            newFaceTo = 0;
        end
    end
    faceTo = thisNPC:getFaceTo();
    if ( faceTo ~= newFaceTo ) then
        thisNPC:setAttrib( "faceto", newFaceTo );
    end
end

--[[
- BasicNPCChecks
- @param originator CharStruct Character to speaks with the NPC
- @param NPCRange int Talking Range of the NPC
- @return boolean true for talking is okay, false for not okay.
]]
function BasicNPCChecks(originator,NPCRange)
    if not thisNPC:isInRange(originator,NPCRange) then
        return false;
    end
    
    if (originator.id == thisNPC.id) then
        return false;
    end
    
    if ( originator:getType() ~= 0 ) then
        return false;
    end
    
    originator:introduce(thisNPC);
    return true;
end

--[[
- Confused
- @param gText string German Text
- @param eText string English Text
- makes the NPC telling the speak that he does not understand his language
  with spamming protection
]]
function Confused( gText, eText )
    if not verwirrt then
        thisNPC:talkLanguage( Character.say, Player.german, gText );
        thisNPC:talkLanguage( Character.say, Player.english, eText );
        verwirrt=true;
    end
end

--[[
- CheckMoney
- @param User CharStruct User whos money is checked
- @param Copper int amount of needed money
- @return boolean true of the User has enougth money, else false
]]
function CheckMoney(User,Copper)
    local Amount = ( User:countItem(61) * 10000 );
    Amount = Amount + ( User:countItem(3077) * 100 );
    Amount = Amount + ( User:countItem(3076) );
	
	Copper = tonumber(Copper);
	Amount = tonumber(Amount);
	 
    return (Copper<=Amount);
end

--[[
- SplitMoney
- @param Copper int amount of copper
- @return int gold coins
- @return int silver coins
- @return int copper coins
- Splits a amount of copper up into gold, silver and copper
]]
function SplitMoney(Copper)
    local GAmount=math.floor(Copper/10000);
    local SAmount=math.floor((Copper-GAmount*10000)/100);
    local CAmount=Copper-(SAmount*100+GAmount*10000);
    return GAmount,SAmount,CAmount
end

--[[
- PayTheNPC
- @param User CharStruct User who has to pay
- @param Copper int amount of money thats payed
- Takes away the amount of copper from the player inventory
]]
function PayTheNPC(User,Copper)
    if not CheckMoney( User, Copper ) then
        return false;
    end
    local PayGold=0;
    local PaySilber=0;
    local PayKupfer=0;
    local MissGold=0;
    local MissSilber=0;
    local MissKupfer=0;
    MissGold, MissSilber, MissKupfer = SplitMoney( Copper );
    
    local UserGold=User:countItem(61);
    local UserSilber=User:countItem(3077);
    local UserKupfer=User:countItem(3076);
    
    local Amount=Copper;
    
    local GoldAlsKupfer=0;
    local SilberAlsKupfer=0;
    local GoldAlsSilber=0;
    
    GoldAlsKupfer = math.floor( UserKupfer/10000 );
    GoldAlsKupfer = math.min( MissGold, GoldAlsKupfer );
    PayKupfer = GoldAlsKupfer * 10000;
    MissGold = MissGold - GoldAlsKupfer;
    UserKupfer = UserKupfer - PayKupfer;
    
    GoldAlsKupfer = math.floor( UserKupfer/100 );
    GoldAlsSilber = 100 - GoldAlsKupfer;
    if ((MissGold > 0) and (GoldAlsKupfer > 0) and
        (UserSilber >= GoldAlsSilber)) then
        PayKupfer = PayKupfer + 100 * GoldAlsKupfer;
        PaySilber = PaySilber + GoldAlsSilber;
        MissGold = MissGold - 1;
        UserKupfer = UserKupfer - 100 * GoldAlsKupfer;
        UserSilber = UserSilber - GoldAlsSilber;
    end;
    
    SilberAlsKupfer = math.floor( UserKupfer/100 );
    SilberAlsKupfer = math.min( MissSilber, SilberAlsKupfer );
    PayKupfer = PayKupfer + SilberAlsKupfer * 100;
    MissSilber = MissSilber - SilberAlsKupfer;
    UserKupfer = UserKupfer - SilberAlsKupfer * 100;
    
    if (UserKupfer >= MissKupfer) then
        PayKupfer = PayKupfer + MissKupfer;
    else
        MissSilber = MissSilber + 1;
        PayKupfer = PayKupfer + MissKupfer - 100;
    end;
    
    GoldAlsSilber = math.floor( UserSilber/100 );
    GoldAlsSilber = math.min( MissGold, GoldAlsSilber );
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
        User:eraseItem(61,PayGold);
    end
    if (PaySilber>0) then
        User:eraseItem(3077,PaySilber);
    elseif (PaySilber<0) then
        notcreated = User:createItem(3077,PaySilber*(-1),333,0);
        if ( notcreated > 0 ) then
            world:createItemFromId( 3077, notcreated, User.pos, true, 333,
                                    0 );
        end
    end
    if (PayKupfer>0) then
        User:eraseItem(3076,PayKupfer);
    elseif (PayKupfer<0) then
        notcreated = User:createItem(3076,PayKupfer*(-1),333,0);
        if ( notcreated > 0 ) then
            world:createItemFromId( 3076, notcreated, User.pos, true, 333,
                                    0 );
        end
    end
end

--[[
- PayThePlayer
- @param User CharStruct User who gets the money
- @param Copper int amount of money that is created
]]
function PayThePlayer(User,Copper)
    local Gold = 0;
    local Silver = 0;
    Gold, Silver, Copper = SplitMoney( Copper );
    notcreated = User:createItem(61,Gold,333,0);
    if ( notcreated > 0 ) then
        world:createItemFromId( 61, notcreated, User.pos, true, 333, 0 );
    end
    notcreated = User:createItem(3077,Silver,333,0);
    if ( notcreated > 0 ) then
        world:createItemFromId( 3077, notcreated, User.pos, true, 333, 0 );
    end
    notcreated = User:createItem(3076,Copper,333,0);
    if ( notcreated > 0 ) then
        world:createItemFromId( 3076, notcreated, User.pos, true, 333, 0 );
    end
end

--[[
- NPCTalking
- @param NPC CharStruct The character who has to talk
- @param Text string the Text that shall be spoken
- Splits up to long texts and makes the character saying the parts.
]]
function NPCTalking(NPC,Text)
    local done=false;
    local outputted=false;
    repeat
        Len=string.len(Text)
        if (Len>240) then
            i=241;
            outputted=false;
            repeat
                i=i-1;
                Char=string.sub(Text,i,i);
                if (Char==" ") then
                    outText=string.sub(Text,1,i-1);
                    Text=string.sub(Text,i+1,Len);
                    NPC:talk(Character.say,outText);
                    outputted=true;
                end
            until i==0 or outputted;
            if (Len == string.len(Text)) then
                outText=string.sub(Text,1,240);
                Text=string.sub(Text,241,Len);
                NPC:talk(Character.say,outText);
            end
        else
            done=true;
            NPC:talk(Character.say,Text);
        end
    until done
end

--[[
- CharInform
- @param Char CharStruct The Char that will get the whisper inform
]]
function CharInform(Char)
	if table.getn(TraderInform)>0 then
		local inform = TraderInform[ math.random(1,table.getn(TraderInform)) ];
		Char:inform(inform,Player.mediumPriority);
	end
end

--[[
- Scale
- @param ScBegin int The number that is returned if value is 0
- @param ScEnd int The number that is returned if value is 100
- @param value int
- @return int a value between ScBegin and ScEnd related to value
]] 
function Scale(ScBegin, ScEnd, value)
    value = ( ( ScEnd - ScBegin ) / 100 ) * value + ScBegin;
    if (ScBegin < ScEnd) then
        return math.min( ScEnd, math.max( ScBegin, value ) );
    else
        return math.max( ScEnd, math.min( ScBegin, value ) );
    end
end
