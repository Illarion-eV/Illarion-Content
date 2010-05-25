--Function:    Trap set
--Last Update: 01/04/2006
--Update by:   Nitram

--UPDATE common SET com_script='I_374_fallenbausatz.lua' WHERE com_itemid=374;

require("base.common")

function UseItemWithField(User,SourceItem,TargetPos,Counter,Param)
    local Agi=User:increaseAttrib("agility",0);
    local Dex=User:increaseAttrib("dexterity",0);
    local Skl=User:getSkill("traps");
    TrapSkill = math.floor((((2*Dex)+Agi+Skl)*(math.random(8,12)/10))/145*50);
    --User:inform("Skill gesetzt mit "..TrapSkill);
    GText="Du stellst die Falle mit einem teuflischen Grinsen auf.";
    EText="You set the trap with an evil grin.";
    if (TrapSkill > 0 and TrapSkill <= 10) then
        Trap=375;
        GText="Du bist zu ungeschickt, um diese Falle zu stellen.";
        EText="You are too clumsy to set this trap.";
    end
    if (TrapSkill > 10 and TrapSkill <= 20) then
        Trap=377;
    end
    if (TrapSkill > 20 and TrapSkill <= 30) then
        Trap=378;
    end
    if (TrapSkill > 30 and TrapSkill <= 40) then
        Trap=379;
    end
    if (TrapSkill > 40 and TrapSkill <= 50) then
        Trap=380;
    end
    if (TrapSkill > 50 ) then
        Trap=381;
    end
    --User:inform("Falle ausgewählt Item ID: "..Trap);
    if not equapos(TargetPos,User.pos) then
        world:createItemFromId(Trap,1,TargetPos,true,333,0);
        world:erase(SourceItem,1);
        base.common.InformNLS( User,GText,EText );
    end

end