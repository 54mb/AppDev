function gameover()
noTint()
    
    if debuged==1 then extrabonus=0 end
    
        --2nd gameover screen
        xs=0
        ys=-HEIGHT/8
        t = t + 1
        --[[background(27, 35, 150-ti*5, 255)
        fill(27, 35, 150-ti*5, 255)
        stroke(27,35,150-ti*5,255)
        rect(-1,HEIGHT/2-size/9,WIDTH+900,HEIGHT+900)
        fill(32, 200, 31, 255)
        stroke(36,200,31,255)
        rect(-1,-1,WIDTH+900,HEIGHT/2-size/9)
        fill(255, 255, 255, 255)
        tint(255, 255, 255, 255)
        fill(137, 162, 223, 255)
        stroke(255, 249, 0, 255)]]--
        sky =moonlerp*20*60
        i=255-(sky/7.5)
        tint(i,i,i,255)
    noTint()
        spriteMode(CORNER)
        sprite("Project:levelback",-1,-1,WIDTH+2,HEIGHT+2)
        spriteMode(CENTER)
    --    fontSize(WIDTH/10)
    --print(level)
        if complete == 1 then
            
            if nomore == 0 then
                if cowstapped<levelstat[level][1] then
                    cowstapped=levelstat[level][1]
                end
                if fillup<0 then fillup=1 end
                scorehold=score
                level = level + 1
                if levelgotto<level then
                levelgotto=level
                saveLocalData("levelgotto",levelgotto)
                if level>levelno then
                    finished=1
                end
                end
                if free==1 and levelgotto==7 then finished=1 end
                nomore = 1
            end
            tint(255, 255, 255, 255)
        --    saveLocalData("level",level)
            --[[fill(0, 0, 0, 91)
            text("Mission Complete",WIDTH/2,HEIGHT*2.6/3)
            fill(255, 255, 255, 255)
            text("Mission Complete",WIDTH/2-sh,HEIGHT*2.6/3+sh)]]--
            tint(255, 255, 255, 255)
            printword("MISSION COMPLETE",-1,HEIGHT*2.8/3,size,size)
        else
            --[[fill(0, 0, 0, 91)
            text("Mission Failed",WIDTH/2,HEIGHT*2.6/3)
            fill(255, 255, 255, 255)
            text("Mission Failed",WIDTH/2-sh,HEIGHT*2.6/3+sh)]]--
            if restarted==0 then
                noTint()
                printword("MISSION FAILED",-1,HEIGHT*2.2/3,size,size)
                printword("YOU HAD "..togo.." [ LEFT",-1,HEIGHT/2,size/1.5,size/1.5)
            else
                noTint()
                printword("MISSION QUIT",-1,HEIGHT*2.2/3,size,size)
            if togo>=1 then
                printword("YOU HAD "..togo.." [ LEFT",-1,HEIGHT/2,size/1.5,size/1.5)
            end
            end
        end
        if complete==0 then
            cowstapped=0
            extrabonus=0
        end
        if gi == 1 then ni = ni + 1 end
        if t >90 then
            if complete==1 then
            if t%3==0 then
            if score<cowstapped+score then
                if cowstapped>9 then
                    levelscore = levelscore + 10
                    cowstapped = cowstapped - 10
                else
                    levelscore = levelscore + 1
                    cowstapped = cowstapped - 1
             end
           --     saveLocalData("score",score)
                sound(SOUND_PICKUP, 32094)
            else
            gi=1
            
            --[[if debugged==0 then
            if ni>45 then
                if score<extrabonus+score then
                            if extrabonus>25 then
                    levelscore = levelscore + 10*full
                    extrabonus = extrabonus - 10
                else
                        levelscore = levelscore + full+1
                        extrabonus = extrabonus - 1
                    end
             --       saveLocalData("score",score)
                    sound(SOUND_PICKUP, 32094)
                end
            end
            end]]--
            end
            end
            
            --stars
            if CurrentTouch.state==BEGAN then
                if cowstapped>0 then
                    levelscore = levelscore + cowstapped
                    
                end
            
            end
            if cowstapped>0 then
            if levelscore>=levelstat[level-1][1] then
                if stcl<1 then
                    stcl=1
                    addexplode7(WIDTH*(1+1)/6,HEIGHT*2.7/4)
                    sound(SOUND_PICKUP, 41961)
                    
                end
            end
            if levelscore>=levelstat[level-1][9]-(levelstat[level-1][9]-levelstat[level-1][1])/2 then
                if stcl<2 then
                    stcl=2
                    addexplode7(WIDTH*(2+1)/6,HEIGHT*2.7/4)
                    sound(SOUND_PICKUP, 41961)
                
                end
            end
            if levelscore>=levelstat[level-1][9] then
                if stcl<3 then
                    stcl=3
                    addexplode7(WIDTH*(3+1)/6,HEIGHT*2.7/4)
                    sound(SOUND_PICKUP, 41961)
                    
                end
            end
            end
            if CurrentTouch.state==BEGAN and debuged==0 then
                cowstapped=0
                --[[if extrabonus>0 then
                    levelscore = levelscore + extrabonus*(full+1)
                    extrabonus = 0
                    
                end]]--
            end
            moveparts()
            drawparts()

            end
        end
        if score>best then
            best=score
         --   saveLocalData("b",score)
            if hs==0 then
                hsf=255
                hs=1
            end
        end
    
        if complete == 1 then
     --   print(leveldata[level-1].score.." "..levelscore)
            if leveldata[level-1].score==0 then better=-1 end
            if levelscore>leveldata[level-1].score then
                if better==0 then 
                    better=1 
                    sound("Dropbox:126421__cabeeno-rossley__level-complete")
                end
                leveldata[level-1].score=levelscore
                saveleveldata()
            end
        
            if stcl>leveldata[level-1].stars then
                leveldata[level-1].stars=stcl
                saveleveldata()
                starcount=0
                for i=1,levelno do
                starcount = starcount + leveldata[i].stars
                end
                if starcount==levelno*3 then finished=1 end
            end
        end
    --    fontSize(HEIGHT/20)
        noTint()
        if complete==1 then
        --tint(172, 223, 154, 255)
        printword("SCORE:",-1,HEIGHT*3.3/4,size/1.45,size/1.45)
        
        printnum(cowstapped,WIDTH/2,HEIGHT*3.1/4,size/1.45,size/1.45,1)
        --tint(255, 187, 0, 255)
        --[[printword("BONUS:",-1,HEIGHT*2.8/4,size/1.5,size/1.5)
        
        tint(255, 255, 255, 255)
        v=printnum(extrabonus,WIDTH/2,HEIGHT*2.6/4,size/1.5,size/1.5,-size)
        --if full>=1 then
            printword("X",v,HEIGHT*2.6/4,size/1.5,size/1.5)
            --v=printnum(extrabonus,WIDTH/2,HEIGHT*2.15/4,size/1.5,size/1.5,-size)
            printnum((full+1),v+size/2.5,HEIGHT*2.6/4,size/1.5,size/1.5)
        --end]]--
        --tint(255, 255, 255, 255)
        
        printword("LEVEL SCORE:"..levelscore,-1,HEIGHT*2.2/4,size/1.5,size/1.5)
        printword("LEVEL BEST:"..leveldata[level-1].score,-1,HEIGHT*1.9/4,size/1.45,size/1.45)
        score=0
        for i=1,levelno do
            score = score + leveldata[i].score
        end
        printword("TOTAL SCORE:"..score,-1,HEIGHT*1.5/4,size/1.25,size/1.25)
        for i = 1,3 do
                tint(0, 0, 0, 106)
                sprite("Project:star",WIDTH*(i+1)/6,HEIGHT*2.7/4,size*1.75)
            end
        
        for i = 0,stcl-1 do
            tint(255, 255, 255, 255)
            sprite("Project:star",WIDTH*(i+2)/6,HEIGHT*2.7/4,size*1.75)
            if t%3==i and t%15<3 then
                addparts(WIDTH*(i+2)/6+samrandm(size),HEIGHT*2.7/4+samrandm(size),samrandm(6),samrandm(6),0.05,60,7)
            end
        end
        if better==1 then
            noTint()
            sprite("Project:better",WIDTH*8/10,HEIGHT*6/10,size*4)
        end
        end
        --[[fill(0, 0, 0, 122)
        text("Bonus: "..extrabonus,WIDTH/2+xs,HEIGHT*3/4+ys)
        fill(255, 255, 255, 255)
        text("Bonus: "..extrabonus,WIDTH/2+xs-sh,HEIGHT*3/4+ys+sh)
        
        fill(0, 0, 0, 122)
        text("Cows Tapped: "..cowstapped,WIDTH/2+xs,HEIGHT*3.3/4+ys)
        fill(255, 255, 255, 255)
        text("Cows Tapped: "..cowstapped,WIDTH/2+xs-sh,HEIGHT*3.3/4+ys+sh)
        if complete==1 then
            fill(0, 0, 0, 122)
            text("Score: "..score,WIDTH/2+xs,HEIGHT*2.7/4+ys)
            fill(255, 255, 255, 255)
            text("Score: "..score,WIDTH/2+xs-sh,HEIGHT*2.7/4+ys+sh)
        else
            fill(0, 0, 0, 122)
            text("Score: "..score,WIDTH/2+xs,HEIGHT*2.7/4+ys)
            fill(255, 255, 255, 255)
            text("Score: "..score,WIDTH/2+xs-sh,HEIGHT*2.7/4+ys+sh)
        end]]--
        
        
        --[[fill(0, 0, 0, 114)
        text(score, WIDTH/2+xs,HEIGHT*3/4+ys)
        fill(255, 255, 255, 255)
        text(score, WIDTH/2+xs-sh,HEIGHT*3/4+ys+sh)]]--
        
    --    fontSize(HEIGHT/15)
        
        --[[fill(0, 0, 0, 93)
        text("Best: "..best, WIDTH/2+xs,HEIGHT*2/4+ys)
        fill(255, 255, 255, 255)
        text("Best "..best, WIDTH/2+xs-sh,HEIGHT*2/4+ys+sh)]]--
        
        --[[fill(0, 0, 0, 87)
        text(best, WIDTH/2+xs,HEIGHT*2.35/4+ys)
        fill(255, 255, 255, 255)
        text(best, WIDTH/2+xs-sh,HEIGHT*2.35/4+ys+sh)]]--
        
        
        --copter()
        if t > 30 then
            --[[if CurrentTouch.state == BEGAN or CurrentTouch.state == MOVING then
                setup2()
                sound("Game Sounds One:Menu Select")
                play = 0
                hideKeyboard()
            end]]--
        end
