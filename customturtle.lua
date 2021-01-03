--pastebin get c18S5NEU turtle.lua
shell.run("label", "set", "loading...")
print("turtle starting up..")
print("loading apis..")
os.loadAPI("/common/json")
os.loadAPI("/common/profile")
os.loadAPI("/common/transform")

print("opening modem..")
rednet.open("left")

print("connecting to hub..")
hubID = nil
while hubID == nil do
    hubID = rednet.lookup("hub")
end

--handle profile data
print("load data..")
profile.checkOrCreate(hubID)
data = profile.getData()
shell.run("label", "set", string.format('"[%s] %s"', data.job, data.name))

transform.init(profile.getPosition(), profile.getHeading())
rednet.send(hubID, '{"http":"post","endpoint":"updateTurtle","body":"' .. profile.readFile():gsub("\"", "\\\"") .. '"}')

--handle walking
if data.job == "miner" then
    print("select a type")
    print("[r]oom [t]unnel [q]uarry [s]trip")
    type = read()

    print("launching program...")
end

while true do
    if math.random() < 0.5 then
        transform.rotateLeft()
    else
        transform.rotateRight()
    end
    profile.save()

    rednet.send(hubID, '{"http":"post","endpoint":"updateTurtle","body":"' .. profile.readFile():gsub("\"", "\\\"") .. '"}')
    os.sleep(1)
end

rednet.close("left");
