
local function OneClickCookChosen(context)
    print("OCC searching...")
    local playerObj = getSpecificPlayer(context.player)
    print("current player " .. playerObj:getDisplayName())
    local playerSquare = playerObj:getSquare()
    local cell = getWorld():getCell()
    -- todo: variable search radius
    -- todo: stay within bounds when near edge of map
    -- todo: worry about crossing cell boundaries
    -- todo: expand to z levels
    -- todo: use an iterator
    for x=playerSquare:getX()-1, playerSquare:getX()+1 do
        for y=playerSquare:getY()-1, playerSquare:getY()+1 do
            local square = cell:getGridSquare(x, y, 0)
            print("searching square " .. x .. ', ' .. y)
            local sqObjs = square:getObjects()
            print("found objects: " .. sqObjs:size())
            for i=0, sqObjs:size()-1 do
                local sqObj = sqObjs:get(i)
                -- for contIdx=0, sqObj:getContainerCount() do
                --     local containerObj = sqObj:getContainerByIndex(contIdx)
                --     print("  inspecting container: " .. containerObj:getType())
                -- end
            end
        end
    end
end


local function OneClickCookAddContextMenuEntry(playerIndex, context, worldObjects, test)
    local menuTop = context:addOption("OneClickCook", context, OneClickCookChosen)
end

Events.OnFillWorldObjectContextMenu.Add(OneClickCookAddContextMenuEntry)
