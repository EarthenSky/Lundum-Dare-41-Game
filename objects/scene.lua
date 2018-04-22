local Scene = {}

-- This function does the printing.
function blit()
    -- Print the three main horizontal lines on the screen.
    for x=1,CHAR_SCREEN_SIZE.x,1 do
        screen.setChar({x=x, y=1}, "—")
    end

    for x=1,CHAR_SCREEN_SIZE.x,1 do
        screen.setChar({x=x, y=13}, "—")
    end

    for x=1,CHAR_SCREEN_SIZE.x,1 do
        screen.setChar({x=x, y=16}, "—")
    end

    -- Print smaller horizontal lines.
    for x=1,5,1 do
        screen.setChar({x=x, y=5}, "—")
    end

    for x=1,5,1 do
        screen.setChar({x=x, y=9}, "—")
    end

    for x=28,29,1 do
        screen.setChar({x=x, y=5}, "—")
    end

    for x=28,29,1 do
        screen.setChar({x=x, y=9}, "—")
    end

    -- Print all the verticle lines.
    for y=2,12,1 do
        screen.setChar({x=6, y=y}, "|")
    end

    for y=2,12,1 do
        screen.setChar({x=27, y=y}, "|")
    end

    for y=14,15,1 do
        screen.setChar({x=7, y=y}, "|")
    end

    for y=14,15,1 do
        screen.setChar({x=14, y=y}, "|")
    end

    for y=14,15,1 do
        screen.setChar({x=21, y=y}, "|")
    end

    for y=2,12,1 do
        screen.setChar({x=30, y=y}, "|")
    end
end

-- Prints the inital "scene" values to the screen.
function Scene.init()
    blit()
end

return Scene
