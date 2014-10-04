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
-- CreateAfterTime, id 80
-- to create a item after some time
-- see base.character.CreateAfterTime(Character,createAfter,createGfx,createSound)

local common = require("base.common")
module("lte.createaftertime", package.seeall)

TextDE={};
TextEN={};
TextDE[1]="Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.";
TextEN[1]="It does not look like as any fairy would drop an element today.";
TextDE[2]="Ah! Eine Fee hat pure Luft verloren";
TextEN[2]="Ah! A fairy lost pure air";
TextDE[3]="Ah! Eine Fee hat pure Erde verloren";
TextEN[3]="Ah! A fairy lost pure earth";
TextDE[4]="Ah! Eine Fee hat pures Feurer verloren";
TextEN[4]="Ah! A fairy lost pure fire";
TextDE[5]="Ah! Eine Fee hat pures Wasser verloren";
TextEN[5]="Ah! A fairy lost pure water";

PosItemDE={};
PosItemEN={};
PosItemDE[1]=" nordwestlich von dir.";
PosItemEN[1]=" northwest of you.";
PosItemDE[2]=" südwestlich von dir.";
PosItemEN[2]=" southwest of you.";
PosItemDE[3]=" nordöstlich von dir.";
PosItemEN[3]=" northeast of you.";
PosItemDE[4]=" südöstlich von dir.";
PosItemEN[4]=" southeast of you.";
PosItemDE[5]=" westlich von dir.";
PosItemEN[5]=" west of you.";
PosItemDE[6]=" östlich von dir.";
PosItemEN[6]=" east of you.";
PosItemDE[7]=" nördlich von dir.";
PosItemEN[7]=" north of you.";
PosItemDE[8]=" südlich von dir.";
PosItemEN[8]=" south of you.";
PosItemDE[9]=" unter deinen Beinen.";
PosItemEN[9]=" underneath your feet.";


createItemTimeB={}
createItemTimeBB={}
createItemText={}
createItemTimeA={}
createItemTimeAA={}
informplayeraboutunsuccess={}
createRepeatA={}
createRepeatB={}
createRepeatX={}
createItemID={}
createItemIDB={}
createItemAmountA={}
createItemAmountB={}
createItemAmount={}
createItemXA={}
createItemXB={}
createItemYA={}
createItemYB={}
createItemZA={}
createItemZB={}
createItemX={}
createItemY={}
createItemZ={}
posOfItem={}
createItemQualA={}
createItemQualB={}
createItemQual={}
testforaccessabletile={}
createItemFieldAccess={}
createGfx={}
createSound={}
PoscreatedItemX={}
PoscreatedItemY={}
createAfter1={}
createAfterA1={}
createAfterB1={}
createAfter2={}
createAfterA2={}
createAfterB2={}
createItemPos={}



function addEffect(Effect, Character)

end

function callEffect(Effect, Character)

findCreateItemTimeB, createItemTimeB[Character.name] = Effect:findValue("createItemTimeB") --find variable
findCreateItemTimeBB, createItemTimeBB[Character.name] = Effect:findValue("createItemTimeBB") --find variable
findCreateItemText, createItemText[Character.name] = Effect:findValue("createItemText") --find variable
if createItemTimeB[Character.name] ~= 0 then
    if not createItemTimeA[Character.name] then --check if false
        createItemTimeA[Character.name]=0 --set 0 if false
    else
    end
