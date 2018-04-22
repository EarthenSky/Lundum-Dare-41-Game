local UI = {}

UI.path = {}

UI.shortButton = require "objects/shortButton"
UI.longButton = require "objects/longButton"
UI.nextWaveButton = require "objects/nextWaveButton"
UI.gameSpeedButtons = require "objects/gameSpeedButtons"

-- Init UI variables.
local money = 300
local wave = 0
local lives = 5

-- Both messages max *6* chars
local errMessageTop = ""
local errMessageBottom = ""

------------------------------
local MONEY_TEXT = "MONEY:"

-- Blits the money value to the screen.
local function blitMoney()
    strMoney = tostring(money)
    -- Clear the area.
    for i=1, 6,1 do
        screen.setChar({x=i, y=15}, " ")
    end

    -- Blit the area with the number
    for i=1, #strMoney,1 do
        local char = strMoney:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=15}, char)
    end
end

-- "initBlit"
local function initMoney()
    for i=1, #MONEY_TEXT,1 do
        local char = MONEY_TEXT:sub(i,i)  -- Get char at place value.
        screen.setChar({x=i, y=14}, char)
    end

    blitMoney()
end

function UI.getMoney()
    return money
end

-- Blit after setting new value.
function UI.setMoney(value)
    money = value
    blitMoney()
end

------------------------------

local WAVE_TEXT = "WAVE#:"

-- Blits the wave value to the screen.
local function blitWave()
    strWave = tostring(wave)
    -- Clear the area.
    for i=8, 13,1 do
        screen.setChar({x=i, y=15}, " ")
    end

    -- Blit the area with the number
    for i=8, #strWave+7,1 do
        local char = strWave:sub(i-7,i-7)  -- Get char at place value.
        screen.setChar({x=i, y=15}, char)
    end
end

-- "initBlit"
local function initWave()
    for i=8, #WAVE_TEXT+7,1 do
        local char = WAVE_TEXT:sub(i-7,i-7)  -- Get char at place value.
        screen.setChar({x=i, y=14}, char)
    end

    blitWave()
end

function UI.getWave()
    return wave
end

function UI.setWave(value)
    wave = value
    blitWave()
end

------------------------------

local LIVES_TEXT = "LIVES:"

-- Blits the lives value to the screen.
local function blitLives()
    strLives = tostring(lives)
    -- Clear the area.
    for i=15, 20,1 do
        screen.setChar({x=i, y=15}, " ")
    end

    -- Blit the area with the numbesr
    for i=15, #strLives+14,1 do
        local char = strLives:sub(i-14,i-14)  -- Get char at place value.
        screen.setChar({x=i, y=15}, char)
    end
end

-- "initBlit"
local function initLives()
    for i=15, #LIVES_TEXT+14,1 do
        local char = LIVES_TEXT:sub(i-14,i-14)  -- Get char at place value.
        screen.setChar({x=i, y=14}, char)
    end

    blitLives()
end

function UI.getLives()
    return lives
end

function UI.setLives(value)
    lives = value
    blitLives()
end

------------------------------

-- Blits the message values to the screen.
local function blitMessage()
    -- Clear the area.
    for i=22, 27,1 do
        screen.setChar({x=i, y=14}, " ")
    end

    for i=22, 27,1 do
        screen.setChar({x=i, y=15}, " ")
    end

    -- Blit the area with the top message
    for i=22, #errMessageTop+21,1 do
        local char = errMessageTop:sub(i-21,i-21)  -- Get char at place value.
        screen.setChar({x=i, y=14}, char)
    end

    -- Blit the area with the bottom message
    for i=22, #errMessageBottom+21,1 do
        local char = errMessageBottom:sub(i-21,i-21)  -- Get char at place value.
        screen.setChar({x=i, y=15}, char)
    end
end

function UI.getMessage()
    return errMessage
end

UI.messageDisapearTimer = -10000
function UI.setMessage(top, bottom, wait)
    errMessageTop = top
    errMessageBottom = bottom
    blitMessage()

    UI.messageDisapearTimer = wait
end

------------------------------

