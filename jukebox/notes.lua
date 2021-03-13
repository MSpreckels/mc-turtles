local speaker = peripheral.find("speaker")

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
-- notes["F#"] = 12
-- notes["G"] = 13
-- notes["G#"] = 14
-- notes["A"] = 15
-- notes["A#"] = 16
-- notes["B"] = 17
-- notes["C"] = 18
-- notes["C#"] = 19
-- notes["D"] = 20
-- notes["D#"] = 21
-- notes["E"] = 22
-- notes["F"] = 23
-- notes["F#"] = 24

local volume = 3
local octave = 0

for i = 0, 2, 1 do
  octave = i
  local note = notes["F#"] + (12*octave)
  
  speaker.playNote("guitar", volume, note)
end 


