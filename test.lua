function testing(zahl) 
  return zahl*2 
end 

function testingString(sstring)
    NewString="Eingesendeter String: "..sstring;
    return NewString
end

function testUser(User)
    User:inform("User übergeben");
end

function testingUser(Tpos)
    TChar=world:getCharacterOnField(Tpos);
    return TChar
end
