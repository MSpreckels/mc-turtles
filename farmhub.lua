local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
local sizeX, sizeY = monitor.getSize()
local toggle = false


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

function handleFarmOnClicked()
  redstone.setAnalogOutput("back", 0)

end

function handleFarmOffClicked()
  redstone.setAnalogOutput("back", 1)
end

function redraw()
  monitor.setBackgroundColor(colors.black)
  monitor.clear()

  for i = 1, #buttons, 1 do
    drawbutton(buttons[i])
  end

end

buttons = {}

button = {}
button.id = 1
button.text = "Farm On"
button.x = 2
button.y = 2
button.w = sizeX-2
button.h = 1
button.onClick = handleFarmOnClicked
buttons.color = colors.green

button2 = {}
button2.id = 2
button2.text = "Farm Off"
button2.x = 2
button2.y = 4
button2.w = sizeX-2
button2.h = 1
button2.onClick = handleFarmOffClicked
buttons.color = colors.red

buttons[button.id] = button
buttons[button2.id] = button2

redraw()

while true do

  event, side, xPos, yPos = os.pullEvent("monitor_touch")

  for i = 1, #buttons, 1 do
    if xPos >= buttons[i].x and xPos <= buttons[i].x + buttons[i].w - 1 and
      yPos >= buttons[i].y and yPos <= buttons[i].y + buttons[i].h - 1 then
      buttons[i].onClick()
      speaker.playNote("bell", 1, 0);
    end
  end

  redraw()
end


