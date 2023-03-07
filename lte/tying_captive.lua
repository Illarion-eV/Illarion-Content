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
local common = require("base.common")
local M = {}
--[[ LTE 24
     tying up: captive
    @value Capturer - id of the char that the captive follows
    @value escape - time (in 1/2 seconds) left for escaping
    @value success - set after first call during escape time, if escaping may be successful
    @value logout - set when all capturers are away.
    @value logyear, logmonth, logday, loghour, logminute, logsecond - exact date when waiting time for capturers ends.
]]

local function InformW( User, textInDe, textInEn )
    User:inform(common.GetNLS( User, textInDe, textInEn ),Player.mediumPriority)
end

function M.addEffect( Tying, Captive )
    -- nothing
end

function M.callEffect( Tying, Captive )

    local foundEscape, escape = Tying:findValue("escape")
    Tying.nextCalled = 5
    local foundCapturer, Capturer = Tying:findValue("Capturer")

    if foundCapturer then
        local range = 2
        local XOff
        local YOff
        Capturer = M.IsCharidInRangeOf(Capturer,Captive.pos,5)
        if Capturer then
            if not Capturer.effects:find(26) then
                return M.checkForCapturers(Tying, Captive)
            end

            Tying:removeValue("logout")
            local foundSuccess = Tying:findValue("success")
            if foundEscape then
                if not foundSuccess then -- first call during escape time
                    -- check for other capturers
                    if M.escapeSuccess(Tying,Captive,Capturer) then
                        InformW(Captive,
                            "Das Seil scheint etwas locker zu sein. Wenn du jetzt wegrennst, kannst du dich bestimmt losrei�en!",
                            "The rope seems to be somewhat loose. If you run now, you can surely break away!")
                        Tying:addValue("success",1) -- do not call again.
                    else
                        escape = 0
                    end
                end
                if escape == 0 then
                    Tying:removeValue("escape")
                    Tying:removeValue("success")
                else
                    range = 5 -- raise range, we can run away!
                    Tying:addValue("escape",escape-1)
                end
            end
            XOff = Captive.pos.x - Capturer.pos.x -- standard coordinates we have to stick to
            YOff = Captive.pos.y - Capturer.pos.y
            M.MoveCharacter(Captive,Tying,XOff,YOff,range)
            return true
        end

        -- capturer not near, check for others
        if M.checkForCapturers(Tying, Captive) then
            return true
        end

        if Tying:findValue("success") then
            return false
        end

        -- no capturers near! Handle possible logout (or warp)
        if not Tying:findValue("logout") then
            Tying:addValue("logout",1)
            Tying:addValue("logyears", common.getTime("year"))
            Tying:addValue("logmonths", common.getTime("month"))
            Tying:addValue("logdays", common.getTime("day"))
            Tying:addValue("loghours", common.getTime("hour"))
            Tying:addValue("logminutes", common.getTime("minute")+3)
            Tying:addValue("logseconds", common.getTime("second"))
            local PosX = Captive.pos.x+500
            local PosY = Captive.pos.y+500
            Tying:addValue("logposx",PosX)
            Tying:addValue("logposy",PosY)
            InformW(Captive,
                "Deine H�nde sind immernoch gefesselt, doch das Seil scheint sich langsam zu l�sen.",
                "Your hands are still tied together, but you feel the rope becoming loose.")
        end
        if M.IsEffectInLogoutTime(Tying, Character) then
            local foundPosX, PosX = Tying:findValue("logposx")
            local foundPosY, PosY = Tying:findValue("logposy")
            if not foundPosX or not foundPosY then
                PosX = Captive.pos.x+500
                PosY = Captive.pos.y+500
                Tying:addValue("logposx",PosX)
                Tying:addValue("logposy",PosY)
            end
            XOff = Captive.pos.x - (PosX-500)
            YOff = Captive.pos.y - (PosY-500)
            M.MoveCharacter(Captive,Tying,XOff,YOff,range)
            return true
        end
    else
        return M.checkForCapturers(Tying, Captive)
    end
    return false
