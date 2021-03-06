local sharedBasePath = "/met/shared"
local jsonPath = sharedBasePath .. "/json"

os.loadAPI(jsonPath)

rednet.open("left")

hubID = nil
while hubID == nil do
    hubID = rednet.lookup("mobfarm")
end

rednet.send(hubID, '{"http":"post","endpoint":"addTurtle"}')


function placeGrasBlock()
  turtle.select(2)
  turtle.digUp()
  turtle.select(1)
  turtle.placeUp()
  redstone.setAnalogOutput("top", 0)
end

function placeRedstoneLamp()
  turtle.select(1)
  turtle.digUp()
  turtle.select(2)
  turtle.placeUp()
  redstone.setAnalogOutput("top", 15)
end

while true do  
  id, res = rednet.receive(10)
  if res ~= nil then
    obj = json.decode(res)
    
    if obj.isFarmActive then
      placeGrasBlock()
    else
      placeRedstoneLamp()
    end
  end
end