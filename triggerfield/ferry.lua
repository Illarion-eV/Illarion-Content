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
-- INSERT INTO triggerfields VALUES (614,863,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (615,863,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (616,863,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (614,855,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (615,855,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (616,855,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (105,833,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (987,257,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (988,257,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (475,33,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (475,34,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (482,33,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (482,34,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (412,84,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (412,85,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (419,84,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (419,85,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (361,49,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (361,50,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (367,49,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (367,50,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (274,275,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (275,275,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (288,292,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (289,283,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (79,979,0,'triggerfield.ferry');----
-- INSERT INTO triggerfields VALUES (79,980,0,'triggerfield.ferry');----
-- INSERT INTO triggerfields VALUES (79,981,0,'triggerfield.ferry');----
-- INSERT INTO triggerfields VALUES (86,988,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (96,988,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (389,272,-6,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (389,273,-6,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (404,275,-6,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (404,276,-6,'triggerfield.ferry');

require("base.common")


module("triggerfield.ferry", package.seeall)



ferrySourcePos={position(614,863,0),position(615,863,0),position(616,863,0),position(614,855,0),position(615,855,0),position(616,855,0),position(105,833,0),position(987,257,0),position(988,257,0),position(475,33,0),position(475,34,0),position(482,33,0),position(482,34,0),position(412,84,0),position(412,85,0),position(419,84,0),position(419,85,0),position(361,49,0),position(361,50,0),position(367,49,0),position(367,50,0),position(86,988,0),position(96,988,0),position(289,283,0),position(275,275,0),position(288,292,0),position(274,275,0),position(389,272,-6),position(389,273,-6),position(404,275,-6),position(404,276,-6)}

ferryDE={}
ferryEN={}
ferryDE[1]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[1]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[2]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[2]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[3]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[3]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[4]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[4]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[5]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[5]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[6]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[6]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[7]={"Cadomyr Harbour"}
ferryEN[7]={"Cadomyr Harbour"}
ferryDE[8]={"Nördlicher Hafen"}
ferryEN[8]={"Northern Harbour"}
ferryDE[9]={"Nördlicher Hafen"}
ferryEN[9]={"Northern Harbour"}
ferryDE[10]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept"}
ferryEN[10]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept"}
ferryDE[11]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept"}
ferryEN[11]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept"}
ferryDE[12]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept"}
ferryEN[12]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept"}
ferryDE[13]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept"}
ferryEN[13]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept"}
ferryDE[14]={"Galmair Hafen","Nördliche Inseln -  Ra","Northern Islands -  Yeg"}
ferryEN[14]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Yeg"}
ferryDE[15]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Yeg"}
ferryEN[15]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Yeg"}
ferryDE[16]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Yeg"}
ferryEN[16]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Yeg"}
ferryDE[17]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Yeg"}
ferryEN[17]={"Galmair Harbour","Nördliche Inseln -  Ra","Northern Islands -  Yeg"}
ferryDE[18]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg"}
ferryEN[18]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg"}
ferryDE[19]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg"}
ferryEN[19]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg"}
ferryDE[20]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg"}
ferryEN[20]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg"}
ferryDE[21]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg"}
ferryEN[21]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg"}
ferryDE[22]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[22]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[23]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[23]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[24]={"Quelle der Träume - Höhle"}
ferryEN[24]={"Well of dreams - Cave"}
ferryDE[25]={"Galmair"}
ferryEN[25]={"Galmair"}
ferryDE[26]={"Quelle der Träume - Höhle"}
ferryEN[26]={"Well of dreams - Cave"}
ferryDE[27]={"Galmair"}
ferryEN[27]={"Galmair"}
ferryDE[28]={"Ronagan Schrein"}
ferryEN[28]={"Ronagan Shrine"}
ferryDE[29]={"Ronagan Schrein"}
ferryEN[29]={"Ronagan Shrine"}
ferryDE[30]={"Schlackengrube"}
ferryEN[30]={"Scoria Mine"}
ferryDE[31]={"Schlackengrube"}
ferryEN[31]={"Scoria Mine"}

ferryItem={}
ferryItem[1]={2701,105}
ferryItem[2]={2701,105}
ferryItem[3]={2701,105}
ferryItem[4]={2701,105}
ferryItem[5]={2701,105}
ferryItem[6]={2701,105}
ferryItem[7]={2701}
ferryItem[8]={308}
ferryItem[9]={308}
ferryItem[10]={61,359,360}
ferryItem[11]={61,359,360}
ferryItem[12]={61,359,360}
ferryItem[13]={61,359,360}
ferryItem[14]={61,359,372}
ferryItem[15]={61,359,372}
ferryItem[16]={61,359,372}
ferryItem[17]={61,359,372}
ferryItem[18]={61,360,372}
ferryItem[19]={61,360,372}
ferryItem[20]={61,360,372}
ferryItem[21]={61,360,372}
ferryItem[22]={2701,105}
ferryItem[23]={2701,105}
ferryItem[24]={61}
ferryItem[25]={61}
ferryItem[26]={61}
ferryItem[27]={61}
ferryItem[28]={61}
ferryItem[29]={61}
ferryItem[30]={61}
ferryItem[31]={61}

ferryTargetPos={}
ferryTargetPos[1]={position(102,790,0),position(728,809,0)}
ferryTargetPos[2]={position(102,790,0),position(728,809,0)}
ferryTargetPos[3]={position(102,790,0),position(728,809,0)}
ferryTargetPos[4]={position(102,790,0),position(728,809,0)}
ferryTargetPos[5]={position(102,790,0),position(728,809,0)}
ferryTargetPos[6]={position(102,790,0),position(728,809,0)}
ferryTargetPos[7]={position(102,790,0)}
ferryTargetPos[8]={position(870,286,0)}
ferryTargetPos[9]={position(870,286,0)}
ferryTargetPos[10]={position(450,95,0),position(364,49,0),position(415,85,0)}
ferryTargetPos[11]={position(450,95,0),position(364,49,0),position(415,85,0)}
ferryTargetPos[12]={position(450,95,0),position(364,49,0),position(415,85,0)}
ferryTargetPos[13]={position(450,95,0),position(364,49,0),position(415,85,0)}
ferryTargetPos[14]={position(450,95,0),position(364,49,0),position(478,34,0)}
ferryTargetPos[15]={position(450,95,0),position(364,49,0),position(478,34,0)}
ferryTargetPos[16]={position(450,95,0),position(364,49,0),position(478,34,0)}
ferryTargetPos[17]={position(450,95,0),position(364,49,0),position(478,34,0)}
ferryTargetPos[18]={position(450,95,0),position(415,85,0),position(478,34,0)}
ferryTargetPos[19]={position(450,95,0),position(415,85,0),position(478,34,0)}
ferryTargetPos[20]={position(450,95,0),position(415,85,0),position(478,34,0)}
ferryTargetPos[21]={position(450,95,0),position(415,85,0),position(478,34,0)}
ferryTargetPos[22]={position(102,790,0),position(728,809,0)}
ferryTargetPos[23]={position(102,790,0),position(728,809,0)}
ferryTargetPos[24]={position(275,274,0)}
ferryTargetPos[25]={position(290,283,0)}
ferryTargetPos[26]={position(274,274,0)}
ferryTargetPos[27]={position(289,292,0)}
ferryTargetPos[28]={position(404,275,-6)}
ferryTargetPos[29]={position(404,276,-6)}
ferryTargetPos[30]={position(389,272,-6)}
ferryTargetPos[31]={position(389,273,-6)}

noChoiceAndWrapDirectly={24,25,26,27,28,29,30,31}

function MoveToField(User)
	if User:getType() ~= Character.player then
		return
	end

	local names
	local Amountferry = table.getn(ferrySourcePos)
	local AmountWrapDirectly = 4
	for j = 1,Amountferry do
--[[	   for n = 1,AmountWrapDirectly do
		if j == noChoiceAndWrapDirectly[n] then
			if (User.pos == ferrySourcePos[j]) then
				User:warp(ferryTargetPos[j][1])
				return
			end
		end
	   end]]
	   if (User.pos == ferrySourcePos[j]) then
		for _,n in ipairs(noChoiceAndWrapDirectly) do
			if j == n then
				User:warp(ferryTargetPos[j][1])
				return
			end
		end
		if  User:getPlayerLanguage() == Player.german then
			names = ferryDE[j]
		else
			names = ferryEN[j]
		end
		items = ferryItem[j]
		targetPos = ferryTargetPos[j]
           end
	end
--User:inform("names: "..names,"names: "..names)
--User:inform("items: "..items,"items: "..items)
-- User:inform("targetPos: ","targetPos: ")

	local callback = function(dialog)

		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
--			if  base.money.CharHasMoney(User,10000) then

				if (targetPos[selected+1].x - User.pos.x) * (targetPos[selected+1].x - User.pos.x) < 6 then
					User:inform("Du befindest dich bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else


--					base.money.TakeMoneyFromChar(User,10000)


					travler = world:getPlayersInRangeOf(User.pos, 5);

					for i,player in ipairs(travler) do
						player:inform("Du hast dich dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
						world:gfx(1,player.pos)
						world:makeSound(9,player.pos);
						player:warp(targetPos[selected+1])
						world:gfx(11,player.pos)
						world:makeSound(9,player.pos);
					end

--					handler.warpgroup.warpGroup(SourceItem.pos, 5, position(1,1,0), 42 )
--					User:warp(targetPos[selected+1])
--					world:gfx(11,User.pos)
--					world:makeSound(9,User.pos);
				end
--			else
--				User:inform("Ihr habt nicht genug Geld für diese Reise. Die Reise kostet ein Goldstück für eine Überfahrt.", "You don't have enough money for this journey. The journey costs one gold coin for one passage.")
--			end

		end
	end

	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Fähre", "Wähle eine Ziel aus.", callback)
	else
		dialog = SelectionDialog("Ferry", "Choose a destination.", callback)
	end
	dialog:setCloseOnMove()

	for i=1,#items do
		dialog:addOption(items[i], names[i])
	end
	User:requestSelectionDialog(dialog)
end
