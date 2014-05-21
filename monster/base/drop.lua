--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
require("base.common")
require("base.messages")
require("base.lookat")

module("monster.base.drop", package.seeall)

function ClearDropping()
    SelItemValue={};
    Catsdone={};
end

function AddDropItem(ItemID,Amount,Prob,Qual,DataValue,Category)
    if( Amount == nil ) then
        return false;
    elseif (Amount>0) then
        if (Catsdone[Category]~=true) then
            Catsdone[Category]=true;
            gesProb=0;
            CatTry=math.random(100);
        end
        if ((CatTry>gesProb) and (CatTry<=gesProb+Prob)) then
            if (Qual < 101) then
                Qual = Qual + 100;
            end
            table.insert(SelItemValue,{ItemID,Amount,Qual,DataValue});
            return true;
        end
        gesProb=gesProb+Prob;
    end
    return false;
end

function RareArmours(Item)

	local rand = math.random();

	--The chances for an uncommon, rare or exceptional drop
	local uncommondrop = 1/100;
	local raredrop = 1/1000;
	local exceptionaldrop = 1/10000;


	--The probabilities should be independent of each other, so they have to divide by the probability so far.
	local chanceofraredrop=uncommondrop+raredrop/(1-uncommondrop);
	local chanceofexceptionaldrop=chanceofraredrop+exceptionaldrop/(1-chanceofraredrop);

	if(rand<uncommondrop) then
		Item:setData("RareArmour", -1);
		base.lookat.SetSpecialDescription(Item, "This appears to be an uncommon artifact. You should get it repaired by a smith before you use it.", "This appears to be an uncommon artifact. You should get it repaired by a smith before you use it.");
		base.lookat.SetSpecialName(Item, "Broken Artifact","Broken Artifact")
		base.lookat.SetItemRareness(Item,ItemLookAt.uncommonItem);
		world:changeItem(Item);
	elseif(rand<chanceofraredrop) then
		Item:setData("RareArmour", -2);
		base.lookat.SetSpecialDescription(Item, "This appears to be a rare artifact. You should get it repaired by a smith before you use it.", "This appears to be a rare artifact. You should get it repaired by a smith before you use it.");
		base.lookat.SetSpecialName(Item, "Broken Artifact","Broken Artifact")
		base.lookat.SetItemRareness(Item,ItemLookAt.rareItem);
		world:changeItem(Item);
	elseif(rand<chanceofexceptionaldrop) then
		Item:setData("RareArmour", -3);
		base.lookat.SetSpecialDescription(Item, "This appears to be an exceptional artifact. You should get it repaired by a smith before you use it.", "This appears to be an exceptional artifact. You should get it repaired by a smith before you use it.");
		base.lookat.SetSpecialName(Item, "Broken Artifact","Broken Artifact")
		base.lookat.SetItemRareness(Item,ItemLookAt.epicItem);
		world:changeItem(Item);
	end

end

function RareWeapons(Item)

	local rand = math.random();

	--The chances for an uncommon, rare or exceptional drop
	local uncommondrop = 1/100;
	local raredrop = 1/1000;
	--local exceptionaldrop = 1/10000;
	local exceptionaldrop = 1/2;

	--The probabilities should be independent of each other, so they have to divide by the probability so far.
	local chanceofraredrop=uncommondrop+raredrop/(1-uncommondrop);
	local chanceofexceptionaldrop=chanceofraredrop+exceptionaldrop/(1-chanceofraredrop);

	if(rand<uncommondrop) then
		Item:setData("RareWeapon", -1);
		base.lookat.SetSpecialDescription(Item, "This appears to be an uncommon artifact. You should get it repaired by a smith before you use it.", "This appears to be an uncommon artifact. You should get it repaired by a smith before you use it.");
		base.lookat.SetSpecialName(Item, "Broken Artifact","Broken Artifact")
		base.lookat.SetItemRareness(Item,ItemLookAt.uncommonItem);
		world:changeItem(Item);
	elseif(rand<chanceofraredrop) then
		Item:setData("RareWeapon", -2);
		base.lookat.SetSpecialDescription(Item, "This appears to be a rare artifact. You should get it repaired by a smith before you use it.", "This appears to be a rare artifact. You should get it repaired by a smith before you use it.");
		base.lookat.SetSpecialName(Item, "Broken Artifact","Broken Artifact")
		base.lookat.SetItemRareness(Item,ItemLookAt.rareItem);
		world:changeItem(Item);
	elseif(rand<chanceofexceptionaldrop) then
		Item:setData("RareWeapon", -3);
		base.lookat.SetSpecialDescription(Item, "This appears to be an exceptional artifact. You should get it repaired by a smith before you use it.", "This appears to be an exceptional artifact. You should get it repaired by a smith before you use it.");
		base.lookat.SetSpecialName(Item, "Broken Artifact","Broken Artifact")
		base.lookat.SetItemRareness(Item,ItemLookAt.epicItem);
		world:changeItem(Item);
	end

