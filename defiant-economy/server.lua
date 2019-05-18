--This function will format numbers to include commas. (ie 1,000 instead of 1000)
function format_int(number)

  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')

  -- reverse the int-string and append a comma to all blocks of 3 digits
  int = int:reverse():gsub("(%d%d%d)", "%1,")

  -- reverse the int-string back remove an optional comma and put the 
  -- optional minus and fractional part back
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

--This function sets the initial amount of cash in the player's wallet
RegisterCommand("setcash", function(source, args)
    local argString = table.concat(args, " ")
    MySQL.Async.fetchAll("INSERT INTO economy (id, cash) VALUES(@source, @args)",     
    
	{
	["@source"] = GetPlayerIdentifiers(source)[1],
	["@args"] = argString},
        function (result)
        TriggerClientEvent("output", source, "^2".. argString.. "^0")

    end)
end)

--This function changes the amount of cash in the player's wallet.
RegisterCommand("changecash", function(source, args)
    local argString = table.concat(args, " ")
    	
	MySQL.Sync.execute('UPDATE economy SET cash = @args WHERE id = @source',
				{
					['@source']       = GetPlayerIdentifiers(source)[1],
					['@args'] = argString
				})
	end)

--This function adds the amount of cash in the argument from the player's wallet.
RegisterCommand("addcash", function(source, args)
    local argString = table.concat(args, " ")
    	
	MySQL.Sync.execute('UPDATE economy SET cash = cash + @args WHERE id = @source',
				{
					['@source']       = GetPlayerIdentifiers(source)[1],
					['@args'] = argString
				})
	end)

--This function subtracts the amount of cash in the argument from the player's wallet.
RegisterCommand("subtractcash", function(source, args)
    local argString = table.concat(args, " ")
    	
	MySQL.Sync.execute('UPDATE economy SET cash = cash - @args WHERE id = @source',
				{
					['@source']       = GetPlayerIdentifiers(source)[1],
					['@args'] = argString
				})
	end)
	
RegisterCommand("cash", function(source, args) 
    local argString = table.concat(args, " ")
    MySQL.Async.fetchAll("SELECT * FROM economy ORDER BY id DESC LIMIT 1",{}, 
    function(result)
			
		
		TriggerClientEvent("output", source, "Your current cash balance is: ^2$^0"..format_int(result[1].cash))  
    end)    
end)
