local LongButton = {}

-- Setup Constants
local TOP_ROW_TEXT = "LONG "
local MID_ROW_TEXT = "RANGE"
local BOT_ROW_TEXT = "$140$"

local isActive = false

-- Blit the text values.
local function initBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        local char = TOP_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=6}, char)
    end

    for i=1, #MID_ROW_TEXT,1 do
        local char = MID_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=7}, char)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        local char = BOT_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=8}, char)
    end
end

-- This blits when the button becomes active.
local function activeBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        local char = TOP_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=6}, true)
    end

    for i=1, #MID_ROW_TEXT,1 do
        local char = MID_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=7}, true)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        local char = BOT_ROW_TEXT:sub(i,i)  -- Get char at place value.
        screen.setHighlighted({x=i, y=8}, true)
    end
end

-- This blits when the button becomes deactive.
local function deactiveBlit()
    for i=1, #TOP_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=6}, false)
    end

    for i=1, #MID_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=7}, false)
    end

    for i=1, #BOT_ROW_TEXT,1 do
        screen.setHighlighted({x=i, y=8}, false)
    end
end

function LongButton.init()
    initBlit()
end

-- Returns if the char is being bought.
function LongButton.isActive()
    return isActive
end

function LongButton.setDeactive()
    isActive = false
    deactiveBlit()
    unitPlacer.clear()
end

-- Fires once, each time it is clicked.
local isClicked = false
function LongButton.update()
    if love.mouse.isDown(1) == true and isClicked == false and love.mouse.getX() > 0 and love.mouse.getX() < ((FONT_SIZE+6)/1.85)*5 and love.mouse.getY() > (FONT_SIZE+6)/1.35*5 and love.mouse.getY() < (FONT_SIZE+6)/1.35*5 + ((FONT_SIZE+6)/1.35)*3 then
        isClicked = true

        -- Toggle the activeness and blit.
        if ui.nextWaveButton.isActive() == false then
            if isActive == false and ui.getMoney() >= 140 then
                isActive = true
                activeBlit()
                ui.shortButton.setDeactive()
            elseif isActive == false and ui.getMoney() < 140 then
                ui.setMessage("NEED  ", "MONEY ")
            else
                isActive = false
                deactiveBlit()
                unitPlacer.clear()
            end
        end
    elseif love.mouse.isDown(1) == false and isClicked == true then
        isClicked = false
    end
end

return LongButton
