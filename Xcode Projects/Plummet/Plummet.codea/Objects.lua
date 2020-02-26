function objects()
    
    
    
    for i=1,thingno do
        if i>realthingno then i=realthingno end
        x=thing[i][2]
        y=thing[i][3]
        s=thing[i][4]
        
        if pause==0 then
            
            if thing[i][1]==0 or thing[i][1]==nil then
                thing[i][1]=objtype(i)
                thing[i][3]=math.random(-HEIGHT,-size)
                --print(i,"-",thing[i][1])
            end
            
            --if thing[i][7]==1 then
            if thing[i][1]==1 then else
                
                thing[i][2]=thing[i][2]+size*(-thing[i][6]/100)
            end
            --[[ if thing[i][1]==2 then
            if thing[i][2]<-size then
            thing[i][2]=WIDTH+size
            thing[i][3]=thing[i][3]-size
            thing[i][1]=objtype(i)
        end
            if thing[i][2]>WIDTH+size then
            thing[i][2]=0-size
            thing[i][3]=thing[i][3]-size
            thing[i][1]=objtype(i)
        end
        end
            if thing[i][2]==3 then]]--
                if thing[i][2]<-3*size then
                    thing[i][2]=WIDTH+size
                    thing[i][3]=thing[i][3]-size
                    thing[i][1]=objtype(i)
                    if thing[i][1]>=2 then
                        if area=="Space" then thing[i][8]=1 end
                        if area=="City" or area=="Sky" then thing[i][8]=2 end
                        if area=="Underground" then thing[i][8]=3 end
                    end
                end
                if thing[i][2]>WIDTH+3*size then
                    thing[i][2]=0-size
                    thing[i][3]=thing[i][3]-size
                    thing[i][1]=objtype(i)
                    if thing[i][1]>=2 then
                        if area=="Space" then thing[i][8]=1 end
                        if area=="City" or area=="Sky" then thing[i][8]=2 end
                        if area=="Underground" then thing[i][8]=3 end
                    end
                end
                --   end
                --   end
                -- end
            end
            
            
            --Draw Umbrella
            pushMatrix()
            translate(x,y)
            if thing[i][1]==1 then
                if level== level then
                    noTint()
                    rotate((math.sin(y/75)*4)+rotation)
                    sprite("Project:Umbrella",0,0,s)
                end
                if pause==0 then
                    thing[i][3] = thing[i][3] + fallspeed/2+(size/16)*fdir
                end
            end
            popMatrix()
            
            
            --Draw Rocks/ birds/ magma balls
            if thing[i][1]==2 then
                if thing[i][8]==1 then
                    
                    pushMatrix()
                    translate(x,y)
                    rotate(thing[i][5])
                    sprite("Space Art:Asteroid Large",0,0,s,s)
                    if pause==0 then
                        thing[i][5]=thing[i][5]+thing[i][6]
                        thing[i][3] = thing[i][3] + fallspeed/2+(size/16 + math.abs(size*(-thing[i][6]/100))/2.5)*fdir
                    end
                    popMatrix()
                    
                else
                    if  thing[i][8]==2 then
                        --Draw Birds
                        pushMatrix()
                        translate(x,y)
                        rotate(rotation)
                        --if thing[i][1]==3 then
                        if thing[i][9]<0 then
                            sprite(birdsprite1,0,0,s)
                            --dribbble.com
                        end
                        if thing[i][9]>=0 then
                            sprite(birdsprite2,0,0,s)
                        end
                        if pause==0 then
                            thing[i][9] = thing[i][9] + 1
                            if thing[i][9]>15 then
                                thing[i][9]=-15
                                
                            end
                        end
                        if pause==0 then
                            thing[i][5]=thing[i][5]+thing[i][6]
                            thing[i][3] = thing[i][3] + fallspeed/2+(size/16 + math.abs(size*(-thing[i][6]/100))/2.5)*fdir
                        end
                        popMatrix()
                    else
                        if thing[i][8]==3 then
                            pushMatrix()
                            translate(x,y)
                            rotate(thing[i][5])
                            tint(255, 255, 255, 255)
                            sprite("Space Art:Asteroid Large",0,0,s,s)
                            noTint()
                            if pause==0 then
                                thing[i][5]=thing[i][5]+thing[i][6]
                                thing[i][3] = thing[i][3] + fallspeed/2+(size/16 + math.abs(size*(-thing[i][6]/100))/2.5)*fdir
                            end
                            if dead==0 then
                            if thing[i][2]>WIDTH-size*0.7 then
                                thing[i][2]=WIDTH-size*0.7
                                addexplode4(thing[i][2],thing[i][3])
                                thing[i][6]=-thing[i][6]
                            end
                            if thing[i][2]<size*0.7 then
                                thing[i][2]=size*0.7
                                addexplode4(thing[i][2],thing[i][3])
                                thing[i][6]=-thing[i][6]
                            end
                            end
                            popMatrix()
                        end
                    end
                end
                
            end
            
            
            --Draw Hot Air Balloons
            pushMatrix()
            translate(x,y)
            rotate((math.sin(y/75)*4)+rotation)
            if thing[i][1]==3 then
                if thing[i][8]==1 then
                    noTint()
                    tint(255, 255, 255, 255)
                    sprite("Project:UFO",0,0,s)
                    sprite("Project:dome",0,0+size/2.3,s*2/3)
                end
                if thing[i][8]==2 then
                    noTint()
                    tint(255, 3, 0, 255)
                    sprite("Project:Balloon",0,0,s)
                    noTint()
                    sprite("Small World:Bunny Skull",0,s/3,s/3)
                end
                if thing[i][8]==3 then
                    noTint()
                    tint(255, 255, 255, 255)
                    sprite("Space Art:Asteroid Small",0,0,s,s)
                    if dead==0 then
                    if thing[i][2]>WIDTH-size*0.7 then
                        thing[i][2]=WIDTH-size*0.7
                        addexplode4(thing[i][2],thing[i][3])
                        thing[i][6]=-thing[i][6]
                    end
                    if thing[i][2]<size*0.7 then
                        thing[i][2]=size*0.7
                        addexplode4(thing[i][2],thing[i][3])
                        thing[i][6]=-thing[i][6]
                    end
                        end
                end
                if pause==0 then
                    thing[i][3] = thing[i][3] + fallspeed/2+(size/64 + math.abs(size*(-thing[i][6]/100))/2.5)*fdir
                end
            end
            popMatrix()
        
            
            if dead==0 then else
                if thing[i][2]<WIDTH/2 then thing[i][2]=thing[i][2]-3 end
                if thing[i][2]>WIDTH/2 then thing[i][2]=thing[i][2]+3 end
            end
            
            if fdir==1 then
                
            if thing[i][3]>HEIGHT+size and dead==0 and title==0 then
                thing[i][1]=objtype(i)
                if thing[i][1]==1 then
                    thing[i][2]=math.random(0,WIDTH)
                    while thing[i][2]<size*1.5 or thing[i][2]>WIDTH-size*1.5 do
                        thing[i][2]=math.random(0,WIDTH)
                    end
                    thing[i][3]=-HEIGHT*6-distance/5
                end
                
                if thing[i][1]>=2 then
                    if area=="Space" then thing[i][8]=1 end
                    if area=="City" or area=="Sky" then thing[i][8]=2 end
                    if area=="Underground" then thing[i][8]=3 end
                    
                    
                    if area=="City" or area=="Underground" then
                        while thing[i][2]>WIDTH-size*1.5 or thing[i][2]<size*1.5 do
                            thing[i][2]=math.random(0,WIDTH)
                        end
                    end
                    thing[i][3]=math.random(-HEIGHT,-size)
                    thing[i][6]=-thing[i][6]+0.1
                    
                end
            end
                
            else
                if thing[i][3]<-size and dead==0 and title==0 then
                thing[i][1]=objtype(i)
                if thing[i][1]==1 then
                    thing[i][2]=math.random(0,WIDTH)
                    while thing[i][2]<size*1.5 or thing[i][2]>WIDTH-size*1.5 do
                        thing[i][2]=math.random(0,WIDTH)
                    end
                    thing[i][3]=HEIGHT*6+distance/5
                end
                
                if thing[i][1]>=2 then
                    if area=="Space" then thing[i][8]=1 end
                    if area=="City" or area=="Sky" then thing[i][8]=2 end
                    if area=="Underground" then thing[i][8]=3 end
                    
                    
                    if area=="City" or area=="Underground" then
                        while thing[i][2]>WIDTH-size*1.75 or thing[i][2]<size*1.75 do
                            thing[i][2]=math.random(0,WIDTH)
                        end
                    end
                    thing[i][3]=math.random(HEIGHT+size,HEIGHT*2)
                    thing[i][6]=-thing[i][6]+0.1
                    
                end
            end
                
                
            end
            
            if (math.abs(thing[i][2]-herox))<size*2/3 and (math.abs(thing[i][3]-heroy)) < size/3 and dead==0 and candie==1 then
                if thing[i][1] == 1 then
                    fallspeed=fallspeed/2
                    parachute=1
                    addexplode2(herox,heroy)
                    if area=="City" or area=="Underground" then
                        while thing[i][2]>WIDTH-size*1.5 or thing[i][2]<size*1.5 do
                            thing[i][2]=math.random(0,WIDTH)
                        end
                    end
                    thing[i][3]=-HEIGHT*6-distance/5
                    sound("Game Sounds One:Whoosh 1")
                else
             --   if thing[i][1]==2 or thing[i][1]==3 then
                    if thing[i][8]==1 or thing[i][8]==3 then
                        addexplode3(herox,heroy)
                    else
                        addexplode5(herox,heroy)
                    end
                    dead=1
                    thing[i][2]=math.random(0,WIDTH)
                    thing[i][3]=-HEIGHT
                    sound("Game Sounds One:Kick")
                end
            end
        end
    end
    