--debug("createItemTimeA_1a: "..Character.name.."..."..createItemTimeA[Character.name])
--debug("createItemTimeB_1a: "..Character.name.."..."..createItemTimeB[Character.name])
--    local findCreateItemTimeB, createItemTimeB = Effect:findValue("createItemTimeB") --find variable
     if createItemTimeA[Character.name]<createItemTimeB[Character.name] then --check if smaller; if yes than nextcall
        if informplayeraboutunsuccess[Character.name] == nil then
            informplayeraboutunsuccess[Character.name] = 0
        elseif informplayeraboutunsuccess[Character.name] == 1 and createItemText[Character.name]==1 then -- if we have defined text1 for the created item
            common.InformNLS(Character,TextDE[createItemText[Character.name]],TextEN[createItemText[Character.name]]); --inform player about result
        end
        informplayeraboutunsuccess[Character.name] = informplayeraboutunsuccess[Character.name]+1

        findCreateRepeatA, createRepeatA[Character.name] = Effect:findValue("createRepeatA") --find variable
        findCreateRepeatB, createRepeatB[Character.name] = Effect:findValue("createRepeatB") --find variable
        createRepeatX[Character.name]=math.random(createRepeatA[Character.name],createRepeatB[Character.name]) --create random value between variables
        local i=0; --ready for repeat
        repeat
            i=i+1; --counter
            findCreateItemID, createItemID[Character.name] = Effect:findValue("createItemID") --find variable

            findCreateItemAmountA, createItemAmountA[Character.name] = Effect:findValue("createItemAmountA") --find variable
            findCreateItemAmountB, createItemAmountB[Character.name] = Effect:findValue("createItemAmountB") --find variable
            createItemAmount[Character.name]=math.random(createItemAmountA[Character.name],createItemAmountB[Character.name]) --create random value between variables

            findCreateItemXA, createItemXA[Character.name] = Effect:findValue("createItemXA") --find variable
            findCreateItemXB, createItemXB[Character.name] = Effect:findValue("createItemXB") --find variable
            findCreateItemYA, createItemYA[Character.name] = Effect:findValue("createItemYA") --find variable
            findCreateItemYB, createItemYB[Character.name] = Effect:findValue("createItemYB") --find variable
            findCreateItemZA, createItemZA[Character.name] = Effect:findValue("createItemZA") --find variable
            findCreateItemZB, createItemZB[Character.name] = Effect:findValue("createItemZB") --find variable
            createItemX[Character.name]=math.random(createItemXA[Character.name],createItemXB[Character.name]) --create random value between variables
            createItemY[Character.name]=math.random(createItemYA[Character.name],createItemYB[Character.name]) --create random value between variables
            createItemZ[Character.name]=math.random(createItemZA[Character.name],createItemZB[Character.name]) --create random value between variables
            posOfItem[Character.name] = position(createItemX[Character.name],createItemY[Character.name],createItemZ[Character.name]) --set value for position
            testforaccessabletile[Character.name] = 0
            findCreateItemFieldAccess, createItemFieldAccess[Character.name] = Effect:findValue("createItemFieldAccess") --find variable
            if createItemID[Character.name] ~= 0 and createItemFieldAccess[Character.name] == nil or createItemID[Character.name] ~= 0 and createItemFieldAccess[Character.name] == 0 then
                repeat
                    createItemX[Character.name]=math.random(createItemXA[Character.name],createItemXB) --create random value between variables
                    createItemY[Character.name]=math.random(createItemYA[Character.name],createItemYB) --create random value between variables
                    createItemZ[Character.name]=math.random(createItemZA[Character.name],createItemZB) --create random value between variables
                    posOfItem[Character.name] = position(createItemX[Character.name],createItemY[Character.name],createItemZ[Character.name]) --set value for position
--                    if common.GetGroundType(world:getField(posOfItem[Character.name]):tile()) == GroundType.water then
                    if common.GetGroundType(world:getField(posOfItem[Character.name]):tile()) == 6 then
                        testforaccessabletile[Character.name] = 0
                    else
                        testforaccessabletile[Character.name] = 1
                    end
                until (testforaccessabletile[Character.name]==1) --stop repeat
            else
                createItemX[Character.name]=math.random(createItemXA[Character.name],createItemXB[Character.name]) --create random value between variables
                createItemY[Character.name]=math.random(createItemYA[Character.name],createItemYB[Character.name]) --create random value between variables
                createItemZ[Character.name]=math.random(createItemZA[Character.name],createItemZB[Character.name]) --create random value between variables
                posOfItem[Character.name] = position(createItemX[Character.name],createItemY[Character.name],createItemZ[Character.name]) --set value for position
            end
