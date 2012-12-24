--Priest magic: Becoming a devotee, change devotion, become a priest by using an altar
--Altars are dedicated to gods, encoded in the data value
--Overview of queststatus:
--401 contains the ID of the god the character is devoted to
--402 contains the ID of the god the character is a priest of. MUST be equal to 401 or 0.
--Elder Gods
--1: Ushara – Goddess of earth 
--2: Brágon – God of fire
--3: Eldan – God of spirit
--4: Tanora/Zelphia – Goddess of water
--5: Findari – Goddess of air
--Younger Gods
--6: Nargùn – God of chaos
--7: Elara – Goddess of wisdom and knowledge
--8: Adron – God of festivities and wine
--9: Oldra – Goddess of life and fertility
--10: Cherga – Goddess of spirits and the underworld
--11: Malachín – God of battle and hunting
--12: Irmorom – God of trade and craftsmanship
--13: Sirani – Goddess of love and pleasure
--14: Zhambra – God of friendship and loyalty  
--15: Ronagan – God of thieves and shadows
--16: Moshran – God of blood and bones

require("base.common")
require("content.gods")

module("item.altars", package.seeall)

function ini()
  init=true;
--These are the items I need to become a devotee
--Items by Cromwell
  devoteItems={};
  devoteItems[1]={733,316,2588}; --Ushara: Stone block, Quartz sand, Brick
  devoteItems[2]={314,236,43}; --Brágon: potash, Gold ignot, Candle
  devoteItems[3]={256,2745,155}; --Eldan: Raw diamonds, Parchment, Sibanac leaf
  devoteItems[4]={52,253,72}; --Tanora: Bucket of water, Raw sapphire, Fishing rod
  devoteItems[5]={64,463,65}; --Findari: Arrow, Quill, Short Bow
  devoteItems[6]={80,356,733}; --Nargùn: Banana, Slouch hat, Stone block
  devoteItems[7]={2745,329,463}; --Elara: Parchment, Ink, Quill
  devoteItems[8]={223,2500,388}; --Adron: Iron Goblet, Bottle of Wine, Grapes
  devoteItems[9]={258,534,259}; --Oldra: Flail, Onion seeds, Grain
  devoteItems[10]={24,43,182}; --Cherga: Shovel, Candle, Black shirt
  devoteItems[11]={19,65,2586}; --Malachín: Metal shield, Short bow, Fur
  devoteItems[12]={3077,23,2140}; --Irmorom: Silver coin, Hammer, Tongs
  devoteItems[13]={235,144,174}; --Sirani: Gold ring, Virgins weed, Red cloth
  devoteItems[14]={2760,17,78}; --Zhambra: Rope, Wooden shield, Short sword
  devoteItems[15]={2760,190,48}; --Ronagan: Rope, Ornate dagger, Leather gloves
  devoteItems[16]={16,63,2757}; --Moshran: Orcish helmet, Entrails, Scimitar
--These are the items I need to become a priest. Not relevant for now since there is no priest magic.
  priestItems={};
  priestItems[1]={2416,40,26,726,735}; --Ushara: Brown priest robe, Cleric's staff, Clay, Coarse sand, Raw stone
  priestItems[2]={2419,40,391,46,234}; --Brágon: Red priest robe, Cleric's staff, Torch, Ruby, Gold nugget
  priestItems[3]={2418,40,41,285,463}; --Eldan: Grey priest robe, Cleric's staff, Glass ignot, Diamond, Quill
  priestItems[4]={193,40,2496,284,279}; --Tanora: Blue robe, Cleric's staff, Bottle of Water, Sapphire, Sapphire ring
  priestItems[5]={2421,40,2780,322,166}; --Findari: White priest robe, Cleric's staff, Longbow, Wind arrow, Big empty bottle
  priestItems[6]={2418,445,355,225,290}; --Nargùn: Grey priest robe, Wooden sword, Salmon, Crown, Cabbage
  priestItems[7]={368,76,397,3110,222}; --Elara: Yellow priest robe, Mage's staff, Oil lamp, Pell, Amulet
  priestItems[8]={2419,224,335,2744,155}; --Adron: Red priest robe, Golden goblet, Lute, Pipe, Sibanac leaf
  priestItems[9]={2416,271,126,2786,249}; --Oldra: Brown priest robe, Scythe, Sickle, Branch, Bundle of grain
  priestItems[10]={2420,271,138,314,726}; --Cherga: Black priest robe, Scythe, Night angels blossom, potash, Coarse sand
  priestItems[11]={2421,20,391,2291,78}; --Malachín: White priest robe, Large metal shield, Torch, Salkamaerian Paladin's helmet, Shortsword
  priestItems[12]={2418,226,74,2763,2752}; --Irmorom: Gray priest robe, War Hammer, Hatchet, Pickaxe, Carving tools
  priestItems[13]={2421,40,280,354,222}; --Sirani: White priest robe, Cleric's staff, Diamond ring, Strawberry cake, Amulet
  priestItems[14]={368,20,2701,40,333}; --Zhambra: Yellow priest robe, Large metal shield, Longsword, Cleric's staff, Horn
  priestItems[15]={2420,2689,384,365,285}; --Ronagan: Black priest robe, Poisoned ornate dagger, Thieves gloves, Half leather armor, Diamond
  priestItems[16]={2420,552,39,69,2746}; --Moshran: Black priest robe, Deer meat, Skull staff, Raw leather, razor blade
