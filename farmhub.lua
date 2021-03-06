local monitor = peripheral.wrap("front")
local sizeX, sizeY = monitor.getSize()
local toggle = false

while true do
  event, side, xPos, yPos = os.pullEvent("monitor_touch")

  toggle = not toggle

  if toggle then
    monitor.setBackgroundColor(colors.red)
    redstone.setAnalogOutput("back", 0)
    
    monitor.setCursorPos(1, sizeY / 2)
    monitor.write("off");
  else
    monitor.setBackgroundColor(colors.green)
    redstone.setAnalogOutput("back", 1)

    monitor.setCursorPos(1, sizeY / 2)
    monitor.write("on");
  end

  monitor.clear()
end