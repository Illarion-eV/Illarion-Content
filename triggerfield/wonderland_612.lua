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

-- INSERT INTO triggerfields VALUES (890,596,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (876,590,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (878,562,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (901,581,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (900,581,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (899,581,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (899,580,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (899,579,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (900,579,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (901,579,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (901,580,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (906,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (906,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (906,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (905,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (904,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (904,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (904,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (905,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (891,560,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (890,560,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (889,560,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (889,559,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (889,558,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (890,558,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (891,558,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (891,559,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,583,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,584,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,585,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,585,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,585,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,584,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,583,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,583,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,593,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,594,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,595,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,595,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,595,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,594,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,593,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,593,0,'triggerfield.wonderland_612');

local M = {}

function M.MoveToField(char)
    if char:getType() ~= Character.player then
        return
    end

    -- entrance to wonderland. Cant enter here, only via bookrest (item/bookrests.lua)
    local bridge1 = position(878, 562, 0)
    local bridge2 = position(876, 590, 0)
    local bridge3 = position(890, 596, 0)
    local warpback1 = position(875, 562, 0)
    local warpback2 = position(872, 590, 0)
    local warpback3 = position(890, 600, 0)

    local warpedout = false

    if char.pos == bridge1 then
        world:makeSound(1, char.pos)
        char:warp(warpback1)
        warpedout = true
    elseif char.pos == bridge2 then
        world:makeSound(1, char.pos)
        char:warp(warpback2)
        warpedout = true
    elseif char.pos == bridge3 then
        world:makeSound(1, char.pos)
        char:warp(warpback3)
        warpedout = true
    end

    if warpedout == true then
        char:inform("Du hörst eine krächzende Stimme schreien: \"Das Wunderland kann nicht betreten werden ohne Erlaubnis. Finde das magische Podest um hereinzukommen\" Danach kehrt Stille ein.",
                    "You hear a croaking voice screaming: \"You may not enter Wonderland without permission. Find the magical podium if you wish to enter.\" Afterwards there is silence.")
        return
    end

    -- just fluff messages if main quest solved
    if char:getQuestProgress(612) == 2 and math.random(0,99)< 10 then -- riddle has been solved yet; the voice one more time; chance be warped
        if char.pos == position(890,596,0) or char.pos == position(876,590,0) or char.pos == position(878,562,0) then
            world:makeSound(1,char.pos);
            char:warp(position(900,580,0))
            char:inform("Du hörst eine krächzende Stimme ängstlich schreien: \"Nein! Nicht schon wieder du. Geh weg und lass mich in Ruhe!\" Danach kehrt Stille ein.","You hear a croaking voice crying scared: \"No! Not you again. Leave me alone!\" Afterwards there is silence.")
            char:setQuestProgress(612,3)
            return
        end
    elseif char:getQuestProgress(612) == 2 then -- riddle has been solved yet; the voice one more time without warp
        world:makeSound(1,char.pos);
        char:inform("Du hörst eine krächzende Stimme ängstlich schreien: \"Nein! Nicht schon wieder du. Geh weg und lass mich in Ruhe!\" Danach kehrt Stille ein.","You hear a croaking voice crying scared: \"No! Not you again. Leave me alone!\" Afterwards there is silence.")
        char:setQuestProgress(612,3)
        return
    end

    -- main quest
    if char:getQuestProgress(612) < 2 then -- riddle hasn't been solved yet
            char:setQuestProgress(612,1)
        --884,594,0 correct choice #6
        if char.pos == position(884,594,0) or char.pos == position(884,593,0) or char.pos == position(884,595,0) then
            world:gfx(37,char.pos);
            char:warp(position(905, 574, 0))
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:inform("Du vernimmst noch ein langezogenes 'Nein'. Danach kehrt Stille ein. Du bist wieder frei.", "You hear a dying 'No'. Afterwards there is silence. You are free again.")
            char:setQuestProgress(612,2)
            return

        --886,584,0 correct choice #5
        elseif char.pos == position(886,584,0) or char.pos == position(886,583,0) or char.pos == position(886,585,0) then
            world:gfx(37,char.pos);
            char:warp(position(885,594,0))
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:inform("Die krächzende Stimme brüllt: \"Verdammt! Nun gut, du darfst über die Brücke gehen.\" Worauf die eine Stimme aus dem Norden ruft: \"Nicht zur Brücke. In der Pinie! In der Pinie!\"", "The jagged voice bellows: \"Blimey! Well, you are allowed to pass the bridge.\". A voice from the north shouts: \"Don't go to the bridge. Into the pine tree! Into the pine tree!\"")
            return

        --890,560,0 correct choice #4
        elseif char.pos == position(890,560,0) or char.pos == position(889,560,0) or char.pos == position(891,560,0) then
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:warp(position(885,584,0))
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:inform("Die krächzende Stimme bellt: \"Narr!\" Worauf eine Stimme aus dem Osten ruft: \"Zum Meer! Zu Mir!\"", "The jagged voice barks: \"Fool!\". A voice from the east shouts: \"To the sea! Come to me!\"")
            return

        --885,573,0 correct choice #3
        elseif char.pos == position(885,573,0) or char.pos == position(884,573,0) or char.pos == position(886,573,0) then
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:warp(position(890,559,0))
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:inform("Die krächzende Stimme ruft: \"Vergeblich!\" Worauf eine Stimme aus dem Süden flüstert: \"Zu mir!\"", "The jagged voice says: \"Futile!\". A voice from the south whispers: \"To me!\"")
            return

        --906,573,0 correct choice #2
        elseif char.pos == position(906,573,0) or char.pos == position(905,573,0) or char.pos == position(906,574,0) then
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:warp(position(885,574,0))
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:inform("Die krächzende Stimme schreit: \"Gib auf! Du bist mein!\" Worauf eine Stimme aus dem Norden antwortet: \"Komm zu mir!\"", "The scratchy voice shouts: \"Surrender! You are mine!\". A voice from the north answers: \"Come to me!\"")
            return

        --901,581,0 correct choice #1
        elseif char.pos == position(901,581,0) or char.pos == position(900,581,0) or char.pos == position(901,580,0) then
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:warp(position(905,574,0))
            world:gfx(37,char.pos);
            world:makeSound(13,char.pos);
            char:inform("Die krächzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf eine Stimme aus dem Südwesten sagt: \"Lauf weg!\"", "The jagged voice says: \"No Chance!\". A voice from the southwest replies: \"Run away!\"")
            return

        --start
        elseif char.pos == position(890,596,0) or char.pos == position(876,590,0) or char.pos == position(878,562,0) then
            char:warp(position(900,580,0))
            world:makeSound(25,char.pos);
            char:inform("Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du gehörst nun mir!\" Nach einer Weile hörst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"","You hear laughter and a croaking voice, saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Get away from me!\"")
            return

        --wrong turn
        else
            world:makeSound(25,char.pos);
            char:warp(position(900,580,0))
            world:gfx(13,char.pos);
            world:makeSound(25,char.pos);
            char:inform("Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du entkommst mir nicht!\" Eine andere Stimme ruft dir erneut aus dem Nordwesten zu: \"Gib nicht auf! Du kannst es schaffen, aber geh weg von mir.\"","You hear laughter and a croaking voice, saying: \"HAHA! You cannot escape!\"Another voice replies again from the northwest: \"Do not give in! You can make it but get away from me.\"")

            if (char:increaseAttrib("hitpoints",0)>2000) then --punishment for wrong turn
                char:increaseAttrib("hitpoints", -math.random(100, 500))
                world:makeSound(3,char.pos);
            end
        end

    else
        return
    end

end

return M
