function bflash()
    if bigflash>1 then
        bigflash = bigflash - 2
        --fontSize(bigflash/1.2)
        tint(255, 255, 255, bigflash)
        if full>0 and full< 6 then
            --text(times,WIDTH/2,HEIGHT/4+textSize(times)/2)
            sprite(numbers[full+2],WIDTH/2-WIDTH/4* bigflash/500,HEIGHT*2/3,WIDTH*2/4*bigflash/255,WIDTH*2/4*bigflash/255)
            sprite("Project:X",WIDTH/2+WIDTH/4* bigflash/500,HEIGHT*2/3,WIDTH*2/4*bigflash/255,WIDTH*2/4*bigflash/255)
        end
    end
    
    if warnflash>75 then
        warnflash = warnflash - 2
        --fontSize(warnflash*1.2)
        tint(255, 255, 255, warnflash)
        if ti <= 5 then
            if ti >0 then
                sprite(numbers[ti+1],WIDTH/2,HEIGHT*2.4/4+textSize(ti)/2,WIDTH/3*warnflash/200)
            end
        end
    end
end

function getslot()
    for n=1 , 64 do
        if alienpos[5][n]<=0 then  --dead?
            return(n)
        end
    end
    return(1)
end

function getpos(g)
    f=0
    max=50
    while f==0 do
        x=mathrandom(size/2,WIDTH-size/2)
        y=mathrandom(size,HEIGHT/2.2)
        no=0
        for i=1,64 do
            if alienpos[5][i]>0 then
                distx=alienpos[1][i]-x
                disty=alienpos[2][i]-y
                if math.abs(distx*distx+disty*disty) < size*size/1.5 then
                    no=1
                end
            end
        end
        if no==0 or max<=0 then f=1 end
        max = max - 1
    end
    alienpos[1][g]=x
    alienpos[2][g]=y
end
        

function addmushroom()
    if complete==0 then
        g=getslot()
        getpos(g)
        alienpos[3][g]=1
        alienpos[4][g]=0
        alienpos[5][g]=mathrandom(300,400)
        alienpos[6][g]=1
        alienpos[7][g]=1
        alienpos[8][g]=0
    end
end

function addmushroom2()
    if complete==0 then
        g=getslot()
        getpos(g)
        alienpos[3][g]=3
        alienpos[4][g]=0
        alienpos[5][g]=mathrandom(300,400)
        alienpos[6][g]=1
        alienpos[7][g]=1
        alienpos[8][g]=0
    end
end

function addmushroom3()
    if complete==0 then
        g=getslot()
        getpos(g)
        alienpos[3][g]=5
        alienpos[4][g]=0
        alienpos[5][g]=mathrandom(300,400)
        alienpos[6][g]=1
        alienpos[7][g]=1
        alienpos[8][g]=0
    end
end

function addtimer()
    if levelstat[level][10]>=1 then
        g=getslot()
        getpos(g)
        alienpos[3][g]=2
        alienpos[4][g]=0
        alienpos[5][g]=180
        alienpos[6][g]=1
        alienpos[7][g]=0
        alienpos[8][g]=0
    end
end

function addbonus()
    if levelstat[level][6]>0 and complete == 0 then
        g=getslot()
        getpos(g)
        alienpos[3][g]=4
        alienpos[4][g]=0
        alienpos[5][g]=levelstat[level][6]*30
        alienpos[6][g]=1
        alienpos[7][g]=0
        alienpos[8][g]=0
        sound(SOUND_POWERUP, 32112)
    end
end

function addcow(w)
    g=getslot()
    getpos(g)
    alienpos[3][g]=0
    alienpos[4][g]=0
    alienpos[5][g]=1
    alienpos[6][g]=1
    alienpos[7][g]=0
    if w==0 then
        alienpos[8][g]=0
    else
        alienpos[8][g]=mathrandom(120,6*60)
    end
    alienpos[9][g]=mathrandom(1,4)
    alienpos[10][g]=0
end

beats={1,2,3,4}

cols={
    {255,255,0},
    {255,0,255},
    {255,0,0},
    {0,255,0},
    {0,255,255},
    {0,0,255}
}

