interfaces = {}

function register(http, endpoint, func)
    interfaces[http] = {}
    interfaces[http][endpoint] = func
end

function listen()
    while true do
        id, msg = rednet.receive()
        if type(msg) ~= "table" then
            request = json.decode(msg)      
            interfaces[request.http][request.endpoint](id, request.body or nil)
        end
    end
end