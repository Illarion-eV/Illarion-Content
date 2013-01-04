require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.talkmode", package.seeall)

talkmode = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    if (value == "shout" or value == "yell" or value == Character.yell) then
        self["value"] = Character.yell;
	elseif (value == "whisper" or value == Character.whisper) then
        self["value"] = Character.whisper;
    else
        self["value"] = Character.say;
    end;
    self["check"] = _talkmode_helper_equal;
end);

function _talkmode_helper_equal(self, npcChar, texttype, player)
    return (texttype == self.value);
end;
