local NextWaveButton = {}

-- Setup Constants
local TOP_ROW_TEXT = "START"
local MID_ROW_TEXT = "NEXT "
local BOT_ROW_TEXT = "ROUND"

local isActive = false

-- Blit the text values.
local function initBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        local char = TOP_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=10}, char)
    end

    for i=1, #MID_ROW_TEXT,1 do
        local char = MID_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=11}, char)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        local char = BOT_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=12}, char)
    end

    for i=1, #TOP_ROW_TEXT,1 do
        local char = TOP_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlightedColour({x=i, y=10}, 1)  -- Red
    end

    for i=1, #MID_ROW_TEXT,1 do
        local char = MID_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlightedColour({x=i, y=11}, 1)  -- Red
    end

    for i=1, #BOT_ROW_TEXT,1 do
        local char = BOT_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlightedColour({x=i, y=12}, 1)  -- Red
    end
end

-- This blits when the button becomes active.
local function activeBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        local char = TOP_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=10}, true)
    end

    for i=1, #MID_ROW_TEXT,1 do
        local char = MID_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=11}, true)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        local char = BOT_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=12}, true)
    end
end

-- This blits when the button becomes deactive.
local function deactiveBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=10}, false)
    end

    for i=1, #MID_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=11}, false)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=12}, false)
    end
end

function NextWaveButton.init()
    initBlit()
end

-- Returns if the char is being bought.
function NextWaveButton.isActive()
    return isActive
end

function NextWaveButton.setDeactive()
    isActive = false
    deactiveBlit()
end

-- Fires once, each time it is clicked.
local isClicked = false
function NextWaveButton.update()
    if love.mouse.isDown(1) == true and isClicked == false and love.mouse.getX() > 0 and love.mouse.getX() < ((FONT_SIZE+6)/1.85)*5 and love.mouse.getY() > (FONT_SIZE+6)/1.35*9 and love.mouse.getY() < (FONT_SIZE+6)/1.35*9 + ((FONT_SIZE+6)/1.35)*3 then
        isClicked = true

        -- Turn on and blit.
        if isActive == false then
            isActive = true
            activeBlit()

            ui.shortButton.setDeactive()
            ui.longButton.setDeactive()

            -- Call round start.
            waveManager.nextWaveStart()
        end
    elseif love.mouse.isDown(1) == false and isClicked == true then
        isClicked = false
    end
end

return NextWaveButton
