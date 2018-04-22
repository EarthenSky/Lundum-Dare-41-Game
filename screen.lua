local Screen = {}

local charMatrix = {}  -- Char
-- local colourMatrix = {}  -- Don't need.
local highlightMatrix = {}  -- Boolean.
local highlightColourMatrix = {}  -- 0 is white, 1 is red, 2 is blue, 3 is teal...


-- Inits the screen's matrix of char's.
function Screen.init()
    for y=1,CHAR_SCREEN_SIZE.y+1,1 do

        local charRow = {}
        local highlightRow = {}
        local highlightColourRow = {}
        for x=1,CHAR_SCREEN_SIZE.x+1,1 do
            charRow[x] = ' '
            highlightRow[x] = false
            highlightColourRow[x] = 3
        end

        charMatrix[y] = charRow
        highlightMatrix[y] = highlightRow
        highlightColourMatrix[y] = highlightColourRow
    end
end

-- Sets the char's value at pos.
function Screen.setChar(pos, char)
    charMatrix[pos.y][pos.x] = char
end

-- Sets if the set pixel-char is background highlighted.
function Screen.setHighlighted(pos, bool)
    if pos.x > 0 and pos.y > 0 and pos.x < CHAR_SCREEN_SIZE.x and pos.y < CHAR_SCREEN_SIZE.y then
        highlightMatrix[pos.y][pos.x] = bool
    end
end

-- Sets the char's highlight colour.
function Screen.setHighlightedColour(pos, colourVal)
    highlightColourMatrix[pos.y][pos.x] = colourVal
end

function Screen.draw()
    -- Draw all chars + highlights to the screen.
    for y=1,CHAR_SCREEN_SIZE.y,1 do
        for x=1,CHAR_SCREEN_SIZE.x,1 do
            drawPos = {x=((x-1)*(FONT_SIZE+6)/1.85) + 3, y=((y-1)*(FONT_SIZE+6)/1.35) - 8}

            -- Draw the highlight.
            if highlightMatrix[y][x] == true then
                if highlightColourMatrix[y][x] == 0 then
                    love.graphics.setColor(250, 250, 250, 175)  -- White
                elseif highlightColourMatrix[y][x] == 1 then
                    love.graphics.setColor(250, 70, 50, 225)  -- Red
                elseif highlightColourMatrix[y][x] == 2 then
                    love.graphics.setColor(0, 0, 250, 175)  -- Blue
                elseif highlightColourMatrix[y][x] == 3 then
                    love.graphics.setColor(28, 237, 237, 195)  -- Teal
                elseif highlightColourMatrix[y][x] == 4 then
                    love.graphics.setColor(255, 153, 0, 219)  -- Orange
                elseif highlightColourMatrix[y][x] == 5 then
                    love.graphics.setColor(220, 95, 30, 205)  -- Dark Orange
                elseif highlightColourMatrix[y][x] == 6 then
                    love.graphics.setColor(40, 110, 187, 210)  -- Dark Teal / Blue
                end

                love.graphics.rectangle("fill", drawPos.x-1, drawPos.y+10, (FONT_SIZE+6)/1.85, (FONT_SIZE+6)/1.35)
            end

            -- Draw the char. (white)
            love.graphics.setColor(250, 250, 250, 255)
            love.graphics.print(charMatrix[y][x], drawPos.x, drawPos.y)
        end
    end
end

return Screen
