function CharacterOnField(User)
    local SourceItem = world:getItemOnField(User.pos);
	
	if (SourceItem.data == 100) then -- used for THE LIBRARY quest
	
	User:warp(position(385,552,0))
	
	base.common.InformNLS(User,
      "Du findest dich an der Oberfläche wieder",
      "You find yourself back on the surface again." );
	
	end
	
end