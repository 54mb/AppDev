function autogun()
 --[[stroke(0, 0, 0, 127.5)
    fill(0,0,0,127.5)
    strokeWidth(HEIGHT*0.02)
    rect(WIDTH/7,HEIGHT*9.5/10,WIDTH/3,HEIGHT*9.9/10)
    if fillup> 0 then
        stroke(229, 255, 0, 255)
        fill(229,255,0,255)
        rect(WIDTH/7,HEIGHT*9.5/10,WIDTH/6.5+fillup/(levelstat[level][5])*WIDTH/6,HEIGHT*9.9/10)
    end
    stroke(0, 0, 0, 255)
    fill(255, 255, 255, 0)
    strokeWidth(5)
    rectMode(CORNERS)
    
    rect(WIDTH/7,HEIGHT*9.5/10,WIDTH/3,HEIGHT*9.9/10)
    stroke(255, 255, 255, 255)
    rect(WIDTH/7-0.1,HEIGHT*9.5/10+1,WIDTH/3-1,HEIGHT*9.9/10+0.1)]]--
    if full == 0 then
        times="0X"
    end
    if full == 1 then
        amnt = 60
        times = "2X"
    end
    if full == 2 then
        amnt = 30
        times = "3X"
    end
    if full == 3 then
        amnt = 15
        times = "4X"
    end
    if full == 4 then
        amnt = 7.5
        times = "5X"
    end
    if full == 5 then
        amnt = 3.75
        times = "6X"
    end
    if full == 6 then
        amnt = 1.875
        times = "7X"
    end
    if play == 1 then
        if full > 0 then
            p = p + 0.5
            if full>0 then
                for g = 1,full do
                    --fill(255, 246, 0, 255)
                    tint(223, 211, 151, 255)
                    sprite("Project:Glow",lashole[g][1],lashole[g][2],size)
                    --ellipse(lashole[g][1],lashole[g][2],size/5)
                end
            end
            if p > amnt then
                sound("Game Sounds One:Zapper 1",0.25, 0.25)
                q = q + 1
                if q>full then
                    q=1
                end
                p=0
                done = 0
                for i = 1,64 do
                    if alienpos[5][i]>0 and alienpos[3][i] == 0 and done == 0 then
                        if alienpos[4][i] == 0 then
                            if alienpos[8][i]==0 then
                            total = total + 1
                            done = done + 1
                            xzap=alienpos[1][i]
                            yzap=alienpos[2][i]
                            
                            if m > 15 then  --add mushroom
                            mc = mc + 1
                            if mc > levelstat[level][2] then mc=levelstat[level][2] else
                                addmushroom()
                                end
                            m=0
                            end
                            if bm > 15 then  --add boom mushroom
                            bmc = bmc + 1
                            if bmc > levelstat[level][3] then bmc=levelstat[level][3] else
                                addmushroom2()
                            end
                            bm=0
                        end
                    
                            if clock > li and complete == 0 then  --add timer
                        --    li = li + 0.5
                            addtimer()
                            clock=0
                      --      if onscreen == 0 then
                                
                      --          onscreen = 1
                        --    end
                        end
                        
                      --[[      if clock > li then
                                
                                alienpos[3][1]=2
                                if clock == li then
                                    alienpos[1][1]=mathrandom(0,WIDTH)
                                    alienpos[2][1]=mathrandom(size,HEIGHT/2.2)
                                    
                                    sound(SOUND_POWERUP, 4453)
                                end
                            end ]]--
                        end
                        alienpos[4][i] = 1
                        cowstapped = cowstapped + full
                        end
                    end
                end
            end
            if full > 0 then
                if fadebig<=0 then
                    strokeWidth(5)
                    tint(255,255,0, 125-p*4.25)
                    sprite("Project:Glow",xzap,yzap,size*2,size)
                    stroke(255,255,0, 125-p*4.25)
                    fill(255,255,0, 125-p*4.25)
                    line(lashole[q][1],lashole[q][2],xzap+math.abs(1/2*math.sin((timer)/3)*80)-size/4,yzap)
                    tint(255,255,0, 125-p*8.5)
                    sprite("Project:Glow",lashole[q][1],lashole[q][2],size*2,size)
                    -- ellipse(x+math.abs(1/2*math.sin((timer)/3)*80)-size/2,y,size/2.5)
                end
            end
        end
    end
end

