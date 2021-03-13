speaker = peripheral.find("speaker")

local bps = 60 --beats per second
local tempo = 60 --tempo of song

print("tempo of " .. tempo .. " hits every " .. bps / tempo .. " seconds.")

local hits = 0
local bars = 1
local note = 1

while true do
  hits = hits + 1
  
  if hits % 4 == 0 then
    note = 5
    bars = bars + 1

    print("bars played: " .. bars)
    print("hits: " .. hits)
  else
    note = 1
  end

  speaker.playNote("snare", 3, note)
  os.sleep(bps / tempo)
end