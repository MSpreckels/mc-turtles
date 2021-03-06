local sharedBasePath = "/met/shared"
local jsonPath = sharedBasePath .. "/json"

os.loadAPI(jsonPath)

rednet.open("left")

hubID = nil
while hubID == nil do
    hubID = rednet.lookup("hub")
end

rednet.send(hubID, '{"http":"post","endpoint":"addTurtle"}')

while true do  
  id, res = rednet.receive(10)
  if res ~= nil then
    obj = json.decode(res)
    print(obj)
    
    print(obj.isFarmActive)
  end
end