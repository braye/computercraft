turtle.refuel()

-- assumes turtle is in center block of 3x3
function dig3x3()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.digDown()

	turtle.turnLeft()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.digDown()

	turtle.turnRight()
	turtle.turnRight()
	
	turtle.forward()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.digDown()

	turtle.turnLeft()
	turtle.turnLeft()
	turtle.forward()
	turtle.turnRight()
end