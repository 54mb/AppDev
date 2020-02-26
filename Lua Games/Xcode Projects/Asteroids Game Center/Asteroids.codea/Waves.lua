-- Asteroids
music("Game Music One:Pulsar",true)
music.volume=0.4
music.pan=0
-- Use this function to perform your initial setup

displayMode(FULLSCREEN_NO_BUTTONS)

function printword(word,x,y,s,s2)
a=WIDTH-size
if #word*(s)>a then s=(a/#word) s2=s end
if x<0 then
-- x=(WIDTH/2-(s*1.1)*(#word/2))+(s)
x=WIDTH/2-((#word*s*1.1)/2)+(s*0.55)
end
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
if c>=48 and c<58 then d=c-21 end
noTint()
noFill()
if letters[d]=="Project:colon" then x=x-s/4 s = s / 3 end
sprite(letters[d],x,y,s,s2)
if letters[d]=="Project:colon" then s = s * 3 x=x+s/4 end
end
x=x+s*1.1
end
end
function printword2(word,x,y,s,s2)
a=WIDTH-size
if #word*(s)>a then s=(a/#word) s2=s end
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
if c>=48 and c<58 then d=c-21 end
noTint()
noFill()
sprite(letters[d],x,y,s,s2)
end
x=x+s*1.1
end
end
function setup()
titleflash=0
displayMode(FULLSCREEN_NO_BUTTONS)
letters={
"Project:A",
"Project:B",
"Project:C",
"Project:D",
"Project:E",
"Project:F",
"Project:G",
"Project:H",
"Project:I",
"Project:J",
"Project:K",
"Project:L",
"Project:M",
"Project:N",
"Project:O",
"Project:P",
"Project:Q",
"Project:R",
"Project:S",
"Project:T",
"Project:U",
"Project:V",
"Project:W",
"Project:X",
"Project:Y",
"Project:Z",
"Project:0",
"Project:1",
"Project:2",
"Project:3",
"Project:4",
"Project:5",
"Project:6",
"Project:7",
"Project:8",
"Project:9",
"Project:!",
"Project:colon",
}

stars={
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0}
}
for i=1,table.maxn(stars) do
stars[i][1]=math.random(math.floor(-WIDTH/2),math.floor(WIDTH*1.5))
stars[i][2]=math.random(math.floor(-HEIGHT/2),math.floor(HEIGHT*1.5))
end
i=table.maxn(stars)
stars[i][1]=math.random(0,WIDTH)
stars[i][2]=math.random(0,HEIGHT)
planetcolour=math.random(0,2)
if planetcolour>0 then
planethasmoon=math.random(0,1)
else
planethasmoon=0
end
setup2()
end
function setup2()
justopenedgamecenter=1
displayMode(FULLSCREEN_NO_BUTTONS)
supportedOrientations(LANDSCAPE_ANY)
size=(WIDTH+HEIGHT)/30
herox=WIDTH/2
heroy=HEIGHT/2
joy1x=WIDTH*1.5/10
joy1y=HEIGHT*1.5/10
joy2x=WIDTH*8.5/10
joy2y=HEIGHT*1.5/10
joy1t=0
joy2t=0
joy2a=0
enemyr=0
joy1a=0
joy1xdif=0
joy2xdif=0
joy1startx=WIDTH*1.5/10
joy1starty=HEIGHT*1.5/10
joy2startx=WIDTH*8.5/10
joy2starty=HEIGHT*1.5/10

joy1ydif=0
joy2ydif=0
xoff=WIDTH/2
yoff=HEIGHT/2

numberoflasers=1
backwardslaser=0
shootspeed=15
bossflashtime=120
shooting=0
tofillup=50
nextupgrade=1

msg=""
msgtime=0
msgx=-WIDTH
maxupgrades=0
msgy=HEIGHT*2/3
multishoottime=0
bossshoottime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
for i=1,table.maxn(bossshoottime) do
bossshoottime[i]=math.random(1,30)
end
fastshoottime=0
bombno=3
gunr=0
score=0
red=0
green=0
blue=0

wave=1

noenemy=1
gunherodiff=0
currentwave=1

health=3

tailflicker=1
tailflickertime=0
tailflickertimer= math.random(5,15)

heroflash=1
justdied=-1
pointsfilled=0
filledup=0
respawnwait=-1
dead=0
justblewup=0
boomflash=255
redpulse=0
greenpulse=0
doneflashtime=120
boomcount=0
gameovertint=0
pause=0

reset=0
dogamecenter=60

if readLocalData("highscore")==nil or reset ==1 then
saveLocalData("highscore",0)
else
liam=math.floor(readLocalData("highscore"))
end
if readLocalData("cw10a")==nil or reset==1 then
highscore=0
saveLocalData("cw10a",0)
else
highscore=math.floor(readLocalData("cw10a"))*3
end
if readLocalData("bestwave")==nil or reset==1 then
bestwave=0
saveLocalData("bestwave",0)
else
bestwave=math.floor(readLocalData("bestwave"))
end
if readLocalData("enemieskilled")==nil or reset==1 then
enemieskilled=0
saveLocalData("enemieskilled",0)
else
enemieskilled=math.floor(readLocalData("enemieskilled"))
end

if readLocalData("bosswavesdone")==nil or reset==1 then
bosswavesdone=math.floor(bestwave/5)
saveLocalData("bosswavesdone",bosswavesdone)
else
bosswavesdone=math.floor(readLocalData("bosswavesdone"))
end

if readLocalData("cw10a")*3==readLocalData("highscore") then
annoy=0
else
annoy=0
end

ltimer=0
heror=0
touches = {}

lasers={
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
laserno=table.maxn(lasers)

enemies={
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0}
}
enemyno=table.maxn(enemies)
for i=1,enemyno do
enemies[i][1]=-WIDTH*2
enemies[i][2]=-HEIGHT*2
end
--dowaves()
for i=1,5 do
angle = math.random(0,360)
enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)+xoff
enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT*1.5)+yoff
enemies[i][3]=herox
enemies[i][4]=heroy
enemies[i][5]=0
enemies[i][6]=-60*i
enemies[i][7]=1
end
enemiesleft=5


points={
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0}
}
pointno=table.maxn(points)
initparts()
deadtimer=0
play="title"
healthorbs={0,0,0,0,0,0,0,0,0,0,0,0}
for i=1,table.maxn(healthorbs) do
healthorbs[i]=healthorbs[i]/(180/math.pi)
end

bosslasers={
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0}
}
bosslaserno=table.maxn(bosslasers)
for i=1,bosslaserno do
bosslasers[i][1]=-WIDTH*2
bosslasers[i][2]=-HEIGHT*2
end
initasteroids()



end

-- This function gets called once every frame
function draw()
back()
noTint()
if play=="game" then
if dead==0 or gameovertint < 255 then
if pause==0 then
moveparts()
end
drawparts()
noTint()
dopoints()
noTint()

movebosslasers()
doenemies()
doasteroids()
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)
end

noTint()
hero()
domessages()
end
if dead==1 then
gameover()
end
end
GUI()


--Gamecenterstuff...
if dogamecenter>60 then
if gamecenter.enabled() then
gamecenter.submitScore(highscore,"TopScoresreal")
gamecenter.submitScore(bestwave,"bestwavesreal")
gamecenter.submitAchievement( "killonehundredenemiesreal", enemieskilled )
gamecenter.submitAchievement( "killfivehundredenemiesreal", enemieskilled/5 )
gamecenter.submitAchievement( "killonethousandenemiesreal", enemieskilled/10 )
gamecenter.submitAchievement( "killfivethousandenemiesreal", enemieskilled/50 )
gamecenter.submitAchievement( "onebosswavereal", bosswavesdone*100 )
gamecenter.submitAchievement( "fivebosswavesreal", bosswavesdone*20 )
gamecenter.submitAchievement( "fiftybosswavesreal", bosswavesdone*2 )
dogamecenter=0
end
else
dogamecenter=dogamecenter+1
end

