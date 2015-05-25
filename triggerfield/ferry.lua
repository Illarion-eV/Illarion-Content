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
-- INSERT INTO triggerfields VALUES (86,988,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (96,988,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (360,259,-6,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (360,260,-6,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (375,262,-6,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (375,263,-6,'triggerfield.ferry');

-- INSERT INTO triggerfields VALUES (424,21,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (425,21,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (424,28,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (425,28,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (386,38,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (386,39,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (393,38,0,'triggerfield.ferry');
-- INSERT INTO triggerfields VALUES (393,39,0,'triggerfield.ferry');

local common = require("base.common")

local M = {}

local ferrySourcePos = {
    position(614,863,0),
    position(615,863,0),
    position(616,863,0),
    position(614,855,0),
    position(615,855,0),
    position(616,855,0),
    position(987,257,0),
    position(988,257,0),
    position(475,33,0), -- YEG
    position(475,34,0),
    position(482,33,0),
    position(482,34,0),
    position(412,84,0), -- HEPT
    position(412,85,0),
    position(419,84,0),
    position(419,85,0),
    position(361,49,0), -- RA
    position(361,50,0),
    position(367,49,0),
    position(367,50,0),
    position(86,988,0),
    position(96,988,0),
    position(289,283,0),
    position(275,275,0),
    position(288,292,0),
    position(274,275,0),
    position(360,259,-6),
    position(360,260,-6),
    position(375,262,-6),
    position(375,263,-6),
    position(424,21,0), -- SOHL
    position(425,21,0),
    position(424,28,0),
    position(425,28,0),
    position(386,38,0), -- PEN
    position(386,39,0),
    position(393,38,0),
    position(393,39,0)
}

local ferryDE={}
local ferryEN={}
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
ferryEN[6]={"Cadomyr Harbour","Runewick Harbour" }
ferryDE[7]={"Nördlicher Hafen"}
ferryEN[7]={"Northern Harbour"}
ferryDE[8]={"Nördlicher Hafen"}
ferryEN[8]={"Northern Harbour"}
ferryDE[9]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[9]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[10]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[10]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[11]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[11]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[12]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[12]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[13]={"Galmair Hafen","Nördliche Inseln -  Ra","Northern Islands -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[13]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[14]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[14]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[15]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[15]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[16]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[16]={"Galmair Harbour","Nördliche Inseln -  Ra","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[17]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[17]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[18]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[18]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[19]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[19]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[20]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Sohl","Nördliche Inseln -  Pen"}
ferryEN[20]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Sohl","Northern Islands -  Pen"}
ferryDE[21]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[21]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[22]={"Cadomyr Hafen","Runewick Hafen"}
ferryEN[22]={"Cadomyr Harbour","Runewick Harbour"}
ferryDE[23]={"Quelle der Träume - Höhle"}
ferryEN[23]={"Well of dreams - Cave"}
ferryDE[24]={"Galmair"}
ferryEN[24]={"Galmair"}
ferryDE[25]={"Quelle der Träume - Höhle"}
ferryEN[25]={"Well of dreams - Cave"}
ferryDE[26]={"Galmair"}
ferryEN[26]={"Galmair"}
ferryDE[27]={"Ronagan Schrein"}
ferryEN[27]={"Ronagan Shrine"}
ferryDE[28]={"Ronagan Schrein"}
ferryEN[28]={"Ronagan Shrine"}
ferryDE[29]={"Schlackengrube"}
ferryEN[29]={"Scoria Mine"}
ferryDE[30]={"Schlackengrube"}
ferryEN[30]={"Scoria Mine"}
ferryDE[31]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Pen"}
ferryEN[31]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Pen"}
ferryDE[32]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Pen"}
ferryEN[32]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Pen"}
ferryDE[33]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Pen"}
ferryEN[33]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Pen"}
ferryDE[34]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Pen"}
ferryEN[34]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Pen"}
ferryDE[35]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Sohl"}
ferryEN[35]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Sohl"}
ferryDE[36]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Sohl"}
ferryEN[36]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Sohl"}
ferryDE[37]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Sohl"}
ferryEN[37]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Sohl"}
ferryDE[38]={"Galmair Hafen","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Nördliche Inseln -  Ra","Nördliche Inseln -  Sohl"}
ferryEN[38]={"Galmair Harbour","Northern Islands -  Hept","Northern Islands -  Yeg","Northern Islands -  Ra","Northern Islands -  Sohl"}

local ferryItem={}
ferryItem[1]={2701,105}
ferryItem[2]={2701,105}
ferryItem[3]={2701,105}
ferryItem[4]={2701,105}
ferryItem[5]={2701,105}
ferryItem[6]={2701,105}
ferryItem[7]={308}
ferryItem[8]={308}
ferryItem[9]={61,359,360,1272,467}
ferryItem[10]={61,359,360,1272,467}
ferryItem[11]={61,359,360,1272,467}
ferryItem[12]={61,359,360,1272,467}
ferryItem[13]={61,359,372,1272,467}
ferryItem[14]={61,359,372,1272,467}
ferryItem[15]={61,359,372,1272,467}
ferryItem[16]={61,359,372,1272,467}
ferryItem[17]={61,360,372,1272,467}
ferryItem[18]={61,360,372,1272,467}
ferryItem[19]={61,360,372,1272,467}
ferryItem[20]={61,360,372,1272,467}
ferryItem[21]={2701,105}
ferryItem[22]={2701,105}
ferryItem[23]={61}
ferryItem[24]={61}
ferryItem[25]={61}
ferryItem[26]={61}
ferryItem[27]={61}
ferryItem[28]={61}
ferryItem[29]={61}
ferryItem[30]={61}
ferryItem[31]={61,360,372,359,467}
ferryItem[32]={61,360,372,359,467}
ferryItem[33]={61,360,372,359,467}
ferryItem[34]={61,360,372,359,467}
ferryItem[35]={61,360,372,359,1272}
ferryItem[36]={61,360,372,359,1272}
ferryItem[37]={61,360,372,359,1272}
ferryItem[38]={61,360,372,359,1272}

local ferryTargetPos={}
ferryTargetPos[1]={position(102,790,0),position(728,809,0)}
ferryTargetPos[2]={position(102,790,0),position(728,809,0)}
ferryTargetPos[3]={position(102,790,0),position(728,809,0)}
ferryTargetPos[4]={position(102,790,0),position(728,809,0)}
ferryTargetPos[5]={position(102,790,0),position(728,809,0)}
ferryTargetPos[6]={position(102,790,0),position(728,809,0)}
ferryTargetPos[7]={position(870,286,0)}
ferryTargetPos[8]={position(870,286,0)}
ferryTargetPos[9]={position(450,95,0),position(364,49,0),position(415,85,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[10]={position(450,95,0),position(364,49,0),position(415,85,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[11]={position(450,95,0),position(364,49,0),position(415,85,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[12]={position(450,95,0),position(364,49,0),position(415,85,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[13]={position(450,95,0),position(364,49,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[14]={position(450,95,0),position(364,49,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[15]={position(450,95,0),position(364,49,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[16]={position(450,95,0),position(364,49,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[17]={position(450,95,0),position(415,85,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[18]={position(450,95,0),position(415,85,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[19]={position(450,95,0),position(415,85,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[20]={position(450,95,0),position(415,85,0),position(478,34,0),position(424,24,0),position(389,39,0)}
ferryTargetPos[21]={position(102,790,0),position(728,809,0)}
ferryTargetPos[22]={position(102,790,0),position(728,809,0)}
ferryTargetPos[23]={position(275,274,0)}
ferryTargetPos[24]={position(290,283,0)}
ferryTargetPos[25]={position(274,274,0)}
ferryTargetPos[26]={position(289,292,0)}
ferryTargetPos[27]={position(375,262,-6)}
ferryTargetPos[28]={position(375,262,-6)}
ferryTargetPos[29]={position(360,259,-6)}
ferryTargetPos[30]={position(360,260,-6)}
ferryTargetPos[31]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(389,39,0)}
ferryTargetPos[32]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(389,39,0)}
ferryTargetPos[33]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(389,39,0)}
ferryTargetPos[34]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(389,39,0)}
ferryTargetPos[35]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(424,24,0)}
ferryTargetPos[36]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(424,24,0)}
ferryTargetPos[37]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(424,24,0)}
ferryTargetPos[38]={position(450,95,0),position(415,85,0),position(478,34,0),position(364,49,0),position(424,24,0)}

local ferryFactionHarborPos={position(690,320,0),position(101,790,0),position(727,809,0),position(451,95,0)}

local noChoiceAndWrapDirectly={23,24,25,26,27,28,29,30}

function M.MoveToField(User)
    if User:getType() ~= Character.player then
        return
    end

    if User.pos == position(355,864,2) and world:getItemOnField(position(355,864,2)).id == 10  then
        world:gfx(41,User.pos)
        world:makeSound(13,User.pos)
        for pf = 0,3 do
            if pf == User:getQuestProgress(199) then
                User:warp(ferryFactionHarborPos[pf+1])
                world:gfx(41,User.pos)
                world:makeSound(13,User.pos)
                return
            end
        end
    end

    local names
    local items
    local targetPos
    local Amountferry = #ferrySourcePos
    for j = 1,Amountferry do
        if User.pos == ferrySourcePos[j] then
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

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            if (targetPos[selected].x - User.pos.x) * (targetPos[selected].x - User.pos.x) < 6 then
                User:inform("Du befindest dich bereits in " ..names[selected]..".", "You are already in "..names[selected]..".")
            else
                local travelers = world:getPlayersInRangeOf(User.pos, 5);

                for _,player in ipairs(travelers) do
                    player:inform("Du hast dich dazu entschlossen nach " ..names[selected].. " zu Reisen.", "You have chosen to travel to " ..names[selected]..".")
                    world:gfx(1,player.pos)
                    world:makeSound(9,player.pos);
                    player:warp(targetPos[selected])
                    world:gfx(11,player.pos)
                    world:makeSound(9,player.pos);
                end
            end
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

return M
