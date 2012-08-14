require("base.common")
module("lte.tying_capturer", package.seeall)
--[[ LTE 26
     tying up: capturer
    @value Captive - id of the char that is tied up
    @value escape - time (in 1/2 seconds) left until next check for escape attempt
    @value logout - set when captive is disappeared
]]

function addEffect( Tying, Capturer )
	
	-- nothing
end

function callEffect( Tying, Capturer )
	
	local foundEscape, escape = Tying:findValue("escape");
	local foundLogout = Tying:findValue("logout");
	local foundCaptive, Captive = Tying:findValue("Captive");
	Tying.nextCalled = 5;
	
	if foundCaptive then
		Captive = IsCharidInRangeOf(Captive,Capturer.pos,5);
		if Captive then
			if Captive:getRace() == 13 then
				InformW(Capturer,
					"Du bindest den Gefangenen los.",
					"You untie the captive.");
				return false;
			end
			
			-- ## BEGIN ## reappeared captive
			if foundLogout then
				Tying:removeValue("logout");
				local foundEffect = Captive.effects:find(24);
				if not foundEffect then
					InformW(Capturer,
						"Der Gefangene ist nicht mehr gefesselt.",
						"The captive isn't tied up any more.")
					return false;
				end
				if HasEnoughCapturers(Captive,Capturer.id) then
					InformW(Capturer,
						"Der Gefangene ist nun ausreichend gefesselt.",
						"The captive is now adequately tied up.")
					return false;
				else
					InformW(Capturer,
						"Du hast den Gefangenen wiedergefunden.",
						"You have found the captive.");
				end
			end
			-- ## END ## reappeared captive
			
			-- ## BEGIN ## rope handling
			if not foundLogout then
				local Rope = GetRope(Capturer);
				if not Rope then
					Capturer:inform("[Error] No rope found. Please inform a developer.",Player.mediumPriority);
					return false;
				end
				if Tying.numberCalled == 0 then -- first call (set in I_2760_seil.lua), calculate duration
					local AttribOffset = GetBestAttribOffset(Capturer,Captive,{"strength","dexterity"});
					local Quality = math.min(1200,120+math.random(55,65)*AttribOffset);
					Rope.quality = (Quality*2)+100; -- *2 -> nextCalled = 5. Duration min=2minutes max=20minutes
				elseif Rope.quality == 100 then -- break rope
					Capturer:talkLanguage(Character.say,Player.german,"#mes Seil zerreißt, es wurde wohl zu lange belastet.");
					Capturer:talkLanguage(Character.say,Player.english,"#me's rope is torn, it has been used for too long apparently.");
					world:erase(Rope,1);
					return false;
				else
					Rope.quality = Rope.quality-1; -- count down the duration
				end
				world:changeItem(Rope);
			end
			-- ## END ## rope handling
			
			-- ## BEGIN ## escape algorithm for leading capturer
			local foundEffect, TyingCaptive = Captive.effects:find(24);
			if foundEffect then
				local foundCapturer, CapturerId = TyingCaptive:findValue("Capturer");
				if foundCapturer then
					if CapturerId == Capturer.id then
						local addVal = math.random(30,60); -- next escape cycle
						if foundEscape then
							if escape == 0 then -- cycle is over, check for escape
								local AttribOffset = GetBestAttribOffset(Captive,Capturer,{"strength","dexterity","agility"});
								-- can the captive escape?
								local perc = Capturer:increaseAttrib("perception",0);
								local tellEscape = false;
								if ( math.random(100) < math.min(20,AttribOffset) ) then
									-- yes he can! add escape time for captive
									TyingCaptive:addValue("escape",addVal);
									-- do we notice something strange?
									if math.random(50) <= math.min(20,perc) then
										tellEscape = true;
									end
								else -- no, he cannot... but do we notice something strange nevertheless?
									if math.random(100) > 80+perc then
										tellEscape = true;
									end
								end
								if tellEscape then
									InformW(Capturer,
										"Du spürst einen ungewöhnlichen Zug auf dem Seil. Ob das ein Fluchtversuch sein kann?",
										"You feel an unusual pull on the rope. Could that be an escape attempt?");
								end
							else -- count down escape cycle time
								addVal = escape-1;
							end
						end
						Tying:addValue("escape",addVal); -- and save our escape cycle time
					end
				end
			end
			-- ## END ## escape algorithm for leading capturer
			return true;
		end
		
		-- no captive near
		local foundLogout = Tying:findValue("logout");
		if not foundLogout then -- first call after captive disappeared, inform player
			InformW(Capturer,
				"Der Gefangene ist nicht mehr bei dir! Warte oder suche ihn oder benutze das Seil, um ihn freizulassen.",
				"The captive isn't near you any more! Wait, search or use the rope to release the captive.");
			Tying:addValue("logout",1);
		end
		return true;
	end
	return false;
