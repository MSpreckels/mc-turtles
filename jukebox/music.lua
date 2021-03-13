local speaker = peripheral.find("speaker")
local monitor = peripheral.find("monitor")

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

j = 1
while true do
  monitor.setCursorPos(1, j+1)
  monitor.write("Playing " .. instruments[j])

  for i = 1, 24, 1 do
    speaker.playNote(instruments[j], 3, i)
    os.sleep(0)
  end

  j = (j+1) % 17

  if j == 0 then 
    monitor.clear()
    j = 1
  end
end