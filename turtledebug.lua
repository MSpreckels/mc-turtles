--if not create json and ask hub for a name
--if it is created send message to server that turtle is back online
--[[
print("[DEBUG] sending message every 5 seconds..")
while true do 
    print("[DEBUG] sending message..")        
    rednet.send(id, '{"http":"get","endpoint":"name"}')
    id, msg = rednet.receive(10)
    if msg ~= nil then
        response = json.decode(msg);
        shell.run("label", "set", string.format('"%s"', response.name))
    end
    os.sleep(5);
end
]]