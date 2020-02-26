function dist()
    for i=1,disno do
        if dis[i][2]<0 then dis[i][3]=distance end
        if pause==0 then
            dis[i][2]=dis[i][2]+fallspeed/2+size/16
            
            if dis[i][2]<heroy and dis[i][2]>0 and dead==0 then dis[i][1]=dis[i][1]-(dis[i][1]-size/2)/10  end
        end
        if dis[i][2]>HEIGHT then
            dis[i][2]=0
            dis[i][3]=distance
        end
        if dead==1 then scrolltint = scrolltint - 1 end
        fill(255, 255, 255, scrolltint)
        fontSize(size/4)
        text((math.floor(dis[i][3])/100)+0.2,dis[i][1],dis[i][2])
    end
end

function objtype(i)
    if i>type4+type1+type2+type3 then return(6) end
    if i>type3+type1+type2 and i<=type4+type1+type2+type3 then return(5) end
    if i>type2+type1 and i<=type3+type1+type2 then return(4) end
    if i>type1 and i<=type2+type1 then return(3) end
    if i>1 and i<=type1 then return(2) end
    if i==1 then return(1) end
end

function GUI()
    fill(255, 255, 255, 138)
    
    
    
    if pause==0 then
        falltimer = falltimer + 1
        if falltimer>=7 and dead==0 then
            distance = distance + math.abs((fallspeed/2)*100)
            distancesincezone = distancesincezone + math.abs(fallspeed/2)
            distfromcenter=distfromcenter-((fallspeed/2)*direction)
            falltimer=0
        end
        
        
        if math.abs(math.floor((fallspeed*20+1))) > 767 then
            if donesoundbarrier==0 then
                sound("Game Sounds One:Explode 1")
            end
            if donesoundbarrier<120 then
                msg1="Faster Than Sound"
                donesoundbarrier = donesoundbarrier + 1
            end
        end
        
        if distancesincezone>200 then
            zone = zone + 1
            distancesincezone=0
        end
        
        lastarea=area
        
        type1=2+math.floor(zone/30)
        type2=math.floor(zone/5)
        type3=math.floor(zone/6)
        type4=math.floor(zone/8)
        thingno=type1+type2+type3+type4
        
        if distfromcenter<0 then
            direction=-direction
            --msg="The Center"
        end
        
        if distfromcenter>500 then
            area="Underground"
        end
        if distfromcenter>1000 then
            area="City"
        end
        if distfromcenter>1500 then
            area="Sky"
        end
        if distfromcenter>2000 then
            area="Space"
        end
        --[[if distfromcenter>2500 then
            direction=-direction
            --msg="On Top Of The World"
        end]]--
        
        if area==lastarea then else
            --msg=area
        end
        
        rotation = rotation - (rotation-(90-(direction*90)))/5
        
        
        thing[1][1]=1
        
        
        if parachute==0 and dead==0 then
            
            i=math.abs(fallspeed*2)
--[[          if direction==1 and fdir==1 then
                addorsub=1
            end
            if direction==-1 and fdir==1 then
                addorsub=-1
            end
            if direction==-1 and fdir==-1 then
                addorsub=1
            end
            if direction==1 and fdir==-1 then
                addorsub=-1
            end ]]--
            if i==0 then i=0.01 end
        if i>0.01 then i=0.01 end
            --[[if math.abs(fallspeed)<1 then
                fallspeed = fallspeed + (0.1*direction*herodownspeed[herosprite]*tiltspeedratio)
            else]]--
                fallspeed = fallspeed + (i*direction*herodownspeed[herosprite]*tiltspeedratio)
            --end
            
        end
        if fallspeed<0 then fdir=-1 else fdir=1 end
        if lastfdir==fdir then else
            sound("Game Sounds One:Whoosh 3")
        end
        lastfdir=fdir
        
    end
    if math.abs(fallspeed)>bestspeed then
        if topspeed==0 and bestspeed>0 then
            msg2="Top Speed!"
            topspeed=1
            --fallspeed=0
        end
        bestspeed=math.abs(fallspeed)
        saveLocalData("bestspeed",math.abs(fallspeed))
    end
    
    if distance>bestdist then
        if topdist==0 and bestdist>0 then
            msg3="Best Distance!"
            topdist=1
        end
        bestdist=distance
        saveLocalData("bestdist",distance)
    end
    
    fontSize(size/3)
    fill(255, 255, 255, 255)
    if dead==0 and title==0 then
        guix = guix - (guix-(WIDTH-size))/20
    end
    if fdir==1 then
    if dead==1 and heroy>HEIGHT then
        guix = guix - (guix-WIDTH/2)/20
        guiy1 = guiy1 - (guiy1-HEIGHT*2/3+size)/20
        guiy2 = guiy2 - (guiy2-HEIGHT*2/3+size*0.7)/20
    end
    else
    if dead==1 and heroy<0 then
        guix = guix - (guix-WIDTH/2)/20
        guiy1 = guiy1 - (guiy1-HEIGHT*2/3+size)/20
        guiy2 = guiy2 - (guiy2-HEIGHT*2/3+size*0.7)/20
    end
    end
    if dead==-1 then
        guiy1 = guiy1 - (guiy1-HEIGHT*3/2-size)/40
        guiy2 = guiy2 - (guiy2-HEIGHT*3/2-size*0.7)/40
        if guiy1>HEIGHT*2.5/2 then
            setup2()
        end
    end
    text((math.floor(distance/100)).." metres",guix,guiy1)
    text((math.floor((math.abs(fallspeed)*20))).." mph",guix,guiy2)
    
    
    
