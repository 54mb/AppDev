function GUI()
    --if wave/5==math.floor(wave/5) or health==0 then
    if bossflashtime<120 then
        if bossflashtime==0 then redpulse=0 end
        bossflashtime = bossflashtime + 1
        redpulse = redpulse + 0.125
        red=math.sin(redpulse)*25+25
        if green<0 then green = green + 0.5 end
        if green>0 then green = green - 0.5 end
    else
        if doneflashtime<120 then
            if doneflashtime==0 then greenpulse=0 end
            doneflashtime = doneflashtime + 1
            greenpulse = greenpulse + 0.125
            green=math.sin(greenpulse)*25+25
            if red<0 then red = red + 0.5 end
            if red>0 then red = red - 0.5 end
        else
            if red<0 then red = red + 0.5 end
            if red>0 then red = red - 0.5 end
            if green<0 then green = green + 0.5 end
            if green>0 then green = green - 0.5 end
        end
    end
    if dead==0 then
    spriteMode(CENTER)
    if pause==0 then
            
        sprite("Project:Pause",WIDTH-size/2,HEIGHT-size/2,size,size)
            
            else
            
        sprite("Project:Quit",WIDTH-size/2,HEIGHT-size/2,size,size)
        
            
        end
        
        spriteMode(CENTER)
        for k,touch in pairs(touches) do
            if touch.x>WIDTH-size and touch.y >HEIGHT-size then
                if pausepressx==touch.x and pausepressy==touch.y then else
                    if pause==0 then
                        pause=1
                        pausepressx=touch.x
                        pausepressy=touch.y
                        sound(SOUND_JUMP, 6432)
                        
                    end
                end
            end
            if pause==1 then
                if touch.x>WIDTH-size and touch.y >HEIGHT-size then
                    if touch.state==BEGAN then
                    if pausepressx==touch.x and pausepressy==touch.y then else
                        
                            dead=1
                            sound(SOUND_JUMP, 6432)
                            
                        
                    end
                    end
                else
                    if touch.state==BEGAN then
                        if pausepressx==touch.x and pausepressy==touch.y then else
                            pause=0
                            pausepressx=touch.x
                            pausepressy=touch.y
                            sound(SOUND_JUMP, 6432)
                            
                        end
                        
                    end
                end
            end
            
        end
        
        if pause==1 then
            printword("PAUSED",-1,HEIGHT/2,size,size)
            printword("TAP ANYWHERE TO CONTINUE",-1,HEIGHT/2+size,size/2,size/2)
            printword("TAP THE TOP RIGHT TO QUIT",-1,HEIGHT/2-size,size/2,size/2)
        end
    end
    for i=1,health do
        --sprite("Project:Hero",(size*i*1.5)/2.5,HEIGHT*9.75/10,size/2)
    end
    
    if dead==0 then
        printword("HIGHSCORE:"..highscore,-1,HEIGHT*9.75/10,size/3,size/3)
        h=size/2
        printword("SCORE:"..score,-1,HEIGHT*9.75/10-h,size/3,size/3)
        
        
        if wave/5==math.floor(wave/5) then
            printword("BOSS WAVE",-1,HEIGHT*9.75/10-2*h,size/3,size/3)
        else
            printword("WAVE:"..wave,-1,HEIGHT*9.75/10-2*h,size/3,size/3)
        end
        
        if msg=="WAVE COMPLETE" then
            enemiesleft=0
        end
        h=size/2
        printword("ENEMIES LEFT:"..enemiesleft,10,HEIGHT*9.75/10,size/3,size/3)
        
        pushMatrix()
        translate(0,-HEIGHT/8+size/2)
        strokeWidth(size/2)
        lineCapMode(SQUARE)
        stroke(255, 255, 255, 56)
        --line(WIDTH/2-size*2,HEIGHT/8,WIDTH/2+size*2,HEIGHT/8)
        stroke(0, 255, 247, 255)
        line(WIDTH/2-size*2,HEIGHT/8,WIDTH/2-size*2+(size*4)*(pointsfilled/tofillup),HEIGHT/8)
        
        pushMatrix()
        translate(WIDTH/2,HEIGHT/8)
        rotate(90)
        sprite("Project:Bar",0,0,size,size*5.5)
        popMatrix()
        
        if backwardslaser==1 then
            sprite("Project:Bomb",WIDTH/2+size*2.325,HEIGHT/8,size/2)
            sprite("Project:Bomb",WIDTH/2-size*2.325,HEIGHT/8,size/2)
        else
            if nextupgrade==-1 then
                sprite("Tyrian Remastered:Powerup 7",WIDTH/2+size*2.325,HEIGHT/8,size/2)
                sprite("Tyrian Remastered:Powerup 7",WIDTH/2-size*2.325,HEIGHT/8,size/2)
            end
            if nextupgrade==1 then
                sprite("Tyrian Remastered:Powerup 10",WIDTH/2+size*2.325,HEIGHT/8,size/2)
                sprite("Tyrian Remastered:Powerup 10",WIDTH/2-size*2.325,HEIGHT/8,size/2)
            end
        end
        popMatrix()
        if bombno>0 then
            
            sprite("Project:Bomb",WIDTH/2,HEIGHT*1/10,size*2,size*2)
            printword("X"..bombno,WIDTH/2+size/1.8,HEIGHT*1/10-size/1.8,size/2,size/2)
        end
        
        
        
        for k,touch in pairs(touches) do
            if touch.x>WIDTH/2-size and touch.x<WIDTH/2+size and touch.y<HEIGHT*1/10+size and touch.y>HEIGHT*1/10-size then
                if touch.state==BEGAN and bombno>0 then
                    if pausepressx==touch.x and pausepressy==touch.y then else
                        pausepressx=touch.x
                        pausepressy=touch.y
                        if bombno>0 then
                            bombno = bombno - 1
                            addringexplode(herox-xoff,heroy-yoff)
                            justblewup=5
                        end
                    end
                end
            end
        end
    end
    
    
    noTint()
    if dead==1 then
        deadtimer = deadtimer + 1
        fontSize(math.floor(size/3))
        fill(255,255,255,deadtimer*5)
        printword("HIGHSCORE:"..highscore,-1,HEIGHT*5.75/10,size/3,size/3)
        h=size/2
        printword("SCORE:"..score,-1,HEIGHT*5.75/10-h,size/3,size/3)
        printword("WAVE:"..wave,-1,HEIGHT*5.75/10-2*h,size/3,size/3)
        for k,touch in pairs(touches) do
            if touch.state==BEGAN and deadtimer >30 then
                if pausepressx==touch.x and pausepressy==touch.y then else
                    saveLocalData("highscore",highscore)
                    saveLocalData("cw11b",highscore/3+1)
                    saveLocalData("cw12h",highscore/3+5)
                    saveLocalData("Liam","Sucks")
                    setup()
                    pausepressx=touch.x
                    pausepressy=touch.y
                    sound(SOUND_JUMP, 6432)
                end
            end
        end
    end
    
    if play=="title" then
        back()
        deadtimer = deadtimer + 1
        --words("ASTEROIDS",WIDTH/2,HEIGHT*2/3,size)
        printword("GALAXIA WARS",-1,HEIGHT*2/3,size,size)
        printword("HIGHSCORE:"..highscore.." POINTS",-1,HEIGHT*5.75/10,size/3,size/3)
        h=size/2
        printword("LONGEST STREAK:"..bestwave.." WAVES",-1,(HEIGHT*5.75/10)-h,size/3,size/3)
        printword("ENEMIES KILLED:"..enemieskilled,-1,(HEIGHT*5.75/10)-h*2,size/3,size/3)
        printword("BOSS WAVES DONE:"..bosswavesdone,-1,(HEIGHT*5.75/10)-h*3,size/3,size/3)
        titleflash=titleflash+1
        if titleflash>45 then
        printword("TAP TO START",-1,(HEIGHT*4.5/10)-h*3,size/1.5,size/1.5)
        end
        if titleflash>90 then titleflash=0 end


        for k,touch in pairs(touches) do
            if touch.state==BEGAN and deadtimer >30 and (touch.x<WIDTH-size*1.5 or touch.y>size*1.5)then
                if pausepressx==touch.x and pausepressy==touch.y then else
                    setup2()
                    play="game"
                    newmessage("WAVE "..wave,180)
                    pausepressx=touch.x
                    pausepressy=touch.y
                    sound(SOUND_JUMP, 6432)
                end
            end
        end


    end

end

function words2(t,x,y,s)
    noTint()
    fontSize(math.floor(s))

    fill(0, 0, 0, gameovertint)
    text(t,x+s/20,y-s/30)
    fill(255, 255, 255, gameovertint)
    
    text(t,x,y)
end

function words(t,x,y,s)
    noTint()
    fontSize(math.floor(s))
    
    fill(0, 0, 0, 255)
    text(t,x+s/20,y-s/30)
    fill(255, 255, 255, 255)
    
    text(t,x,y)
end
