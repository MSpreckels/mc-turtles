--pastebin get qUfJSu3d names.lua

namesJson = [[
    ["Jordan", "Victoria", "Jacqueline", "Corey", "Keith",
    "Monica", "Juan", "Donald", "Cassandra", "Meghan",
    "Joel", "Shane", "Phillip", "Patricia", "Brett",
    "Ronald", "Catherine", "George", "Antonio", "Cynthia",
    "Stacy", "Mitchell", "Hannah", "Renee", "Denise",
    "Molly", "Jerry", "Misty", "Mario", "Johnathan",
    "Jaclyn", "Brenda", "Terry", "Lacey", "Shaun",
    "Devin", "Heidi", "Troy", "Lucas", "Desiree",
    "Beth", "Edwin", "Dylan", "Dominic", "Latasha",
    "Darrell", "Geoffrey", "Savannah", "Reginald", "Carly"]
]]
names = json.decode(namesJson);

function get()
    return names[math.random(50)]
end