--debug(i.."**posOfItem_1a: "..Character.name.."..."..createItemX[Character.name].."..."..createItemY[Character.name].."..."..createItemZ[Character.name])
            findCreateItemQualA, createItemQualA[Character.name] = Effect:findValue("createItemQualA") --find variable
            findCreateItemQualB, createItemQualB[Character.name] = Effect:findValue("createItemQualB") --find variable
            createItemQual[Character.name]=math.random(createItemQualA[Character.name],createItemQualB[Character.name]); --create random value between variables

            findCreateGfx, createGfx[Character.name] = Effect:findValue("createGfx") --find variable
              if findCreateGfx then -- in case we defined a Gfx shown on the created item
                world:gfx(createGfx[Character.name],posOfItem[Character.name]) --create gfx
            end

            findCreateSound, createSound[Character.name] = Effect:findValue("createSound") --find variable
            if findCreateSound then -- if we have defined a sound for the created item
                world:makeSound(createSound[Character.name],posOfItem[Character.name]) --create sfx
            end
        until (i==createRepeatX[Character.name]) --stop repeat

        if createItemID[Character.name] ~= 0 then --an item shall be created
            PoscreatedItemX[Character.name]=createItemX[Character.name]
            PoscreatedItemY[Character.name]=createItemY[Character.name]
            world:createItemFromId( createItemID[Character.name], createItemAmount[Character.name], posOfItem[Character.name], true, createItemQual[Character.name], nil) --creates item
        end

        createItemTimeA[Character.name]=createItemTimeA[Character.name]+1 --counter for nextcall
        findCreateAfterA1, createAfterA1[Character.name] = Effect:findValue("createAfterA") --find variable
        findCreateAfterB1, createAfterB1[Character.name] = Effect:findValue("createAfterB") --find variable
        if createItemTimeA[Character.name]==0 then
            createAfter1[Character.name]=createAfterA1[Character.name]
        else    
            createAfter1[Character.name]=math.random(createAfterA1[Character.name],createAfterB1[Character.name]);  --create random value between variables
        end
--debug("createAfter_1a: "..Character.name.."..."..createAfter1[Character.name])
        Effect.nextCalled = createAfter1[Character.name] --set time for nextcall
        return true --callEffect is needed again, return true necessary

    elseif createItemID[Character.name] ~= 0 then --item is necessary
        findCreateItemPos, createItemPos[Character.name] = Effect:findValue("createItemPos") --find variable
        if findCreateItemPos then -- if yes, position of item in relation to character will be checked
            if PoscreatedItemX[Character.name] < Character.pos.x and PoscreatedItemY[Character.name] < Character.pos.y then
                PosItem=1
            elseif PoscreatedItemX[Character.name] < Character.pos.x and PoscreatedItemY[Character.name] > Character.pos.y then
                PosItem=2
            elseif PoscreatedItemX[Character.name] > Character.pos.x and PoscreatedItemY[Character.name] < Character.pos.y then
                PosItem=3
            elseif PoscreatedItemX[Character.name] > Character.pos.x and PoscreatedItemY[Character.name] > Character.pos.y then
                PosItem=4
            elseif PoscreatedItemX[Character.name] < Character.pos.x then
                PosItem=5
            elseif PoscreatedItemX[Character.name] > Character.pos.x then
                PosItem=6
            elseif PoscreatedItemY[Character.name] < Character.pos.y then
                PosItem=7
            elseif PoscreatedItemY[Character.name] > Character.pos.y then
                PosItem=8
            else
                PosItem=9
            end
        end
    end
