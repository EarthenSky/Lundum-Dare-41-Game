--Double commented code (----) is not a note, but removed code.

-- Important and Constant variables.
CHAR_SCREEN_SIZE = {x=30, y=16}
SCREEN_SIZE = {x=852, y=608}
TPS = 8

g_currentScene = 0
g_debugString = "start"
g_currentTime = 0

-- Game reset globals.
g_loseTimer = 0
g_resetGame = false

FONT_SIZE = 45
MAIN_FONT = love.graphics.newFont("resources/consola.ttf", FONT_SIZE)

function love.load()
    -- Images are loaded here.

    -- Set up the window.
    love.window.setMode(SCREEN_SIZE.x, SCREEN_SIZE.y, {resizable=false, vsync=true})
    love.window.setTitle("Text Tower Defense!")
    love.graphics.setBackgroundColor(5, 5, 5, 255)

    -- Other Modules are loaded here.
    screen = require "screen"
    scene = require "objects/scene"
    ui = require "objects/ui"

    unit = require "objects/unit"
    unitPlacer = require "objects/unitPlacer"
    unitManager = require "objects/unitManager"

    waveManager = require "objects/waveManager"

    enemy = require "objects/enemy"
    enemyManager = require "objects/enemyManager"

    -- Any initialization code goes after here.
    love.graphics.setFont(MAIN_FONT)  -- Init the font.

    -- Init modules
    screen.init()
    scene.init()
    ui.init()

    waveManager.init()
end

-- Only drawing and maybe come conditional statements go here.
function love.draw()
    screen.draw()  -- Draw all of the characters on the screen.
end

-- No drawing code, Math or physics code here.
function love.update(dt)
    if g_resetGame == false then
        ui.update(dt)

        unitPlacer.update()

        -- If the next wave is moving...
        if ui.nextWaveButton.isActive() then
            g_currentTime = g_currentTime + dt

            -- Increment ticks by 1 every 1/4 seconds.
            if g_currentTime >= 1/TPS then
                g_currentTime = g_currentTime - 1/TPS
                waveManager.tickMain()
            end
        end

    else
        g_loseTimer = g_loseTimer + dt

        -- Wait 2 seconds before resetting the game.
        if g_loseTimer >= 2 then
            resetGame()
        end
    end
end

function winGame()
    ui.setMessage("YOU   ", "WIN!!!", 4)
end

function loseGame()
    str = "GAME OVER"
    for i=18, #str+17,1 do
        local char = str:sub(i-17,i-17)  -- Get char at place value.
        screen.setChar({x=i, y=2}, char)
    end

    for i=18, #str+17,1 do
        screen.setHighlighted({x=i, y=2}, true)
        screen.setHighlightedColour({x=i, y=2}, 1)
    end

    g_resetGame = true
end

function resetGame()
    -- Flush the game window.
    for x=7,26,1 do
        for y=2,12,1 do
            screen.setChar({x=x, y=y}, " ")
            screen.setHighlighted({x=x, y=y}, false)
        end
    end

    -- And reset buttons.
    --ui.shortButton.setDeactive()
    --ui.longButton.setDeactive()
    ui.nextWaveButton.setDeactive()

    -- Reset ui
    ui.setLives(5)
    ui.setMoney(280)
    ui.setWave(0)
    ui.setMessage("GAME  ", "RESET ", 0.5)

    -- Module variables are reset, in module. (managers)
    waveManager.reset()
    unitManager.reset()
    enemyManager.reset()

    -- Re init modules
    screen.init()
    scene.init()
    ui.init()
    waveManager.init()

    -- Stop game from being paused.
    g_loseTimer = 0
    g_resetGame = false
end
