 -- Main

displayMode(FULLSCREEN_NO_BUTTONS)

free=0
debuged=0

letters={
    "Project:A",
    "Project:B",
    "Project:C",
    "Project:D",
    "Project:E",
    "Project:F",
    "Project:G",
    "Project:H",
    "Project:I",
    "Project:J",
    "Project:K",
    "Project:L",
    "Project:M",
    "Project:N",
    "Project:O",
    "Project:P",
    "Project:Q",
    "Project:R",
    "Project:S",
    "Project:T",
    "Project:U",
    "Project:V",
    "Project:W",
    "Project:X",
    "Project:Y",
    "Project:Z",
    "Project:0",
    "Project:1",
    "Project:2",
    "Project:3",
    "Project:4",
    "Project:5",
    "Project:6",
    "Project:7",
    "Project:8",
    "Project:9",
    "Project:!",
    "Project:colon",
    "Project:cow3",
    "Project:slash",
    "Project:star",
    "Project:-"
    }

numbers={
    "Project:0",
    "Project:1",
    "Project:2",
    "Project:3",
    "Project:4",
    "Project:5",
    "Project:6",
    "Project:7",
    "Project:8",
    "Project:9"
    }

btext={
    {"Project:Bo"},
    {"Project:Oo"},
    {"Project:No"},
    {"Project:Uo"},
    {"Project:So"}
    }

function setup()
    level=1
    setlevel()
    supportedOrientations(PORTRAIT_ANY)
    displayMode(FULLSCREEN_NO_BUTTONS)
    forcereset=0
    vol=1
    songname="Dropbox:DST-AngryRobotIII"
    music.muted=false
    music.volume=vol
    music(songname)
    
    --forcereset=1
    --donatereset=1
    
    initlevel()
    
    if readLocalData("score1")==nil or forcereset==1 then
       saveleveldata()
    else
        loadleveldata()
    end
    
--[[  if readLocalData("harder")==nil or forcereset==1 then
        saveLocalData("harder",800)
    end
    harder = readLocalData("harder")]]--
    
 --[[   if readLocalData("b")==nil or forcereset==1 then
        saveLocalData("b",0)
        end
    best = readLocalData("b")]]--
    
 --[[   if readLocalData("bestname")==nil or forcereset==1 then
        saveLocalData("bestname","")
        end
    bestname = readLocalData("bestname")]]--

 --[[   if readLocalData("level")==nil or forcereset==1 then
        saveLocalData("level",1)
        end
    level = readLocalData("level")]]--
    
 --[[   if readLocalData("last")==nil or forcereset==1 then
        saveLocalData("last",0)
        end
    last = readLocalData("last")]]--
    
  --[[  if readLocalData("score")==nil or forcereset==1 then
        saveLocalData("score",0)
        end
    score = readLocalData("score")]]--
    --[[if readLocalData("limit")==nil or forcereset==1 then
        saveLocalData("limit",180)
        end
    limit=readLocalData("limit")
    if readLocalData("lim")==nil or forcereset==1 then
        saveLocalData("lim",240)
        end
    lim=readLocalData("lim")]]--
 --[[   if readLocalData("starcount")==nil or forcereset==1 then
        saveLocalData("starcount",0)
        end
    starcount=readLocalData("starcount")]]--
    if readLocalData("levelgotto")==nil or forcereset==1 then
        saveLocalData("levelgotto",1)
        end
    
    levelgotto=readLocalData("levelgotto")
    if debuged==1 then
        levelgotto=18
    end
    level=1
    
    
    if readLocalData("hasdonated")==nil or forcereset==1 or donatereset==1 then
        saveLocalData("hasdonated",0)
        end
    hasdonated=readLocalData("hasdonated")
    
    if readLocalData("hasrated")==nil or forcereset==1 or donatereset==1 then
        saveLocalData("hasrated",0)
        end
    hasrated=readLocalData("hasrated")
    stars={}
    for i=1,40 do
        stars[i]={x=mathrandom(0,WIDTH),y=mathrandom(HEIGHT/2,HEIGHT),speed=mathrandom(-100,200)}
    end
    
    mode=5
    setup2()
end
    