if cowstapped==0 then
            wobble = wobble + 1.34
            if WIDTH>HEIGHT then size=HEIGHT/10 else size=WIDTH/10 end
            pysize=(math.sin((wobble)/11)*WIDTH/86)+size*2
            pxsize=(math.sin((wobble)/10)*WIDTH/86)+size*2
            bysize=(math.sin((wobble)/20)*WIDTH/64)+size*2
            hxsize=(math.sin((wobble)/10)*WIDTH/112)+size*2
            bxsize=(math.sin((wobble)/10)*WIDTH/112)+size*2
            extrasize=1.25
            if complete==1 then
if hasrated==0 and levelgotto>3 then
sprite("Project:Donate",WIDTH/2,HEIGHT/16,WIDTH*2/4+dexscale+bxsize,HEIGHT/64+dexscale+bysize/1.5)
    if t>15 then
        rt,dexscale=checkbutton(WIDTH/2,HEIGHT/16,WIDTH*2/4+bxsize,HEIGHT/64+bysize,dexscale)
        if rt==1 then
            fading=3
            t=0
            splay()
        end
    end
        if fading==3 then
            setup2()
            openURL('https://itunes.apple.com/us/app/zap-those-cows/id914663982?ls=1&mt=8')
            play=5
            hasrated=1
            saveLocalData("hasrated",1)
        end
    end
            tint(0, 0, 0, 97)
            sprite("Project:next",WIDTH*3.75/5+0.1*size,HEIGHT/5-0.2*size,pxsize*extrasize+exscale,pysize*extrasize+exscale)
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            sprite("Project:next",WIDTH*3.75/5,HEIGHT/5,pxsize*extrasize+exscale,pysize*extrasize+exscale)
            
            tint(255, 255, 255, 255)
            --sprite(numbers[level],WIDTH*2/3,HEIGHT/5,pxsize/2,pysize/2)
            --tint(218, 223, 154, 255)
            --printword("NEXT",WIDTH*3.75/5-(2.5*(size/1.5+exscale/4)*0.3),HEIGHT/5,size/1.5+exscale/4,size/1.5+exscale/4)
            --printnum(level+(harder-800)/50,WIDTH*2/3,HEIGHT/6,(hxsize+exscale)/2,(pysize+exscale)/2,1)
            else
                tint(0, 0, 0, 97)
            sprite("Project:restart",WIDTH*3.75/5+0.1*size,HEIGHT/5-0.2*size,hxsize*extrasize+exscale,bysize*extrasize+exscale)
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            sprite("Project:restart",WIDTH*3.75/5,HEIGHT/5,hxsize*extrasize+exscale,bysize*extrasize+exscale)
              --  sprite("Project:startagain",WIDTH*3.75/5,HEIGHT/5,hxsize/1.5+exscale,bysize/1.5+exscale)
            end
            
            tint(0, 0, 0, 116)
            sprite("Project:backarrow",WIDTH*1.25/5+0.1*size,HEIGHT/5-0.2*size,pxsize*extrasize+bexscale,pysize*extrasize+bexscale)
            tint(255+bexscale*2, 255+bexscale*2,255 +bexscale*2, 255)
            sprite("Project:backarrow",WIDTH*1.25/5,HEIGHT/5,pxsize*extrasize+bexscale,pysize*extrasize+bexscale)
            if complete==1 then
            tint(0, 0, 0, 97)
            sprite("Project:restart",WIDTH/2+0.1*size,HEIGHT/5-0.2*size,hxsize*extrasize+cexscale,bysize*extrasize+cexscale)
            tint(255+cexscale*2, 255+cexscale*2,255 +cexscale*2, 255)
            sprite("Project:restart",WIDTH/2,HEIGHT/5,hxsize*extrasize+cexscale,bysize*extrasize+cexscale)
          --  sprite("Project:startagain",WIDTH/2,HEIGHT/5,hxsize/1.5+cexscale,bysize/1.5+cexscale)
