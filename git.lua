function get(url, path)
    raw = http.get(url).readAll()
    local file = fs.open(path, "w")
    file.write(data)
    file.close()
end