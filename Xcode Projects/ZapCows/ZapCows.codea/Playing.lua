function splay()
    if soundplay==0 then
        soundplay=1
        sound("Dropbox:126418__cabeeno-rossley__button-select")
    end
end
    
function checkrestart()
    
    tint(255, 255, 255, 255)
    sprite("Project:startagain",WIDTH*9.5/10-1,HEIGHT-size/2,size+exscale)
    rt,exscale=checkbutton(WIDTH*9.5/10-1,HEIGHT-size/2,size,size,exscale)
    if rt==1 then
        if fading~=6 then
        fading=6
        music(songname)
        splay()
        --print(fading)
        end
    end
end

function check()
    font("HelveticaNeue-Bold")
    --fontSize(15)
    
    if play == -1 then
    gameover()
end
if play == 6 then
    donate()
end
-- end screen
if play==-5 then
    fin()
end

--title screen
if play == 0 then
    title()
end

--pause screen
if play == -2 and txt > 240 then
    pause()
end

--1st gameover screen
if play==-0.5 then
    gamealmostover()
end

if play == 0.5 then
    help()
end
    
if play == 5 then
    levelselect()
end
    
    --game screen
    if play == 1 then
       playgame()
    end
end
        
function playgame()
    --    print(leveldata[level].score.." "..levelscore)
        
        speed=1.25
        t = t + speed
        soundplay=0
        music.volume=vol
        if txt < 50 then
         --[[   if level==1 then
                score=0
            --    saveLocalData("score",0)
                starcount=0
             --   saveLocalData("starcount",0)
            end]]--
            togo=levelstat[level][1]
            copy=HEIGHT+size*2
            copx=0
        end
       -- fadeout=0
        
        if started==1 then
        
        if txt<1000 then
            txt = txt + speed
        end
        if txt<500 then
            flashb = flashb + speed
        end
        else
            if CurrentTouch.state==BEGAN and t>15 then
                started=1
                sound("Game Sounds One:Menu Select")
            end
        end
        
        if txt >= 200 and txt-speed<200 then
            sound(SOUND_PICKUP, 21094)
        end
        
        if txt > 200 then
            drawaliens()
          checkaliens()
            moveparts()
           drawparts()
            
            else
            --copy=HEIGHT+size*2
            --copx=0
        end
        copter()
        
