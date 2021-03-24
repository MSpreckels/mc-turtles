local speaker = peripheral.find("speaker")
local monitor = peripheral.find("monitor")

os.loadAPI("met/shared/git")

-- local arg1 = ...

-- if not arg1 then
--   print("Add a tempo as an arg please")
-- end

monitor.setTextScale(0.5)
monitor.clear()
monitor.setCursorPos(1,1)
monitor.write("ready")

instruments = {
  "guitar",
  "banjo",
  "pling",
  "harp",
  "bit",
  "iron_xylophone",
  "xylophone",
  "chime",
  "flute",
  "bell",
  "basedrum",
  "hat",
  "snare",
  "bass",
  "cow_bell",
  "didgeridoo"
}

notes = {}
notes["f+"] = 0
notes["g"] = 1
notes["g+"] = 2
notes["a"] = 3
notes["a+"] = 4
notes["b"] = 5
notes["c"] = 6
notes["c+"] = 7
notes["d"] = 8
notes["d+"] = 9
notes["e"] = 10
notes["f"] = 11

local bps = 60 --beats per second
local tempo = 100 --tempo of song
local hits = 0 --total hits
local bars = 1 --total bars
local volume = 3
local octave = 0
local i = 1;

print("tempo of " .. tempo .. " hits every " .. bps / tempo .. " seconds.")

git.get("jukebox/songs/feelgoodinc", "songs/feelgoodinc")
local file = fs.open("songs/feelgoodinc", "r")
local song = file.readAll()
file.close()

function getRange(i) 
  local range = 0
  local char = song:sub(i,i)

  if char == "v" or char == "t" then
      range = 4
  elseif char == "r" or char == "p" then
      range = 1
      if type(tonumber(song:sub(i+1,i+1))) == "number" then 
          range = range + 1
          
          if type(tonumber(song:sub(i+2,i+2))) == "number" then
              range = range + 1
          end    
      end

  elseif char == ">" or char == "<" then
      range = 1
  elseif char == "a" or char == "b" or char == "c" or char == "d" or char == "e" or char == "f" or char == "g" then
      range = 1

      if song:sub(i+1,i+1) == "+" or song:sub(i+1,i+1) == "#" then
          range = range + 1

          if type(tonumber(song:sub(i+2,i+2))) == "number" then 
              range = range + 1
              
              if type(tonumber(song:sub(i+3,i+3))) == "number" then
                  range = range + 1
              end
          end
      elseif type(tonumber(song:sub(i+1,i+1))) == "number" then 
          range = range + 1
          
          if type(tonumber(song:sub(i+2,i+2))) == "number" then
              range = range + 1
          end                
      end
  else
      range = 1
  end
  return range
end

function run(command) 

  local duration = 1
  local note = 0
  print(command)
  local action = command:sub(1,1+note)
     
  if action == "t" then
      tempo = command:sub(2)
  elseif action == "r" or action == "p" then
      duration = command:sub(2)
  elseif action == "a" or action == "b" or action == "c" or action == "d" or action == "e" or action == "f" or action == "g" then

      if action:sub(2,2) == "+" or song:sub(2,2) == "#" then
          duration = command:sub(3)
          note = 1

      elseif type(tonumber(song:sub(2,2))) == "number" then 
          duration = command:sub(2)             
      end
  end
  
  speaker.playNote("guitar", volume, notes[action])
  os.sleep((bps/tempo)/duration)

end


while true do
  
  local range = getRange(i)
  
  local command = song:sub(i,i+range-1)
  run(command)

  i = i + range

  if i >= #song then
      break
  end
end