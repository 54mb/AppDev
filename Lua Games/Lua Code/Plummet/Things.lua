function things()
    
    if level==5 or level==6 or level>=7 then
        for i=1,windowno do
         i=windowno-i+1
            noTint()
                if windows[i][3]==1 then
                sprite("Project:Building",windowsx,windows[i][2],size,size*2)
                sprite("Project:Building",windowsx2,windows[i][2],size,size*2)
            else
                sprite("Platformer Art:Block Brick",windowsx,windows[i][2],size,size*2)
                sprite("Platformer Art:Block Brick",windowsx2,windows[i][2],size,size*2)
            end
            if windows[i][2]>heroy-size/2 and buildings==0 then buildings=1 end
            if pause==0 then
                windows[i][2]=windows[i][2]+fallspeed/2+size/16
                if windows[i][2]>windowno*size-size then
                    windows[i][2]=-size 
                    if level>7 then
                        windows[i][3]=2
                    else
                        windows[i][3]=1
                    end
                end
            end
        end
        
        if buildings==1 then
            if herox>WIDTH-size*1.4 or herox<size*1.4 then
                addexplode3(herox,heroy)
                dead=1
                sound("Game Sounds One:Kick")
                buildings=2
            end
        end
    end
    
    for i=1,thingno do
        x=thing[i][2]
        y=thing[i][3]
        s=thing[i][4]
        noTint()
        
        --Draw Umbrella
        pushMatrix()
        translate(x,y)
        
        if thing[i][1]==1 then
            if level== level then
                rotate(math.sin(y/75)*4)
                sprite("Project:Umbrella",0,0,s)
            end
            
            if pause==0 then
                thing[i][3] = thing[i][3] + fallspeed/2+size/16
            end
        end
        popMatrix()
        
        
        if pause==0 then
            if thing[i][7]==1 then
                if thing[i][1]==1 then else
                    
                    thing[i][2]=thing[i][2]+size*(-thing[i][6]/100)
                    
                    if thing[i][1]==2 then
                        if thing[i][2]<-size then
                            thing[i][2]=WIDTH+size
                            thing[i][3]=thing[i][3]-size
                        end
                        if thing[i][2]>WIDTH+size then
                            thing[i][2]=0-size
                            thing[i][3]=thing[i][3]-size
                        end
                    end
                    
                    if thing[i][2]==3 then
                        if thing[i][2]<-3*size then
                            thing[i][2]=WIDTH+size
                            thing[i][3]=thing[i][3]-size
                        end
                        if thing[i][2]>WIDTH+3*size then
                            thing[i][2]=0-size
                            thing[i][3]=thing[i][3]-size
                        end
                    end
                end
            end
        end
        
        --Draw Rocks
        pushMatrix()
        translate(x,y)
        rotate(thing[i][5])
        if thing[i][1]==2 then
            sprite("Space Art:Asteroid Large",0,0,s)
            if pause==0 then
                thing[i][5]=thing[i][5]+thing[i][6]
                thing[i][3] = thing[i][3] + fallspeed/2+size/16 + math.abs(size*(-thing[i][6]/100))/2.5
            end
        end
        popMatrix()
        
        
        --Draw Birds
        pushMatrix()
        translate(x,y)
        --rotate(thing[i][5])
        if thing[i][1]==3 then
            if thing[i][9]<0 then
                sprite("Platformer Art:Battor Flap 1",0,0,s)
            end
            if thing[i][9]>=0 then
                sprite("Platformer Art:Battor Flap 2",0,0,s)
            end
            if pause==0 then
                thing[i][9] = thing[i][9] + 1
                if thing[i][9]>15 then
                    thing[i][9]=-15
                    
                end
            end
            if pause==0 then
                thing[i][5]=thing[i][5]+thing[i][6]
                thing[i][3] = thing[i][3] + fallspeed/2+size/16 + math.abs(size*(-thing[i][6]/100))/2.5
            end
        end
        popMatrix()
        
        --Draw Hot Air Balloons
        pushMatrix()
        translate(x,y)
        rotate(math.sin(y/75)*4)
        if thing[i][1]==4 then
            noTint()
            if thing[i][8]==1 then
                tint(255, 3, 0, 255)
            end
            if thing[i][8]==0 then
                tint(255, 168, 0, 255)
            end
            sprite("Project:Balloon",0,0,s)
            noTint()
            sprite("Small World:Bunny Skull",0,s/3,s/3)
            if pause==0 then
                thing[i][3] = thing[i][3] + fallspeed/2+size/64 + math.abs(size*(-thing[i][6]/100))/2.5
            end
        end
        popMatrix()
        
        --Draw Window People
        pushMatrix()
        translate(x,y)
        --rotate(math.sin(y/75)*4)
        if thing[i][1]==5 then
            noTint()
            sprite("Platformer Art:Block Special Brick",0,0,s)
            if pause==0 then
                thing[i][3] = thing[i][3] + size/16 + fallspeed/2
            end
        end
        popMatrix()
        
         --Draw Cranes
        pushMatrix()
        translate(x,y)
        --rotate(math.sin(y/75)*4)
        if thing[i][1]==6 then
            noTint()
            sprite("Platformer Art:Fence",0,0,s,size)
            if pause==0 then
                thing[i][3] = thing[i][3] + size/16 + fallspeed/2
            end
        end
        popMatrix()
        
        --Draw Floor
        pushMatrix()
        translate(x,y)
        --rotate(math.sin(y/75)*4)
        if thing[i][1]==7 then
            noTint()
            sprite("Platformer Art:Block Brick",0,0,s,size)
            if pause==0 then
                thing[i][3] = thing[i][3] + size/16 + fallspeed/2
            end
        end
        popMatrix()
        
        
        if dead==0 then else
                if thing[i][2]<WIDTH/2 then thing[i][2]=thing[i][2]-3 end
                if thing[i][2]>WIDTH/2 then thing[i][2]=thing[i][2]+3 end
            end
        
        
        if thing[i][3]>HEIGHT+size and dead==0 and title==0 then
            if thing[i][1]==1 then
                thing[i][2]=math.random(0,WIDTH)
                while thing[i][2]<size*1.5 or thing[i][2]>WIDTH-size*1.5 do
                    thing[i][2]=math.random(0,WIDTH)
                end
                thing[i][3]=-HEIGHT*6-distance/5
            end
            if thing[i][1]==2 or thing[i][1]==3 then
                if level>=3 then
                    thing[i][1]=3
                end
                thing[i][2]=math.random(0,WIDTH)
                thing[i][3]=math.random(-HEIGHT,-size)
                thing[i][6]=-thing[i][6]+0.1
                if level>=2 then thing[i][7]=1 end
                if level >=7 then
                    for q=1,8 do
                        thing[i][q]=0
                    end
                end
            end
            if thing[i][1]==4 then
                thing[i][2]=math.random(0,WIDTH)
                thing[i][3]=math.random(-2*HEIGHT,-size)
                thing[i][6]=-thing[i][6]+0.1
                if thing[i][8]==1 then thing[i][8]=0 else thing[i][8]=1 end
                if level>=5 then
                    thing[i][1]=5
                    thing[i][2]=math.random(1,2)
                    if thing[i][2]==1 then thing[i][2]=WIDTH-size*1.5 end
                    if thing[i][2]==2 then thing[i][2]=size*1.5 end
                    thing[i][4]=size
                end
                if level >=7 then
                    for q=1,8 do
                        thing[i][q]=0
                    end
                end
            end
            
            if thing[i][1]==5 then
                thing[i][2]=math.random(1,2)
                if thing[i][2]==1 then thing[i][2]=WIDTH-size*1.5 end
                if thing[i][2]==2 then thing[i][2]=size*1.5 end
                thing[i][3]=math.random(-HEIGHT,-size)
                thing[i][6]=-thing[i][6]+0.1
                if thing[i][8]==1 then thing[i][8]=0 else thing[i][8]=1 end
                if level >=7 then
                    for q=1,8 do
                        thing[i][q]=0
                    end
                end
            end
            
            if thing[i][1]==6 then
                thing[i][2]=math.random(1,2)
                if thing[i][2]==1 then thing[i][2]=WIDTH-size*2 end
                if thing[i][2]==2 then thing[i][2]=size*2 end
                thing[i][3]=math.random(-HEIGHT,-size)
                thing[i][6]=-thing[i][6]+0.1
                if thing[i][8]==1 then thing[i][8]=0 else thing[i][8]=1 end
                if level >=7 then
                    for q=1,8 do
                        thing[i][q]=0
                    end
                end
            end
            
            if thing[i][1]==7 then
                
            end
            
            end
            
            
            
            
            if thing[i][2]>herox-s/1.5 and thing[i][2]<herox+s/1.5 and thing[i][3] > heroy-s/6 and thing[i][3] < heroy+s/3 and dead==0 then
                
                
                if thing[i][1] == 1 then
                    fallspeed=fallspeed/2
                    parachute=1
                    addexplode2(herox,heroy)
                    thing[i][2]=math.random(0,WIDTH)
                    thing[i][3]=-HEIGHT*6-distance/5
                    sound("Game Sounds One:Whoosh 1")
                end
                if thing[i][1]==2 or thing[i][1]==3 then
                    addexplode3(herox,heroy)
                    dead=1
                    thing[i][2]=math.random(0,WIDTH)
                    thing[i][3]=-HEIGHT
                    sound("Game Sounds One:Kick")
                end
                if thing[i][1]==4 then
                    addexplode3(herox,heroy)
                    dead=1
                    thing[i][2]=math.random(0,WIDTH)
                    thing[i][3]=-HEIGHT
                    sound("Game Sounds One:Kick")
                end
                if thing[i][1]==5 then
                    addexplode3(herox,heroy)
                    dead=1
                    thing[i][2]=math.random(1,2)
                    if thing[i][2]==1 then thing[i][2]=WIDTH-size*1.5 end
                    if thing[i][2]==2 then thing[i][2]=size*1.5 end
                    thing[i][3]=-HEIGHT
                    sound("Game Sounds One:Kick")
                end
                if thing[i][1]==6 then
                    addexplode3(herox,heroy)
                    dead=1
                    thing[i][2]=math.random(1,2)
                    if thing[i][2]==1 then thing[i][2]=WIDTH-size*1.5 end
                    if thing[i][2]==2 then thing[i][2]=size*1.5 end
                    thing[i][3]=-HEIGHT
                    sound("Game Sounds One:Kick")
                end
                if thing[i][1]==6 then
                    addexplode3(herox,heroy)
                    dead=1
                    sound("Game Sounds One:Kick")
                end
            end
            
            
        end
        
        
        
        
    end
    