--    findCreateItemText, createItemText = Effect:findValue("createItemText") --find variable
--[[    if createItemText==1 then -- if we have defined text1 for the created item
        common.InformNLS(Character,TextDE[createItemText],TextEN[createItemText]); --inform player about result
    end ]]--

    if createItemText[Character.name]==2 or createItemText[Character.name]==3 or createItemText[Character.name]==4 or createItemText[Character.name]==5 then -- if we have defined text2..5 for the created item
        Character:inform(""..TextDE[createItemText[Character.name]]..PosItemDE[PosItem],""..TextEN[createItemText[Character.name]]..PosItemEN[PosItem])--inform player about result and the direction
    end

    informplayeraboutunsuccess[Character.name] = 0  --prepare for next script call
    createItemTimeA[Character.name]=0  --prepare for next script call
    return false -- callEffect is only needed once, no return true necessary

elseif findCreateItemTimeBB then
    if not createItemTimeAA[Character.name] then --check if false
        createItemTimeAA[Character.name]=0 --set 0 if false
        else
    end
--debug("createItemTimeAA_1a: "..Character.name.."..."..createItemTimeAA[Character.name])
--debug("createItemTimeBB_1a: "..Character.name.."..."..createItemTimeBB[Character.name])
     if createItemTimeAA[Character.name]<createItemTimeBB[Character.name] then --check if smaller; if yes than nextcall
        if informplayeraboutunsuccess[Character.name] == nil then
            informplayeraboutunsuccess[Character.name] = 0
        elseif informplayeraboutunsuccess[Character.name] == 1 and createItemText[Character.name]==1 then -- if we have defined text1 for the created item
            common.InformNLS(Character,TextDE[createItemText[Character.name]],TextEN[createItemText[Character.name]]); --inform player about result
        end
        informplayeraboutunsuccess[Character.name] = informplayeraboutunsuccess[Character.name]+1

        findCreateRepeatA, createRepeatA[Character.name] = Effect:findValue("createRepeatA") --find variable
        findCreateRepeatB, createRepeatB[Character.name] = Effect:findValue("createRepeatB") --find variable
        createRepeatX[Character.name]=math.random(createRepeatA[Character.name],createRepeatB[Character.name]) --create random value between variables
        local i=0; --ready for repeat
        repeat
            i=i+1; --counter
            findCreateItemIDB, createItemIDB[Character.name] = Effect:findValue("createItemIDB") --find variable

            findCreateItemAmountA, createItemAmountA[Character.name] = Effect:findValue("createItemAmountA") --find variable
            findCreateItemAmountB, createItemAmountB[Character.name] = Effect:findValue("createItemAmountB") --find variable
            createItemAmount[Character.name]=math.random(createItemAmountA[Character.name],createItemAmountB[Character.name]) --create random value between variables

            findCreateItemXA, createItemXA[Character.name] = Effect:findValue("createItemXA") --find variable
            findCreateItemXB, createItemXB[Character.name] = Effect:findValue("createItemXB") --find variable
            findCreateItemYA, createItemYA[Character.name] = Effect:findValue("createItemYA") --find variable
            findCreateItemYB, createItemYB[Character.name] = Effect:findValue("createItemYB") --find variable
            findCreateItemZA, createItemZA[Character.name] = Effect:findValue("createItemZA") --find variable
            findCreateItemZB, createItemZB[Character.name] = Effect:findValue("createItemZB") --find variable
                createItemX[Character.name]=math.random(createItemXA[Character.name],createItemXB[Character.name]) --create random value between variables
                createItemY[Character.name]=math.random(createItemYA[Character.name],createItemYB[Character.name]) --create random value between variables
                createItemZ[Character.name]=math.random(createItemZA[Character.name],createItemZB[Character.name]) --create random value between variables
                posOfItem[Character.name] = position(createItemX[Character.name],createItemY[Character.name],createItemZ[Character.name]) --set value for position
