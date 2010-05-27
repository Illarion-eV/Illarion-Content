--ds_xx_sammelbehälter
--ein Behälter um Pflanzen stapelbar zu sammeln
--nebenfolge: Pflanzen erhalten eine gemeinsame, niedrige quality

--Original: Falk vom Wald
--Neufassung: Nitram

require("base.common")
require("druids.base.alchemy")
require("druids.base.plants")

module("druids.items.2952_plate", package.seeall(druids.base.alchemy), package.seeall(druids.base.plants))

-- UPDATE common SET com_script='druids.items.2952_plate' WHERE com_itemid = 2952;

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
	
    if (SourceItem.quality > 101 and SourceItem.data > 0) then  -- Es befinden sich Pflanzen auf dem Teller
        local basket_id = math.mod( SourceItem.data, 10000 );
        local basket_data = math.floor( SourceItem.data / 10000 );

        if (TargetItem.id ~= 0) then -- Es soll was eingelagert werden
            if (TargetItem.id == basket_id and TargetItem.data == basket_data) then -- Ist das Zeug was rein soll das selbe was schon drin ist?
                if (SourceItem.quality <= 32101) then -- voll bei 32000 Kräutern
                    SourceItem.quality = SourceItem.quality + 1;
                    world:changeItem( SourceItem );
					world:erase( TargetItem, 1 );
                    return;
                else
                    base.common.TempInformNLS( User,
                    "Der Behälter ist voll.",
                    "The basket is filled up." );
                    return;
                end
            else
                base.common.TempInformNLS( User,
                "In dem Behälter liegt schon eine andere Pflanze, du kannst nur die selbe Sorte mit dort rein legen.",
                "In the basket is another plant, you can only put in the same kind of plant." );
                return;
            end
        else -- es soll etwas rausgenommen werden
            local numberOut = math.min( Counter, SourceItem.quality - 101 );
            SourceItem.quality = SourceItem.quality - numberOut;
            world:changeItem( SourceItem );
            User:createItem( basket_id, numberOut, 111, basket_data );

            if (SourceItem.quality <= 101) then
                SourceItem.quality = 101;
                SourceItem.data = 0;
                world:changeItem( SourceItem );
            end
        end
    else -- Behälter ist leer
        if (TargetItem.id ~= 0) then -- Es soll was eingelagert werden
            if not (IsThatAPlant(TargetItem) or TargetItem.id == 157) then
                base.common.TempInformNLS( User,
                "Das kannst du nicht einlagern.",
                "You can't put this into a basket." );
                return;
            end
            world:erase( TargetItem, 1 );
            SourceItem.quality = 102;
            SourceItem.data = TargetItem.id + TargetItem.data * 10000;
            world:changeItem( SourceItem );
            return;
        else -- Es soll etwas rausgenommen werden
            base.common.TempInformNLS( User,
            "In dem Behälter ist nichts was du herausnehmen könntest.",
            "There is nothing in that basket you could take out." );
            return;
        end
    end
end

function LookAtItem( User, Item )
	
    if (Item.data == 0) then
        world:itemInform( User, Item, base.common.GetNLS( User, "Du siehst einen leeren ", "You see a empty " )
        .. world:getItemName( Item.id, User:getPlayerLanguage() ).."." );

    else
        local basket_id = math.mod( Item.data, 10000 );
        local basket_data = math.floor( Item.data / 10000 );


        local count = Item.quality-101;
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
        .. world:getItemName( Item.id, User:getPlayerLanguage() )
        .. base.common.GetNLS( User, " mit ", " with " )
        .. count .. " "
        .. itemName );
    end
end