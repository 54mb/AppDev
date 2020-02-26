function doenemies()
    if justblewup>-1 then
        justblewup = justblewup - 1
    end
    checkwave()
    for i=1,enemyno do
        if enemies[i][6]<0 and enemies[i][6]>-10 then
            enemies[i][3]=herox-xoff
            enemies[i][4]=heroy-yoff
            enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
            enemies[i][2]=heroy+math.sin(angle)*(HEIGHT+1.5)-yoff
        end
        if enemies[i][6]>1 and wave == enemies[i][7] then
            
            if respawnwait>0 then
                if respawnwait>59 then
                addexplode5(enemies[i][1],enemies[i][2])
                    end
                angle = math.random(0,360)
                enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
                enemies[i][2]=heroy+math.sin(angle)*(HEIGHT*1.5)-yoff
                
            end
            
            
            
            if justblewup>0 then
                
                if enemies[i][1]+xoff<WIDTH+size*2 and enemies[i][1]+xoff>-size*2 and enemies[i][2]+yoff<HEIGHT+size*2 and enemies[i][2]+yoff>-size*2 then
                    --makepoint(enemies[j][1],enemies[j][2],255,math.random(2,5),lasers[j][3],lasers[j][4])
                    score = score + 10
                    if justblewup==4 then
                        addexplode5(enemies[i][1],enemies[i][2])
                        makepoint(enemies[i][1],enemies[i][2],255,math.random(2,5),math.random(1,math.floor(size/2)),math.random(1,math.floor(size/2)))
                        addexplode5(enemies[i][1],enemies[i][2])
                    end
                    
                    if enemies[i][6]>0 then
                        enemies[i][6]=math.random(1,10)*60
                    end
                    angle = math.random(0,360)
                    enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
                    enemies[i][2]=heroy+math.sin(angle)*(HEIGHT*1.5)-xoff
                    enemies[i][8]=0
                    enemies[i][7]=0
                end
            end
            if enemies[i][7]==wave then
                enemies[i][6]=enemies[i][6]+1
            end
            
            --Enemy1
            if enemies[i][5]==0 then
                if math.abs(enemies[i][1]-enemies[i][3])<size and math.abs(enemies[i][2]-enemies[i][4])<size then
                    enemies[i][3]=herox-xoff
                    enemies[i][4]=heroy-yoff
                end
                
                enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
                pushMatrix()
                translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
                rotate(enemyr-90)
                sprite("Project:Enemy 1",0,0,size)
                popMatrix()
                if pause==0 and respawnwait<0 then
                    enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
                    enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
                    addexplode6(enemies[i][1],enemies[i][2])
                end
                for j=1,laserno do
                    if lasers[j][6]==1 then
                        if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then
                            
                            sound("Game Sounds One:Explode 1")
                            makepoint(enemies[i][1],enemies[i][2],255,math.random(2,5),lasers[j][3],lasers[j][4])
                            addexplode5(enemies[i][1],enemies[i][2])
                            angle = math.random(0,360)
                            enemies[i][6]=-60
                            --enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
                            --enemies[i][2]=heroy+math.sin(angle)*(HEIGHT)-yoff
                            lasers[j][6]=0
                            enemies[i][7]=0
                            score = score + 10
                            enemieskilled=enemieskilled+1
                            saveLocalData("enemieskilled",enemieskilled)
                            resetenemy(i)
                            if score>highscore then
                                highscore=score
                                saveLocalData("cw10a",highscore/3) 
                                  saveLocalData("highscore",highscore)
                                
                            end
                        end
                    end
                end
            end
            
            --Enemy2
            if enemies[i][5]==1 then
                if math.abs(enemies[i][1]-enemies[i][3])<size and math.abs(enemies[i][2]-enemies[i][4])<size then
                    enemies[i][3]=herox-xoff
                    enemies[i][4]=heroy-yoff
                end
                
                enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
                pushMatrix()
                translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
                rotate(enemyr-90)
                if enemies[i][8]>3 then
                sprite("Project:Enemy 2",0,0,size)
                else
                    sprite("Project:Enemy 2",0,0,size/1.125)
                end
                popMatrix()
                if pause==0 and respawnwait<0 then
                    if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
                        enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
                        enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
                    else
                        enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/5)
                        enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/5)
                        addexplode6(enemies[i][1],enemies[i][2])
                    end
                    end
                    for j=1,laserno do
                        if lasers[j][6]==1 then
                            if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then
                            if enemies[i][8]>0 then
                                enemies[i][8]=enemies[i][8]-1
                                lasers[j][6]=0
                                score = score + 1
                                addexplode5(enemies[i][1],enemies[i][2])
                                sound(SOUND_HIT, 31238)
                            else
                                sound("Game Sounds One:Explode 1")
                                makepoint(enemies[i][1],enemies[i][2],255,math.random(4,10),lasers[j][3],lasers[j][4])
                                addexplode5(enemies[i][1],enemies[i][2])
                                angle = math.random(0,360)
                                enemies[i][6]=-60
                                --enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
                                --enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
                                lasers[j][6]=0
                                enemies[i][7]=0
                                score = score + 20
                                enemieskilled=enemieskilled+1
                                saveLocalData("enemieskilled",enemieskilled)
                                resetenemy(i)
                                if score>highscore then
                                    highscore=score
                                    saveLocalData("cw10a",highscore/3)  
                                     saveLocalData("highscore",highscore)
                                end
                            end
                        end
                    end
                end
            end
            
            
            --Enemy3
            if enemies[i][5]==2 then
                
                enemies[i][3]=herox-xoff
                enemies[i][4]=heroy-yoff
                
                
                enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
                pushMatrix()
                translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
                rotate(enemyr-90)
                if enemies[i][8]>1 then
                sprite("Project:Enemy 3",0,0,size)
                else
                    sprite("Project:Enemy 3",0,0,size/1.125)
                end
                popMatrix()
                if pause==0 and respawnwait<0 then
                        if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
                        enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
                        enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
                    else
                    enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/2)
                    enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/2)
                    addexplode6(enemies[i][1],enemies[i][2])
                end
                        end
                for j=1,laserno do
                    if lasers[j][6]==1 then
                        if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then
                            if enemies[i][8]>0 then
                                enemies[i][8]=enemies[i][8]-1
                                lasers[j][6]=0
                                score = score + 1
                                addexplode5(enemies[i][1],enemies[i][2])
                                sound(SOUND_HIT, 31238)
                            else
                                sound("Game Sounds One:Explode 1")
                                makepoint(enemies[i][1],enemies[i][2],255,math.random(8,20),lasers[j][3],lasers[j][4])
                                addexplode5(enemies[i][1],enemies[i][2])
                                angle = math.random(0,360)
                                enemies[i][6]=-60
                                --enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
                                --enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
                                lasers[j][6]=0
                                enemies[i][7]=0
                                score = score + 40
                                enemieskilled=enemieskilled+1
                                saveLocalData("enemieskilled",enemieskilled)
                                resetenemy(i)
                                if score>highscore then
                                    highscore=score
                                    saveLocalData("cw10a",highscore/3)   
                                    saveLocalData("highscore",highscore)
                                end
                            end
                        end
                    end
                end
            end
            
            --Enemy4
            if enemies[i][5]==3 then
                
                    enemies[i][3]=herox-xoff
                    enemies[i][4]=heroy-yoff
                
                
                enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
                pushMatrix()
                translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
                rotate(enemyr-90)
                if enemies[i][8]>4 then
                sprite("Project:enemy4",0,0,size)
                else
                    sprite("Project:enemy4",0,0,size/1.125)
                end
                popMatrix()
                if pause==0 and respawnwait<0 then
                    if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
                        enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
                        enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
                    else
                    enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/8)
                    enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/8)
                    addexplode6(enemies[i][1],enemies[i][2])
                end
                    end
                for j=1,laserno do
                    if lasers[j][6]==1 then
                        if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then
                            if enemies[i][8]>0 then
                                enemies[i][8]=enemies[i][8]-1
                                lasers[j][6]=0
                                score = score + 1
                                addexplode5(enemies[i][1],enemies[i][2])
                                sound(SOUND_HIT, 31238)
                            else
                                sound("Game Sounds One:Explode 1")
                                makepoint(enemies[i][1],enemies[i][2],255,math.random(16,40),lasers[j][3],lasers[j][4])
                                addexplode5(enemies[i][1],enemies[i][2])
                                angle = math.random(0,360)
                                enemies[i][6]=-60
                                --enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
                                --enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
                                lasers[j][6]=0
                                enemies[i][7]=0
                                score = score + 20
                                enemieskilled=enemieskilled+1
                                saveLocalData("enemieskilled",enemieskilled)
                                resetenemy(i)
                                if score>highscore then
                                    highscore=score
                                    saveLocalData("cw10a",highscore/3)   
                                    saveLocalData("highscore",highscore)
                                end
                            end
                        end
                    end
                end
            end
            
            
            
            
            --Boss
            if enemies[i][5]==-1 then
                enemies[i][3]=herox-xoff
                enemies[i][4]=heroy-yoff
                
                bossshoottime[i] = bossshoottime[i] - 1
                if i/2==math.floor(i/2) then
                    if bossshoottime[i]<=0 then
                        h=0
                        for e=wave/5+1,enemyno do
                            if enemies[e][7]==wave then
                            else
                                h=e
                            end
                        end
                        if h>=enemyno then h=enemyno end
                        angle = math.random(0,360)
                        enemies[h][1]=enemies[i][1]
                        enemies[h][2]=enemies[i][2]
                        enemies[h][3]=herox-xoff
                        enemies[h][4]=heroy-yoff
                        if wave==5 then
                        enemies[h][5]=0
                        end
                        if wave==10 then
                        enemies[h][5]=math.random(0,1)
                        end
                        if wave==15 then
                        enemies[h][5]=math.random(0,2)
                        end
                        if wave>=20 then
                        enemies[h][5]=math.random(0,3)
                        end
                        if enemies[h][5]==1 then enemies[h][8]=5 end
                        if enemies[h][5]==2 then enemies[h][8]=2 end
                        if enemies[h][5]==3 then enemies[h][8]=10 end
                        enemies[h][6]=0
                        enemies[h][7]=wave
                        bossshoottime[i]=180
                    end
                else
                    if bossshoottime[i]<=0 then
                        bossshoottime[i]=45
                        addbosslaser(i)
                    end
                end
                enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
                pushMatrix()
                translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
                rotate(enemyr-90)
                if i/2==math.floor(i/2) then
                if enemies[i][8]>(wave) then
                sprite("Project:Boss2",0,0,size*3)
                else
                    sprite("Project:Boss2",0,0,size*2.95)
                end
                else
                    if enemies[i][8]>(wave) then
                sprite("Project:Boss",0,0,size*3)
                else
                    sprite("Project:Boss",0,0,size*2.95)
                end
                end
                popMatrix()
                if pause==0 and respawnwait<0 then
                    if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
                        enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
                        enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
                    else
                    enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/(wave*2))/1.5
                    enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/(wave*2))/1.5
                    if i/2==math.floor(i/2) then
                    addexplode6(enemies[i][1],enemies[i][2])
                        end
                        end
                end
                for j=1,laserno do
                    if lasers[j][6]==1 then
                        if math.abs(enemies[i][1]+xoff-lasers[j][1])<size and math.abs(enemies[i][2]+yoff-lasers[j][2])<size then
                            if enemies[i][8]>0 then
                                enemies[i][8]=enemies[i][8]-1
                                lasers[j][6]=0
                                score = score + 1
                                addexplode5(enemies[i][1],enemies[i][2])
                                sound(SOUND_HIT, 31238)
                            else
                                sound("Game Sounds One:Explode 1")
                                    makepoint(enemies[i][1],enemies[i][2],255,math.random(16,40),lasers[j][3],lasers[j][4])
                                addexplode5(enemies[i][1],enemies[i][2])
                                angle = math.random(0,360)
                                enemies[i][6]=-60
                                --enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
                                --enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
                                lasers[j][6]=0
                                enemies[i][7]=0
                                score = score + 80
                                enemieskilled=enemieskilled+1
                                saveLocalData("enemieskilled",enemieskilled)
                                resetenemy(i)
                                if score>highscore then
                                    highscore=score
                                    saveLocalData("cw10a",highscore/3)  
                                     saveLocalData("highscore",highscore)
                                end
                            end
                        end
                    end
                end
            end
            
            
            if math.abs(enemies[i][1]+xoff-herox)<size/1.5 and math.abs(enemies[i][2]+yoff-heroy)<size/1.5 and justdied<0 then
                angle = math.random(0,360)
                enemies[i][6]=-120
                enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
                enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT*1.5)-yoff
                health = health - 1
                bossflashtime=0
                if health==0 then
                    newmessage("FINAL LIFE",240)
                    
                end
                addexplode1(herox-xoff,heroy-yoff)
                numberoflasers=1
                shootspeed=15
                tofillup=50
                pointsfilled=0
                nextupgrade=1
                backwardslaser=0
                fastshoottime=0
                multishoottime=0
                respawnwait=60
                
                sound("Game Sounds One:Explode Big")
                --[[for i=1,enemyno do
                
                if enemies[i][1]<WIDTH+size and enemies[i][1]>-size and enemies[i][2]<HEIGHT+size and enemies[i][2]>-size then
                enemies[i][6]=math.random(1,10)*60
                angle = math.random(0,360)
                enemies[i][1]=herox+math.cos(angle)*(WIDTH)
                enemies[i][2]=heroy+math.sin(angle)*(WIDTH)
                addexplode5(enemies[i][1],enemies[i][2])
            end
                
            end]]--
            
            if health<0 then
                if dead==0 then
                    dead=1
                end
            end
        end
    else
        if enemies[i][7]==wave then
            enemies[i][6]=enemies[i][6]+1
            
            
        end
    end
end
end