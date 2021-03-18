local giturl = "https://raw.githubusercontent.com/MSpreckels/mc-turtles/master/"

function get(filename, path)
    print("Fetching " .. filename .. "...")
    local dl = http.get(giturl .. filename)
    if dl then
        print("Downloading " .. filename .. "...")
        local data = dl.readAll()
        dl.close()
        
        local file = fs.open(path, "w")
        file.write(data)
        file.close()
        print("Done!")
    else
        print("Couldn't find module " .. filename ..". Continuing!")
    end
end