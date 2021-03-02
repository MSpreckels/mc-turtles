if turtle.getFuelLevel() < 1 then
  turtle.select(16)
  turtle.refuel(1)
end

turtle.up()
turtle.select(14)
turtle.place()
turtle.select(15)
turtle.drop()
turtle.down()
turtle.select(1)
turtle.place()

turtle.up()
turtle.select(15)
turtle.suck()
turtle.select(14)
turtle.dig()
turtle.down()