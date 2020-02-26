-- Plummet
--[[
To Do...
Slow down acceleration if moving. BUT need to have a bigger top speed so leaderboard not biased. This means top speeds more variable/less granular.

Add re-entry glow when falling through atmosphere.

Have different acceleration and sideways movement top speeds for each character.

Maybe start with 2 active hazards and add 1 more each time you loop the planet.

Near misses should slow you down. Need particles to indicate it's happening.

Maybe add achievements like "reach planet core" etc.

Bugs

Balloons seem mostly missing on the way down.

Need SFX for when you collide with wall.
]]--

displayMode(FULLSCREEN_NO_BUTTONS)
background(27, 27, 27, 255)

function setup2()

    tiltspeedratio=1
    reset=0
    candie=0

    fdir=1
    lastfdir=fdir
    turn=0
    characterx=HEIGHT*-0.5
    herosprites={
    "Project:Hero1",
    "Project:Hero2",
    "Project:Hero3",
    "Project:Hero4",
    "Project:Hero5"
    }
    herospriteface={
    "Project:Heroface1",
    "Project:Heroface2",
    "Project:Heroface3",
    "Project:Heroface4",
    "Project:Heroface5"
    }
    herodownspeed={
    1,0.5,1.5,2,0.25
    }
    herosidespeed={
    1,1.5,0.5,0.25,2
    }
    if readLocalData("herosprite")==nil or reset==1 then
        herosprite=1
        saveLocalData("herosprite",1)
    else
        herosprite=readLocalData("herosprite")
    end
    changeto=herosprite
    --herosprite=1
    changingcharacter=0
    birdsprites1={
    "Project:Bee1",
    "Project:Battor Flap 1"
    }
    birdsprites2={
    "Project:Bee2",
    "Project:Battor Flap 2"
    }
    q=math.random(1,table.maxn(birdsprites1))
    q=2
    birdsprite1=birdsprites1[q]
    birdsprite2=birdsprites2[q]
    
    rotation=0
    direction=1
    donesoundbarrier=0
    musicvol=0
    music.volume=musicvol
    music("Game Music One:Venus",1)
    music.currentTime=0
    herox=WIDTH/2
    heroy=HEIGHT*1.1
    fallspeed=1
    distance=0
    dofloor=1
    parachute=0
    msgc1=0
msgc2=0
msgc3=0
    msgx1=-HEIGHT
msgx2=-HEIGHT
msgx3=-HEIGHT
msg1=""
msg2=""
msg3=""
    scrolltint=139
    headphonesy=-HEIGHT/2
    buildings=0
    donelevel=0
    windowsx=WIDTH-size/4
    windowsx2=size/4
    dead=0
    title=1
    dis={
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0}
    }
    disno=5
    for i=1,disno do
        dis[i][1]=-size
        dis[i][2]=-HEIGHT*(i/5)
        dis[i][3]=0
    end
    
    zone=1
    distancesincezone=0
    showdead=0
    topspeed=0
    topdist=0
    pause=0
    guix=-2*size
    guiy1=HEIGHT*9.75/10
    guiy2=HEIGHT*9.5/10
    titley=HEIGHT*2.2
    parachutetime=0
    starting=0
    level=1
    initparts()
    falltimer=0
    rememberx=CurrentTouch.x
    remembery=CurrentTouch.y
    msg=0
    waitbest=0
    pausex=-WIDTH
    bdy=HEIGHT/2
    bsy=HEIGHT/2+size/2
    bsx=WIDTH*1.5
    bdx=-WIDTH/2
    
    if readLocalData("bestdist")==nil or reset==1 then
    bestdist=0
    saveLocalData("bestdist",0)
    else
        bestdist=readLocalData("bestdist")
    end
    if readLocalData("bestspeed")==nil or reset==1 then
    bestspeed=0
    saveLocalData("bestspeed",0)
    else
        bestspeed=readLocalData("bestspeed")
    end
    if bestspeed==0 then topspeed=1 end
    if bestdist==0 then topdist=1 end
    thing={
    --Type,X,Y,Speed,size
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0}
    }
    thingno=0
    realthingno=table.maxn(thing)
    for i=1,realthingno do
        thing[i][1]=0
        thing[i][2]=math.random(0,WIDTH)
        thing[i][3]=-HEIGHT*2*i/5
        thing[i][4]=size
        thing[i][5]=0
        thing[i][6]=math.random(-5,5)
        if thing[i][6]==0 then thing[i][6]=6 end
        thing[i][7]=0
        thing[i][8]=1
        thing[i][9]=0
    end
    --[[for i=1,thingno do
        thing[i][1]=2
        thing[i][2]=math.random(0,WIDTH)
        thing[i][3]=-HEIGHT*2*i/5
        thing[i][4]=size
        thing[i][5]=0
        thing[i][6]=math.random(-5,5)
        if thing[i][6]==0 then thing[i][6]=6 end
        thing[i][7]=0
    end]]--
    thing[1][1]=1

    
    for i=1,math.floor(HEIGHT/size) do
    
    end
    windows={
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0}
    }
    windowno=(math.floor(HEIGHT/size)+3)
    windows[1][2]=-HEIGHT
    windows[1][3]=0
    for i=2,windowno do
        windows[i][2]=windows[i-1][2]-size*1.5
        windows[i][3]=0
    end
