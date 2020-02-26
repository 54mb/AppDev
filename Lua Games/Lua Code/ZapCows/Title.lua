function title()
t = t + 1
        --ys=-HEIGHT/8
        xs=0
        strokeWidth( 5)
    --    fontSize(20)
        rectMode(CORNERS)
        rectMode()
        fill(137, 162, 223, 255)
        stroke(255, 249, 0, 255)
        spriteMode(CORNER)
        noTint()
        sprite("Project:levelback",-1,-1,WIDTH+2,HEIGHT+2)
    spriteMode(CENTER)
sprite("Project:star",size*8.5,size*2,size*1.5)
    
if t%15==0 then
    addparts(size*8.5+samrandm(size),size*2+samrandm(size),samrandm(6),samrandm(6),0.05,40,7)
end

--tint(0, 0, 0, 211)
--printword(starcount.."/"..fullstars,size*8.05+sh,size-sh,size/1.75,size/1.75)
noTint()
printword(starcount.."/"..fullstars,size*8.05,size,size/1.75,size/1.75)
--printnum(levelno*3,tu+size/1.25,size*0.4,size*0.5,size*0.5)
        
        --[[copter()
        --fontSize(WIDTH/8)
        
        fill(35, 31, 109, 255)
        text("Cow-Tastrophy",WIDTH/2,HEIGHT*0.15)
        fill(255, 255, 255, 255)
        text("Cow-Tastrophy",WIDTH/2-1,HEIGHT*0.15+1)
        ]]--
fill(255, 255, 255, 255)
        
moveparts()
drawparts()

        wobble = wobble + 1.34
        wobble2 = wobble2 + 1
        xsize=(math.sin(wobble2/32)*WIDTH/87)+size*4
        ysize=(math.sin(wobble2/34)*WIDTH/89)+size*2
        hxsize=(math.sin((wobble)/24)*WIDTH/84)+size*2
        hysize=(math.sin((wobble)/25)*WIDTH/85)+size*2
        bysize=(math.sin((wobble)/11)*WIDTH/86)+size*2
        bxsize=(math.sin((wobble)/10)*WIDTH/86)+size*2
        pysize=(math.sin((wobble2)/32)*WIDTH/86)+size*2
        pxsize=(math.sin((wobble)/33)*WIDTH/86)+size*2
        
        --fontSize(HEIGHT/20)
        --if best>0 then
        rise = textSize("Best")/2
        fill(0, 0, 0, 91)
tint(0, 0, 0, 211)
siz=size/1.75
xsiz=size
ysiz=size*0.6
xssiz=siz*10
ysiz=size/2

if score>0 then
--[[tint(0, 0, 0, 211)
    printword("CURRENT SCORE: "..score,xsiz+sh,ysiz*2-sh,siz,siz)
       -- printnum(score,size+(size/1.6)*15/1.5+sh,pysize/2+ys+rise-sh,size/1.6,size/1.6)
noTint()
printword("CURRENT SCORE: "..score,xsiz,ysiz*2,siz,siz)]]--
else ysiz=size/1.25
end
    ysiz=size
--tint(0, 0, 0, 211)
--printword("SCORE: "..score,xsiz+sh,ysiz-sh,siz,siz)
       -- printnum(best,xsiz+xssiz+sh,ysiz-sh,siz,siz)
noTint()
        printword("SCORE: "..score,xsiz,ysiz,siz,siz)
       -- printnum(best,xsiz+xssiz,ysiz,siz,siz)
        --end
    if score>0 then
        fill(0, 0, 0, 91)
        --[[text("Current Score: "..score,bxsize/4+textSize("Current Score: "..score)/1.9,bysize/2+ys+rise)
        fill(255, 255, 255, 255)
        text("Current Score: "..score,bxsize/4+textSize("Current Score: "..score)/1.9-sh,bysize/2+ys+sh+rise)]]--
tint(0, 0, 0, 202)
        
        --printnum(score,size+(size/1.6)*15/1.5,pysize/2+ys+rise,size/1.6,size/1.6)
    end
        --[[
        --fontSize(HEIGHT/20)
    
        fill(35, 31, 109, 255)
        text("Total Collected", WIDTH/2+xs,HEIGHT*2.5/4+ys)
        fill(255, 255, 255, 255)
        text("Total Collected", WIDTH/2+xs-1,HEIGHT*2.5/4+ys+1)
        
        fill(35, 31, 109, 255)
        text(total, WIDTH/2+xs,HEIGHT*2.25/4+ys)
        fill(255, 255, 255, 255)
        text(total, WIDTH/2+xs-1,HEIGHT*2.25/4+ys+1)
        
        
        flashc = flashc + 1
        if flashc>45 then
            flashc=-45
        end
        if flashc>0 then
            fill(35, 31, 109, 255)
            text("Tap To Play...", WIDTH/2+xs,HEIGHT*1.8/4+ys)
            fill(255, 255, 255, 255)
            text("Tap To Play...", WIDTH/2+xs-1,HEIGHT*1.8/4+ys+1)
        end]]--
        
        noTint()     

        sprite("Project:Title",WIDTH/2,copy-size/3,xsize*1.5,ysize*1.7)

        sprite("Project:titleship",WIDTH/2.5+pysize/2,HEIGHT/2.25+pxsize/1.5,WIDTH/1.2)
        

