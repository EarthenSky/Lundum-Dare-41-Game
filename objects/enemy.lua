Enemy = {}

-- pos is number
function Enemy:new(id)
    -- Add member variables here.
    selfObj = {
        m_pos = -1,
        m_id = id,
        m_toDestroy = false
    }

    -- Make this a class.
    self.__index = self
    return setmetatable(selfObj, self)
end

-- inc pos in list.
function Enemy:tick()
    self.m_pos = self.m_pos + 1

    if self.m_pos > 53 then
        ui.setLives(ui.getLives() - 1)

        ui.setMoney( math.floor(ui.getMoney() / 3 * 2) )

        if ui.getLives() <= 0 then
            loseGame()
        end

        self.m_toDestroy = true
    end
end

function Enemy:hide()
    -- Replace last pos with path.
    if self.m_pos >= 1 and self.m_pos <= 53 then
        screen.setChar(ui.path[self.m_pos], '·')  -- ¤•
    end
end

-- inc pos in list.
function Enemy:blit()
    -- Replace last pos with path.
    if self.m_pos >= 1 and self.m_pos <= 54 then
        screen.setChar(ui.path[self.m_pos-1], '·')  -- ¤•
    end

    if self.m_pos <= 53 then
        -- Blit at new place.
        screen.setChar(ui.path[self.m_pos], '¤')  -- X
    end
end

return Enemy
