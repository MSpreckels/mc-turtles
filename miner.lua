--1 coal 60 blocks

chestPos = nil

function room(width, height, length)
    if chestPos == nil then
        transform.rotate180()
        
        if turtle.detect() then
            turtle.dig()
        end

        turtle.select(15)
        turtle.place()
        turtle.select(0)
    end
end