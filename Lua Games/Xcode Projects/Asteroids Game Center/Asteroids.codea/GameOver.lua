function gameover()
    tint(0, 0, 0, gameovertint)
    gameovertint = gameovertint + 4
    sprite("SpaceCute:Background",WIDTH/2,HEIGHT/2,WIDTH*2,HEIGHT*2)
    --fontSize(size)
    
    printword("GAMEOVER",-1,HEIGHT*2/3,size,size)
    
end