end

function makeenemy(n,t)
    for i=1,n do
        if thingno<realthingno then
            thingno = thingno + 1
            i=thingno
            thing[i][1]=t
            thing[i][2]=math.random(0,WIDTH)
            
            if thing[i][1]==5 then
                thing[i][2]=math.random(1,2)
                if thing[i][2]==1 then thing[i][2]=WIDTH-size*1.5 end
                if thing[i][2]==2 then thing[i][2]=size*1.5 end
            end
            
            if thing[i][1]==6 then
                thing[i][2]=math.random(1,2)
                if thing[i][2]==1 then thing[i][2]=WIDTH-size*2 end
                if thing[i][2]==2 then thing[i][2]=size*2 end
            end
            
            if thing[i][1]==7 then
                thing[i][2]=dofloor
                dofloor = dofloor + 1
                if thing[i][2]==1 then thing[i][2]=WIDTH-size*2 end
                if thing[i][2]==2 then thing[i][2]=size*2 end
            end
            
            thing[i][3]=math.random(-2*HEIGHT,-size)
            if thing[i][1]==5 or thing[i][1]==6 then
                thing[i][3]=math.random(-2*HEIGHT,-HEIGHT-size*2)
            end
            
            if thing[i][1]==7 then
                thing[i][3]=-3*size
            end
            
            thing[i][4]=size
            if thing[i][1]==4 then
                thing[i][4]=size*1.5
            end
            if thing[i][1]==6 then
                thing[i][4]=size*2
            end
            if thing[i][1]==7 then
                thing[i][4]=WIDTH/3
            end
            thing[i][5]=0
            thing[i][6]=math.random(-5,5)
            if thing[i][6]==0 then thing[i][6]=6 end
            thing[i][7]=0
            thing[i][8]=1
            thing[i][9]=math.random(0,15)
        end
    end
end

function titlescr()
    titley = titley - (titley-(HEIGHT*4/5))/40
    fontSize(size*1.5)
    fill(255, 255, 255, 255)
    text("Plummet",WIDTH/2,titley)
    fontSize(size/3)
    waitbest = waitbest + 1
    if waitbest>60 then
        bdx = bdx - (bdx-(WIDTH/2))/40
        bsx = bsx - (bsx-(WIDTH/2))/40
        headphonesy = headphonesy - (headphonesy-(HEIGHT/20))/150
        characterx = characterx - (characterx-(HEIGHT*3.25/10))/50
    end
    
    for i=1,5 do
        if changeto==i then
            noTint()
        else
            tint(255, 255, 255, 104)
        end
        sprite(herospriteface[i],WIDTH/2-(2*size)+size*(i-1),characterx,size,size)
        if starting==0 and (CurrentTouch.state==BEGAN or CurrentTouch.state==MOVING) and(((CurrentTouch.x-(WIDTH/2-(2*size)+size*(i-1)))^2)+((CurrentTouch.y-characterx))^2)^(1/2) <size/2 then
            if i==herosprite then else
                if changeto==i then else
                changingcharacter=1
                changeto=i
                sound("Game Sounds One:Whoosh 3")
                end
            end
        end
    end
    
    if changingcharacter==1 then
        heroy = heroy - (heroy-HEIGHT*1.5)/20
        if heroy>HEIGHT*1.25 then
            herosprite=changeto
            saveLocalData("herosprite",herosprite)
            changingcharacter=0
        end
    end
    
    
    
    text("Best Distance "..(math.floor(bestdist/100)).." metres",bdx,bdy)
    text("Top Speed "..(math.floor(bestspeed*20)).." mph",bsx,bsy)
    fontSize(size/4)
    text("A Sam Burton Game",WIDTH/2,headphonesy)
    if CurrentTouch.state==BEGAN and titley<HEIGHT and starting==0 and (CurrentTouch.y<characterx-size/2 or CurrentTouch.y>characterx+size/2) and changingcharacter==0 then
        if CurrentTouch.x<WIDTH-size and CurrentTouch.y < HEIGHT-size then
            starting=1
            sound("Game Sounds One:Whoosh 2")
        end
    end
    if starting==1 then
        red=27
        green=27
        blue=27
        titley = titley - (titley-(HEIGHT*2))/40
        bdx = bdx - (bdx-(WIDTH*2))/20
        bsx = bsx - (bsx-(-WIDTH))/20
        headphonesy = headphonesy - (headphonesy-(-HEIGHT/9))/10
        characterx = characterx - (characterx-(HEIGHT*-0.5))/10
        if titley>HEIGHT*1.1 then
            title=0
        end
    end
