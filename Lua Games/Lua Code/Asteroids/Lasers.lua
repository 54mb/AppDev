

function dolasers()
    if shooting==1 and respawnwait<0 then
        ltimer = ltimer + 1
        if ltimer>shootspeed then
            ltimer=0
            --[[if numberoflasers>1 then
            multishoottime = multishoottime - 1
            if multishoottime<0 then
            numberoflasers = numberoflasers - 1
            sound(SOUND_POWERUP, 40506)
            multishoottime=100
        end
        end
            if shootspeed<15 then
            fastshoottime = fastshoottime - 1
            if fastshoottime<0 then
            shootspeed = shootspeed * 2
            sound(SOUND_POWERUP, 40506)
            fastshoottime=100
        end
        end]]--
        makelaser()
        
        sound(SOUND_HIT, 31252)
    end
end
movelasers()
end

function movelasers()
for i=1,laserno do
    if lasers[i][6]==1 then
        if pause==0 then
            lasers[i][1]=lasers[i][1]+lasers[i][3]
            lasers[i][2]=lasers[i][2]+lasers[i][4]
        end
        pushMatrix()
        translate(lasers[i][1],lasers[i][2])
        rotate(math.atan2(lasers[i][4],lasers[i][3])*180/math.pi+90)
        if lasers[i][5]==2 then
            sprite("Tyrian Remastered:Bullet Streak",0,0,size/6,size)
        end
        if lasers[i][5]==1 then
            sprite("Tyrian Remastered:Flame 1",0,0,size/6,size)
        end
        popMatrix()
        
        if lasers[i][1]<-size or lasers[i][1]>WIDTH+size then
            lasers[i][6]=0
        end
        if lasers[i][2]<-size or lasers[i][2]>HEIGHT+size then
            lasers[i][6]=0
        end
    end
end
end

function makelaser()
for d=1,numberoflasers do
    foundgoodlaserslot=0
    for i=1,laserno do
        if foundgoodlaserslot==0 then
            if lasers[i][6]==0 then
                lasers[i][6]=1
                lasers[i][5]=1
                foundgoodlaserslot=1
                shift=((numberoflasers*15)+15)
                lasers[i][3]=math.cos((gunr-shift+(d*30))*math.pi/180)*size/2.5
                lasers[i][4]=math.sin((gunr-shift+(d*30))*math.pi/180)*size/2.5
                lasers[i][1]=herox
                lasers[i][2]=heroy
            end
        end
    end
end
if backwardslaser==1 then
    foundgoodlaserslot=0
    for i=1,laserno do
        if foundgoodlaserslot==0 then
            if lasers[i][6]==0 then
                lasers[i][6]=1
                lasers[i][5]=1
                foundgoodlaserslot=1
                shift=((numberoflasers*15)+15)
                lasers[i][3]=math.cos((gunr-180)*math.pi/180)*size/2.5
                lasers[i][4]=math.sin((gunr-180)*math.pi/180)*size/2.5
                lasers[i][1]=herox
                lasers[i][2]=heroy
            end
        end
    end
end
end
