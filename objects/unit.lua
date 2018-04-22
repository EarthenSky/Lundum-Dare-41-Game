Unit = {}

-- pos is {x, y}, type is 0 or 1.  0 is short 1 is long.
function Unit:new(pos, type)
    -- Add member variables here.
    selfObj = {
        m_pos = {x=pos.x, y=pos.y},
        m_type = type,
        currentTimeOut = 0,
        m_lit = false
    }

    -- Init private variables here... ?

    -- Make this a class.
    self.__index = self
    return setmetatable(selfObj, self)
end

-- This initialy places the char
function Unit:initBlit()
    if self.m_type == 0 then
        screen.setChar(self.m_pos, "S")
    elseif self.m_type == 1 then
        screen.setChar(self.m_pos, "L")
    end
end

function Unit:highlight(playerPos)
    if self.m_type == 0 then
        if playerPos.x + 1 <= 26 then
            screen.setHighlighted({x=playerPos.x + 1, y=playerPos.y}, true)
            screen.setHighlightedColour({x=playerPos.x + 1, y=playerPos.y}, 5)
        end

        if playerPos.x ~= 7 then
            screen.setHighlighted({x=playerPos.x - 1, y=playerPos.y}, true)
            screen.setHighlightedColour({x=playerPos.x - 1, y=playerPos.y}, 5)
        end

        if playerPos.y + 1 ~= 13 then
            screen.setHighlighted({x=playerPos.x, y=playerPos.y + 1}, true)
            screen.setHighlightedColour({x=playerPos.x, y=playerPos.y + 1}, 5)
        end

        if playerPos.y - 1 ~= 1 then
            screen.setHighlighted({x=playerPos.x, y=playerPos.y - 1}, true)
            screen.setHighlightedColour({x=playerPos.x, y=playerPos.y - 1}, 5)
        end
    elseif self.m_type == 1 then
        if playerPos.x + 1 <= 26 then
            screen.setHighlighted({x=playerPos.x + 1, y=playerPos.y}, true)
            screen.setHighlightedColour({x=playerPos.x + 1, y=playerPos.y}, 6)
        end
        if playerPos.x ~= 7 then
            screen.setHighlighted({x=playerPos.x - 1, y=playerPos.y}, true)
            screen.setHighlightedColour({x=playerPos.x - 1, y=playerPos.y}, 6)
        end

        if playerPos.y + 1 ~= 13 then
            screen.setHighlighted({x=playerPos.x, y=playerPos.y + 1}, true)
            screen.setHighlightedColour({x=playerPos.x, y=playerPos.y + 1}, 6)
        end

        if playerPos.y - 1 ~= 1 then
            screen.setHighlighted({x=playerPos.x, y=playerPos.y - 1}, true)
            screen.setHighlightedColour({x=playerPos.x, y=playerPos.y - 1}, 6)
        end

        if playerPos.x + 2 < 27 then
            screen.setHighlighted({x=playerPos.x + 2, y=playerPos.y}, true)
            screen.setHighlightedColour({x=playerPos.x + 2, y=playerPos.y}, 6)
        end

        if playerPos.x - 2 > 6 then
            screen.setHighlighted({x=playerPos.x - 2, y=playerPos.y}, true)
            screen.setHighlightedColour({x=playerPos.x - 2, y=playerPos.y}, 6)
        end

        if playerPos.y + 2 < 13 then
            screen.setHighlighted({x=playerPos.x, y=playerPos.y + 2}, true)
            screen.setHighlightedColour({x=playerPos.x, y=playerPos.y + 2}, 6)
        end

        if playerPos.y - 2 > 1 then
            screen.setHighlighted({x=playerPos.x, y=playerPos.y - 2}, true)
            screen.setHighlightedColour({x=playerPos.x, y=playerPos.y - 2}, 6)
        end
    end

    self.m_lit = true
end

function Unit:unhighlight(playerPos)
    if self.m_type == 0 then
        screen.setHighlighted({x=playerPos.x + 1, y=playerPos.y}, false)
        screen.setHighlighted({x=playerPos.x - 1, y=playerPos.y}, false)
        screen.setHighlighted({x=playerPos.x, y=playerPos.y + 1}, false)
        screen.setHighlighted({x=playerPos.x, y=playerPos.y - 1}, false)
    elseif self.m_type == 1 then
        screen.setHighlighted({x=playerPos.x + 1, y=playerPos.y}, false)
        screen.setHighlighted({x=playerPos.x - 1, y=playerPos.y}, false)
        screen.setHighlighted({x=playerPos.x, y=playerPos.y + 1}, false)
        screen.setHighlighted({x=playerPos.x, y=playerPos.y - 1}, false)

        screen.setHighlighted({x=playerPos.x + 2, y=playerPos.y}, false)
        screen.setHighlighted({x=playerPos.x - 2, y=playerPos.y}, false)
        screen.setHighlighted({x=playerPos.x, y=playerPos.y + 2}, false)
        screen.setHighlighted({x=playerPos.x, y=playerPos.y - 2}, false)
    end
end

function Unit:checkWasLit()
    -- Clear the highlights.
    if self.m_lit == true then
        self:unhighlight(playerPos)
        self.m_lit = false
    end
end

-- This should be called 4 times a second.
function Unit:tick()
    playerPos = {x=self.m_pos.x, y=self.m_pos.y}

    self:checkWasLit()

    -- Check for bad guy, based on type.
    if self.m_type == 0 then
        if self.currentTimeOut > 0 then
            self.currentTimeOut = self.currentTimeOut - 1
        else
            for k,v in pairs(enemyManager.enemyList) do
                enemyPos = ui.path[v.m_pos]

                if (playerPos.x + 1 == enemyPos.x and playerPos.y == enemyPos.y) then
                    self.currentTimeOut = 18
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x - 1 == enemyPos.x and playerPos.y == enemyPos.y) then
                    self.currentTimeOut = 18
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x == enemyPos.x and playerPos.y + 1 == enemyPos.y) then
                    self.currentTimeOut = 18
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x == enemyPos.x and playerPos.y - 1 == enemyPos.y) then
                    self.currentTimeOut = 18
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                end
            end
        end

    elseif self.m_type == 1 then
        if self.currentTimeOut > 0 then
            self.currentTimeOut = self.currentTimeOut - 1
        else
            for k,v in pairs(enemyManager.enemyList) do
                enemyPos = ui.path[v.m_pos]

                if (playerPos.x + 1 == enemyPos.x and playerPos.y == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x - 1 == enemyPos.x and playerPos.y == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x == enemyPos.x and playerPos.y + 1 == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x == enemyPos.x and playerPos.y - 1 == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x + 2 == enemyPos.x and playerPos.y == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x - 2 == enemyPos.x and playerPos.y == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x == enemyPos.x and playerPos.y + 2 == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                elseif (playerPos.x == enemyPos.x and playerPos.y - 2 == enemyPos.y) then
                    self.currentTimeOut = 20
                    self:highlight(playerPos)
                    v.m_toDestroy = true
                end
            end
        end
    end
end

return Unit