function setup2()
justopenedgamecenter=1
dogamecenter=0
pausepressx=0
pausepressy=0
    stcl=0
    dexscale=0
    helpscroll=0
    t=0
    levelscore=0
    rythym=0
    restarted=0
    started=0
    arrived=0
    soundplay=0
    cm=0
    cmc=0
    nomore=0
    fillup=0
    togo=0
    bounce=0
    completeshow=0
    finished=0
    hideKeyboard()
    if WIDTH>700 then
        sh=5
    else
        sh=2.5
    end
    writing={
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0}
}
 -- sprite()
    flashscore=0
    xs=0
    ys=0
    fillup=0
    m=0
    bm=0
    xshift=0
    bmx=0
    dmc=0
    size=WIDTH/10
    font("HelveticaNeue-Bold")
    best = 0
    st =0
    bigflash=0
    fadebig=0
    fadeout=0
    shrink = 1
    onscreenbb=0
    go=0
    u=0
    y=1
    fading=0
    if level==1 then
        hs=0
    end
    wobble=0
    wobble2=0
    comp=0
    complete=0
    xzap=0
    yzap=0
    wob=1
    flashc=0
    hsf=0
    qn=0
    q=1
    cn = 10
    mc=0
    bmc=0
    total = 0
    initparts()
    score=0
    for i=1,levelno do
        score = score + (leveldata[i].score)
    end
    starcount=0
    for i=1,levelno do
        starcount = starcount + (leveldata[i].stars)
    end
    
    guntemp = 0
    
    lim=levelstat[level][8]*30
 --   limit=levelstat[level][6]*30
    alienpos = {
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0}
    }
    
    for g = 1,64 do
        alienpos[1][g]=mathrandom(0,WIDTH)
        alienpos[2][g]=mathrandom(math.floor(size),math.floor(HEIGHT/2.2))
        for j=3,10 do
            alienpos[j][g]=0
        end
    end
    
    for g = 1,cn do
        alienpos[1][g]=mathrandom(0,WIDTH)
        alienpos[2][g]=mathrandom(size,HEIGHT/2.2)
        alienpos[3][g]=mathrandom(0,0)
        alienpos[5][g]=1
        alienpos[8][g]=60*g-60
        alienpos[9][g]=mathrandom(1,4)
        alienpos[10][g]=0
    end
    
  --[[  for g = cn,mc do
        alienpos[3][g]=1
        alienpos[6][g]=1
        alienpos[4][g]=0
        alienpos[5][g]=mathrandom(300,400)
        alienpos[7][g]=1
        alienpos[8][g]=0
    end. ]]--

    beats[1]=1
    beats[2]=2
    beats[3]=3
    beats[4]=4
    
    copx = WIDTH/2
    copy = HEIGHT*8/10
    clock = 0
    onscreen = 0
    size = WIDTH/10
    times = "0X"
    texttint=180
    autofade=30
    get = 0
    onscreenb=0
    bonus=1
    
    g=0
    n=0

    movex=0
    clockb=1
    direction = 1
    warnflash=0
    warn=0
    fade = 0
    fil = 0
  --full
    full = 0
    
    astart=1
    bstart=1
    
    play = 0
cexscale=0
    
    hexscale=0
soundplay=0
    butscale={}
    for i=1,levelno do
        butscale[i]=0
    end
    timer = 60
    y=0
    x=0
    moonx = 0
    moonlerp=1
    moonspeed=0
    flashb = 0
    onscreenc=0
    w=0
    h=0
    --timer
    ti = 20
    li = levelstat[level][10]*5
    gli=5
    t = 0
    txt=30
    msg=1
    e=1
    better=0
    flash=0
    g=1
    ni=0
    gi=0
    p = 0
    cpos = {
    {0,0,0},
    {0,0,0},
    {0,0,0}
    }
    for g = 1,1 do
        cpos[1][g]=mathrandom(0,WIDTH)
        cpos[2][g]=mathrandom(HEIGHT*2/3,HEIGHT)
        cpos[3][g]=mathrandom(0.5,2)
    end
  --  sky=60*ti
    wait=0
    
    bonus=1
    size=WIDTH/10
    exscale=0
    rexscale=0
    bexscale=0
    play=0
  --  fontsise=HEIGHT/12
 --   fontsise2=HEIGHT/12
    extrabonus=0
    complete=0
    stcl=0
    cowstapped=0
    
if free==1 then fullstars=6 else fullstars=levelno*3 end
end



-- This function gets called once every frame
function draw()
--print(li,levelstat[level][10]*5,clock)
 --   print(wait,lim,levelstat[level][8]*30)
--print(mode)
    if complete==0 then
        if music.currentTime>16 then
            music.currentTime=0
        end
    else
        if music.currentTime<18.5 then
            music.currentTime=18.6
        end
    end
    --print(music.currentTime)
    -- Use this function to perform your initial setup
    music.muted=false
    music.volume=vol
    --print(music.duration-music.currentTime)
    if music.duration-music.currentTime<1 then
        music(songname)
    end
    --[[if score>best then
        best=score
        saveLocalData("b",score)
        if hs==0 then
            hsf=255
            hs=1
        end
    end]]--
    
 --   cn=10
 --   for g = 4,cn do
--        alienpos[3][g]=0
--   end
    --if WIDTH<700 then
  --      supportedOrientations(PORTRAIT_ANY)
    --end
    --  copy = HEIGHT*8/10
size=WIDTH/10
--if WIDTH>HEIGHT then size=HEIGHT/10 else size=WIDTH/10 end
--    fontSize(15)
    sky =moonlerp*20*60

