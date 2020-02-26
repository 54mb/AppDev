function domusic()
    if music.currentTime<=music.duration-5 then
    if title==1 then
        if musicvol<0.25 then musicvol=musicvol+0.001 end
    end
    if dead==0 then else
        if musicvol>0 then musicvol=musicvol-0.01 end
    end
    
    
    if pause==0 and dead==0 then 
        music.paused=false
        if musicvol<0.25 then
            musicvol = musicvol + 0.01
        end
    else
        if dead==0 then
        if musicvol>0.1 then
            musicvol = musicvol - 0.01
        else
        music.paused=true
        end
    end
    end
    end
    
    
    
    
    
    music.pan=(-(WIDTH/2-herox)/(WIDTH-size))*2
    music.volume=musicvol
end