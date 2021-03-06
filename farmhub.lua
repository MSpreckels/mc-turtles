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

drawbutton(buttons[0])

while true do

  event, side, xPos, yPos = os.pullEvent("monitor_touch")


end

function drawbutton(buttonData, color)
  
  for i = 1, h, 1 do
    monitor.setCursorPos(x,i)
    monitor.setBackgroundColor(color)
    monitor.write(string.rep(" ", w))
  end

  monitor.setCursorPos(x+w/2,y+h/2)
  monitor.setTextColor(colors.white)
  monitor.write(text)

  return button;
end