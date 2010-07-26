--ds_330_weisse_flasche_neu.lua
--Druidensystem in Arbeit
--Tempor�re Einzelwirkungen
--Falk
require("base.common")
require("druid.base.alchemy")

module("druid.item.id_330_white_bottle", package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_330_white_bottle' WHERE com_itemid = 330;

function DoDruidism(Character,SourceItem,TargetItem,Counter,Param)

-- Grundwerte, Listen einlesen:
-- Sprachverst�ndnis (man kann eine Zeitlang fremde Sprachen verstehen/lesen)
	if firsttime == nil then
		ListCodecs = {}
		ListLanguages  = {}
		ListSkillGroup = {}
		ListSkillID = {}
		firsttime = 1
	end
	ListCodecs={45942235,62483256,32529515,15751754,82897532,63296636,49582625,95738184,53261566,93538334}
	ListLanguages={"human language","dwarf language","elf language","lizard language","orc language","halfling language","fairy language","gnome language","goblin language","ancient language"}
	ListSkillID = {1,2,3,4,5,6,7,8,9,10}
	ListSkillGroup={1,1,1,1,1,1,1,1,1,1}


  for i=1,table.getn(ListCodecs) do
    if Sourceitem.id_data == ListCodecs[i] then

      find, myEffect = Character.effects:find(330);
      if not find then

      	oldSkill = Character:getSkill(ListLanguages[i])

      	if oldSkill == nil then
      	   oldSkill = 0
      	end

      	newSkill = Character:getSkill("library research")

        myEffect=CLongTimeEffect(330,1);

--      SkillName sichern
        myEffect:addValue( "skillID",ListSkillID[i] )

--      Alten Wert sichern
        myEffect:addValue( "oldSkill",oldSkill )

--      Neuen Wert sichern
        myEffect:addValue( "newSkill",newSkill )

--      SkillGroup sichern
        myEffect:addValue( "skillGroup",ListSkillGroup[i])

--      Laufzeit nach Quality berechnen
        myEffect:addValue("zaehler",Sourceitem.id_quality)

 			--Character:inform(ListCodecs[i].." / "..ListLanguages[i].." / "..oldSkill)
      	Character:increaseSkill(ListSkillGroup[i],ListLanguages[i],newSkill)
 			--Character:inform(ListCodecs[i].." / "..ListLanguages[i].." / "..Character:getSkill(ListLanguages[i]))

--      Verwandlung ausf�hren
        world:gfx(5,Character.pos)

--      Effekt an Char binden
        Character.effects:addEffect(myEffect);
      end
    end
  end
    
  --Weitere Einzelwirkungen
  if Sourceitem.id_data == 55555551 then
    --Ende des LTE 1 / alcohol
    if Character.effects:find(1) then 
		  Character.effects:removeEffect(1)
    end
  elseif Sourceitem.id_data == 55555552 then
    --Ende des LTE 2 /char_reg
    if Character.effects:find(2) then 
		  Character.effects:removeEffect(2)
    end
  elseif  Sourceitem.id_data == 55555553 then
    --Ende des LTE 3 /cold
    if Character.effects:find(3) then 
		  Character.effects:removeEffect(3)
    end 
  elseif  Sourceitem.id_data == 55555515 then
    --Ende des LTE 15 /illnes1
    if Character.effects:find(15) then 
		  Character.effects:removeEffect(15)
    end 
  elseif  Sourceitem.id_data == 55555518 then
    --Ende des LTE 18 /smell
    if Character.effects:find(18) then 
		  Character.effects:removeEffect(18)
    end 
  elseif  Sourceitem.id_data == 55555528 then
    --Ende des LTE 28 / drachenpocken
    if Character.effects:find(28) then 
		  Character.effects:removeEffect(28)
    end 
  elseif  Sourceitem.id_data == 55555529 then
    --Ende des LTE 29 / gnomwahn 
    if Character.effects:find(29) then 
		  Character.effects:removeEffect(29)
    end                 
  end
  
end

function UseItem(Character,SourceItem,TargetItem,Counter,Param,ltstate)
  if Sourceitem.id_data == 0 then
	world:erase(SourceItem,1);
	world:makeSound(12,Character.pos);
	return;
    -- Sheep Milk
  elseif Sourceitem.id_data == 1 then     -- special Cow Milk
	User = getCharForId(Character.id);  --create a save copy of the char struct
	world:erase(SourceItem,1);
	world:makeSound(12,Character.pos);

    
        -- ALTE FASSUNG ALS HEILTRANK
        if (ltstate == Action.abort) then

            User:talkLanguage(CCharacter.say, CPlayer.german, "#me verschüttet die Milch.");
            User:talkLanguage(CCharacter.say, CPlayer.english, "#me spills the milk.");

            world:erase( SourceItem, 1 );

            if (math.random( 20 ) == 1) then
                base.common.TempInformNLS( User,
                "Die Flasche zerbricht.",
                "The bottle breaks.");
            else
                User:createItem( 164, 1, 333, 0 );
            end

            return
        end

        if User.attackmode then
            base.common.InformNLS( User,
            "Du kannst nichts trinken w�hrend du k�mpfst.",
            "You can't drink something while fighting." );
            return
        end

        if (ltstate == Action.none) then

            --User:startAction( 20, 0, 0, 12, 25 );

            User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt eine Milch zu trinken.");
            User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts to drink a milk.");

        end


        if( math.random( 20 ) == 1 ) then
            base.common.InformNLS( User,
            "Die Flasche zerbricht.",
            "The bottle breaks.");
        else
            User:createItem( 164, 1, 333,0);
        end

        User:LTIncreaseHP(333,3,1); --1000HP+
        User:LTIncreaseMana(333,3,1); --1000Mana+
        User:increaseAttrib("foodlevel",1000);
        User.movepoints = User.movepoints - 16;
        
        local Poisonvalue = User:getPoisonValue();                -- Poisonvalue einlesen  ( 0 - 10000 )
        if Poisonvalue>1000 then
        	Poisonvalue = Poisonvalue -1000; --remove 1000 Poison points
        end
        User:setPoisonValue( Poisonvalue );
			
        if (User:increaseAttrib("foodlevel",0) > 60000) then
            base.common.InformNLS( User,
            "Du bekommst kaum noch was runter und dir wird schlecht.",
            "You hardly manage to eat something more and get sick!");

            User:increaseAttrib("hitpoints",-1000);
        elseif  (User:increaseAttrib("foodlevel",0) > 40000) then
            base.common.InformNLS( User,
            "Du bist satt.",
            "You are stuffed.");
        else
            base.common.InformNLS( User,
            "Du trinkst die Flasche aus und f�hlst wie neue St�rke dich durchstr�mt.",
            "You drink up the bottle, and you feel the new strength that flows through your body.");
        end

        return
        -- Old style potion done
    
  else
		if (ltstate == Action.abort) then
			Character:talkLanguage(CCharacter.say, CPlayer.german, "#me verschüttet den Trank.");
			Character:talkLanguage(CCharacter.say, CPlayer.english, "#me spills the potion.");
			world:erase(SourceItem,1);
			-- Chance for a new bottle 19/20
			if(math.random(20) == 1) then
				base.common.InformNLS(Character, "Die Flasche zerbricht.", "The bottle breaks.");
			else
				Character:createItem(164, 1, 333, 0);
			end
			return
		end

		if Character.attackmode then
			base.common.InformNLS(Character, "Du kannst nichts trinken während du kämpfst.", "You can't drink something while fighting.");
		end
		
		if (ltstate == Action.none) then
			User:startAction(20,0,0,12,25);
			User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt einen Trank zu trinken.");
			User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts to drink a potion.");
			return
		end
		
	    -- Hier verweisen wir auf die Wirkung
	    DoDruidism(Character,SourceItem,TargetItem,Counter,Param)

	    world:erase(SourceItem,1);
	    world:makeSound(12,Character.pos);
	    world:gfx(5,Character.pos)

	    if( math.random( 20 ) <= 1 ) then
			base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
	    else
			Character:createItem( 164, 1, 333,0);
	    end

	    Character.movepoints=Character.movepoints-50;
  end
end

function LookAtItem(User,Item)

    if item.id_data ==  0 then
        EtikettDe = "Schafsmilch"
        EtikettEn = "Sheep Milk"
    elseif item.id_data ==  1 then
        EtikettDe = "Orun-Milch"
        EtikettEn = "Orun milk"
	elseif item.id_data ==  45942235 then
        EtikettDe = "Menschensprache"
        EtikettEn = "Human Language Potion"
    elseif  item.id_data == 62483256 then
        EtikettDe = "Zwergensprache"
        EtikettEn = "Dwarfen Language Potion"
    elseif  item.id_data == 32529515 then
        EtikettDe = "Elfensprache"
        EtikettEn = "Elbian Language Potion"
    elseif item.id_data == 15751754 then
        EtikettDe = "Echsensprache"
        EtikettEn = "Lizard Language Potion"
    elseif item.id_data == 82897532 then
        EtikettDe = "Orksprache"
        EtikettEn = "Orcish Language Potion"
    elseif item.id_data == 63296636 then
        EtikettDe = "Halblingssprache"
        EtikettEn = "Halfling Language Potion"
    elseif item.id_data == 49582625 then
        EtikettDe = "Feensprache"
        EtikettEn = "Fairy Language Potion"
    elseif item.id_data == 95738184 then
        EtikettDe = "Gnomsprache"
        EtikettEn = "Gnomish Language Potion"
    elseif item.id_data == 53261566 then
        EtikettDe = "Goblinsprache"
        EtikettEn = "Goblin Language Potion"
    elseif item.id_data == 93538334 then
        EtikettDe = "Alten Sprache"
        EtikettEn = "Ancient Language Potion"
    else
        EtikettDe = "Vieltrank"
        EtikettEn = "Polyjuice Potion"
    end

	if (User:getPlayerLanguage()==0) then
		world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: "..EtikettDe)
	else
		world:itemInform(User,Item,"You look at a sticker telling: "..EtikettEn)
	end

end