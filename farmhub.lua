local monitor = peripheral.wrap("front")
local sizeX, sizeY = monitor.getSize()
local toggle = false
monitor.clear()

buttons = {}

button = {}
button.id = 0;
button.text = "Test";
button.x = 2;
button.y = 2;
button.w = sizeX-1;
button.h = 1;
button.onClick = nil;

buttons[button.id] = button

drawbutton(buttons[0], colors.green)

while true do

  event, side, xPos, yPos = os.pullEvent("monitor_touch")


end

function drawbutton(buttonData, color)
  
  for i = 1, buttonData.h, 1 do
    monitor.setCursorPos(buttonData.x, i)
    monitor.setBackgroundColor(color)
    monitor.write(string.rep(" ", buttonData.w))
  end

  monitor.setCursorPos(buttonData.x + buttonData.w / 2, buttonData.y + buttonData.h / 2)
  monitor.setTextColor(colors.white)
  monitor.write(buttonData.text)

  return button;
end