if play=="title" and gamecenter.enabled() then
spriteMode(CENTER)
noTint()
sprite("Project:GameCenter",WIDTH-size*0.75,size*0.75,size*1.5,size*1.5)
for k,touch in pairs(touches) do
if touch.x>WIDTH-size*1.5 and touch.y < size*1.5 then
if pausepressx==touch.x and pausepressy==touch.y then else
if pause==0 and touch.state==BEGAN then
pausepressx=touch.x
pausepressy=touch.y
if justopenedgamecenter==1 then
gamecenter.showAchievements()
justopenedgamecenter=0
end
else
justopenedgamecenter=1
end
end
end
end
end






end

function back()
background(red,green,blue, 25)
star()
end

function star()
for i=1,table.maxn(stars) do
if i==table.maxn(stars) then
tint(255, 255, 255, 255)
pushMatrix()
translate(stars[i][1]+(xoff/4)*(i*2/(table.maxn(stars))+1),stars[i][2]+(yoff/4)*(i*2/(table.maxn(stars))+1))
rotate(planethasmoon*200)
if planetcolour==1 then
sprite("Project:Planet1",0,0,size*5)
end
if planetcolour==2 then
sprite("Project:Planet2",0,0,size*5)
end
popMatrix()
if planethasmoon>0 then
planethasmoon = planethasmoon + 0.0001
x=stars[i][1]+(xoff/4)*(i*2/(table.maxn(stars))+1)
y=stars[i][2]+(yoff/4)*(i*2/(table.maxn(stars))+1)
sprite("Project:Moon",x+math.cos(planethasmoon)*size*4,y+math.sin(planethasmoon)*size*4,size)
else
planethasmoon = planethasmoon - 0.0001
end
noTint()
else
tint(255, 255, 255, 255*(i/table.maxn(stars)*2))
sprite("Space Art:Star",stars[i][1]+(xoff/4)*(i/(table.maxn(stars))+1),stars[i][2]+(yoff/4)*(i/(table.maxn(stars))+1),size/10)
noTint()
end
end
if CurrentTouch.x>WIDTH-size/2 and CurrentTouch.y>HEIGHT-size/2 then
safty = safty + 1
if safty>60 then

--displayMode(FULLSCREEN)


end
else
safty=0
end
end


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




function movebosslasers()
for i=1,bosslaserno do
if bosslasers[i][6]==1 then
if respawnwait>0 then
angle = math.random(0,360)
bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2-xoff
bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2-yoff
end
if justblewup>0 then
angle = math.random(0,360)
bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2-xoff
bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2-yoff
end
if pause==0 then
bosslasers[i][1]=bosslasers[i][1]+bosslasers[i][3]
bosslasers[i][2]=bosslasers[i][2]+bosslasers[i][4]
end
pushMatrix()
translate(bosslasers[i][1],bosslasers[i][2])
missiler=math.atan2(bosslasers[i][4],bosslasers[i][3])*180/math.pi+90
rotate(missiler)

if bosslasers[i][5]==1 then
sprite("Tyrian Remastered:Huge Missile",0,0,size/2)
addexplode7(bosslasers[i][1]-xoff,bosslasers[i][2]-yoff)
end
popMatrix()

if bosslasers[i][1]<-size or bosslasers[i][1]>WIDTH+size then
bosslasers[i][6]=0
end
if bosslasers[i][2]<-size or bosslasers[i][2]>HEIGHT+size then
bosslasers[i][6]=0
end

for j=1,laserno do
if lasers[j][6]==1 and bosslasers[i][6]==1 and bosslasers[i][5]==1 then
if math.abs(bosslasers[i][1]-lasers[j][1])<size/2 and math.abs(bosslasers[i][2]-lasers[j][2])<size/2 then
lasers[j][6]=0
bosslasers[i][6]=0
bosslasers[i][5]=0
addexplode5(bosslasers[i][1]-xoff,bosslasers[i][2]-yoff)
angle = math.random(0,360)
bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2+xoff
bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2+yoff
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
if math.abs(bosslasers[i][1]-herox)<size/1.25 and math.abs(bosslasers[i][2]-heroy)<size/1.25 and justdied<0 then

bosslasers[i][6]=0
health = health - 1
bossflashtime=0
if health==0 then
newmessage("FINAL LIFE",240)

