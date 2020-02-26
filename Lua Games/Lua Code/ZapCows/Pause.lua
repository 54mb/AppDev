function pause()
    soundplay=0
        music.volume=vol
        t = t + 1
        ys=-HEIGHT/8
        xs=0
        
        drawaliens()
        checkaliens()
        drawparts()
        copter()
        --fontSize(20)
        fill(127, 127, 127, 81)
        rect(-100,-100,WIDTH*2,HEIGHT*2)
        fill(127, 127, 127, 249)
        stroke(255, 249, 0, 255)
       --[[ line(copx,copy,WIDTH/2+(textSize("Tap To Resume")/1.7)+xs-20,HEIGHT*2.2/4+ys)
        line(copx,copy,WIDTH/2-(textSize("Tap To Resume")/1.7)+xs+20,HEIGHT*2.2/4+ys)
        rect(WIDTH/2-(textSize("Tap To Resume")/1.7)+xs,HEIGHT*1.7/4+ys,WIDTH/2+(textSize("Total Collected")/1.7)+xs,HEIGHT*2.3/4+ys)
        fontSize(30)
        fill(35, 31, 109, 255)
        text("Paused",WIDTH/2+xs,HEIGHT*2.1/4+ys)
        fill(255, 255, 255, 255)
        text("Paused",WIDTH/2-1+xs,HEIGHT*2.1/4+1+ys)
        time()
        fill(0, 0, 0, 255)
        fontSize(15)
        
        
        
        fontSize(20)
        fill(35, 31, 109, 255)
        text("Tap To Resume",WIDTH/2+xs,HEIGHT*1.9/4+ys)
        fill(255, 255, 255, 255)
        text("Tap To Resume",WIDTH/2-1+xs,HEIGHT*1.9/4+1+ys)]]--
        
        wobble = wobble + 1.34
        wobble2 = wobble2 + 1
        xsize=(math.sin(wobble2/50)*WIDTH/60)
        ysize=(math.sin(wobble2/86)*WIDTH/64)
        hxsize=(math.sin((wobble)/60)*WIDTH/128)
        hysize=(math.sin((wobble)/61)*WIDTH/128)
        pysize=(math.sin((wobble)/79)*WIDTH/86)
        pxsize=(math.sin((wobble)/78)*WIDTH/86)
        bysize=(math.sin((wobble2)/32)*WIDTH/86)+size*2
        bxsize=(math.sin((wobble)/33)*WIDTH/86)+size*2
noTint()
        --fontSize(HEIGHT/13)
        printword("PAUSED",-1,HEIGHT*3.15/4,size,size)
        --[[fill(0, 0, 0, 107)
        text("Paused",WIDTH/2+xs+xsize,HEIGHT*3.15/4+ys+ysize)
        fill(255, 255, 255, 255)
        text("Paused",WIDTH/2+xs-sh+xsize,HEIGHT*3.15/4+ys+sh+ysize)]]--
        

--tint(174, 223, 166, 255)
        --fontSize(HEIGHT/20)
if togo>0 then
        z=printnum(togo,WIDTH/2,HEIGHT*2.3/4,size/1.5,size/1.5,-size/1.5)
        sprite("Project:cow3",z,HEIGHT*2.3/4,size/1.5,size/1.5)
printword("TO GO!",-1,HEIGHT*2/4,size/1.5,size/1.5)
end
        --[[fill(0, 0, 0, 104)
        text(togo.." To Go!", WIDTH/2+xs+hxsize,HEIGHT*2.6/4+ys+hysize)
        fill(255, 255, 255, 255)
        text(togo.." To Go!", WIDTH/2+xs-sh+hxsize,HEIGHT*2.6/4+ys+sh+hysize)]]--
        
        --[[fill(0, 0, 0, 118)
        text(togo, WIDTH/2+xs+hxsize,HEIGHT*2.35/4+ys+hysize)
        fill(255, 255, 255, 255)
        text(togo, WIDTH/2+xs-sh+hxsize,HEIGHT*2.35/4+ys+sh+hysize)
        
        fill(0, 0, 0, 107)
        text("To Go!", WIDTH/2+xs+hxsize,HEIGHT*2.1/4+ys+hysize)
        fill(255, 255, 255, 255)
        text("To Go!", WIDTH/2+xs-sh+hxsize,HEIGHT*2.1/4+ys+sh+hysize)]]--
        
        --fontSize(HEIGHT/14)
        flashc = flashc + 1
        if flashc>45 then
            flashc=-30
        end
        if flashc>0 then
            noTint()
            printword("TAP TO CONTINUE",-1,HEIGHT*1/4+pysize,size,size)
            --[[fill(0, 0, 0, 98)
            text("Tap To", WIDTH/2+xs+pxsize,HEIGHT*1.7/4+ys+pysize)
            fill(255, 255, 255, 255)
            text("Tap To", WIDTH/2+xs-sh+pxsize,HEIGHT*1.7/4+ys+sh+pysize)
            
            fill(0, 0, 0, 103)
            text("Continue...", WIDTH/2+xs+pxsize,HEIGHT*1.4/4+ys+pysize)
            fill(255, 255, 255, 255)
            text("Continue...", WIDTH/2+xs-sh+pxsize,HEIGHT*1.4/4+ys+sh+pysize)]]--
        end
        
        --copter()
        
          autogun()
        
        tint(255, 255, 255, 255)
        sprite("Project:startagain",WIDTH*9.5/10-1,HEIGHT-size/2,size)
        spriteMode(CENTER)
            if CurrentTouch.state == BEGAN then
                --sound("Game Sounds One:Menu Select")
                if spause == 0 then
                    splay()
                    play = 1
                    spause=1
                end
            else
                spause = 0
            end
            checkrestart()

        --[[fontSize(WIDTH/25)
        fill(0, 0, 0, 255)
        text(score,copx,copy)
        fill(255, 255, 255, 255)
        text(score,copx-1,copy+1)]]--
        --fontSize(WIDTH/30)
       --[[ fill(0, 0, 0, 255)
        text(score,WIDTH/3+textSize("mmm.")+size/2,HEIGHT*9.7/10)
        fill(255, 255, 255, 255)
        text(score,WIDTH/3+textSize("mmm.")+size/2-1,HEIGHT*9.7/10+1)]]--
end
