--In work! by Avalyon
--Special Cursed Ring

dofile( "base_lookat.lua" );
dofile( "lte_20_cursed_ring.lua" );

function LookAtItem(User,Item)
    if Item.quality == 1001 then
        world:itemInform(User,Item, " Cursed Ring ");
    else
        world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,false,true ));
    end
end



function MoveItemAfterMove(User, SourceItem, TargetItem)
  if (TargetItem.itempos == 7) or (TargetItem.itempos == 8) then
    if (TargetItem.quality == 1001) or (TargetItem.quality == 1001) then
       User.effects:addEffect(CLongTimeEffect(20,65535));
    end
  end
end


--[[
function MoveItemBeforeMove(User, SourceItem, TargetItem)
    if ( SourceItem.itempos == 8 ) or ( SourceItem.itempos == 7 ) then
        if SourceItem.quality == 1001 then
     return false
        else
            return true
        end
    else return true
    end
--added now
    if (getItemAt(7).id == 278) or (getItemAt( 8 ).id==278) then
        if (getItemAt(7).quality == 1001) or (getItemAt( 8 ).quality == 1001) then
           User:inform ("You feel like it would be a foolish thing to equip another Cursed Ring");      
           return false
        else 
           return true
        end
    else return true
    end
--end of added now
end
]]--

function MoveItemBeforeMove(User, SourceItem, TargetItem)
    -- if already wearing ring
    if (User:getItemAt(7).id == SourceItem.id) or (User:getItemAt( 8 ).id==SourceItem.id) then
        if (User:getItemAt(7).quality == 1001) or (User:getItemAt( 8 ).quality == 1001) then
            User:inform ("You feel like it would be a foolish thing to equip another Cursed Ring");
            return false
        end
    -- if not wearing the ring already
    else
       -- if blackstone ring cannot unequip
       if ( SourceItem.itempos == 8 ) or ( SourceItem.itempos == 7 ) then
            if SourceItem.quality == 1001 then
                return false
            end
       end
    end
    return true
end


function UseItem(User, SourceItem, TargetItem, counter, param, ltstate)
    if (  SourceItem.itempos ==8 ) or ( SourceItem.itempos == 7 ) then
        if SourceItem.quality == 1001 then
            if (User.pos.x < 250) or (User.pos.y < 50) then
                if ( ltstate == nil or ltstate == Action.success ) then
                    User:warp(position(0 ,0 ,0));
                elseif ( ltstate == Action.none ) then
                    User:startAction( 100, 5, 4, 0, 0);
                    User:talk (CCharacter.say, "#me spins a black ring around his finger, immediately being surrounded with a dark aura.");
                elseif ( ltstate == Action.abort ) then
                    User:talk (CCharacter.say, "#me gets distracted, the dark aura fading away. You feel as the cursed ring draws from your lifeforce to replenish it's energy.");
                    User:increaseAttrib ("hitpoints", -5000);
                end
            end
		end
    end
end