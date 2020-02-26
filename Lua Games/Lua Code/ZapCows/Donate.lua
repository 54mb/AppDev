function checkdonate()
    if level==4 and hasdonated==0 then
        play=6
        hasdonated=1
        saveLocalData("hasdonated",1)
        fadeout=0
        mode=5
        end
end
    
function donate()
    spriteMode(CENTER)

        noTint()
    sprite("Project:donate back",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
    spriteMode(CENTER)
    t = t + 1
    wobble = wobble + 1.34
    wobble2 = wobble2 + 1
    xsize=(math.sin(wobble2/32)*WIDTH/87)
    ysize=(math.sin(wobble2/34)*WIDTH/89)
    hxsize=(math.sin((wobble)/24)*WIDTH/84)
    hysize=(math.sin((wobble)/25)*WIDTH/85)
    bysize=(math.sin((wobble)/30)*WIDTH/86)
    bxsize=(math.sin((wobble)/32)*WIDTH/86)
    pysize=(math.sin((wobble2)/32)*WIDTH/86)+size*2
    pxsize=(math.sin((wobble)/33)*WIDTH/86)+size*2
    
    if hasrated==0 then rt=3/5 else rt=2.8/5 end
    sprite("Project:Childsplay",WIDTH/2,HEIGHT*rt,WIDTH*3/4+exscale+xsize,HEIGHT/4+exscale+ysize)
    if t>15 then
        rt,exscale=checkbutton(WIDTH/2,HEIGHT*rt,WIDTH*3/4,HEIGHT/4,exscale)
        if rt==1 then
            fading=1
            t=0
            splay()
        end
        if fading==1 then
            setup2()
            openURL('http://www.childsplaycharity.org/donate')
            play=mode
        end
    end
    
    if hasrated==0 then rt=1.75/5 else rt=1.3/5 end
    sprite("Project:Anaphylaxis",WIDTH/2,HEIGHT*rt,WIDTH*3/4+bexscale+hxsize,HEIGHT/4+bexscale+hysize)
    if t>15 then
        rt,bexscale=checkbutton(WIDTH/2,HEIGHT*rt,WIDTH*3/4,HEIGHT/4,bexscale)
        if rt==1 then
            fading=2
            t=0
            splay()
        end
        if fading==2 then
            setup2()
            openURL('http://www.anaphylaxis.org.uk/get-involved/ways-to-donate')
            play=mode
        end
    end
    
    if hasrated==0 then
    sprite("Project:Donate",WIDTH/2,HEIGHT/6.5,WIDTH*3/5+cexscale+bxsize,HEIGHT/8+cexscale+bysize)
    if t>15 then
        rt,cexscale=checkbutton(WIDTH/2,HEIGHT/6.5,WIDTH*3/5,HEIGHT/8,cexscale)
        if rt==1 then
            fading=3
            t=0
            splay()
        end
        if fading==3 then
            setup2()
            openURL('https://itunes.apple.com/us/app/zap-those-cows/id914663982?ls=1&mt=8')
            play=mode
            hasrated=1
            saveLocalData("hasrated",1)
        end
    end
    end
    sprite("Project:backarrow",size,size,dexscale+pxsize,dexscale+pysize)
    if t>15 then
        rt,dexscale=checkbutton(size,size,pxsize,pysize,dexscale)
        if rt==1 then
            fading=4
            splay()
        end
        if fading==4 then
            fadeout = fadeout + 10
            if fadeout>255 then
                setup2()
                play=mode
            end
        end
         tint(255, 255, 255, fadeout)
            sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
    end
end
