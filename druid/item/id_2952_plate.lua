--ds_xx_sammelbeh�lter
--ein Beh�lter um Pflanzen stapelbar zu sammeln
--nebenfolge: Pflanzen erhalten eine gemeinsame, niedrige quality

--Original: Falk vom Wald
--Neufassung: Nitram

require("base.common")
require("druid.base.alchemy")
require("druid.base.plants")

module("druid.item.id_2952_plate", package.seeall(druid.base.alchemy), package.seeall(druid.base.plants))

-- UPDATE common SET com_script='druid.item.id_2952_plate' WHERE com_itemid = 2952;

function Sonderpflanzen(User,ItemID, ItemData, Lang)
	text=world:getItemName( ItemID, Lang )
	dummy = getDummyIDList()
	
	for i=1,16 do
		if dummy[i] == ItemData then
			if Lang == 0 then
				text = getDummyNameDE(i)
			else
				text = getDummyNameEN(i)
			end
		end
	end	
	return text
end


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	
    if (Sourceitem.id_quality > 101 and Sourceitem.id_data > 0) then  -- Es befinden sich Pflanzen auf dem Teller
        local basket_id = math.mod( Sourceitem.id_data, 10000 );
        local basket_data = math.floor( Sourceitem.id_data / 10000 );

        if (Targetitem.id_id ~= 0) then -- Es soll was eingelagert werden
            if (Targetitem.id_id == basket_id and Targetitem.id_data == basket_data) then -- Ist das Zeug was rein soll das selbe was schon drin ist?
                if (Sourceitem.id_quality <= 32101) then -- voll bei 32000 Kr�utern
                    Sourceitem.id_quality = Sourceitem.id_quality + 1;
                    world:changeItem( SourceItem );
					world:erase( TargetItem, 1 );
                    return;
                else
                    base.common.TempInformNLS( User,
                    "Der Beh�lter ist voll.",
                    "The basket is filled up." );
                    return;
                end
            else
                base.common.TempInformNLS( User,
                "In dem Beh�lter liegt schon eine andere Pflanze, du kannst nur die selbe Sorte mit dort rein legen.",
                "In the basket is another plant, you can only put in the same kind of plant." );
                return;
            end
        else -- es soll etwas rausgenommen werden
            local numberOut = math.min( Counter, Sourceitem.id_quality - 101 );
            Sourceitem.id_quality = Sourceitem.id_quality - numberOut;
            world:changeItem( SourceItem );
            User:createItem( basket_id, numberOut, 111, basket_data );

            if (Sourceitem.id_quality <= 101) then
                Sourceitem.id_quality = 101;
                Sourceitem.id_data = 0;
                world:changeItem( SourceItem );
            end
        end
    else -- Beh�lter ist leer
        if (Targetitem.id_id ~= 0) then -- Es soll was eingelagert werden
            if not (IsThatAPlant(TargetItem) or Targetitem.id_id == 157) then
                base.common.TempInformNLS( User,
                "Das kannst du nicht einlagern.",
                "You can't put this into a basket." );
                return;
            end
            world:erase( TargetItem, 1 );
            Sourceitem.id_quality = 102;
            Sourceitem.id_data = Targetitem.id_id + Targetitem.id_data * 10000;
            world:changeItem( SourceItem );
            return;
        else -- Es soll etwas rausgenommen werden
            base.common.TempInformNLS( User,
            "In dem Beh�lter ist nichts was du herausnehmen k�nntest.",
            "There is nothing in that basket you could take out." );
            return;
        end
    end
end

function LookAtItem( User, Item )
	
    if (item.id_data == 0) then
        world:itemInform( User, Item, base.common.GetNLS( User, "Du siehst einen leeren ", "You see a empty " )
        .. world:getItemName( item.id_id, User:getPlayerLanguage() ).."." );

    else
        local basket_id = math.mod( item.id_data, 10000 );
        local basket_data = math.floor( item.id_data / 10000 );


        local count = item.id_quality-101;
        if (count < 40) then
            count = count;
        elseif (count < 100) then
            count = base.common.GetNLS( User, "etwa ", "approximal " )..( math.floor( count / 10 ) * 10 );
        elseif (count < 1000) then
            count = base.common.GetNLS( User, "etwa ", "approximal " )..( math.floor( count / 100 ) * 100 );
        elseif (count < 10000) then
            count = base.common.GetNLS( User, "etwa ", "approximal " )..( math.floor( count / 500 ) * 500 );
        else
            count = base.common.GetNLS( User, "etwa ", "approximal " )..( math.floor( count / 5000 ) * 5000 );
        end

        --local itemName = world:getItemName( basket_id, Character:getPlayerLanguage() );
        local itemName = Sonderpflanzen(User,basket_id,basket_data,User:getPlayerLanguage())
        
        world:itemInform( User, Item,
           base.common.GetNLS( User, "Du siehst einen ", "You see a " )
        .. world:getItemName( item.id_id, User:getPlayerLanguage() )
        .. base.common.GetNLS( User, " mit ", " with " )
        .. count .. " "
        .. itemName );
    end
end