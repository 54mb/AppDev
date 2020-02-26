function newmessage(t,l)
    msg=t
    msgtime=l
    msgx=-WIDTH
    msgy=HEIGHT*2/3
end

function domessages()
    if msgtime>=-1 then
        if pause==0 then
        msgtime = msgtime - 1
        
            msgx = msgx +(-msgx+(WIDTH/2-((#msg*size*1.1)/2)+(size*0.55))) /10
      --  msgx=msgx+(-msgx+((WIDTH/2-(size*1.1)*(#msg/2))+(size)))/10
        if msgx>WIDTH-size then
        end
        if msgtime <=60 then
            msgx=msgx+(WIDTH*2-msgx)/10
        end
        end
        printword2(msg,msgx,msgy,size,size)
    else
        if msg=="WAVE COMPLETE" then
            
            if wave/5==math.floor(wave/5) then
                newmessage("BOSS WAVE",180)
                sound("A Hero's Quest:Curse")
                bossflashtime=0
            else
                newmessage("WAVE "..wave,180)
                sound("A Hero's Quest:Defensive Cast 3")
            end
        end
    end 
    
end
