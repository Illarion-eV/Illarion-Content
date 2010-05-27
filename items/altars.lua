-- UPDATE common SET com_script='items.altars' WHERE com_itemid IN (361,1879,1880,2801,2857,2872);
require("base.common")
require("content.gods")

module("items.altars", package.seeall(), package.seeall(content.gods))

function LookAtItem( User, Item )
     filepoint,errmsg=io.open("testserver","r");
            if (filepoint~=nil) then
              filepoint:seek("set");
              text = filepoint:read("*line");
              filepoint:close();
              User:inform("text:");
              User:inform(text);
            else
              User:inform("error:");
              User:inform(errmsg);
    end;

    local ret;
    if Item.data > 0 then
        if User:getPlayerLanguage() == 0 then
            if Item.data==GOD_THEFIVE or Item.data==GOD_THEDEVS then
				ret = "Altar der "..GOD_DE[Item.data];
			else
				ret = "Altar "..GOD_DE[Item.data] .."s";
			end
        else
            if Item.data==GOD_THEFIVE or Item.data==GOD_THEDEVS then
				ret = "Altar of the "..GOD_EN[Item.data];
			else
				ret = "Altar of "..GOD_EN[Item.data];
			end
        end;
        if User:get_race() == 5 then
            ret = string.gsub( ret, "Tanora", "Zshhel-pheey-arrr" );
        end;
    else
        ret = User:getPlayerLanguage() == 0 and "Ungeweihter Altar" or "Undedicated altar";
    end;
    world:itemInform( User, Item, ret );
end

function UseItem(User, SourceItem, TargetItem, Counter, param)
    -- An welchem Altar stehe ich und was brauche ich da für Edelsteine?
    --
    if SourceItem.data==1 then PosGem={45,283} 		-- Ushara   -> Smaragd, Schwarzstein        -> Data 1 (45,283)
    elseif SourceItem.data==2 then PosGem={46,283} 	-- Bragon   -> Rubin, Schwarzstein          -> Data 2 (46,283)
    elseif SourceItem.data==3 then PosGem={285,0} 	-- Eldan    -> Diamant                      -> Data 3 (285)
    elseif SourceItem.data==4 then PosGem={284,197} 	-- Tanora   -> Blaustein, Amethyst          -> Data 4 (284, 197)
    elseif SourceItem.data==5 then PosGem={198,197} 	-- Findari  -> Topas, Amethyst              -> Data 5 (198, 197)
    else PosGem={0,0} end
	

    -- Habe ich die richtigen Edelsteine und die richtige Anzahl in der Hand?
    --Wenn ja, dann Edelsteine upgraden
    --
    itemL = User:getItemAt(5);
    itemR = User:getItemAt(6);

    if ( itemL~=nil and ((itemL.id==PosGem[1]) or (itemL.id==PosGem[2])) and itemL.data>0 and itemL.data<10 and itemL.number==3) then
		-- Werden die Steine zerstört?
		--
		if destroyGem(itemL.data) then
			world:gfx(5,SourceItem.pos);
			world:gfx(37,SourceItem.pos);
			world:makeSound(24,SourceItem.pos);
			itemL.data = itemL.data + 1;
			itemL.number=itemL.number-2;
			world:changeItem( itemL );
		else 
			world:gfx(1,SourceItem.pos);
			world:makeSound(18,SourceItem.pos);
			User:inform("Die Edelsteine zerfallen zu Staub. Das hat wohl nicht geklappt...");
			world:erase(itemL,3);
			--itemL.number=itemL.number-3;
			--world:changeItem( itemL );
		end
    elseif ( itemR~=nil and ((itemR.id==PosGem[1]) or (itemR.id==PosGem[2])) and itemR.data>0 and itemR.data<10 and itemR.number==3) then
		-- Werden die Steine zerstört?
        --
		if destroyGem(itemR.data) then
			world:gfx(5,SourceItem.pos);
            world:gfx(37,SourceItem.pos);
			world:makeSound(24,SourceItem.pos);
			itemR.data = itemR.data + 1;
			itemR.number=itemR.number-2;
			world:changeItem( itemR );
		else
			world:gfx(1,SourceItem.pos);
			world:makeSound(18,SourceItem.pos)
			User:inform("Die Edelsteine zerfallen zu Staub. Das hat wohl nicht geklappt...");
			world:erase(itemR,3);
            --itemR.number=itemR.number-3;
            --world:changeItem( itemR );
		end
    else 
		god_feel=(math.random(1,50));
		if god_feel==1 then
		    base.common.InformNLS(User,
                "Du fühlst dich ein wenig wohler.",
                "You feel better now.");
		elseif god_feel==2 then
		    base.common.InformNLS(User,
                "Der Stein wird warm unter denen Händen.",
    	        "The stone become warmer under your hands.");
		elseif god_feel==3 then
		    base.common.InformNLS(User,
                "Du fühlst dich glücklicher.",
                "You feel more happy.");
		elseif god_feel==4 then
		    base.common.InformNLS(User,
                "Du fühlst dich spirituell gestärkt.",
                "You feel spirituel stronger now.");
		elseif god_feel==5 then
		    base.common.InformNLS(User,
                "Du hörst ein verrücktes Lachen in der Ferne.",
                "You hear a maniac laughter far away.");
			world:makeSound(25,SourceItem.pos)
		else
		    base.common.InformNLS(User,
            	"Nichts passiert.",
            	"Nothing happens.");
		end
    end
	-- User:inform("moep-> "..PosGem[1]);
	-- User:inform("moep-> "..PosGem[2]);

	if SourceItem.data==666 then
		Intelligence=User:increaseAttrib("intelligence",0);
		User:inform("#w Deine Intelligenz ist: "..Intelligence);
	end 
end

function destroyGem (gemData)
	-- 1 -> 2 =  0% fail
	-- 2 -> 3 =  0% fail
	-- 3 -> 4 =  0% fail
	-- 4 -> 5 = 10% fail
	-- 5 -> 6 = 20% fail
	-- 6 -> 7 = 30% fail
	-- 7 -> 8 = 40% fail
	-- 8 -> 9 = 50% fail
	-- 9 ->10 = 60% fail
	if ( (gemData==4) and (math.random(1,10)<=1) ) then
		return false;
	elseif ( (gemData==5) and (math.random(1,10)<=2) ) then
		return false;
	elseif ( (gemData==6) and (math.random(1,10)<=3) ) then
		return false;
	elseif ( (gemData==7) and (math.random(1,10)<=4) ) then
		return false;
	elseif ( (gemData==8) and (math.random(1,10)<=5) ) then
		return false;
	elseif ( (gemData==9) and (math.random(1,10)<=6) ) then
		return false;
	else
		return true;
	end
end
