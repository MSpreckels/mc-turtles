--pastebin run fysWqF7B

print("checking if git api exists...")
if fs.exists("/met/common/git") then
    print("folder met/common has been found, do you want to update it? y/n")
    if read() == "y" then
        shell.run("rm", "/met/common/git")
    end
else
  shell.run("pastebin", "get", "iSCvBQQg", "/met/common/git")
end

os.loadAPI("/met/common/git")

print("loading common apis..")

if fs.exists("/met/common") then
    print("folder met/common has been found, do you want to update it? y/n")
    if read() == "y" then
        shell.run("rm", "/met/common")
    end
end

if fs.exists("/startup") then
    print("folder startup has been found, do you want to update it? y/n")
    if read() == "y" then
        shell.run("rm", "/startup")
    end
end

if not fs.exists("/met/common/json") then
    -- shell.run("pastebin", "get", "5HHC17Xg", "/met/common/json")
    git.get("json", "/met/common/json")
end

if turtle then
    if fs.exists("/met/profile") then
        print("profile folder detected, do you want to clean it? y/n")
        if read() == "y" then
            shell.run("rm", "/met/profile")
        end
    end

    if fs.exists("/startup/customturtle") then
        shell.run("rm", "/startup/customturtle")
    end

    if not fs.exists("/met/common/transform") then
        -- shell.run("pastebin", "get", "jLaR0VT0", "/met/common/transform")
        git.get("transform", "/met/common/transform")

    end

    if not fs.exists("/met/common/profile") then
        -- shell.run("pastebin", "get", "zjkdYmXV", "/met/common/profile")
        git.get("profile", "/met/common/profile")
    end

    -- shell.run("pastebin", "get", "c18S5NEU", "/startup/customturtle")
    git.get("customturtle", "/startup/customturtle")
    shell.run("/startup/customturtle")
else    
    if not fs.exists("/met/common/names") then
        -- shell.run("pastebin", "get", "qUfJSu3d", "/met/common/names")
        git.get("names", "/met/common/names")
    end

    if not fs.exists("/met/common/utils") then
        -- shell.run("pastebin", "get", "eYE7aKcL", "/met/common/utils")
        git.get("utils", "/met/common/utils")
    end    

    if not fs.exists("/met/common/rest") then
        -- shell.run("pastebin", "get", "ADSScD8t", "/met/common/rest")
        git.get("rest", "/met/common/rest")
    end

    if fs.exists("/startup/hub") then
        shell.run("rm", "/startup/hub")
    end
    
    -- shell.run("pastebin", "get", "XD2cLT0G", "/startup/hub")
    git.get("hub", "/startup/hub")
    shell.run("/startup/hub")
end