end
addexplode1(herox-xoff,heroy-yoff)
angle = math.random(0,360)
bosslasers[i][1]=herox+math.cos(angle)*(WIDTH+HEIGHT)*2-xoff
bosslasers[i][2]=heroy+math.sin(angle)*(WIDTH+HEIGHT)*2-yoff
numberoflasers=1
shootspeed=15
tofillup=50
backwardslaser=0
pointsfilled=0
nextupgrade=1
fastshoottime=0
multishoottime=0
respawnwait=60
sound("Game Sounds One:Explode Big")
--[[ for i=1,enemyno do

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
end
end


function addbosslaser(s)
foundgoodbosslaserslot=0
for i=1,bosslaserno do
if foundgoodbosslaserslot==0 then
if bosslasers[i][6]==0 then
bosslasers[i][6]=1
bosslasers[i][5]=1
foundgoodbosslaserslot=1
shift=((numberoflasers*15)+15)
enemyr=math.atan2((enemies[s][4]-enemies[s][2]),(enemies[s][3]-enemies[s][1]))*180/math.pi
bosslasers[i][3]=math.cos(enemyr/(180/math.pi))*size/10
bosslasers[i][4]=math.sin(enemyr/(180/math.pi))*size/10
--addexplode5(bosslasers[i][1],bosslasers[i][2])
bosslasers[i][1]=enemies[s][1]+xoff
bosslasers[i][2]=enemies[s][2]+yoff
end
end

end
end


-- This function gets called whenever a touch
--  begins or changes state
function touched(touch)
if touch.state == ENDED then
-- When any touch ends, remove it from
--  our table
touches[touch.id] = nil
else
-- If the touch is in any other state
--  (such as BEGAN) we add it to our
--  table
touches[touch.id] = touch
end
end


function doenemies()
if justblewup>-1 then
justblewup = justblewup - 1
end
checkwave()
for i=1,enemyno do
if enemies[i][6]<0 and enemies[i][6]>-10 then
enemies[i][3]=herox-xoff
enemies[i][4]=heroy-yoff
enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
enemies[i][2]=heroy+math.sin(angle)*(HEIGHT+1.5)-yoff
end
if enemies[i][6]>1 and wave == enemies[i][7] then

if respawnwait>0 then
if respawnwait>59 then
addexplode5(enemies[i][1],enemies[i][2])
end
angle = math.random(0,360)
enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
enemies[i][2]=heroy+math.sin(angle)*(HEIGHT*1.5)-yoff

end



if justblewup>0 then

if enemies[i][1]+xoff<WIDTH+size*2 and enemies[i][1]+xoff>-size*2 and enemies[i][2]+yoff<HEIGHT+size*2 and enemies[i][2]+yoff>-size*2 then
--makepoint(enemies[j][1],enemies[j][2],255,math.random(2,5),lasers[j][3],lasers[j][4])
score = score + 10
if justblewup==4 then
addexplode5(enemies[i][1],enemies[i][2])
makepoint(enemies[i][1],enemies[i][2],255,math.random(2,5),math.random(1,math.floor(size/2)),math.random(1,math.floor(size/2)))
addexplode5(enemies[i][1],enemies[i][2])
end

if enemies[i][6]>0 then
enemies[i][6]=math.random(1,10)*60
end
angle = math.random(0,360)
enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
enemies[i][2]=heroy+math.sin(angle)*(HEIGHT*1.5)-xoff
enemies[i][8]=0
enemies[i][7]=0
end
end
if enemies[i][7]==wave then
enemies[i][6]=enemies[i][6]+1
end

--Enemy1
if enemies[i][5]==0 then
if math.abs(enemies[i][1]-enemies[i][3])<size and math.abs(enemies[i][2]-enemies[i][4])<size then
enemies[i][3]=herox-xoff
enemies[i][4]=heroy-yoff
end

enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
pushMatrix()
translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
rotate(enemyr-90)
sprite("Project:Enemy 1",0,0,size)
popMatrix()
if pause==0 and respawnwait<0 then
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
addexplode6(enemies[i][1],enemies[i][2])
end
for j=1,laserno do
if lasers[j][6]==1 then
if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then

sound("Game Sounds One:Explode 1")
makepoint(enemies[i][1],enemies[i][2],255,math.random(2,5),lasers[j][3],lasers[j][4])
addexplode5(enemies[i][1],enemies[i][2])
angle = math.random(0,360)
enemies[i][6]=-60
--enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
--enemies[i][2]=heroy+math.sin(angle)*(HEIGHT)-yoff
lasers[j][6]=0
enemies[i][7]=0
score = score + 10
enemieskilled=enemieskilled+1
saveLocalData("enemieskilled",enemieskilled)
resetenemy(i)
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)

end
end
end
end
end

--Enemy2
if enemies[i][5]==1 then
if math.abs(enemies[i][1]-enemies[i][3])<size and math.abs(enemies[i][2]-enemies[i][4])<size then
enemies[i][3]=herox-xoff
enemies[i][4]=heroy-yoff
end

enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
pushMatrix()
translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
rotate(enemyr-90)
if enemies[i][8]>3 then
sprite("Project:Enemy 2",0,0,size)
else
sprite("Project:Enemy 2",0,0,size/1.125)
end
popMatrix()
if pause==0 and respawnwait<0 then
if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
else
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/5)
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/5)
addexplode6(enemies[i][1],enemies[i][2])
end
end
for j=1,laserno do
if lasers[j][6]==1 then
if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then
if enemies[i][8]>0 then
enemies[i][8]=enemies[i][8]-1
lasers[j][6]=0
score = score + 1
addexplode5(enemies[i][1],enemies[i][2])
sound(SOUND_HIT, 31238)
else
sound("Game Sounds One:Explode 1")
makepoint(enemies[i][1],enemies[i][2],255,math.random(4,10),lasers[j][3],lasers[j][4])
addexplode5(enemies[i][1],enemies[i][2])
angle = math.random(0,360)
enemies[i][6]=-60
--enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
--enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
lasers[j][6]=0
enemies[i][7]=0
score = score + 20
enemieskilled=enemieskilled+1
saveLocalData("enemieskilled",enemieskilled)
resetenemy(i)
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)
end
end
end
end
end
end


--Enemy3
if enemies[i][5]==2 then

enemies[i][3]=herox-xoff
enemies[i][4]=heroy-yoff


enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
pushMatrix()
translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
rotate(enemyr-90)
if enemies[i][8]>1 then
sprite("Project:Enemy 3",0,0,size)
else
sprite("Project:Enemy 3",0,0,size/1.125)
end
popMatrix()
if pause==0 and respawnwait<0 then
if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
else
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/2)
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/2)
addexplode6(enemies[i][1],enemies[i][2])
end
end
for j=1,laserno do
if lasers[j][6]==1 then
if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then
if enemies[i][8]>0 then
enemies[i][8]=enemies[i][8]-1
lasers[j][6]=0
score = score + 1
addexplode5(enemies[i][1],enemies[i][2])
sound(SOUND_HIT, 31238)
else
sound("Game Sounds One:Explode 1")
makepoint(enemies[i][1],enemies[i][2],255,math.random(8,20),lasers[j][3],lasers[j][4])
addexplode5(enemies[i][1],enemies[i][2])
angle = math.random(0,360)
enemies[i][6]=-60
--enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
--enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
lasers[j][6]=0
enemies[i][7]=0
score = score + 40
enemieskilled=enemieskilled+1
saveLocalData("enemieskilled",enemieskilled)
resetenemy(i)
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)
end
end
end
end
end
end

--Enemy4
if enemies[i][5]==3 then

enemies[i][3]=herox-xoff
enemies[i][4]=heroy-yoff


enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
pushMatrix()
translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
rotate(enemyr-90)
if enemies[i][8]>4 then
sprite("Project:enemy4",0,0,size)
else
sprite("Project:enemy4",0,0,size/1.125)
end
popMatrix()
if pause==0 and respawnwait<0 then
if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
else
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/8)
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/8)
addexplode6(enemies[i][1],enemies[i][2])
end
end
for j=1,laserno do
if lasers[j][6]==1 then
if math.abs(enemies[i][1]+xoff-lasers[j][1])<size/2 and math.abs(enemies[i][2]+yoff-lasers[j][2])<size/2 then
if enemies[i][8]>0 then
enemies[i][8]=enemies[i][8]-1
lasers[j][6]=0
score = score + 1
addexplode5(enemies[i][1],enemies[i][2])
sound(SOUND_HIT, 31238)
else
sound("Game Sounds One:Explode 1")
makepoint(enemies[i][1],enemies[i][2],255,math.random(16,40),lasers[j][3],lasers[j][4])
addexplode5(enemies[i][1],enemies[i][2])
angle = math.random(0,360)
enemies[i][6]=-60
--enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
--enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
lasers[j][6]=0
enemies[i][7]=0
score = score + 20
enemieskilled=enemieskilled+1
saveLocalData("enemieskilled",enemieskilled)
resetenemy(i)
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)
end
end
end
end
end
end




--Boss
if enemies[i][5]==-1 then
enemies[i][3]=herox-xoff
enemies[i][4]=heroy-yoff

