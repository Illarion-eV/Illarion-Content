--ds_330_weisse_flasche_neu.lua
--Druidensystem in Arbeit
--Temporäre Einzelwirkungen
--Falk
-- reworked by Merung
require("base.common")
require("druid.base.alchemy")

module("druid.item.id_330_white_bottle",package.seeall); --, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_330_white_bottle' WHERE com_itemid = 330;

function DrinkPotion(User,SourceItem)
User:inform("beginng drinkPotion")
-- Grundwerte, Listen einlesen:
-- Sprachverständnis (man kann eine Zeitlang fremde Sprachen verstehen/lesen)
	if firsttime == nil then
		ListCodecs = {}
		ListLanguages  = {}
		ListSkillGroup = {}
		ListSkillID = {}
		firsttime = 1
	end
	ListCodecs={45942235,62483256,65554555,15751754,82897532,63296636,93538334}
	ListLanguages={"common language","human language","dwarf language","elf language","lizard language","orc language","halfling language","ancient language"}
	ListSkillID = {0,1,2,3,4,5,6,10}
	ListSkillGroup={1,1,1,1,1,1,1,1}

    potionData = tonumber(SourceItem:getData("potionData")); 
    
  for i=1,table.getn(ListCodecs) do
    
	if potionData == ListCodecs[i] then

      find, myEffect = User.effects:find(330);
      if not find then

      	oldSkill = User:getSkill(ListLanguages[i])
        end
      	if oldSkill == nil then
      	   oldSkill = 0
      	end

      	newSkill = 100

        myEffect=LongTimeEffect(330,1);

--      SkillName sichern
        myEffect:addValue( "skillID",ListSkillID[i] )

--      Alten Wert sichern
        myEffect:addValue( "oldSkill",oldSkill )

--      Neuen Wert sichern
        myEffect:addValue( "newSkill",newSkill )

--      SkillGroup sichern
        myEffect:addValue( "skillGroup",ListSkillGroup[i])

--      Laufzeit nach Quality berechnen
        -- replance with formula
		myEffect:addValue("counterWhite",10)

 		-- cooldown 	
		myEffect:addValue("cooldownWhite",15)	
			
			--Character:inform(ListCodecs[i].." / "..ListLanguages[i].." / "..oldSkill)
      	User:increaseSkill(ListSkillGroup[i],ListLanguages[i],newSkill)
 			--Character:inform(ListCodecs[i].." / "..ListLanguages[i].." / "..Character:getSkill(ListLanguages[i]))

--      Effekt an Char binden
        User.effects:addEffect(myEffect);
        User:inform("ende drinPotion, effekt hinzufügen")
	  
    end
  end
    
