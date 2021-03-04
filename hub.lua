--pastebin get XD2cLT0G hub.lua

local sharedBasePath = "/met/shared"
local hubBasePath = "/met/pc"
local jsonPath = sharedBasePath .. "/json"
local namesPath = hubBasePath .. "/names"
local utilsPath = hubBasePath .. "/utils"
local restPath = hubBasePath .. "/rest"

print("hub starting up..")
print("loading apis..")
os.loadAPI(jsonPath)
os.loadAPI(namesPath)
os.loadAPI(restPath)
os.loadAPI(utilsPath)

print("opening modem..")
rednet.open("right");

print("connecting monitor...")
turtles = {}
monitor = peripheral.wrap("left")
monitor.setTextScale(0.5)
monitor.clear()

print("register hub at lookup table..")
rednet.host("hub", "main");

print("all ready! waiting for messages..")
function getName(id)
    name = names.get()
    print("Chose name " .. name .. " for turtle " .. id)
    rednet.send(id, '{"name":"' .. name .. '"}')
end

function updateTurtle(id, reqbody)
    turtles[id] = reqbody

    print("Updated Turtle with id " .. id)

    index = 1;

    for key, value in utils.pairsByKeys(turtles) do
        monitor.setCursorPos(1,index)
        monitor.clearLine()
        data = json.decode(value)
        if data.fuel == nil or data.fuel == 0 then
            monitor.write(string.format("[%s] %s (%s) at p:(%s,%s,%s) has no fuel!", data.job, data.name, key, data.position.x, data.position.y, data.position.z))
        else
            monitor.write(string.format("[%s] %s (%s) p:(%s,%s,%s) h:%s f:%s", data.job, data.name, key, data.position.x, data.position.y, data.position.z, data.heading, data.fuel))
        end
        index = index+1;
    end
end

function getTablet(id)
    turtle = turtles[0]
    obj = json.decode(turtle)
    rednet.send(id, '{"msg":"' .. obj.name .. '!"}')
end

rest.register("get", "name", getName)
rest.register("post", "updateTurtle", updateTurtle)
rest.register("get", "tablet", getTablet)
rest.listen()

rednet.unhost("hub", "main");
rednet.close("right");