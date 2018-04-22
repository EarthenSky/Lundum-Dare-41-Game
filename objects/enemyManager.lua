local EnemyManager = {}

-- List of all the enemies.
EnemyManager.enemyList = {}

-- Unique id generator.
EnemyManager.id = 1

local garbageList = {}

-- Tick all of the units in the list.
function EnemyManager.tick()
    for k,v in pairs(EnemyManager.enemyList) do
        v:tick()  -- Inc enemy pos.
        v:blit()  -- Inc enemy pos.

        -- Look for garbage.
        if v.m_toDestroy == true then
            garbageList[v.m_id] = true
        end
    end
end

-- This comes after the units attack.
function EnemyManager.garbageTick()
    -- Empty the garbage from the old list.
    for k,v in pairs(garbageList) do
        EnemyManager.enemyList[k]:hide()  -- Disapear blit before destroyed.
        EnemyManager.enemyList[k] = nul
        ui.setMoney(ui.getMoney() + 16)  -- Get money when an enemy dies, no matter what.
    end

    -- Clear garbage list.
    garbageList = {}
end

function EnemyManager.listLength()
    local count = 0
    for _ in pairs(EnemyManager.enemyList) do count = count + 1 end
    return count
end

-- Things that probably need to be reset.
function EnemyManager.reset()
    EnemyManager.enemyList = {}
    EnemyManager.id = 1
    garbageList = {}
end

return EnemyManager
