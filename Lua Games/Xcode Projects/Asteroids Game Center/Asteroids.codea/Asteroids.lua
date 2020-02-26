function initasteroids()
    ast={
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0},
    {0,0,0,0,0,0}
    }
    astno=5
    for i=1,table.maxn(ast) do
        ast[i][1]=-WIDTH*2
        ast[i][2]=-HEIGHT*2
        ast[i][5]=1
        ast[i][4]=0
    end
    for i=1,astno do
        angle = math.random(0,360)
        ast[i][1]=herox+math.cos(angle)*(WIDTH*2)-xoff
        ast[i][2]=heroy+math.sin(angle)*(HEIGHT*2)-yoff
        ast[i][3]=angle-math.pi
        ast[i][4]=1
        ast[i][5]=1
        ast[i][6]=-i*180 + 180
    end
    
    asts={
    "Tyrian Remastered:Rock 5",
    "Tyrian Remastered:Rock 3",
    "Tyrian Remastered:Rock 2"
    }
end


function addsmallast(x,y,s,a)
    for i=1,2 do
        if s<=3 then
            foundast=0
            for i=astno,table.maxn(ast) do
                if foundast==0 then
                    if ast[i][4]==0 then
                        foundast=1
                        ast[i][1]=x
                        ast[i][2]=y
                        ast[i][3]=a+math.random(-10,10)/10
                        ast[i][4]=1
                        ast[i][5]=s
                        ast[i][6]=1
                    end
                end
            end
        end
    end
end


function doasteroids()
    for i=1,table.maxn(ast) do
        if justblewup>0 or respawnwait>0 or msg=="WAVE COMPLETE" then
                if ast[i][1]+xoff<WIDTH+size*2 and ast[i][1]+xoff>-size*2 and ast[i][2]+yoff<HEIGHT+size*2 and ast[i][2]+yoff>-size*2 then
                --makepoint(enemies[j][1],enemies[j][2],255,math.random(2,5),lasers[j][3],lasers[j][4])
                if justblewup>0 then
                    score = score + 10
                end
                if respawnwait==60 or msgtime==180 then
                    if ast[i][6]>0 then
                        if ast[i][4]==0 then else
                            addexplode9(ast[i][1],ast[i][2])
                        end
                    end
                end
                angle = math.random(0,360)
                ast[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
                ast[i][2]=heroy+math.sin(angle)*(HEIGHT*1.5)-yoff
                ast[i][3]=angle-math.pi
                ast[i][5]=1
                ast[i][6]=-i*180
                if i<=5 then
                    ast[i][4]=1
                    else
                        ast[i][4]=0
                    end
                end
            end
        
        if ast[i][6]>0 then if ast[i][4]==0 then else
                if pause==0 then
                ast[i][1]=ast[i][1]+math.cos(ast[i][3])*size/16*(ast[i][5]/3)
                ast[i][2]=ast[i][2]+math.sin(ast[i][3])*size/16*(ast[i][5]/3)
                ast[i][4]=ast[i][4]+1
                end
                pushMatrix()
                translate(ast[i][1]+xoff,ast[i][2]+yoff)
                
                rotate(ast[i][4]*((ast[i][5])-0.5))
                sprite(asts[ast[i][5]],0,0,size/2*(4-ast[i][5]))
                popMatrix()
                if math.abs(ast[i][1]-herox)>WIDTH*1.5 and math.abs(ast[i][2]-heroy)>HEIGHT*1.5 then
                    angle = math.random(0,360)
                    ast[i][1]=herox+math.cos(angle)*(WIDTH*2)-xoff
                    ast[i][2]=heroy+math.sin(angle)*(HEIGHT*2)-yoff
                    ast[i][3]=angle-math.pi
                end
                
                if math.abs(ast[i][1]+xoff-herox)<size/1.5*(4-ast[i][5])/2 and math.abs(ast[i][2]+yoff-heroy)<size/1.5*(4-ast[i][5])/2 and justdied<0 then
                    
                    health = health - 1
                    bossflashtime=0
                    if health==0 then
                        newmessage("FINAL LIFE",240)
                        
                    end
                    addexplode1(herox-xoff,heroy-yoff)
                    numberoflasers=1
                    shootspeed=15
                    backwardslaser=0
                    tofillup=50
                    pointsfilled=0
                    nextupgrade=1
                    fastshoottime=0
                    multishoottime=0
                    respawnwait=60
                    addexplode9(ast[i][1],ast[i][2])
                    
                    if ast[i][5]==1 then
                        angle = math.random(0,360)
                        ast[i][1]=herox+math.cos(angle)*(WIDTH*2)-xoff
                        ast[i][2]=heroy+math.sin(angle)*(HEIGHT*2)-yoff
                        ast[i][3]=angle-math.pi
                        ast[i][4]=1
                        ast[i][6]=-180
                    else
                        ast[i][4]=0
                    end
                    
                    score = score + 5
                    if score>highscore then
                        highscore=score
                        saveLocalData("cw10a",highscore/3) 
                          saveLocalData("highscore",highscore)
                    end
                    sound("Game Sounds One:Explode Big")
                    --[[for i=1,enemyno do
                    
                    if enemies[i][1]<WIDTH+size and enemies[i][1]>-size and enemies[i][2]<HEIGHT+size and enemies[i][2]>-size then
                    enemies[i][6]=math.random(1,10)*60
                    angle = math.random(0,360)
                    enemies[i][1]=herox+math.cos(angle)*(WIDTH)
                    enemies[i][2]=heroy+math.sin(angle)*(WIDTH)
                    addexplode5(enemies[i][1],enemies[i][2])
                end
                    
                end]]--
                
                if health<0 then
                    if dead==0 then
                        dead=1
                    end
                end
            end
            
            for j=1,laserno do
                if lasers[j][6]==1 and respawnwait<0 then
                    if math.abs(ast[i][1]+xoff-lasers[j][1])<size/2*(4-ast[i][5])/2 and math.abs(ast[i][2]+yoff-lasers[j][2])<size/2*(4-ast[i][5])/2 then
                        sound(SOUND_EXPLODE, 31237)
                        --makepoint(ast[i][1],ast[i][2],255,math.random(2,5),lasers[j][3],lasers[j][4])
                        addexplode9(ast[i][1],ast[i][2])
                        addsmallast(ast[i][1],ast[i][2],ast[i][5]+1,ast[i][3])
                        if ast[i][5]==1 then
                            angle = math.random(0,360)
                            ast[i][1]=herox+math.cos(angle)*(WIDTH*2)-xoff
                            ast[i][2]=heroy+math.sin(angle)*(HEIGHT*2)-yoff
                            ast[i][3]=angle-math.pi
                            ast[i][4]=1
                            ast[i][6]=-180
                        else
                            ast[i][4]=0
                        end
                        lasers[j][6]=0
                        score = score + 5
                        if score>highscore then
                            highscore=score
                            saveLocalData("cw10a",highscore/3)   
                            saveLocalData("highscore",highscore)
                        end
                        
                    end
                end
            end
            
        end
    else
        if ast[i][6]>-10 then
            angle = math.random(0,360)
            ast[i][1]=herox+math.cos(angle)*(WIDTH*2)-xoff
            ast[i][2]=heroy+math.sin(angle)*(HEIGHT*2)-yoff
            ast[i][3]=angle-math.pi
        end
        ast[i][6]=ast[i][6]+1
    end
end
end
