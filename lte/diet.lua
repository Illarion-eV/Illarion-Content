--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- Long Time Effect Script: Diet System
-- Effect ID: 12

local food = require("item.food")
local common = require("base.common")

local M = {}

GermanAttributes = {
  ["constitution"] = "Ausdauer",
  ["strength"] = "Stärke",
  ["dexterity"] = "Geschicklichkeit",
  ["agility"] = "Schnelligkeit",
  ["intelligence"] = "Intelligenz",
  ["willpower"] = "Willenskraft",
  ["perception"] = "Wahrnehmung",
  ["essence"] = "Essenz"
};

function M.addEffect(dietEffect,Character)
  InformPlayer(dietEffect,Character);
end

function M.callEffect(dietEffect,Character)
	local curStamp = common.GetCurrentTimestamp();
  local foundExpire, buffExpireStamp = dietEffect:findValue("buffExpireStamp");
  if (not foundExpire) then
    Character:inform("[ERROR] No expire stamp found in callEffect. Removing buff. Please inform a developer.");
    return false;
  end
  if (curStamp >= buffExpireStamp) then
    return false;
  end
  dietEffect.nextCalled = (buffExpireStamp - curStamp)*10;
  return true;
end

function M.removeEffect(dietEffect,Character)
  -- inform the player that the buff ends
  common.InformNLS(Character,
  "[Ernährung] Die Wirkung des guten Essens vergeht.",
  "[Diet] The effect of the good food vanishes.");

  RemoveBuff(dietEffect,Character);
end

function M.loadEffect(dietEffect,Character)
  -- check for old values and remove them
  if dietEffect:findValue("constMod") then
    dietEffect:removeValue("constMod");
    dietEffect.nextCalled = 5;
  end
  if dietEffect:findValue("dom") then
    dietEffect:removeValue("dom");
    dietEffect.nextCalled = 5;
  end

  local foundBuff, buffType = dietEffect:findValue("buffType");
  if (foundBuff) then
    local foundBuffAmount, buffAmount = dietEffect:findValue("buffAmount");
    if (not foundBuffAmount) then
      -- should not happen
      Character:inform("[ERROR] Found buffType, but no buffAmount. Set to 1. Please inform a developer.");
      buffAmount = 1;
    end
    -- add 1 for each attribute of this buff
    for i=1,buffAmount do
      local attrib = food.BUFFS[buffType][i];
      Character:setAttrib(attrib,Character:increaseAttrib(attrib,0)+1);
    end
  else
    dietEffect.nextCalled = 5;
  end
end

function InformPlayer(dietEffect, Character)
  local foundBuff, buffType = dietEffect:findValue("buffType");
  if (foundBuff) then
    local foundBuffAmount, buffAmount = dietEffect:findValue("buffAmount");
    if (not foundBuffAmount) then
      -- should not happen
      Character:inform("[Error] Found buffType, but no buffAmount. Set to 1. Please inform a developer.");
      buffAmount = 1;
    end
    if (buffAmount == 1) then
      local attrib = food.BUFFS[buffType][1];
	  Character:setAttrib(attrib,Character:increaseAttrib(attrib,0)+1);
      local gText = "[Ernährung] Durch das gute Essen erhöht sich vorübergehend folgendes Attribut um 1: ";
      if (GermanAttributes[attrib] ~= nil) then
        gText = gText .. GermanAttributes[attrib];
      else
        gText = gText .. attrib;
      end
      local eText = "[Diet] Due to your good food, the following attribute is temporarily increased by 1: " .. attrib;
      common.InformNLS(Character,gText,eText);
    else
      local attrib = food.BUFFS[buffType];
      local gText = "[Ernährung] Durch das gute Essen erhöhen sich vorübergehend folgende Attribute um 1: ";
      local eText = "[Diet] Due to your good food, the following attributes are temporarily increased by 1: ";
      local attrib = food.BUFFS[buffType][1];
	  Character:setAttrib(attrib,Character:increaseAttrib(attrib,0)+1);
      eText = eText .. attrib;
      if (GermanAttributes[attrib] ~= nil) then
        gText = gText .. GermanAttributes[attrib];
      else
        gText = gText .. attrib;
      end
      attrib = food.BUFFS[buffType][2];
	  Character:setAttrib(attrib,Character:increaseAttrib(attrib,0)+1);
      eText = eText .. " and " .. attrib;
      if (GermanAttributes[attrib] ~= nil) then
        gText = gText .. " und " .. GermanAttributes[attrib];
      else
        gText = gText .. " und " .. attrib;
      end
      common.InformNLS(Character,gText,eText);
    end
  end
end

function RemoveBuff(dietEffect, Character)
  local foundBuff, buffType = dietEffect:findValue("buffType");
  if (foundBuff) then
    local foundBuffAmount, buffAmount = dietEffect:findValue("buffAmount");
    if (not foundBuffAmount) then
      -- should not happen
      Character:inform("[ERROR] Found buffType, but no buffAmount. Set to 1. Please inform a developer.");
      buffAmount = 1;
    end
    -- reset again the attributes
    for i=1,buffAmount do
      local attrib = food.BUFFS[buffType][i];
      Character:setAttrib(attrib,math.max(1,Character:increaseAttrib(attrib,0)-1));
    end
  end
end

return M

