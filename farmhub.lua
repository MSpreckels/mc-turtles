local monitor = peripheral.wrap("front")
local toggle = false

while true do
  event, side, xPos, yPos = os.pullEvent("monitor_touch")

  toggle = ~toggle

  if toggle then
    monitor.setBackgroundColor(colors.red)
    redstone.setAnalogOutput("back", 0)
  else
    monitor.setBackgroundColor(colors.green)
    redstone.setAnalogOutput("back", 1)
  end

  monitor.clear()
end