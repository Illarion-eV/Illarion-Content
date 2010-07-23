require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.language", package.seeall)

language = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    if (value == "german" or value == "deutsch") then
        self["value"] = CPlayer.german;
    else
        self["value"] = CPlayer.english;
    end;
    self["check"] = _language_helper_equal;
end);

function _language_helper_equal(self, player)
    return (player:getPlayerLanguage() == self.value);
end;