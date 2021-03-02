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

  for i = 1, amount, 1 do
    turtle.select(1)
    turtle.place()
  end
 
  turtle.up()
  turtle.select(15)
  turtle.suck()
  turtle.select(14)
  turtle.dig()
  turtle.down()
end

construct(10)