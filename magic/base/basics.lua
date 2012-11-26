require("base.common")
require("content.lookat.unique");
module("magic.base.basics", package.seeall)

function initRaceBoni()
    -- Default Values for racial boni related magic
    -- First value is the boni on offensive magic
    -- Second value is the boni on defending magic
    RaceBonis = {};
    RaceBonis[ 0] = { 1.00, 1.00 }; --human
    RaceBonis[ 1] = { 0.70, 1.20 }; --dwarf
    RaceBonis[ 2] = { 0.75, 1.00 }; --halfling
    RaceBonis[ 3] = { 1.25, 0.90 }; --elf
    RaceBonis[ 4] = { 0.60, 1.20 }; --orc
    RaceBonis[ 5] = { 0.65, 1.00 }; --lizardman
    RaceBonis[ 6] = { 1.10, 0.80 }; --gnome
    RaceBonis[ 7] = { 1.45, 1.10 }; --fairy
    RaceBonis[ 8] = { 1.15, 1.20 }; --goblin
    RaceBonis[ 9] = { 0.20, 1.50 }; --troll
    RaceBonis[10] = { 1.00, 0.40 }; --mumie
    RaceBonis[11] = { 1.05, 1.10 }; --skeleton
    RaceBonis[12] = { 1.15, 1.90 }; --beholder
    RaceBonis[13] = { 1.00, 1.00 }; --cloud
    RaceBonis[14] = { 1.00, 1.00 }; --healer
    RaceBonis[15] =  RaceBonis[ 0]; --buyer
    RaceBonis[16] =  RaceBonis[ 5]; --seller
    RaceBonis[17] = { 0.20, 0.40 }; --insects
    RaceBonis[18] = { 0.20, 0.30 }; --sheep
    RaceBonis[19] = { 0.20, 0.80 }; --spider
    RaceBonis[20] = { 1.50, 1.90 }; --demonskeleton
    RaceBonis[21] = { 0.20, 1.40 }; --rotworm
    RaceBonis[22] = { 2.00, 2.30 }; --bigdemon
    RaceBonis[23] = { 0.20, 0.50 }; --scorpion
    RaceBonis[24] = { 0.20, 0.50 }; --pig
    RaceBonis[25] = { 1.00, 1.00 }; --invisible
    RaceBonis[26] = { 1.20, 1.30 }; --skull
    RaceBonis[27] = { 0.20, 0.50 }; --wasp
    RaceBonis[28] = { 0.50, 1.30 }; --foresttroll
    RaceBonis[29] = { 1.80, 1.90 }; --shadowskeleton
    RaceBonis[30] = { 0.20, 10.0 }; --stonegolem
    RaceBonis[31] =  RaceBonis[ 8]; --mgoblin
    RaceBonis[32] = { 0.30, 1.20 }; --gnoll
    RaceBonis[33] = { 0.85, 2.00 }; --dragon
    RaceBonis[34] = { 0.60, 1.50 }; --mdrow
    RaceBonis[35] = { 0.60, 1.50 }; --fdrow
    RaceBonis[36] = { 1.80, 2.10 }; --lesserdemon
    RaceBonis[37] = { 1.80, 0.30 }; --Cow
    RaceBonis[38] = { 1.80, 0.60 }; --Deer
    RaceBonis[39] = { 1.80, 1.00 }; --Wolf
    RaceBonis[40] = { 1.80, 1.00 }; --Panther
    RaceBonis[41] = { 1.80, 0.20 }; --Rabbit
    RaceBonis[42] =  RaceBonis[ 8]; --fgoblin
    RaceBonis[43] =  RaceBonis[ 7]; --mfairy
    RaceBonis[44] =  RaceBonis[ 6]; --mgnome
    RaceBonis[45] =  RaceBonis[ 6]; --fgnome
    RaceBonis[46] = { 1.80, 7.00 }; --Fallen
    RaceBonis[50] = { 1.80, 0.30 }; --Pack mule
    RaceBonis[53] = { 1.80, 5.00 }; --Icedragon
end
initRaceBoni();
content.lookat.unique.itemList();

