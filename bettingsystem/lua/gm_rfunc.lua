
if SERVER then
	GM = GM or GAMEMODE
	LOTTERY_CAN_BET = LOTTERY_CAN_BET or false

	function GM:OnPreRoundStart(num)

		game.CleanUpMap()
		
		-- Swap teams only if this isn't the first round and the setting is enabled.
		if GetGlobalInt("RoundNumber") != 1 && SWAP_TEAMS_EVERY_ROUND == 1 && (team.GetScore(TEAM_PROPS) + team.GetScore(TEAM_HUNTERS)) > 0 then
		
			for _, pl in pairs(player.GetAll()) do
			
				if pl:Team() == TEAM_PROPS || pl:Team() == TEAM_HUNTERS then
				
					if pl:Team() == TEAM_PROPS then
					
						pl:SetTeam(TEAM_HUNTERS)
						
					else
					
						pl:SetTeam(TEAM_PROPS)
						
					end
					
					-- Let everyone know.
					pl:ChatPrint("Teams have been swapped!")				

				end
				
			end
			
			LOTTERY_CAN_BET = true
			for _, ply in pairs(player.GetAll())do
				ply:resetBets()
			end
			BroadcastLua('chat.AddText(Color(0,0,255), "[HybridBet] ", Color(0,255,0), "Place your bets now! use ", Color(255,255,255), "!bet", Color(0,255,0), " to place your bet! You have ", Color(255,255,255), "'..LOTTERY_TIME..'", Color(0,255,0), " seconds for this.")')

			if timer.Exists('CANBET') then timer.Remove('CANBET') end

			timer.Create('CANBET', LOTTERY_TIME, 1, function()
			--timer.Simple(LOTTERY_TIME, function()
				LOTTERY_CAN_BET = false
				BroadcastLua('chat.AddText(Color(0,0,255), "[HybridBet] ", Color(255,0,0), "'..LOTTERY_BET_BETISCLOSE..'")')
			end)
			SetGlobalInt( "BetNotifyTime", LOTTERY_BET_HUDTIME )
			if timer.Exists('BetNotifyTime') then timer.Remove('BetNotifyTime') end
			timer.Create('BetNotifyTime', 1, LOTTERY_BET_HUDTIME, function() SetGlobalInt( "BetNotifyTime", GetGlobalInt( "BetNotifyTime" ) - 1 ) end)
		end
		
		-- Reset players.
		UTIL_StripAllPlayers()
		UTIL_SpawnAllPlayers()
		UTIL_FreezeAllPlayers()		
	end

	function GM:OnRoundEnd( num )
		local teams = GAMEMODE:GetTeamAliveCounts()
		local team_id = table.GetFirstKey(teams)
		for _, ply in pairs(player.GetAll())do
			local tem 
			local bet = 0
			--if (ply:GetNWString('BetTeam') == nil) or (ply:GetNWInt('Bet') == nil) or (ply:GetNWInt('Bet') == 0) then continue end
			if ((ply:GetNWString('THunter') == nil) and (ply:GetNWString('TProps') == nil)) or (((ply:GetNWInt('HBet') == nil) or (ply:GetNWInt('HBet') == 0)) and ((ply:GetNWInt('PBet') == nil) or (ply:GetNWInt('PBet') == 0))  )then continue end
			if (ply:GetNWString('THunter') == team.GetName(team_id)) and (ply:GetNWInt('HBet') > 0) then bet = bet + ply:GetNWInt('HBet') end
			--print(bet)
			if (ply:GetNWString('TProps') == team.GetName(team_id)) and (ply:GetNWInt('PBet') > 0) then bet = bet + ply:GetNWInt('PBet') end
			--print(bet)
			if bet <= 0 then ply:SendLua('chat.AddText(Color(0,0,255), "[Melon] ", Color(255,0,0), "'..LOTTERY_BET_BETISLOSE..'")') ply:resetBets() continue end

			ply:SendLua('chat.AddText(Color(73,204,108), "[Melon] ", Color(0,255,0), "'..LOTTERY_BET_ISWIN..'")')
			ply:SendLua('chat.AddText(Color(73,204,108), "[Melon] ", Color(0,255,0), "'..LOTTERY_BET_WINBET..' ", Color(255,255,255), "'..(bet*LOTTERY_BET_COEFFICIENT)..' points")')
			ply:PS_GivePoints(bet*LOTTERY_BET_COEFFICIENT)
			ply:SendLua('LocalPlayer():EmitSound('..LOTTERY_BET_WIN..')')

			ply:resetBets()
		end
	end

	function GM:PreRoundStart( iNum )

		-- Should the game end?
		if( CurTime() >= GAMEMODE.GetTimeLimit() || GAMEMODE:HasReachedRoundLimit( iNum ) ) then
			--GAMEMODE:EndOfGame( true );
			--GAMEMODE:RoundEnd()
			--return;
		end
		
		if ( !GAMEMODE:CanStartRound( iNum ) ) then
		
			timer.Simple( 1, function() GAMEMODE:PreRoundStart( iNum ) end ) -- In a second, check to see if we can start
			return;
			
		end

		timer.Simple( GAMEMODE.RoundPreStartTime, function() GAMEMODE:RoundStart() end )
		SetGlobalInt( "RoundNumber", iNum )
		SetGlobalFloat( "RoundStartTime", CurTime() + GAMEMODE.RoundPreStartTime )
		
		GAMEMODE:ClearRoundResult()
		GAMEMODE:OnPreRoundStart( GetGlobalInt( "RoundNumber" ) )
		GAMEMODE:SetInRound( true )

	end
end