--debug(i.."**posOfItem_2b: "..Character.name.."..."..createItemX[Character.name].."..."..createItemY[Character.name].."..."..createItemZ[Character.name])
            findCreateItemQualA, createItemQualA[Character.name] = Effect:findValue("createItemQualA") --find variable
            findCreateItemQualB, createItemQualB[Character.name] = Effect:findValue("createItemQualB") --find variable
            createItemQual[Character.name]=math.random(createItemQualA[Character.name],createItemQualB[Character.name]); --create random value between variables

            findCreateGfx, createGfx[Character.name] = Effect:findValue("createGfx") --find variable
              if findCreateGfx then -- in case we defined a Gfx shown on the created item
                world:gfx(createGfx[Character.name],posOfItem[Character.name]) --create gfx
            end

            findCreateSound, createSound[Character.name] = Effect:findValue("createSound") --find variable
            if findCreateSound then -- if we have defined a sound for the created item
                world:makeSound(createSound[Character.name],posOfItem[Character.name]) --create sfx
            end
        until (i==createRepeatX[Character.name]) --stop repeat

        if createItemIDB[Character.name] ~= 0 then --an item B shall be created
            PoscreatedItemX[Character.name]=createItemX[Character.name]
            PoscreatedItemY[Character.name]=createItemY[Character.name]
            world:createItemFromId( createItemIDB[Character.name], createItemAmount[Character.name], posOfItem[Character.name], true, createItemQual[Character.name], nil) --creates item
        end

        createItemTimeAA[Character.name]=createItemTimeAA[Character.name]+1 --counter for nextcall
        findCreateAfterA2, createAfterA2[Character.name] = Effect:findValue("createAfterA") --find variable
        findCreateAfterB2, createAfterB2[Character.name] = Effect:findValue("createAfterB") --find variable
        if createItemTimeAA[Character.name]==0 then
            createAfter2[Character.name]=createAfterA2[Character.name]
        else    
            createAfter2[Character.name]=math.random(createAfterA2[Character.name],createAfterB2[Character.name]);  --create random value between variables
        end
--debug("createAfter_2b: "..Character.name.."..."..createAfter2[Character.name])
        Effect.nextCalled = createAfter2[Character.name] --set time for nextcall
        return true --callEffect is needed again, return true necessary

    elseif createItemIDB[Character.name] ~= 0 then --item B is necessary
        findCreateItemPos, createItemPos[Character.name] = Effect:findValue("createItemPos") --find variable
        if findCreateItemPos then -- if yes, position of item in relation to character will be checked
            if PoscreatedItemX[Character.name] < Character.pos.x and PoscreatedItemY[Character.name] < Character.pos.y then
                PosItem=1
            elseif PoscreatedItemX[Character.name] < Character.pos.x and PoscreatedItemY[Character.name] > Character.pos.y then
                PosItem=2
            elseif PoscreatedItemX[Character.name] > Character.pos.x and PoscreatedItemY[Character.name] < Character.pos.y then
                PosItem=3
            elseif PoscreatedItemX[Character.name] > Character.pos.x and PoscreatedItemY[Character.name] > Character.pos.y then
                PosItem=4
            elseif PoscreatedItemX[Character.name] < Character.pos.x then
                PosItem=5
            elseif PoscreatedItemX[Character.name] > Character.pos.x then
                PosItem=6
            elseif PoscreatedItemY[Character.name] < Character.pos.y then
                PosItem=7
            elseif PoscreatedItemY[Character.name] > Character.pos.y then
                PosItem=8
            else
                PosItem=9
            end
        end
    end
--    findCreateItemText, createItemText = Effect:findValue("createItemText") --find variable
--[[    if createItemText==1 then -- if we have defined text1 for the created item
        common.InformNLS(Character,TextDE[createItemText],TextEN[createItemText]); --inform player about result
    end ]]--

    if createItemText[Character.name]==2 or createItemText[Character.name]==3 or createItemText[Character.name]==4 or createItemText[Character.name]==5 then -- if we have defined text2..5 for the created item
        Character:inform(""..TextDE[createItemText[Character.name]]..PosItemDE[PosItem],""..TextEN[createItemText[Character.name]]..PosItemEN[PosItem])--inform player about result and the direction
    end

    informplayeraboutunsuccess[Character.name] = 0  --prepare for next script call
    createItemTimeAA[Character.name]=0  --prepare for next script call
    return false -- callEffect is only needed once, no return true necessary
end
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)

end
