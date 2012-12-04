--- Base NPC script for basic NPCs
--
-- This script bundles the functions the most other specific components of the
-- NPC require to work. Its the basic script of the NPC framework and the only
-- one that requires regular from the actual NPC script.
--
-- Author: Martin Karing

require("base.common")
require("base.class")

module("npc.base.basic", package.seeall)

--- Constructor for the baseNPC. This does not take any paramters.
--
-- The sole purpose is to prepare all required values in the NPC script.
baseNPC = base.class.class(function(self)	
    -- The state of the NPC. This value can be used to have the special parts
    -- of the NPC communicating with each other.
    self["state"] = baseNPC.stateNormal;
    
    -- The cycle functions are called during the next cycle method of this base
    -- NPC struct. Each special NPC class is able to register functions in this
    -- class.
    self["_cycleFunctions"] = nil;
    
    -- The receive text functions are called during the receive text method of
    -- the NPC. Each special NPC class is able to register functions in this 
    -- class.
    self["_receiveTextFunctions"] = nil;
    
    -- The cycle counter counts the calls of the next cycle method in order to
    -- find out when to execute the next time all the next cycle methods. This
    -- is used to reduce the server load caused by this method.
    self["_cycleCounter"] = 0;
    
    -- This variable stores then to call the cycle methods the next time in
    -- order to execute all functions of the NPC properly.
    self["_nextCycleCalls"] = 0;
    
    -- This variable holds a list that stores the constants of the languages
    -- the NPC is able to use.
    self["_npcLanguages"] = {};
    
    -- This variable holds the amount of languages added to the list of
    -- languages of this NPC.
    self["_npcLanguageCount"] = 0;
    
    -- This variable stores the language the NPC is expected to use by default.
    self["_defaultLanguage"] = 0;
    
    -- This variable stores the german lookAt message of the NPC.
    self["_lookAtMsgDE"] = "";
    
    -- This variable stores the english lookAt message of the NPC.
    self["_lookAtMsgUS"] = "";
    
    -- This variable stores the german message that is said by the NPC in case
    -- the player performs a use operation on the NPC.
    self["_useMsgDE"] = "";
    
    -- This variable stores the english message that is said by the NPC in case
    -- the player performs a use operation on the NPC.
    self["_useMsgUS"] = "";
    
    -- This variable stores the german message that is shown in case the players
    -- talk to the NPC in a language the NPC does not understand.
    self["_confusedDE"] = "";
    
    -- This variable stores the english message that is shown in case the
    -- players talk to the NPC in a language the NPC does not understand.
    self["_confusedUS"] = "";
    
    -- This variable stores the last Unix timestamp when a confusion message
    -- was displayed. This is needed to avoid spamming with this messages.
    self["_lastConfusionTimestamp"] = 0;
    
    -- This variable stores if the NPC is supposed to to introduce automatically
    -- to the player.
    self["_autointroduce"] = true;
    
    -- This list is used to store the equipment that shall be set to the NPC at
    -- the first run. Once the equipment is set, the list is destroyed.
    self["_equipmentList"] = {};
end);

--- Constant for the state value of the NPC.
--- If this constant is set the NPC is currently in the normal mode.
baseNPC["stateNormal"] = 0;

--- Constant for the state value of the NPC.
--- If this constant is set the NPC is currently busy talking with a specified
--- character and is not to walk around or anything like this.
baseNPC["stateBusyTalking"] = 1;

--- This method adds one function to the functions that are called during the
--- next cycles.
--
--  @param receiver the receiver is a object that defines a nextCycle function
--                  that is called in given time intervals. The only paramter
--                  of this function is the time since the last call. The return
--                  value has to be the time when the next call of this function
--                  is expected. Its possible that the function is called ealier
--                  but not later.
function baseNPC:addCycle(receiver)
    if (type(receiver) ~= "table") then
        return;
    end;
    
    if (type(receiver.nextCycle) ~= "function") then
        return;
    end;
    
    if (self._cycleFunctions == nil) then
        self._cycleFunctions = {};
    end;
    
    table.insert(self._cycleFunctions, receiver);
end;

--- This method adds one function to the functions that are called during when
--- a text is received by the NPC.
--
--  @param receiver the receiver is a object that defines a receiveText function
--                  that is called all times the basic npc receives a text. The
--                  receive text function has to take as first paramter the
--                  character who is talking and as second parameter the text
--                  that was spoken. In case the receiveText function returns
--                  true the spoken text is not forwarded to any more possible
--                  receivers.
function baseNPC:addRecvText(receiver)
    if (type(receiver) ~= "table") then
        return;
    end;
    
    if (type(receiver.receiveText) ~= "function") then
        return;
    end;
    
    if (self._receiveTextFunctions == nil) then
        self._receiveTextFunctions = {};
    end;
    
    table.insert(self._receiveTextFunctions, receiver);