-- Init the path values.
local function initPath()
    UI.path[0] = {x=10,y=3}
    UI.path[1] = {x=10,y=4}
    UI.path[2] = {x=10,y=5}

    UI.path[3] = {x=11,y=5}
    UI.path[4] = {x=12,y=5}
    UI.path[5] = {x=13,y=5}
    UI.path[6] = {x=14,y=5}
    UI.path[7] = {x=15,y=5}
    UI.path[8] = {x=16,y=5}
    UI.path[9] = {x=17,y=5}
    UI.path[10] = {x=18,y=5}
    UI.path[11] = {x=19,y=5}
    UI.path[12] = {x=20,y=5}
    UI.path[13] = {x=21,y=5}
    UI.path[14] = {x=22,y=5}
    UI.path[15] = {x=23,y=5}

    UI.path[16] = {x=24,y=5}
    UI.path[17] = {x=24,y=6}
    UI.path[18] = {x=24,y=7}
    UI.path[19] = {x=24,y=8}

    UI.path[20] = {x=23,y=8}
    UI.path[21] = {x=22,y=8}
    UI.path[22] = {x=21,y=8}
    UI.path[23] = {x=20,y=8}
    UI.path[24] = {x=19,y=8}
    UI.path[25] = {x=18,y=8}
    UI.path[26] = {x=17,y=8}
    UI.path[27] = {x=16,y=8}
    UI.path[28] = {x=15,y=8}
    UI.path[29] = {x=14,y=8}
    UI.path[30] = {x=13,y=8}
    UI.path[31] = {x=12,y=8}
    UI.path[32] = {x=11,y=8}
    UI.path[33] = {x=10,y=8}

    UI.path[34] = {x=9,y=8}
    UI.path[35] = {x=9,y=9}
    UI.path[36] = {x=9,y=10}

    UI.path[37] = {x=10,y=10}
    UI.path[38] = {x=11,y=10}
    UI.path[39] = {x=12,y=10}
    UI.path[40] = {x=13,y=10}
    UI.path[41] = {x=14,y=10}
    UI.path[42] = {x=15,y=10}

    UI.path[43] = {x=16,y=10}
    UI.path[44] = {x=16,y=11}

    UI.path[45] = {x=17,y=11}
    UI.path[46] = {x=18,y=11}
    UI.path[47] = {x=19,y=11}
    UI.path[48] = {x=20,y=11}
    UI.path[49] = {x=21,y=11}
    UI.path[50] = {x=22,y=11}
    UI.path[51] = {x=23,y=11}
    UI.path[52] = {x=24,y=11}
    UI.path[53] = {x=25,y=11}

    -- Start and end.
    UI.path[54] = {x=10,y=2}
    UI.path[55] = {x=26,y=11}
end

-- This function sets the beginning and end spaces.
local function initGameBlit()
    -- Print the path.
    for k,v in pairs(UI.path) do
        screen.setChar({x=v.x, y=v.y}, "·")
    end

    -- Print the beginning and end chars.
    screen.setChar({x=10, y=2}, "B")
    screen.setChar({x=26, y=11}, "E")
end

-- Prints the inital "scene" values to the screen.  Also inits it's sub objects.
function UI.init()
    -- Init game screen
    initPath()
    initGameBlit()

    -- Init UI text.
    initMoney()
    initWave()
    initLives()

    -- Init buttons.
    UI.shortButton.init()
    UI.longButton.init()
    UI.nextWaveButton.init()

    UI.gameSpeedButtons.init()
end

function UI.update(dt)
    -- Update the buttons.
    UI.shortButton.update()
    UI.longButton.update()
    UI.nextWaveButton.update()

    UI.gameSpeedButtons.update()

    if UI.messageDisapearTimer > -9998 then
        UI.messageDisapearTimer = UI.messageDisapearTimer - dt
    end

    if UI.messageDisapearTimer > -9998 and UI.messageDisapearTimer < 0 then
        UI.messageDisapearTimer = -10000

        -- Reset the message.
        errMessageTop = "      "
        errMessageBottom = "      "
        blitMessage()
    end
end

return UI
