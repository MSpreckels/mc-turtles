local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
monitor.setTextScale(0.5)
local sizeX, sizeY = monitor.getSize()

function init()
  if isFanActive then
    redstone.setAnalogOutput("right", 1)
  elseif not isFanActive then
    redstone.setAnalogOutput("right", 0)
  end

  if isLightActive then
    redstone.setAnalogOutput("left", 1)
  elseif not isLightActive then
    redstone.setAnalogOutput("left", 0)
  end

  redraw()
end

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

function handleOnFanButtonClicked()

  if isFanActive then
    isFanActive = false
    redstone.setAnalogOutput("right", 0)
    speaker.playNote("bell", 1, 0)

  elseif not isFanActive then
    isFanActive = true
    redstone.setAnalogOutput("right", 1)
    speaker.playNote("bell", 1, 6)

  end
end

function handleOnLightButtonClicked()

  if isLightActive then
    isLightActive = false
    redstone.setAnalogOutput("left", 0)
    speaker.playNote("bell", 1, 0)

  elseif not isLightActive then
    isLightActive = true
    redstone.setAnalogOutput("left", 1)
    speaker.playNote("bell", 1, 6)

  end
end

function redraw()
  monitor.setBackgroundColor(colors.black)
  monitor.clear()

  drawbutton(isFanActive and buttons[2] or buttons[1])
  drawbutton(isLightActive and buttons[4] or buttons[3])
end

buttons = {}

fanButtonOn = {}
fanButtonOn.id = 1
fanButtonOn.text = "Fans On"
fanButtonOn.x = 2
fanButtonOn.y = 2
fanButtonOn.w = sizeX-2
fanButtonOn.h = sizeY/2-2
fanButtonOn.onClick = handleOnFanButtonClicked
fanButtonOn.color = colors.green

fanButtonOff = {}
fanButtonOff.id = 2
fanButtonOff.text = "Fans Off"
fanButtonOff.x = 2
fanButtonOff.y = 2
fanButtonOff.w = sizeX-2
fanButtonOff.h = sizeY/2-2
fanButtonOff.onClick = handleOnFanButtonClicked
fanButtonOff.color = colors.red

lightButtonOn = {}
lightButtonOn.id = 3
lightButtonOn.text = "Lights On"
lightButtonOn.x = 2
lightButtonOn.y = sizeY/2 +2
lightButtonOn.w = sizeX-2
lightButtonOn.h = sizeY/2-2
lightButtonOn.onClick = handleOnLightButtonClicked
lightButtonOn.color = colors.green

lightButtonOff = {}
lightButtonOff.id = 4
lightButtonOff.text = "Lights Off"
lightButtonOff.x = 2
lightButtonOff.y = sizeY/2 +2
lightButtonOff.w = sizeX-2
lightButtonOff.h = sizeY/2-2
lightButtonOff.onClick = handleOnLightButtonClicked
lightButtonOff.color = colors.red

buttons[fanButtonOn.id] = fanButtonOn
buttons[fanButtonOff.id] = fanButtonOff
buttons[lightButtonOn.id] = lightButtonOn
buttons[lightButtonOff.id] = lightButtonOff

isFanActive=false
isLightActive=true
local didOnce=false

init()

while true do
  event, side, xPos, yPos = os.pullEvent("monitor_touch")
  didOnce = false

  for i = 1, #buttons, 1 do
    if xPos >= buttons[i].x and xPos <= buttons[i].x + buttons[i].w - 1 and
      yPos >= buttons[i].y and yPos <= buttons[i].y + buttons[i].h - 1 then
      if not didOnce then
        buttons[i].onClick()
        didOnce = true
      end
    end
  end

  redraw()
end