area="Space"
distfromcenter=2500
gamecenter.submitScore((math.floor(bestdist/100)),"PlummetBestDist")
gamecenter.submitScore((math.floor(bestspeed*20)),"PlummetBestSpeed")
end





function setup()
 displayMode(FULLSCREEN_NO_BUTTONS)
pausepressx=CurrentTouch.x
pausepressy=CurrentTouch.y
justopenedgamecenter=1
laststate=CurrentTouch.state
    size=math.floor((HEIGHT+WIDTH)/20)
gamecentershift=size*5
    backstars={
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0}
    }
    starno=16
    for i=1,starno do
        backstars[i][1]=math.random(0,WIDTH)
        backstars[i][2]=math.random(0,HEIGHT)
        backstars[i][3]=math.random(1,3)
    end
safty=0
    red=27
    green=27
    blue=27
    setup2()
end

function draw()
    domusic()
    supportedOrientations(PORTRAIT)
    backing()
    
    if pause==0 then
    moveparts()
    end
    drawparts()
    if title==0 then
    objects()
        --things()
      --  dist()
        GUI()
        paused()
    end
    hero()
    
    if dead==1 or dead==-1 then
        die()
    end
    if title==1 then
        titlescr()
    end

    if msg1==0 then else
        message1(msg1)
    end
    if msg2==0 then else
        message2(msg2)
    end
    if msg3==0 then else
        message3(msg3)
    end

    if CurrentTouch.x>WIDTH-size/2 and CurrentTouch.y>HEIGHT-size/2 then
        safty = safty + 1
        if safty>60 then
           
            --displayMode(FULLSCREEN)
            
           
        end
    else
        safty=0
    end


if title==1 and gamecenter.enabled() then
gamecentershift=gamecentershift-(gamecentershift-0)/50
else
gamecentershift=gamecentershift-(gamecentershift-size*5)/50
end
noTint()

sprite("Project:GameCenter",WIDTH-size/2,HEIGHT-size/2+gamecentershift,size,size)

if title==1 and gamecenter.enabled() then
if CurrentTouch.x>WIDTH-size and CurrentTouch.y > HEIGHT-size then
if laststate==BEGAN then else
if pause==0 and CurrentTouch.state==BEGAN then
if justopenedgamecenter==1 then
gamecenter.showAchievements()
justopenedgamecenter=0
end
else
justopenedgamecenter=1
end
end
end
end
laststate=CurrentTouch.state


end

