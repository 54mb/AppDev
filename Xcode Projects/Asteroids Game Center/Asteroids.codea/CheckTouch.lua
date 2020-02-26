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