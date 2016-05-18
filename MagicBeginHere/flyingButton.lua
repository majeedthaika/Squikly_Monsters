local flyTimeX = 500
local flyTimeY = 500

local xEasing = easing.linear
local yEasing = easing.linear
--local xEasing = easing.linear
--local yEasing = easing.inExpo

mb.touch = function( self, event )
    if(event.phase == "ended") then
        
        -- Use second button, not first or this compare won't work
        local fly2 = flyButtons[2]
        print( mb.x, fly2.x, fly2.x0, fly2.x1  )        

        -- In closed position?
        if( fly2.x == fly2.x0 ) then
            print("Closed")

            -- Fly out to open position
            for i = 1, #flyButtons do
                local button = flyButtons[i]
                transition.to( button, { x = button.x1, time = flyTimeX, 
                                         transition =  xEasing } )
                transition.to( button, { y = button.y1, time = flyTimeY, 
                                         transition =  tEasing  } )
            end

        -- Nope, in open position
        else
            print("Open")
            -- Fly in to closed position
            for i = 1, #flyButtons do
                local button = flyButtons[i]
                transition.to( button, { x = button.x0, time = flyTimeX, 
                                         transition =  xEasing  } )
                transition.to( button, { y = button.y0, time = flyTimeY, 
                                         transition =  yEasing  } )
            end
        end
    end
    return true
end

mb:addEventListener( "touch", mb ) 