end

function LookAtItem( User, Item )
  thisGod=tonumber(Item:getData("god"));
  
  if thisGod==nil then
    thisGod = 0;
  end;
  
  if init==nil or init==false then
    ini();
  end
  --Tell the user who's altar that is
  if thisGod==content.gods.GOD_NONE  or thisGod>content.gods.GOD_THEFIVE then --undedicated altar
    base.lookat.SetSpecialName(Item, "Ungeweihter Altar","Undedicated altar")
  elseif thisGod > content.gods.GOD_NONE then --dedicated altar
    base.lookat.SetSpecialName(Item,
    "Altar "..content.gods.GOD_DE[thisGod].."s, "..content.gods.DESCRIPTION_DE[thisGod]..".",
    "Altar of "..content.gods.GOD_EN[thisGod]..", the "..content.gods.DESCRIPTION_EN[thisGod]..".");
    
    if (thisGod > 5) then
      -- anything else is only for the younger gods
      
      --Now send the user some infos what he should do if he wants to become a devotee, change dedication or become a priest
      devotion=User:getQuestProgress(401);
      priesthood=User:getQuestProgress(402);
      --Check for corrupted status
      if priesthood ~= 0 and devotion ~= priesthood and User:getMagicType()== 1 then --Error! The character is a priest, but not a priest of "his" god!
        base.common.InformNLS(User,"[Fehler] Bitte informiere einen Entwickler. Der Priesterstatus deines Charakters ist fehlerhaft.","[Error] Please inform a developer, the priest status of your character is flawed.");
        return; --bailing out
      end
      --Error! The character is not a priest, but has a priest quest status! Or player uses priest magic but has no dedicated god!
      if (priesthood ~= 0 and User:getMagicType()~= 1) or (priesthood == 0 and User:getMagicType()== 1) then
        base.common.InformNLS(User,"[Fehler] Bitte informiere einen Entwickler. Der Priesterstatus deines Charakters ist fehlerhaft.","[Error] Please inform a developer, the priest status of your character is flawed.");
        return; --bailing out
      end
      --Check what the User is and send him instructions accordingly
      if (devotion == 0) then --a noob without a god
        base.lookat.SetSpecialDescription(Item,"Um euch "..content.gods.GOD_DE[thisGod].." zu weihen, werdet ihr folgendes opfern müssen: "..tellStuff(devoteItems[thisGod],User:getPlayerLanguage()),"To devote yourself to "..content.gods.GOD_EN[thisGod]..", you'll have to donate: "..tellStuff(devoteItems[thisGod],User:getPlayerLanguage()));
      elseif (devotion == thisGod) then
        -- devoted to this god
        base.common.InformNLS(User,
        "Der Anblick von "..content.gods.GOD_DE[thisGod].."s Altar erfüllt dich in deiner Ergebenheit mit Stolz.",
        "Beholding the altar of "..content.gods.GOD_EN[thisGod].." makes you feel proud of your devotion.");
        --For enabling becoming a priest, use the stuff below. Doesn't make any sense without priest magic, though.
        -- TODO needs adjustment.
  --[[
        if User:getMagicType()== 0 and User:getMagicFlags(0)~= 0 then --a mage! Can't become priest 
          base.common.InformNLS(User,"Ein Magier kann leider kein Priester werden.","As a magician, you cannot become a priest anymore.");
        elseif User:getMagicType()== 2 and User:getMagicFlags(2)~= 0 then --a bard! Can't become priest
          base.common.InformNLS(User,"Ein Barde kann leider kein Priester werden.","As a bard, you cannot become a priest anymore.");
        elseif User:getMagicType()== 3 and User:getMagicFlags(3)~= 0 then --a druid! Can't become priest
          base.common.InformNLS(User,"Ein Druide kann leider kein Priester werden.","As a druid, you cannot become a priest anymore.");
        else --a noob, may become priest
          base.common.InformNLS(User,"Um ein Priester "..godName[thisGod].."s zu werden, werdet ihr folgendes opfern müssen:","To become a priest of "..godName[thisGod]..", you'll have to donate:");
          User:inform(tellStuff(priestItems[thisGod],User:getPlayerLanguage())); --stuff4priest
        end
  ]]
      elseif devotion ~= thisGod then
        -- devoted to another god
        if (priesthood == 0) then
          base.common.InformNLS(User,"Als Anhänger einer anderen Gottheit werdet ihr eurem Gott abschwören müssen, um euch "..content.gods.GOD_DE[thisGod].." zu weihen.","As devotee of another god, you'll have to abjure your god to devote yourself to "..content.gods.GOD_EN[thisGod]..".");
          base.common.InformNLS(User,"Um euch "..content.gods.GOD_DE[thisGod].." zu weihen, werdet ihr folgendes opfern müssen:","To devote yourself to "..content.gods.GOD_EN[thisGod]..", you'll have to donate:");
          User:inform(tellStuff(devoteItems[thisGod],User:getPlayerLanguage())); --stuff4devotee
        else
          base.common.InformNLS(User,"Als Priester einer anderen Gottheit müßtet ihr eurer Gottheit abschwören, um ein Priester "..content.gods.GOD_DE[thisGod].."s zu werden.","As priest of another god, you'll have to abjure your god to become a priest of "..content.gods.GOD_EN[thisGod]..".");
          base.common.InformNLS(User,"Um ein Priester "..content.gods.GOD_DE[thisGod].."s zu werden, werdet ihr folgendes opfern müssen:","To devote yourself to "..content.gods.GOD_EN[thisGod]..", you'll have to donate:");
          User:inform(tellStuff(devoteItems[thisGod],User:getPlayerLanguage())); --stuff4devotee
          User:inform(tellStuff(priestItems[thisGod],User:getPlayerLanguage())); --stuff4priest
        end
      end
    end -- younger gods
  end --dedicated altar
  world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end --function