bossshoottime[i] = bossshoottime[i] - 1
if i/2==math.floor(i/2) then
if bossshoottime[i]<=0 then
h=0
for e=wave/5+1,enemyno do
if enemies[e][7]==wave then
else
h=e
end
end
if h>=enemyno then h=enemyno end
angle = math.random(0,360)
enemies[h][1]=enemies[i][1]
enemies[h][2]=enemies[i][2]
enemies[h][3]=herox-xoff
enemies[h][4]=heroy-yoff
if wave==5 then
enemies[h][5]=0
end
if wave==10 then
enemies[h][5]=math.random(0,1)
end
if wave==15 then
enemies[h][5]=math.random(0,2)
end
if wave>=20 then
enemies[h][5]=math.random(0,3)
end
if enemies[h][5]==1 then enemies[h][8]=5 end
if enemies[h][5]==2 then enemies[h][8]=2 end
if enemies[h][5]==3 then enemies[h][8]=10 end
enemies[h][6]=0
enemies[h][7]=wave
bossshoottime[i]=180
end
else
if bossshoottime[i]<=0 then
bossshoottime[i]=45
addbosslaser(i)
end
end
enemyr=math.atan2((enemies[i][4]-enemies[i][2]),(enemies[i][3]-enemies[i][1]))*180/math.pi
pushMatrix()
translate(enemies[i][1]+xoff,enemies[i][2]+yoff)
rotate(enemyr-90)
if i/2==math.floor(i/2) then
if enemies[i][8]>(wave) then
sprite("Project:Boss2",0,0,size*3)
else
sprite("Project:Boss2",0,0,size*2.95)
end
else
if enemies[i][8]>(wave) then
sprite("Project:Boss",0,0,size*3)
else
sprite("Project:Boss",0,0,size*2.95)
end
end
popMatrix()
if pause==0 and respawnwait<0 then
if math.abs(math.floor((enemies[i][1]+xoff)-herox))>WIDTH or math.abs(math.floor((enemies[i][2]+yoff)-heroy))>WIDTH then
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05
else
enemies[i][1]=enemies[i][1]+ math.cos(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/(wave*2))/1.5
enemies[i][2]=enemies[i][2]+ math.sin(enemyr/(180/math.pi))*size*0.05*((enemies[i][8]+1)/(wave*2))/1.5
if i/2==math.floor(i/2) then
addexplode6(enemies[i][1],enemies[i][2])
end
end
end
for j=1,laserno do
if lasers[j][6]==1 then
if math.abs(enemies[i][1]+xoff-lasers[j][1])<size and math.abs(enemies[i][2]+yoff-lasers[j][2])<size then
if enemies[i][8]>0 then
enemies[i][8]=enemies[i][8]-1
lasers[j][6]=0
score = score + 1
addexplode5(enemies[i][1],enemies[i][2])
sound(SOUND_HIT, 31238)
else
sound("Game Sounds One:Explode 1")
makepoint(enemies[i][1],enemies[i][2],255,math.random(16,40),lasers[j][3],lasers[j][4])
addexplode5(enemies[i][1],enemies[i][2])
angle = math.random(0,360)
enemies[i][6]=-60
--enemies[i][1]=herox+math.cos(angle)*(WIDTH)-xoff
--enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT)-yoff
lasers[j][6]=0
enemies[i][7]=0
score = score + 80
enemieskilled=enemieskilled+1
saveLocalData("enemieskilled",enemieskilled)
resetenemy(i)
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)
end
end
end
end
end
end


if math.abs(enemies[i][1]+xoff-herox)<size/1.5 and math.abs(enemies[i][2]+yoff-heroy)<size/1.5 and justdied<0 then
angle = math.random(0,360)
enemies[i][6]=-120
enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)-xoff
enemies[i][2]=heroy+math.sin(angle)*(0+HEIGHT*1.5)-yoff
health = health - 1
bossflashtime=0
if health==0 then
newmessage("FINAL LIFE",240)

end
addexplode1(herox-xoff,heroy-yoff)
numberoflasers=1
shootspeed=15
tofillup=50
pointsfilled=0
nextupgrade=1
backwardslaser=0
fastshoottime=0
multishoottime=0
respawnwait=60

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
else
if enemies[i][7]==wave then
enemies[i][6]=enemies[i][6]+1


end
end
end
end


function gameover()
tint(0, 0, 0, gameovertint)
gameovertint = gameovertint + 4
sprite("SpaceCute:Background",WIDTH/2,HEIGHT/2,WIDTH*2,HEIGHT*2)
--fontSize(size)

printword("GAMEOVER",-1,HEIGHT*2/3,size,size)

end


function GUI()
--if wave/5==math.floor(wave/5) or health==0 then
if bossflashtime<120 then
if bossflashtime==0 then redpulse=0 end
bossflashtime = bossflashtime + 1
redpulse = redpulse + 0.125
red=math.sin(redpulse)*25+25
if green<0 then green = green + 0.5 end
if green>0 then green = green - 0.5 end
else
if doneflashtime<120 then
if doneflashtime==0 then greenpulse=0 end
doneflashtime = doneflashtime + 1
greenpulse = greenpulse + 0.125
green=math.sin(greenpulse)*25+25
if red<0 then red = red + 0.5 end
if red>0 then red = red - 0.5 end
else
if red<0 then red = red + 0.5 end
if red>0 then red = red - 0.5 end
if green<0 then green = green + 0.5 end
if green>0 then green = green - 0.5 end
end
end
if dead==0 then
spriteMode(CENTER)
if pause==0 then

sprite("Project:Pause",WIDTH-size/2,HEIGHT-size/2,size,size)

else

sprite("Project:Quit",WIDTH-size/2,HEIGHT-size/2,size,size)


end

spriteMode(CENTER)
for k,touch in pairs(touches) do
if touch.x>WIDTH-size and touch.y >HEIGHT-size then
if pausepressx==touch.x and pausepressy==touch.y then else
if pause==0 then
pause=1
pausepressx=touch.x
pausepressy=touch.y
sound(SOUND_JUMP, 6432)

end
end
end
if pause==1 then
if touch.x>WIDTH-size and touch.y >HEIGHT-size then
if touch.state==BEGAN then
if pausepressx==touch.x and pausepressy==touch.y then else

dead=1
sound(SOUND_JUMP, 6432)


end
end
else
if touch.state==BEGAN then
if pausepressx==touch.x and pausepressy==touch.y then else
pause=0
pausepressx=touch.x
pausepressy=touch.y
sound(SOUND_JUMP, 6432)

end

end
end
end

end

if pause==1 then
printword("PAUSED",-1,HEIGHT/2,size,size)
printword("TAP ANYWHERE TO CONTINUE",-1,HEIGHT/2+size,size/2,size/2)
printword("TAP THE TOP RIGHT TO QUIT",-1,HEIGHT/2-size,size/2,size/2)
end
end
for i=1,health do
--sprite("Project:Hero",(size*i*1.5)/2.5,HEIGHT*9.75/10,size/2)
end

if dead==0 then
printword("HIGHSCORE:"..highscore,-1,HEIGHT*9.75/10,size/3,size/3)
h=size/2
printword("SCORE:"..score,-1,HEIGHT*9.75/10-h,size/3,size/3)


if wave/5==math.floor(wave/5) then
printword("BOSS WAVE",-1,HEIGHT*9.75/10-2*h,size/3,size/3)
else
printword("WAVE:"..wave,-1,HEIGHT*9.75/10-2*h,size/3,size/3)
end

if msg=="WAVE COMPLETE" then
enemiesleft=0
end
h=size/2
printword("ENEMIES LEFT:"..enemiesleft,10,HEIGHT*9.75/10,size/3,size/3)

pushMatrix()
translate(0,-HEIGHT/8+size/2)
strokeWidth(size/2)
lineCapMode(SQUARE)
stroke(255, 255, 255, 56)
--line(WIDTH/2-size*2,HEIGHT/8,WIDTH/2+size*2,HEIGHT/8)
stroke(0, 255, 247, 255)
line(WIDTH/2-size*2,HEIGHT/8,WIDTH/2-size*2+(size*4)*(pointsfilled/tofillup),HEIGHT/8)

pushMatrix()
translate(WIDTH/2,HEIGHT/8)
rotate(90)
sprite("Project:Bar",0,0,size,size*5.5)
popMatrix()

if backwardslaser==1 then
sprite("Project:Bomb",WIDTH/2+size*2.325,HEIGHT/8,size/2)
sprite("Project:Bomb",WIDTH/2-size*2.325,HEIGHT/8,size/2)
else
if nextupgrade==-1 then
sprite("Tyrian Remastered:Powerup 7",WIDTH/2+size*2.325,HEIGHT/8,size/2)
sprite("Tyrian Remastered:Powerup 7",WIDTH/2-size*2.325,HEIGHT/8,size/2)
end
if nextupgrade==1 then
sprite("Tyrian Remastered:Powerup 10",WIDTH/2+size*2.325,HEIGHT/8,size/2)
sprite("Tyrian Remastered:Powerup 10",WIDTH/2-size*2.325,HEIGHT/8,size/2)
end
end
popMatrix()
if bombno>0 then

