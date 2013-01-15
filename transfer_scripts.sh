rsync -r testserver/alchemy/ illarionserver/alchemy/
rsync -r testserver/base/ illarionserver/base/
rsync -r testserver/content/ illarionserver/content/
rsync -r testserver/gm/ illarionserver/gm/
rsync -r testserver/handler/ illarionserver/handler/
rsync -r testserver/item/ illarionserver/item/
rsync -r testserver/lte/ illarionserver/lte/
rsync -r testserver/monster/ illarionserver/monster/
rsync -r testserver/npc/ illarionserver/npc/
rsync -r testserver/quest/ illarionserver/quest/
rsync -r --exclude "testquest.quest" testserver/questsystem/ illarionserver/questsystem/
rsync -r testserver/scheduled/ illarionserver/scheduled/
rsync -r testserver/server/ illarionserver/server/
rsync -r testserver/tile/ illarionserver/tile/
rsync -r testserver/triggerfield/ illarionserver/triggerfield/