if txt > 200 then
    
    gun()
    wait = wait + 1
    --if debuged==1 then
    flashscore = flashscore + 2 
    if flashscore>60 then flashscore=0 end
        noTint()
        flashsize=size/1.75
        if cowstapped>leveldata[level].score then
        if flashscore>30 then
        if leveldata[level].score>0 then
        tint(255,255,127,255)
        flashsize=size/1.75
        end
        end
        if cowstapped>leveldata[level].score and flashscore<30 then
            if leveldata[level].score>0 then
                flashsize=size/1.65
            end
        end
        end
    
        if cowstapped<levelstat[level][9] then
            printword("SCORE: "..cowstapped,-1,HEIGHT*0.975,flashsize,flashsize)
        else
            printword("^ SCORE: "..cowstapped.." ^",-1,HEIGHT*0.975,flashsize,flashsize)
        end
    else
    fill(255, 255, 255, 255)
    if flashb >= 60 then
        sound("Game Sounds One:Menu Select", 5, 1)
        msg = msg + 1
                flashb=0
            end
            if started==1 then
            --fontSize(HEIGHT/13-flashb/2)
            if msg==1 then
                --[[fill(0, 0, 0, 255-flashb*(255/60))
                text("Tap...",WIDTH/2,HEIGHT/2)
                fill(255, 255, 255, 255-flashb*(255/60))
                text("Tap...",WIDTH/2-sh,HEIGHT/2+sh)]]--
                sprite("Project:Tap",WIDTH/2,HEIGHT/2,WIDTH/2-flashb*2)
            end
            if msg==2 then
                --[[fill(0, 0, 0, 255-flashb*(255/60))
                text("Those...",WIDTH/2,HEIGHT/2)
                fill(255, 255, 255, 255-flashb*(255/60))
                text("Those...",WIDTH/2-sh,HEIGHT/2+sh)]]--
                sprite("Project:Those",WIDTH/2,HEIGHT/2,WIDTH/2-flashb*2)
            end
            if msg ==3 then
                --[[fill(0, 0, 0, 255-flashb*(255/60))
                text("Cows!!!",WIDTH/2,HEIGHT/2)
                fill(255, 255, 255, 255-flashb*(255/60))
                text("Cows!!!",WIDTH/2-sh,HEIGHT/2+sh)]]--
                sprite("Project:Cows!",WIDTH/2,HEIGHT/2,WIDTH/2-flashb*2)
            end
            end
                --fontSize(HEIGHT/12)
                --[[fill(0, 0, 0, 99)
                text("Night " ..level,WIDTH/2,HEIGHT*2/3)
                fill(255, 255, 255, 255)
                text("Night "..level,WIDTH/2-sh,HEIGHT*2/3+sh)]]--
                if started==0 then
                wobble = wobble + 0.5
                pysize=(math.sin((wobble)/29)*WIDTH/64)+size*2
                pxsize=(math.sin((wobble)/33)*WIDTH/64)+size*2
                tint(0, 0, 0, 116)
                sprite("Project:moon",WIDTH/2+0.1*size,HEIGHT*2.25/3-0.2*size,pxsize*2,pysize*2)
                tint(255, 255, 255, 255)
                sprite("Project:moon",WIDTH/2,HEIGHT*2.25/3,pxsize*2,pysize*2)
                
                tint(255, 255, 255, 255)
                --sprite(numbers[level],WIDTH/2,HEIGHT*2/3,pxsize/2,pysize/2)
                
                printword("NIGHT",-1,HEIGHT*2.35/3,pxsize/3,pysize/3)
                printnum(level,WIDTH/2,HEIGHT*2.15/3,pxsize/2,pysize/2,1)
                if leveldata[level].score >0 then
                    printword("BEST SCORE: "..leveldata[level].score,-1,HEIGHT*2/16,size/1.5,size/1.5)
                end
                tint(255, 255, 255, 255)
                printword("^^^ - "..levelstat[level][9],-1,HEIGHT*1/16,size/1.5,size/1.5)
                noTint()
                --fontsise=HEIGHT/16
            --[[    fontSize(fontsise)
                while textSize(levelstat[level][7])>WIDTH*2/3 do
                    fontsise = fontsise - 1
                    fontSize(fontsise)
                end]]--
                --[[fontSize(fontsise)
                fill(0, 0, 0, 99)
                text(levelstat[level][7],WIDTH/2,HEIGHT/3)
                fill(255, 255, 255, 255)
                text(levelstat[level][7],WIDTH/2-sh,HEIGHT/3+sh)]]--
                tint(255, 255, 255, 255)
                printword(levelstat[level][7],-1,HEIGHT/2,size*1.5,size*1.5)
                noTint()
                --fontsise=HEIGHT/20
             --   fontSize(fontsise2)
                --[[while textSize("Collect "..togo.." To Win!")>WIDTH*2/3 do
                    fontsise2 = fontsise2 - 1
                    fontSize(fontsise2)
                end
                fontSize(fontsise2)
                fill(0, 0, 0, 99)
                text("Collect "..togo.." To Win!",WIDTH/2,HEIGHT/5)
                fill(255, 255, 255, 255)
                text("Collect "..togo.." To Win!",WIDTH/2-sh,HEIGHT/5+sh)]]--
                upshift=HEIGHT/10
                printword("COLLECT",-1,HEIGHT/3.5+upshift,size/1.5,size/1.5)
                a=printnum(togo,WIDTH/2,HEIGHT/5+upshift,size/1.5,size/1.5,-size)
                sprite("Project:cow3",a,HEIGHT/5+upshift,size)
                printword("TO WIN",-1,HEIGHT/8.5+upshift,size/1.5,size/1.5)
        end
        end
            autogun()
        
        --   copter()
        time()
        if txt>200 then
        tint(255, 255, 255, 255)
        sprite("Project:pause",size/2,HEIGHT-size/2,size/1.1,size/1.1)
        
        --[[tint(0, 0, 0, 255)
        sprite("Project:startagain",WIDTH*9.5/10,HEIGHT-HEIGHT*0.022,size)]]--
        checkrestart()
        end
        if fadebig>0 then
            fadebig = fadebig - 2
       --     moonx=moonx-10
            fill(255, 255, 0, fadebig)
            stroke(255, 255, 0, fadebig)
            rect(-1,-1,WIDTH*2,HEIGHT*2)
            --fontSize((WIDTH/4)*fadebig/255)
            tint(255, 249, 0,fadebig)
            --text("BONUS",WIDTH/2,HEIGHT/3)
            sprite("Project:bonus",WIDTH/2,HEIGHT*1.6/3,WIDTH*7/8*(fadebig/255))
            for n = 1,64 do
                if alienpos[3][n]==0 and alienpos[5][n]>0 then
                    alienpos[4][n]=1
                end
            end
           -- for i = 1,30 do
           --     stars[i].x = sstars[i].x- 5
           --     stars[i].y = sstars[i].y- 0.3
           -- end
            if fadebig<5 then
                music.paused=false
                ti=20
             --   moonx=WIDTH/20
                for i=1,64 do
                        if alienpos[3][i]==1 then alienpos[5][i]=0 end --remove mushrooms
                    end
                    for i=1,64 do
                        if alienpos[3][i]==3 then alienpos[5][i]=0 end --remove boom mushrooms
                    end
                    for i=1,64 do
                        if alienpos[3][i]==5 then alienpos[5][i]=0 end --remove evil mushrooms
                    end
            end
        end
        if txt > 240 and CurrentTouch.state==BEGAN then
            if spause==0 and checkbox(WIDTH/20,HEIGHT*9.7/10,size,size)
         --[[       CurrentTouch.x < WIDTH/20+size/2 and CurrentTouch.x>WIDTH/20-size/2 and CurrentTouch.y>HEIGHT*9.7/10-size/2 and CurrentTouch.y<HEIGHT*9.7/10+size/2
]]--
            then
                play = -2
                spause=1
                splay()
                --sound("Game Sounds One:Menu Select")
            end
        else
            spause =0
        end
        
        --checkrestart()
        
        bflash()
        
        if hsf>25 then
            tint(255, 255, 255, hsf)
            hsf = hsf - 1
            --fontSize((WIDTH/8)*hsf/255)
            sprite("Project:High Score",WIDTH/2,HEIGHT*1.6/3,WIDTH*7/8*(hsf/255))
       --     saveLocalData("b",best)
       --     saveLocalData("s",total)
            
        end
        
        
        
        noTint()
        --sprite("Project:cow3",WIDTH/3+textSize(times.."."),HEIGHT*9.7/10,size/2)
        --fontSize(WIDTH/30)
        --[[fill(0, 0, 0, 255)
        text(score,WIDTH/3+textSize("mmm.")+size/2,HEIGHT*9.7/10)
        fill(255, 255, 255, 255)
        text(score,WIDTH/3+textSize("mmm.")+size/2-1,HEIGHT*9.7/10+1)]]--
        
        if togo==0 and comp == 0 then
            ti = ti + 10
            complete = 1
            comp=1
            --fade=180*2
            completeshow=240
            extrabonus = levelstat[level][1]
          --  sky = (20)*60
           -- sky=ti*60
            onscreenb = 0
          --  ti = 20
           
            sound("Dropbox:126420__cabeeno-rossley__game-noises-1")
            music.currentTime=17
            mc=0
            bmc=0
            for i=1,64 do
                if alienpos[3][i]==1 then alienpos[5][i]=0 end --remove mushrooms
            end
            for i=1,64 do
                if alienpos[3][i]==3 then alienpos[5][i]=0 end --remove boom mushrooms
            end
            for i=1,64 do
                if alienpos[3][i]==5 then alienpos[5][i]=0 end --remove evil mushrooms
            end
           
            
            addexplode5(WIDTH/2,copy)
        end
        
        if completeshow>0 then
     --   moonx = moonx - 5*WIDTH/(20*60)
     --   sky = sky + 1.666666
     --   for i = 1,40 do
     --       stars[i].x = sstars[i].x- 5
     --       stars[i].y = sstars[i].y- 0.3
     --   end
       -- if completeshow <5 then
            --sky = holder + 5*60
       -- end
      --  if sky > 20*60 then
      --          sky=20*60
      --      end
        tint(255, 255, 255, completeshow)
        w,h = textSize(ti)
        completeshow = completeshow - 1.5
        --fontSize(completeshow/1.2)
        tint(255, 255, 255, completeshow)
        sprite("Project:Extra Time",WIDTH/2,HEIGHT*1.6/3+textSize(times)/2,WIDTH*7/8*(completeshow/240))
            
            --moonx=moonx-5
            
            
            for i=1,64 do
                if alienpos[3][i]==1 then alienpos[5][i]=0 end --remove mushrooms
                    
                if alienpos[3][i]==3 then alienpos[5][i]=0 end --remove boom mushrooms
                    
                if alienpos[3][i]==5 then alienpos[5][i]=0 end --remove evil mushrooms
            end
            
        
            --[[for i = 1,30 do
                stars[i].x = sstars[i].x- 5
                stars[i].y = sstars[i].y- 0.3
            end
            if moonx<WIDTH*(20-ti+(timer/100))/20 then
                moonx=WIDTH*(20-ti+(timer/100))/20
            end]]--
        end
        
     --   if wait==lim then 
            --addbonus()
            --sound(SOUND_PICKUP, 37018)
    --    end
        
  --  print(wait,lim,levelstat[level][6]*30)
    if wait>lim then
        if onscreenc == 0 then
            addbonus()
            onscreenc = 1
        end
        if wait>lim+levelstat[level][6]*30 then 
        wait=0 
        onscreenc=0
        end
  --          if wait>lim+levelstat[level][6] then
   --             wait=0
             --   alienpos[1][3]=mathrandom(0,WIDTH)
             --   alienpos[2][3]=mathrandom(size,HEIGHT/2.2)
                
     --       end
            
          --  alienpos[3][3]=4
        --    alienpos[5][3]=180
        --    alienpos[6][3]=1
            
    end
    if fading==6 then
        fadeout = fadeout + 10
        tint(255, 255, 255, fadeout)
    sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
        if fadeout>255 then
            setup2()
            play=5
            fadeout=0
        end
     else fadeout=0 
    end
