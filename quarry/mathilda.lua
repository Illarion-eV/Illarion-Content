module("npc.mathilda", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    if ( User:getPlayerLanguage()==0 ) then
         thisNPC:talk(Character.say, "Rede doch lieber mit mir anstatt mich zu begrapschen.");
    elseif ( User:getPlayerLanguage()==1 ) then
    thisNPC:talk(Character.say, "Talk to me instead of touching me, please.");
    end
end

function nextCycle()
     if cycCount==nil then
        cycCount=1;
        thisNPC:increaseSkill(1,"common language",100);
     else
     cycCount=cycCount+1;
        if cycCount==600 then
            cycCount=1;
            SmallTalk={};
            SmallTalk[1] = "I speak the new language, but I want to learn the old one, too.";
            SmallTalk[2] = "Don't be shy, I do not bite.";
            SmallTalk[3] = "Hello you, come over here, please.";
            SmallTalk[4] = "Isn't it a lovely day?";
            SmallTalk[5] = "I like conversations, would you mind talking to me a bit?";
            SmallTalk[6] = "Don't you want to tell me about yourself?";
            SmallTalk[7] = "Have you seen that temple? Impressive, isn't it?";
            SmallTalk[8] = "I like the smell of the fresh air here.";
            SmallTalk[9] = "The weather is good today, almost as good as yesterday.";
            SmallTalk[10] = "I hope it does not rain today.";
            value = math.random( table.getn(SmallTalk) );
            thisNPC:talk( SmallTalk[value] );
        end
    end
end

function receiveText(texttype, message, originator)
 -- printerr("from"..originator.name.."to"..thisNPC.name);

    if originator.id ~= thisNPC.id then                                                  --avoid talking to herself.
thisNPC:introduce(originator);
 if iniVar == nil then
       iniVar=1;
       thisNPC:increaseSkill(1,"common language",100);
       NpcTrig={};
       NpcAnsw={};
       NpcTrig[1]="[Hh]elp";
       NpcAnsw[1]="So, you require assistance? Let us talk about your problem. Do you want to talk about races, towns or gods, perhaps?";
       NpcTrig[2]="[Rr]ace";
       NpcAnsw[2]="Here on this island, many races dwell: Lizardmen, dwarves, humans, elves, halflings and orcs.";
       NpcTrig[3]="{Ll]izard";
       NpcAnsw[3]="Lizardmen are strange fellows, they can breath water and are smelling like fishes.";
       NpcTrig[4]="[Dd]warf";
       NpcAnsw[4]="Sturdy workers they are, the dwarves. Silverbrand is their town on this island.";
       NpcTrig[5]="[Dd]warves";
       NpcAnsw[5]="Sturdy workers they are, the dwarves. Silverbrand is their town on this island.";
       NpcTrig[6]="[Hh]uman";
       NpcAnsw[6]="Humans are usual guys, just like me. Most humans dwell in Varshikar or Troll's Bane.";
       NpcTrig[7]="[Ee]lf";
       NpcAnsw[7]="Elves are tall, talk much and love trees.";
       NpcTrig[8]="[Hh]alflings";
       NpcAnsw[8]="Halflings call themselves Hobbits. They are cute and have funny names. Most of them dwell in Greenbriar.";
       NpcTrig[9]="[Hh]obbits";
       NpcAnsw[9]="Halflings call themselves Hobbits. They are cute and have funny names. Most of them dwell in Greenbriar.";
       NpcTrig[10]="[Ee]lves";
       NpcAnsw[10]="Elves are tall, talk much and love trees.";
       NpcTrig[11]="[O]rc";
       NpcAnsw[11]="Orcs are strong and brave warriors, but honestly, I tend to avoid them.";
       NpcTrig[12]="[Ss]ilverbrand";
       NpcAnsw[12]="Silverbrand is the fortified dwarven town on this island. Tialdin is the king of the dwarves.";
       NpcTrig[13]="[Tt]ialdin";
       NpcAnsw[13]="King Tialdin rules the town of Silverbrand. He collects rings of every kind.";
       NpcTrig[14]="[Hh]ello";
       NpcAnsw[14]="Ah, hello, who are you?";
       NpcTrig[15]="[Gg]reet";
       NpcAnsw[15]="Greetings, what is your name, my friend?";
       NpcTrig[16]="[Nn]ame";
       NpcAnsw[16]="I am Mathilda. Let us talk a bit, will we?";
       NpcTrig[17]="[Ii]llarion";
       NpcAnsw[17]="This world is ruled by the gods, the eleven and the five.";
       NpcTrig[18]="[Gg]od";
       NpcAnsw[18]="There are many gods one can worship: Ushara, Brágon, Eldan, Tanora, Findari, Nargùn, Elara, Adron, Oldra, Cherga, Malachín, Irmorom, Sirani, Zhambra, Ronagan and ...Moshran.";
       NpcTrig[19]="[Uu]shara";
       NpcAnsw[19]="Ushara is the Goddess of Earth.";
       NpcTrig[20]="[Bb]r[aá]gon";
       NpcAnsw[20]="Brágon is the God of Fire.";
       NpcTrig[21]="[Ee]ldan";
       NpcAnsw[21]="Eldan is the God of Spirit.";
       NpcTrig[22]="[Tt]anora";
       NpcAnsw[22]="Tanora, also called Zelphia, is the Goddess of Water.";
       NpcTrig[23]="[Zz]elphia";
       NpcAnsw[23]="Zelphia, also called Tanora, is the Goddess of Water.";
       NpcTrig[24]="[Ff]indari";
       NpcAnsw[24]="Findari is the Goddess of Air.";
       NpcTrig[25]="[Nn]arg[uù]n";
       NpcAnsw[25]="Nargùn is the God of Chaos.";
       NpcTrig[26]="[Ee]lara";
       NpcAnsw[26]="Elara is the Goddess of Wisdom and Knowledge.";
       NpcTrig[27]="[Aa]dron";
       NpcAnsw[27]="Adron is the God of Festivities and Wine.";
       NpcTrig[28]="[Oo]ldra";
       NpcAnsw[28]="Oldra is the Goddess of Life and Fertility.";
       NpcTrig[29]="[Cc]erga";
       NpcAnsw[29]="Cherga is the Goddess of Spirits and the Underworld.";
       NpcTrig[30]="[Mm]alach[ií]n";
       NpcAnsw[30]="Malachín is the God of Battle and Hunting.";
       NpcTrig[31]="[Ii]rmorom";
       NpcAnsw[31]="Irmorom is the God of Trade and Craftsmanship.";
       NpcTrig[32]="[Ss]irani";
       NpcAnsw[32]="Sirani is the Goddess of Love and Pleasure.";
       NpcTrig[33]="[Zz]hambra";
       NpcAnsw[33]="Zhambra is the God of Friendship and Loyalty.";
       NpcTrig[34]="[Rr]onagan";
       NpcAnsw[34]="Ronagan is the God of Thieves and Shadows.";
       NpcTrig[35]="[Mm]oshran";
       NpcAnsw[35]="Moshran is the God of Blood and Bones. Usually, one does not speak out his name.";
       NpcTrig[36]="[Tt]roll's Bane";
       NpcAnsw[36]="Troll's Bane is the largest and oldest town on the island. It was founded by the first settlers.";
       NpcTrig[37]="[Gg]reembriar";
       NpcAnsw[37]="Greenbriar is the town of the halflings, famous for its cakes.";
       NpcTrig[38]="[Tt]own";
       NpcAnsw[38]="There are many towns on this island. The best known ones are Greenbriar, Silverbrand, Troll's Bane and Varshikar.";
       NpcTrig[39]="[Cc]it[yi]";
       NpcAnsw[39]="There are many towns on this island. The best known ones are Greenbriar, Silverbrand, Troll's Bane and Varshikar.";
       NpcTrig[40]="[Tt]rolls";
       NpcAnsw[40]="Troll's Bane is the largest and oldest town on the island. It was founded by the first settlers.";
       NpcTrig[41]="[Vv]arshikar";
       NpcAnsw[41]="Varshikar was once known as Northerot, kingdom of the evil Lord Darlok.";
        RandomTalk={};
        RandomTalk[1] = "Pardon? I was not listening."
        RandomTalk[2] = "I don't know what you mean."
        RandomTalk[3] = "What exactly do you want to tell me?"
        RandomTalk[4] = "Can you express yourself in a different way?"
        RandomTalk[5] = "What?!"
        RandomTalk[6] = "Can you use other words?"
        RandomTalk[7] = "I have no clue what you just told me."
        RandomTalk[8] = "Yes, indeed, I totally agree..."
        RandomTalk[9] = "Somehow, I cannot understand you."
        RandomTalk[10] = "Call me stupid, but I am obviously too dumb to get the meaning of your words."
        RandomTalk[11] = "Just what I wanted to say!"
        RandomTalk[12] = "Really? Are you sure?"
        RandomTalk[13] = "To be honest, I do not really care."
   end
   i=0;
   foundTrig=false;
   repeat
       i=i+1;
       if string.find(message,NpcTrig[i])~=nil then
           thisNPC:talk(Character.say, NpcAnsw[i]);
           foundTrig=true;
       end
   until (i==table.getn(NpcTrig) or foundTrig==true)
   if (foundTrig==false) then
        value = math.random( table.getn(RandomTalk) );
        thisNPC:talk( RandomTalk[value] );
   end
   end
end
