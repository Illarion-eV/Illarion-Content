-- LTE für das Druidensystem
-- by Falk
require("base.common")

module("druid.lte.id_59_attribs", package.seeall)

-- INSERT INTO longtimeeffects VALUES (59, 'druids_attribs', 'druid.lte.id_59_attribs');

attribList ={"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
topBorder = 30;
bottomBorder = 2;

function addEffect(Effect, Character)               -- Nur beim ersten Aufruf
    return true;
end

function callEffect(Effect,Character)               -- Effect wird ausgefï¿½hrt
    find, cntEffects = Effect:findValue("effects");
    if not find or cntEffects == 0 then
        return false;
    end

    local foundanything = false;
    local MessageSend = false;
    for i=1,cntEffects do
        find,zaehler = Effect:findValue("zaehler_"..i);
        if find then
            if zaehler == Effect.numberCalled then
                for index, attrib in pairs(attribList) do
                    find, attribValue = Effect:findValue(attrib.."_"..i);
                    if find and attribValue ~= 5 then
                        attribValue = attribValue - 5;
                        Character:increaseAttrib(attrib,-attribValue);
                    end
                    if find then
                        Effect:removeValue(attrib.."_"..i);
                    end
                end
                Effect:removeValue("zaehler_"..i);
                if not MessageSend then
                    MessageSend = true;
                    base.common.InformNLS( Character, "Du fühlst, dass der Trank seine Wirkung verliert.", "You feel that the potion looses its effect.");
                end
            else
                Effect:addValue("zaehler_"..i,zaehler);
                foundanything = true;
            end
        end
    end
    if foundanything then
        Effect.nextCalled = 1000;
        return true;
    else
        return false;
    end
end

function removeEffect(Effect,Character)
    find, cntEffects = Effect:findValue("effects");
    if not find or cntEffects == 0 then
        return false;
    end

    for i=1,cntEffects do
        find,zaehler = Effect:findValue("zaehler_"..i);
        if find then
            for index, attrib in pairs(attribList) do
                find, attribValue = Effect:findValue(attrib.."_"..i);
                if find and attribValue ~= 5 then
                    attribValue = attribValue - 5;
                    Character:increaseAttrib(attrib,-attribValue);
                end
                Effect:removeValue(attrib.."_"..i);
            end
            Effect:removeValue("zaehler_"..i);
            if not MessageSend then
                MessageSend = true;
                base.common.InformNLS( Character, "Du fühlst, dass der Trank seine Wirkung verliert.", "You feel that the potion looses its effect.");
            end
        end
    end
    return true;
end

function loadEffect(Effect,Character)
    find, cntEffects = Effect:findValue("effects");
    if not find or cntEffects == 0 then
        return false;
    end

    for i=1,cntEffects do
        find,zaehler = Effect:findValue("zaehler_"..i);
        if find then
            for index, attrib in pairs(attribList) do
                find, attribValue = Effect:findValue(attrib.."_"..i);
                if find and attribValue ~= 5 then
                    oldvalue = Character:increaseAttrib(attrib,0);
                    attribValue = attribValue - 5;

                    if (oldvalue + attribValue) > topBorder then
                        attribValue = topBorder - oldvalue + 5;
                        Effect:addValue(attrib.."_"..i,attribValue);
                    elseif (oldvalue + attribValue) < bottomBorder then
                        attribValue = bottomBorder - oldvalue + 5;
                        Effect:addValue(attrib.."_"..i,attribValue);
                    end
                    Character:increaseAttrib(attrib,attribValue);
                end
            end
        end
    end
    return true;
end