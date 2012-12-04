module("content.jewelbonus", package.seeall)

function getBonus(Item)                 -- returns gem#, strength of this gem (inserted)
    itData=Item.data;
    if itData>9 and itData<100 then     -- this is an item with 1 gem inserted!
        modStr=math.mod(itData,10)+1;   -- how much modification?
        insGem=math.floor(itData/10);   -- which stone is it?
        return insGem, modStr;
    end
    return 0,0
end

function getModifier(Str)
    return math.ceil(Str/3);
end

function addBonus(User,gem,str)
    --User:inform("in addbonus mit gem="..gem.." str= "..str);
    if gem==1 then
        User:increaseAttrib("intelligence",str);
        User:inform("incr intelligence by ".. str);
    elseif gem==2 then
        User:increaseAttrib("perception",str);
        User:inform("incr perception by ".. str);
    elseif gem==3 then
        User:increaseAttrib("dexterity",str);
        User:inform("incr dexterity by ".. str);
    elseif gem==4 then
        User:increaseAttrib("strength",str);
        User:inform("incr strength by ".. str);
    elseif gem==5 then
        User:increaseAttrib("constitution",str);
        User:inform("incr constitution by ".. str);
    elseif gem==6 then
        User:increaseAttrib("agility",str);
        User:inform("incr agility by ".. str);
    elseif gem==7 then
        User:increaseAttrib("willpower",str);
        User:inform("incr willpower by ".. str);
        User:increaseAttrib("essence",str);
        User:inform("incr essence by ".. str);
    end
    --User:inform("durch mit addbonus");
end

function intelligentRemove(User,attribute,modifier)
    --User:inform("intelligent remove now");
    att=User:increaseAttrib(attribute,0);
    found,gemBonus = User.effects:find(50);
    if att>modifier then             -- can we subtract the whole stuff?
        User:increaseAttrib(attribute,-modifier);
        --User:inform("decr "..attribute.." by ".. modifier);
        gemBonus:removeValue("remain"..attribute);
    else                        -- oh my god, can't subtract the whole thing!
        User:increaseAttrib(attribute,-att+1)  -- set attribute to 1 (sucker!)
        --User:inform("only removed "..att-1);
        remain=modifier-att+1;       -- how much will we have to subtract later on?
        if found then
            gemBonus:addValue("remain"..attribute,remain);
            --User:inform("remaining: "..remain);
        end
    end
end

function removeBonus(User,gem, str)
    --User:inform("remove bonus now");
    if gem==1 then
        intelligentRemove(User,"intelligence",str);
    elseif gem==2 then
        intelligentRemove(User,"perception",str);
    elseif gem==3 then
        intelligentRemove(User,"dexterity",str);
    elseif gem==4 then
        intelligentRemove(User,"strength",str);
    elseif gem==5 then
        intelligentRemove(User,"constitution",str);
    elseif gem==6 then
        intelligentRemove(User,"agility",str);
    elseif gem==7 then
        intelligentRemove(User,"willpower",str);
        intelligentRemove(User,"essence",str);
    end
end

function giveBonus(User, Item)          -- give the LTE and write values into it
    insGem,modStr=getBonus(Item);       -- read out gem-type and strength
    movedTo=Item.itempos                -- left or right hand?
    if insGem~=0 then                   -- is there ANY effect?
        modifier=getModifier(modStr);   -- modify by...
        found,gemBonus = User.effects:find(50);
        if not found then               -- already has a bonus from another item? no
            gemBonus=User.effects:addEffect(LongTimeEffect(50,0));    -- give effect
            --User:inform("gave eff");
            found,gemBonus = User.effects:find(50);
        end
        if movedTo==7 then               -- put on left finger
            --User:inform("left");
            gemBonus:addValue("hand1gem",insGem);   -- write into LTE
            gemBonus:addValue("hand1mod",modifier);
            addBonus(User,insGem,modifier);         -- give actual attribs to user
            --User:inform("done left");
        else                             -- other hand
            --User:inform("right");
            gemBonus:addValue("hand2gem",insGem);
            gemBonus:addValue("hand2mod",modifier);
            addBonus(User,insGem,modifier);
            --User:inform("done right");
        end
    end
end

function takeBonus(User, Item, insGem, modStr)  -- take bonus away
    finger=Item.itempos;
    modStr=getModifier(modStr);
    found,gemBonus = User.effects:find(50);     -- get effect
    --User:inform("take bonus now");
    if found then
        if finger==7 then                       -- remove values from lte
            removeBonus(User,insGem,modStr);        -- remove bonus
            gemBonus:removeValue("hand1gem");
            gemBonus:removeValue("hand1str");
        else
            gemBonus:removeValue("hand2gem");
            gemBonus:removeValue("hand2str");
        end
        removeBonus(User,insGem,modStr);        -- remove bonus
    end
end