end

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
-- if not milk then	  
  if base.common.GetFrontItemID(User) == 1008 then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	
	   if (cauldron:getData("cauldronData") ~= "") then 
	      base.common.InformNLS( User,
					"In dem Kessel befindet sich bereits etwas. Du kannst nichts mehr hinzutun.",
					"There is already something in the cauldron. You cannot add something else to it."
						   );
	       return;
      
	  elseif (cauldron:getData("cauldronData") == "") then -- nothing in the cauldron, so the stock is being filled in
	      
		  if ( ltstate == Action.abort ) then
                base.common.InformNLS( User,
                "Du brichst Deine Arbeit ab.",
                "You abort your work."
                       );
		        return;
            end
			
			if (ltstate == Action.none) then
			   User:startAction(20,21,5,0,0);
			   return
			end
		  
		  local ID_potion = SourceItem.id			 
		  cauldron:setData("potionID", ""..ID_potion);
		  cauldron:setData("cauldronData",""..SourceItem:getData("potionData"))
	      cauldron.quality = SourceItem.quality
		  world:changeItem(cauldron)
		  User:inform(""..ID_potion)
		  User:talkLanguage(Character.say, Player.german, "#me kippt einen Trank in den Kessel.");
          User:talkLanguage(Character.say, Player.english, "#me pours a potion into the cauldron.");
		  world:makeSound(10,User.pos);
		  world:erase(SourceItem,1);
		  User:createItem(164, 1, 333, 0);
	      return;
	   end  
	end
	
	-- not infront of a cauldron: let's drink the potion!
    if User.effects:find(330) then
	   User.effects:removeEffect(330);
	end
	if User.attackmode then
	   base.common.InformNLS(User,
			"Du kannst den Trank nicht benutzen, während Du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	if User.effects:find(330) then
	   base.common.InformNLS( User,
                "Der Trank hätte jetzt keine Wirkung.",
                "The potion wouldn't have any effect now."
                       );  
	   return;
	end	
	
	base.character.ChangeFightingpoints(User, -20);
	world:makeSound(12,User.pos);
	world:erase(SourceItem,1);
	   if(math.random(20) == 1) then
           base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            User:createItem(164, 1, 333, 0);
        end
	User:inform("ende von useitem")
	DrinkPotion(User, SourceItem);
-- end (milk)
  
  ----------- MILK ; has to be reworked sometime --------
  --if SourceItem.data == 0 then
	--world:erase(SourceItem,1);
	--world:makeSound(12,Character.pos);
	--return;
    -- Sheep Milk
 -- elseif SourceItem.data == 1 then     -- special Cow Milk
	--User = getCharForId(Character.id);  --create a save copy of the char struct
	--world:erase(SourceItem,1);
	--world:makeSound(12,Character.pos);

    
        -- ALTE FASSUNG ALS HEILTRANK
       -- if (ltstate == Action.abort) then

        --    User:talkLanguage(Character.say, Player.german, "#me verschüttet die Milch.");
        --    User:talkLanguage(Character.say, Player.english, "#me spills the milk.");

        --    world:erase( SourceItem, 1 );

        --    if (math.random( 20 ) == 1) then
        --        base.common.InformNLS( User,
        --        "Die Flasche zerbricht.",
         --       "The bottle breaks.");
         --   else
         --       User:createItem( 164, 1, 333, 0 );
        --    end

        --    return
       -- end

        --if User.attackmode then
        --    base.common.InformNLS( User,
        --    "Du kannst nichts trinken während du kämpfst.",
        --    "You can't drink something while fighting." );
        --    return
        --end

        --if (ltstate == Action.none) then

            --User:startAction( 20, 0, 0, 12, 25 );

         --   User:talkLanguage(Character.say, Player.german, "#me beginnt eine Milch zu trinken.");
         --   User:talkLanguage(Character.say, Player.english, "#me starts to drink a milk.");

        --end


        --if( math.random( 20 ) == 1 ) then
        --    base.common.InformNLS( User,
        --    "Die Flasche zerbricht.",
        --    "The bottle breaks.");
       -- else
        --    User:createItem( 164, 1, 333,0);
        --end

        --User:LTIncreaseHP(333,3,1); --1000HP+
        --User:LTIncreaseMana(333,3,1); --1000Mana+
        --User:increaseAttrib("foodlevel",1000);
       -- User.movepoints = User.movepoints - 16;
        
        --local Poisonvalue = User:getPoisonValue();                -- Poisonvalue einlesen  ( 0 - 10000 )
        --if Poisonvalue>1000 then
        --	Poisonvalue = Poisonvalue -1000; --remove 1000 Poison points
        --end
        --User:setPoisonValue( Poisonvalue );
			
        --if (User:increaseAttrib("foodlevel",0) > 60000) then
        --    base.common.InformNLS( User,
        --    "Du bekommst kaum noch was runter und dir wird schlecht.",
        --    "You hardly manage to eat something more and get sick!");

        --    User:increaseAttrib("hitpoints",-1000);
        --elseif  (User:increaseAttrib("foodlevel",0) > 40000) then
       --     base.common.InformNLS( User,
        --    "Du bist satt.",
        --    "You are stuffed.");
        --else
        --    base.common.InformNLS( User,
        --    "Du trinkst die Flasche aus und fühlst wie neue Stärke dich durchströmt.",
        --    "You drink up the bottle, and you feel the new strength that flows through your body.");
        --end

        --return
        -- Old style potion done
   --end
	------------------------ MILKD END -------------------	
end


function LookAtItem(User,Item)

    if Item.data ==  0 then
        EtikettDe = "Schafsmilch"
        EtikettEn = "Sheep Milk"
    elseif item.id_data ==  1 then
        EtikettDe = "Orun-Milch"
        EtikettEn = "Orun milk"
	elseif Item.data ==  45942235 then
        EtikettDe = "Menschensprache"
        EtikettEn = "Human Language Potion"
    elseif  Item.data == 62483256 then
        EtikettDe = "Zwergensprache"
        EtikettEn = "Dwarfen Language Potion"
    elseif  Item.data == 32529515 then
        EtikettDe = "Elfensprache"
        EtikettEn = "Elbian Language Potion"
    elseif Item.data == 15751754 then
        EtikettDe = "Echsensprache"
        EtikettEn = "Lizard Language Potion"
    elseif Item.data == 82897532 then
        EtikettDe = "Orksprache"
        EtikettEn = "Orcish Language Potion"
    elseif Item.data == 63296636 then
        EtikettDe = "Halblingssprache"
        EtikettEn = "Halfling Language Potion"
    elseif Item.data == 93538334 then
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
