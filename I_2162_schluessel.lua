-- update common set com_script='I_2162_schluessel.lua' where com_itemid=2162;

function InitializeKey()
    ItemId={};
    ItemQl={};
    ItemPb={};
    ItemNr={};
    
    AddChestItem(2757,010,10,  1);    
    AddChestItem(2757,260,20,  1);    
    AddChestItem(2757,499,40,  1);    
    AddChestItem(2757,799,50,  1);
    AddChestItem(3076,999,60,110);
    AddChestItem(3077,999,70,  2);  
    AddChestItem( 188,499,80,  1);
    AddChestItem( 324,899,85,  1);
    AddChestItem( 101,599,90,  1);
    AddChestItem( 186,480,95,  1);
    AddChestItem( 201,999,96,  1);
    AddChestItem( 224,999,97,  1);
    AddChestItem( 237,999,98,  1);    
    AddChestItem(2162,  1,99,  1);
end

function AddChestItem(ItemID,ItemQual,ItemProp,ItemAmm)
    table.insert(ItemId,ItemID);
    table.insert(ItemQl,ItemQual);
    table.insert(ItemPb,ItemProp);
    table.insert(ItemNr,ItemAmm);
end


function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if firstCallKey==nil then
        InitializeKey();
        firstCallKey=1;
    end
    if SourceItem.quality==1 and TargetItem.id==2830 and TargetItem.quality==1 then
        User:talk(CCharacter.say,"#me tries to open the chest with the key... and it opens.");
        ItemNumber=math.random(1,99);
        FoundItem=false;
        for i=1, table.getn(ItemId) do
            if (ItemNumber<=ItemPb[i] and FoundItem==false) then
                FoundItem=true;
                world:createItemFromId(ItemId[i],ItemNr[i],User.pos,true,ItemQl[i],0)
                world:erase(SourceItem,1);
                if i==14 then
                    j=math.random(1,table.getn(ItemId));
                    world:createItemFromId(ItemId[j],ItemNr[j],User.pos,true,ItemQl[j],0);
                end
            end
        end
    end
end