end

function Dropping(Char)
    if ((dropped == nil) or (dropped ~= Char.id)) then
        dropped = Char.id;
        first = true
    elseif (dropped == Char.id) then
        first = false;
    end

    if first then
        if (table.getn(SelItemValue)>0) then
            for i,values in pairs(SelItemValue) do
                if ( values[1] ~= nil ) and ( values[2] ~= nil ) and ( values[3] ~= nil ) then
				    if values[4] == 0 then
					    values[4] = nil; --catching "old" data values
					end
                    Item=world:createItemFromId(values[1],values[2],Char.pos,true,values[3], values[4]) -- Do not create items with old data

					--This will become the rare artifacts system
					--[[if isTestserver() then
						local armourfound, armour;
						armourfound, armour = world:getArmorStruct(values[1]);
						local weaponfound, weapon;
						weaponfound, weapon = world:getWeaponStruct(values[1]);

						if armourfound then
							RareArmours(Item);
						elseif weaponfound then
							RareWeapons(Item);
						end
					end;]]

					-- values[1]=ID, values[2]=amount, values[3]=quality, values[4]=data
                end
            end
        end
        local checkItems = {61,293,294,64,549,322,237,1266,3076,3077}; --ffs use comments! ~Estralis
        for i,CheckItemItemid in pairs(checkItems) do
            ItemCnt = Char:countItem(CheckItemItemid);
            if (ItemCnt > 0) then
                world:createItemFromId(CheckItemItemid,ItemCnt,Char.pos,true,222,nil);
            end
        end
    end
end


