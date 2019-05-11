--This code creates a red marker on the ground. The first part creates a loop that runs constantly and the second part draws the marker every time the loop runs. To place on ground subtract 0.9 from the Z value you get when getting the player's coordinates.

xmarker = 213.4899
ymarker = -854.364
zmarker = 29.5

CreateThread(function()
	while true do
		-- draw every frame
		Wait(0)

		DrawMarker(1, xmarker, ymarker, zmarker, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 500.0, 255, 0, 0, 50, false, true, 2, nil, nil, false)
	end
end)