end

function die()
    fontSize(size)
    text("Dead ;(",WIDTH/2,guiy1+size)
    windowsx = windowsx + 6
    windowsx2 = windowsx2 - 6
    showdead = showdead + 1
    if showdead<2 then
        gamecenter.submitScore((math.floor(bestdist/100)),"PlummetBestDist")
        gamecenter.submitScore((math.floor(bestspeed*20)),"PlummetBestSpeed")
    end
    if showdead>=300 or CurrentTouch.state==BEGAN then
        if showdead>=60 then
            if dead==-1 then else
                dead=-1
                sound("Game Sounds One:Whoosh 2")
            end
        end
    end
end




function paused()
    if pause==1 then
        pausex=pausex-(pausex-WIDTH/2)/5
    end
    if pause==-1 then
        pausex=pausex-(pausex-WIDTH*2)/5
        if pausex>WIDTH*1.5 then pause=0 end
    end
    if pause==0 then
        pausex=-WIDTH
    end
    if CurrentTouch.state==BEGAN and dead==0 then
        if CurrentTouch.x>rememberx-5 and CurrentTouch.x<rememberx+5 and CurrentTouch.y>remembery-5 and CurrentTouch.y<remembery+5 then else
            if pause==1 then
                pause=-1
                sound("Game Sounds One:Whoosh 2")
            else
                pause=1
                sound("Game Sounds One:Whoosh 2")
            end
            rememberx=CurrentTouch.x
            remembery=CurrentTouch.y
        end
    end
    fontSize(size)
    text("Paused",pausex,HEIGHT*4/7)
end

function message1(t)
    msgc1 = msgc1 + 1
    if msgc1<180 then
        msgx1 = msgx1 - (msgx1-(HEIGHT/2))/30
    end
    if msgc1>180 then
        msgx1 = msgx1 - (msgx1-(HEIGHT*2))/60
    end
    if msgx1>HEIGHT*1.5 then
        msg1=0
        msgx1=-HEIGHT
        msgc1=0
    end
    fontSize(size/2)
    text(t,WIDTH/2,msgx1)
end

function message2(t)
msgc2 = msgc2 + 1
if msgc2<180 then
msgx2 = msgx2 - (msgx2-(HEIGHT/2-size/3))/30
end
if msgc2>180 then
msgx2 = msgx2 - (msgx2-(HEIGHT*2-size/3))/60
end
if msgx2>HEIGHT*1.5 then
msg2=0
msgx2=-HEIGHT-size/3
msgc2=0
end
fontSize(size/2)
text(t,WIDTH/2,msgx2)
end


function message3(t)
msgc3 = msgc3 + 1
if msgc3<180 then
msgx3 = msgx3 - (msgx3-(HEIGHT/2+size/3))/30
end
if msgc3>180 then
msgx3 = msgx3 - (msgx3-(HEIGHT*2+size/3))/60
end
if msgx3>HEIGHT*1.5 then
msg3=0
msgx3=-HEIGHT+size/3
msgc3=0
end
fontSize(size/2)
text(t,WIDTH/2,msgx3)
end