function drawaliens()
    if WIDTH<700 then
        size=WIDTH/8
    end
    if mc > levelstat[level][2] then mc=levelstat[level][2] end
    if bmc > levelstat[level][3] then mc=levelstat[level][3] end
    if cmc > levelstat[level][4] then mc=levelstat[level][4] end
  --  jon=0
    
    beat=56
    for n=1,4 do
        beats[n]=beats[n]+1
        if beats[n]>=beat then beats[n]=0 end
    end
    
    for n = 1,64 do
        
      --  if rythym == 1 and complete==1 then
      --      alienpos[9][n]=mathrandom(-3,3)
     --   end
        
        
        if alienpos[5][n]>0 then    --alive
    --    jon=jon+1
    --    if alienpos[2][n]>HEIGHT/2.2 and alienpos[4][n]==0 then alienpos[2][n]=mathrandom(size,HEIGHT/2.2) end   --sky bug hack!!! 
        
        if play == 1 or play == -0.5 then tint(255, 255, 255, 255) else tint(127, 127, 127, 233)end
        if alienpos[3][n] ==  1 then    --mushroom
            if alienpos[4][n]==1 then
                tint(227, 116, 110, 255)
                if play == -2 then tint(224, 130, 155, 59) end
            end
            sprite("Project:mushroom",alienpos[1][n],alienpos[2][n],size*0.75*alienpos[6][n])
            rotate(0)
            --text(alienpos[5][n],alienpos[1][n],alienpos[2][n])
        end
        if alienpos[3][n] == 0 then
            --            tint(0,0,0,50)
            --            sprite("Platformer Art:Coin",alienpos[1][n],alienpos[2][n]-size/2,size,size/2)
            if alienpos[4][n]==1 then
                tint(255, 255, 255, 255)
                if play == -2 then tint(127, 127, 127, 108)  end
            end
            if alienpos[4][n]==2 then
                tint(231, 91, 83, 255)
                if play == -2 then tint(229, 91, 106, 134) end
            end
            if alienpos[8][n]==0 then
                if alienpos[4][n]==1 or alienpos[4][n]==2 then
                    alienpos[10][n]=alienpos[10][n]+(alienpos[9][n]-2.5)
                    pushMatrix()
                    translate(alienpos[1][n],alienpos[2][n]) 
                    rotate(alienpos[10][n])
                    sprite("Project:glowcow",0,0,size*1.1)
                    popMatrix()
                else
                    jx=alienpos[1][n]
                    jy=alienpos[2][n]
                        if complete==1 then
                            jy=jy+math.abs(math.sin((beats[alienpos[9][n]])/9)*20)
                        end
                    tint(0, 0, 0, 40)
                    sprite("Project:moon2",alienpos[1][n],alienpos[2][n]-size/2.5,size*0.9,size/3)
                    depth=255--alienpos[2][n]/5
                    tint(depth,depth,depth,255)
                    pushMatrix()
                    translate(jx,jy) 
                    if complete==1 then rotate(math.sin((beats[alienpos[9][n]])/9)*20) end
                    sprite("Project:cow3",0,0,size)
                    popMatrix()
                    
                 --[[   alienpos[9][n]=alienpos[9][n]+1
                    if play==-2 then else
                    if complete==0 then
                        if alienpos[9][n]>0 and alienpos[9][n]<32.5 then
                            alienpos[10][n]=math.abs(math.sin((alienpos[9][n])/10)*10)
                            else
                            alienpos[10][n]=0
                        end
                    else
                        if alienpos[9][n]>0 and alienpos[9][n]<32.5 then
                            alienpos[10][n]=math.abs(math.sin((alienpos[9][n])/10)*30)
                            else
                            alienpos[10][n]=0
                        end
                    end]]--
                   -- end
                end
                fill(0, 0, 0, 255)
                --text(n,alienpos[1][n],alienpos[2][n])
            else
                if play==1 then
                    alienpos[8][n]=alienpos[8][n]-1
                end
            end
        end
        
        if alienpos[3][n] ==  2 then
            if alienpos[4][n]==1 then
                tint(255, 255, 255, 255)
                if play == -2 then tint(255, 255, 255, 50) end
            end
            if alienpos[4][n]==2 then
                tint(255, 14, 0, 255)
                if play == -2 then tint(231, 81, 121, 59) end
            end
            if alienpos[4][n]==0 then
                if alienpos[8][n]==0 then
                sprite("Project:timer",alienpos[1][n],alienpos[2][n],size*0.75*alienpos[6][n])
                else
                    if play==1 then
                        alienpos[8][n]=alienpos[8][n]-1
                    end
                end
            end
        end
      
        if alienpos[3][n] ==  3 then    --mushroom
            if alienpos[4][n]==1 then
                tint(227, 116, 110, 255)
                if play == -2 then tint(224, 130, 155, 59) end
            end
            if alienpos[4][n]==0 then
            sprite("Project:sheep",alienpos[1][n],alienpos[2][n],size*0.75*alienpos[6][n])
            addexplode6(alienpos[1][n]+size*0.4*alienpos[6][n],alienpos[2][n]+size*0.5*alienpos[6][n])
            end
            rotate(0)
            --text(alienpos[5][n],alienpos[1][n],alienpos[2][n])
        end
            
        if alienpos[3][n] ==  5 then    --mushroom
            if alienpos[4][n]==1 then
                tint(227, 116, 110, 255)
                if play == -2 then tint(224, 130, 155, 59) end
            end
            if alienpos[4][n]==0 then
            sprite("Project:bomb2",alienpos[1][n],alienpos[2][n],size*1*alienpos[6][n])
            addexplode6(alienpos[1][n]+size*0.32*alienpos[6][n],alienpos[2][n]+size*0.37*alienpos[6][n])   
            end
            rotate(0)
            --text(alienpos[5][n],alienpos[1][n],alienpos[2][n])
        end
        
        if alienpos[3][n] ==  4 then    --Bonus
            tint(255, 255, 255, 255)
            if alienpos[4][n]==1 then
                tint(255, 255, 255, 255)
            end
            if play == -2 then tint(255, 255, 255, 101) end
            if alienpos[4][n]==0 then
                --if bonus>6 then bonus=6 end
                
                
                if bonus<6 then
                    sprite(btext[bonus][1],alienpos[1][n],alienpos[2][n],size*alienpos[6][n])
                end
            end
        end
    end
    
    end
    
