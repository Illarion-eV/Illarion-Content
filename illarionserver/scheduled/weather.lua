module("scheduled.weather", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.weather', 350, 900, 'plantdrop');

-- function should be invoked every 5-10 RL minutes (=15-30 illa minutes)

function sign(value)        -- return sign of value (sign-function), random for sign(0)
    if value<0 then
        retVal=-1;
    elseif value==0 then
        retVal=math.random(-1,1);
    else
        retVal=1;
    end
    return retVal;
end

function pseudogauss(minV, maxV)    -- returns a pseudogauss distributed random value between limits
    intervall=maxV-minV;
    maxRnd=math.floor(intervall/3);
    retVal=minV+math.random(0,maxRnd)+math.random(0,maxRnd)+math.random(0,maxRnd)
    return retVal;
end

function largeScaleTempModifier()       -- larger scale temp modifier 
    if cycCnt==nil then
        cycCnt=math.random(80,720);    -- time from 1-10 days
        retLsTemp=math.floor(pseudogauss(-15,15));
    end
    if cycCnt==1 then
        cycCnt=math.random(80,720);    -- time from 2-10 days
        retLsTemp=math.floor(pseudogauss(-15,15));
    end
    cycCnt=cycCnt-1;
    return retLsTemp;
end

function largeScaleCloudModifier()      -- larger scale cloud modifier (periods of cloudy skies)
        if cycCldCnt==nil then
        cycCldCnt=math.random(40,210);    -- time from 0,5-3 days
        retLsCld=math.floor(pseudogauss(-20,20));
    end
    if cycCldCnt==1 then
        cycCldCnt=math.random(40,210);    -- time from 2-10 days
        retLsCld=math.floor(pseudogauss(-20,20));
    end
    cycCldCnt=cycCldCnt-1;
    return retLsCld;
end

function getDayNightTemp(actClouds)                 -- cold at night, warm at day, not definied inbetween
    thisHour=world:getTime("hour");                 -- variation: 6 when cloudy, 20 when sunny
    if actClouds<20 then
        retTemp=math.floor(10*math.cos(thisHour*math.pi/12));   -- difference between day and night: 20
    else
        retTemp=math.floor(3*math.cos(thisHour*math.pi/12));    -- difference between day and night: 6
    end
    return retTemp+math.random(-1,1);               -- add little variation (realistic)
end

function getSeasonTemp(actMonth)                    -- cold in winter (-10) warm in summer (+30)
    retTemp=math.floor(10-20*math.cos(actMonth*math.pi/8));     -- welllllll, yesssss.
    return retTemp;
end

function setFog(actFog, actCloud, thisMonth) -- in autumn and early winter
    fogProbability=math.floor(5-5*math.cos(month*math.pi/8-3));        -- ~0 in summer (6), 10% in month 11
    fogTest=math.random(1,100);
    if actFog>0 then                        -- if there already is fog: change it a little
        if actCloud<10 then                 -- if the sun is shining...
            maxFogChange=0;                 -- only lower fog (sun burns it away ;) )
        else
            maxFogChange=4;
        end
        retFog=math.max(actFog+math.random(-10,maxFogChange),0);    -- change it...
    else                                    -- if there is no fog present
        if fogTest>=fogProbability then     -- fog should appear
            retFog=math.random(5,20);       -- first fog: 5-20
        else
            retFog=0;                       -- well, if not then 0
        end
    end
    return retFog;
end

function setClouds(actClouds,thisMonth)     -- much in winter, less in summer 
                                            -- clear sky, cold night (winter)
    newCloud=0;
    typicalClearDayProb=math.floor(40-9*math.cos(thisMonth*math.pi/8)); -- 78% in summer, 60 in winter (69)
    clearTest=math.random(1,100);
    if clearTest>=typicalClearDayProb then  -- no clear day
        typicalClouds=50;                   -- if cloudy, then typically 50%
        cloudChange=pseudogauss(0,20);      -- change cloud coverage
        direction=math.random(1,3);
        if direction==1 then                -- move away from average
            newCloud=math.max(0,actClouds+sign(actClouds-typicalClouds)*cloudChange);
        else                                -- move towards average
            newCloud=math.max(0,actClouds-sign(actClouds-typicalClouds)*cloudChange);
        end
    else                                    -- not cloudy!
        newCloud=math.max(0,actClouds-pseudogauss(4,12));
    end
    return newCloud;
end

