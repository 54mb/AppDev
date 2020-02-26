function hero()
    if dead==0 then
    if pause==0 then
    tilt=(Gravity.x*(HEIGHT/13))
    end
    if changingcharacter==0 then
            if fdir==1 then
            heroys=HEIGHT*2/3
            else
                heroys=HEIGHT/3
            end
    heroy = heroy - (heroy-heroys)/50
    end
    else
        tilt = tilt + 10
        falloff=size/5
        heroy = heroy + falloff*fdir
    end
    stroke(81, 231, 231, 255)
    strokeWidth(2)
    pushMatrix()
    translate(herox,heroy)
    if dead==0 then
    if tilt>size/4 then tilt = size/4 end
    if tilt<-size/4 then tilt = -size/4 end
    end
    turn=turn-(turn-(90*-(fdir-1)))/10
    rotate((-(tilt*fdir)-90+(90*parachute))+turn)
    tiltspeedratio=(tilt+size/4)/(size/4)
    
    
    noTint()
    w,h=spriteSize(herosprites[herosprite])
    ratio=w/h
    sprite(herosprites[herosprite],0,0,w/(h/size),size)
    if dead==0 and pause==0 then
    herox = herox + (tilt*herosidespeed[herosprite])
    end
    if herox>WIDTH-size/2 then 
    herox=WIDTH-size/2
        tilt = tilt*0.1
     end
    if herox<size/2 then 
    herox=size/2 
        tilt = tilt*0.1
    end
    if parachute==1 then
        if pause==0 then
        parachutetime = parachutetime + 1
        if parachutetime>120 then
            parachute=0
            parachutetime=0
        end
        end
        
        rotate(0)
        sprite("Project:Umbrella",size/3.5,size/6,size)
    end
    popMatrix()
    if parachute == 0 and dead==0 and pause==0 and changingcharacter==0 then
    
    addexplode1(herox+size*0.5,heroy+(size/3+size*0.25)*fdir)
    addexplode1(herox-size*0.5,heroy+(size/3+size*0.25)*fdir)
    if level>3 then
            --addexplode5(herox,heroy-size/2)
          --  addexplode5(herox,heroy-size/2)
        end
        
        
        
    end
    --[[
    lastnearmiss=0
    for i =1,thingno do
        if thing[i][1]==1 then else
            if (math.abs(thing[i][2]-herox))<size*4/3 and (math.abs(thing[i][3]-heroy)) < size/1.5 then
                lastnearmiss=1
            end
        end
    end
]]--

    
end