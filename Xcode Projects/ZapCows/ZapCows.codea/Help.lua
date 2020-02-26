function help()
    spriteMode(CORNER)

        noTint()
        sprite("Project:levelback",-1,-1,WIDTH+2,HEIGHT+2)
        spriteMode(CENTER)

        wobble = wobble + 1.34
        pysize=(math.sin((wobble)/20)*WIDTH/128)+size*2
        pxsize=(math.sin((wobble)/21)*WIDTH/128)+size*2
        
        --fontSize(HEIGHT/15)
        --[[fill(31, 44, 78, 255)
        text("Help",WIDTH/2,HEIGHT*0.95)
        fill(255, 255, 255, 255)
        text("Help",WIDTH/2-1,HEIGHT*0.95+1)]]--
        h=HEIGHT*0.06
        s=size/1.5
        --fontSize(HEIGHT/17)
        if WIDTH>HEIGHT then size=HEIGHT/10 else size=WIDTH/10 end
        tint(0, 0, 0, 100)
        sprite("Project:cow3",WIDTH/4,HEIGHT*0.96-h,size)
        tint(255, 255, 255, 255)
        sprite("Project:cow3",WIDTH/4-sh,HEIGHT*0.96+sh-h,size)
    
        --[[fill(0, 0, 0, 85)
        text("1 Point",WIDTH*2/3,HEIGHT*0.96-h)
        fill(255, 255, 255, 255)
        text("1 Point",WIDTH*2/3-sh,HEIGHT*0.96+sh-h)]]--
        printword("GOOD",WIDTH/2,HEIGHT*0.96-h,s,s)
    
        tint(0, 0, 0, 81)
        sprite("Project:mushroom",WIDTH/4,HEIGHT*0.8-h,size)
        tint(255, 255, 255, 255)
        sprite("Project:mushroom",WIDTH/4-sh,HEIGHT*0.8-h+sh,size)
    
        --[[fill(0, 0, 0, 83)
        text("Not Good.",WIDTH*2/3,HEIGHT*0.8-h)
        fill(255, 255, 255, 255)
        text("Not Good.",WIDTH*2/3-sh,HEIGHT*0.8+sh-h)]]--
        printword("NOT GOOD",WIDTH/2,HEIGHT*0.8-h,s,s)
    
        tint(0, 0, 0, 81)
        sprite("Project:sheep",WIDTH/4,HEIGHT*0.64-h,size)
        tint(255, 255, 255, 255)
        sprite("Project:sheep",WIDTH/4-sh,HEIGHT*0.64+sh-h,size)
        addexplode6(WIDTH/4+size*0.47,HEIGHT*0.65-h+size*0.5)
        --[[fill(0, 0, 0, 83)
        text("Explodes.",WIDTH*2/3,HEIGHT*0.64-h)
        fill(255, 255, 255, 255)
        text("Explodes.",WIDTH*2/3-sh,HEIGHT*0.64+sh-h)

        fill(0, 0, 0, 83)
        text("Just Don't",WIDTH*2/3,HEIGHT*0.48-h)
        fill(255, 255, 255, 255)
        text("Just Don't",WIDTH*2/3-sh,HEIGHT*0.48+sh-h)]]--
        printword("EXPLODES",WIDTH/2,HEIGHT*0.64-h,s,s)
        printword("AVOID",WIDTH/2,HEIGHT*0.48-h,s,s)

        tint(0, 0, 0, 91)
        sprite("Project:bomb2",WIDTH/4,HEIGHT*0.48-h,size)
        if free~=1 then
        tint(255, 255, 255, 255)
        end
        sprite("Project:bomb2",WIDTH/4-sh,HEIGHT*0.48+sh-h,size)
        addexplode6(WIDTH/4+size*0.27,HEIGHT*0.4775-h+size*0.5)
        tint(0, 0, 0, 91)
        sprite("Project:timer",WIDTH/4,HEIGHT*0.32-h,size)
        if free~=1 then
        tint(255, 255, 255, 255)
        end
        sprite("Project:timer",WIDTH/4-sh,HEIGHT*0.32-h+sh,size)
    
        --[[fill(0, 0, 0, 84)
        text("Add 5 Sec.",WIDTH*2/3,HEIGHT*0.32-h)
        fill(255, 255, 255, 255)
        text("Add 5 Sec.",WIDTH*2/3-sh,HEIGHT*0.32+sh-h)]]--
        printword("EXTRA TIME",WIDTH/2,HEIGHT*0.32-h,s,s)
    
        --fontSize(WIDTH/10)
        fill(212, 212, 13, 255)
        u = u + 1
        if u>60 then
            bonus = bonus + 1
            u=0
            if bonus>=6 then bonus=1 end
        end
        
        
        fill(212, 212, 13, 255)
        sprite(btext[bonus][1],WIDTH/4,HEIGHT*0.16-h,size)
        --fontSize(HEIGHT/17)
        --[[fill(0, 0, 0, 102)
        text("Bonus",WIDTH*2/3,HEIGHT*0.16-h)
        fill(255, 255, 255, 255)
        text("Bonus",WIDTH*2/3-sh,HEIGHT*0.16+sh-h)]]--
        printword("BONUS",WIDTH/2,HEIGHT*0.16-h,s,s)
    
    t = t + 1
moveparts()
           drawparts()
 --   tint(0, 0, 0, 116)
 --       sprite("Project:backarrow",pxsize/2+0.1*size,pysize/2-0.2*size,pxsize+exscale,pysize/1.5+exscale)
        tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
        sprite("Project:backarrow",pxsize/2,pysize/2,pxsize+exscale,pysize+exscale)
    
        helpscroll = helpscroll + 1
        if helpscroll>300 then
        i=helpscroll-300
        if i>255 then i=255 end
        tint(248, 255, 0, i)
        printword("SAM BURTON [ FACEPLANT GAMES 2014",-1,size/4,size/2.5,size/2.5)
        noTint()
        end
    
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
                fadeout=0
            end
        end
        tint(255, 255, 255, fadeout)
        sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
    end

    end