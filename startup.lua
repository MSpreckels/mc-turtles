--pastebin run fysWqF7B

local sharedBasePath = "/met/shared"
local hubBasePath = "/met/pc"
local gitPath = sharedBasePath .. "/git"
local startupPath = sharedBasePath .. "/startup"
local jsonPath = sharedBasePath .. "/json"
local transformPath = sharedBasePath .. "/transform"
local profilePath = sharedBasePath .. "/profile"

local customturtleStartupPath = "/startup/customturtle"
local hubStartupPath = "/startup/hub"

local namesPath = hubBasePath .. "/names"
local utilsPath = hubBasePath .. "/utils"
local restPath = hubBasePath .. "/rest"

if fs.exists(gitPath) then
    print("Updating " .. gitPath .. "...")
    shell.run("rm", gitPath)
end
shell.run("pastebin", "get", "iSCvBQQg", gitPath)

os.loadAPI(gitPath)

print("loading shared apis..")

if fs.exists(jsonPath) then
    print("Updating " .. jsonPath .. "...")
    shell.run("rm", jsonPath)
end
git.get("json", jsonPath)

if turtle then
    if fs.exists(transformPath) then
        print("Updating " .. transformPath .. "...")
        shell.run("rm", transformPath)
    end
    git.get("transform", transformPath)

    if fs.exists(profilePath) then
        print("Updating " .. profilePath .. "...")
        shell.run("rm", profilePath)
    end
    git.get("profile", profilePath)

    if fs.exists(customturtleStartupPath) then
        print("Updating " .. customturtleStartupPath .. "...")
        shell.run("rm", customturtleStartupPath)
    end
    git.get("customturtle", customturtleStartupPath)
    shell.run(customturtleStartupPath)
else 

    if fs.exists(namesPath) then
        print("Updating " .. namesPath .. "...")
        shell.run("rm", namesPath)
    end
    git.get("names", namesPath)

    if fs.exists(utilsPath) then
        print("Updating " .. utilsPath .. "...")
        shell.run("rm", utilsPath)
    end
    git.get("utils", utilsPath) 

    if fs.exists(restPath) then
        print("Updating " .. restPath .. "...")
        shell.run("rm", restPath)
    end
    git.get("rest", restPath) 

    if fs.exists(hubStartupPath) then
        print("Updating " .. hubStartupPath .. "...")
        shell.run("rm", hubStartupPath)
    end
    git.get("hub", hubStartupPath) 
    shell.run(hubStartupPath)

end