end;

--- This method has to be called during each next cycle call of an NPC. It
--- manages and calls the functions registered this NPC. This function will be
--- removed during its first call. Instead the function originally named
--- baseNPC:nextCycle2() will take its place and serve its actual purpose.
--
--  @param npcChar the NPC character
function baseNPC:nextCycle(npcChar)
    if (self.initLanguages ~= nil) then
        self:initLanguages(npcChar);
    end;
    
    if (self._equipmentList ~= nil) then
        local tempList = self._equipmentList;
        self["_equipmentList"] = nil;
        
        table.foreach(tempList, function(key, value)
            npcChar:createAtPos(value[1], value[2], 1);
            local item = npcChar:getItemAt(value[1]);
            item.wear = 255;
            item.quality = 999;
            world:changeItem(item);            
        end);
    end;
    
    self.nextCycle = self.nextCycle2;
    self.nextCycle2 = nil;
end;

--- This method has to be called during each next cycle call of an NPC. It
--- manages and calls the functions registered this NPC. This function will be
--- copied to baseNPC:nextCycle() once the initialization is done.
--
--  @param npcChar the NPC character
function baseNPC:nextCycle2(npcChar)    
    if (self._cycleFunctions == nil) then
        return;
    end;
    
    if (self._cycleCounter < self._nextCycleCalls) then
        self._cycleCounter = self._cycleCounter + 1;
        return;
    end;
    
    npcChar.activeLanguage = self._defaultLanguage;
    
    local oldCycle = self._cycleCounter;
    self._cycleCounter = 0;
    self._nextCycleCalls = 2147483648;
    
    local nextRequestedCall = 0;
    table.foreach(self._cycleFunctions, function(key, value)
        nextRequestedCall = value:nextCycle(npcChar, oldCycle);
        if (nextRequestedCall ~= nil and nextRequestedCall >= 0) then
            self._nextCycleCalls = math.min(self._nextCycleCalls, nextRequestedCall);
        end;
    end);
end;

--- This method should be called at each call of the receive text method. This 
--- method will maintain all functions registered to this class and call them
--- properly in case its needed.
--
--  @param npcChar the NPC character
--  @param speaker the character struct who said some text
--  @param text the text that was spoken
--  @return true in case the text was handled properly by one of the receive text handlers
function baseNPC:receiveText(npcChar, speaker, text)
    if (self._receiveTextFunctions == nil) then
        return false;
    end;
    
    if not npcChar:isInRange(speaker, 2) then
        return false;
    end;

    if (speaker.id == npcChar.id) then
        return false;
    end;

    if (speaker:getType() ~= 0) then
        return false;
    end;

    if self._autointroduce then
        speaker:introduce(npcChar);
    end;
    
    if not self:checkLanguageOK(speaker) then
        self:_displayLanguageConfusion(npcChar);
        return false;
    end;
    npcChar.activeLanguage = speaker.activeLanguage;
    text = string.lower(text);
    
    table.foreach(self._receiveTextFunctions, function(key, value)
        if (value:receiveText(npcChar, speaker, text)) then
            return true;
        end;
    end);
    
    return false;
end;

--- This function is used to display the message that the NPC is not able to
--- understand the language the player character is speaking. It should be
--- called every time the languageOK check is failing because it has its own
--- protection against spamming.
--
--  @param npcChar the NPC character
function baseNPC:_displayLanguageConfusion(npcChar)
    local currentUnix = world:getTime("unix");
    if (currentUnix - self._lastConfusionTimestamp > 59) then
        self._lastConfusionTimestamp = currentUnix;
        npcChar.activeLanguage = self._defaultLanguage;
        npcChar:talkLanguage(Character.say, Player.german, self._confusedDE);
        npcChar:talkLanguage(Character.say, Player.english, self._confusedUS);
    end;
end;

--- This function checks if the language currently spoken by a character is
--- valid to be used by this NPC.
--
--  @param speak the character who is speaking
--  @return true in case the NPC is able to speak the language of the player
function baseNPC:checkLanguageOK(speaker)
    if (speaker.activeLanguage == self._defaultLanguage) then
        return true;
    end;
    
    for i=1, self._npcLanguageCount do
        if (speaker.activeLanguage == self._npcLanguages[i]) then
            return true;
        end;
    end;
    
    return false;
end;

--- This function adds a language constant to the list of enabled languages of
--- this NPC.
--
--  @param langCode the code of the language the NPC is supposed to know
function baseNPC:addLanguage(langCode)
    table.insert(self._npcLanguages, langCode)
    self._npcLanguageCount = self._npcLanguageCount + 1;