function UseItem(User, SourceItem, TargetItem, counter, param, ltstate)
  thisGod=tonumber(SourceItem:getData("god"));
  
  if thisGod==nil then
    thisGod = 0;
  end;
  if init==nil or init==false then
    ini();
  end
  --Depending on who's altar that is and who uses it, execute different actions
  if thisGod==content.gods.GOD_NONE  or thisGod>content.gods.GOD_THEFIVE then --undedicated altar
    base.common.InformNLS(User,"Ihr berührt den Altar, die Abwesenheit göttlichen Wirkens ist offensichtlich.","You touch the altar, the absence of divine blessing is obvious.");
  elseif thisGod > content.gods.GOD_NONE then --dedicated altar
    base.lookat.SetSpecialName(Item,
    "Altar "..content.gods.GOD_DE[thisGod].."s, "..content.gods.DESCRIPTION_DE[thisGod]..".",
    "Altar of "..content.gods.GOD_EN[thisGod]..", the "..content.gods.DESCRIPTION_EN[thisGod]..".");
    
    if (thisGod > 5) then
      -- anything else is only for the younger gods
      
      --Now send the user some infos what he should do if he wants to become a devotee, change dedication or become a priest
      devotion=User:getQuestProgress(401);
      priesthood=User:getQuestProgress(402);
      --Check for corrupted status
      if priesthood ~= 0 and devotion ~= priesthood and User:getMagicType()== 1 then --Error! The character is a priest, but not a priest of "his" god!
        base.common.InformNLS(User,"[Fehler] Bitte informiere einen Entwickler. Der Priesterstatus deines Charakters ist fehlerhaft.","[Error] Please inform a developer, the priest status of your character is flawed.");
        return; --bailing out
      end
      --Error! The character is not a priest, but has a priest quest status! Or player uses priest magic but has no dedicated god!
      if (priesthood ~= 0 and User:getMagicType()~= 1) or (priesthood == 0 and User:getMagicType()== 1) then
        base.common.InformNLS(User,"[Fehler] Bitte informiere einen Entwickler. Der Priesterstatus deines Charakters ist fehlerhaft.","[Error] Please inform a developer, the priest status of your character is flawed.");
        return; --bailing out
      end
      --Check what the User is and send him instructions accordingly
      if (devotion == 0) then
        --a noob without a god
        if checkStuff(User,devoteItems[thisGod]) then
          deleteStuff(User,devoteItems[thisGod]);
          base.common.InformNLS(User,"Ihr empfangt den Segen "..content.gods.GOD_DE[thisGod].."s und weiht euer Leben dem Glaube an die Gottheit. Euer Opfer:","You receive the blessing of "..content.gods.GOD_EN[thisGod].." and devote your life to the faith in the divinity. Your donation:");
          world:gfx(16,User.pos);
          world:makeSound(13,User.pos);
          User:setQuestProgress(401,thisGod); --become devotee
          User:setQuestProgress(402,0); --the char was no priest before - must not be one afterwards
        else --does not have the stuff
          base.common.InformNLS(User,"Um euch "..content.gods.GOD_DE[thisGod].." zu weihen, werdet ihr folgendes opfern müssen:","To devote yourself to "..content.gods.GOD_EN[thisGod]..", you'll have to donate:");
        end
        User:inform(tellStuff(devoteItems[thisGod],User:getPlayerLanguage())); --stuff4devotee
      elseif (devotion == thisGod) then
        -- devoted to this god
        base.common.InformNLS(User,
        "Ihr betet zu "..content.gods.GOD_DE[thisGod].." und bekräftigt euren Glauben.",
        "You pray to "..content.gods.GOD_EN[thisGod].." and confirm your faith.");
        --Below, even more stuff that only makes sense with priest magic. Code makes devotees become priests.			 
        --[[
        if (priesthood == 0) then
            if User:getMagicType()== 0 and User:getMagicFlags(0)~= 0 then --a mage! Can't become priest 
              base.common.InformNLS(User,"Ein Magier kann leider kein Priester werden.","As a magician, you cannot become a priest anymore.");
            elseif User:getMagicType()== 2 and User:getMagicFlags(2)~= 0 then --a bard! Can't become priest
              base.common.InformNLS(User,"Ein Barde kann leider kein Priester werden.","As a bard, you cannot become a priest anymore.");
            elseif User:getMagicType()== 3 and User:getMagicFlags(3)~= 0 then --a druid! Can't become priest
              base.common.InformNLS(User,"Ein Druide kann leider kein Priester werden.","As a druid, you cannot become a priest anymore.");
            else --a noob, may become priest
              if checkAudience(thisGod,User.pos) then
                if checkStuff(User,priestItems[thisGod]) then
                  deleteStuff(User,priestItems[thisGod]);
                  base.common.InformNLS(User,"Ihr empfangt die Weihe eines Priesters "..godName[thisGod].."s. Euer Opfer:","You receive the ordination to the priesthood of "..godName[thisGod]..". Your donation:");
                  world:gfx(31,User.pos);
                  world:makeSound(13,User.pos);
                  User:setQuestProgress(402,thisGod); --become priest of this god
                  User:setMagicType(1);
                  User:teachMagic(1,1); --priest runes
                  User:teachMagic(1,2);
                  User:teachMagic(1,3); 
                else --does not have the stuff
                  base.common.InformNLS(User,"Um ein Priester "..godName[thisGod].."s zu werden, werdet ihr folgendes opfern müssen:","To become a priest of "..godName[thisGod]..", you'll have to donate:");
                end --item check
                User:inform(tellStuff(priestItems[thisGod],User:getPlayerLanguage())); --stuff4priest
              else --not enough devotees around
                base.common.InformNLS(User,"Um die Priesterweihe zu empfangen müßt ihr wenigstens drei Anhänger "..godName[thisGod].."s zu einer Messe versammeln.","To receive the ordination to the priesthood of "..godName[thisGod]..", you'll have to gather at least three devotees for a mass.");
              end --audience check
            end --noob
        end
        --]]
      elseif devotion ~= thisGod then
        -- devoted to another god
        if (priesthood == 0) then
          if checkStuff(User,devoteItems[thisGod]) then
            deleteStuff(User,devoteItems[thisGod]);
            base.common.InformNLS(User,"Ihr empfangt den Segen "..content.gods.GOD_DE[thisGod].."s und weiht euer Leben dem Glaube an die Gottheit. Euer Opfer:","You receive the blessing of "..content.gods.GOD_EN[thisGod].." and devote your life to the faith in the divinity. Your donation:");                 world:gfx(16,User.pos);
            world:makeSound(13,User.pos);
            User:setQuestProgress(401,thisGod); --become devotee
            User:setQuestProgress(402,0); --the char was no priest before - must not be one afterwards
          else --does not have the stuff
            base.common.InformNLS(User,"Um euch "..content.gods.GOD_DE[thisGod].." zu weihen, werdet ihr folgendes opfern müssen:","To devote yourself to "..content.gods.GOD_EN[thisGod]..", you'll have to donate:");
          end
          User:inform(tellStuff(devoteItems[thisGod],User:getPlayerLanguage())); --stuff4devotee
        else
        base.common.InformNLS(User,
        "[INFO] An dieser Stelle könntest du Priester werden, aber Priestermagie ist noch nicht verfügbar.",
        "[INFO] At this point you could become a priest, but priest magic is not available yet.");
        -- useless without priest magic
        --[[
          if checkAudience(thisGod,User.pos) then
            if checkStuff(User,devoteItems[thisGod]) and checkStuff(User,priestItems[thisGod]) then
              deleteStuff(User,devoteItems[thisGod]);
              base.common.InformNLS(User,"Ihr schwört eurem alten Glauben ab und empfangt die Weihe eines Priesters "..godName[thisGod].."s. Euer Opfer:","You abjure your old faith and receive the ordination to the priesthood of "..godName[thisGod]..". Your donation:");
              world:gfx(16,User.pos);
              world:makeSound(13,User.pos);
              User:setQuestProgress(401,thisGod); --become devotee of this god
              User:setQuestProgress(402,thisGod); --become priest of this god
          
            else --does not have the stuff
              base.common.InformNLS(User,"Um ein Priester "..godName[thisGod].."s zu werden, werdet ihr folgendes opfern müssen:","To become a  priest of "..godName[thisGod]..", you'll have to donate:");
            end
          else --not enough devotees around
            base.common.InformNLS(User,"Um die Priesterweihe zu empfangen müßt ihr wenigstens drei Anhänger "..godName[thisGod].."s zu einer Messe versammeln.","To receive the ordination to the priesthood of "..godName[thisGod]..", you'll have to gather at least three devotees for a mass.");
          end --audience check
          User:inform(tellStuff(devoteItems[thisGod],User:getPlayerLanguage())); --stuff4devotee
          User:inform(tellStuff(priestItems[thisGod],User:getPlayerLanguage())); --stuff4priest
          --]]
        end
      end
    else
      -- elder gods
      base.common.InformNLS(User,
      "Du kannst kein Anhänger der alten Götter werden.",
      "You cannot become a devotee of the elder gods.");
    end
  end --dedicated altar
end --function

function tellStuff(list,lang)
  local text="";
  text=text..world:getItemName(list[1],lang);
  for i=2,table.getn(list) do
    text=text..", ";
    text=text..world:getItemName(list[i],lang);
  end
  return text;
end

function checkStuff(User,list)
  for i=1,table.getn(list) do
    if User:countItem(list[i])<1 then
      return false;
    end
  end
  return true;
end

function deleteStuff(User,list)
  for i=1,table.getn(list) do
    User:eraseItem(list[i],1);
  end
end

function checkAudience(god, position)
  local theCandidates=world:getPlayersInRangeOf(position,10);
  local counter=0; 
  for i=1,table.getn(theCandidates) do
    candidate=theCandidate[i];
    if candidate:getQuestProgress(401) == god then
      counter=counter+1;
    end
  end
  if counter>3 then --I need three other characters with the same devotion around
    return true;
  else
    return false;
  end
end
