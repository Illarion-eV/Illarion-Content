dofile( "base_fighting.lua" );

function InitAttacker(Char,AttackPos)
    AttItem = Char:getItemAt(AttackPos);            -- read weapons
    AttFound,AttWeapon = world:getWeaponStruct(AttItem.id);
    AttHPMod=HPMod(Char:increaseAttrib("hitpoints",0));           -- read important skills, attributes
    AttStrength=Char:increaseAttrib("strength",0);
    AttDexterity=Char:increaseAttrib("dexterity",0);
    AttAgility=Char:increaseAttrib("agility",0);
    AttPerception=Char:increaseAttrib("perception",0);
    AttIntelligence=Char:increaseAttrib("intelligence",0);
    AttTSkill=Char:getSkill("tactics");
    AttTSkill=AttTSkill*(2.6*AttIntelligence+43.6)/100;
    AttSkill=Char:getSkill("slashing weapons");
    AttPoison=Char:getSkill("poisoning");
    AttNatPoi=Char:getSkill("poisonstrength");
end

function InitDefender(Char)
    DefRightItem = Char:getItemAt(CCharacter.right_tool);            -- read weapons
    DefLeftItem = Char:getItemAt(CCharacter.left_tool);
    DefrFound,DefRightWeapon = world:getWeaponStruct(DefRightItem.id);
    DeflFound,DefLeftWeapon = world:getWeaponStruct(DefLeftItem.id);
    DefHPMod=HPMod(Char:increaseAttrib("hitpoints",0));
    DefStrength=Char:increaseAttrib("strength",0);
    DefDexterity=Char:increaseAttrib("dexterity",0);
    DefAgility=Char:increaseAttrib("agility",0);
    DefPerception=Char:increaseAttrib("perception",0);
    DefIntelligence=Char:increaseAttrib("intelligence",0);
    DefTSkill=Char:getSkill("tactics");
    DefTSkill=DefTSkill*(2.6*DefIntelligence+43.6)/100;
    DefDSkill=Char:getSkill("dodge");
    DefParry=Char:getSkill("parry");
end

function AttackTry()
    local Skill=0;
    local SkillName=0;
    local Attrib=0;
    SkillName="slashing weapons";
    Skill=AttSkill;
    Attrib=math.floor(AttStrength+AttDexterity/2+(AttAgility*2)+(AttPerception/3));
    local AttackTryAmount=((Skill*2)+Attrib*2.3)*(Scale(40,105,AttTSkill)/100);
    return math.floor(AttackTryAmount*(math.random(4,20)/15)*2),SkillName
end

function HitTry(Attacker,Weapon)
    local Skill=0;
    local Attrib=0;
    local AttackStr=Weapon.Attack*31;
    --local AttackStr={((attWeapon.Attack)*(-0.01*attWeapon.Attack+1.1))/3,((secWeapon.Attack)*(-0.01*secWeapon.Attack+1.1))/3}
    local HitTryAmount=0;
    Skill=AttSkill;
    Attrib=AttStrength;
    local AttQual=math.floor(AttItem.quality/100);
    --Attacker:talk(CCharacter.say,"#me AttStr (before): "..AttackStr[1]);
    AttackStr=Scale(50,160,AttQual*10)*AttackStr/100;
    --Attacker:talk(CCharacter.say,"#me AttStr: "..AttackStr[1]);
    HitTryAmount=(AttackStr*Scale(30,110,Attrib*5)*Scale(40,130,Skill)*Scale(95,105,AttTSkill))/1000000;
    --Attacker:talk(CCharacter.say,"HitTryAmt "..HitTryAmount);
    return math.floor(HitTryAmount*(math.random(7,13)/13));
end

function onAttack(Attacker,Defender,AttackPos)
    if (firstrun~=true) then
        InitShapes()
        firstrun=true
    end
    AttStiffMod=GenStiffnessMod(Attacker);
    DefStiffMod=GenStiffnessMod(Defender);
    InitAttacker(Attacker,AttackPos);
    InitDefender(Defender);
    MonsterSpecial(Attacker,Defender)
    if (AttackPos==CCharacter.right_tool) then
        SecWeaponAttMod,SecWeaponAPMod=SecWeaponMod(Attacker:getItemAt(CCharacter.left_tool))
    else
        SecWeaponAttMod,SecWeaponAPMod=SecWeaponMod(Attacker:getItemAt(CCharacter.right_tool))
    end
    local AttackMod= SelAttackMod(Attacker,Defender,AttShape,DefShape)
    local DefendMod=1;
    if (AttackMod>=120) then
        BackHitTry=math.random(1,2)
        if (BackHitTry==1) then
            DefendMod=0
        end
    end
    RangeFine,AttMovePoints=CheckRange(Attacker,Defender,AttWeapon)
    if RangeFine then
        Attacker.movepoints=math.floor(AttMovePoints*(SecWeaponAPMod/100)*(AttStiffMod/100));
        AngriffsWurfUnMod,SkillList=AttackTry()
        AngriffsWurf=math.floor(AngriffsWurfUnMod*(AttackMod/100)*(AttHPMod/100)*(CalcDistanceMod(Attacker,Defender)/100)*(AttStiffMod/100));
        ParadeWurfUnMod=ParryTry(Defender,DefRightWeapon,DefLeftWeapon);
        ParadeWurf=math.floor(ParadeWurfUnMod*(DefHPMod/100)*DefendMod*(DefStiffMod/100))
        local DoDodge=false
        if (DefendMod==0) then
            RandomDodge=math.random(1,20)
            if (RandomDodge==1) then
                DoDodge=true;
            end
        else
            RandomDodge=math.random(1,15)
            if (RandomDodge==1) then
                DoDodge=true;
            end 
        end
        if DoDodge then
            AusweichWurf=DodgeTry(Attacker,Defender,AttHPMod,DefHPMod)
        else
            AusweichWurf=false
        end
        world:gfx(17,Attacker.pos)
