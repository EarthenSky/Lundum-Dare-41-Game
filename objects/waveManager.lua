local WaveManager = {}

local waveOutputTable = {}
local extraEnemies = 0

local waveStats = 0

WaveManager.currentTick = 0

function initRoundOutput()
    waveOutputTable[1] = {e=2, t=18}
    waveOutputTable[2] = {e=2, t=10}
    waveOutputTable[3] = {e=3, t=8}
    waveOutputTable[4] = {e=6, t=7}
    waveOutputTable[5] = {e=6, t=6}
    waveOutputTable[6] = {e=6, t=4}
    waveOutputTable[7] = {e=8, t=4}
    waveOutputTable[8] = {e=7, t=2}
    waveOutputTable[9] = {e=10, t=4}
    waveOutputTable[10] = {e=12, t=3}
    waveOutputTable[11] = {e=15, t=2}
    waveOutputTable[12] = {e=12, t=1}
    waveOutputTable[13] = {e=16, t=1}
    -- +1, +random(1, 3), =random(2, 4)
end

function WaveManager.init()
    initRoundOutput()
end

function WaveManager.nextWaveStart()
    WaveManager.currentTick = 0
    ui.setWave(ui.getWave()+1)
    if ui.getWave() <= 13 then
        waveStats = waveOutputTable[ui.getWave()]
    elseif ui.getWave() == 20 then
        winGame()  -- You "win" sortof...
        ui.setMoney(ui.getMoney() + 2000)  -- get Money!
    else
        -- +1, +random(1, 3), =random(2, 4)
        extraEnemies = extraEnemies + love.math.random(2, 6)
        waveStats = {e=waveOutputTable[12].e + extraEnemies, t=love.math.random(1, 2)}
    end
end

-- The wave manager ticks all of the other classes and does some tick math.
function WaveManager.tickMain()
    -- Check if spawn enemies.
    if WaveManager.currentTick % waveStats.t == 0 then
        if waveStats.e > 0 then
            -- Decrement enemy count. (e)
            waveStats = {e=waveStats.e - 1, t=waveStats.t}

            -- Spawn enemy, inc the id of the enemy.
            enemyManager.enemyList[enemyManager.id] = enemy:new(enemyManager.id)
            enemyManager.id = enemyManager.id + 1
        end
    end

    WaveManager.currentTick = WaveManager.currentTick + 1

    -- Collect garbage, Tick enemy, Collect garbage, then units.
    enemyManager.tick()

    enemyManager.garbageTick()

    unitManager.tick()

    enemyManager.garbageTick()

    -- Check if over.  Unit cooldowns reset.
    if enemyManager.listLength() <= 0 and waveStats.e <= 0 then
        ui.nextWaveButton.setDeactive()
        unitManager.resetTimers()
    end
end

-- Prolly need to be reset.
function WaveManager.reset()
    extraEnemies = 0
    waveOutputTable = {}
    waveStats = 0
    WaveManager.currentTick = 0
end

return WaveManager
