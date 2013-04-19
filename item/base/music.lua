-- Standardskript für Instrumente
-- Nitram

require("base.common")

module("item.base.music", package.seeall)

TalkTexts={[Character.flute] = {}, [Character.lute] = {}, [Character.horn] = {}, [Character.harp] = {}, [Character.panpipe] = {}, [Character.drum] = {}};

function addTalkText(eText,gText, Skill)
    table.insert(TalkTexts[Skill],{eText,gText});
end

function PlayInstrument(User,Item,Skill)
    local Skl=User:getSkill(Skill);
    local Qual=math.floor(Item.quality/100);
    local PlayVal=base.common.Limit(math.floor((Skl+(Qual*5))/120*table.getn(TalkTexts[Skill])*(math.random(8,13)/10)),1,table.getn(TalkTexts[Skill]));
    User:talk(Character.say, TalkTexts[Skill][PlayVal][2], TalkTexts[Skill][PlayVal][1])
    User:learn(Skill,30,100)
	User.movepoints=User.movepoints-30;
end
