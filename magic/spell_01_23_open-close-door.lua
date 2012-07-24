-- TÜREN AUF UND ZU KLAPPEN
-- RUNEN 1 & 23 KEL ANTH
--INSERT INTO spells VALUES (2^0+2^22,0,'m_01_23.lua');
--SPEZIALZAUBER
--ITEMZAUBER

require("base.doors")
require("base.common")
module("magic.spell_01_23_open-close-door", package.seeall)

function OpenCloseTarget(Caster,Item)
    if not base.common.IsLookingAt(Caster,Item.pos) then
		base.common.TurnTo(Caster, Item.pos);
	end
    local Mana=Caster:increaseAttrib("mana",0);
    if (Mana>=100) then
        local Language=Caster.activeLanguage;
        Caster.activeLanguage=10;
        Caster:talk(Character.say,"KEL ANTH");
        Caster.activeLanguage=Language;
        if base.doors.CloseDoor(Item) then
            Succeed(Caster)
            base.common.InformNLS(Caster,"Von dem Windstoß getroffen klappt die Tür zu.","A mysterious breeze pushes the door close.");
        else
            local OpenDoor,OpenOK=base.doors.OpenDoor(Item);
            if OpenOK then
                Succeed(Caster)
                base.common.InformNLS(Caster,"Vom Wind geführt schwingt die Tür auf.","A mysterious breeze pushes the door open.");
            elseif OpenDoor then
                Succeed(Caster)
                base.common.InformNLS(Caster,"Der Wind rüttelt an der Tür, doch sie öffnet sich nicht.","The wind tries to open the door, but the door doesn't open.");
            else
                base.common.InformNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
            end
        end
    else
        base.common.InformNLS(Caster,"Nicht genug Mana.","Not enough mana.");
    end
end

function Succeed(Caster)
    if (LuaAnd(Caster:getQuestProgress(24),1) == 0 ) then
        --Caster:learn(3,"transformo",1,20);
		--Replace with new learn function, see learn.lua 
    end
    Caster:increaseAttrib("mana",-100);
    world:makeSound(13,Caster.pos);
end

function CastMagic(Caster,counter,param)
    base.common.InformNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param)
    base.common.InformNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
end

function CastMagicOnField(Caster,Targetpos,counter,param)
    informNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
end

function CastMagicOnItem(Caster,TargetItem,counter,param, ltstate)
    if ( ltstate == nil or ltstate == Action.success ) then
        OpenCloseTarget(Caster,TargetItem)
    elseif ( ltstate == Action.none ) then
        Caster:startAction( 15, 21, 10, 0, 0);
        Caster:talkLanguage( Character.say, Player.german, "#me beginnt mit einer mystischen Formel.");
        Caster:talkLanguage( Character.say, Player.english, "#me starts with a mystical formula.");
    elseif ( ltstate == Action.abort ) then
        Caster:talkLanguage(Character.say, Player.german, "#me stoppt apprupt mit dem Zaubern.");
        Caster:talkLanguage(Character.say, Player.english,"me stopps appruptly with the casting.");
    end
end
