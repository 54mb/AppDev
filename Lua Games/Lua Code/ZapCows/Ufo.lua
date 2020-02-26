function copter()
    --   for i =1,1 do
    --    tint(255, 255, 255, 255)
    -- sprite("Platformer Art:Cloud 3",cpos[1][i],cpos[2][i],size*2)
    --    cpos[1][i] = cpos[1][i] + 0.75--cpos[3][i]
    --    if cpos[1][i]>WIDTH+size then
    --cpos[1][i] = -size
    --     cpos[2][i] = mathrandom(HEIGHT*2/3,HEIGHT)
    --  end
    -- end
    if play == 1 or play == -1 or play == 0 or play == -2 then
        if arrived == 0 then
            if copy>HEIGHT*0.8 then
                copy = copy - 1
            end
            if copy<=HEIGHT*0.8 then
                arrived=1
            end
        else
            copy=HEIGHT*0.8
        end
        if direction == 1 then
            if music.currentTime<18.5 then
                copx = copx + 1
            else
                copx = copx + 5
            end
        end
        if direction == 0 then
            if music.currentTime<18.5 then
                copx = copx - 1
            else
                copx = copx - 5
            end
        end
        if copx < size*2 then
            direction = 1
        end
        if copx > size*8 then
            direction = 0
        end
    end
    if play == -0.5 then
        copx = copx + 1
        copy = copy + 3
    end
    spriteMode(CENTER)
    tint(255,255,255,255)
    sprite("Project:UFO",copx,copy,size*4,size*2)
    
    lashole={
    {copx+size*0.35,copy-size*0.48},
    {copx-size*0.35,copy-size*0.48},
    {copx+size*0.82,copy-size*0.375},
    {copx-size*0.82,copy-size*0.375},
    {copx+size*1.18,copy-size*0.29},
    {copx-size*1.18,copy-size*0.29}
    }
    if play == 1 then
        flash = flash + g
    end
    if flash > 0 then
        --fontSize(25)
        if flash>15 then
            g=-1
        end
    end
    if flash < 0 then
        --fontSize(20)
        if flash<-15 then
            g=1
        end
    else
        --fontSize(15)
    end
   -- if times == "0X" then fontSize(15) end
    fill(0, 0, 0, 255)
    if play == 1 or play == -2 then
        fill(0, 0, 0, 255)
        --text(times,WIDTH/3+textSize(times)/1.5,HEIGHT*9.7/10)
        fill(255, 255, 255, 255)
        --text(times,WIDTH/3+textSize(times)/1.5-1,HEIGHT*9.7/10+1)
        --sprite("Project:cow",copx,copy,size/2)
        if togo<0 then togo=0 end
        if togo>0 then
            --fontSize(size/3)
            fill(0, 0, 0, 255)
            --text(togo,copx,copy)
            tint(255, 255, 255, 255)
            --text(togo,copx-1,copy+1)
            rightshift=textSize(togo)/2.5
            righshift=0
            printnum(togo,copx-size*0.02,copy+size*0.6,size/2,size/2,1)
        end
    end
end