end

function M.removeEffect( Tying, Captive )

    InformW(Captive,
        "Du bist frei!",
        "You are free!")
    for i=5,6 do
        local item = Captive:getItemAt(i)
        if item.id == 228 then
            world:erase(item,item.number)
        end
    end
end

function M.loadEffect( Tying, Captive )

    local foundCapturer, Capturer = Tying:findValue("Capturer")
    if not M.IsEffectInLogoutTime(Tying, Captive) then
        log("[Rope]: Tied up character "..Captive.name.." logs in again. "..(foundCapturer and " Capturer: "..Capturer or "").." Time limit exceeded")
    else
        log("[Rope]: Tied up character "..Captive.name.." logs in again. "..(foundCapturer and " Capturer: "..Capturer or "").." Within time limit")
    end
    Tying:removeValue("logout")
end

-- ===============================
-- Additional functions
-- ===============================

--[[
    IsCharidInRangeOf
    check if a Character with a certain ID is in range of a position
    @param integer - ID of the Character that shall be found
    @param PositionStruct - center position of the crcle that shall be checked
    @param integer - radius of the circle that shall be checked
    @return CaptiveStruct - the Character if he was found, false if not found
]]
function M.IsCharidInRangeOf( CharID, Position, Range )

    CharID = CharID+1-1
    local CharList = world:getCharactersInRangeOf(Position,Range)
    for i,Char in pairs(CharList) do
        if Char.id == CharID and Char.pos.z == Position.z then
            return Char
        end
    end
    return nil
end

--[[ Compare all attribs in AttribList from Char1 and Char2.
Return the best (highest) Offset for Char1, at least 0.
]]
function M.GetBestAttribOffset( Char1, Char2, AttribList )

    local bestOffset = 0
    local currentOffset
    local addVal = 0

    for cnt in pairs(AttribList) do
        currentOffset = Char1:increaseAttrib(AttribList[cnt],0) - Char2:increaseAttrib(AttribList[cnt],0)
        if currentOffset > bestOffset then
            bestOffset = currentOffset
        end
        addVal = addVal + currentOffset
    end
    return math.max(bestOffset,addVal)
end

local function MoveX(Character,XOff,forced)
    if (XOff == 0) and not forced then
        return false
    end

    local old_pos = Character.pos
    if (XOff > 0) then
        Character:move(6,true)
    else
        Character:move(2,true)
    end
    if (old_pos == Character.pos) then
        if forced and (XOff == 0) then
            Character:move(6,true)
            if not (old_pos == Character.pos) then
                return true
            end
        end
        return false
    else
        return true
    end
end

local function MoveY(Character,YOff,forced)
    if (YOff == 0) and not forced then
        return false
    end

    local old_pos = Character.pos
    if (YOff > 0) then
        Character:move(0,true)
    else
        Character:move(4,true)
    end
    if (old_pos == Character.pos) then
        if forced and (YOff == 0) then
            Character:move(0,true)
            if not (old_pos == Character.pos) then
                return true
            end
        end
        return false
    else
        return true
    end
end

function M.MoveCharacter( Character, Effect, XOff, YOff, range )

    local blocked = Effect:findValue("blocked")
    local saveAP = Character.movepoints -- need normal AP, even for forced moving
    Character.movepoints = 21
    if (math.sqrt(XOff*XOff + YOff*YOff) > range) then
        if ((math.abs(XOff) < math.abs(YOff)) and not blocked) or ((math.abs(XOff) > math.abs(YOff)) and blocked) then
            if not MoveX(Character,XOff,false) then
                if not MoveY(Character,YOff,false) then
                    MoveX(Character,XOff,true)
                    blocked = true
                else
                    blocked = false
                end
            else
                blocked = false
            end
        else
            if not MoveY(Character,YOff,false) then
                if not MoveX(Character,XOff,false) then
                    MoveY(Character,YOff,true)
                    blocked = true
                else
                    blocked = false
                end
            else
                blocked = false
            end
        end
    end
    Character.movepoints = saveAP
    if blocked then
        Effect:addValue("blocked", 1)
    else
        Effect:removeValue("blocked")
    end