--draw writing
    for n = 1,20 do
        
    if writing[n][4]>0 then
          noTint()
 --       if writing[n][3]==levelstat[level][5] or writing[n][3]==times then
        --    fontSize(HEIGHT/15)
            --writing[n][3]=times
  --          else
         --   fontSize(HEIGHT/25)
 --       end
        if writing[n][3] ~= 0 then
            if writing[n][5]==0 then
   --                 tint(248, 255, 0, writing[n][4]*4.25)
                   -- fill(248, 255, 0, writing[n][4]*4.25)
                    --text(writing[n][3].."!",writing[n][1],writing[n][2]+30-writing[n][4]/2)
                    printnum(writing[n][3],writing[n][1],writing[n][2]+30-writing[n][4]/2,HEIGHT/25,HEIGHT/25)
            end
            if writing[n][5]==1 then
                  --  fill(248, 255, 0, writing[n][4]*4.25)
                    i=writing[n][6]
                    tint(cols[i][1],cols[i][2],cols[i][3], writing[n][4]*4.25)
                    --text(writing[n][3].."!",writing[n][1],writing[n][2]+30-writing[n][4]/2)
                    printnum(writing[n][3],writing[n][1],writing[n][2]+30-writing[n][4]/2,HEIGHT/25,HEIGHT/25)
                    
                    sprite("Project:X",writing[n][1]-HEIGHT/40,writing[n][2]+30-writing[n][4]/2,HEIGHT/25,HEIGHT/25)
            end
            if writing[n][5]==-1 or writing[n][5]==-3 then
             --   fill(255, 0, 8, writing[n][4]*5+10)
               tint(255, 0, 0, writing[n][4]*4.25)
     --           fontSize(HEIGHT/20)
                
                --text(writing[n][3],writing[n][1],writing[n][2])
                printnum(writing[n][3],writing[n][1]+HEIGHT/40,writing[n][2],HEIGHT/25,HEIGHT/25)
                
            end
        end
            if writing[n][5]==-2 then
                tint(255,255,255, writing[n][4]*2.125)
                sprite("Project:explosion",writing[n][1],writing[n][2],size*3*3/3+45-writing[n][4]/2,size*3*3/3+45-writing[n][4]/2)
            end
            if writing[n][5]==-3 then
                tint(255,255,255, writing[n][4]*2.125)
                sprite("Project:explosion",writing[n][1],writing[n][2],size*3*3/2+45-writing[n][4]/2,size*3*3/2+45-writing[n][4]/2)
            end
            if writing[n][5]==-1 then
                tint(53, 50, 27, writing[n][4]*2.125)
                sprite("Project:explosion",writing[n][1],writing[n][2],size*3*3/6+45-writing[n][4]/2,size*3*3/6+45-writing[n][4]/2)
            end
            writing[n][4]=writing[n][4]-1
        end
    end
    size=WIDTH/10
   -- print(jon)