--        if AusweichWurf then
--            gText="Ausgewichen";
--            eText="dodge";
--        elseif (AngriffsWurf>ParadeWurf) then
--            gText="Treffer";
--            eText="hit";
--        else
--            gText="Parade";
--            eText="parry";
--        end
--        gText=Attacker.name.." greift "..Defender.name.." an. *"..gText.."* ("..AngriffsWurf.."-"..ParadeWurf..")";
--        eText=Attacker.name.." attacks "..Defender.name..". *"..eText.."* ("..AngriffsWurf.."-"..ParadeWurf..")";
--        Informing(Attacker,gText,eText);
--        Informing(Defender,gText,eText);
        world:makeSound(3,Defender.pos);
        local tacticsTry=math.random(1,10)
        if (AttackMod>=120) then
            if (DefendMod==0) then
                Attacker:learn(5,"tactics",1,100);
            else
                Defender:learn(5,"tactics",1,100);
            end
        else
            if (DefrFound and DeflFound) then
                Defender:learn(5,"tactics",1,100);
            end
            if (SecWeaponAttMod<100) then
                Attacker:learn(5,"tactics",1,100);
            end
        end 
        if not AusweichWurf then
            BreakAttWeapon(Attacker,AttItem,AngriffsWurfUnMod,ParadeWurfUnMod)
            BreakDefWeapon(Defender,DefRightItem,AngriffsWurfUnMod,ParadeWurfUnMod)
            BreakDefWeapon(Defender,DefLeftItem,AngriffsWurfUnMod,ParadeWurfUnMod)
            if (AngriffsWurf>ParadeWurf) then
                SchadensWurf=math.floor(HitTry(Attacker,AttWeapon)*(AttackMod/100)*(AttHPMod/100)*(SecWeaponAttMod/100)*(AttStiffMod/100));
                -- hier modifizieren

                AbwehrWurfPer,AbwehrWurfHP,AreaNames,ArmorPart,ArmorTypList=DefenceTry(Defender)
                AbwehrWurfPer=math.floor(AbwehrWurfPer*(DefHPMod/100)*(DefStiffMod/100));
                AbwehrWurfHP=math.floor(AbwehrWurfHP*(DefHPMod/100)*(DefStiffMod/100));
                -- hier modifizieren
                WindWurf=WindTry(Attacker);
                if (WindWurf>0) then
                    HittingType=math.random(1,2)
                    if (HittingType==1) then
                        world:gfx(2,Defender.pos)
                    elseif (HittingType==2) then
                        world:gfx(7,Defender.pos)
                        XMove=math.random(0,6)
                        YMove=math.random(0,6)
                        Defender:warp(position(Defender.pos.x+(XMove-3),Defender.pos.x+(YMove-3),Defender.pos.z));
                        Defender.movepoints=Defender.movepoints-20;
                        WindWurf=100;
                    end
                end
                local DefConsti=Defender:increaseAttrib("constitution",0);
                GiftWurf=math.floor(PoisonEffect(Attacker)*(AttackMod/100)*(AttHPMod/100));
                --DmgTaken=math.floor(math.sqrt(SchadensWurf-AbwehrWurf)*550/(DefConsti+1));
                DmgTaken=math.floor(SchadensWurf*(100-AbwehrWurfPer)/100)-AbwehrWurfHP+WindWurf;