function SetRaceBoni( Race, offValue, defValue)
    RaceBonis[Race]={offValue, defValue};
end

function GetOffensiveRaceBoni( Race )
    if not RaceBonis[Race] then
        return 1;
    end
    if not RaceBonis[Race][1] then
        return 1;
    end
    return RaceBonis[Race][1];
end

function GetDefensiveRaceBoni( Race )
    if not RaceBonis[Race] then
        return 1;
    end
    if not RaceBonis[Race][2] then
        return 1;
    end
    return RaceBonis[Race][2];
end

function MagicResistence( Char )
    local CWil   = Char:increaseAttrib("willpower",0);
    local CEss   = Char:increaseAttrib("essence",0);
    local CSkill = Char:getSkill(Character.magicResistance) * GetDefensiveRaceBoni( Char:getRace() );
    CSkill = base.common.Limit( CSkill, 0, MaximalMagicResistance( Char ) );

    local ResTry=base.common.Limit(CSkill * ( ( CEss*3 + CWil*2 ) / 63 ), 0, 100 );

    return base.common.Limit( math.floor( ResTry * math.random(8,12)/10 ), 0, 100 );
end

function CasterValue( Char )
    local CInt   = Char:increaseAttrib("intelligence",0);
    local CWil   = Char:increaseAttrib("willpower",0);
    local CEss   = Char:increaseAttrib("essence",0);

    if ( CInt < 9 ) or ( CWil < 9 ) or ( CEss < 9 ) then
        return false;
    end

    local CSkill = Char:getSkill( Skill.name );
    CSkill = CSkill * GetOffensiveRaceBoni( Char:getRace() ) + GemBonis.Skill;

    local Boni=100+(AddBonus(Char,HelpList,HelpLBon)/2);
    Boni = Boni / 100;

    local CasterTry = CSkill * ( ( CEss + CWil/2 + CInt*2 ) / 63 );
    CasterTry = CasterTry * Boni + math.random(-20,20);

    CasterTry = base.common.Limit( 100 * (CasterTry - Skill.min) / ( Skill.max - Skill.min ), 0, 100 );
    return CasterTry;
end

function SayRunes( Char )
    local Language=Char.activeLanguage;
    Char.activeLanguage=10;
    Char:talk(Character.whisper,Settings.Runes);
    Char.activeLanguage=Language;
end

