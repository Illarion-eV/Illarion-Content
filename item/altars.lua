-- UPDATE common SET com_script='item.altars' WHERE com_itemid IN (361,1879,1880,2801,2857,2872);
require("base.common")
require("content.gods")

module("item.altars", package.seeall, package.seeall(content.gods))

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
	god_feel=(math.random(1,50));
	if god_feel==1 then
	    base.common.InformNLS(User,
            "Du f�hlst dich ein wenig wohler.",
            "You feel better now.");
	elseif god_feel==2 then
	    base.common.InformNLS(User,
            "Der Stein wird warm unter denen H�nden.",
    	    "The stone become warmer under your hands.");
	elseif god_feel==3 then
	    base.common.InformNLS(User,
            "Du fühlst dich gl�cklicher.",
            "You feel more happy.");
	elseif god_feel==4 then
	    base.common.InformNLS(User,
            "Du fühlst dich spirituell gest�rkt.",
            "You feel spirituel stronger now.");
	elseif god_feel==5 then
		base.common.InformNLS(User,
			"Du hörst ein verr�cktes Lachen in der Ferne.",
			"You hear a maniac laughter far away.");
		world:makeSound(25,SourceItem.pos)
	else
		base.common.InformNLS(User,
			"Nichts passiert.",
			"Nothing happens.");
	end
	-- User:inform("moep-> "..PosGem[1]);
	-- User:inform("moep-> "..PosGem[2]);

	if SourceItem.data==666 then
		Intelligence=User:increaseAttrib("intelligence",0);
		User:inform("#w Deine Intelligenz ist: "..Intelligence);
	end 
end
