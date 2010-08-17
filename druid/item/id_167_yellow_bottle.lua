--I_167_gelbe_flasche / Krankheiten und Gifte 
--Druidensystem in Arbeit
--Falk
require("base.common")
require("druid.base.alchemy")

module("druid.item.id_167_yellow_bottle", package.seeall, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_167_yellow_bottle' WHERE com_itemid = 167;

function DoDruidism(Character,SourceItem,TargetItem,Counter,Param)
  if firsttime == nil then
     firsttime = 1
  end
--Krankheiten
--Hier kommt die Sache mit dem Langzeiteffekt:
  find, myEffect = Character.effects:find(167);
  if not find then
    myEffect=CLongTimeEffect(167,1);

    if SourceItem.data == 83795161 then
--     Character:inform("Ork-Fieber/orc-fever")
       diagnose=1
    elseif SourceItem.data == 26343194 then
--     Character:inform("Sumpfkrampf/bog-attack")
       diagnose=2
    elseif SourceItem.data == 98886573 then
--     Character:inform("Trollsucht/Troll's rash")
       diagnose=3
    elseif SourceItem.data == 65336351 then
--     Character:inform("Gnom-Wahn/gnome-paranoia")
       diagnose=4
    elseif math.mod(SourceItem.data,10000000) == 8455363 then
--     Character:inform("Vein'sches Syndrom/Veins'syndrome")
		   diagnose=5
		   local allergy = math.floor(SourceItem.data/10000000);
		   if allergy == 3 then
			   allergy = 1;
		   elseif allergy == 5 then
			   allergy = 2;
		   elseif allergy == 7 then
			   allergy = 3;
		   else
			   allergy = math.random(1,3);
		   end
		   myEffect:addValue("allergy",allergy);
    elseif SourceItem.data == 95819741 then
--     Character:inform("Drachenpocken/dragon's pox")
       diagnose=6
    elseif SourceItem.data == 15386558 then
--     Character:inform("Skorpion-Seuche/scorpion's pestilence")
       diagnose=7
    elseif SourceItem.data == 58595367 then
--     Character:inform("Wolfspest/wolves pest")
       diagnose=8
    end
--
    myEffect:addValue("illness",diagnose)
--  Laufzeit nach Quality berechnen, maximal 999 Runden
    myEffect:addValue("zaehler",SourceItem.quality)

--  Effekt an Char binden
    Character.effects:addEffect(myEffect);
  else
--  Character hat schon eine Krankheit (und ist immun vor weiterer Infektion)
    base.common.InformNLS(Character,
		"#w Du trinkst die Flüssigkeit, doch sie scheint keine Wirkung auf dich zu haben.",
		"#w You drink the liquid but it doesn't seem to have any effect on you.");
  end
end -- function DoDruidism()
--
function DoPoisoning(Character,SourceItem,TargetItem,Counter,Param)
-- Vergiften von Items
-- Liste der vergiftbaren Items
   ListPo = {}
   ListPo = {15,47,49,64,73,80,81,147,151,160,163,191,199,200,201,237,293,294,302,303,306,307,322,353,354,355,388,552,553,554,555,553,557,559,2276,2277,2278,2456,2459,2922,2923}
   for i = 1, table.getn(ListPo) do
      if TargetItem.id == ListPo[i] then
         TargetItem.data = SourceItem.data
         TargetItem.quality = SourceItem.quality
         world:changeItem(TargetItem)
         world:makeSound(12,Character.pos);
         world:gfx(5,Character.pos)
         world:erase(SourceItem,1);
      end
   end
-- in einer 2. Ausbaustufe kann man die Schwerter, die als vergiftete Waffen eine Grafik haben umsetzen

end -- function DoPoisoning()
--
function UseItem(Character,SourceItem,TargetItem,Counter,Param)
  if not Character.attackmode then

     if TargetItem.id == 0 then

--      Sich selbst vergiften
        DoDruidism(Character,SourceItem,TargetItem,Counter,Param)

        world:makeSound(12,Character.pos);
        world:gfx(5,Character.pos)
--        world:erase(SourceItem,1);
     else
--      Einen Gegenstand vergiften
        DoPoisoning(Character,SourceItem,TargetItem,Counter,Param)
     end

     world:erase(SourceItem,1);
	 if( math.random( 20 ) <= 1 ) then
       base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
     else
       Character:createItem( 164, 1, 333,0);
     end

     Character.movepoints=Character.movepoints-50;

  else
    base.common.InformNLS(Character,"Du kannst nichts trinken wï¿½hrend du kï¿½mpfst.", "You can't drink something while fighting.");
  end
end

--

function UseItemWithCharacter(User,SourceItem,Character,Counter,Param)
  if SourceItem.data ==0 then
    UserLang=User:getPlayerLanguage();
    CharLang=Character:getPlayerLanguage();
    if (User.id~=Character.id) then
        if (SourceItem:getType()==4) then
            if IsLookingAt(User,Character.pos) then
                if not IsLookingAt(Character,User.pos) then
                    SkillName="poisoning";
                    SkillVal=User:getSkill(SkillName);
                    AttribVal=math.floor((User:increaseAttrib("dexterity",0)*2+User:increaseAttrib("agility",0))/3)*(math.random(7,13)/10);
                    PoiTry=(6/10)*(SkillVal+AttribVal)+10;
                    AttribValDef=math.floor((Character:increaseAttrib("dexterity",0)+(Character:increaseAttrib("agility",0)*2))/3)*(math.random(7,13)/10);
                    PoiDef=(5*AttribValDef)-11;
                    if (PoiTry>PoiDef) then
                        base.common.InformNLS(User,"Du verabreichst deinem Opfer das Gift.","You administer your victim the toxin.");
                        base.common.InformNLS(Character,"Jemand hat dir Gift in den in den Mund geschï¿½ttet.","Someone pour you a toxin into your mouth.");
                        world:erase(SourceItem,1);
                        world:makeSound(12,Character.pos);
				Character:setPoisonValue( base.common.Limit( (Character:getPoisonValue() + (math.floor((825/100)*(SkillVal-AttribValDef)+(175/10)))) , 0, 10000) );
                        --Character:increasePoisonValue(math.floor((825/100)*(SkillVal-AttribValDef)+(175/10)));
                    else
                        base.common.InformNLS(User,"Du versuchst deinem Opfer das Gift zu verabreichen, aber du scheiterst.","You try to administer the toxin to your victim, buy you fail.");
                        base.common.InformNLS(Character,"Jemand versuchte dir den Inhalt einer Flasche in den Mund zu schï¿½tten.","Someone tried to make you drink a potion.");
                        world:erase(SourceItem,1);
                    end
                    if( math.random( 50 ) <= 1 ) then
                        base.common.InformNLS( User, "Die Flasche zerbricht.", "The bottle breaks.");
                    else
                        User:createItem( 164, 1, 333,0);
                    end
                    User:learn(5,SkillName,1,(3*AttribValDef)+40);
                    User.movepoints=User.movepoints-10;
                else
                    base.common.InformNLS(User,"Dein Opfer darf nicht zu dir sehen, wenn du Erfolg haben willst.","Your victim shouldn't look at you, if you want to succeed.");
                end
            else
                base.common.InformNLS(User,"Du musst zu deinem Opfer sehen.","You have to look at your victim.");
            end
        else
            base.common.InformNLS(User,"Du musst den Gift Trank in die Hand nehmen.","You have to take the poison potion in your hand.");
        end
    else
        UserKons=User:increaseAttrib("constitution",0);
        world:erase(SourceItem,1);
        world:makeSound(12,User.pos);
        User:increaseAttrib("hitpoints", -((-200*UserKons)+5000));
    end
  end  
end

--

function UseItemWithField(Character,SourceItem,TargetPos,Counter,Param)

end

--

function LookAtItem(User,Item)

  if Item.data == 83795161 then
     Etikett ="Gwenwyn Anghenfil Twymyn"
  elseif Item.data == 26343194 then
     Etikett ="Gwenwyn Morfa Cwlwm Gwythi"
  elseif item.id_data == 98886573 then
     Etikett ="Gwenwyn Trolio Caethineb"
  elseif Item.data == 65336351 then
     Etikett ="Gwenwyn Corrach Rhithdyb"
  elseif math.mod(item.id_data,10000000) == 8455363 then
     Etikett ="Gwenwyn Rhag Vein-Syndrome"
  elseif Item.data == 95819741 then
     Etikett ="Gwenwyn Draig Brech Moddion"
  elseif Item.data == 15386558 then
     Etikett ="Gwenwyn Sgorpion Epidemig"
  elseif Item.data == 58595367 then
     Etikett ="Gwenwyn Blaidd Haint"
  else
     Etikett ="Siwgr Dwfr"
  end

  if (User:getPlayerLanguage()==0) then
    world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: "..Etikett)
  else
    world:itemInform(User,Item,"You look at a sticker telling: "..Etikett)    
  end

end

function IsLookingAt( User, Location )
    if( Location == nil ) then
        return false;
    end
    local richtung = User:get_face_to(  )
    if   ( ( richtung == 0 ) and ( Location.y < User.pos.y ) ) or
    ( ( richtung == 2 ) and ( Location.x > User.pos.x ) ) or
    ( ( richtung == 4 ) and ( Location.y > User.pos.y ) ) or
    ( ( richtung == 6 ) and ( Location.x < User.pos.x ) ) then
        return true
    end
    return false
end