function CheckAndReduceRequirements( Char, CasterValue )
    if not CasterValue then
        CasterValue = 0;
    end

    local HPChange=math.floor( base.common.Scale(    CasterEffects.minSkill.hitpoints,    CasterEffects.maxSkill.hitpoints, CasterValue) );
    local FPChange=math.floor( base.common.Scale(   CasterEffects.minSkill.foodpoints,   CasterEffects.maxSkill.foodpoints, CasterValue) );
    local APChange=math.floor( base.common.Scale( CasterEffects.minSkill.actionpoints, CasterEffects.maxSkill.actionpoints, CasterValue) );
    local MPChange=math.floor( base.common.Scale(   CasterEffects.minSkill.manapoints,   CasterEffects.maxSkill.manapoints, CasterValue) );
    local PPChange=math.floor( base.common.Scale(       CasterEffects.minSkill.poison,       CasterEffects.maxSkill.poison, CasterValue) );

    if ( Char:increaseAttrib("hitpoints",0) < -HPChange ) then
        base.common.InformNLS( Char,
        "Diesen Spruch zu sprechen würde dich auf jeden Fall töten. Dein Überlebenstrieb wehrt sich dagegen.",
        "This spell would kill you in any way. You will to life holds against this." );
        return false;
    end

    if ( Char:increaseAttrib("foodlevel",0) < -FPChange ) then
        base.common.InformNLS( Char,
        "Dein Hunger ist zu groß als das du dich genug konzentrieren könntest um diesen Zauber zu sprechen.",
        "Your hunger is to big to concentrate enougth to cast this spell." );
        return false;
    end

    local additional_mana = 0;
    if (MPChange < 0) then
        local found_reg, reg_effect = Char.effects:find( 2 );
        if found_reg then
            local findMana, rapidGainMana = reg_effect:findValue( "rapidMana" );
            local findTime, rapidGainTime = reg_effect:findValue( "rapidManaTime" );

            if findMana and findTime then
                rapidGainTime = base.common.GetCurrentTimestamp() - rapidGainTime;
                additional_mana = base.common.Limit( rapidGainMana - 400*rapidGainTime, 0 );
            end
        end
    end

    if ( Char:increaseAttrib("mana",0) < -(MPChange-additional_mana) ) then
        base.common.InformNLS( Char,
        "Du hast nicht genug Mana um diesen Zauber zu wirken.",
        "You lack of mana to cast this spell." );
        return false;
    end

    if (HPChange~=0) then Char:increaseAttrib( "hitpoints", HPChange ); end;
    if (FPChange~=0) then
        while( FPChange ~= 0 ) do
            Char:increaseAttrib( "foodlevel", base.common.Limit(FPChange,-10000,10000) );
            FPChange = FPChange - base.common.Limit(FPChange,-10000,10000);
        end
    end;

    if (MPChange < 0) then
        local RapidRegainMana = math.floor( -MPChange * base.common.Scale( 4, 18, CasterValue ) / 10 );
        if( RapidRegainMana < 1000 ) then
            RapidRegainMana = 1000;
        end

        local found_reg, reg_effect = Char.effects:find( 2 );
        if found_reg then
            reg_effect:addValue( "rapidMana", RapidRegainMana );
            reg_effect:addValue( "rapidManaTime", base.common.GetCurrentTimestamp() );
        end
    end

    if (MPChange~=0) then Char:increaseAttrib( "mana", (MPChange-additional_mana) ); end;

    if (PPChange~=0) then Char:setPoisonValue( base.common.Limit( (Char:getPoisonValue() + PPChange) , 0, 10000) );end;
    --if (PPChange~=0) then Char:increasePoisonValue(PPChange); end;

    if (APChange~=0) then Char.movepoints=Char.movepoints+APChange; end;

    local AttribEffect = math.floor(base.common.Scale(CasterEffects.minSkill.posoffset, CasterEffects.maxSkill.posoffset, CasterValue));
    if (AttribEffect~=0) then
        local phi = math.random()*2;
        local NewPos = position( math.floor(Char.pos.x+AttribEffect*math.sin( phi * math.pi )), math.floor(Char.pos.y+AttribEffect*math.cos( phi * math.pi )), Char.pos.z );
        Char:warp( NewPos );
    end
    return true;
end

