row = 1
rowCount = 6

turtle.refuel()

while true do
	local hasBlock, blockData = turtle.inspect()
	if hasBlock and blockData.tags["minecraft:logs"] then
		-- found a tree, start chopping
		turtle.dig()
		turtle.forward()

		-- trees should always be at least two log blocks tall
		local isLogAbove = true
		while isLogAbove == true do
			local isBlockAbove, aboveData = turtle.inspectUp()
			if isBlockAbove and aboveData.tags["minecraft:logs"] then
				turtle.digUp()
				turtle.up()
			else
				isLogAbove = false
			end
		end

		-- descend from the top of the tree
		local isBlockBelow = false
		while not isBlockBelow  do
			turtle.down()
			isBlockBelow, _ = turtle.inspectDown()
		end
	elseif hasBlock then
		-- avoid saplings
		local isAbove, aboveData = turtle.inspectUp()
		if isAbove and aboveData.tags["minecraft:leaves"] then
			turtle.digUp()
		elseif isAbove then
			print("Non-leaf block above! Exiting..")
			os.shutdown()
		end
		turtle.up()
		turtle.forward()
		turtle.forward()
		turtle.down()
	else
		turtle.forward()
		local isBlockBelow, _ = turtle.inspectDown()
		if not isBlockBelow then
			if row % 2 ~= 0 then turtle.turnLeft() else turtle.turnRight() end
			turtle.forward()
			turtle.forward()
			turtle.forward()
			turtle.forward()
			if row % 2 ~= 0 then turtle.turnLeft() else turtle.turnRight() end
			row = row + 1
		end
	end
end