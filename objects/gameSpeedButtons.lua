local GameSpeedButtons = {}

local SPEED_ONE = "1x"
local SPEED_TWO = "2x"
local SPEED_THREE = "4x"

local activeButton = 1  -- 0 == 1x, 1 == 2x, and 2 == 4x.

-- Blit the text values.
local function initBlit()
    for i=28, #SPEED_ONE+27,1 do
        local char = SPEED_ONE:sub(i-27,i-27)  -- Get char at place value.
        screen.setChar({x=i, y=3}, char)
    end

    for i=28, #SPEED_TWO+27,1 do
        local char = SPEED_TWO:sub(i-27,i-27)  -- Get char at place value.
        screen.setChar({x=i, y=7}, char)
    end

    for i=28, #SPEED_THREE+27,1 do
        local char = SPEED_THREE:sub(i-27,i-27)  -- Get char at place value.
        screen.setChar({x=i, y=11}, char)
    end

    for i=28, #SPEED_ONE+27,1 do
        screen.setHighlightedColour({x=i, y=2}, 7)
        screen.setHighlightedColour({x=i, y=3}, 7)
        screen.setHighlightedColour({x=i, y=4}, 7)
    end

    for i=28, #SPEED_TWO+27,1 do
        screen.setHighlightedColour({x=i, y=6}, 7)
        screen.setHighlightedColour({x=i, y=7}, 7)
        screen.setHighlightedColour({x=i, y=8}, 7)

        screen.setHighlighted({x=i, y=6}, true)
        screen.setHighlighted({x=i, y=7}, true)
        screen.setHighlighted({x=i, y=8}, true)
    end

    for i=28, #SPEED_THREE+27,1 do
        screen.setHighlightedColour({x=i, y=10}, 7)
        screen.setHighlightedColour({x=i, y=11}, 7)
        screen.setHighlightedColour({x=i, y=12}, 7)
    end
end

-- Check buttons pressed.
function GameSpeedButtons.init()
    activeButton = 1
    TPS = 8
    initBlit()
end

-- Check buttons pressed.
function changeButtons()
    if activeButton == 0 and TPS ~= 4 then
        TPS = 4

        for i=28, #SPEED_ONE+27,1 do
            screen.setHighlighted({x=i, y=2}, true)
            screen.setHighlighted({x=i, y=3}, true)
            screen.setHighlighted({x=i, y=4}, true)
        end

        for i=28, #SPEED_TWO+27,1 do
            screen.setHighlighted({x=i, y=6}, false)
            screen.setHighlighted({x=i, y=7}, false)
            screen.setHighlighted({x=i, y=8}, false)
        end

        for i=28, #SPEED_THREE+27,1 do
            screen.setHighlighted({x=i, y=10}, false)
            screen.setHighlighted({x=i, y=11}, false)
            screen.setHighlighted({x=i, y=12}, false)
        end

    elseif activeButton == 1 and TPS ~= 8 then
        TPS = 8

        for i=28, #SPEED_ONE+27,1 do
            screen.setHighlighted({x=i, y=2}, false)
            screen.setHighlighted({x=i, y=3}, false)
            screen.setHighlighted({x=i, y=4}, false)
        end

        for i=28, #SPEED_TWO+27,1 do
            screen.setHighlighted({x=i, y=6}, true)
            screen.setHighlighted({x=i, y=7}, true)
            screen.setHighlighted({x=i, y=8}, true)
        end

        for i=28, #SPEED_THREE+27,1 do
            screen.setHighlighted({x=i, y=10}, false)
            screen.setHighlighted({x=i, y=11}, false)
            screen.setHighlighted({x=i, y=12}, false)
        end
    elseif activeButton == 2 and TPS ~= 16 then
        TPS = 16

        for i=28, #SPEED_ONE+27,1 do
            screen.setHighlighted({x=i, y=2}, false)
            screen.setHighlighted({x=i, y=3}, false)
            screen.setHighlighted({x=i, y=4}, false)
        end

        for i=28, #SPEED_TWO+27,1 do
            screen.setHighlighted({x=i, y=6}, false)
            screen.setHighlighted({x=i, y=7}, false)
            screen.setHighlighted({x=i, y=8}, false)
        end

        for i=28, #SPEED_THREE+27,1 do
            screen.setHighlighted({x=i, y=10}, true)
            screen.setHighlighted({x=i, y=11}, true)
            screen.setHighlighted({x=i, y=12}, true)
        end
    end
end

-- Fires once, each time it is clicked.
local isClicked = false
function GameSpeedButtons.update()
    if love.mouse.isDown(1) == true and isClicked == false and love.mouse.getX() > ((FONT_SIZE+6)/1.8)*27 and love.mouse.getX() < ((FONT_SIZE+6)/1.8)*29 and love.mouse.getY() > (FONT_SIZE+6)/1.35 and love.mouse.getY() < ((FONT_SIZE+6)/1.35)*4 then
        isClicked = true

        -- Toggle the activeness and blit.
        activeButton = 0
    elseif love.mouse.isDown(1) == false and isClicked == true then
        isClicked = false
    elseif love.mouse.isDown(1) == true and isClicked == false and love.mouse.getX() > ((FONT_SIZE+6)/1.8)*27 and love.mouse.getX() < ((FONT_SIZE+6)/1.8)*29 and love.mouse.getY() > (FONT_SIZE+6)/1.35*5 and love.mouse.getY() < ((FONT_SIZE+6)/1.35)*8 then
        isClicked = true

        -- Toggle the activeness and blit.
        activeButton = 1
    elseif love.mouse.isDown(1) == false and isClicked == true then
        isClicked = false
    elseif love.mouse.isDown(1) == true and isClicked == false and love.mouse.getX() > ((FONT_SIZE+6)/1.8)*27 and love.mouse.getX() < ((FONT_SIZE+6)/1.8)*29 and love.mouse.getY() > (FONT_SIZE+6)/1.35*9 and love.mouse.getY() < ((FONT_SIZE+6)/1.35)*12 then
        isClicked = true

        -- Toggle the activeness and blit.
        activeButton = 2
    elseif love.mouse.isDown(1) == false and isClicked == true then
        isClicked = false
    end

    changeButtons()
end



return GameSpeedButtons
