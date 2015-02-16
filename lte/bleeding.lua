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
local M = {}
-- Bleeding Mainscript

lowerAttribs = {"agility","stength","constitution","perception","dexterity"}

function M.addEffect( BleedingEffect, Victim )
    BleedingEffect:addValue( "wounds", 1 )
    if ( Victim:getPlayerLanguage() == 0 ) then
        Victim:inform( "Durch den Schlag fängst du dir eine stark blutende Wunde ein." )
    else
        Victim:inform( "Due the hit you receive a heavily bleeding wound." )
    end
    BleedingEffect.nextCalled = 10
    return true
end

function M.doubleEffect( BleedingEffect, Victim )
    local woundsFound, wounds = BleedingEffect:findValue( "wounds" )
    if woundsFound then
        BleedingEffect:addValue( "wounds", wounds + 1 )
    else
        BleedingEffect:addValue( "wounds", 1 )
    end
    if ( Victim:getPlayerLanguage() == 0 ) then
        Victim:inform( "Durch den Schlag fängst du dir noch eine stark blutende Wunde ein." )
    else
        Victim:inform( "Due the hit you receive another heavily bleeding wound." )
    end
    BleedingEffect.nextCalled = 10
    return true
end

function M.callEffect( BleedingEffect, Victim )
    local woundsFound, wounds = BleedingEffect:findValue( "wounds" )
    if not woundsFound then
        wounds = 0
    end
    if ( wounds > 0 ) and ( math.random( 1, math.min( 1, 6-wounds ) ) == 1 ) then
        dropTheBlood( Victim.pos )
    end

    if ( wounds > 0 ) then
        BleedingEffect.nextCalled = 10
        local foundNextStep, nextStep = BleedingEffect:findValue( "nextActiveStep" )
        local foundMode, Mode = BleedingEffect:findValue( "mode" )
        if not foundMode then
            Mode = 0
        end
        if foundNextStep and ((( nextStep < 20 )and( Mode < 8 ))or(( nextStep < 5 )and( Mode >= 8 ))) then
            BleedingEffect:addValue( "nextActiveStep", nextStep+1 )
            return true
        end
        BleedingEffect:addValue( "nextActiveStep", 1 )
        if ( Mode < 8 ) then
            BleedingEffect:addValue( "mode", Mode +1 )
            local i = 0
            local targetAttrib
            repeat
                i = i +1
                if( i == 15 ) then
                    return true
                end
                targetAttrib = lowerAttribs[math.random(1,#lowerAttribs)]
            until( Victim:increaseAttrib(targetAttrib,0) <= 4 )
            Victim:increaseAttrib(targetAttrib,-1)
            local foundAttrib, Attribmod = BleedingEffect:findValue( targetAttrib )
            if not foundAttrib then
                Attribmod = 0
            end
            BleedingEffect:addValue( targetAttrib, Attribmod + 1 )
            if( Mode == 0 ) or ( Mode == 6 ) then
                if( Victim:getPlayerLanguage() == 0 ) then
                    Victim:inform( "Die blutende Wunde zieht an deinen Kräften." )
                else
                    Victim:inform( "The bleeding wound drags down your physical abilities." )
                end
            end
            return true
        else
            local HP = Victim:increaseAttrib("hitpoints",0)
            local changeHP = -math.floor((0.0000086372*HP*HP-0.177*HP+1158.1836))
            Victim:inform("HP werden geändert um: "..changeHP )
            if( HP+changeHP < 0 ) then
                Victim:increaseAttrib("hitpoints",-HP)
                BleedingEffect:addValue( "wounds", 0 )
                dropTheBlood( Victim.pos )
                dropTheBlood( position(Victim.pos.x-1,Victim.pos.y-1,Victim.pos.z) )
                dropTheBlood( position(Victim.pos.x-1,Victim.pos.y,Victim.pos.z) )
                dropTheBlood( position(Victim.pos.x-1,Victim.pos.y+1,Victim.pos.z) )
                dropTheBlood( position(Victim.pos.x,Victim.pos.y-1,Victim.pos.z) )
                dropTheBlood( position(Victim.pos.x,Victim.pos.y+1,Victim.pos.z) )
                dropTheBlood( position(Victim.pos.x+1,Victim.pos.y-1,Victim.pos.z) )
                dropTheBlood( position(Victim.pos.x+1,Victim.pos.y,Victim.pos.z) )
                dropTheBlood( position(Victim.pos.x+1,Victim.pos.y+1,Victim.pos.z) )
                return false
            else
                Victim:increaseAttrib("hitpoints", changeHP )
                return true
            end
        end
    else
        BleedingEffect.nextCalled = 5000
        local foundNextStep, nextStep = BleedingEffect:findValue( "nextActiveStep" )
        if foundNextStep and ( nextStep < 40 ) then
            BleedingEffect:addValue( "nextActiveStep", nextStep+1 )
            return true
        else
            BleedingEffect:addValue( "nextActiveStep", 1 )
            local foundMode, Mode = BleedingEffect:findValue( "mode" )
            if not foundMode then
                Mode = 0
            end
            if ( Mode > 0 ) then
                local attribChanged = false
                for i,attribute in lowerAttribs do
                    local foundAttrib, Attribmod = BleedingEffect:findValue( attribute )
                    if not foundAttrib then
                        Attribmod = 0
                    end
                    if( Attribmod > 0 ) then
                        BleedingEffect:addValue( attribute, Attribmod - 1 )
                        Victim:increaseAttrib(attribute,1)
                        attribChanged = true
                        break
                    end
                end
                if not attribChanged then
                    return false
                end
            end
            return true
        end
    end
end

function dropTheBlood( posi )
    if not world:isItemOnField( posi ) then
        local Blood=world:createItemFromId(3101,1,posi,true,333,0)
        Blood.wear=2
        world:changeItem(Blood)
    end
end

function M.removeEffect( BleedingEffect, Victim )
    for i,attribute in lowerAttribs do
        local foundAttrib, Attribmod = BleedingEffect:findValue( attribute )
        if not foundAttrib then
            Attribmod = 0
        end
        if( Attribmod > 0 ) then
            Victim:increaseAttrib(attribute,Attribmod)
        end
    end
end

function M.loadEffect( BleedingEffect, Victim )
    for i,attribute in lowerAttribs do
        local foundAttrib, Attribmod = BleedingEffect:findValue( attribute )
        if not foundAttrib then
            Attribmod = 0
        end
        if( Attribmod > 0 ) then
            Victim:increaseAttrib(attribute,-Attribmod)
        end
    end
end

return M