sprite("Project:Bomb",WIDTH/2,HEIGHT*1/10,size*2,size*2)
printword("X"..bombno,WIDTH/2+size/1.8,HEIGHT*1/10-size/1.8,size/2,size/2)
end



for k,touch in pairs(touches) do
if touch.x>WIDTH/2-size and touch.x<WIDTH/2+size and touch.y<HEIGHT*1/10+size and touch.y>HEIGHT*1/10-size then
if touch.state==BEGAN and bombno>0 then
if pausepressx==touch.x and pausepressy==touch.y then else
pausepressx=touch.x
pausepressy=touch.y
if bombno>0 then
bombno = bombno - 1
addringexplode(herox-xoff,heroy-yoff)
justblewup=5
end
end
end
end
end
end


noTint()
if dead==1 then
deadtimer = deadtimer + 1
fontSize(math.floor(size/3))
fill(255,255,255,deadtimer*5)
printword("HIGHSCORE:"..highscore,-1,HEIGHT*5.75/10,size/3,size/3)
h=size/2
printword("SCORE:"..score,-1,HEIGHT*5.75/10-h,size/3,size/3)
printword("WAVE:"..wave,-1,HEIGHT*5.75/10-2*h,size/3,size/3)
for k,touch in pairs(touches) do
if touch.state==BEGAN and deadtimer >30 then
if pausepressx==touch.x and pausepressy==touch.y then else
saveLocalData("highscore",highscore)
saveLocalData("cw11b",highscore/3+1)
saveLocalData("cw12h",highscore/3+5)
saveLocalData("Liam","Sucks")
setup()
pausepressx=touch.x
pausepressy=touch.y
sound(SOUND_JUMP, 6432)
end
end
end
end

if play=="title" then
back()
deadtimer = deadtimer + 1
--words("ASTEROIDS",WIDTH/2,HEIGHT*2/3,size)
printword("GALAXIA WARS",-1,HEIGHT*2/3,size,size)
printword("HIGHSCORE:"..highscore.." POINTS",-1,HEIGHT*5.75/10,size/3,size/3)
h=size/2
printword("LONGEST STREAK:"..bestwave.." WAVES",-1,(HEIGHT*5.75/10)-h,size/3,size/3)
printword("ENEMIES KILLED:"..enemieskilled,-1,(HEIGHT*5.75/10)-h*2,size/3,size/3)
printword("BOSS WAVES DONE:"..bosswavesdone,-1,(HEIGHT*5.75/10)-h*3,size/3,size/3)
titleflash=titleflash+1
if titleflash>45 then
printword("TAP TO START",-1,(HEIGHT*4.5/10)-h*3,size/1.5,size/1.5)
end
if titleflash>90 then titleflash=0 end


for k,touch in pairs(touches) do
if touch.state==BEGAN and deadtimer >30 and (touch.x<WIDTH-size*1.5 or touch.y>size*1.5)then
if pausepressx==touch.x and pausepressy==touch.y then else
setup2()
play="game"
newmessage("WAVE "..wave,180)
pausepressx=touch.x
pausepressy=touch.y
sound(SOUND_JUMP, 6432)
end
end
end


end

end

function words2(t,x,y,s)
noTint()
fontSize(math.floor(s))

fill(0, 0, 0, gameovertint)
text(t,x+s/20,y-s/30)
fill(255, 255, 255, gameovertint)

text(t,x,y)
end

function words(t,x,y,s)
noTint()
fontSize(math.floor(s))

fill(0, 0, 0, 255)
text(t,x+s/20,y-s/30)
fill(255, 255, 255, 255)

text(t,x,y)
end


function hero()
--[[joy1x = joy1x - (joy1x-WIDTH*1.5/10)/5
joy1y = joy1y - (joy1y-HEIGHT*1.5/10)/5]]--

joy1x = joy1x - (joy1x-joy1startx)/5
joy1y = joy1y - (joy1y-joy1starty)/5

--[[joy2x = joy2x - (joy2x-WIDTH*8.5/10)/5
joy2y = joy2y - (joy2y-HEIGHT*1.5/10)/5]]--

joy2x = joy2x - (joy2x-joy2startx)/5
joy2y = joy2y - (joy2y-joy2starty)/5
shooting=0
moving=0
for k,touch in pairs(touches) do
if touch.x<WIDTH/2-size/2 and touch.y<HEIGHT*2/3 then
if touch.state==BEGAN then
joy1startx=touch.x
if joy1startx>WIDTH/2-size/2-size*1.5 then joy1startx=WIDTH/2-size/2-size*1.5 end
joy1starty=touch.y
end
if touch.state==ENDED then
joy1startx=WIDTH*1.5/10
joy1starty=HEIGHT*1.5/10
end


joy1x=touch.x
joy1y=touch.y
joy1xdif=(joy1x-joy1startx)
joy1ydif=(joy1y-joy1starty)
--[[joy1xdif=(joy1x-WIDTH*1.5/10)
joy1ydif=(joy1y-HEIGHT*1.5/10)]]--
joy1a=math.atan2(joy1ydif,joy1xdif)*180/math.pi
moving=1

joy1a=joy1a/(180/math.pi)

--[[if joy1x>WIDTH*1.5/10 +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 >0 then joy1x=WIDTH*1.5/10 + math.cos(joy1a)*size*1.5 end

if joy1x<WIDTH*1.5/10 +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 <0 then joy1x=WIDTH*1.5/10 +math.cos(joy1a)*size*1.5 end

if joy1y>HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 >0 then joy1y=HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5  end

if joy1y<HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 <0 then joy1y=HEIGHT*1.5/10 +math.sin(joy1a)*size*1.5  end]]--

if joy1x>joy1startx +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 >0 then joy1x=joy1startx + math.cos(joy1a)*size*1.5 end

if joy1x<joy1startx +math.cos(joy1a)*size*1.5 and math.cos(joy1a)*size*1.5 <0 then joy1x=joy1startx +math.cos(joy1a)*size*1.5 end

if joy1y>joy1starty +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 >0 then joy1y=joy1starty +math.sin(joy1a)*size*1.5  end

if joy1y<joy1starty +math.sin(joy1a)*size*1.5 and math.sin(joy1a)*size*1.5 <0 then joy1y=joy1starty +math.sin(joy1a)*size*1.5  end

--[[joy1xdif=(joy1x-WIDTH*1.5/10)
joy1ydif=(joy1y-HEIGHT*1.5/10)
joy1a=(joy1a*(180/math.pi))
joy1t=k
joy1xdif=(joy1x-WIDTH*1.5/10)
joy1ydif=(joy1y-HEIGHT*1.5/10)]]--
joy1xdif=(joy1x-joy1startx)
joy1ydif=(joy1y-joy1starty)
joy1a=(joy1a*(180/math.pi))
joy1t=k
joy1xdif=(joy1x-joy1startx)
joy1ydif=(joy1y-joy1starty)


else
if joy1t==k then
joy1x=joy1startx
joy1y=joy1starty
--[[
joy1x=WIDTH*1.5/10
joy1y=HEIGHT*1.5/10
]]--
end
end

