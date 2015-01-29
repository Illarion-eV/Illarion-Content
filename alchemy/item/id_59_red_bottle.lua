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
--ds_059_rote_flasche
--Druidensystem in Arbeit
--Falk
--Delay added by Blay09
--rework by Merung
local lookat = require("base.lookat")
local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local granorsHut = require("content.granorsHut")

local M = {}

-- UPDATE common SET com_script='alchemy.item.id_59_red_bottle' WHERE com_itemid = 59;

local taste = {}
M.attribList   ={"strength","intelligence","dexterity"       ,"perception"  ,"constitution","essence","agility"      ,"willpower"}
M.attribListDe ={"Stärke"  ,"Intelligenz" ,"Geschicklichkeit","Wahrnehmung" ,"Ausdauer"    ,"Essenz" ,"Schnelligkeit","Willenskraft"}
taste[0]     ={"fruchtig","herb"        ,"bitter"          ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"       ,"süß"}
taste[1]     ={"fruity"  ,"tartly"      ,"bitter"          ,"putrefactive","acidly"      ,"salt"   ,"hot"          ,"sweet"}

M.intensityListDe = {"stark"   ,"merkbar"  ,"leicht"  ,"kaum merklich"   ,"","kaum merklich"   ,"leicht"  ,"merkbar"  ,"stark"}
M.intensityListEn = {"strongly","noticably","slightly","barely noticably","","barely noticable","slightly","noticably","strongly"}

local function GenerateEffectMessage(User,dataZList)
    local effectMessagesDe = ""
    local effectMessagesEn = ""
	local anyEffect = false

	local attribEn, attribDe, nPTagEn, nPTagDe, attribIntensityEn, attribIntensityDe
	for i=1,8 do
	    if dataZList[i] ~= 5 then

			attribEn = M.attribList[i] -- attribute
			attribDe = M.attribListDe[i]
			if dataZList[i] > 5 then
			    nPTagEn = "in" -- increasing
				nPTagDe = "zu"
			else
                nPTagEn = "de" -- decreasing
                nPTagDe = "ab"
		    end
	        attribIntensityEn = M.intensityListEn[dataZList[i]] -- how strong it is in/decreased
			attribIntensityDe = M.intensityListDe[dataZList[i]]
            anyEffect = true
			-- we put everything together
			effectMessagesDe = effectMessagesDe.."Deine "..attribDe.." nimmt".." "..attribIntensityDe.." "..nPTagDe..". "
			effectMessagesEn = effectMessagesEn.."Your "..attribEn.." "..nPTagEn.."creases "..attribIntensityEn..". "
		end
    end
    if anyEffect == false then -- no effect
	    common.InformNLS(User,"Du spürst keine Wirkung.","You don't feel any effect.")
	else
	    common.InformNLS(User,effectMessagesDe,effectMessagesEn)
    end
end

local function DrinkPotion(User,SourceItem)
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

	if potionEffectId == 0 or potionEffectId == nil  then -- no effect
	    common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.",
		"You don't have the feeling that something happens.")
	    return

	elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer
		  -- there is already an effect, we remove it
		local foundEffect, myEffect = User.effects:find(59);
		if foundEffect then
			local findsight, sightpotion = myEffect:findValue("sightpotion")
			if findsight then
				common.InformNLS(User, "Deine Augen fühlen sich wieder normal an und der Stärkungstrank beginnt zu wirken.",
				"Your eyes feel normal again and the strengthening potions starts to take effect.")
			else
			    common.InformNLS(User, "Du spürst, dass der alte Stärkungstrank seine Wirkung verliert und wie der neue zu wirken einsetzt.",
				"You feel that the old strengthening potion looses its effect and how the new one takes effect.")
			end
		    local effectRemoved = User.effects:removeEffect(59)
		end
		local myEffectDuration = math.floor(SourceItem.quality/100)*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration
		local myEffect=LongTimeEffect(59,myEffectDuration) -- new effect

		local dataZList = alchemy.SplitData(User,potionEffectId)
		alchemy.generateTasteMessage(User,dataZList) -- potion taste
	    GenerateEffectMessage(User,dataZList) -- inform about the effects

		local attribValue, bottomBorder
		local logmsg = ""..User.name.." ("..User.id..") used an attribute potion, giving: "
		for i=1,8 do

			attribValue = User:increaseAttrib(M.attribList[i],0);

			bottomBorder = 1

			if (attribValue + dataZList[i] - 5) < bottomBorder then
				dataZList[i] = (bottomBorder - attribValue) + 5;
			end

			if dataZList[i] ~= 5 then
				User:increaseAttrib(M.attribList[i],dataZList[i]-5);
				local emptystring = " ";
				if(dataZList[i]-5>0) then
					emptystring = " +";
				end
				logmsg = logmsg..emptystring..(dataZList[i]-5).." to ".. M.attribList[i]..", and"
				myEffect:addValue("".. M.attribList[i],dataZList[i]);
			end

		end
		logmsg = logmsg.." it will last for "..myEffectDuration/600 .. " minutes."
		log(logmsg)
		local foundEffect, checkedEffect = User.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
		if not foundEffect then
		   User.effects:addEffect( myEffect )
		end
    elseif potionEffectId >= 5911111111 and potionEffectId <= 5999999999 then
		local foundEffect, myEffect = User.effects:find(59);
		if foundEffect then
			local effectRemoved = User.effects:removeEffect(59)
		    common.InformNLS(User, "Du spürst, dass der Trank seine Wirkung verliert. Deine Augen beginnen sich seltsam anzufühlen.",
		    "You feel that the old potion looses its effect. You eyes start to feel strange.")
		end
		local myEffectDuration = math.floor(SourceItem.quality/100)*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration
		local myEffect=LongTimeEffect(59,myEffectDuration) -- new effect

		myEffect:addValue("sightpotion",potionEffectId-5900000000)

		local foundEffect, checkedEffect = User.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
		if not foundEffect then
		   User.effects:addEffect( myEffect )
		end
	else
	    -- something else
	end
    
    if SourceItem:getData("granorsHut") ~= "" then
        granorsHut.potionReplacer()
    end
end

function M.UseItem(User, SourceItem, ltstate)
    -- repair potion in case it's broken
	alchemy.repairPotion(SourceItem)
	-- repair end

	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end

	local cauldron = alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.FillIntoCauldron(User,SourceItem,cauldron,ltstate)

	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			User:talk(Character.say, "#me trinkt eine rote Flüssigkeit.", "#me drinks a red liquid.")
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
			alchemy.EmptyBottle(User,SourceItem)
	    end
	end
end

function M.LookAtItem(User,Item)
    return lookat.GenerateLookAt(User, Item, 0)
end

return M


