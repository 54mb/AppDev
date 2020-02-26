
    
function levelselect()
    noTint()
    t = t + 1
    tint(127,127,127,255)
    sprite("Project:levelback",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
    noTint()
    printword("^ "..starcount .."/"..fullstars,WIDTH*3.65/5,HEIGHT*0.05,size/1.5,size/1.5)
    
    for x = 1,3 do
        for y = 1,6 do
            if free==1 then
                if levelgotto>6 then levelgotto=6 end
                noTint()
                printword("PURCHASE FULL VERSION TO UNLOCK",-1,HEIGHT/2.5,size,size)
            end
            s=butscale[x+(6-y)*3]
            noTint()
            if (x+(6-y)*3)>levelgotto or (x+(6-y)*3)>levelno then
                tint(127, 127, 127, 111)
            end
            sprite("Project:moon",(WIDTH*(x*1.5))/6,HEIGHT*y/7,size*2.5+s)
            if (x+(6-y)*3)<=levelgotto then
            printnum(x+(6-y)*3,(WIDTH*(x*1.5))/6,HEIGHT*y/7+size/3,size/1.5,size/1.5,-1)
                if debuged==1 then
            printnum(leveldata[x+(6-y)*3].score,(WIDTH*(x*1.5))/6,HEIGHT*y/7+size/3+40,size/2,size/2,-1)
            end
            for i = -1,1 do
                tint(0, 0, 0, 123)
                sprite("Project:star",(WIDTH*(x*1.5))/6+(i*size/2.25),HEIGHT*y/7-size/3,size/1.5)
            end
            for i = 1,(leveldata[x+(6-y)*3].stars) do
                tint(255, 255, 255, 255)
                sprite("Project:star",(WIDTH*(x*1.5))/6+((i-2)*size/2.25),HEIGHT*y/7-size/3,size/1.5)
            end
            end
            if (x+(6-y)*3)>levelgotto then
                noTint()
                sprite("Project:lock",(WIDTH*(x*1.5))/6,HEIGHT*y/7,size/1.5+s)
            end
            if t>15 and (x+(6-y)*3)<=levelgotto then
                rt,butscale[x+(6-y)*3]=checkbutton((WIDTH*(x*1.5))/6,HEIGHT*y/7,size*2.5,size*1.8,s)
                if rt==1 then
                    fading=2
                    level=x+(6-y)*3
                    splay()
                end
            end
        end
    end
    
    
    --print(fading)
    
    
    wobble = wobble + 1.34
    pysize=(math.sin((wobble)/20)*WIDTH/128)+size*2
    pxsize=(math.sin((wobble)/21)*WIDTH/128)+size*2
    
    tint(0, 0, 0, 116)
    sprite("Project:backarrow",pxsize/2+sh,pysize/2-sh,pxsize+exscale,pysize+exscale)
    tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
    sprite("Project:backarrow",pxsize/2,pysize/2,pxsize+exscale,pysize+exscale)
    
    if t>15 then
        rt,exscale=checkbutton(pxsize/2,pxsize/2,pxsize,pxsize,exscale)
        if rt==1 then
            fading=1
            splay()
        end
        
        if fading == 1 then
            fadeout = fadeout + 10
            if fadeout>255 then
                --sound("Game Sounds One:Menu Select")
                tint(255, 255, 255, fadeout)
                sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
                setup2()
            end
        end
        
        if fading == 2 then
            fadeout = fadeout + 10
            if fadeout>255 then
                --sound("Game Sounds One:Menu Select")
                tint(255, 255, 255, fadeout)
                sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
                setup2()
            --    level=lno
                play=1
            end
        end
        
        tint(255, 255, 255, fadeout)
        sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
    end
end