end
            if cowstapped==0 and cowstapped==0 then
    
    rt,exscale=checkbutton(WIDTH*3.75/5,HEIGHT/5,pxsize,pysize,exscale)
    if rt==1 then
        fading=1
        t=0
        splay()
        end
            
        --[[  if checkbox(WIDTH*2/3,HEIGHT/5,pxsize,pysize) then
       --     if CurrentTouch.x>WIDTH*2/3-pxsize/2 and CurrentTouch.x<WIDTH*2/3+pxsize/2 and CurrentTouch.y>HEIGHT/5-pxsize/2 and CurrentTouch.y<HEIGHT/5+pysize/2 then
        --        if astart==0 then
                
               if CurrentTouch.state==BEGAN or CurrentTouch.state==MOVING and fading==0 then 
                    exscale = exscale - 5
                    if exscale<-size/2 then exscale=-size/2 end
                        --print(exscale)
                end
                
                if CurrentTouch.state == ENDED then
                    fading=1
                    t=0
                    astart=1
                    splay()
                end
                else
                if exscale<0 then exscale = exscale + 5 end
                end
            else
                astart=0
                if exscale<0 then
                    exscale = exscale + 5
                end
            end]]--
            --    end
            
            if fading == 1 then

                fadeout = fadeout + 10
            --    exscale = exscale - 10
            --    if exscale<-size/1.5 then exscale=-size/1.5 end
                if fadeout>255 then
                    
                    --[[if complete==0 then 
                        score = 0
                        saveLocalData("score",score)
                    end]]--
    
                    if finished==1 then
