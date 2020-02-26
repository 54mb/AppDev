

function movebosslasers()
    for i=1,bosslaserno do
        if bosslasers[i][6]==1 then
            if respawnwait>0 then
                angle = math.random(0,360)
                bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2-xoff
                bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2-yoff
            end
            if justblewup>0 then
                angle = math.random(0,360)
                bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2-xoff
                bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2-yoff
            end
            if pause==0 then
                bosslasers[i][1]=bosslasers[i][1]+bosslasers[i][3]
                bosslasers[i][2]=bosslasers[i][2]+bosslasers[i][4]
            end
            pushMatrix()
            translate(bosslasers[i][1],bosslasers[i][2])
            missiler=math.atan2(bosslasers[i][4],bosslasers[i][3])*180/math.pi+90
            rotate(missiler)
            
            if bosslasers[i][5]==1 then
                sprite("Tyrian Remastered:Huge Missile",0,0,size/2)
                addexplode7(bosslasers[i][1]-xoff,bosslasers[i][2]-yoff)
            end
            popMatrix()
            
            if bosslasers[i][1]<-size or bosslasers[i][1]>WIDTH+size then
                bosslasers[i][6]=0
            end
            if bosslasers[i][2]<-size or bosslasers[i][2]>HEIGHT+size then
                bosslasers[i][6]=0
            end
            
            for j=1,laserno do
                if lasers[j][6]==1 and bosslasers[i][6]==1 and bosslasers[i][5]==1 then
                    if math.abs(bosslasers[i][1]-lasers[j][1])<size/2 and math.abs(bosslasers[i][2]-lasers[j][2])<size/2 then
                        lasers[j][6]=0
                        bosslasers[i][6]=0
                        bosslasers[i][5]=0
                        addexplode5(bosslasers[i][1]-xoff,bosslasers[i][2]-yoff)
                        angle = math.random(0,360)
                        bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2+xoff
                        bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2+yoff
                        score = score + 5
                        if score>highscore then
                            highscore=score
                            saveLocalData("cw10a",highscore/3)   
                            saveLocalData("highscore",highscore)
                        end
                    end
                end
            end
        end
        if math.abs(bosslasers[i][1]-herox)<size/1.25 and math.abs(bosslasers[i][2]-heroy)<size/1.25 and justdied<0 then
            
            bosslasers[i][6]=0
            health = health - 1
            bossflashtime=0
            if health==0 then
                newmessage("FINAL LIFE",240)
                
            end
            addexplode1(herox-xoff,heroy-yoff)
            angle = math.random(0,360)
                bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2-xoff
                bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2-yoff
            numberoflasers=1
            shootspeed=15
            tofillup=50
            backwardslaser=0
            pointsfilled=0
            nextupgrade=1
            fastshoottime=0
            multishoottime=0
            respawnwait=60
            sound("Game Sounds One:Explode Big")
            --[[ for i=1,enemyno do
            
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
end
end


function addbosslaser(s)
foundgoodbosslaserslot=0
for i=1,bosslaserno do
if foundgoodbosslaserslot==0 then
    if bosslasers[i][6]==0 then
        bosslasers[i][6]=1
        bosslasers[i][5]=1
        foundgoodbosslaserslot=1
        shift=((numberoflasers*15)+15)
        enemyr=math.atan2((enemies[s][4]-enemies[s][2]),(enemies[s][3]-enemies[s][1]))*180/math.pi
        bosslasers[i][3]=math.cos(enemyr/(180/math.pi))*size/10
        bosslasers[i][4]=math.sin(enemyr/(180/math.pi))*size/10
        --addexplode5(bosslasers[i][1],bosslasers[i][2])
        bosslasers[i][1]=enemies[s][1]+xoff
        bosslasers[i][2]=enemies[s][2]+yoff
    end
end

end
end
