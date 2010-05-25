--Strassenscript test
function useTile(user,pos,Counter,Param)
	user:talk(CCharacter.say,"Ich benutze eben ein Stra&szlig;entile");
end
function useTileWithCharacter(user,pos,targetchar,Counter,Param)
	user:talk(CCharacter.say,"Ich benutze ein Stra&szlig;enteil mit : " .. targetchar.name .. "!");
end
function useTileWithItem(user,pos,item,Counter,Param)
	user:talk(CCharacter.say,"Ich benutze ein Stra&szlig;enteil mit einem item der id: " .. item.id .. "!");
end
function useTileWithField(user,pos,targetpos,Counter,Param)
	user:talk(CCharacter.say,"Ich benutze ein Stra&szlig;enteil mit einen Feld an der Pos: " .. targetpos.x .. " " .. targetpos.y .. " " .. targetpos.z .. "!");
end
