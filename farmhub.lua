local monitor = peripheral.wrap("front")
local sizeX, sizeY = monitor.getSize()
local toggle = false
monitor.setBackgroundColor(colors.black)
monitor.clear()

function drawbutton(buttonData, color)
  for i = 0, buttonData.h-1, 1 do
    monitor.setCursorPos(buttonData.x, buttonData.y + i)
    monitor.setBackgroundColor(color)
    monitor.write(string.rep(" ", buttonData.w))
  end

  monitor.setCursorPos(buttonData.x, buttonData.y)
  monitor.setTextColor(colors.white)
  monitor.write(buttonData.text)

  return button;
end

buttons = {}

button = {}
button.id = 0;
button.text = "Test";
button.x = 2;
button.y = 2;
button.w = sizeX-2;
button.h = 1;
button.onClick = nil;

button2 = {}
button2.id = 1;
button2.text = "Test2";
button2.x = 2;
button2.y = 4;
button2.w = sizeX-2;
button2.h = 1;
button2.onClick = nil;

buttons[button.id] = button
buttons[button2.id] = button2

drawbutton(buttons[0], colors.green)
drawbutton(buttons[1], colors.red)

while true do

  event, side, xPos, yPos = os.pullEvent("monitor_touch")


end

