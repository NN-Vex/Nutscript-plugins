PLUGIN.name = "Flag commands"
PLUGIN.desc = "Adds commands for lower-staff to have the ability to give certain flags, without having permission to /flaggive."
PLUGIN.author = "Vex#5074"

--[[The purpose of this is to give server owners the ability to allow lower-staff to give certain flags without having access to/flaggive. This can prevent of abuse, or whatever.]]

-- Rank tables, make sure they're the same as the ranks in your cami file.
local daccess = { 
    moderator = true,
    administrator = true,
    senioradmin = true,
    supervisoryadministrator = true,
    headadmin = true,
    servermanager = true,
    founder = true,
}

local management = {
    founder = true,
    servermanager = true,
    headadmin = true,
}

local ua = {
    founder =true,
    servermanager = true,
    headadmin = true,
    supervisoryadministrator = true,
    senioradmin = true,
}

nut.command.add("flagbank", {
    syntax = "<string name>",
    onRun = function(client, arguments)
		local checkUG = client:GetUserGroup() -- gets the clients usergroup
		if(!lowerRanks[checkUG]) then -- checks if the clients rank is in the rank table using checkUG
			client:notify("Your rank is not high enough to use this command.")
			return false -- 
		end
        local target = nut.command.findPlayer(client, arguments[1])
        target:getChar():giveFlags("y")
    end
})

nut.command.add("flagloan", {
    syntax = "<string name>",
    onRun = function(client, arguments)
		local checkUG = client:GetUserGroup()
		if(!lowerRanks[checkUG]) then
			client:notify("Your rank is not high enough to use this command.")
			return false
		end
        local target = nut.command.findPlayer(client, arguments[1])
        target:getChar():giveFlags("l")
		client:notifyLocalized("You have given " .. arguments[1] .. " Loan Flags")
		target:notifyLocalized("You have been given Loan flags by " .. client:Name())
    end
})

nut.command.add("flagmedal", {
    syntax = "<string name>",
    onRun = function(client, arguments)
		local checkUG = client:GetUserGroup()
		if(!lowerRanks[checkUG]) then
			client:notify("Your rank is not high enough to use this command.")
			return false
		end
        local target = nut.command.findPlayer(client, arguments[1])
        target:getChar():giveFlags("m")
		client:notifyLocalized("You have given " .. arguments[1] .. " Medal Flags")
		target:notifyLocalized("You have been given Medal flags by " .. client:Name())

    end
})
    
nut.command.add("flagragdoll", {
    syntax = "<string name>",
    onRun = function(client, arguments)
		local checkUG = client:GetUserGroup()
		if(!lowerRanks[checkUG]) then
			client:notify("Your rank is not high enough to use this command.")
			return false
		end
        local target = nut.command.findPlayer(client, arguments[1])
        target:getChar():giveFlags("r")
		client:notifyLocalized("You have given " .. arguments[1] .. " Ragdoll Flags")
		target:notifyLocalized("You have been given Ragdoll flags by " .. client:Name())
    end
})
