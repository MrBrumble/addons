util.AddNetworkString('new_lottery')
util.AddNetworkString('win_lottery')

local meta = FindMetaTable('Player')

function meta:resetBets()
	self:SetNWString('THunter', '')
	self:SetNWInt('HBet', 0)
	self:SetNWString('TProps', '')
	self:SetNWInt('PBet', 0)
end

function BetCommand(pl, txt)
	local args = string.Explode(' ', txt)
	if table.HasValue(LOTTERY_BET_COMMANDS, args[1]) then
		if !LOTTERY_CAN_BET then pl:ChatPrint("Sorry! betting is now closed") return '' end
		
		local bet = tonumber(args[3])
		local tem = args[2]
		--if ((pl:GetNWInt('Bet') != nil) and (pl:GetNWString('BetTeam') != nil )) and (pl:GetNWInt('Bet') != 0) then pl:SendLua('chat.AddText(Color(0,255,0), "[BET] ", Color(255,0,0), "'..LOTTERY_BET_ISHAVE..'")') return '' end
		if (tem == nil) or (tem == '') or (tem == ' ') or (isnumber(tem)) then pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(255,0,0), "'..LOTTERY_BET_ERRORINSYNTAX..'")') return '' end
		if (bet == nil) or (bet == '') or (bet == ' ') or (!isnumber(bet)) then pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(255,0,0), "'..LOTTERY_BET_ERRORINSYNTAX..'")') return '' end
		if (player.GetCount() < LOTTERY_BET_ONLINE) and (!table.HasValue(LOTTERY_MAIN_ADMINS, pl:GetUserGroup())) then pl:SendLua('chat.AddText(73,204,108), "[HybridBet] ", Color(255,0,0), "'..LOTTERY_MAIN_LOWONLINE..'", " '..tostring(LOTTERY_BET_ONLINE)..'")') return '' end
		if (string.lower(tem) != string.lower(LOTTERY_HUNTER)) and (string.lower(tem) != string.lower(LOTTERY_PROPS)) then pl:SendLua('chat.AddText(Color(73,204,108), "[Melon] ", Color(255,0,0), "'..LOTTERY_BET_AVIABLETEAMS..' ", Color(255,255,255), "'..LOTTERY_HUNTER..'", ", ", "'..LOTTERY_PROPS..'")') return '' end

		if (bet < LOTTERY_BET_MIN) or (bet > LOTTERY_BET_MAX) then pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(255,0,0), "Min bet: ", Color(255,255,255), "'..tostring(LOTTERY_BET_MIN)..' points; ", Color(255,0,0), "Max bet: ", Color(255,255,255), "'..tostring(LOTTERY_BET_MAX)..' points")') return '' end
		if !pl:PS_HasPoints(bet) then pl:SendLua('chat.AddText(Color(73,204,108), "[Melon] ", Color(255,0,0), "'..LOTTERY_BET_NOTENOUGHT..'")') return '' end

		if string.lower(tem) == string.lower(LOTTERY_HUNTER) then
			pl:SetNWString('THunter', LOTTERY_HUNTER)
			pl:SetNWInt('HBet', pl:GetNWInt('HBet') + bet)
			--print("HUNTERs bet!")
		else
			pl:SetNWString('TProps', LOTTERY_PROPS)
			pl:SetNWInt('PBet', pl:GetNWInt('PBet') + bet)
			--print("PROPS bet!")
		end

		pl:PS_TakePoints(bet)

		pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(0,255,0), "Your bet was placed successfully! ", Color(255,255,255), "'..bet..' points", Color(0,255,0), " on ", Color(255,255,255), "'..tem..'" )')

		return ''
	end

	if table.HasValue(LOTTERY_COMMANDS, args[1]) then
		local bet = tonumber(args[2])

		if (bet == nil) or (bet == ' ') or (bet == '') then pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(255,0,0), "'..LOTTERY_LOT_ERRORINSYNTAX..'")') return '' end
		if (pl:GetPData('lastLot') != nil) and (tonumber(pl:GetPData('lastLot')) > os.time()) then pl:SetNWInt('lastLot', tonumber(pl:GetPData('lastLot'))) pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(255,0,0), "Need to wait ",Color(255,255,255), "'..tostring(pl:GetNWInt('lastLot')-os.time())..'", Color(255,0,0)," sec.")') return '' end
		if (player.GetCount() < LOTTERY_LOT_ONLINE) and (!table.HasValue(LOTTERY_MAIN_ADMINS, pl:GetUserGroup())) then pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(255,0,0), "'..LOTTERY_MAIN_LOWONLINE..'", " '..tostring(LOTTERY_LOT_ONLINE)..'")') return '' end
		if (bet < LOTTERY_LOT_MIN) then pl:SendLua('chat.AddText(Color((73,204,108), "[HybridBet] ", Color(255,0,0), "Min amount:", Color(255,255,255), "'..LOTTERY_LOT_MIN..'", Color(255,0,0), " points")') return '' end
		if !pl:PS_HasPoints(bet) then pl:SendLua('chat.AddText(Color(73,204,108), "[Melon] ", Color(255,0,0), "'..LOTTERY_BET_NOTENOUGHT..'")') return '' end

		pl:PS_TakePoints(bet)

		pl:SetPData('lastLot', os.time()+LOTTERY_LOT_COOLDOWN)
		pl:SetNWInt('lastLot', tonumber(pl:GetPData('lastLot')))

		pl:SendLua('chat.AddText(Color(73,204,108), "[HybridBet] ", Color(0,255,0), "'..LOTTERY_LOT_SUCMSG..'")')

		net.Start('new_lottery')
			net.WriteEntity(pl)
			net.WriteInt(bet,32)
		net.Send(player.GetAll())

		timer.Simple(LOTTERY_LOT_TIME, function()
			local ply = table.Random(player.GetAll())
			--PrintMessage( HUD_PRINTCENTER, ply:Nick().." won the lottery "..bet.." points!" )
			net.Start('win_lottery')
				net.WriteEntity(ply)
				net.WriteInt(bet,32)
			net.Send(player.GetAll())
			ply:PS_GivePoints(bet)
		end)

		return ''
	end
end

hook.Add('PlayerSay', 'bet_cmd', BetCommand )
