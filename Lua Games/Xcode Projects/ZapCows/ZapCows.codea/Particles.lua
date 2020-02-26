partno=256

function samrand(x)
    x=(math.random(100)*x)/100
    return(x)
end

function mathrandom(a,b)
    return(math.random(math.floor(a),math.floor(b)))
end

function samrandm(x)
    x=(math.random(100)*x)/100-x/2
    return(x)
end

function samwrite(x,y,a1,a2,a3)
    writing[e][1]=x
    writing[e][2]=y
    writing[e][3]=a1
    writing[e][4]=a2
    writing[e][5]=a3
    writing[e][6]=mathrandom(1,6)
    e = e + 1
    if e>20 then e=1 end
end

function initparts()
    parts={}
    for i=1,partno do
        parts[i]={x=0,y=0,mx=0,my=0,grav=0,time=0,kind=0,spin=0}
    end
end

function addparts(x,y,mx,my,g,t,c)
    dying=1000
    slot=1
    for i = 1,partno do
        if parts[i].time<dying then
            dying=parts[i].time
            slot=i
        end
    end
    parts[slot].x=x
    parts[slot].y=y
    parts[slot].mx=mx
    parts[slot].my=my
    parts[slot].grav=g
    parts[slot].time=t
    parts[slot].kind=c
    parts[slot].spin=samrandm(16)
    parts[slot].angle=0
end
    
function moveparts()
 for i=1,partno do
        if parts[i].time>0 then
            parts[i].x=parts[i].x+parts[i].mx
            parts[i].y=parts[i].y+parts[i].my
            parts[i].my=parts[i].my-parts[i].grav
            parts[i].time=parts[i].time-1
            parts[i].angle=parts[i].angle+parts[i].spin
        end
    end
end

function drawparts()
    num=0
    for i=1,partno do
        if parts[i].time>0 then
            if parts[i].time<32 then
                a=parts[i].time*8
            else
                a=255
            end
            gfx="Space Art:Star"
            if parts[i].kind==1 then tint(81, 255, 0, a) s=6 end
            if parts[i].kind==2 then tint(255, 3, 0, a) s=16 end
            if parts[i].kind==3 then tint(255, 242, 0, a) s=6 end
            if parts[i].kind==4 then tint(0, 255, 248, a) s=8 end
            if parts[i].kind==5 then tint(255, 242, 0, a) s=4 end
            if parts[i].kind==6 then tint(255, 255, 255, 128) s=3.5 gfx="Project:fire" end
            if parts[i].kind==7 then tint(255, 255, 128, a) s=5 end
            pushMatrix()
            translate(parts[i].x,parts[i].y)
            rotate(parts[i].angle)
            sprite(gfx,0,0,size/s,size/s)
            popMatrix()
            num = num + 1
        end
    end
    --print(num)
end

function addexplode1(x,y)
    for i=1, 6 do
      addparts(x+samrand(size)-size/2,y+samrand(size)-size/2,samrand(4)-2,samrand(4)-2,0.1,60,1)
        
    end
end

function addexplode2(x,y)
    for i=1, 3 do
        addparts(x,y,samrand(4)-2,samrand(4)-2,0.1,60,2)
        
    end
end

function addexplode3(x,y)
    for i=1, 16 do
        addparts(x,y,samrand(6)-3,samrand(6)-3,0.1,120,3)
        
    end
end

function addexplode4(x,y)
    for i=1, 6 do
        addparts(x,y,samrand(6)-3,samrand(6)-3,0.1,90,4)
        
    end
end

function addexplode5(x,y)
    for i=1, 32 do
        addparts(x,y,samrand(8)-4,samrand(8)-4,0.1,180,5)
        
    end
end

function addexplode6(x,y)
    for i=1, 1 do
        addparts(x,y,samrand(4)-2,samrand(2),0,5,6)
        
    end
end

function addexplode7(x,y)
    for i=1, 32 do
        addparts(x,y,samrand(12)-6,samrand(12)-6,0.0,60,7)
    end
end

function checkbox(x,y,sx,sy)
    if CurrentTouch.x < x+sx/2 and CurrentTouch.x>x-sx/2 and CurrentTouch.y>y-sy/2 and CurrentTouch.y<y+sy/2 then
        return(1)
    else
        return(nil)
    end
end

function checkbutton(x,y,sx,sy,sc)
    rt=0
    if checkbox(x,y,sx,sy) then
        if CurrentTouch.state==BEGAN or CurrentTouch.state==MOVING and fading==0 then 
            if sc==0 then sound(SOUND_PICKUP, 31936) end
            sc = sc - 5
            if sc<-20 then sc=-20 end
        end
        if CurrentTouch.state == ENDED and sc~=0 then
            rt=1
            sc = sc - 5
            if sc<-20 then sc=-20 end
        end
    else
          if fading==0 and sc<0 then sc = sc + 5 end
    end
    return rt,sc
end

            

function printnum(num,x,y,s,s2,cent)
    --noTint()
    
    if cent==nil then cent=0 end
    
  --  if num<10 then x = x - s/3 end 
    if num<0 then 
        neg=1
        num = 0 - num
        if cent~=0 then x=x+s/3 end
    else
        neg=0
    end
    i=num
    if cent~=0 and i>=10 then
        repeat
            i=i/10
            x=x+s/3
        until i<10
    end
    if cent<0 then x=x+cent/2 end
    edge=x+s
    repeat
        --print(math.floor(num%10)+1)
     --   if neg==1 then
     --       tint(255, 0, 0, 255)
     --   end
      --  fontSize(s)
        sprite(numbers[math.floor(num%10)+1],x,y,s,s2)
        x=x-s/1.5
        num=num/10
    until num<1
    if neg==1 then
        sprite("Project:-",x-s/10,y,s,s2)
    end
    return(edge)
end

function printword(word,x,y,s,s2)
    a=WIDTH-size
    if #word*(s/1.8)>a then s=(a/#word)*1.8 s2=s end
    if x<0 then x=(WIDTH/2-(s/1.8)*(#word/2))+(s/3.6) end
    for i=1, #word do
        c=string.byte(word,i)
        d=c-64
        sz=1.0
        if c==32 then
            else
            if c==73 or c==58 then sz=1.5 end
            if c==33 then d=37 end
            if c==58 then d=38 end
            if c==91 then d=39 end
            if c==47 then d=40 end
            if c==94 then d=41 end
            if c==45 then d=42 end
            if c>=48 and c<58 then d=c-21 end
       --     print(c,d)
           sprite(letters[d],x,y,s/sz,s2)
            end
        x=x+s/1.8
    end
end