end;

--- This function sets the language the NPC is supposed to use by default. The
--- only case it is switching the language is, in case he answeres to a player
--- talking in another language.
--
--  @param langCode the code value of the language to use
function baseNPC:setDefaultLanguage(langCode)
    self._defaultLanguage = langCode;
end;

--- This function sets the texts that are displayed when someone is looking at
--- the NPC.
--
--  @param german the german message
--  @param english the english message
function baseNPC:setLookat(german, english)
    self._lookAtMsgDE = german;
    self._lookAtMsgUS = english;
end;

--- This function sets the text that are displayed when someone is using the
--- NPC.
--
--  @param german the german message
--  @param english the english message
function baseNPC:setUseMessage(german, english)
    self._useMsgDE = german;
    self._useMsgUS = english;
end;

--- This function sets the text that is displayed in case a player is talking
--- in the wrong language with the NPC.
--
--  @param german the german message
--  @param english the english message
function baseNPC:setConfusedMessage(german, english)
    self._confusedDE = german;
    self._confusedUS = english;
end;

--- This method handles the lookat requests that are send to the NPC. If set
--- properly a message will be returned describing the appearance of the NPC.
--
--  @param npcChar the NPC character
--  @param char the character who is looking at the NPC
--  @param mode the mode used to look at the NPC (no effect)
function baseNPC:lookAt(npcChar, char, mode)
    char:sendCharDescription(npcChar.id, base.common.GetNLS(char, self._lookAtMsgDE, self._lookAtMsgUS));
    
    if self._autointroduce then
        char:introduce(npcChar);
    end;
end;

--- This method handles all use methods that are done to the NPC. When ever a
--- NPC is used by the player this one is called.
--
--  @param npcChar the NPC character
--  @param char the character who is looking at the NPC
--  @param mode the mode used to look at the NPC (no effect)
function baseNPC:use(npcChar, char)
    npcChar.activeLanguage = self._defaultLanguage;
    npcChar:talkLanguage(Character.say, Player.german, self._useMsgDE);
    npcChar:talkLanguage(Character.say, Player.english, self._useMsgUS);
    
    if self._autointroduce then
        char:introduce(npcChar);
    end;
end;

--- This equipment sets the equipment an NPC gets at first start. This is needed
--- so the NPC looks good with paperdolling.
--
--  @param slot the slot the item is to be placed in
--  @param item the item ID that shall be created
function baseNPC:setEquipment(slot, item)
    table.insert(self["_equipmentList"], {slot, item});
end;

--- This is a cleanup function that should be called once the initialization of
--- the NPC is done. It will free the memory taken by all the functions that are
--- needed to fill data into the NPC.
function baseNPC:initDone()
    self["addCycle"] = nil;
    self["addRecvText"] = nil;
    self["addLanguageCode"] = nil;
    self["setDefaultLanguage"] = nil;
    self["setLookat"] = nil;
    self["setUseMessage"] = nil;
    self["setConfusedMessage"] = nil;
    self["setEquipment"] = nil;
    self["initDone"] = nil;
end;

--- This function set the autointroduce mode of this script. In case its set to
--- true the NPC will introduce automatically to the player talking to him.
--
--  @param autointroduce the new state for the autointroduce state
function baseNPC:setAutoIntroduceMode(autointroduce)
    self["_autointroduce"] = autointroduce;
end;

--- This function learns the NPC the languages skills needed to work properly.
--- Check if this function is not nil before you call it, because it destructs
--- itself after it was called once.
--
--  @param npcChar the NPC character
function baseNPC:initLanguages(npcChar)
    table.foreach(self._npcLanguages, function(key, value)
        npcChar:increaseSkill(langCodeToSkill(value), 100);
    end);
    self["initLanguages"] = nil;
end;

--- This function translates a language code value to the skill that belongs to
--- this number. This skill name is needed to set the skill value of the NPC in
--- so the NPC is able to talk in the needed language perfectly.
--
--  @param langCode the language code
--  @return the skill fitting to the language code
function langCodeToSkill(langCode)
    if (langCode == 0) then
        return Character.commonLanguage;
    elseif (langCode == 1) then
        return Character.humanLanguage;
    elseif (langCode == 2) then
        return Character.dwarfLanguage;
    elseif (langCode == 3) then
        return Character.elfLanguage;
    elseif (langCode == 4) then
        return Character.lizardLanguage;
    elseif (langCode == 5) then
        return Character.orcLanguage;
    elseif (langCode == 10) then
        return Character.ancientLanguage;
    else
        return Character.commonLanguage;
    end;
end;
