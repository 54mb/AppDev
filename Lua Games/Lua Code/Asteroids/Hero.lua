function hero()
    --[[joy1x = joy1x - (joy1x-WIDTH*1.5/10)/5
    joy1y = joy1y - (joy1y-HEIGHT*1.5/10)/5]]--
    
    joy1x = joy1x - (joy1x-joy1startx)/5
    joy1y = joy1y - (joy1y-joy1starty)/5
    
    --[[joy2x = joy2x - (joy2x-WIDTH*8.5/10)/5
    joy2y = joy2y - (joy2y-HEIGHT*1.5/10)/5]]--
    
    joy2x = joy2x - (joy2x-joy2startx)/5
    joy2y = joy2y - (joy2y-joy2starty)/5
    shooting=0
    moving=0
    for k,touch in pairs(touches) do
        if touch.x<WIDTH/2-size/2 and touch.y<HEIGHT*2/3 then
            if touch.state==BEGAN then
                joy1startx=touch.x
                if joy1startx>WIDTH/2-size/2-size*1.5 then joy1startx=WIDTH/2-size/2-size*1.5 end
                joy1starty=touch.y
            end
            if touch.state==ENDED then
                joy1startx=WIDTH*1.5/10
                joy1starty=HEIGHT*1.5/10
            end
            
        
            joy1x=touch.x
            joy1y=touch.y
            joy1xdif=(joy1x-joy1startx)
            joy1ydif=(joy1y-joy1starty)
            --[[joy1xdif=(joy1x-WIDTH*1.5/10)
            joy1ydif=(joy1y-HEIGHT*1.5/10)]]--
            joy1a=math.atan2(joy1ydif,joy1xdif)*180/math.pi
            moving=1
            
            joy1a=joy1a/(180/math.pi)
            
            --[[if joy1x>WIDTH*1.5/10 +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 >0 then joy1x=WIDTH*1.5/10 + math.cos(joy1a)*size*1.5 end
            
            if joy1x<WIDTH*1.5/10 +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 <0 then joy1x=WIDTH*1.5/10 +math.cos(joy1a)*size*1.5 end
            
            if joy1y>HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 >0 then joy1y=HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5  end
            
            if joy1y<HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 <0 then joy1y=HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5  end]]--
            
            if joy1x>joy1startx +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 >0 then joy1x=joy1startx + math.cos(joy1a)*size*1.5 end
            
            if joy1x<joy1startx +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 <0 then joy1x=joy1startx +math.cos(joy1a)*size*1.5 end
            
            if joy1y>joy1starty +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 >0 then joy1y=joy1starty +math.sin(joy1a)*size*1.5  end
            
            if joy1y<joy1starty +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 <0 then joy1y=joy1starty +math.sin(joy1a)*size*1.5  end
            
            --[[joy1xdif=(joy1x-WIDTH*1.5/10)
            joy1ydif=(joy1y-HEIGHT*1.5/10)
            joy1a=(joy1a*(180/math.pi))
            joy1t=k
            joy1xdif=(joy1x-WIDTH*1.5/10)
            joy1ydif=(joy1y-HEIGHT*1.5/10)]]--
            joy1xdif=(joy1x-joy1startx)
            joy1ydif=(joy1y-joy1starty)
            joy1a=(joy1a*(180/math.pi))
            joy1t=k
            joy1xdif=(joy1x-joy1startx)
            joy1ydif=(joy1y-joy1starty)
        
            
           else
            if joy1t==k then
                joy1x=joy1startx
                joy1y=joy1starty
                --[[
                joy1x=WIDTH*1.5/10
                joy1y=HEIGHT*1.5/10
                ]]--
            end
            end
        
        if touch.x>WIDTH/2+size/2 and touch.y<HEIGHT*2/3 then
            if touch.state==BEGAN then
                joy2startx=touch.x
                if joy2startx<WIDTH/2+size/2+size*1.5 then joy2startx=WIDTH/2+size/2+size*1.5 end
                joy2starty=touch.y
            end
            if touch.state==ENDED then
                joy2startx=WIDTH*8.5/10
                joy2starty=HEIGHT*1.5/10
            end
            joy2x=touch.x
            joy2y=touch.y
            
            --[[joy2xdif=(joy2x-WIDTH*8.5/10)
            joy2ydif=(joy2y-HEIGHT*1.5/10)]]--
            joy2xdif=(joy2x-joy2startx)
            joy2ydif=(joy2y-joy2starty)
            joy2a=math.atan2(joy2ydif,joy2xdif)*180/math.pi
            joy2a=joy2a/(180/math.pi)
            
            --[[if joy2x>WIDTH*8.5/10 +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 >0 then joy2x=WIDTH*8.5/10 + math.cos(joy2a)*size*1.5 end
            
            if joy2x<WIDTH*8.5/10 +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 <0 then joy2x=WIDTH*8.5/10 +math.cos(joy2a)*size*1.5 end
            
            if joy2y>HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 >0 then joy2y=HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5  end
            
            if joy2y<HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 <0 then joy2y=HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5  end]]--
            
            if joy2x>joy2startx +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 >0 then joy2x=joy2startx + math.cos(joy2a)*size*1.5 end
            
            if joy2x<joy2startx +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 <0 then joy2x=joy2startx +math.cos(joy2a)*size*1.5 end
            
            if joy2y>joy2starty +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 >0 then joy2y=joy2starty +math.sin(joy2a)*size*1.5  end
            
            if joy2y<joy2starty +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 <0 then joy2y=joy2starty +math.sin(joy2a)*size*1.5  end
            
            joy2t=k
            --[[
            joy2xdif=(joy2x-WIDTH*8.5/10)
            joy2ydif=(joy2y-HEIGHT*1.5/10)]]--
            joy2xdif=(joy2x-joy2startx)
            joy2ydif=(joy2y-joy2starty)
            joy2a=(joy2a*(180/math.pi))
            joy2a=math.atan2(joy2ydif,joy2xdif)*180/math.pi
            shooting=1
        else
            if joy2t==k then
                --[[
                joy2x=WIDTH*8.5/10
                joy2y=HEIGHT*1.5/10
                ]]--
                joy2x=joy2startx
                joy2y=joy2starty
            end
        end
    end
    
    --[[joy1xdif=(joy1x-WIDTH*1.5/10)
    joy1ydif=(joy1y-HEIGHT*1.5/10)]]--
    joy1xdif=(joy1x-joy1startx)
    joy1ydif=(joy1y-joy1starty)
    
    if herox>WIDTH-size/2 then herox=WIDTH-size/2 end
    if herox<size/2 then herox=size/2 end
    if heroy>HEIGHT-size/2 then heroy=HEIGHT-size/2 end
    if heroy<size/2 then heroy=size/2 end
    
    if xoff>WIDTH-size/2 then xoff=WIDTH-size/2 end
    if xoff<size/2 then xoff=size/2 end
    if yoff>HEIGHT-size/2 then yoff=HEIGHT-size/2 end
    if yoff<size/2 then yoff=size/2 end
    
    if pause==0 and respawnwait<0 then
        if herox>=size/2 and herox<=WIDTH-size/2 then 
        herox = herox + joy1xdif/20
        xoff = xoff - joy1xdif/20
        end
        if heroy>=size/2 and heroy<=HEIGHT-size/2 then
            heroy = heroy + joy1ydif/20
            yoff = yoff - joy1ydif/20
        end
    end
    
    if dead==0 then
        
        if health==0 then
            tailflickertime = tailflickertime + 1
            if tailflickertime>tailflickertimer then
                tailflickertime=0
                tailflickertimer=math.random(5,30)
                tailflicker=-tailflicker
            end
        else
            tailflicker=1
        end
        
        
        if respawnwait<0 and heroflash==1 then
            if tailflicker==1 then
            if moving ==1 then
                addexplode2(herox-math.cos(heror*(math.pi/180))*size/4-xoff,heroy-math.sin(heror*(math.pi/180))*size/4-yoff)
            else
                addexplode3(herox-math.cos(heror*(math.pi/180))*size/4-xoff,heroy-math.sin(heror*(math.pi/180))*size/4-yoff)
            end
            end
        end
        justdied = justdied - 1
        if justdied/10 == math.floor(justdied/10) then
            heroflash=-heroflash
        end
        if justdied<0 then heroflash=1 end
        spriteMode(CENTER)
        if respawnwait<0 then
            if health>0 then
                for i=1,health do
                    pushMatrix()
                    
                    if i==1 then else
                        healthorbs[i]=healthorbs[1]-(math.pi*2/health)*(i-1)
                    end
                    
                    translate(herox+math.cos(healthorbs[i])*size/1,heroy+math.sin(healthorbs[i])*size/1)
                    
                    
                    rotate(healthorbs[i]/(math.pi/180))
                    noTint()
                    sprite("Project:Hero",0,0,size/2)
                    popMatrix()
                    if pause==0 and i==1 then
                        healthorbs[i] = healthorbs[i] + 0.05 *(15/shootspeed)/2
                    end
                    if healthorbs[i]>360 then healthorbs[i]=0 end
                    
                end
                
            end
            pushMatrix()
            translate(herox,heroy)
            if pause==0 then
                heror = heror + (joy1a-heror)/5
                heror=joy1a
            end
            rotate(heror-90)
            tint(255, 255, 255, 255*heroflash)
            
            if health>0 then
                sprite("Project:Hero",0,0,size*2)
            else
                sprite("Project:Hero",0,0,size*2)
            end
            popMatrix()
            
            
        else
            respawnwait = respawnwait - 0.5
            
            if respawnwait<=5 then
                herox=WIDTH/2
                heroy=HEIGHT/2
                xoff=WIDTH/2
                yoff=HEIGHT/2
                justdied=120
            end
        end
        
        dolasers()
        
        if pause==0 then
            if shooting == 1 then
                gunherodiff=heror-gunr
            end
            gunr = gunr + (joy2a-gunr)/5
            gunr=joy2a
            if shooting==0 then
                gunr=heror-gunherodiff
            end
        end
        if shooting==1 and respawnwait<0 then
            addexplode4(herox-xoff,heroy-yoff)
        end
        if backwardslaser==1 then
            pushMatrix()
        translate(herox,heroy)
            rotate(gunr)
            if respawnwait<0 then
                if health>1 then
                    sprite("Tyrian Remastered:Satellite",-size/8,0,size*0.75)
                else
                    sprite("Tyrian Remastered:Satellite Destroyed",-size/8,0,size*0.75)
                end
            end
            popMatrix()
        end
        for q=1,numberoflasers do
            pushMatrix()
            translate(herox,heroy)
            shift=((numberoflasers*15)+15)
            rotate(gunr-shift+(q*30)-180)
            if respawnwait<0 then
                if health>1 then
                    sprite("Tyrian Remastered:Satellite",0,0,size*0.75)
                else
                    sprite("Tyrian Remastered:Satellite Destroyed",0,0,size*0.75)
                end
            end
            popMatrix()
        end
        if numberoflasers==3 then
        pushMatrix()
            translate(herox,heroy)
            shift=((1*15)+15)
            rotate(gunr-shift+(1*30)-180)
            if respawnwait<0 then
                if health>1 then
                    sprite("Tyrian Remastered:Satellite",0,0,size*0.75)
                else
                    sprite("Tyrian Remastered:Satellite Destroyed",0,0,size*0.75)
                end
            end
            popMatrix()
            end
    end
    tint(255, 255, 255, 50)
    sprite("Project:Joy",joy1x,joy1y,size*2,size*2)
    tint(255, 255, 255, 50)
    sprite("Project:Joy",joy2x,joy2y,size*2,size*2)
    noTint()
end