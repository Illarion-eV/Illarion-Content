--- Base Script: Messages
--
-- The purpose of this script is to offer a simple class that allows handling
-- messages in all sorts of scripts. It will handle storing and accessing the
-- messages in a efficient way.
--
-- @release 1.0
-- @author Martin Karing
--
-- @usage:
--      Create a new message object:
--      msgs = Messages();
--
--      Append messages to the message object:
--      msgs:addMessage("German Text 1", "English Text 1");
--      msgs:addMessage("German Text 2", "English Text 2");
--
--      Get the count of messages in the message object:
--      #msgs == 2
--
--      Get a message from the message object:
--      germanMessage, englishMessage = msgs:getMessage(2);
--      germanMessage == "German Text 2"
--      englishMessage == "English Text 2"
--
--      Get a random message from the message object:
--      germanMessage, englishMessage = msgs:getRandomMessage();
--      The result is similar to msgs:getMessage(index), just the index is
--      selected randomly.

require("base.class")
module("base.messages", package.seeall)

-- create messages class
Messages = base.class.class(function(msg)
    msg.__german = {};
    msg.__english = {};
    msg.__count = 0;
end);

--- Add a message.
-- Using this function you are able to add a message to the storage. The message
-- needs to be avaiable in both languages and is insert to the internal tables
-- upon calling this function.<br>
-- <br>
-- @param gerMsg the german version of the message
-- @param engMsg the english version of the message
-- <br>
-- @return The index of the added message
function Messages:addMessage(gerMsg, engMsg)
    if gerMsg == nil or gerMsg == "" then
        if engMsg == nil or engMsg == "" then
            -- ignore empty messages.
            return;
        end;
        gerMsg = "Translation Missing: "..engMsg;
    end;
    if engMsg == nil or engMsg == "" then
        engMsg = "Translation Missing: "..gerMsg;
    end;
    table.insert(self.__german, gerMsg);
    table.insert(self.__english, engMsg);
    self.__count = self.__count + 1;
    return self.__count;
end;

--- Get a random message.
-- This function selects randomly a message from the stored messages and returns
-- the german and the english version.<br>
-- <br>
-- @return the german version of the message and the english version of the
--      message
function Messages:getRandomMessage()
    local messageID = math.random(1, self.__count);
    return self.__german[messageID], self.__english[messageID];
end;

--- Get a specified message from the list.
-- This function returns a message that is enlisted at a specified index.<br>
-- <br>
-- @param index the index of the message
-- <br>
-- @return the german version of the message and the english version of the
--      message or a error message in case the index value is out of bounds
function Messages:getMessage(index)
    if index < 1 or index > self.__count then
        error("Index out of bounds");
    end;
    return self.__german[index], self.__english[index];
end;

--- Check if this instance contains any messages.
-- <br>
-- @return true in case there are messages stored in this object
function Messages:hasMessages()
	return self.__count > 0
end;

--- Get the amount of stored messages.
-- This meta method is called by the unary operator # and returns the amount of
-- messages stored in this object.<br>
-- <br>
-- @return the amount of messages stored in this object
function Messages:__len()
    return self.__count;
end;