if touch.x>WIDTH/2+size/2 and touch.y<HEIGHT*2/3 then
if touch.state==BEGAN then
joy2startx=touch.x
if joy2startx<WIDTH/2+size/2+size*1.5 then joy2startx=WIDTH/2+size/2+size*1.5 end
joy2starty=touch.y
end
if touch.state==ENDED then
joy2startx=WIDTH*8.5/10
joy2starty=HEIGHT*1.5/10
end
joy2x=touch.x
joy2y=touch.y

--[[joy2xdif=(joy2x-WIDTH*8.5/10)
joy2ydif=(joy2y-HEIGHT*1.5/10)]]--
joy2xdif=(joy2x-joy2startx)
joy2ydif=(joy2y-joy2starty)
joy2a=math.atan2(joy2ydif,joy2xdif)*180/math.pi
joy2a=joy2a/(180/math.pi)

--[[if joy2x>WIDTH*8.5/10 +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 >0 then joy2x=WIDTH*8.5/10 + math.cos(joy2a)*size*1.5 end

if joy2x<WIDTH*8.5/10 +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 <0 then joy2x=WIDTH*8.5/10 +math.cos(joy2a)*size*1.5 end

if joy2y>HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 >0 then joy2y=HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5  end

if joy2y<HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 <0 then joy2y=HEIGHT*1.5/10 +math.sin(joy2a)*size*1.5  end]]--

if joy2x>joy2startx +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 >0 then joy2x=joy2startx + math.cos(joy2a)*size*1.5 end

if joy2x<joy2startx +math.cos(joy2a)*size*1.5 and math.cos(joy2a)*size*1.5 <0 then joy2x=joy2startx +math.cos(joy2a)*size*1.5 end

if joy2y>joy2starty +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 >0 then joy2y=joy2starty +math.sin(joy2a)*size*1.5  end

if joy2y<joy2starty +math.sin(joy2a)*size*1.5 and math.sin(joy2a)*size*1.5 <0 then joy2y=joy2starty +math.sin(joy2a)*size*1.5  end

joy2t=k
--[[
joy2xdif=(joy2x-WIDTH*8.5/10)
joy2ydif=(joy2y-HEIGHT*1.5/10)]]--
joy2xdif=(joy2x-joy2startx)
joy2ydif=(joy2y-joy2starty)
joy2a=(joy2a*(180/math.pi))
joy2a=math.atan2(joy2ydif,joy2xdif)*180/math.pi
shooting=1
else
if joy2t==k then
--[[
joy2x=WIDTH*8.5/10
joy2y=HEIGHT*1.5/10
]]--
joy2x=joy2startx
joy2y=joy2starty
end
end
end

--[[joy1xdif=(joy1x-WIDTH*1.5/10)
joy1ydif=(joy1y-HEIGHT*1.5/10)]]--
joy1xdif=(joy1x-joy1startx)
joy1ydif=(joy1y-joy1starty)

if herox>WIDTH-size/2 then herox=WIDTH-size/2 end
if herox<size/2 then herox=size/2 end
if heroy>HEIGHT-size/2 then heroy=HEIGHT-size/2 end
if heroy<size/2 then heroy=size/2 end

if xoff>WIDTH-size/2 then xoff=WIDTH-size/2 end
if xoff<size/2 then xoff=size/2 end
if yoff>HEIGHT-size/2 then yoff=HEIGHT-size/2 end
if yoff<size/2 then yoff=size/2 end

if pause==0 and respawnwait<0 then
if herox>=size/2 and herox<=WIDTH-size/2 then
herox = herox + joy1xdif/20
xoff = xoff - joy1xdif/20
end
if heroy>=size/2 and heroy<=HEIGHT-size/2 then
heroy = heroy + joy1ydif/20
yoff = yoff - joy1ydif/20
end
end

if dead==0 then

if health==0 then
tailflickertime = tailflickertime + 1
if tailflickertime>tailflickertimer then
tailflickertime=0
tailflickertimer=math.random(5,30)
tailflicker=-tailflicker
end
else
tailflicker=1
end


if respawnwait<0 and heroflash==1 then
if tailflicker==1 then
if moving ==1 then
addexplode2(herox-math.cos(heror*(math.pi/180))*size/4-xoff,heroy-math.sin(heror*(math.pi/180))*size/4-yoff)
else
addexplode3(herox-math.cos(heror*(math.pi/180))*size/4-xoff,heroy-math.sin(heror*(math.pi/180))*size/4-yoff)
end
end
end
justdied = justdied - 1
if justdied/10 == math.floor(justdied/10) then
heroflash=-heroflash
end
if justdied<0 then heroflash=1 end
spriteMode(CENTER)
if respawnwait<0 then
if health>0 then
for i=1,health do
pushMatrix()

if i==1 then else
healthorbs[i]=healthorbs[1]-(math.pi*2/health)*(i-1)
end

translate(herox+math.cos(healthorbs[i])*size/1,heroy+math.sin(healthorbs[i])*size/1)


rotate(healthorbs[i]/(math.pi/180))
noTint()
sprite("Project:Hero",0,0,size/2)
popMatrix()
if pause==0 and i==1 then
healthorbs[i] = healthorbs[i] + 0.05 *(15/shootspeed)/2
end
if healthorbs[i]>360 then healthorbs[i]=0 end

end

end
pushMatrix()
translate(herox,heroy)
if pause==0 then
heror = heror + (joy1a-heror)/5
heror=joy1a
end
rotate(heror-90)
tint(255, 255, 255, 255*heroflash)

if health>0 then
sprite("Project:Hero",0,0,size*2)
else
sprite("Project:Hero",0,0,size*2)
end
popMatrix()


else
respawnwait = respawnwait - 0.5

if respawnwait<=5 then
herox=WIDTH/2
heroy=HEIGHT/2
xoff=WIDTH/2
yoff=HEIGHT/2
justdied=120
end
end

dolasers()

if pause==0 then
if shooting == 1 then
gunherodiff=heror-gunr
end
gunr = gunr + (joy2a-gunr)/5
gunr=joy2a
if shooting==0 then
gunr=heror-gunherodiff
end
end
if shooting==1 and respawnwait<0 then
addexplode4(herox-xoff,heroy-yoff)
end
if backwardslaser==1 then
pushMatrix()
translate(herox,heroy)
rotate(gunr)
if respawnwait<0 then
if health>1 then
sprite("Tyrian Remastered:Satellite",-size/8,0,size*0.75)
else
sprite("Tyrian Remastered:Satellite Destroyed",-size/8,0,size*0.75)
end
end
popMatrix()
end
for q=1,numberoflasers do
pushMatrix()
translate(herox,heroy)
shift=((numberoflasers*15)+15)
rotate(gunr-shift+(q*30)-180)
if respawnwait<0 then
if health>1 then
sprite("Tyrian Remastered:Satellite",0,0,size*0.75)
else
sprite("Tyrian Remastered:Satellite Destroyed",0,0,size*0.75)
end
end
popMatrix()
end
if numberoflasers==3 then
pushMatrix()
translate(herox,heroy)
shift=((1*15)+15)
rotate(gunr-shift+(1*30)-180)
if respawnwait<0 then
if health>1 then
sprite("Tyrian Remastered:Satellite",0,0,size*0.75)
else
sprite("Tyrian Remastered:Satellite Destroyed",0,0,size*0.75)
end
end
popMatrix()
end
end
tint(255, 255, 255, 50)
sprite("Project:Joy",joy1x,joy1y,size*2,size*2)
tint(255, 255, 255, 50)
sprite("Project:Joy",joy2x,joy2y,size*2,size*2)
noTint()
end




