function time()
    tint(255, 255, 255, 255)
    --sprite("SpaceCute:Collision Circle",WIDTH/2+size/4,HEIGHT*9.8/10,w*1.4,h*1.4)
    fill(255-ti*17, 0, 0, 255)
    --fontSize(25)
    font("HelveticaNeue-Bold")
    --text(ti,WIDTH/2+size/4,HEIGHT*9.8/10)
    w,h = textSize(ti)
    if play == 1 and txt > 180 then
     --   if completeshow<=1 then
        timer = timer - 1
   --     end
     --   moonx=moonx+WIDTH/(20*60)
     --   sky = sky - 1
    end
    if timer <= 0 then
        ti = ti - 1
        st = st + 1
        if ti<5 then
            --sound(SOUND_PICKUP, 1438)
            --[[if moonx==WIDTH*(20-ti)/20 then
            else
                moonx=WIDTH*(20-ti)/20
            end]]--
        end
        timer = 60
    end
    if ti <= 0 then
        play = -0.5
        ni=0
        gi=0
        fadeout=0
        fading=0
        t = 0
        playsound=0
        if complete==0 then
            sound("Dropbox:126420__cabeeno-rossley__game-noises-1")
        else
            sound("Dropbox:126422__cabeeno-rossley__level-up")
        end
        extrabonus = levelstat[level][1]
    end
    if fade >0 then
    --    moonx = moonx - 5*WIDTH/(20*60)
    --    sky = sky + 1.666666*3
    --    for i = 1,40 do
    --       stars[i].x = sstars[i].x- 5
    --        stars[i].y = sstars[i].y- 0.3
    --    end
        if fade <5 then
            --sky = holder + 5*60
        end
     --   if sky > 20*60 then
     --           sky=20*60
     --       end
        fade = fade - 3
        tint(255, 255, 255, fade)
        w,h = textSize(ti)
        --sprite("Platformer Art:Coin",WIDTH/2+size/4,HEIGHT*9.8/10,w*1.4,h*1.4)
    end
--[[ if st > 0 then
        s=mathrandom(1,30)
        stars[1][s]=mathrandom(0,WIDTH)
        stars[2][s]=mathrandom(HEIGHT/2,HEIGHT)
        st = 0
    end]]--
    
    if ti <= 5 then
        if timer == 60 then
            sound(SOUND_BLIT, 37086)
            warnflash=200
        end
    end
end