end

function removeEffect( Tying, Capturer )
	
	local rope = GetRope(Capturer);
	if rope then
		local eraseIt = true;
		local qual = rope.quality;
		qual = ((qual-100)/2);
		if qual <= 450 then
			if math.random(500) < qual then
				eraseIt = false;
			end
		elseif math.random(10) > 1 then
			eraseIt = false;
		end
		if eraseIt then
			world:erase(rope,1);
			InformW(Capturer,
				"Das Seil zerreißt.",
				"The rope breaks.");
		else
			rope.data = 0;
			rope.quality = 333;
			world:changeItem(rope);
		end
	end
end

function loadEffect( Tying, Capturer )
	
	Tying:removeValue("logout");
end

-- ===============================
-- Additional functions
-- ===============================

--[[ 
    IsCharidInRangeOf
    check if a Character with a certain ID is in range of a position
    @param integer - ID of the Character that shall be found
    @param PositionStruct - center position of the crcle that shall be checked
    @param integer - radius of the circle that shall be checked
    @return CaptiveStruct - the Character if he was found, false if not found
]]
function IsCharidInRangeOf( CharID, Position, Range )
	
	CharID = CharID+1-1;
	local CharList = world:getCharactersInRangeOf(Position,Range);
	for i,Char in pairs(CharList) do
		if Char.id == CharID and Char.pos.z == Position.z then
			return Char;
		end
	end
	return nil;
end

--[[ Compare all attribs in AttribList from Char1 and Char2.
Return the best (highest) Offset for Char1, at least 0.
]]
function GetBestAttribOffset( Char1, Char2, AttribList )
	
	local bestOffset = 0;
	local currentOffset;
	local cnt;
	local addVal = 0;
	for cnt in pairs(AttribList) do
		currentOffset = Char1:increaseAttrib(AttribList[cnt],0) - Char2:increaseAttrib(AttribList[cnt],0);
		if currentOffset > bestOffset then
			bestOffset = currentOffset;
		end
		addVal = addVal + currentOffset;
	end
	return math.max(bestOffset,addVal);
end

function InformW( User, textInDe, textInEn )
    User:inform(base.common.GetNLS( User, textInDe, textInEn ),Player.mediumPriority);
end

function GetRope( Character )
	
	local Rope = Character:getItemAt(5);
	if not ( Rope.id == 2760 and Rope.data == 1 ) then
		Rope = Character:getItemAt(6);
		if not ( Rope.id == 2760 and Rope.data == 1 ) then
			return nil;
		end
	end
	return Rope;
end

function HasEnoughCapturers( Character, excludedId )
	
	local limit = 2;
	local retVal = 0;
	local CharList = world:getCharactersInRangeOf(Character.pos,5);
	local found;
	local effect;
	local captiveId;
	if not excludedId then
		excludedId = -1;
	end
	for i,Char in pairs(CharList) do
		if excludedId ~= Char.id and Char.pos.z == Character.pos.z then
			found, effect = Char.effects:find(26);
			if found then
				found, captiveId = effect:findValue("Captive");
				if found then
					if captiveId == Character.id then
						retVal = retVal+1;
					end
				end
			end
		end
	end
	return (retVal >= limit);
end