--[[    background(27, 35, 150-sky*5/60, 255)
    if sky*5/60 < 100 then
   --     fill(27, 35, 150-sky*5/60, 255)
        stroke(27,35,150-sky*5/60,255)
        else
   --     fill(27, 35,50, 255)
        stroke(27,35,50,255)
    end
--    rect(-1,HEIGHT/2-size/9,WIDTH+900,HEIGHT+900)
    
    if sky*5/60 < 100 then
    --    fill(36, 200-sky*5/60, 31, 255)
        stroke(36,200-sky*5/60,31,255)
        else
   --     fill(36, 100, 31, 255)
        stroke(36,100,31,255)
    end
  --  rect(-1,-1,WIDTH+900,HEIGHT/2-size/9)
    tint(255, 255, 255, 255) ]]--
    
if play==1 or play==-2 or play==-0.5 then
    spriteMode(CORNER)
    i=(255-(sky/7.5))
    tint(i,i,i,255)
    sprite("Project:sky",-1,-1,WIDTH+2,HEIGHT+2)
    spriteMode(CENTER)
    
    
    for i = 1,40 do
        if play == 1 or play == 0 then
            stars[i].x = stars[i].x + ((stars[i].speed+100)/200)*(moonspeed+0.3)
            stars[i].y = stars[i].y + ((stars[i].speed+100)/500)*(moonspeed+0.3)
        end
        if stars[i].x>WIDTH then stars[i].x=0 end
        if stars[i].y>HEIGHT then stars[i].y=HEIGHT/2 end
        if stars[i].x<0 then stars[i].x=WIDTH end
        if stars[i].y<HEIGHT/2 then stars[i].y=HEIGHT end
        tint(255, 255, 255, sky*10/60+stars[i].speed)
        sprite("Project:Glow",stars[i].x,stars[i].y,WIDTH/100)
    end

  --  if play == 1 and txt > 0 or play == -2 and txt > 0 then
        moon()
  --  end
    
    spriteMode(CORNER)
    i=(255-(sky/7.5))
    tint(i,i,i,255)
    sprite("Project:hill",-1,-size/2,WIDTH,HEIGHT)
    spriteMode(CENTER )
    
  --  if play == 1 or play == -2 then
        tint(255, 255, 255, 255)
    --    fill(0, 0, 0, 255)
  --      tint(255, 255, 255, 60)
  --      tint(255, 255, 255, 255)
    --    fontSize(HEIGHT*0.1/4)
        
        wobble2 = wobble2 + 1
        xsize=(math.sin(wobble2/32)*WIDTH/128)
        ysize=(math.sin(wobble2/32)*WIDTH/-128)
        
        bw={
        {xsize},
        {ysize},
        {xsize},
        {ysize},
        {xsize},
        {ysize}
        }

if levelstat[level][6]>=1 then
   --     fontSize(size*0.75)
      --[[  tint(0, 0, 0, 14)
        for p = 1,5 do
            sprite(btext[p][1],WIDTH/2+(p*size*0.75),HEIGHT*0.95+bw[p][1],size*0.75)
        end]]--
        i=bonus
        if fadebig>0 then
            i=6
            tint(255, 255, 255, fadebig)
        else
            tint(255, 255, 255, 255)
        end
        if i>1 then
            for p = 1,i-1 do
            --    fontSize(size*0.75)
                sprite(btext[p][1],WIDTH/2-3*size*0.75+(p*size*0.75),HEIGHT*0.915+bw[p][1],size*0.75)
            end
        end
 end
    end

    check()
if play==1 then
    if full<0 then full=0 end
    if fillup > levelstat[level][5] then fillup = levelstat[level][5]+1 end
    if fillup<0 then fillup=0 end
    if score<0 then score=0 end
end
if play==-1 then
--print(level,complete,hasdonated)
end

--GameCenter Stuff...
if dogamecenter>60 or play==-1 then
if gamecenter.enabled() then
gamecenter.submitScore( score, "topscores" )
gamecenter.submitScore( starcount, "topstars" )
dogamecenter=0
end
else
dogamecenter=dogamecenter+1
end

if play==0 and gamecenter.enabled() then
spriteMode(CENTER)
noTint()
sprite("Project:GameCenter",WIDTH-size/2,HEIGHT-size/2,size,size)
if CurrentTouch.x>WIDTH-size and CurrentTouch.y > HEIGHT-size then
if pausepressx==CurrentTouch.x and pausepressy==CurrentTouch.y then else
if CurrentTouch.state==BEGAN then
pausepressx=CurrentTouch.x
pausepressy=CurrentTouch.y
if justopenedgamecenter==1 then
gamecenter.showLeaderboards()
justopenedgamecenter=0
end
else
justopenedgamecenter=1
end
end
end
end


end



