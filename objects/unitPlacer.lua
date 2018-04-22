local UnitPlacer = {}

local currentPos = {x=0, y=0}
local lastPos = {x=0, y=0}

local isStoppedPos = false
local hasLetGo = true

function UnitPlacer.update()
    -- If the mouse is inside the game window and the shortButton is pressed.
    if ui.shortButton.isActive() and love.mouse.getX() > (FONT_SIZE+6)/1.85*6 and love.mouse.getX() < (FONT_SIZE+6)/1.85*26 and love.mouse.getY() > (FONT_SIZE+6)/1.35 and love.mouse.getY() < (FONT_SIZE+6)/1.35*12 then
        -- Move the highlighted square around with the mouse.
        if isStoppedPos == false then
            if love.mouse.isDown(1) == false then
                hasLetGo = true
            end

            lastPos = currentPos
            currentPos = {
                x = 1 + tostring( math.floor((love.mouse.getX()) / ((FONT_SIZE+6)/1.85)) ),
                y = 1 + tostring( math.floor((love.mouse.getY()) / ((FONT_SIZE+6)/1.35)) )
            }

            if lastPos.x ~= 0 then
                screen.setHighlighted(lastPos, false)
            end

            screen.setHighlightedColour(currentPos, 4)  -- Orange
            screen.setHighlighted(currentPos, true)

            if love.mouse.isDown(1) == true and hasLetGo == true then
                validPos = true

                -- Loop each path pos.
                for k,v in pairs(ui.path) do
                    if v.x == currentPos.x and v.y == currentPos.y then
                        validPos = false
                        break  --Exit the for loop
                    end
                end

                -- Loop each unit pos.
                for k,v in pairs(unitManager.unitList) do
                    if v.m_pos.x == currentPos.x and v.m_pos.y == currentPos.y then
                        validPos = false
                        break  --Exit the for loop
                    end
                end

                if validPos == true then
                    isStoppedPos = true
                    hasLetGo = false

                    -- Assign the attack area.
                    if currentPos.x ~= 26 then
                        screen.setHighlightedColour({x=currentPos.x+1, y=currentPos.y}, 5)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x+1, y=currentPos.y}, true)
                    end

                    if currentPos.y ~= 12 then
                        screen.setHighlightedColour({x=currentPos.x, y=currentPos.y+1}, 5)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x, y=currentPos.y+1}, true)
                    end

                    if currentPos.x ~= 7 then
                        screen.setHighlightedColour({x=currentPos.x-1, y=currentPos.y}, 5)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x-1, y=currentPos.y}, true)
                    end

                    if currentPos.y ~= 2 then
                        screen.setHighlightedColour({x=currentPos.x, y=currentPos.y-1}, 5)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x, y=currentPos.y-1}, true)
                    end
                else
                    ui.setMessage("BAD   ", "SPACE ")
                end
            end
        else
            --Check if the game should start looking for the next click.
            if love.mouse.isDown(1) == false then
                hasLetGo = true
            end

            if love.mouse.isDown(1) == true and hasLetGo == true then

                -- Reset attack area highlights.
                screen.setHighlighted({x=currentPos.x+1, y=currentPos.y}, false)
                screen.setHighlighted({x=currentPos.x, y=currentPos.y+1}, false)
                screen.setHighlighted({x=currentPos.x-1, y=currentPos.y}, false)
                screen.setHighlighted({x=currentPos.x, y=currentPos.y-1}, false)

                currentPos = {
                    x = 1 + tostring( math.floor((love.mouse.getX()) / ((FONT_SIZE+6)/1.85)) ),
                    y = 1 + tostring( math.floor((love.mouse.getY()) / ((FONT_SIZE+6)/1.35)) )
                }

                screen.setHighlighted(lastPos, false)

                -- If mouse clicks the same tile again.
                if currentPos.x == lastPos.x and currentPos.y == lastPos.y then
                    -- Buy the char and add it to the char manager's list.
                    screen.setHighlighted(lastPos, true)
                    screen.setHighlighted(currentPos, false)

                    -- Add unit to the table and blit it.
                    table.insert(unitManager.unitList, unit:new(currentPos, 0))
                    unitManager.unitList[#unitManager.unitList]:initBlit()

                    -- Lose money.
                    ui.setMoney(ui.getMoney() - 110)

                    -- Make button noLonger active.
                    ui.shortButton.setDeactive()

                    currentPos = {x=0, y=0}
                    lastPos = {x=0, y=0}
                end

                -- Reset variables.
                isStoppedPos = false
                hasLetGo = false
            end
        end
    elseif ui.shortButton.isActive() then
        if isStoppedPos == false then
            -- Remove both pos and set them to zero.
            if lastPos.x ~= 0 then
                screen.setHighlighted({x=currentPos.x, y=currentPos.y}, false)
                screen.setHighlighted({x=lastPos.x, y=lastPos.y}, false)

                currentPos = {x=0, y=0}
                lastPos = {x=0, y=0}

                -- Reset variables.
                isStoppedPos = false
                hasLetGo = false
            end
        end
    elseif ui.longButton.isActive() and love.mouse.getX() > (FONT_SIZE+6)/1.85*6 and love.mouse.getX() < (FONT_SIZE+6)/1.85*26 and love.mouse.getY() > (FONT_SIZE+6)/1.35 and love.mouse.getY() < (FONT_SIZE+6)/1.35*12 then
        -- Move the highlighted square around with the mouse.
        if isStoppedPos == false then
            if love.mouse.isDown(1) == false then
                hasLetGo = true
            end

            lastPos = currentPos
            currentPos = {
                x = 1 + tostring( math.floor((love.mouse.getX()) / ((FONT_SIZE+6)/1.85)) ),
                y = 1 + tostring( math.floor((love.mouse.getY()) / ((FONT_SIZE+6)/1.35)) )
            }

            if lastPos.x ~= 0 then
                screen.setHighlighted(lastPos, false)
            end

            screen.setHighlightedColour(currentPos, 3)  -- Teal
            screen.setHighlighted(currentPos, true)

            if love.mouse.isDown(1) == true and hasLetGo == true then
                validPos = true

                -- Loop each path pos.
                for k,v in pairs(ui.path) do
                    if v.x == currentPos.x and v.y == currentPos.y then
                        validPos = false
                        break  --Exit the for loop
                    end
                end

                -- Loop each unit pos.
                for k,v in pairs(unitManager.unitList) do
                    if v.m_pos.x == currentPos.x and v.m_pos.y == currentPos.y then
                        validPos = false
                        break  --Exit the for loop
                    end
                end

                if validPos == true then
                    isStoppedPos = true
                    hasLetGo = false

                    -- Assign the attack area.
                    if currentPos.x ~= 26 then
                        screen.setHighlightedColour({x=currentPos.x+1, y=currentPos.y}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x+1, y=currentPos.y}, true)
                    end

                    if currentPos.y ~= 12 then
                        screen.setHighlightedColour({x=currentPos.x, y=currentPos.y+1}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x, y=currentPos.y+1}, true)
                    end

                    if currentPos.x ~= 7 then
                        screen.setHighlightedColour({x=currentPos.x-1, y=currentPos.y}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x-1, y=currentPos.y}, true)
                    end

                    if currentPos.y ~= 2 then
                        screen.setHighlightedColour({x=currentPos.x, y=currentPos.y-1}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x, y=currentPos.y-1}, true)
                    end

                    -- Assign the attack area size 2.
                    if currentPos.x < 25 then
                        screen.setHighlightedColour({x=currentPos.x+2, y=currentPos.y}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x+2, y=currentPos.y}, true)
                    end

                    if currentPos.y < 11 then
                        screen.setHighlightedColour({x=currentPos.x, y=currentPos.y+2}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x, y=currentPos.y+2}, true)
                    end

                    if currentPos.x > 8 then
                        screen.setHighlightedColour({x=currentPos.x-2, y=currentPos.y}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x-2, y=currentPos.y}, true)
                    end

                    if currentPos.y > 3 then
                        screen.setHighlightedColour({x=currentPos.x, y=currentPos.y-2}, 6)  -- Dark Orange
                        screen.setHighlighted({x=currentPos.x, y=currentPos.y-2}, true)
                    end
                else
                    ui.setMessage("BAD   ", "SPACE ")
                end
            end
        else
            --Check if the game should start looking for the next click.
            if love.mouse.isDown(1) == false then
                hasLetGo = true
            end

            if love.mouse.isDown(1) == true and hasLetGo == true then
                -- Reset attack area highlights.
                screen.setHighlighted({x=currentPos.x+1, y=currentPos.y}, false)
                screen.setHighlighted({x=currentPos.x, y=currentPos.y+1}, false)
                screen.setHighlighted({x=currentPos.x-1, y=currentPos.y}, false)
                screen.setHighlighted({x=currentPos.x, y=currentPos.y-1}, false)

                if currentPos.x ~= 7 then
                    screen.setHighlighted({x=currentPos.x-2, y=currentPos.y}, false)
                end

                screen.setHighlighted({x=currentPos.x+2, y=currentPos.y}, false)
                screen.setHighlighted({x=currentPos.x, y=currentPos.y+2}, false)
                screen.setHighlighted({x=currentPos.x, y=currentPos.y-2}, false)

                currentPos = {
                    x = 1 + tostring( math.floor((love.mouse.getX()) / ((FONT_SIZE+6)/1.85)) ),
                    y = 1 + tostring( math.floor((love.mouse.getY()) / ((FONT_SIZE+6)/1.35)) )
                }

                screen.setHighlighted(lastPos, false)

                -- If mouse clicks the same tile again.
                if currentPos.x == lastPos.x and currentPos.y == lastPos.y then
                    -- Buy the char and add it to the char manager's list.
                    screen.setHighlighted(lastPos, true)
                    screen.setHighlighted(currentPos, false)

                    -- Add unit to the table and blit it.
                    table.insert(unitManager.unitList, unit:new(currentPos, 1))
                    unitManager.unitList[#unitManager.unitList]:initBlit()

                    -- Lose money.
                    ui.setMoney(ui.getMoney() - 140)

                    -- Make button noLonger active.
                    ui.longButton.setDeactive()

                    currentPos = {x=0, y=0}
                    lastPos = {x=0, y=0}
                end

                -- Reset variables.
                isStoppedPos = false
                hasLetGo = false
            end
        end
    elseif ui.longButton.isActive() then
        if isStoppedPos == false then
            -- Remove both pos and set them to zero.
            if lastPos.x ~= 0 then
                screen.setHighlighted({x=currentPos.x, y=currentPos.y}, false)
                screen.setHighlighted({x=lastPos.x, y=lastPos.y}, false)

                currentPos = {x=0, y=0}
                lastPos = {x=0, y=0}

                -- Reset variables.
                isStoppedPos = false
                hasLetGo = false
            end
        end
    end
end

function UnitPlacer.clear()
    -- Remove both pos and set them to zero.
    if lastPos.x ~= 0 then
        -- Reset attack area highlights.
        screen.setHighlighted({x=currentPos.x+1, y=currentPos.y}, false)
        screen.setHighlighted({x=currentPos.x, y=currentPos.y+1}, false)
        screen.setHighlighted({x=currentPos.x-1, y=currentPos.y}, false)
        screen.setHighlighted({x=currentPos.x, y=currentPos.y-1}, false)

        screen.setHighlighted({x=currentPos.x+2, y=currentPos.y}, false)
        screen.setHighlighted({x=currentPos.x, y=currentPos.y+2}, false)
        screen.setHighlighted({x=currentPos.x-2, y=currentPos.y}, false)
        screen.setHighlighted({x=currentPos.x, y=currentPos.y-2}, false)

        screen.setHighlighted({x=currentPos.x, y=currentPos.y}, false)
        screen.setHighlighted({x=lastPos.x, y=lastPos.y}, false)

        currentPos = {x=0, y=0}
        lastPos = {x=0, y=0}

        -- Reset variables.
        isStoppedPos = false
        hasLetGo = false
    end
end

return UnitPlacer