-- if level>1 then
            --tint(0, 0, 0, 116)
            --sprite("Project:button",WIDTH/2+0.1*size,HEIGHT/2-0.2*size,pxsize/2+rexscale,pysize*2+rexscale)
            tint(255+rexscale*2, 255+rexscale*2,255 +rexscale*2, 255)
            sprite("Project:button",WIDTH/2,HEIGHT/3,pxsize*2.5+rexscale,pysize/1.75+rexscale)
        
            tint(255+rexscale*2, 255+rexscale*2,255 +rexscale*2, 255)
            printword("PLAY",-1,HEIGHT/3,pxsize/3+rexscale/4,pysize/3+rexscale/4)
            
            --printnum(level+(harder-800)/50,WIDTH/2,HEIGHT/2.2,(size*2+exscale)/2,(size*2+exscale)/2,1)
    
    --[[else
            --tint(0, 0, 0, 116)
            --sprite("Project:button",WIDTH/2+0.1*size,HEIGHT/2-0.2*size,pxsize*2+exscale,pysize*2+exscale)
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            sprite("Project:button",WIDTH/2,HEIGHT/3,pxsize*2.5+exscale,pysize/1.25+exscale)
        
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            printword("PLAY",-1,HEIGHT/3,pxsize/2.25+exscale/3,pysize/2+exscale/3)]]--
            --printnum(level+(harder-800)/50,WIDTH/2,HEIGHT/2.2,(size*2+exscale)/2,(size*2+exscale)/2,1)
            --sprite(numbers[level],WIDTH/2,HEIGHT/2,(pxsize+exscale)/2,(pysize+exscale)/2)
 --     end
       -- if level>1 then
            --tint(0, 0, 0, 116)
            --sprite("Project:button",WIDTH/2+0.1*size,HEIGHT*1.2/4-0.2*size,hxsize*2+exscale,hysize*2+exscale)
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            sprite("Project:button",WIDTH/2,HEIGHT*1/4,hxsize*2.5+exscale,hysize/1.75+exscale)
        
            tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
            --sprite(numbers[level],WIDTH/2,HEIGHT/2,(pxsize+exscale)/2,(pysize+exscale)/2)
            printword("HELP",-1,HEIGHT*1/4,hxsize/3+exscale/4,hxsize/3+exscale/4)




            --sprite("Project:startagain",WIDTH/2,HEIGHT*1.2/4,(pxsize+rexscale)*0.7,(pysize+rexscale)*0.7)
     --   end
        
        --[[tint(0, 0, 0, 116).   help button
        sprite("Project:help",WIDTH-hxsize/2+0.05*size,hysize/2-0.1*size,hxsize/2+hexscale,hysize/2+hexscale)
        tint(255+hexscale*2, 255+hexscale*2,255 +hexscale*2, 255)
        sprite("Project:help",WIDTH-hxsize/2,hysize/2,hxsize/2+hexscale,hysize/2+hexscale)
    
        rt,exscale=checkbutton(WIDTH/2,HEIGHT*1/4,hxsize,hysize,exscale)
        if rt==1 then
            fading=2
            splay()
        end]]--

  -- if level>1 then
        rt,exscale=checkbutton(WIDTH/2,HEIGHT*1/4,pxsize*2.5,pysize/1.5,exscale)
        if rt==1 then
            fading=2
            t=0
            splay()
        end
        rt,rexscale=checkbutton(WIDTH/2,HEIGHT/3,pxsize*2.5,pysize/1.75,rexscale)
        if rt==1 then
            fading=1
            t=0
            splay()
        end
  --[[  else
        rt,exscale=checkbutton(WIDTH/2,HEIGHT/3,pxsize*2.5,pysize/1.25,exscale)
        if rt==1 then
            fading=1
            t=0
            splay()
        end
    end]]--
--levelselect
        if fading == 1 then
            fadeout = fadeout + 10
            if fadeout>255 then
                setup2()
                play=5
              --togo=levelstat[level][1]
                fadeout=0
                --sound("Game Sounds One:Menu Select")
                
            end
        end
        --[[if level>1 then
            if fading == 3 then
                fadeout = fadeout + 5
                if fadeout>255 then
                    setup2()
                    play=5
                    level=1
                    saveLocalData("level",1)
                    score = 0
                    saveLocalData("score",0)
                    harder=800
                    saveLocalData("harder",800)
                    limit=180
                    saveLocalData("limit",180)
                    lim=240
                    saveLocalData("starcount",0)
                    starcount=0
                    saveLocalData("lim",240)
                    togo=levelstat[level][1
                    fadeout=255
                    --sound("Game Sounds One:Menu Select")
                end
            end]]--
        --end
--help
        if fading == 2 then
            fadeout = fadeout + 10
       --     hexscale = hexscale - 5
        --    if hexscale<-size/1.5 then hexscale=-size/1.5 end
            if fadeout>255 then
                setup2()
                play=0.5
                fadeout=0
                helpscroll=0
            end
        end
tint(255+dexscale*2, 255+dexscale*2,255 +dexscale*2, 255)
            sprite("Project:button",WIDTH/2,HEIGHT*0.67/4,ysize*2.5+dexscale,ysize/1.75+dexscale)
        tint(255+dexscale*2, 255+dexscale*2,255 +dexscale*2, 255)
            
            --sprite(numbers[level],WIDTH/2,HEIGHT/2,(pxsize+exscale)/2,(pysize+exscale)/2)
            printword("DONATE",-1,HEIGHT*0.67/4,ysize/3+dexscale/4,ysize/3+dexscale/4)

rt,dexscale=checkbutton(WIDTH/2,HEIGHT*0.6/4,ysize*2.5,ysize/2,dexscale)
        if rt==1 then
            fading=3
            t=0
            splay()
        end
tint(255, 255, 255, fadeout)
        sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
if fading == 3 then
fadeout = fadeout + 10

if fadeout>255 then
setup2()
play=6
mode=0
fadeout=0
end
end

        
end






