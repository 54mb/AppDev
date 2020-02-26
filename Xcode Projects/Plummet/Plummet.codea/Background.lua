function backing()
    background(47, 45, 26, 255)
    if pause==0 then
        if area=="Space" or title==1 then
            if red<27 then red = red + 1 end
            if red>27 then red = red - 1 end
            if green<27 then green = green + 1 end
            if green>27 then green = green - 1 end
            if blue<27 then blue = blue + 1 end
            if blue>27 then blue = blue - 1 end
        end
        
        if area=="Sky" or area=="City" then
            if red<0 then red = red + 1 end
            if red>0 then red = red - 1 end
            if green<186 then green = green + 0.5 end
            if green>186 then green = green - 0.5 end
            if blue<255 then blue = blue + 1 end
            if blue>255 then blue = blue - 1 end
        end
        
        if area=="Underground" then
            if red<47 then red = red + 1 end
            if red>47 then red = red - 1 end
            if green<45 then green = green + 0.5 end
            if green>45 then green = green - 0.5 end
            if blue<26 then blue = blue + 1 end
            if blue>26 then blue = blue - 1 end
        end
    end
    background(red, green, blue, 255)
    
    if area=="Space" or area=="Sky" or area=="City" or area=="Underground" then
        for i =1,starno do
            tint(255, 255, 255, 255*(backstars[i][3]/3)*(red/27))
            sprite("Space Art:Star",backstars[i][1],backstars[i][2],backstars[i][3]*3)
            if pause==0 then
                if direction==1 then
                    backstars[i][2]=backstars[i][2]+(fallspeed)+backstars[i][3]
                else
                    backstars[i][2]=backstars[i][2]+(fallspeed)+backstars[i][3]
                end
                if backstars[i][2]>HEIGHT+size and area=="Space" then
                    backstars[i][1]=math.random(0,WIDTH)
                    backstars[i][2]=math.random(-size*2,-size)
                end
--[[
if backstars[i][2]<-size and area=="Space" and  then
backstars[i][1]=math.random(0,WIDTH)
backstars[i][2]=math.random(HEIGHT+size,HEIGHT+size*2)
end]]--
            end
        end
    end

    if (area=="Sky" or area=="City" or area=="Underground" or area=="Space") and title==0 and (dead==0 or dead==1 or dead==-1) then
        for i=1,3 do
            tint(255, 255, 255, green-27)
            pushMatrix()
            translate(backstars[i][1],backstars[i][2])
            rotate(rotation)
            sprite("Platformer Art:Cloud 1",0,0,size*2)
            popMatrix()
            if pause==0 then
                --backstars[i][2]=backstars[i][2]+fallspeed/2+backstars[i][3]
                -- backstars[i][1]=backstars[i][1]+backstars[i][3]
                
                if backstars[i][2]>HEIGHT+size and dead==0 then
                    backstars[i][1]=math.random(0,WIDTH)
                    backstars[i][2]=-size
                end
                if dead==0 then
                    if backstars[i][1]<-size then
                        backstars[i][1]=WIDTH+size
                        backstars[i][2]=thing[i][3]-size
                    end
                    if backstars[i][1]>WIDTH+size then
                        backstars[i][1]=0-size
                        backstars[i][2]=thing[i][3]-size
                    end
                end
                --if dead==1 then backstars[i][2]=backstars[i][2]+fallspeed end
            end
        end
    end
    
    
    for i=1,windowno do
        --i=windowno-i+1
        
        
        
        noTint()
        if windows[i][3]==1 then
            sprite("Project:Building",windowsx,windows[i][2],size,size*2)
            sprite("Project:Building",windowsx2,windows[i][2],-size,size*2)
            
        end
        if windows[i][3]==2 then
            tint(255, distfromcenter/2, distfromcenter/2, 255)
            --tint(255,255,255,255)
            for x=1,(WIDTH/size)/2 do
                sprite("Project:Dirt",windowsx2+(x*size),windows[i][2],size,size*2)
            end
            for x=1,(WIDTH/size)/2 do
                sprite("Project:Dirt",windowsx-(x*size),windows[i][2],size,size*2)
            end
            
            tint(127, distfromcenter/4, distfromcenter/4, 255)
            --tint(127,127,127,255)
            sprite("Project:Dirt",windowsx,windows[i][2],size,size*2)
            sprite("Project:Dirt",windowsx2,windows[i][2],size,size*2)
            
            
            
        end
        
        if fdir==1 then
        if windows[i][2]>heroy-size/2 then
            if windows[i][3]>=1 then
                buildings=1
            else
                buildings=0
            end
        else
            buildings=0
        end
        else
            if windows[i][2]>heroy+size/2 then
            if windows[i][3]>=1 then
                buildings=1
            else
                buildings=0
            end
        else
            buildings=0
        end
        end
        
        if pause==0 then
            windows[i][2]=windows[i][2]+(size/4)*fdir
            
            
            
            
            if fdir==1 then
            if windows[i][2]>HEIGHT+size*2 then
                windows[i][2]=-size
                --[[if i==1 then windows[i][2]=windows[windowno][2]-size*2+size/4 else
                    windows[i][2]=windows[i-1][2]-size*2
                end]]--
                if area=="City" or area=="Underground" then
                    if area=="Underground" then
                        windows[i][3]=2
                    end
                    if area=="City" then
                        windows[i][3]=1
                    end
                else
                    windows[i][3]=0
                end
            end
            else
                if windows[i][2]<-size*2 then
                windows[i][2]=HEIGHT+size
                --[[if i==1 then windows[i][2]=windows[windowno][2]+size*2-size/4 else
                    windows[i][2]=windows[i-1][2]+size*2
                end]]--
                if area=="City" or area=="Underground" then
                    if area=="Underground" then
                        windows[i][3]=2
                    end
                    if area=="City" then
                        windows[i][3]=1
                    end
                else
                    windows[i][3]=0
                end
            end
            end
        end
        
        if buildings==1 and (area=="City" or area=="Underground") and candie==1 then
            if herox>WIDTH-size or herox<size then
                if dead==0 then
                    addexplode3(herox,heroy)
                    dead=1
                    sound("Game sounds One:Kick")
                    buildings=2
                end
            end
        end
        
    end
end
