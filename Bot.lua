local discordiaModule = require('discordia')
local Client = discordiaModule.Client()
local pr = "!"
local start = false
local maxwarns = 4
local warns = {}

Client:on('ready', function()
	local channel = Client:getChannel('459817720150491149')
  channel:send('Bot Updated')
end)

Client:on('memberJoin', function (mem)

end)

Client:on('memberLeave', function (mem)
	
end)

function checker(msg, stuff, i)
	local plr = stuff:sub(#pr+6, #stuff)
			print(i.id)
		local memb = msg.guild:getMember(i.id)
		if i.name:sub(1, #plr) == plr and msg.member.highestRole.name > memb.highestRole.name then
			return true
		end
end


Client:on('messageCreate', function(msg)
	local channel = Client:getChannel('459817720150491149')
	local stuff = msg.content
	print(msg.author.id)
	if msg.member.highestRole.name >= "Co-Owner" then
	if stuff:sub(1,#pr+4) == pr.."warn" then
		for _, i in pairs(Client.users) do
		local checked = checker(msg, stuff, i)
		if checked then
		table.insert(warns, i.name)
			local amm = maxwarns
			for _, o in pairs(warns) do
				if o == i.name then
					amm = amm - 1
				end
				if amm <= 0 then
					local mem = msg.guild:getMember(i.id)
					mem.guild:kickUser(mem.user, "Warned Multiple times")
				end
			end
		msg.channel:send(i.name.." You have been warned!  "..amm.." more warning(s) and you will be kicked from server")
		end
	end
		elseif stuff:sub(1,#pr+4) == pr.."kick" then
			for _, i in pairs(Client.users) do
			local checked = checker(msg, stuff, i)
			if checked then
				local mem = msg.guild:getMember(i.id)
				mem.guild:kickUser(mem.user, "Behavior")
			end
	end
	end
end
	
	print(msg.member.highestRole.name)
	print(#Client.users)
end)

Client:run("Bot NDYwOTkzNjk0NTI3NjUxODQy.DhNZ6A.679IZl1xHrmO394p0bJZVzC2Qnc")