--[[ function CastMonMagic(
	Monster = The Monster casting
	Enemy = The Target
	rndTry = 1 : rndTry (number) chance of spell being casted
	DamageRange = { min Dmg, max Dmg}
	Effect = { { EffectGfx, EffectSound} { Effect2} etc. }
	Item = { ID, min qualy,max qualy, data, wear }, {Item2} etc... Creates an item on EnemyPosition (Flamewall, etc.)
	AP = Action Points, reduction of movepoints because of casting
	LineOfFlight = Gfx that is shown on the Line between Monster and Target 1= puff of smoke all the way
	CastingTry = {minSkill, maxSkill} Skillbounds for Monster Casting, influence Damage Output, Sucess against Mag Resi of player etc.]]

function CastMonMagic(Monster,Enemy,rndTry,DamageRange,Effect,Item,AP,LineOfFlight,CastingTry)
-- Disabled this shit with it's 1000 parameters where all sorts of junk is passed in.
-- Unless someone rewrites it in a clean way, I _will_ soon delete this for good! -- vilarion

--[[
    if (math.random(1,rndTry)==1) and (Monster.pos.z==Enemy.pos.z) then
        local EffectTry=math.random(1,table.getn(Effect)+table.getn(Item));
        if ( EffectTry > table.getn(Effect) ) then
            base.common.CreateLine(Monster.pos,Enemy.pos, function( targetPos )
                if world:isCharacterOnField( targetPos ) then
                    if world:isItemOnField( targetPos ) then
                        local foundItem = world:getItemOnField( targetPos );
                        if ( foundItem.id == Item[EffectTry-table.getn(Effect)][1] ) then
                            foundItem.quality = math.min( Item[EffectTry-table.getn(Effect)][3], foundItem.quality + Item[EffectTry-table.getn(Effect)][2] );
                            return false;
                        end
                    end
                    world:createItemFromId(Item[EffectTry-table.getn(Effect)][1],1,targetPos,true,math.random(Item[EffectTry-table.getn(Effect)][2],Item[EffectTry-table.getn(Effect)][3]),Item[EffectTry-table.getn(Effect)][4]);
                    if ( Item[EffectTry-table.getn(Effect)][5] > 0 ) then
                        world:makeSound(Item[EffectTry-table.getn(Effect)][5],targetPos);
                    end
                    return false;
                end
                world:gfx( LineOfFlight, targetPos );
                return true;
            end );
			base.common.TalkNLS( Monster, Character.say,
			"#me murmelt eine mystische Formel.",
			"#me mumbles a mystical formula.");
            Monster.movepoints=Monster.movepoints-AP;
            return true;
        else
            base.common.CreateLine(Monster.pos,Enemy.pos, function( targetPos )
                if world:isCharacterOnField( targetPos ) then
                    local Enemy = world:getCharacterOnField( targetPos );
                    local CastTry = math.random(CastingTry[1],CastingTry[2]) - SpellResistence( Enemy );
                    CastTry = ( CastTry - CastingTry[1] ) / ( CastingTry[2] - CastingTry[1] ) * 100;
                    local Damage = base.common.ScaleUnlimited( DamageRange[1], DamageRange[2], CastTry );
                    if Damage > 0 then
                        Enemy:increaseAttrib("hitpoints",-Damage);

                        if ( Effect[EffectTry][1] > 0 ) then
                            world:gfx(Effect[EffectTry][1],targetPos);
                        end
                    else
                        if ( Effect[EffectTry][1] > 0 ) then
                            world:gfx(12,targetPos);
                        end
                    end
                    if ( Effect[EffectTry][2] > 0 ) then
                        world:makeSound(Effect[EffectTry][2],targetPos);
                    end
                    return false;
                end;
                world:gfx( LineOfFlight, targetPos );
                return true;
            end );
			base.common.TalkNLS( Monster, Character.say,
			"#me murmelt eine mystische Formel.",
			"#me mumbles a mystical formula.");
            Monster.movepoints=Monster.movepoints-AP;
            return true;
        end
    end
--]]
    return false;
end




--Addition by Estralis: A function that makes a monster speak a random message

function MonsterRandomTalk(Monster,msgs)

    if (math.random(1,300) == 1 ) then --once each 5 minutes (300) in average a message is spoken

        Monster:increaseSkill(Character.commonLanguage,100-Monster:getSkill(Character.commonLanguage)); --if the monster could not talk, it can talk now

        germanMessage, englishMessage = msgs:getRandomMessage(); --choses a random message
        base.common.TalkNLS( Monster, Character.say, germanMessage, englishMessage ); --does the talking in both languages

    end

end

--Added by Faladrion: Preserving the GynkFire as a throwable monster weapon needs fixing :o

function ThrowMolotov(Monster,Enemy,rndTry,AP)
    if (math.random(1,rndTry)==1) and (Monster.pos.z==Enemy.pos.z) then --does not throw very often, half the frequency of casting monsters
        local hitPos=position( Enemy.pos.x+math.random(-2,2), Enemy.pos.y+math.random(-2,2), Enemy.pos.z );
        local distance = Monster:distanceMetricToPosition( hitPos );
        if ( distance < 3 ) then
            if( math.random(1,2) == 1 ) then
                hitPos.x = ( hitPos.x > 0 and hitPos.x + 3 - distance or hitPos.x - 3 + distance );
            else
                hitPos.y = ( hitPos.y > 0 and hitPos.y + 3 - distance or hitPos.y - 3 + distance );
            end
        end

        local Strength=math.random(55,88);
        local hitpoints;

        world:gfx(36,hitPos);
        HitChar(hitPos,base.common.Scale(3000,6000,Strength));
        world:makeSound(5,hitPos);
        hitpoints = base.common.Scale( 1000, 3000, Strength );
        base.common.CreateCircle( hitPos, 1, function( targetPos )
            world:gfx( 44, targetPos );
            HitChar( targetPos, hitpoints );
        end );
        hitpoints = base.common.Scale( 100, 500, Strength );
        base.common.CreateCircle( hitPos, 2, function( targetPos )
            world:gfx( 9, targetPos );
            HitChar( targetPos, hitpoints );
        end );
        hitpoints = base.common.Scale( 20, 100, Strength );
        base.common.CreateCircle( hitPos, 3, function( targetPos )
            world:gfx( 1, targetPos );
            HitChar( targetPos, hitpoints );
        end );

        Monster.movepoints=Monster.movepoints - AP;
        Monster:talk(Character.say, "#me schmeiﬂt eine weiﬂe Flasche nach "..Enemy.name..".", "#me tosses a white bottle at "..Enemy.name..".")
		return false;
    end
    return true;
end

function HitChar(Posi,Hitpoints)
		if world:isCharacterOnField(Posi) then world:getCharacterOnField(Posi):increaseAttrib("hitpoints",-Hitpoints) end;
		end;

