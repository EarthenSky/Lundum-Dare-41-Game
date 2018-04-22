local UnitManager = {}

-- List of all the units.
UnitManager.unitList = {}

-- Tick all of the units in the list.
function UnitManager.tick()
    for i,v in ipairs(UnitManager.unitList) do
        v:tick()
    end
end

-- Reset the cooldowns.
function UnitManager.resetTimers()
    for i,v in ipairs(UnitManager.unitList) do
        v.currentTimeOut = 0
    end
end

-- Things that probably need to be reset.
function UnitManager.reset()
    UnitManager.unitList = {}
end

return UnitManager