end

function checkaliens()
    if WIDTH<700 then
        size=WIDTH/8
    end
for n = 1,64 do
    if alienpos[5][n]>0 and alienpos[8][n]==0 then  --alive
    
--touched anything?
    if checkbox(alienpos[1][n],alienpos[2][n],size,size) then
    --if CurrentTouch.x < alienpos[1][n]+size/2 and CurrentTouch.x>alienpos[1][n]-size/2 and CurrentTouch.y>alienpos[2][n]-size/2 and CurrentTouch.y<alienpos[2][n]+size/2 then
        if CurrentTouch.state==BEGAN and CurrentTouch.y < HEIGHT/2 or CurrentTouch.state==MOVING and CurrentTouch.y < HEIGHT/2 and play == 1 then
            if play == 1 then
                if alienpos[4][n]==0 then
                    if alienpos[3][n]==0 then
                      if fillup > levelstat[level][5] then
                            if full < 6 then
                                full = full + 1
                                bigflash=240
                                fillup = 0
                                addcow(0)
                                sound("Dropbox:126422__cabeeno-rossley__level-up", 2.0)
                                
                                else
                                fillup = levelstat[level][5]
                            end
                        end
                        
                        if m > 7 then  --add mushroom
                            mc = mc + 1
                            if mc > levelstat[level][2] then mc=levelstat[level][2] else
                                addmushroom()
                            end
                            m=0
                        end
                        
                        if bm > 10 then  --add boom mushroom
                            bmc = bmc + 1
                            if bmc > levelstat[level][3] then bmc=levelstat[level][3] else
                                addmushroom2()
                            end
                            bm=0
                        end
                        
                        if cm > 15 then  --add boom mushroom
                            cmc = cmc + 1
                            if cmc > levelstat[level][4] then cmc=levelstat[level][4] else
                                addmushroom3()
                            end
                            cm=0
                        end
                        
                        
                        if clock > li and complete == 0 then  --add timer
                        --    li = li + 0.5
                            addtimer()
                            clock=0
                      --      if onscreen == 0 then
                                
                      --          onscreen = 1
                        --    end
                        end
                    else
                    
                    if fillup< 0 then
                        if full > 0 then
                            fillup = levelstat[level][5] + fillup
                            else
                            fillup = 0
                        end
                        full = full - 1
                        if full < 0 then
                            full = 0
                        end
                    end
                    
                    if score<0 then score=0 end
                end
            end
            
            if alienpos[3][n]==0 then   --cow
                if alienpos[8][n]==0 then
                    if alienpos[4][n]==0 then
                        if complete==1 then
                            --if full>=1 then
                                x=e
                                samwrite(alienpos[1][n],alienpos[2][n],full+1,90,1)
                              e=x
                         --[[       writing[e][1]=alienpos[1][n]
                                writing[e][2]=alienpos[2][n]
                                writing[e][3]=full+1
                                writing[e][4]=90
                                writing[e][5]=1 ]]--
                                cowstapped = cowstapped + (full)
                            --end
                        end
                        fillup = fillup + 1
                        clock = clock + 1
                        if fillup % 10 == 0 or fillup > levelstat[level][5]-10 then
                        else
                            sound("Dropbox:126418__cabeeno-rossley__button-select")
                        end
                        addexplode1(alienpos[1][n],alienpos[2][n])
                        alienpos[4][n]=1
                        m = m + 1
                        bm = bm + 0.975
                        cm = cm + 0.95
                        
                        
                    
                    if fillup % 10 == 0 or fillup > levelstat[level][5]-10 then
                        p=levelstat[level][5]-fillup
                        if p > 10 then p = (p / 10) +10 end
                        pitch=2-p/14
                        sound("Dropbox:126413__cabeeno-rossley__collect-special-coin", 1.0, pitch)
                        
                        if fillup==50 then p=120
                        else if fillup>=40 then p=15 else p=60 end end
                        samwrite(alienpos[1][n],alienpos[2][n],fillup,p,0)
                    --[[    e=1
                        writing[e][1]=alienpos[1][n]
                        writing[e][2]=alienpos[2][n]
                        writing[e][3]=fillup
                        if writing[n][3]==50 then
                            writing[e][4]=120
                            else
                            writing[e][4]=60
                        end
                        writing[e][5]=0]]--
                        if fillup>=levelstat[level][5] then
                            fillup=0
                            if full<6 then
                                sound("Dropbox:126422__cabeeno-rossley__level-up", 2.0)
                            addcow(0)
                            full = full + 1
                            fil=fillup*4
                            bigflash=240
                            end
                        
                        end
                        
                        end
                    end
                end
            end
            if alienpos[3][n]== 1 and alienpos[7][n]==1 and levelstat[level][2]>0 then
                sound(SOUND_EXPLODE, 2081)
                if cowstapped>10 then
                    cowstapped = cowstapped - 10
                end
                addexplode2(alienpos[1][n],alienpos[2][n])
                
                
                --[[for i = 1,20 do
                if writing[i][4]<5 then e = i end
            end]]--
            samwrite(alienpos[1][n],alienpos[2][n],-10,90,-1)
         --[[   e = e + 1
            if e >20 then e = 1 end
            writing[e][1]=alienpos[1][n]
            writing[e][2]=alienpos[2][n]
            writing[e][3]=-10
            writing[e][4]=90
            writing[e][5]=-1]]--
            
            fillup = fillup - 10
            if fillup<0 then fillup = 0 end
            
            
            
        end
                
        if alienpos[3][n]== 3 and alienpos[7][n]==1 and levelstat[level][3]>0 then
                sound(SOUND_EXPLODE, 2081)        
                sound("Dropbox:Goat")
                
                addexplode2(alienpos[1][n],alienpos[2][n])
            samwrite(alienpos[1][n],alienpos[2][n],0,90,-2)
         --[[   e = e + 1
            if e >20 then e = 1 end
            writing[e][1]=alienpos[1][n]
            writing[e][2]=alienpos[2][n]
            writing[e][3]=0
            writing[e][4]=90
            writing[e][5]=-2]]--
            
            for i = 1,64 do
                if alienpos[5][i]>0 then
                noTint()
                if alienpos[3][i]==0 then
                    distx=alienpos[1][n]-alienpos[1][i]
                    disty=alienpos[2][n]-alienpos[2][i]
                    if math.abs(distx*distx+disty*disty) < size*size*3 then
                        alienpos[4][i]=2
                        alienpos[7][i]=0
                        if cowstapped>2 then
                            cowstapped = cowstapped - 2
                        end
                    end
                end
                end
            end
        end
            
        if alienpos[3][n]== 5 and alienpos[7][n]==1 and levelstat[level][4]>0 then
                sound(SOUND_EXPLODE, 2081)
                
                addexplode2(alienpos[1][n],alienpos[2][n])
            samwrite(alienpos[1][n],alienpos[2][n],-fillup,90,-3)
                    
         --[[   e = e + 1
           if e >20 then e = 1 end
           writing[e][1]=alienpos[1][n]
            writing[e][2]=alienpos[2][n]
            writing[e][3]=-fillup
            writing[e][4]=90
            writing[e][5]=-3]]--
            
            
            fillup = fillup - fillup
            if fillup<0 then fillup = 0 end
            
            if fillup==0 then
                full = full - 1
                if full<0 then full=0 end
            end            
            
            if cowstapped>fillup then
                    cowstapped = cowstapped - fillup
                end
                    
            for i = 1,64 do
                if alienpos[5][i]>0 then
                noTint()
                if alienpos[3][i]==0 then
                    distx=alienpos[1][n]-alienpos[1][i]
                    disty=alienpos[2][n]-alienpos[2][i]
                    if math.abs(distx*distx+disty*disty) < size*size*4.5 then
                        alienpos[4][i]=2
                        alienpos[7][i]=0
                    end
                end
                end
            end
        end
                    
                    
        if alienpos[3][n]==2 and alienpos[4][n]==0 then
            addexplode4(alienpos[1][n],alienpos[2][n])
            li = li + 1
            clockb = clockb + 1
            cowstapped = cowstapped + 5
        --    if sky > 20*60 then
        --        sky=20*60
        --    end
        --    holder=sky
            onscreen = 0
            ti = ti + 5
            fade = 180
            alienpos[4][n]=1
            sound("Dropbox:clock")
        end
        
        if play == 1 and alienpos[3][n]==4 then
                    wait=0
            if bonus<6 then
                alienpos[5][n]=0
                -- alienpos[1][n]=mathrandom(0,WIDTH)
                -- alienpos[2][n]=mathrandom(size,HEIGHT/2.2)
                -- alienpos[4][n]=0
                cowstapped = cowstapped + 10
                addexplode3(alienpos[1][n],alienpos[2][n])
                bonus = bonus + 1
                wait = 0
                onscreenc=0
       --         alienpos[1][n]=mathrandom(0,WIDTH)
     --           alienpos[2][n]=mathrandom(size,HEIGHT/2.2)
      --          alienpos[4][n]=0
                sound(SOUND_POWERUP, 30714, 2)
                
            end
            if bonus==6 then
                lim = lim + 60
                if lim > 600 then lim = 600 end            
      --          limit = limit - 5
       --         if limit < 100 then limit = 100 end
        --        saveLocalData("limit",limit)
         --       saveLocalData("lim",lim)
                    clockb = 1
                --    sky = 20*60
                    onscreenb = 0
                    ti = 20
                    bonus=1
                    mc=0
                    bmc=0
                    cmc=0
                    for i=1,64 do
                        if alienpos[3][i]==1 then alienpos[5][i]=0 end --remove mushrooms
                    end
                    for i=1,64 do
                        if alienpos[3][i]==3 then alienpos[5][i]=0 end --remove boom mushrooms
                    end
                    for i=1,64 do
                        if alienpos[3][i]==5 then alienpos[5][i]=0 end --remove evil mushrooms
                    end
                    fadebig=240
                    alienpos[4][n]=1
                    sound("Dropbox:bonus2")
                    music.paused=true
                    addexplode5(WIDTH/2,copy)
                    beats[1]=11
                    beats[2]=12
                    beats[3]=13
                    beats[4]=14

            end
        end
            
        if alienpos[4][n]==2 then
            else
            if alienpos[8][n]==0 then
              alienpos[4][n]=1
            end
        end
    end
