function fin()
complete=1
xs=0
ys=-HEIGHT/8
t = t + 1
--[[background(27, 35, 150-ti*5, 255)
fill(27, 35, 150-ti*5, 255)
stroke(27,35,150-ti*5,255)
rect(-1,HEIGHT/2-size/9,WIDTH+900,HEIGHT+900)
fill(32, 200, 31, 255)
stroke(36,200,31,255)
rect(-1,-1,WIDTH+900,HEIGHT/2-size/9)
fill(255, 255, 255, 255)
tint(255, 255, 255, 255)
fill(137, 162, 223, 255)
stroke(255, 249, 0, 255)]]--
sky =moonlerp*20*60
i=255-(sky/7.5)
tint(i,i,i,255)
noTint()
spriteMode(CORNER)
sprite("Project:levelback",-1,-1,WIDTH+2,HEIGHT+2)
spriteMode(CENTER)
----fontSize(WIDTH/10)

bounce=math.sin(t/5)*6


if starcount==fullstars then
    printword("GAME CONQUERED!",-1,HEIGHT*8/10+bounce,size,size)
else
    printword("GAME COMPLETE!",-1,HEIGHT*8/10+bounce,size,size)
end
    tint(0, 0, 0, 124)
printword("CREATED BY SAM BURTON",-WIDTH/25,HEIGHT/17,size/1.5,size/1.5)
    noTint()
printword("CREATED BY SAM BURTON",-WIDTH/25,HEIGHT/16,size/1.5,size/1.5)
    
    
printword("FINAL SCORE: "..score,-1,HEIGHT*6/10,size/2,size/2)
drawparts()
moveparts()
noTint()
sprite("Project:star",WIDTH/2,HEIGHT*4.5/10,size*2)
for i=1,3 do
if t%3==i and t%15<3 then
addparts(WIDTH/2+samrandm(size),HEIGHT*4.5/10+samrandm(size),samrandm(6),samrandm(6),0.05,60,7)
            end
if t%15==0 then
    addparts(WIDTH/2+samrandm(size),HEIGHT*4.5/10+samrandm(size),samrandm(6),samrandm(6),0.05,40,7)
end
end
printword(starcount.."/"..fullstars,-1,HEIGHT*3.5/10,size/1.5,size/1.5)

wobble = wobble + 1.34
if WIDTH>HEIGHT then size=HEIGHT/10 else size=WIDTH/10 end
pysize=(math.sin((wobble)/11)*WIDTH/86)+size*2
pxsize=(math.sin((wobble)/10)*WIDTH/86)+size*2
bysize=(math.sin((wobble)/20)*WIDTH/64)+size*2
hxsize=(math.sin((wobble)/10)*WIDTH/112)+size*2
bxsize=(math.sin((wobble)/10)*WIDTH/112)+size*2

tint(255+exscale*2, 255+exscale*2,255 +exscale*2, 255)
sprite("Project:next",WIDTH/2,HEIGHT/5,hxsize*3/2+exscale,bysize*3/2+exscale)
--printword("BACK",-1,HEIGHT/5,(hxsize*3/2+exscale)/5,(bysize*3/2+exscale)/5)
if t>30 then
rt,exscale=checkbutton(WIDTH/2,HEIGHT/5,hxsize,bysize,exscale)
if rt==1 then
    fading=1
    t=0
    splay()
end
end
if fading==1 then
    if exscale>-size then
        exscale = exscale - 1
    end
    fadeout = fadeout + 10
    if fadeout>255 then
        level=1
        setup2()
        play=0
        fadeout=0
     --   saveLocalData("level",1)
      --  level = readLocalData("level")
    end
end
tint(255, 255, 255, fadeout)
sprite("Project:hole",WIDTH/2,HEIGHT/2,WIDTH,HEIGHT)
end