--[[if readLocalData("harder")==nil or forcereset==1 then
        saveLocalData("harder",800)
    end
    harder = readLocalData("harder"]]--

--[[
levelstat={
    {25,0,0,0,50,0,"NICE AND SIMPLE!",0,  300,0},
    {50,0,0,0,50,0,"TWICE AS MANY!",0,360,0},
    {100,0,0,0,50,0,"CLOCKS WILL HELP",0,625,4},
    {125,2,0,0,50,0,"AVOID THE MUSHROOMS",0,840,4},
    {150,0,0,0,50,6,"COLLECT THE LETTERS!",6,930,0},
    {200,6,0,0,50,6,"MUSHROOMS AND LETTERS!",5,980,0},

    {250,8,0,0,50,4,"CLOCKS ARE BACK!",10,1350,4},
    {300,0,1,0,50,0,"NOT AS FLUFFY AS YOU THINK!",0,2080,4},
    {350,2,2,0,50,4,"SHEEP AND MUSHROOMS!",10,2350,4},
    {400,0,0,2,50,4,"THINGS ARE GETTING NASTY!",10,1925,4},
    {450,6,0,3,50,4,"MUSHROOMS AND BOMBS!",10,1950,4},
    {500,0,3,3,50,4,"BOMBS AND SHEEP!",10,2950,4},

    {550,4,2,2,50,4,"EVERYTHING AT ONCE!",10,1650,4},
    {300,0,0,15,50,0,"MINE FIELD!",0,1600,3},
    {1000,15,15,15,50,8,"MAYHEM!",4,4000,1},
    {450,15,0,0,50,15,"BE ACCURATE!",3,2200,0},
    {350,4,4,4,50,3,"QUICK REACTIONS",3,1250,0},
    {2000,2,2,2,50,8,"[ [ EPIC FINALE [ [",4,9350,1},
    {2000,2,2,2,50,8,"BUG FIX",4,9350,1}
    }

]]--

levelstat={
    {25,0,0,0,50,0,"NICE AND SIMPLE!",0,  260,0},
    {50,0,0,0,50,0,"TWICE AS MANY!",0,260,0},
    {100,0,0,0,50,0,"CLOCKS WILL HELP",0,550,4},
    {125,2,0,0,50,0,"AVOID THE MUSHROOMS",0,650,4},
    {150,0,0,0,50,6,"COLLECT THE LETTERS!",6,700,0},
    {200,6,0,0,50,6,"MUSHROOMS AND LETTERS!",5,940,0},

    {250,8,0,0,50,4,"CLOCKS ARE BACK!",10,1300,4},
    {300,0,1,0,50,0,"NOT AS FLUFFY AS YOU THINK!",0,1500,4},
    {350,2,2,0,50,4,"SHEEP AND MUSHROOMS!",10,1700,4},
    {400,0,0,2,50,4,"THINGS ARE GETTING NASTY!",10,1925,4},
    {450,6,0,3,50,4,"MUSHROOMS AND BOMBS!",10,1950,4},
    {500,0,3,3,50,4,"BOMBS AND SHEEP!",10,2450,4},

    {550,4,2,2,50,4,"EVERYTHING AT ONCE!",10,1650,4},
    {300,0,0,15,50,0,"MINE FIELD!",0,1400,3},
    {1000,15,15,15,50,8,"MAYHEM!",4,4000,1},
    {450,15,0,0,50,15,"TIMING IS EVERYTHING",3,1750,0},
    {350,4,4,4,50,3,"QUICK REACTIONS",3,1250,0},
    {2000,2,2,2,50,8,"[ [ EPIC FINALE [ [",4,9350,1},
    {2000,2,2,2,50,8,"BUG FIX",4,9350,1}
    }

function setlevel()
    levelno=18
end

function loadleveldata()
    for i=1,levelno do
        leveldata[i].score=math.floor(readLocalData("score"..i))
        leveldata[i].stars=math.floor(readLocalData("stars"..i))
      --  print (leveldata[i].score)
      --  print (leveldata[i].stars)
    end
end

function saveleveldata()
    for i=1,levelno do
        saveLocalData("score"..i,leveldata[i].score)
        saveLocalData("stars"..i,leveldata[i].stars)
    end
end

function initlevel()
    leveldata={}
    for i=1,levelno do
        leveldata[i]={score=math.floor(0),stars=math.floor(0)}
    end 
end
