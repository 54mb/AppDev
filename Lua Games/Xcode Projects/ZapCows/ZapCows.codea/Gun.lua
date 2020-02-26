function gun()
    
    strokeWidth(15)
    -- stroke(guntemp/2,255-guntemp/1.5,0,255)
    --   line(WIDTH*9/10,HEIGHT*9.5/10,WIDTH*9/10-guntemp/2,HEIGHT*9.5/10)
    -- stroke(13, 17, 17, 255)
    -- rectMode(CORNERS)
    --  fill(0, 0, 0, 0)
    -- strokeWidth(5)
    --  rect(WIDTH*9.1/10,HEIGHT*9.6/10,WIDTH*9/10-260,HEIGHT*9.4/10)
    -- strokeWidth(15)
    fill(255,247,0,255)
    stroke(255,247,0,255)
    --ellipse(copx,copy,size/5)
    lineCapMode(ROUND)

    spriteMode(CENTER)
    if CurrentTouch.state==BEGAN and CurrentTouch.y < HEIGHT/2 or CurrentTouch.state==MOVING and CurrentTouch.y < HEIGHT/2 then
      --[[  soundplay = soundplay + 1
        if soundplay>60 then
            soundplay=0
        end]]--
        --sound("Dropbox:LaserSound",1,0.5)
        --  if guntemp<500 then
        strokeWidth(5)
        tint(128,255,0,255)
        sprite("Project:Glow",CurrentTouch.x,CurrentTouch.y,size*2,size)
        stroke(128,255,0,255)
        fill(128,255,0,255)
        sprite("Project:Glow",copx-size*0.02,copy-size*0.95,size*0.9)
        line(copx-size*0.02,copy-size*0.95, CurrentTouch.x+math.abs(1/2*math.sin((timer)/3)*80)-size/4, CurrentTouch.y)
        --   ellipse(CurrentTouch.x-copx+math.abs(1/2*math.sin((timer)/3)*80)-size/2, CurrentTouch.y-copy,size/2.5)
        --[[   qn = qn + 1
        if qn>15 then
        qn=0
        q = q + 1
        if q > 2 then
        q=1
        end
    end]]--
    guntemp = 255
    if guntemp>255 then guntemp=255 end
    --  end
    else
    if guntemp > 1 then
        guntemp = guntemp / 1.05
        strokeWidth(5)
       tint(128,255,0,guntemp)
        sprite("Project:Glow",CurrentTouch.x,CurrentTouch.y,size*2,size)
        stroke(128,255,0,guntemp)
        fill(128,255,0,guntemp)
        sprite("Project:Glow",copx-size*0.02,copy-size*0.95,size*0.9)
        line(copx-size*0.02,copy-size*0.95, CurrentTouch.x+math.abs(1/2*math.sin((timer)/3)*80)-size/4, CurrentTouch.y)
        --ellipse(CurrentTouch.x-copx+math.abs(1/2*math.sin((timer)/3)*80)-size/2, CurrentTouch.y-copy,size/2.5)
    end
end
end

