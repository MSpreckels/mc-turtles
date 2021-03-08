local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
monitor.setTextScale(0.5)
local sizeX, sizeY = monitor.getSize()

function drawbutton(buttonData)
  for i = 0, buttonData.h-1, 1 do
    monitor.setCursorPos(buttonData.x, buttonData.y + i)
    monitor.setBackgroundColor(buttonData.color)
    monitor.write(string.rep(" ", buttonData.w))
  end

  monitor.setCursorPos(buttonData.x + buttonData.w / 2 - string.len(buttonData.text) / 2, buttonData.y + buttonData.h / 2)
  monitor.setTextColor(colors.white)
  monitor.write(buttonData.text)
end

function handleFarmOnClicked()
  redstone.setAnalogOutput("back", 1)
  speaker.playNote("bell", 1, 6)

  if isFarmActive ~= true then
    isFarmActive = true
  end
end

function handleFarmOffClicked()
  redstone.setAnalogOutput("back", 0)
  speaker.playNote("bell", 1, 0)

  if isFarmActive ~= false then
    isFarmActive = false
  end
end

function redraw()
  monitor.setBackgroundColor(colors.black)
  monitor.clear()

  for i = 1, #buttons, 1 do
    drawbutton(buttons[i])
  end
end

function draw()
  while true do

    event, side, xPos, yPos = os.pullEvent("monitor_touch")

    for i = 1, #buttons, 1 do
      if xPos >= buttons[i].x and xPos <= buttons[i].x + buttons[i].w - 1 and
        yPos >= buttons[i].y and yPos <= buttons[i].y + buttons[i].h - 1 then
        buttons[i].onClick()
      end
    end

    redraw()
  end
end


buttons = {}

button = {}
button.id = 1
button.text = "Farm On"
button.x = 2
button.y = 2
button.w = sizeX-2
button.h = sizeY/2-2
button.onClick = handleFarmOnClicked
button.color = colors.green

button2 = {}
button2.id = 2
button2.text = "Farm Off"
button2.x = 2
button2.y = sizeY/2 +2
button2.w = sizeX-2
button2.h = sizeY/2-2
button2.onClick = handleFarmOffClicked
button2.color = colors.red

buttons[button.id] = button
buttons[button2.id] = button2

isFanActive=false
isLightActive=true

redraw()

while true do
  draw()
end
