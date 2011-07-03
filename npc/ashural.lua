-- INSERT INTO npc VALUES (nextval('npc_seq'),0,,,,0,false,'Flora','npc_flora.lua',1);
require("npc.base.autonpcfunctions")
module("npc.ashural", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end
    
    npc.base.autonpcfunctions.InitTalkLists();
    
    
    -- ********* START DYNAMIC PART ********
-- Queststats:
-- 1 - Does Player like flowers?
-- 2 - Player likes flower. Can he be asked a question?
-- 3 - Did Player ever see Night Angels Blossom?
-- 4 - Player asked to bring a Night Angels Blossom.
-- 5 - Player never seen a Night Angels Blossom
-- 6 - Player agrees to bring the flower
-- 7 - Player disagrees to bring the flower
-- 8 - Player brought the flower
-- 10 - Quest completed (NPC will offer healing capabilities)
QuestID = 558
-- CYCLE TEXT
npc.base.autonpcfunctions.AddCycleText( "", "#me crouches down and looks closely at the flowers, frowning slightly." )
npc.base.autonpcfunctions.AddCycleText( "", "#me sniffs a flower she's holding." )
npc.base.autonpcfunctions.AddCycleText( "", "#me whispers something inaudible while plucking out the petals of a flower." )
-- Queststatus = 10 (COMPLETED)
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again. Oh, you seem to be wounded. Would you allow me to tend to your wounds?");
    npc.base.autonpcfunctions.AddConsequence("state",5);
    npc.base.autonpcfunctions.AddCondition("attrib","hitpoints ","<",1500);
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings again. Hmm, you seem to be hurt. May I tend to your wounds?");
    npc.base.autonpcfunctions.AddConsequence("state",5);
    npc.base.autonpcfunctions.AddCondition("attrib","hitpoints ","<",1500);
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again there! It is so nice to see you.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings once again. It is always nice seeing you.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell and come back soon to see me!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","#me uses a small bottle of liquid which helps cure the wounds, 'There you go. You should feel better.'");
    npc.base.autonpcfunctions.AddCondition("state","=",5);
    npc.base.autonpcfunctions.AddConsequence("state",6);
    npc.base.autonpcfunctions.AddCondition("attrib","hitpoints ","<",1500);
    npc.base.autonpcfunctions.AddConsequence("attrib","hitpoints ","+",5000);
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("sure","#me applies a small bottle of liquid, soothing the pain of the wounds, 'There. You should feel less pain now.'");
    npc.base.autonpcfunctions.AddCondition("state","=",5);
    npc.base.autonpcfunctions.AddConsequence("state",6);
    npc.base.autonpcfunctions.AddCondition("attrib","hitpoints ","<",1500);
    npc.base.autonpcfunctions.AddConsequence("attrib","hitpoints ","+",5000);
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Oh well, you aren't that bad. I'll heal you when you are in a worse condition.");
    npc.base.autonpcfunctions.AddCondition("state","=",5);
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("no","If you insist. Take care then.");
    npc.base.autonpcfunctions.AddCondition("state","=",5);
    npc.base.autonpcfunctions.AddConsequence("state",0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("thank","I am glad to be of help, just as you were to me.");
    npc.base.autonpcfunctions.AddCondition("state","=",6);
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
-- Queststatus = 1
    npc.base.autonpcfunctions.AddTraderTrigger("I like flowers","You like the flowers? That makes me happy! May I ask you a question?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg",2);
    npc.base.autonpcfunctions.AddTraderTrigger("I love flowers","You love the flowers? Wow, I love them too! Can I ask you a question?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg",2);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Oh you like them too? That is so nice to hear. May I ask you a question?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg",2);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Oh, pity. You should look at them closely, their colors, their scent, it's a unique sensation.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",1);
    npc.base.autonpcfunctions.AddConsequence("qpg",0);
-- Queststatus = 2
    npc.base.autonpcfunctions.AddTraderTrigger("ask","Did you ever see a Night Angels Blossom?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg",3);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Have you ever seen a Night Angels Blossom?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg",3);
    npc.base.autonpcfunctions.AddTraderTrigger("of course","#me smiles before she inquires, 'Have you ever seen the lovely Night Angels Blossom?'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg",3);
    npc.base.autonpcfunctions.AddTraderTrigger("sure","#me smiles before she inquires, 'Have you ever seen the lovely Night Angels Blossom?'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg",3);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Sorry then, I won't disturb you.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
-- Queststatus = 3
    npc.base.autonpcfunctions.AddTraderTrigger("many times","Oh that is so nice to hear. Do you think you'll be able to bring me one?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",4);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Really? You have seen it? Would you be kind enough if you brought me one?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",4);
    npc.base.autonpcfunctions.AddTraderTrigger("once","You've seen it once? A rare flower, isn't it? Do you think you'll be able to bring me one?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",4);
    npc.base.autonpcfunctions.AddTraderTrigger("of course","That's lovely. Would you be able to bring me one please?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",4);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Oh, what a pity. You see, my biggest wish is to see and experience the scent of that flower.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",5);
    npc.base.autonpcfunctions.AddTraderTrigger("never","#me frowns then, before she says, 'A pity. You know, my biggest wish is to see the Night Angels Blossom.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",5);
    npc.base.autonpcfunctions.AddTraderTrigger("saw","That is very nice but...I would really wish to see one. Can you bring me one, please?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",4);
    npc.base.autonpcfunctions.AddTraderTrigger("seen","Really? You've seen it? Could you bring me one, please?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg",4);
    npc.base.autonpcfunctions.AddTraderTrigger("why","My mother used to tell me stories about this wonderful flower. But now she passed out, and I have no memories of her. The flower can server as one.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
-- Queststatus = 4
    npc.base.autonpcfunctions.AddTraderTrigger("yes","#me smiles widely suddenly before she says, 'You are too kind. I will eagerly wait to see it.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
    npc.base.autonpcfunctions.AddTraderTrigger("sure","You are too kind. I will wait for you to bring it.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
    npc.base.autonpcfunctions.AddTraderTrigger("of course","I am so glad you will. Thank you. I will wait patiently.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
    npc.base.autonpcfunctions.AddTraderTrigger("will try","Oh please do try. I will be so grateful if you did.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
    npc.base.autonpcfunctions.AddTraderTrigger("no","#me frowns and lowers her head before she says, 'Oh, I understand. I would have loved to see it.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg",7);
    npc.base.autonpcfunctions.AddTraderTrigger("I have flower","What? You have the Night Angels Blossom?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
    npc.base.autonpcfunctions.AddTraderTrigger("I have it","You mean, the Night Angels Blossom? You have it?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
-- Queststatus = 5
    npc.base.autonpcfunctions.AddTraderTrigger("seen","What? Have I understood well? You've seen the Night Angels Blossom?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg",3);
    npc.base.autonpcfunctions.AddTraderTrigger("saw","Have I heard well? Did you see the Night Angels Blossom?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg",3);
    npc.base.autonpcfunctions.AddTraderTrigger("I have flower","What? You have the Night Angels Blossom? Can you give it to me?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
    npc.base.autonpcfunctions.AddTraderTrigger("I have it","You mean, the Night Angels Blossom? You have it? May I take it?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
-- Queststatus = 6
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again! Have you brought the Night Angels Blossom?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Ah it's you! The flower? Have you brought it?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
    npc.base.autonpcfunctions.AddTraderTrigger("I have flower","What? You have the Night Angels Blossom? Can you give it to me please?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
    npc.base.autonpcfunctions.AddTraderTrigger("I brought flower","You brought the flower? Really? Can I take it please?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
-- Queststatus = 7
    npc.base.autonpcfunctions.AddTraderTrigger("hello","#me speaks with a gloomy, unenthusiastic voice, 'Hello.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger("greet","#me shows a lack of enthusiasm as she speaks, 'Greetings.'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddTraderTrigger("I have flower","#me blinks and lifts her eyebrows, 'What? You have the flower? Can I see it?'");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
    npc.base.autonpcfunctions.AddTraderTrigger("I brought flower","#me blinks and raises her eyebrows, 'You brought the flower? Really? Can I see it?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",7);
    npc.base.autonpcfunctions.AddConsequence("qpg",8);
-- Queststatus = 8
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Wow. This is the magnificent Night Angels Blossom. It will remind me of my passed away mother. Here, take these bottles for your troubles. Thank you.");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",138,1);
    npc.base.autonpcfunctions.AddConsequence("item",1316,2,333,0);
    npc.base.autonpcfunctions.AddCondition("item",138,"all",">=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg",10);
    npc.base.autonpcfunctions.AddTraderTrigger("sure","Wow. This is the magnificent Night Angels Blossom. It will remind me of my passed away mother. Here, take these bottles for your troubles. Thank you.");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",138,1);
    npc.base.autonpcfunctions.AddConsequence("item",1316,2,333,0);
    npc.base.autonpcfunctions.AddCondition("item",138,"all",">=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg",10);
    npc.base.autonpcfunctions.AddTraderTrigger("of course","Wow. This is the magnificent Night Angels Blossom. It will remind me of my passed away mother. Here, take these bottles for your troubles. Thank you.");
    npc.base.autonpcfunctions.AddConsequence("deleteitem",138,1);
    npc.base.autonpcfunctions.AddConsequence("item",1316,2,333,0);
    npc.base.autonpcfunctions.AddCondition("item",138,"all",">=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg",10);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","So? Where is it? Don't lie to me!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
    npc.base.autonpcfunctions.AddTraderTrigger("sure","You don't have it! Do not lie!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
    npc.base.autonpcfunctions.AddTraderTrigger("of course","Lies! You have none.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
    npc.base.autonpcfunctions.AddTraderTrigger("no","A pity. I will continue to wait.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",8);
    npc.base.autonpcfunctions.AddConsequence("qpg",6);
-- NPC DESCRIPTION
    npc.base.autonpcfunctions.AddTraderTrigger("#me examine","#me looks in her mid 20s, with dark orange hair reaching just below her shoulders, brown eyes and freckles on her cheek.");
    npc.base.autonpcfunctions.AddTraderTrigger("#me examine clothes","#me is wearing a simple white dress, decorated with small pink circles.");
-- SHOUT
    npc.base.autonpcfunctions.AddTraderTrigger("#s","Ooww! Would you mind not shouting so loud?");
-- GREETINGS/GOODBYES - known person
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again, Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again, Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell to you and take care. Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell to you and stay safe. Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("see you","Be well, Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("see you","See you another time, Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night and sleep well, Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again, Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again, Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell to you and take care. Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell to you and stay safe. Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("see you","Be well, Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("see you","See you another time, Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night and sleep well, Sir %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, Lady %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello again, %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("see you","Be well %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","I am fine, thank you.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
-- GREETINGS/GOODBYES - known person (no sir)
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello %CHARNAME. Nice to see you again.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings %CHARNAME. It is always nice seeing you.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell %CHARNAME, and come talk to me again soon.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("see you","See you soon %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello %CHARNAME. Nice to see you again.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings %CHARNAME. It is always nice seeing you.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell %CHARNAME, and come talk to me again soon.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("see you","See you soon %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, %CHARNAME");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
-- GREETINGS/GOODBYES - unknown person
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings good sir.");
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings to you, ma'am.");
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, sir.");
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, madam.");
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings good sir.");
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings to you, ma'am.");
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, sir.");
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night, madam.");
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello to you.");
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings to you.");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell to you and take care.");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Goodbye and be well.");
    npc.base.autonpcfunctions.AddTraderTrigger("see you","Goodbye.");
    npc.base.autonpcfunctions.AddTraderTrigger("good day","And good day to you too.");
    npc.base.autonpcfunctions.AddTraderTrigger("good night","Have a good night.");
-- INTRODUCTION PHRASES
    npc.base.autonpcfunctions.AddTraderTrigger("my name is","It is a real pleasure to meet you, sir %CHARNAME");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("is my name","#me curtsies politely as she says, 'It is my pleasure, sir %CHARNAME.'");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("no sir","#me blushes a bit, then says, 'Excuse me. I'll just say %CHARNAME then.'");
    npc.base.autonpcfunctions.AddConsequence("state",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.human);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("my name is","It is a real pleasure to meet you, sir %CHARNAME");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("is my name","#me curtsies politely as she says, 'It is my pleasure, sir %CHARNAME.'");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("no sir","#me blushes a bit, then says, 'Excuse me. I'll just say %CHARNAME then.'");
    npc.base.autonpcfunctions.AddConsequence("state",2);
    npc.base.autonpcfunctions.AddCondition("race",Character.elf);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("my name is","It is a pleasure to meet you, %CHARNAME");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddTraderTrigger("is my name","It is my pleasure to meet you, %CHARNAME'");
    npc.base.autonpcfunctions.AddConsequence("state",1);
    npc.base.autonpcfunctions.AddTraderTrigger("who [a']+re you","I am %NPCNAME. What is your name?");
    npc.base.autonpcfunctions.AddTraderTrigger("who might you be","My name is %NPCNAME. And you might be?");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","My name is %NPCNAME. What is your name?");
-- HELP
    npc.base.autonpcfunctions.AddTraderTrigger("help","[Game Help]: ((This is a NPC, you can talk to them just like other player characters. NPCs will react to keywords like 'Hello', so listen closely to what they say.))");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","[Game Help]: ((Das ist ein NPC, du kannst mit ihnen sprechen wie mit anderen Spielercharakteren. NPCs werden auf Schlüsselwörter wie 'Hallo' reagieren, also achte gut auf das was sie dir sagen.))");
-- GENERAL
    npc.base.autonpcfunctions.AddTraderTrigger("I[ a']+m new","Nice to meet you, then. I am %NPCNAME, what is your name?");
    npc.base.autonpcfunctions.AddTraderTrigger("newbie","#w((A newbie? Welcome! I am an NPC. I cannot really help you, but other players can. Please remember to mark OOC talk in double brackets.))");
    npc.base.autonpcfunctions.AddTraderTrigger("n[0O]b","#w((A newbie? Welcome! I am an NPC. I cannot really help you, but other players can. Please remember to mark OOC talk in double brackets.))");
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","I am doing well, thank you.");
-- JOB
    npc.base.autonpcfunctions.AddTraderTrigger("your job","I...sometimes work as a druid. I study the plants, especially the flowers. Aren't they lovely?");
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    npc.base.autonpcfunctions.AddTraderTrigger("what do you","Sometimes I study the plants, or better the flowers. Don't you find them lovely?");
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    npc.base.autonpcfunctions.AddTraderTrigger("what you doing","I'm just observing the flowers. Aren't they pretty?");
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
-- QUEST STARTERS
    npc.base.autonpcfunctions.AddTraderTrigger("you like flowers","Yes, I love flowers. They are the passion of my life. Don't you like them too?");
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    npc.base.autonpcfunctions.AddTraderTrigger("i like flowers","You like flowers too? That is so lovely. May I ask you a question then?");
    npc.base.autonpcfunctions.AddConsequence("qpg",2);
    npc.base.autonpcfunctions.AddTraderTrigger("i love flowers","You love the flowers? Really? I love them too! Then may I ask you a question?");
    npc.base.autonpcfunctions.AddConsequence("qpg",2);
    npc.base.autonpcfunctions.AddTraderTrigger("flowers","What? You mentioned flowers? Do you like them?");
    npc.base.autonpcfunctions.AddConsequence("qpg",1);
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
    thisNPC.activeLanguage=TradStdLang;
    
end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
