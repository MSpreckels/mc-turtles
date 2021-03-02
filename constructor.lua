function construct(amount)
  if turtle.getFuelLevel() < 12 then
    turtle.select(16)
    turtle.refuel(1)
  end
  
  turtle.up()
  turtle.select(14)
  turtle.place()
  turtle.select(15)
  turtle.drop()
  turtle.down()

  for i = 1, amount do
    turtle.select(1)
    turtle.place()
    turtle.dig()
  end
 
  turtle.up()
  turtle.select(15)
  turtle.suck()
  turtle.select(14)
  turtle.dig()
  turtle.down()
end

construct(10)