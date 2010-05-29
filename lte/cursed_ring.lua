module("lte.cursed_ring", package.seeall)
-- In work! By Avalyon
-- Boni or curse for the cursed ring

function callEffect(eff, User)
 eff.nextCalled = 65535;
   return true;
end

function addEffect (eff, User)
eff:addValue( "curse", 1)
      if (User:getItemAt( 8 ).data == User.id) or (User:getItemAt( 7 ).data == User.id) then
                User:increaseAttrib ("agility", 3);
                User:increaseAttrib ("intelligence", 3);
                User:inform ("You feel a slight pain as the ring tightens arround your finger. A dark energy is released inside the body, making you feel as powerful as you have ever been.");
                
      else
                User:increaseAttrib ("agility", -3);
                User:increaseAttrib ("intelligence", -3);
                User:inform ("You feel as the ring powerfully tightens arround your finger, making you shiver in pain. A dark energy is released inside the body, making you feel dizzy and weak.");
      end
   return true
end

function removeEffect (eff,User)
eff:removeValue ("curse");
end

function loadEffect (eff, User)
end


