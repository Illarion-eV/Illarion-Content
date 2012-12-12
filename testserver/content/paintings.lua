module("content.paintings", package.seeall)
--UNDER CONSTRUCTION by envi--
function InitPaintings()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

   
    ---------------- BILDER ----------------

    --AddPicture({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = east wall yellow picture
    -- 2 = east wall violett picture
    -- 3 = north wall blue picture
    -- 4 = east wall blue picture
    -- 5 = north wall sea picture
    -- 6 = east wall sea picture
    -- 7 = north wall wood picture
    -- 8 = east wall wood picture

    --[[--Cadomyr
    AddPicture({147,622,1},"","", 2,5); --flats
    AddPicture({147,616,1},"","", 4,5); --flats
    AddPicture({141,612,1},"","", 3,5); --flats
    AddPicture({145,608,1},"","", 1,5); --flats
    AddPicture({142,606,1},"","", 3,5); --flats
    AddPicture({144,604,0},"","", 4,5); --flats
    AddPicture({141,607,0},"","", 7,5); --flats
    AddPicture({139,613,0},"","", 3,5); --flats
    AddPicture({143,613,0},"","", 3,5); --flats]]--
    AddPicture({129,524,0},"Ein Mann liegt in seinem Bett. Er scheint sehr krank zu sein. Eine junge Frau sitzt neben ihm und hält seine Hand. Er reicht ihr eine Krone während sie in einem beinahe göttlichen Sonnenlicht schimmert. Unten rechts steht ein Datum: 32 AS.","A man is lying in his bed. He seems very sick. A young woman is sitting next to him and is holding one of his hands. He hands her a crown while she is shimmering in an almost divine sun light. At the bottom right is a date: 32 AS.", 7,5); --palace
    --AddPicture({130,518,0},"","", 5,5); --queens room
    --AddPicture({135,516,0},"","", 3,5); --queens room
    --AddPicture({138,516,0},"","", 3,5); --queens room
    AddPicture({117,579,0},"Das Bild zeigt stolze Ritter gewöhnliches Volk am Ende einer Wüste, in der Nähe von Bergen einen Palast bauen. Einer der Krieger hat einen langen Bart und trägt eine Krone. Er hält auch einen rot-weißen Banner. Unten rechts steht ein Datum: 16 BS.","The picture shows proud knights watching ordinary folk building a palace at the periphery of a desert close at a mountain. One of the knights has a long beard and wears a crown. He holds also a red-white banner. At the bottom right is a date: 16 BS.", 4,5); --taverne
    AddPicture({91,572,0},"Ein umzingelter rot-weiß gekleideter Ritter erhebt sein Schert um den Angriff von hunderten schwarz-gelb gekleideten Soldaten zu entgegnen. Andere tausende dieser Soldaten liegen herum. Sie scheinen Tod zu sein. Unten rechts steht ein Datum: 30 AS.","An outnumbered red-white dressed knight raises his sword to counter an attack of hundred black-yellow dressed soldiers. Other thousand of these soldiers lying around. They are probably dead. At the bottom right is a date: 30 AS.", 4,5); --inn
    AddPicture({91,574,0},"Das Bild zeigt rot-weiß gekleidete Ritter einen von einem offensichtlich mächtigen Ork-Schamanen geführten Ork-Stamm abschlachten. Dies findet in der Nähe eines hohen Berges statt, aus welchen glühendes Wasser herauskommt. Unten rechts steht: 19 AS.","The pictures shows how red-white dressed knights are slaughtering an orc-tribe leaded by an obviously powerful shaman. The action takes place close at a high mountain where glowing water comes out. At the bottom right is a date: 19 AS.", 4,5); --inn
    AddPicture({91,576,0},"Das Bild zeigt zwei Ritter im freundschaftlichen Kampf. Man sieht auch andere Leute sie beobachten und anfeuern. Große rot-weiße Banner am Dach des Gebäude schimmern in der Sonne. Unten rechts steht ein Datum: 6 AS.","The pictures shows two knights fighting each other with joy. You can also see other people who watching and cheering them. Big red-white banners on the roof of the building are shimmering in the sun. At the bottom right is a date: since 6 AS.", 4,5); --inn
    AddPicture({86,574,0},"Das Bild zeigt stolze, furchtlose Ritter gehen auf einen rot-weiß verzierten Schiff. Frauen stehen am Ufer und winken mit weißen Tüchern. Auch ein betender Priester ist zu sehen. Unten rechts steht ein Datum: 13 BS.","The pictures shows proud and fearless knights walking on red-white adorned ships. Women stay at the shore and waving white towels. There is also a priest on the picture who obviously prays. At the bottom right is a date: 13 BS.", 4,5); --inn
    AddPicture({91,581,1},"Ein rot-weiß gekleideter Ritter kniet auf  einem schwarz gekleideten Mann mit einem Zauberer Hut. Er hält triumphierend ein Schwert an die Kehle des Mannes. Leute unterschiedlicher Rassen beobachten und bejubeln den Ritter. Unten rechts steht: 0 AS.","A red-white dressed knight kneels in front of dark-dressed man with a wizard hat. The knights holds his sword triumphing at the throat of the man. Folk of different races are watching and celebrating the knight. At the bottom right is a date: 0 AS.", 4,5); --inn
    AddPicture({85,578,1},"Ritter mit Schwertern und rot-weißen Bannern schlachten einen Drachen ab, der sie mit Flammen einzudecken versucht während im Hintergrund blau-grau bekleidete Magier davon laufen mit einer Schatzkiste. Unten rechts steht ein Datum: 15 AS.","Knights with swords and red-white banners are slaughtering a dragon who tries to cover them with flames while in the background a group of blue-grey dressed mages running away with a treasure chest. At the bottom right is a date: 15 AS.", 5,5); --inn
    AddPicture({96,600,1},"Das Bild zeigt eine kleine Gruppe von rot-weiß gekleideten Rittern, die furchtlos hunderte von Banditen über einen großen Fluss durch die Wüste verfolgen. Unten rechts steht ein Datum: 22 AS.","The pictures shows a small group of red-white dressed knights chasing fearless hundreds of bandits over a big river in a desert. At the bottom right is a date: 22 AS.", 4,5); --building
    AddPicture({96,599,1},"Ein Ritter mit erhobenen Schwert und einem rot-weißen Schild beobachtet Arbeiter einen Hafen bauen während blau-graue Schiffe am Horizont verschwinden. Unten rechts steht ein Datum: 10 AS.","A knight with a raised blade and a red-white shield watches workers building a harbor while blue-grey ships disappearing at the horizon. At the bottom right is a date: 10 AS. ", 4,5); --building
    AddPicture({96,602,0},"Das Bild zeigt stolze Ritter gewöhnliches Volk am Ende einer Wüste, in der Nähe von Bergen einen Palast bauen. Einer der Krieger hat einen langen Bart und trägt eine Krone. Er hält auch einen rot-weißen Banner. Unten rechts steht ein Datum: 16 BS.","The picture shows proud knights watching ordinary folk building a palace at the periphery of a desert close at a mountain. One of the knights has a long beard and wears a crown. He holds also a red-white banner. At the bottom right is a date: 16 BS.", 4,5); --building
    AddPicture({100,611,1},"Das Bild zeigt einen Mann mit einer Krone auf seinem Kopf wie er ein kleines Baby, gekleidet in rot-weiße Kleider, hält. Unten rechts steht ein Datum: 3 AS.","The picture shows a man with a crown at his head holding a sleeping little baby, covered with red-white clothes. At the bottom right is a date: 3 AS.", 3,5); --building
    --[[--Eastland
    AddPicture({894,540,0},"","", 2,5); --Paddock Farm  ]]--
    --Galmair
    AddPicture({313,231,1},"Das Bild zeigt einen reich gekleideten Mann mit grauer Haut und Haar, der eine Schürze trägt und seinen großen goldenen Hammer gegen einen Ambos schwingt.","The painting shows a rich dressed gray skinned and haired man, who is wearing an apron and swings his big golden hammer at an anvil.", 4,5); --Irmoroms Temple
    AddPicture({313,233,1},"Das Bild zeigt einen reich gekleideten Zwerg mit grauer Haut und Haar, der eine Schürze trägt und seinen großen goldene Axt gegen einen Felsen schwingt.","The painting shows a rich dressed gray skinned and haired dwarf, who is wearing an apron and swings his big golden axe against a rock.", 4,5); --Irmoroms Temple
	--[[AddPicture({309,270,0},"","", 4,5); --Villa 'Goldvein'
    AddPicture({309,277,0},"","", 4,5); --Villa 'Goldvein'
    AddPicture({372,214,0},"","", 7,5); --Council Chamber
    AddPicture({370,214,0},"","", 7,5); --Council Chamber
    AddPicture({375,217,0},"","", 6,5); --Council Chamber
    AddPicture({363,217,0},"","", 5,5); --Council Chamber
    AddPicture({365,224,0},"","", 2,5); --Council Chamber
    AddPicture({419,210,-6},"","",1,5); --Cameo Pit
    AddPicture({419,215,-6},"","",2,5); --Cameo Pit
    AddPicture({434,220,-6},"","",3,5); --Cameo Pit
    AddPicture({429,227,-6},"","",5,5); --Cameo Pit
    AddPicture({433,232,-6},"","",2,5); --Cameo Pit
    AddPicture({435,237,-6},"","",1,5); --Cameo Pit
    AddPicture({428,236,-5},"","",5,5); --Cameo Pit
    AddPicture({433,236,-5},"","",5,5); --Cameo Pit
    AddPicture({436,238,-5},"","",4,5); --Cameo Pit
    AddPicture({436,239,-5},"","",4,5); --Cameo Pit
    AddPicture({433,227,-5},"","",3,5); --Cameo Pit
    AddPicture({433,228,-5},"","",8,5); --Cameo Pit
    AddPicture({428,227,-5},"","",7,5); --Cameo Pit
    AddPicture({437,222,-5},"","",4,5); --Cameo Pit
    AddPicture({437,221,-5},"","",4,5); --Cameo Pit
    AddPicture({422,210,-5},"","",4,5); --Cameo Pit
    AddPicture({411,227,-6},"","",5,5); --Cameo Pit
    AddPicture({416,227,-6},"","",7,5); --Cameo Pit
    AddPicture({417,235,-5},"","",4,5); --Cameo Pit
    AddPicture({417,229,-5},"","",4,5); --Cameo Pit
    AddPicture({394,337,-5},"","",1,5); --The Winged Sow Tavern
    AddPicture({394,333,-5},"","",6,5); --The Winged Sow Tavern
    --Galmair Hinterlands
    AddPicture({419,346,0},"","", 2,5); --Miners club
    AddPicture({416,296,0},"","", 7,5); --Sleepy Bujhaar Inn
    AddPicture({419,296,0},"","", 3,5); --Sleepy Bujhaar Inn
	AddPicture({421,293,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({426,293,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({426,291,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({423,289,1},"","", 3,5); --Sleepy Bujhaar Inn
	--Galmair Plateau
    AddPicture({318,357,1},"","", 1,5);
    AddPicture({318,359,1},"","", 2,5);
    --Runewick Harbour/Farm
	AddPicture({756,797,0},"","", 4,5); --Taverne "Quadruped Red Bird"
    --Runewick - Tower of Air
    AddPicture({910,833,4},"","", 2,5)
    AddPicture({910,835,4},"","", 1,5)
    AddPicture({898,834,4},"","", 2,5)
    AddPicture({898,836,4},"","", 1,5)
    AddPicture({897,830,4},"","", 4,5)
    AddPicture({906,837,3},"","", 2,5) --house of gods
    AddPicture({906,828,3},"","", 1,5) --house of gods
    AddPicture({910,832,3},"","", 4,5)
    AddPicture({897,830,2},"","", 4,5) --student dorm
    AddPicture({892,828,2},"","", 7,5) --student dorm
    AddPicture({903,833,2},"","", 5,5)
    AddPicture({907,830,2},"","", 5,5)
    AddPicture({904,818,1},"","", 4,5)
    AddPicture({904,822,1},"","", 4,5)
    AddPicture({912,831,1},"","", 3,5)
    AddPicture({917,831,1},"","", 3,5)
    AddPicture({897,831,1},"","", 4,5)
    --Runewick - Tower of Earth
    AddPicture({956,832,0},"","", 4,5) --Adron's barrel
    AddPicture({956,837,0},"","", 4,5) --Adron's barrel
    AddPicture({949,819,1},"","", 3,5)
    AddPicture({950,829,2},"","", 4,5)
    AddPicture({947,824,2},"","", 3,5)
    AddPicture({943,824,2},"","", 3,5)
    AddPicture({950,830,3},"","", 5,5)
    AddPicture({954,830,3},"","", 5,5)
    AddPicture({956,834,3},"","", 4,5)
    AddPicture({956,838,3},"","", 4,5)
    AddPicture({956,831,4},"","", 2,5)
    AddPicture({956,833,4},"","", 2,5)
    AddPicture({956,836,4},"","", 1,5)
    AddPicture({954,835,4},"","", 3,5)
    --Runewick - Tower of Fire
    AddPicture({904,778,1},"","", 4,5) --library
    AddPicture({909,761,1},"","", 3,5)
    AddPicture({911,761,1},"","", 3,5)
    AddPicture({915,761,1},"","", 3,5)
    AddPicture({917,761,1},"","", 3,5)
    AddPicture({921,761,1},"","", 3,5)
    AddPicture({923,761,1},"","", 3,5)
    AddPicture({896,756,2},"","", 3,5) --archmage's room
    AddPicture({901,762,2},"","", 4,5) --archmage's room
    AddPicture({910,770,2},"","", 4,5) --hall of elara
    AddPicture({910,774,2},"","", 1,5) --hall of elara
    AddPicture({911,782,2},"","", 1,5) --hall of elara
    AddPicture({898,766,4},"","", 3,5)
    AddPicture({901,766,4},"","", 3,5)
    AddPicture({900,777,4},"","", 3,5)
    AddPicture({899,777,4},"","", 3,5)
    --Runewick - Tower of Water
    AddPicture({949,754,4},"","", 4,5)
    AddPicture({949,755,4},"","", 4,5)
    AddPicture({953,765,4},"","", 1,5)
    AddPicture({953,766,4},"","", 2,5)
    AddPicture({944,763,4},"","", 3,5)
    AddPicture({948,753,3},"","", 1,5)
    AddPicture({948,755,3},"","", 8,5)
    AddPicture({948,757,3},"","", 2,5)
    AddPicture({952,764,3},"","", 5,5)
    --Spider's Mouth
    AddPicture({711,314,1},"","", 1,5); --The Hemp Necktie Inn
    AddPicture({708,316,1},"","", 7,5); --The Hemp Necktie Inn
    AddPicture({702,316,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({700,307,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({711,320,1},"","", 4,5); --The Hemp Necktie Inn
    AddPicture({705,326,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({700,318,1},"","", 3,5); --The Hemp Necktie Inn
	AddPicture({698,307,0},"","", 5,5); --The Hemp Necktie Inn
	AddPicture({711,324,0},"","", 4,5); --The Hemp Necktie Inn]]--

    
end

function AddPicture(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+20));
end


function CheckAndPlaceItem(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            world:createItemFromId(ItemID,1,Posi,true,333,nil);
        end
    else
        world:createItemFromId(ItemID,1,Posi,true,333,nil);
    end
end

function PrepareTables(TablePos)
    if (signCoo[TablePos] == nil) then
        signCoo[TablePos] = {};
        signTextDe[TablePos] = {};
        signTextEn[TablePos] = {};
        signPerception[TablePos] = {};
    end
end

-- DirToItemID converts item IDs into local type values for the Add functions to work with

function DirToItemID(Value)
    if (Value==21) then
        return 1914
    elseif (Value==22) then
        return 1915
    elseif (Value==23) then
        return 264
    elseif (Value==24) then
        return 265
    elseif (Value==25) then
        return 748
    elseif (Value==26) then
        return 749
    elseif (Value==27) then
        return 750
    elseif (Value==28) then
        return 751
	end
end
