function makepoint(x,y,t,n,c,s)
    for p=1,n do
        foundpoint=0
        for i=1,pointno do
            if foundpoint==0 then
                if points[i][3]==0 then
                    foundpoint=1
                    points[i][1]=x+math.random(math.floor(-size/2),math.floor(size/2))
                    points[i][2]=y+math.random(math.floor(-size/2),math.floor(size/2))
                    points[i][3]=t+math.random(-30,30)
                    points[i][5]=(c/100)*math.random(11,25)/10
                    points[i][6]=(s/100)*math.random(11,25)/10
                    points[i][7]=math.random(1,400)
                    if points[i][7]==1 and health<3 then
                        points[i][7]=2
                    else
                        if points[i][7]==2 and bombno<3 then
                            points[i][7]=3
                        else
                            points[i][7]=1
                        end
                    end
                end
            end
        end
    end
end

function dopoints()
    for i=1,pointno do
        if points[i][3]>0 then
            p=points[i][1]
            q=points[i][2]
            if pause==0 then
            points[i][3]=points[i][3]-1
            p = p+points[i][5]
            q = q+points[i][6]
            end
            if points[i][7]==1 then
            tint(0, 255, 247, points[i][3]*(math.sin(points[i][3]/15)+1.5))
            if math.sin(points[i][3]/5)<0 then
                    sprite("Tyrian Remastered:Energy Orb 1",p+xoff,q+yoff,size/4)
            else
                    sprite("Tyrian Remastered:Energy Orb 2",p+xoff,q+yoff,size/4)
            end
            if herox>p-size*2+xoff and herox<p+size*2+xoff and heroy>q-size*2+yoff and heroy<q+size*2 +yoff and respawnwait<0 then
                p=p+(herox-xoff-p)/10
                q=q+(heroy-yoff-q)/10
                if herox>p-size+xoff and herox<p+size+xoff and heroy>q-size+yoff and heroy<q+size+yoff then
                    pointsfilled = pointsfilled + 1
                    score = score + 1
                    if score>highscore then
                                highscore=score
                                saveLocalData("cw10a",highscore/3)   
                            saveLocalData("highscore",highscore)
                                
                            end
                    sound(SOUND_PICKUP, 14378)
                    
                    points[i][3]=0
                    if pointsfilled>=tofillup then
                        if pointsfilled>tofillup then pointsfilled=tofillup end
                        
                         if maxupgrades==1 then
                                bombno = bombno + 1
                                points[i][3]=0
                                tofillup = tofillup * 2
                                pointsfilled=0
                            end
                            
                        maxupgrades=1
                        if nextupgrade==-1 then
                            if shootspeed>3.75 then
                                shootspeed=shootspeed/2
                                pointsfilled=0
                                tofillup = tofillup * 2
                                nextupgrade=-nextupgrade
                                maxupgrades=0
                                addringexplode2(herox-xoff,heroy-yoff)
                            end
                            if shootspeed<3.7 then shootspeed=3.75 end
                            sound(SOUND_PICKUP, 14380)
                            
                        else
                        if nextupgrade==1 then
                            if numberoflasers==3 then
                                backwardslaser=1
                                pointsfilled=0
                                tofillup = tofillup * 2
                                nextupgrade=-nextupgrade
                                maxupgrades=1
                                addringexplode2(herox-xoff,heroy-yoff)
                            end
                            if numberoflasers<3 then
                                numberoflasers = numberoflasers + 1
                                pointsfilled=0
                                tofillup = tofillup * 2
                                nextupgrade=-nextupgrade
                                maxupgrades=0
                                addringexplode2(herox-xoff,heroy-yoff)
                            end
                            
                            --if numberoflasers>3 then numberoflasers=3 end
                            sound(SOUND_PICKUP, 14384)
                            points[i][3]=0
                            end
                            
                        end
                           
                        --[[  if filledup==0 and pointsfilled>=100 then
                        filledup=1
                        addringexplode2(WIDTH/2,HEIGHT*2/10)
                        sound(SOUND_POWERUP, 41631)
                    end]]--
                    end
                end
                end
            end
            if points[i][7]==2 then
            tint(255, 255, 255, points[i][3]*2)
            sprite("Project:Hero",p+xoff,q+yoff,size/2)
            if herox>p-size*2+xoff and herox<p+size*2+xoff and heroy>q-size*2+yoff and heroy<q+size*2 +yoff and respawnwait<0 then
                p=p+(herox-xoff-p)/10
                q=q+(heroy-yoff-q)/10
                if herox>p-size+xoff and herox<p+size+xoff and heroy>q-size+yoff and heroy<q+size+yoff then
                    health = health + 1
                    doneflashtime=0
                    score = score + 1
                    if score>highscore then
                        highscore=score
                        saveLocalData("cw10a",highscore/3)   
                        saveLocalData("highscore",highscore)
                                
                    end
                    sound(SOUND_PICKUP, 14378)
                    
                    points[i][3]=0
                    
                end
            end
            end
            if points[i][7]==3 then
            tint(255, 255, 255, points[i][3]*2)
            sprite("Project:Bomb",p+xoff,q+yoff,size/2)
            if herox>p-size*2+xoff and herox<p+size*2+xoff and heroy>q-size*2+yoff and heroy<q+size*2 +yoff and respawnwait<0 then
                p=p+(herox-xoff-p)/10
                q=q+(heroy-yoff-q)/10
                if herox>p-size+xoff and herox<p+size+xoff and heroy>q-size+yoff and heroy<q+size+yoff then
                    bombno = bombno + 1
                    score = score + 1
                    if score>highscore then
                        highscore=score
                        saveLocalData("cw10a",highscore/3)   
                        saveLocalData("highscore",highscore)
                                
                    end
                    sound(SOUND_PICKUP, 14378)
                    
                    points[i][3]=0
                    
                end
            end
            end
        points[i][1]=p
        points[i][2]=q
    end
    
end
end
