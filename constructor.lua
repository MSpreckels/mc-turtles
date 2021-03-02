if turtle.getFuelLevel() < 1 then
  turtle.select(16)
  turtle.refuel(1)
end

turtle.up()
turtle.select(2)
turtle.place()
turtle.select(3)
turtle.drop()
turtle.down()
turtle.select(1)
turtle.place()