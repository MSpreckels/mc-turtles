function writeFile(data)
    local file = fs.open("/profile/data.json", "w")
    file.write(data)
    file.close()
end

function readFile()
    local file = fs.open("/profile/data.json", "r")
    local data = file.readAll()
    file.close()
    return data
end

function checkOrCreate(hubID)
    if not fs.exists("/profile/data.json") then
        create(hubID)
    end
end

function save()
    data = json.decode(readFile())

    data.position = transform.getPosition()
    data.heading = transform.getHeading()
    data.fuel = turtle.getFuelLevel()

    writeFile(json.encode(data))
end

function getData()
    return json.decode(readFile())
end

function getPosition()
    return getData().position
end

function getHeading()
    return getData().heading
end

function create(hubID)
    print("no data found, creating new turtle")
    print("enter a valid job:")
    job = read()

    rednet.send(hubID, '{"http":"get","endpoint":"name"}')
    id, msg = rednet.receive(10)
    if msg ~= nil then
        response = json.decode(msg);
        response.job = job;
        response.position = vector.new(gps.locate())
        response.heading = 0
        response.fuel = nil

        writeFile(json.encode(response))
    end
end