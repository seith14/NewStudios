const Discord = require('Discordia');
const client = new Discord.Client();
const discordiaModule = require('Discordia')
const Client = discordiaModule.Client()
const pr = "!"
const start = false
const maxwarns = 4
const warns = {}

Client:on('messageCreate', function(msg)
	const channel = Client:getChannel('459817720150491149')
	const stuff = msg.content
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
			loacl checked = checker(msg, stuff, i)
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

// THIS  MUST  BE  THIS  WAY
client.login(process.env.BOT_TOKEN);