--                if (GiftWurf>0 and DmgTaken>0) then
--                    gGiftText="Zusätzlicher Giftschaden: "..GiftWurf.." ";
--                    eGiftText="Additional Poisondamage: "..GiftWurf.." ";
--                else
--                    gGiftText="";
--                    eGiftText="";
--                end 
--                gText=Attacker.name.." trifft "..Defender.name.." in Trefferzone \""..AreaNames[1].."\" mit "..SchadensWurf.." HP. "..Defender.name.." absorbiert "..AbwehrWurfPer.." % und "..AbwehrWurfHP.." HPs. Verursachter Schaden: "..math.max(0,DmgTaken).."HP. Davon Windschaden: "..WindWurf.." "..gGiftText;
--                eText=Attacker.name.." hits "..Defender.name.." in Hitarea \""..AreaNames[2].."\" with "..SchadensWurf.." HP. "..Defender.name.." absorbs "..AbwehrWurfPer.."% and "..AbwehrWurfHP.." HP. Produced damage: "..math.max(0,DmgTaken).."HP. Therefrom Winddamage: "..WindWurf.." "..eGiftText;
--                Informing(Attacker,gText,eText);
--                Informing(Defender,gText,eText);
                world:gfx(13,Defender.pos);
                --if (SchadensWurf>AbwehrWurf) then
                Defender:increaseAttrib("hitpoints",-math.max(0,DmgTaken));
                Defender:learn(5,"parry",1,AttSkill);
                Attacker:learn(5,SkillList,2,DefParry);
                BreakArmor(Defender,ArmorPart,AngriffsWurfUnMod,ParadeWurfUnMod,SchadensWurf,ArmorTypList)
                --end
            else
                world:gfx(18,Defender.pos);
                Defender:learn(5,"parry",2,AttSkill);
            end
            Defender:learn(5,"dodge",1,100);
        else
            Attacker:learn(5,"dodge",2,100);
        end
    end
end

function ArmorValue(Char,Item)
    local ArmorPer=0;
    local AbsorbHP=0;
    if (Item~=nil or Item.id~=0) then
        found,Armor=world:getArmorStruct(Item.id);
        if found then
            Qual=math.floor(Item.quality/100)
            QualMod=Scale(60,130,Qual*10)/100;
            ArmorPer=math.max(1,math.floor(Armor.StrokeArmor*(QualMod)));
            AbsorbHP=math.max(1,math.floor(Armor.Absorb*(QualMod)));
        end
    end
    found,NatArmor=world:getNaturalArmor(Char:get_race())
    if found then
        ArmorPer=ArmorPer+NatArmor.strokeArmor;
    end
    local ArmorTyp=3; -- 1=Puncture - 2=Thrust - 3=Stroke
    return ArmorPer,AbsorbHP,ArmorTyp
end

function DefenceTry(Defender)
    if (firstdefend==nil) then
        LoadHitArea()
        firstdefend=true
    end
    --Defender:talk(CCharacter.say,"los");
    local TotalPoss=0;
    local TryPoss={};
    HittedArea=HitAreas[2];
    --Defender:talk(CCharacter.say,"Grundwerte");
    for i=1,table.getn(AreaPoss) do
        TryPoss[i]=AreaPoss[i]+TotalPoss;
        TotalPoss=TotalPoss+AreaPoss[i];
    end
    --Defender:talk(CCharacter.say,"TotalPoss: "..TotalPoss);
    TryPoss[0]=0;
    PossTry=math.random(1,TotalPoss)
    --Defender:talk(CCharacter.say,"PossTry: "..PossTry);
    i=0;
    local found=false;
    repeat
        --Defender:talk(CCharacter.say,"repeat loop: "..i);
        i=i+1;
        if (PossTry>TryPoss[i-1] and PossTry<=TryPoss[i]) then
            --Defender:inform("found Item: "..i);
            HittedArea=HitAreas[i];
            found=true;
        end
    until (found==true or i>table.getn(HitAreas))
    local AbsorbMod=0;
    if (DefRightWeapon.WeaponType==14) then
        AbsorbMod=AbsorbMod+DefRightWeapon.Defence;
    end
    if (DefLeftWeapon.WeaponType==14) then
        AbsorbMod=AbsorbMod+DefLeftWeapon.Defence;
    end
    AbsorbMod=AbsorbMod+100;
    --Defender:talk(CCharacter.say,"repeat done");
    BItem=Defender:getItemAt(HittedArea);
    ArmorPtn,AbsorbHP,BreakVal=ArmorValue(Defender,BItem)
    --Defender:talk(CCharacter.say,"ich habe "..ArmorPtn.." Ruestung.");
    -- local Attribs=(DefConstitution*3)+(DefPerception/2)+DefAgility+(DefDexterity/2);
    --Defender:talk(CCharacter.say,"AbsorbMod: "..AbsorbMod);
    return ArmorPtn,math.floor(AbsorbHP*(AbsorbMod/100)),AreaName[i],BItem,BreakVal; -- % absorbed, HP absorb
    --return ((ArmorPtn*math.random(8,12))*6)/10; -- math.floor((ParryEff*2)+ArmorPtn)*(6/10)*(Attribs/100); -- Parry (0-1200) ArmPtn (220) Attr (80) ArmorPtn*
end

function WindTry(Attacker)
    local WindHit=0;
    local RndWind=math.random(1,6)
    if (RndWind==1) then
        WindHit=Scale(20,500,AttSkill);
        WindHit=WindHit*(math.random(80,120)/100)
    end
    return WindHit
end