function dolasers()
if shooting==1 and respawnwait<0 then
ltimer = ltimer + 1
if ltimer>shootspeed then
ltimer=0
--[[if numberoflasers>1 then
multishoottime = multishoottime - 1
if multishoottime<0 then
numberoflasers = numberoflasers - 1
sound(SOUND_POWERUP, 40506)
multishoottime=100
end
end
if shootspeed<15 then
fastshoottime = fastshoottime - 1
if fastshoottime<0 then
shootspeed = shootspeed * 2
sound(SOUND_POWERUP, 40506)
fastshoottime=100
end
end]]--
makelaser()

sound(SOUND_HIT, 31252)
end
end
movelasers()
end

function movelasers()
for i=1,laserno do
if lasers[i][6]==1 then
if pause==0 then
lasers[i][1]=lasers[i][1]+lasers[i][3]
lasers[i][2]=lasers[i][2]+lasers[i][4]
end
pushMatrix()
translate(lasers[i][1],lasers[i][2])
rotate(math.atan2(lasers[i][4],lasers[i][3])*180/math.pi+90)
if lasers[i][5]==2 then
sprite("Tyrian Remastered:Bullet Streak",0,0,size/6,size)
end
if lasers[i][5]==1 then
sprite("Tyrian Remastered:Flame 1",0,0,size/6,size)
end
popMatrix()

if lasers[i][1]<-size or lasers[i][1]>WIDTH+size then
lasers[i][6]=0
end
if lasers[i][2]<-size or lasers[i][2]>HEIGHT+size then
lasers[i][6]=0
end
end
end
end

function makelaser()
for d=1,numberoflasers do
foundgoodlaserslot=0
for i=1,laserno do
if foundgoodlaserslot==0 then
if lasers[i][6]==0 then
lasers[i][6]=1
lasers[i][5]=1
foundgoodlaserslot=1
shift=((numberoflasers*15)+15)
lasers[i][3]=math.cos((gunr-shift+(d*30))*math.pi/180)*size/2.5
lasers[i][4]=math.sin((gunr-shift+(d*30))*math.pi/180)*size/2.5
lasers[i][1]=herox
lasers[i][2]=heroy
end
end
end
end
if backwardslaser==1 then
foundgoodlaserslot=0
for i=1,laserno do
if foundgoodlaserslot==0 then
if lasers[i][6]==0 then
lasers[i][6]=1
lasers[i][5]=1
foundgoodlaserslot=1
shift=((numberoflasers*15)+15)
lasers[i][3]=math.cos((gunr-180)*math.pi/180)*size/2.5
lasers[i][4]=math.sin((gunr-180)*math.pi/180)*size/2.5
lasers[i][1]=herox
lasers[i][2]=heroy
end
end
end
end
end


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


--Particles

parts={
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0}
}
partno=table.maxn(parts)

function samrand(x)
x=(math.random(100)*x)/100
return(x)
end


function initparts()
for i=1,partno do
parts[i][6]=0 --timer
parts[i][8]=0
end
end

function addparts(x,y,mx,my,g,t,c,z)
dying=1000
slot=1
for i = 1,partno do
if parts[i][6]<dying then
dying=parts[i][6]
slot=i
end
end
parts[slot][1]=x
parts[slot][2]=y
parts[slot][3]=mx
parts[slot][4]=my
parts[slot][5]=g
parts[slot][6]=t
parts[slot][7]=c
parts[slot][8]=z
end

function moveparts()
for i=1,partno do
if parts[i][6]>0 then
parts[i][1]=parts[i][1]+parts[i][3]
parts[i][2]=parts[i][2]+parts[i][4]
--parts[i][4]=parts[i][4]-parts[i][5]
parts[i][6]=parts[i][6]-1
end
end
end

function drawparts()
num=0
for i=1,partno do
if parts[i][6]>0 then
if parts[i][6]<32 then
a=parts[i][6]*8
else
a=255
end
--sprite("Cargo Bot:Smoke Particle")
gfx="Cargo Bot:Smoke Particle"
if parts[i][7]==1 then tint(255, 0, 0, a) s=8 end
if parts[i][7]==2 then tint(255, 255, 255, a) s=8 gfx="Cargo Bot:Smoke Particle" end
if parts[i][7]==3 then tint(255, 255, 255, a) s=8 gfx="Cargo Bot:Smoke Particle" end
if parts[i][7]==4 then tint(255, 132, 0, a/5) s=10 gfx="Cargo Bot:Smoke Particle" end
if parts[i][7]==5 then tint(255, 178, 0, a) s=6 end
if parts[i][7]==6 then tint(255, 45, 0, 128) s=10 gfx="Cargo Bot:Smoke Particle" end
if parts[i][7]==7 then tint(0, 246, 255, a) s=10 gfx="Cargo Bot:Smoke Particle" end
if parts[i][7]==8 then tint(255, 2, 0, a) s=10 gfx="Cargo Bot:Smoke Particle" end
if parts[i][7]==9 then tint(127, 127, 127, a) s=6 end
pushMatrix()
if parts[i][7]==8 then
translate(parts[i][1],parts[i][2])
if parts[i][8]==1 then else
rotate(parts[i][8]*5)
end
else
translate(parts[i][1]+xoff,parts[i][2]+yoff)
if parts[i][8]==1 then else
rotate(parts[i][8]*5)
end
end
sprite(gfx,0,0,size/s)
popMatrix()

num = num + 1
end
end
end

function addringexplode(x,y)
sound(SOUND_POWERUP, 31240)
for i=1, 45 do
i = i + 8
addparts(x,y,math.cos(i)*size/5,math.sin(i)*size/5,0.0,120,7,0)

end
end

function addringexplode2(x,y)
for i=1, 25 do
i = i + 15
addparts(x,y,math.cos(i)*size/10,math.sin(i)*size/10,0.0,60,7,0)
end
end

function addexplode1(x,y)
for i=1, 32 do
addparts(x,y,samrand(12)-6,samrand(12)-6,0.0,60,1,0)

end
end

function addexplode2(x,y)
for i=1, 4 do
t=heror+samrand(50)-25
addparts(x,y,-math.cos(t*(math.pi/180))*samrand(4),-math.sin(t*(math.pi/180))*samrand(4),0,30,2,0)

end
end

function addexplode3(x,y)
for i=1,1 do
t=heror+samrand(50)-25
addparts(x,y,-math.cos(t*(math.pi/180))*samrand(4),-math.sin(t*(math.pi/180))*samrand(4),0,30,2,0)

end
end

function addexplode4(x,y)
for i=1,1 do
t=gunr+samrand(60)-30
addparts(x,y,-math.cos(t*(math.pi/180)-90-45)*samrand(6),-math.sin(t*(math.pi/180)-90-45)*samrand(6),0,120,4,0)

end
end

function addexplode5(x,y)


for i=1, 32 do
addparts(x,y,samrand(6)-3,samrand(6)-3,0.0,30,5,0)

end


end

function addexplode9(x,y)


for i=1, 32 do
addparts(x,y,samrand(6)-3,samrand(6)-3,0.0,30,9,0)

end


end

function addexplode6(x,y)
for i=1, 1 do
addparts(x,y,-math.cos(enemyr*(math.pi/180))*samrand(4),-math.sin(enemyr*(math.pi/180))*samrand(4),0,30,6,0)

end
end

function addexplode7(x,y)
for i=1, 1 do
addparts(x+xoff,y+yoff,0,0,0,30,8,0)

end
end


