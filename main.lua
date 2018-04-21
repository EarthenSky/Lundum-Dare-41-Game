--Double commented code (----) is not a note, but removed code.

-- Important and Constant variables.
CHAR_SCREEN_SIZE = {x=27, y=16}
SCREEN_SIZE = {x=748, y=598}

CurrentScene = 0
DebugString = "start"

FONT_SIZE = 45
MAIN_FONT = love.graphics.newFont("resources/consola.ttf", FONT_SIZE)

function love.load()
    -- Images are loaded here.

    -- Set up the window.
    love.window.setMode(SCREEN_SIZE.x, SCREEN_SIZE.y, {resizable=false, vsync=true})
    love.window.setTitle("Text Tower Defence")
    love.graphics.setBackgroundColor(5, 5, 5, 255)

    -- Other Modules are loaded here.
    ----util = require "util"
    screen = require "screen"
    scene = require "objects/scene"
    ui = require "objects/ui"

    -- Any initialization code goes after here.
    love.graphics.setFont(MAIN_FONT)  -- Init the font.

    -- Init modules
    screen.init()
    scene.init()
    ui.init()
end

-- Only drawing and maybe come conditional statements go here.
function love.draw()
    screen.draw()  -- Draw all of the characters on the screen.
end

-- No drawing code, Math or physics code here.
function love.update(dt)
    ui.update()
end
