function CastMagicOnCharacter(Caster,TargetCharacter)
    neckItem=TargetCharacter:getItemAt(2);
    if neckItem.id==222 and neckItem.data==Caster.id and neckItem.quality==1000 then
        found, reg_effect = player.effects:find(1000);      -- gesegnet LTE
        if not found then
            player.effects:addEffect( LongTimeEffect(1000,10) );
        else
            
        end
    end
end
