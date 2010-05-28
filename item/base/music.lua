-- Standartscript f�r Instrumente spielen
-- Nitram

require("base.common")

module("items.base.music", package.seeall)

TalkTexts={};

function addTalkText(eText,gText)
    table.insert(TalkTexts,{eText,gText});
end

function PlayInstrument(User,Item,Skill)
    local Skl=User:getSkill(Skill);
    local Qual=math.floor(Item.quality/100);
    local PlayVal=base.common.Limit(math.floor((Skl+(Qual*5))/120*table.getn(TalkTexts)*(math.random(8,13)/10)),1,table.getn(TalkTexts));
    User:talkLanguage( CCharacter.say, CPlayer.german, TalkTexts[PlayVal][2]);
    User:talkLanguage( CCharacter.say, CPlayer.english, TalkTexts[PlayVal][1]);
    User:learn(8,Skill,3,100);
end