-- Tomate werfen

function onAttack(Attacker,Defender,AttackPos)
    if Attacker:isInRange(Defender,8) then
        if (base.common.IsLookingAt(Attacker,Defender.pos)) then
            Attacker:talkLanguage( CCharacter.say, CPlayer.german, "#me wirft eine Tomate.");
            Attacker:talkLanguage( CCharacter.say, CPlayer.english, "#me throws a tomato.");
            Attacker:increaseAtPos(AttackPos,-1);
            local AttSkill = Attacker:getSkill("distance weapons");
            local DefSkill = Defender:getSkill("dodge");

            if (noDodgeAreas == nil) then
                noDodgeAreas = {};
                -- Hier Gebiete einfügen in denen kein Dodge möglich ist.
                -- table.insert(noDodgeAreas,{x1,y1,z1,x2,y2,z2});
            end
            possDodge = true;
            if (table.getn(noDodgeAreas) > 0) then
                for i,Area in noDodgeAreas do
                    if ((Defender.pos.x >= math.min(Area[1],Area[4])) and (Defender.pos.x <= math.max(Area[1],Area[4])) and
                    (Defender.pos.y >= math.min(Area[2],Area[5])) and (Defender.pos.y <= math.max(Area[2],Area[5])) and
                    (Defender.pos.z >= math.min(Area[3],Area[6])) and (Defender.pos.z <= math.max(Area[3],Area[6]))) then
                        possDodge = false;
                    end
                end
            end
            if possDodge then
                if (math.random(1,100-math.floor(DefSkill/5)) == 1) then
                    Defender:talkLanguage( CCharacter.say, CPlayer.german, "#me weicht der Tomate aus.");
                    Defender:talkLanguage( CCharacter.say, CPlayer.english, "#me dodges the tomato.");
                    return
                end
            end
            HitAreaTry = math.random(1,20);
            Attacker.movepoints = Attacker.movepoints - 15;
            Defender.movepoints = Defender.movepoints - 20;
            if (HitAreaTry > 17) then
                Defender:talkLanguage( CCharacter.say, CPlayer.german, "#me wird von der Tomate im Gesicht getroffen.");
                Defender:talkLanguage( CCharacter.say, CPlayer.english, "#me gets hitted by the tomato into the face.");
            elseif (HitAreaTry > 10) then
                Defender:talkLanguage( CCharacter.say, CPlayer.german, "#me wird von der Tomate an die Brust getroffen.");
                Defender:talkLanguage( CCharacter.say, CPlayer.english, "#me gets hitted by the tomato against the chest.");
            elseif (HitAreaTry > 5) then
                if (math.random(1,2)==1) then
                    Defender:talkLanguage( CCharacter.say, CPlayer.german, "#me wird von der Tomate an den linken Arm getroffen.");
                    Defender:talkLanguage( CCharacter.say, CPlayer.english, "#me gets hitted by the tomato against the left arm.");
                else
                    Defender:talkLanguage( CCharacter.say, CPlayer.german, "#me wird von der Tomate an den rechten Arm getroffen.");
                    Defender:talkLanguage( CCharacter.say, CPlayer.english, "#me gets hitted by the tomato against the right arm.");
                end
            else
                if (math.random(1,2)==1) then
                    Defender:talkLanguage( CCharacter.say, CPlayer.german, "#me wird von der Tomate an den linken Bein getroffen.");
                    Defender:talkLanguage( CCharacter.say, CPlayer.english, "#me gets hitted by the tomato against the left leg.");
                else
                    Defender:talkLanguage( CCharacter.say, CPlayer.german, "#me wird von der Tomate an den rechten Bein getroffen.");
                    Defender:talkLanguage( CCharacter.say, CPlayer.english, "#me gets hitted by the tomato against the right leg.");
                end
            end
        end
    end
end

function base.common.IsLookingAt( User, Location )
    --User:inform( "Looking at object?" );

    -- no location, definitely not looking at
    if( Location == nil ) then
        return false;
    end

    local richtung = User:get_face_to(  )

    if   ( ( richtung == 0 ) and ( Location.y < User.pos.y ) ) or
    ( ( richtung == 2 ) and ( Location.x > User.pos.x ) ) or
    ( ( richtung == 4 ) and ( Location.y > User.pos.y ) ) or
    ( ( richtung == 6 ) and ( Location.x < User.pos.x ) ) then

        return true
    end

    return false
end -- function blickrichtung