function makepoint(x,y,t,n,c,s)
for p=1,n do
foundpoint=0
for i=1,pointno do
if foundpoint==0 then
if points[i][3]==0 then
foundpoint=1
points[i][1]=x+math.random(math.floor(-size/2),math.floor(size/2))
points[i][2]=y+math.random(math.floor(-size/2),math.floor(size/2))
points[i][3]=t+math.random(-30,30)
points[i][5]=(c/100)*math.random(11,25)/10
points[i][6]=(s/100)*math.random(11,25)/10
points[i][7]=math.random(1,400)
if points[i][7]==1 and health<3 then
points[i][7]=2
else
if points[i][7]==2 and bombno<3 then
points[i][7]=3
else
points[i][7]=1
end
end
end
end
end
end
end

function dopoints()
for i=1,pointno do
if points[i][3]>0 then
p=points[i][1]
q=points[i][2]
if pause==0 then
points[i][3]=points[i][3]-1
p = p+points[i][5]
q = q+points[i][6]
end
if points[i][7]==1 then
tint(0, 255, 247, points[i][3]*(math.sin(points[i][3]/15)+1.5))
if math.sin(points[i][3]/5)<0 then
sprite("Tyrian Remastered:Energy Orb 1",p+xoff,q+yoff,size/4)
else
sprite("Tyrian Remastered:Energy Orb 2",p+xoff,q+yoff,size/4)
end
if herox>p-size*2+xoff and herox<p+size*2+xoff and heroy>q-size*2+yoff and heroy<q+size*2 +yoff and respawnwait<0 then
p=p+(herox-xoff-p)/10
q=q+(heroy-yoff-q)/10
if herox>p-size+xoff and herox<p+size+xoff and heroy>q-size+yoff and heroy<q+size+yoff then
pointsfilled = pointsfilled + 1
score = score + 1
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)

end
sound(SOUND_PICKUP, 14378)

points[i][3]=0
if pointsfilled>=tofillup then
if pointsfilled>tofillup then pointsfilled=tofillup end

if maxupgrades==1 then
bombno = bombno + 1
points[i][3]=0
tofillup = tofillup * 2
pointsfilled=0
end

maxupgrades=1
if nextupgrade==-1 then
if shootspeed>3.75 then
shootspeed=shootspeed/2
pointsfilled=0
tofillup = tofillup * 2
nextupgrade=-nextupgrade
maxupgrades=0
addringexplode2(herox-xoff,heroy-yoff)
end
if shootspeed<3.7 then shootspeed=3.75 end
sound(SOUND_PICKUP, 14380)

else
if nextupgrade==1 then
if numberoflasers==3 then
backwardslaser=1
pointsfilled=0
tofillup = tofillup * 2
nextupgrade=-nextupgrade
maxupgrades=1
addringexplode2(herox-xoff,heroy-yoff)
end
if numberoflasers<3 then
numberoflasers = numberoflasers + 1
pointsfilled=0
tofillup = tofillup * 2
nextupgrade=-nextupgrade
maxupgrades=0
addringexplode2(herox-xoff,heroy-yoff)
end

--if numberoflasers>3 then numberoflasers=3 end
sound(SOUND_PICKUP, 14384)
points[i][3]=0
end

end

--[[  if filledup==0 and pointsfilled>=100 then
filledup=1
addringexplode2(WIDTH/2,HEIGHT*2/10)
sound(SOUND_POWERUP, 41631)
end]]--
end
end
end
end
if points[i][7]==2 then
tint(255, 255, 255, points[i][3]*2)
sprite("Project:Hero",p+xoff,q+yoff,size/2)
if herox>p-size*2+xoff and herox<p+size*2+xoff and heroy>q-size*2+yoff and heroy<q+size*2 +yoff and respawnwait<0 then
p=p+(herox-xoff-p)/10
q=q+(heroy-yoff-q)/10
if herox>p-size+xoff and herox<p+size+xoff and heroy>q-size+yoff and heroy<q+size+yoff then
health = health + 1
doneflashtime=0
score = score + 1
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)

end
sound(SOUND_PICKUP, 14378)

points[i][3]=0

end
end
end
if points[i][7]==3 then
tint(255, 255, 255, points[i][3]*2)
sprite("Project:Bomb",p+xoff,q+yoff,size/2)
if herox>p-size*2+xoff and herox<p+size*2+xoff and heroy>q-size*2+yoff and heroy<q+size*2 +yoff and respawnwait<0 then
p=p+(herox-xoff-p)/10
q=q+(heroy-yoff-q)/10
if herox>p-size+xoff and herox<p+size+xoff and heroy>q-size+yoff and heroy<q+size+yoff then
bombno = bombno + 1
score = score + 1
if score>highscore then
highscore=score
saveLocalData("cw10a",highscore/3)
saveLocalData("highscore",highscore)

end
sound(SOUND_PICKUP, 14378)

points[i][3]=0

end
end
end
points[i][1]=p
points[i][2]=q
end

end
end







function dowaves()
while noenemy+currentwave+9<=enemyno do
for i=1+noenemy,currentwave+9 +noenemy do
enemies[i][6]=math.random(-720,0)
enemies[i][7]=currentwave
noenemy = noenemy + 1
end
currentwave = currentwave + 1
end
end

function resetenemy(i)
enemies[i][7]=0
end

function checkwave()
nextwave=1
enemiesleft=0
for i=1,enemyno do
if enemies[i][7]==wave then
nextwave = 0
enemiesleft = enemiesleft + 1
end
end
if nextwave==1 then
if wave/5==math.floor(wave/5) then
bosswavesdone=bosswavesdone+1
saveLocalData("bosswavesdone",bosswavesdone)
end
nextwave=0
wave = wave + 1
newmessage("WAVE COMPLETE",180)
sound("A Hero's Quest:Defensive Cast 4")
if wave>1 then
-- doneflashtime=0
end
if wave>bestwave then
bestwave=wave-1
saveLocalData("bestwave",bestwave)

end
for i=1,5+(wave) do
if i>=enemyno then i=enemyno end
angle = math.random(0,360)
enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)+xoff
enemies[i][2]=heroy+math.sin(angle)*(HEIGHT*1.5)+yoff
enemies[i][3]=herox
enemies[i][4]=heroy
enemies[i][5]=0
enemies[i][6]=math.random(-720,-120)
enemies[i][7]=wave

if wave>5 then
if i>(5+(wave))*6/8 then
enemies[i][5]=1
enemies[i][8]=5
end
end
if wave>10 then
if i>(5+(wave))*4/8 then
enemies[i][5]=1
enemies[i][8]=5
end
if i>(5+(wave))*6/8 then
enemies[i][5]=2
enemies[i][8]=2
end
end
if wave>15 then
if i>(5+(wave))*2/8 then
enemies[i][5]=1
enemies[i][8]=5
end
if i>(5+(wave))*4/8 then
enemies[i][5]=2
enemies[i][8]=2
end
if i>(5+(wave))*6/8 then
enemies[i][5]=3
enemies[i][8]=10
end
end

end
if wave/5==math.floor(wave/5) then
for i=1,5+(wave) do
enemies[i][7]=0
end
for i=1,(wave/5) do
angle = math.random(0,360)
enemies[i][1]=herox+math.cos(angle)*(WIDTH*1.5)+xoff
enemies[i][2]=heroy+math.sin(angle)*(HEIGHT*1.5)+yoff
enemies[i][3]=herox
enemies[i][4]=heroy
enemies[i][5]=-1
enemies[i][6]=-i*60-120
enemies[i][7]=wave
enemies[i][8]=wave*2
end
end

end
end



