local giturl = "https://github.com/MSpreckels/mc-turtles/blob/master/"

function get(filename, path)
    raw = http.get(giturl .. url .. ".lua").readAll()
    local file = fs.open(path, "w")
    file.write(data)
    file.flush()
    file.close()
end