end
end

if alienpos[4][n] == 2  and play ==1 or alienpos[4][n] == 2 and play == -2 or play == -0.5 and alienpos[4][n]==2 then
    if play==1 then
        --addexplode2(alienpos[1][n],alienpos[2][n])
        alienpos[2][n]=alienpos[2][n]-alienpos[7][n]
        alienpos[7][n]=alienpos[7][n]+0.3
    end
    if alienpos[2][n]<-HEIGHT then
        alienpos[5][n]=0
        addcow(1)
     --   alienpos[1][n]=mathrandom(0,WIDTH)
     --   alienpos[2][n]=mathrandom(size,HEIGHT/2.2)
     --   alienpos[4][n]=0
     --   alienpos[7][n]=1
      --  alienpos[8][n]=mathrandom(120,6*60)
    end
end


if (alienpos[4][n] == 1)  and (play ==1 or play == -2 or play == -0.5) then
    stroke(42, 255, 0, 77)
    strokeWidth(5)
    if alienpos[3][n]==0 then
        line(copx,copy,alienpos[1][n]+0.25*size*math.sin(alienpos[2][n]/4),alienpos[2][n])
    end
    if play == 1 and alienpos[3][n]==0 or play == -0.5 and alienpos[3][n]==0 then
        lerpx=(alienpos[1][n]-copx)/8
        if lerpx>15 then lerpx=15 end
        if lerpx<-15 then lerpx=-15 end
        alienpos[1][n] = alienpos[1][n] - lerpx
        if alienpos[2][n]<copy then alienpos[2][n] = alienpos[2][n] +7.5 end
        
        if alienpos[2][n]>=copy then
            alienpos[5][n]=0
            addcow(0)
          --  alienpos[1][n]=mathrandom(0,WIDTH)
          --  alienpos[2][n]=mathrandom(size,HEIGHT/2.2)
          --  alienpos[4][n]=0
                if play==1 then
            cowstapped = cowstapped + 1
            
            togo = togo - 1
            total = total + 1
            end
       --     saveLocalData("s",total)
       --     if alienpos[3][n]==2 or alienpos[3][n]==3 then
       --       --  alienpos[3][n]=0
       --         alienpos[5][n]=0
       --     end
        end
    end
    
    if play == 1 and alienpos[3][n]==1 or play == -0.5 and alienpos[3][n]==1 then
        --addexplode2(alienpos[1][n],alienpos[2][n])
        alienpos[2][n]=alienpos[2][n]-alienpos[7][n]
        alienpos[7][n]=alienpos[7][n]+0.5
        if alienpos[2][n]<-HEIGHT then
            alienpos[5][n]=0
            addmushroom()
        end
    end
    
    if play == 1 and alienpos[3][n]==3 or play == -0.5 and alienpos[3][n]==3 then
        --addexplode2(alienpos[1][n],alienpos[2][n])
        alienpos[2][n]=alienpos[2][n]-alienpos[7][n]
        alienpos[7][n]=alienpos[7][n]+0.5
        if alienpos[2][n]<-HEIGHT then
            alienpos[5][n]=0
            addmushroom2()
        end
    end
            
    if play == 1 and alienpos[3][n]==5 or play == -0.5 and alienpos[3][n]==3 then
        --addexplode2(alienpos[1][n],alienpos[2][n])
        alienpos[2][n]=alienpos[2][n]-alienpos[7][n]
        alienpos[7][n]=alienpos[7][n]+0.5
        if alienpos[2][n]<-HEIGHT then
            alienpos[5][n]=0
            addmushroom3()
        end
    end
    
    
    if play == 1 and alienpos[3][n]==2 then
        tint(255, 255, 255, texttint)
    --    fontSize(size/255*texttint)
        --text("+5",alienpos[1][n],alienpos[2][n])
        sprite("Project:+",alienpos[1][n]-(size/255*texttint)/3,alienpos[2][n],size/255*texttint)
        sprite("Project:5",alienpos[1][n]+(size/255*texttint)/3,alienpos[2][n],size/255*texttint)
        texttint = texttint - 3
        if texttint<0 then
  --          alienpos[1][n]=mathrandom(0,WIDTH)
  --          alienpos[2][n]=mathrandom(size,HEIGHT/2.2)
  --          alienpos[4][n]=0
  --          alienpos[3][n]=0
            alienpos[5][n]=0
            texttint=255
        end
    end
    
    if play == 1 and alienpos[3][n]==4 then
        
        
    end