play =-5
fadeout=0
sound("A Hero's Quest:Level Up")
fading=0
else
                    setup2()
                    play=1
                    togo=levelstat[level][1]
                    fadeout=255
                   checkdonate()
        
end
                    --sound("Game Sounds One:Menu Select")
                end
            end
            rt,bexscale=checkbutton(WIDTH*1.25/5,HEIGHT/5,pxsize,pysize,bexscale)
            if rt==1 then
                fading=2
                t=0
                splay()
            end
if complete==1 then
            rt,cexscale=checkbutton(WIDTH/2,HEIGHT/5,hxsize,bysize,cexscale)
            if rt==1 and complete==1 then
                fading=-1
                t=0
                splay()
            end
end
        --[[    if checkbox(WIDTH/3,HEIGHT/5,pxsize,pysize) then
         --   if CurrentTouch.x>WIDTH/3-pxsize/2 and CurrentTouch.x<WIDTH/3+pxsize/2 and CurrentTouch.y>HEIGHT/5-pxsize/2 and CurrentTouch.y<HEIGHT/5+pysize/2 then
                if bstart==0 then
                if CurrentTouch.state==BEGAN or CurrentTouch.state==MOVING and fading==0 then 
                    bexscale = bexscale - 5
                    if bexscale<-size/2 then bexscale=-size/2 end
                        --print(exscale)
                end
                
                if CurrentTouch.state == ENDED then
                    fading=2
                    t=0
                    splay()
                    bstart=1
                end
                else
                if bexscale<0 then bexscale = bexscale + 5 end
            end
            else
                bstart=0
                if bexscale<0 then bexscale = bexscale + 5 end
            end]]--
