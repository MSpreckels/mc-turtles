local speaker = peripheral.find("speaker")
local monitor = peripheral.find("monitor")

os.loadAPI("met/shared/git")

local arg1 = ...

if not arg1 then
  print("Add a tempo as an arg please")
end

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
notes["F#"] = 0
notes["G"] = 1
notes["G#"] = 2
notes["A"] = 3
notes["A#"] = 4
notes["B"] = 5
notes["C"] = 6
notes["C#"] = 7
notes["D"] = 8
notes["D#"] = 9
notes["E"] = 10
notes["F"] = 11

local bps = 60 --beats per second
local tempo = arg1 --tempo of song
local hits = 0 --total hits
local bars = 1 --total bars
local volume = 3
local octave = 0

print("tempo of " .. tempo .. " hits every " .. bps / tempo .. " seconds.")

git.get("jukebox/songs/feelgoodinc", "songs/feelgoodinc")
local file = fs.open("songs/feelgoodinc", "r")
local song = file.readAll()
file.close()

for i = 1, #song do
  local range = 0
  
  if c == "v" then
    range = 3 
  else
    range = 0
  end

  local c = song:sub(i,i+range)
  print(c)

  i = i + range
  os.sleep(bps / tempo);
end