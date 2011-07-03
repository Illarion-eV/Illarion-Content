-- Questritual Dragon Cave
-- 
-- In work (Kadiya)
--

module("triggerfield.dragoncave", package.seeall)

function CharacterOnField(mindmage)    
    if ( (string.find( mindmage.lastSpokenText, "[Ww][Ii][Nn][Dd]") ~= nil) or (string.find( mindmage.lastSpokenText, "[Aa][Ii][Rr]") ~= nil) ) then -- Ritual starten
		find, RitualStatus = mindmage.effects:find(666);
		if not find then
	    	mindmage.effects:addEffect( LongTimeEffect(666,1) );
	    	-- mindmage:inform("moep->Effekt gesetzt.");
		else
	    	-- mindmage:inform("moep->Effekt bereits vorhanden.");
		end
	end
end

function MoveFromField( mindmage )
    find, RitualStatus = mindmage.effects:find(666);
    if find then
    	found, StatusIndex = RitualStatus:findValue("StatusIndex");
	if found then
	    RitualStatus:addValue("StatusIndex",10);
	    world:gfx(2,position(50,-328, -23));
	    world:gfx(2,position(48,-330, -23));
	    world:gfx(2,position(48,-326, -23));
	    world:gfx(2,position(46,-328, -23));
	    world:gfx(2,position(48,-328, -23));

	    world:gfx(32,position(50,-328, -23));
            world:gfx(32,position(48,-330, -23));
            world:gfx(32,position(48,-326, -23));
            world:gfx(32,position(46,-328, -23));
            world:gfx(32,position(48,-328, -23));
	end
    end

end