function getRain(thisMonth,actClouds)
    if actClouds>30 then        -- only care about rain with more than 30% cld coverage
        probabilityToRain=math.floor(60-20*math.cos(thisMonth*math.pi/8));  -- 35% in summer, 15 in winter (realistic values), 70% clear sky!
        doesItRain=math.random(0,100);
        if doesItRain<probabilityToRain then    -- rain positive
            retRain=math.random(0,100);   
        else            -- rain negative
            retRain=0;
        end
    else        -- not enough cloud coverage
        retRain=0;
    end
    return retRain;
end

function getThunder(actClouds,actRain,actTemp)
    retThunder=0;
    if actRain>20 and actClouds>50 then
        if actTemp>25 then  -- summer thunder
            probToThunder=20;
            if math.random(1,100)<probToThunder then
                retThunder=pseudogauss(20,100);
            else
                retThunder=0;
            end
        elseif actTemp<0 then -- winter thunder (RARE!)
            probToThunder=5;
            if math.random(1,100)<probToThunder then
                retThunder=pseudogauss(20,50);  -- not as strong as in summer
            else
                retThunder=0;
            end
        end
    end
    return retThunder;
end

function getGust(actThunder)
    if actThunder>0 then
        retGust=pseudogauss(0,100);
    else
        retGust=math.max(0,pseudogauss(-10,20));
    end
    return retGust;
end

function getWindDir(actWind)
    typicalWind=0;
    windChange=pseudogauss(0,20);
    direction=math.random(1,3);
    if direction==1 then                -- move away from average
        retWind=math.max(0,actWind+sign(actWind-typicalWind)*windChange);
    else                                -- move towards average
        retWind=math.max(0,actWind-sign(actWind-typicalWind)*windChange);
    end
    retWind=math.max(-100,retWind);
    retWind=math.min(100,retWind);
    return retWind;
end

function logWeather(newWeather)
    LogString="TMP "..newWeather.temperature.." CLD "..newWeather.cloud_density.." WND "..newWeather.wind_dir.." GST "..newWeather.gust_strength.." PER "..newWeather.percipitation_strength.." THD "..newWeather.thunderstorm.." FOG "..newWeather.fog_density.."\n";
    aYear=world:getTime("year");
    aMonth=world:getTime("month");
    aDay=world:getTime("day");
    aHour=world:getTime("hour");
    aMin=world:getTime("minute");
    aSec=world:getTime("second");

    LogString=aYear.."/"..aMonth.."/"..aDay.."/"..aHour.."/"..aMin.."/"..aSec..":"..LogString

   --LogFile=io.open("/home/martin/weatherlog.txt","a")
   --LogFile:write(LogString);
   -- LogFile:close();
end

-- fruehling: 1-4: 
-- sommer: 5-8: Viel Regen, warm, sonnenschein
-- herbst: 9-12: Viel Nebel
-- winter: 13-16: kalt, 

function changeWeather()
    actWeather=world.weather;
    
    month=world:getTime("month");
    
    newClouds=math.max(0,setClouds(actWeather.cloud_density,month)+largeScaleTempModifier());
    newClouds=math.min(100,newClouds);        -- much in winter, less in summer 
    newFog=setFog(actWeather.fog_density,newClouds,month);      -- much fog in fall
    newWindDir=pseudogauss(-40,40); -- -100: left, +100: right
    seasTp=getSeasonTemp(month);
    dayTp=getDayNightTemp(newClouds);
    lsModTp=largeScaleTempModifier();
    newTemp=math.floor(seasTp+dayTp+lsModTp);
    world:sendMonitoringMessage("Temp: "..seasTp.." + "..dayTp.." + "..lsModTp,0);
    newRain=getRain(month,newClouds);
    newThunder=getThunder(newClouds,newRain,newTemp);  -- only when it's cloudy
    newGust=getGust(newThunder);            -- boeen
    newWindDir=getWindDir(actWeather.wind_dir);
    
        -- does it rain or snow? (temp check)
    if newTemp<1 then 
        newPerTyp=2;    -- snow
    else
        newPerTyp=1;    -- rain
    end

    world:sendMonitoringMessage("(Weather changes) cld: "..newClouds.." fg: "..newFog.." w_dir: "..newWindDir.." gust: "..newGust.." perstr: "..newRain.." perTyp: "..newPerTyp.." new thund: "..newThunder.." temp: "..newTemp,0)
    
    m_Weather = world.weather;
    m_Weather.cloud_density=newClouds;
    m_Weather.fog_density=newFog;
    m_Weather.wind_dir=newWindDir;
    m_Weather.gust_strength=newGust
    m_Weather.percipitation_strength=newRain;
    m_Weather.percipitation_type=newPerTyp;
    m_Weather.thunderstorm=newThunder;
    m_Weather.temperature=newTemp;
    logWeather(m_Weather);
    world:setWeather(m_Weather);
end