function InitializeHelpList()
    local PraeList={};
    local PraeLBon={};
    HelpList={};
    HelpLBon={};
    -- Daggers
	-- {simple dagger, malachin dagger, dagger, ornate dagger, gilded dagger, silvered dagger, coppered dagger, merinium-plated dagger, poisoned simple dagger,
	-- magical dagger, poisened dagger, dull dagger, dull simple dagger, poisoned ornate dagger, red dagger, red fire dagger, dull red dagger }
    PraeList[1]={27    ,91    ,189   ,190  ,297  ,389  ,398  ,444  ,2668  ,2671  ,2672  ,2673  ,2674  ,2689  ,2740  ,2742  ,2743  };
    PraeLBon[1]={-10   ,-5    ,-10   ,-8   ,-6   ,-6   ,-6   ,6    ,-10   ,0     ,-10   ,-10   ,-10   ,-8    ,-5    ,-4    ,-6    };
    -- Common Swords
	-- {serinjah-sword, sabre, short sword, bastard sword, dull bastardsword, dull broadsword, poisened broadsword, broadsword, rapier, poisoned serinjah-sword,
	-- longsword, poisoned longsword, poisoned longsword, two-handed sword, scimitar, short sword, elvensword, snake sword, dull elvensword }
    PraeList[2]={1     ,25    ,78    ,204   ,2650  ,2652  ,2655  ,2658  ,2675  ,2694  ,2701  ,2705  ,2731  ,2757  ,2776  ,2778  ,2788  ,3036  };
    PraeLBon[2]={-10   ,-30   ,-30   ,-80   ,-80   ,-50   ,-50   ,-50   ,-30   ,-30   ,-40   ,-40   ,-80   ,-40   ,-30   ,-30   ,-30   ,-30   };
    -- Rare Swords
	-- {gilded longsword, coppered longsword, silvered longsword, merinium-plated longsword, fire longsword, magical broadsword,
	-- fire broadsword, magical serinjah-sword, magical longsword, elven rainbowsword, drow blade, drow sword }
    PraeList[3]={84   ,85   ,98   ,123  ,206  ,2654  ,2656  ,2693  ,2704  ,2775  ,2777  ,3035  };
    PraeLBon[3]={-35  ,-35  ,-35  ,-35  ,-20  ,-20   ,-30   ,-10   ,-10   ,-20   ,-20   ,-20   };
    -- Common Axes
	-- {halberd, longaxe, large waraxe, double axe, waraxe, heavy battleaxe, poisened long axe, large fire-waraxe, dwarven axe,
	-- dull dwarven axe, executioners axe, poisened executioner's axe }
    PraeList[4]={77   ,88    ,188   ,205   ,383   ,2629  ,2636  ,2642  ,2660  ,2663  ,2723  ,2725  };
    PraeLBon[4]={-50  ,-50   ,-100  ,-80   ,-100  ,-100  ,-50   ,-60   ,-60   ,-60   ,-60   ,-60   };
    -- Rare Axes
	-- {gilded battleaxe, coppered battleaxe, silvered battleaxe, merinium-plated battleaxe, magical waraxe, fire waraxe,
	-- magical long axe, large fire-waraxe, magical dwarven axe }
    PraeList[5]={124  ,192  ,229  ,296  ,2626  ,2627  ,2635  ,2640  ,2662 };
    PraeLBon[5]={-75  ,-75  ,-75  ,-75  ,-60   ,-70   ,-30   ,-90   ,-40  };
    -- Concussion Weapons
	-- {war hammer, mace, morning star, dull mace, morning star }
    PraeList[6]={226  ,230   ,231   ,2728  ,2737 };
    PraeLBon[6]={-60  ,-40   ,-40   ,-40   ,-40  };
    -- Staffs & Wands
	-- {skull staff, cleric's staff, simple mage's staff, mage's staff, battle staff, ornate mage's staff, elven mage's staff
	-- wand, wand of earth, wand of fire, wand of water, wand of wind }
    PraeList[7]={39    ,40    ,57    ,76    ,207   ,208   ,209   ,323   ,2782  ,2783  ,2784  ,2785  };
    PraeLBon[7]={15    ,15    ,10    ,15    ,15    ,20    ,20    ,50    ,70    ,80    ,80    ,85    };
    -- Distance Weapons
	-- {arrow, crossbow, bolt, throwing spear, throwing star, wind arrows, poison arrow, throwing axe, magical elven bow }
    PraeList[8]={64  ,70   ,237   ,293  ,294   ,322  ,549  ,2645 ,2685  };
    PraeLBon[8]={-1  ,-10  ,-1    ,-5   ,-5    ,-1   ,-1   ,-5   ,10    };
    -- Shields
	-- {light metal shield, metal shield, large metal shield, heraldic shield, steel tower shield, round metal shield, ornate tower shield, cursed shield,
	-- Shield of the Sky, red steel shield, cloud shield, small wooden shield, mosaic shield, legionaire's tower shield }
    PraeList[9]={18    ,19    ,20    ,95    ,96    ,186   ,916   ,917   ,2284  ,2388  ,2439  ,2445  ,2447  ,2448  };
    PraeLBon[9]={-30   ,-35   ,-40   ,-45   ,-50   ,-50   ,-50   ,-100  ,-10   ,-45   ,-70   ,-10   ,-70   ,-50   };
    -- Helmets
	-- {horned helmet, orc helmet, pot helmet, visored helmet, lack visored helmet, steel hat, steel cap, chain helmet, flame helmet, albarian soldier's helmet
	-- round steel hat, salkamaerian paladin's helmet, gynkese mercenarie's helmet, drow helmet, storm cap, serinjah helmet }
    PraeList[10]={7     ,16    ,94    ,184   ,185   ,187   ,202   ,324   ,2286  ,2287  ,2290  ,2291  ,2302  ,2303  ,2441  ,2444  };
    PraeLBon[10]={-30   ,-30   ,-35   ,-40   ,-40   ,-35   ,-35   ,-35   ,-25   ,-35   ,-35   ,-35   ,-35   ,-15   ,-30   ,-35   };
    -- Body Armor I (metal)
	-- {plate armor, chain shirt, shadowplate, light mercenary armor, Lor-Angur guardian's armor, nightplate, steel plate, salkamaerian officer's armor, albarian noble's armor, albarian steel plate,
	-- salkamaerian armor, dwarven state armor, heavy plate armor, dwarvenplate, light elven armor, magical elven armor, drow armor, elven silversteel armor, light blue breastplate
    PraeList[11]={4     ,101   ,2357  ,2359  ,2360  ,2363  ,2364  ,2365  ,2367  ,2369  ,2389  ,2390  ,2393  ,2395  ,2399  ,2400  ,2402  ,2403  ,2407 };
    PraeLBon[11]={-100  ,-60   ,-100   ,-70   ,-30   ,-100  ,-100  ,-100  ,-100  ,-100  ,-100  ,-70   ,-110  ,-110  ,-30   ,-20   ,-20   ,-70   ,-30  };
    -- Leg Armor & Trousers
	-- {leather leg, short leather legs, blue steel greaves, short blue steel greaves, fur trousers, short fur trousers, red steel greaves, short red steel greaves
	-- steel greaves, hardwood greaves, short hardwood greaves }
    PraeList[12]={366  ,367   ,2111  ,2112  ,2113  ,2114  ,2116  ,2117  ,2172  ,2193  ,2194  };
    PraeLBon[12]={-5   ,0     ,-50   ,-25   ,-10   ,-5    ,-50   ,-25   ,-60   ,-10   ,-5    };
    -- Gloves & Boots
	-- {leather gloves, leather boots, steel gloves, steel boots, leather shoes, cloth gloves }
    PraeList[13]={48   ,53  ,325   ,326  ,369  ,2295  };
    PraeLBon[13]={-5   ,-5  ,-50   ,-50  ,0    ,0     };
    -- Amulettes
	-- {emerald amulet, rubin amulet, sapphire amulet, amethyst amulet, obsidian amulet, topas amulet, amulet, charm of the icebird }
    PraeList[14]={62  ,67   ,71   ,79  ,82  ,83   ,222  ,334  };
    PraeLBon[14]={20  ,20   ,30   ,20  ,20  ,30   ,0    ,50   };
    -- Hats
	-- {crown, slouch hat, blue wizard hat, red wizard hat, colourful wizard hat, expensive wizard hat, diadem }
    PraeList[15]={225 ,356  ,357  ,358  ,370  ,371  ,465  };
    PraeLBon[15]={20  ,0    ,10   ,10   ,30   ,30   ,25   };
    -- Capes & Robes
	-- {green robe, blue robe, black robe, yellow robe, grey coat, yellow priest robe, novice mage robe, mage robe, master mage robe, red mage robe
	-- black cult robe, blue coat, black coat, brown priest robe, grey priest robe, red priest robe, black priest robe, white priest robe }
    PraeList[16]={55  ,193  ,194  ,195  ,196  ,368  ,547  ,548  ,558  ,2377  ,2378  ,2380  ,2384  ,2416  ,2418  ,2419  ,2420  ,2421  };
    PraeLBon[16]={5   ,5    ,5    ,5    ,0    ,10   ,20   ,30   ,50   ,10    ,5     ,0     ,0     ,10    ,10    ,10    ,10    ,10    };
    -- Rings
	-- {ruby ring, golden ring, amethyst ring, obsidian ring, sapphire ring, diamond ring, emerald ring, topas ring, ring of the archmage }
    PraeList[17]={68  ,235  ,277  ,278  ,279  ,280  ,281  ,282  ,2559  };
    PraeLBon[17]={20  ,0    ,20   ,20   ,30   ,30   ,20   ,30   ,50    };
    -- Tools I
	-- {scissors, saw, hammer, shovel, needle, hatchet, finesmithing hammer, sickle, flail, scythe, wooden shovel, chisel, tongs, pan, nail board }
    PraeList[18]={6    ,9    ,23   ,24   ,47  ,74  ,122  ,126  ,258  ,271  ,311  ,312  ,737  ,2140 ,2495 ,2659 };
    PraeLBon[18]={-10  ,-10  ,-10  ,-10  ,-5  ,-10 ,-10  ,-10  ,0   ,-15   ,0    ,0    ,-5   ,-10  ,-10  ,-5   };
    -- Tools II
	-- {rasp, crucible, crucible, carpenter hammer, mould, lumberjack axe, slicer, pins, razor blade, crucible, crucible, crucible-pincers, carving tools, pick-axe, hatchet }
    PraeList[19]={2697 ,2699 ,2700 ,2709 ,2710 ,2711 ,2715 ,2738 ,2746 ,2747 ,2748 ,2751 ,2752 ,2763 ,2946  };
    PraeLBon[19]={-10  ,-10  ,-10  ,-10  ,-10  ,-10  ,-5   ,-1   ,-10  ,-10  ,-10  ,-10  ,-10  ,-10  ,-10   };
    -- other Iron items
	-- {iron ore, iron goblet, handcuffs, ore, iron ingot, iron plate }
    PraeList[20]={22  ,223  ,466  ,2534 ,2535 ,2537  };
    PraeLBon[20]={-10 ,-10  ,-999 ,-5   ,-10  ,-10   };

    for i,value in pairs(PraeList) do
        for ii,Nvalue in pairs(PraeList[i]) do
            table.insert(HelpList,PraeList[i][ii]);
            table.insert(HelpLBon,PraeLBon[i][ii]);
        end
    end
end
InitializeHelpList();

function AddBonus(User,ItemList,ItemBoniList)   -- Adds bonus/malus for items together
    --User:inform("AddBonus los");
    local Bonus=0;
    local SearchAt="";
    local SettedPositiv = false;
    --User:inform("Vars OK");
    for i=1,table.getn(ItemList) do
        if (ItemBoniList[i]>0) then
            SearchAt="body";
        else
            SearchAt="all";
        end
        if (User:countItemAt(SearchAt,ItemList[i])>0) then
            if (((ItemBoniList[i]>0) and not SettedPositiv) or (ItemBoniList[i]<0)) then
                Bonus=Bonus+ItemBoniList[i];
            end
        end
        --User:inform("Inventory durchlauf "..i.." ok");
    end
    --User:inform("Bonus waere dann "..Bonus);
    return Bonus
end

function actionDisturbed(Caster,disturber)
    local RItem = disturber:getItemAt(Character.right_tool); -- Item in der Rechten Hand
    local LItem = disturber:getItemAt(Character.left_tool); -- Item in der Linken Hand
    local DefrFound,DefRightWeapon = world:getWeaponStruct(RItem.id);   -- Waffenwerte Rechte Waffe
    local DeflFound,DefLeftWeapon = world:getWeaponStruct(LItem.id);     -- Waffenwerte linke Waffe
    Distance = 1;
    if DefrFound then
        Distance = math.max(Distance,DefRightWeapon.Range);
    end
    if DeflFound then
        Distance = math.max(Distance,DefLeftWeapon.Range);
    end
    if Caster:isInRange(disturber,Distance) then
        local CIntel = Caster:increaseAttrib("intelligence",0);
        local CWill = Caster:increaseAttrib("willpower",0);
        local CSkill = Caster:getSkill(Skill.name);

        local contry = (CSkill-Skill.min)*base.common.Scale( 5, 12, (CIntel*2+CWill*3) ) / 10;
        if (math.random(0,100)<(conctry * HPMod(Caster:increaseAttrib("hitpoints",0)))) then
            return false
        else
            return true
        end
    else
        return false
    end
end

-- Erstellt einen Wert zwischen 0 und 1 abhängig der Hitpoints eines Charakters
function HPMod(Hitpoints)
    return math.min(100,math.max(0,math.floor(45.2855+math.sin(0.0003*Hitpoints-1.5161)+55.2571)))/100;
end

function gemBonis( Char )
    GemBonis = {
        ["Skill"] = 0,
        ["Time"] = 0,
        ["Range"] = 0,
        ["Radius"] = 0
    }

    local StoneItem = Char:getItemAt( Character.right_tool );
    if ItemClass[StoneItem.id]~=5 then
        StoneItem = Char:getItemAt( Character.left_tool );
	    if ItemClass[StoneItem.id]~=5 then
	        return;
	    end
	end

	local stone = { {}, {} };
	stone[1]["type"], stone[1]["effect"], stone[2]["type"], stone[2]["effect"] = base.common.GetBonusFromTool( StoneItem );

	for i=1,2 do
	    if stone[i].type == 2 then -- Smaragd
	        if i == 1 then
	            GemBonis.Range = GemBonis.Range + stone[i].effect;
	        else
	            GemBonis.Radius = GemBonis.Radius + math.ceil(stone[i].effect/2);
	        end
	    elseif stone[i].type==3 and Skill.name=="commotio" then -- Rubin
	        GemBonis.Skill = GemBonis.Skill + stone[i].effect * 3;
	    elseif stone[i].type==4 and ((Skill.name=="transformo") or (Skill.name=="transfreto") or (Skill.name=="desicio")) then -- Schwarzstein
	        GemBonis.Skill = GemBonis.Skill + stone[i].effect;
	    elseif stone[i].type==5 and Skill.name=="pervestigatio" then -- Blaustein
	        GemBonis.Skill = GemBonis.Skill + stone[i].effect * 3;
	    elseif stone[i].type == 6 then -- Amethyst
	        GemBonis.Time = GemBonis.Time - math.ceil((TimeEffects.delay/100)*stone[i].effect*9);
	    end
	end
end

function GenderMessage( Char )
    if (Char:increaseAttrib("sex",0) == 0) then
        return "seine", "his";
    else
        return "ihre", "her";
    end
end;

function MaximalMagicResistance( Char )
    local maxMagicResist = 1.4 * ( Char:increaseAttrib("intelligence",0) + ( Char:increaseAttrib("willpower",0) * 1.75 ) + ( Char:increaseAttrib("essence",0) * 2 ) ) + 5;
    return base.common.Limit( maxMagicResist, 0, 100 );
end

function performGFX( gfxID, posi )
    if (gfxID == nil) then
        return;
    end

    if (type(gfxID) == "table") then
        local sel = math.random(1,table.getn(gfxID));
        gfxID = gfxID[ sel ];
    end

    if (gfxID ~= 0) then
        world:gfx( gfxID, posi );
    end
end

function performTile( TileID, posi )
    if (TileID == nil) then
        return;
    end

	if (math.random(1,10)==1) then
		TileID=5;
		if (world:isCharacterOnField(posi)) then
            world:createItemFromId( 373, 1, posi, true, 333 ,1);
        else
            world:createItemFromId( 359, 1, posi, true, 333 ,1);
        end
	end
	if (math.random(1,10)==1) then
		world:createItemFromId( 373, 1, posi, true, 333 ,1);
	end

    if (TileID ~= 0) then
        world:changeTile(TileID,posi);
    end
end


function performSFX( sfxID, posi )
    if (sfxID == nil) then
        return;
    end

    if (type(sfxID) == "table") then
        local sel = math.random(1,table.getn(sfxID));
        sfxID = gfxID[ sel ];
    end

    if (sfxID ~= 0) then
        world:makeSound( sfxID, posi );
    end
end

function SpawnArea( monID, posi )
    if (monID == nil) then
        return;
    end

	chance=math.random(1,5);
    if (chance==1) then
        monID=171;
    elseif (chance==2) or (chance==3) then
	    monID=113;
	elseif (chance==4) or (chance==5) then
		monID=116;
    end

    if (math.random(1,9)==1) then
	    if (monID ~= 0) then
	        world:createMonster(monID,posi,20);
	    end
	end
end