end

function M.IsEffectInLogoutTime( Effect, Character )

    local foundYears, years = Effect:findValue("logyears")
    local foundMonths, months = Effect:findValue("logmonths")
    local foundDays, days = Effect:findValue("logdays")
    local foundHours, hours = Effect:findValue("loghours")
    local foundMinutes, minutes = Effect:findValue("logminutes")
    local _, seconds = Effect:findValue("logseconds")
    if foundYears and foundMonths and foundDays and foundHours and foundMinutes then
        local curYear = common.getTime("year")
        local curMonth = common.getTime("month")
        local curDay = common.getTime("day")
        local curHour = common.getTime("hour")
        local curMinute = common.getTime("minute")
        local curSecond = common.getTime("second")
        if minutes >= 60 then
            minutes = minutes-60
            hours = hours+1
        end
        if hours == 24 then
            hours = 0
            days = days+1
        end
        if days == 25 or (days == 7 and curMonth == 16) then
            days = 1
            months = months+1
        end
        if months == 17 then
            months = 1
            years = years+1
        end
        if curYear == years then
            if curMonth == months then
                if curDay == days then
                    if curHour == hours then
                        if curMinute == minutes then
                            if curSecond <= seconds then
                                return true
                            end
                        elseif curMinute < minutes then
                            return true
                        end
                    elseif curHour < hours then
                        return true
                    end
                elseif curDay < days then
                    return true
                end
            elseif curMonth < months then
                return true
            end
        elseif curYear < years then
            return true
        end
        return false
    end
    return false
end

function M.escapeSuccess( Effect, Captive, Capturer )

    local perc
    local AttribOffset
    local CharList = world:getCharactersInRangeOf(Captive.pos,5)
    for i,Char in pairs(CharList) do
        if Char.id ~= Capturer.id and Char.pos.z == Captive.pos.z then
            local foundEffect, TyingCapturer = Char.effects:find(26)
            if foundEffect then
                local foundCaptive, CaptiveId = TyingCapturer:findValue("Captive")
                if foundCaptive then
                    if CaptiveId == Captive.id then
                        -- found another Capturer! Check for escape success
                        AttribOffset = M.GetBestAttribOffset(Captive,Char,{"strength","dexterity","agility"})
                        if ( math.random(30) > math.min(20,AttribOffset) ) then
                            return false
                        else
                            perc = Char:increaseAttrib("perception",0)
                            if math.random(50) <= math.min(20,perc) then
                                InformW(Char,
                                    "Du sp�rst einen ungew�hnlichen Zug auf dem Seil. Ob das ein Fluchtversuch sein kann?",
                                    "You feel an unusual pull on the rope. Could that be an escape attempt?")
                            end
                        end
                    end
                end
            end
        end
    end
    return true
end

function M.checkForCapturers( Tying, Captive )

    local CharList = world:getCharactersInRangeOf(Captive.pos,5)
    for i,Char in pairs(CharList) do
        if Char.pos.z == Captive.pos.z then
            local foundEffect, TyingCapturer = Char.effects:find(26)
            if foundEffect then
                local foundCaptive, CaptiveId = TyingCapturer:findValue("Captive")
                if foundCaptive then
                    if CaptiveId == Captive.id then
                        Tying:addValue("Capturer",Char.id)
                        InformW(Char,
                            "Der Gefangene folgt nun dir.",
                            "Now the captive follows you.")
                        Tying:removeValue("escape")
                        Tying:removeValue("success")
                        return true
                    end
                end
            end
        end
    end
    return false
end

return M
