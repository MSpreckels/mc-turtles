--pastebin get jLaR0VT0 transform

local position = nil
local heading = nil

function init(pos, h)
    position = pos
    heading = h
end

function forward()
    if checkFuel() then
        if turtle.forward() then
            position = position + dir(heading)
            return true
        end
        return false
    else
        return false
    end
end

function left()
    rotateLeft()
    return forward()
end

function right()
    rotateRight()
    return forward()
end

function up()
    if checkFuel() then
        if turtle.up() then
            position = position + dir(4)
            return true
        end
        return false
    else
        return false
    end
end

function down()
    if checkFuel() then
        if turtle.down() then
            position = position + dir(5)
            return true
        end
        return false
    else
        return false
    end
end

function back()
    if checkFuel() then
        if turtle.back() then
            position = position + dir((heading + 2) % 4)
            return true
        end
        return false
    else
        return false
    end
end

function rotateRight()
    if turtle.turnRight() then
        heading = (heading + 1) % 4
        return true
    end
    return false
end

function rotateLeft()
    if turtle.turnLeft() then
        heading = (heading - 1) % 4
        return true
    end
    return false
end

function dir(heading) --returns vector
    if heading == 0 then --forward
        return vector.new(0,0,1)
    elseif heading == 1 then --right
        return vector.new(-1,0,0)
    elseif heading == 2 then --back
        return vector.new(0,0,-1)
    elseif heading == 3 then --left
        return vector.new(1,0,0)
    elseif heading == 4 then --up
        return vector.new(0,1,0)
    elseif heading == 5 then --down
        return vector.new(0,-1,0)
    end
end

function rotate180()
    rotateLeft()
    rotateLeft()
end

function getHeading() --returns number 0-3
    return heading
end

function checkFuel()
    if turtle.getFuelLevel() == 0 then
        turtle.select(16)
        turtle.refuel(10)
        os.sleep(1)
        checkFuel();
        return false
    else
        turtle.select(0)
        return true
    end
end

function getPosition()
    return position
end

function rotateTo(targetHeading)
    while heading ~= targetHeading do
        rotateRight()
    end
end

function moveTo(pos)
    newPos = pos - position
    newPos:round()
    print(newPos)

    if newPos.y < 0 then
        --go down
        for i = 1, math.abs(newPos.y), 1 do
            down()
        end
    end 
    
    if newPos.x <= newPos.z then
        --if x is shorter go x first
        if newPos.x < 0 then
            rotateTo(1)
        elseif newPos.x > 0 then
            rotateTo(3)
        end

        for i = 1, math.abs(newPos.x), 1 do
            forward()
        end

        --then go z
        if newPos.z > 0 then
            rotateTo(0)
        elseif newPos.z < 0 then
            rotateTo(2)
        else
            --do nothing plox
        end
        
        for i = 1, math.abs(newPos.z), 1 do
            forward()
        end

    elseif newPos.x > newPos.z then
        --if z is shorter go z first

        if newPos.z > 0 then
            rotateTo(0)
        elseif newPos.z < 0 then
            rotateTo(2)
        end
        
        for i = 1, math.abs(newPos.z), 1 do
            forward()
        end

        if newPos.x < 0 then
            rotateTo(1)
        elseif newPos.x > 0 then
            rotateTo(3)
        else
            --do nothing plox
        end

        for i = 1, math.abs(newPos.x), 1 do
            forward()
        end
    end

    if newPos.y > 0 then
        --go up last
        for i = 1, math.abs(newPos.y), 1 do
            up()
        end
    end

    os.sleep(1)
end

