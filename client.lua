--This function /xyz returns the coordinates the player is currently occupying.

RegisterCommand("xyz", function(source, args, rawCommand)
    coords = GetEntityCoords(PlayerPedId())
	TriggerEvent("chatMessage", "coordinates are " .. coords)
end)
