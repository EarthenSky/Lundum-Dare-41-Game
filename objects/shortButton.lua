local ShortButton = {}

-- Setup Constants
local TOP_ROW_TEXT = "SHORT"
local MID_ROW_TEXT = "RANGE"
local BOT_ROW_TEXT = "$100$"

local isActive = false

-- Blit the text values.
local function initBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        local char = TOP_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=2}, char)
    end

    for i=1, #MID_ROW_TEXT,1 do
        local char = MID_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=3}, char)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        local char = BOT_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=4}, char)
    end
end

-- This blits when the button becomes active.
local function activeBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        local char = TOP_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=2}, true)
    end

    for i=1, #MID_ROW_TEXT,1 do
        local char = MID_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=3}, true)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        local char = BOT_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=4}, true)
    end
end

-- This blits when the button becomes deactive.
local function deactiveBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=2}, false)
    end

    for i=1, #MID_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=3}, false)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=4}, false)
    end
end

function ShortButton.init()
    initBlit()
end

-- Fires once, each time it is clicked.
local isClicked = false
function ShortButton.update()
    if love.mouse.isDown(1) == true and isClicked == false and love.mouse.getX() > 0 and love.mouse.getX() < ((FONT_SIZE+6)/1.85)*5 and love.mouse.getY() > (FONT_SIZE+6)/1.35 and love.mouse.getY() < (FONT_SIZE+6)/1.35 + ((FONT_SIZE+6)/1.35)*3 then
        isClicked = true

        -- Toggle the blit.
        isActive = not isActive
        if isActive == true then
            activeBlit()
        else
            deactiveBlit()
        end
    elseif love.mouse.isDown(1) == false and isClicked == true then
        isClicked = false
    end
end

return ShortButton