if fading==6 then
    
    else
    fadeout=0
        end
    --    if wait < lim then alienpos[3][3]=0 end   ]]--

    end
    
    
   
    
    



--[[name input screen
if play =="NH" then

    fontSize(HEIGHT/15)
    fill(0, 0, 0, 88)
    text("New Best!",WIDTH/2,HEIGHT*0.9)
    fill(255, 255, 255, 255)
    text("New Best!",WIDTH/2-sh,HEIGHT*0.9+sh)
    showKeyboard()
    bestname=keyboardBuffer()
    fill(0, 0, 0, 100)
    text("Name...",WIDTH/2,HEIGHT/1.5)
    fill(255, 255, 255, 255)
    text("Name...",WIDTH/2-sh,HEIGHT/1.5+sh)
    fill(0, 0, 0, 100)
    text(bestname,WIDTH/2,HEIGHT/1.9)
    fill(255, 255, 255, 255)
    text(bestname,WIDTH/2-sh,HEIGHT/1.9+sh)
    text(".....",WIDTH/2,HEIGHT/1.95)
    saveLocalData("bestname",bestname)
    wobble = wobble + 1
    hxsize=(math.sin((wobble)/60)*WIDTH/128)+size*2
    hysize=(math.sin((wobble)/61)*WIDTH/128)+size*2
    tint(0, 0, 0, 116)
    sprite("Project:play",WIDTH*0.9,HEIGHT/2,hxsize/2+hexscale,hysize/2+hexscale)
    tint(255+hexscale*2, 255+hexscale*2,255 +hexscale*2, 255)
    sprite("Project:play",WIDTH*0.9-sh,HEIGHT/2+sh,hxsize/2+hexscale,hysize/2+hexscale)

        rt,hexscale=checkbutton(WIDTH-hxsize/2,HEIGHT*0.5,hxsize,0.1,hexscale)
        if rt==1 then
            fading=2
        end

if fading == 2 then
fadeout = fadeout + 10
if fadeout>255 then
    hideKeyboard()
    play=-1
    fadeout=0
    sound("Game Sounds One:Menu Select")
end
end
tint(255, 255, 255, fadeout)
sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
end]]--




    --help screen
