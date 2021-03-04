local sharedBasePath = "/met/shared"
local jsonPath = sharedBasePath .. "/json"

os.loadAPI(jsonPath)

rednet.open("back")

hubID = nil
while hubID == nil do
    hubID = rednet.lookup("hub")
end

rednet.send(hubID, '{"http":"get","endpoint":"tablet"}')
id, res = rednet.receive(10)
if res ~= nil then
    msg = json.decode(res)

    print(msg.msg)
end