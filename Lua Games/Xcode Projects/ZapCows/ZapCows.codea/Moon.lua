function moon()
 --[[   if moonx<WIDTH/20 then
        moonx=WIDTH/20
    end
 --   if HEIGHT<WIDTH then
  --      if moonx<WIDTH*10/20 then moonx=WIDTH*3/20 end
 --       if moonx>WIDTH*10/20 then moonx=WIDTH*17.5/20 end
 --   end ]]--
    if ti > 20 then
        ti=20
    end
    
    moonpos=(ti*60+timer)/(21*60)
    i=(moonpos-moonlerp)/8
    a=0.01
    if i>a then i=a end
    if i<-a then i=-a end
    moonspeed=-i*1000
    moonlerp=moonlerp+i
    moonx=WIDTH-(moonlerp*WIDTH)
    moony = -1/(WIDTH/2)*((moonx - WIDTH/2)^2) + HEIGHT*0.9
   --[[ if sky*10/30 < 255 then
        tint(255, 255, 255, sky*10/20)
        if play == -2 then
            tint(255, 255, 255, sky*10/30-100)
        end
        else
        tint(255, 255, 255, 255)
        if play == -2 then
            tint(255, 255, 255, 102)
        end
        if ti>10 then
            tint(255, 255, 255, (20*60)-sky) 
        else
            tint(255, 255, 255, sky*10/20)
        end
    end ]]--
    --[[if txt>199 and txt<915 then tint(255,255,255,txt/3-200/3) end
    if txt<200 then tint(255,255,255,0) end]]--
    i=moonlerp*2
    if i>1 then i=2-i end
    tint(255, 255, 255, 255*i)
    sprite("Project:moon2",moonx,moony,size*1.6)
end
