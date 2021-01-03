--pastebin run fysWqF7B

print("loading common apis..")

if fs.exists("/common") then
    print("folder common has been found, do you want to update it? y/n")
    if read() == "y" then
        shell.run("rm", "/common")
    end
end

if fs.exists("/startup") then
    print("folder startup has been found, do you want to update it? y/n")
    if read() == "y" then
        shell.run("rm", "/startup")
    end
end

if not fs.exists("/common/json") then
    shell.run("pastebin", "get", "5HHC17Xg", "/common/json")
end

if turtle then
    if fs.exists("/profile") then
        print("profile folder detected, do you want to clean it? y/n")
        if read() == "y" then
            shell.run("rm", "/profile")
        end
    end

    if fs.exists("/startup/customturtle") then
        shell.run("rm", "/startup/customturtle")
    end

    if not fs.exists("/common/transform") then
        shell.run("pastebin", "get", "jLaR0VT0", "/common/transform")
    end

    if not fs.exists("/common/profile") then
        shell.run("pastebin", "get", "zjkdYmXV", "/common/profile")
    end

    shell.run("pastebin", "get", "c18S5NEU", "/startup/customturtle")
    shell.run("/startup/customturtle")
else    
    if not fs.exists("/common/names") then
        shell.run("pastebin", "get", "qUfJSu3d", "/common/names")
    end

    if not fs.exists("/common/utils") then
        shell.run("pastebin", "get", "eYE7aKcL", "/common/utils")
    end    

    if not fs.exists("/common/rest") then
        shell.run("pastebin", "get", "ADSScD8t", "/common/rest")
    end

    if fs.exists("/startup/hub") then
        shell.run("rm", "/startup/hub")
    end
    
    shell.run("pastebin", "get", "XD2cLT0G", "/startup/hub")
    shell.run("/startup/hub")
end
