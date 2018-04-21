local UI = {}

UI.path = {}

UI.shortButton = require "objects/shortButton"

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

    UI.path[46] = {x=17,y=11}
    UI.path[47] = {x=18,y=11}
    UI.path[48] = {x=19,y=11}
    UI.path[49] = {x=20,y=11}
    UI.path[50] = {x=21,y=11}
    UI.path[51] = {x=22,y=11}
    UI.path[52] = {x=23,y=11}
    UI.path[45] = {x=24,y=11}
    UI.path[53] = {x=25,y=11}
end

-- This function sets the beginning and end spaces.
local function initBlit()
    -- Print the beginning and end chars.
    screen.setChar({x=10, y=2}, "B")
    screen.setChar({x=26, y=11}, "E")

    -- Print the path.
    for k,v in pairs(UI.path) do
        screen.setChar({x=v.x, y=v.y}, "0")
    end
end

-- Prints the inital "scene" values to the screen.  Also inits it's sub objects.
function UI.init()
    initPath()
    initBlit()

    UI.shortButton.init()
end

function UI.update()
    UI.shortButton.update()
end

return UI