--    end
if fading==-1 then

fadeout = fadeout + 10
if fadeout>255 then

stcl=0
level = level-1
--saveLocalData("level",level)
setup2()
play=1
togo=levelstat[level][1]
complete=0
fadeout=255
end
end


            if fading == 2 then
                fadeout = fadeout + 10
             --   bexscale = bexscale - 5
             --   if bexscale<-size/1.5 then bexscale=-size/1.5 end
                if fadeout>255 then
                    
                    --[[if complete==0 then 
                        score = 0
                        saveLocalData("score",score)
                    end]]--

 
                    
if finished==1 then
level=1
play =-5
sound("A Hero's Quest:Level Up")
fading=0
fadeout=0
else
--level=1

setup2()
play=5
                    togo=levelstat[level][1]
                    fadeout=0
checkdonate()
end
                    --sound("Game Sounds One:Menu Select")
                end

            end
--[[if fading == 4 then
fadeout = fadeout + 10

if fadeout>255 then
setup2()
play=6
fadeout=0
end
end]]--
            tint(255, 255, 255, fadeout)
            sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
            end
        end
       -- music.volume=0.4

end


function gamealmostover()

--saveLocalData("score",score)
        if score>best then
            best=score
       --     saveLocalData("b",score)
            if hs==0 then
                hsf=255
                hs=1
            end
        end

        drawaliens()
        checkaliens()
        copter()

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
        
    --    fontSize(WIDTH/10)
        wobble = wobble + 1.34
        wobble2 = wobble2 + 1
        xsize=size*4--(math.sin(wobble2/50)*WIDTH/32)+size*4
        ysize=size*2--(math.sin(wobble2/86)*WIDTH/32)+size*2
        hxsize=size*2--(math.sin((wobble)/12)*WIDTH/128)+size*2
        hysize=size*2--math.sin((wobble)/13)*WIDTH/128)+size*2
        pysize=size*2--(math.sin((wobble)/11)*WIDTH/86)+size*2
        pxsize=size*2--(math.sin((wobble)/10)*WIDTH/86)+size*2
        bysize=size*2--(math.sin((wobble2)/32)*WIDTH/86)+size*2
        bxsize=size*2--(math.sin((wobble)/33)*WIDTH/86)+size*2

        --[[tint(0, 0, 0, 116)
            sprite("Project:moon",WIDTH*0.9/3+0.1*size,HEIGHT*2/3-0.2*size, pxsize*3/2+exscale,pysize*3/2+exscale)
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            sprite("Project:moon",WIDTH*0.9/3,HEIGHT*2/3,pxsize*3/2+exscale,pysize*3/2+exscale)
        
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            printnum(level+(harder-800)/50,WIDTH*0.9/3+(hxsize+exscale)/5,HEIGHT*2/3,(hxsize+exscale)/2,(bysize+exscale)/2)]]--
moveparts()
drawparts()
  tint(255, 255, 255, 255)
        if complete==1 then
--[[
noTint()
            fill(0, 0, 0, 122)
            text("Mission Complete",WIDTH*2/4,HEIGHT*2/3)
            fill(255, 255, 255, 255)
            text("Mission Complete",WIDTH*2/4-sh,HEIGHT*2/3+sh)]]--
noTint()
            printword("MISSION COMPLETE",-1,HEIGHT*2/3,size,size)
        else
            --[[fill(0, 0, 0, 122)
            text("Mission Failed",WIDTH*2/4,HEIGHT*2/3)
            fill(255, 255, 255, 255)
            text("Mission Failed",WIDTH*2/4-sh,HEIGHT*2/3+sh)]]--
if restarted==0 then
            printword("MISSION FAILED",-1,HEIGHT*2/3,size,size)
else
            printword("MISSION QUIT",-1,HEIGHT*2/3,size,size)
end
        end
        go = go + 1
        if go>180 then
            if hs==0 then
                play=-1
        fadeout=0
            else
                play = -1
            fadeout=0
            end
            sound("Game Sounds One:Menu Select")
            go = 0
        end
    --    saveLocalData("last",score)
    --    last=score
     --   last = readLocalData("last")
      --  music.volume=0.55
end