end
        -- check to shrink objects
        
        if (alienpos[3][n]==1 or alienpos[3][n]==2 or alienpos[3][n]==3 or alienpos[3][n]==4 or alienpos[3][n]==5) and play == 1 then
            
            alienpos[5][n]=alienpos[5][n]-1 --run down timer
            if alienpos[5][n] < 90 and alienpos[5][n]>60 then
                alienpos[6][n]=alienpos[6][n] + 0.01
            end
            if alienpos[5][n]<60 then
                alienpos[6][n]=alienpos[6][n] - 0.1
                if alienpos[6][n]<0 then
                    alienpos[5][n]=-5
                end
            end
            if alienpos[5][n]<=0 and alienpos[3][n]==1 then addmushroom() end
            if alienpos[5][n]<=0 and alienpos[3][n]==3 then addmushroom2() end
            if alienpos[5][n]<=0 and alienpos[3][n]==5 then addmushroom3() end
       --[[  if alienpos[5][n] < 0 then
              alienpos[1][n]=mathrandom(0,WIDTH)
                alienpos[2][n]=mathrandom(size,HEIGHT/2.2)
                alienpos[5][n]=mathrandom(300,400)
                alienpos[6][n]=1
                if alienpos[3][n]==2 or alienpos[3][n]==3 then
                    alienpos[3][n]=0
                    clock=0
                    alienpos[5][n]=180
                end
            end ]]--
            if alienpos[4][n]==1 then
                alienpos[6][n]=1
            end
            if alienpos[3][n]==2 and alienpos[6][n]<=0 then
                alienpos[5][n]=0
             --   alienpos[3][n]=0
            end
        end
end
end
size=WIDTH/10
end