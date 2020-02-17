local txt, win, ply, bet
local winNotice = 0
function drawBetStat()
	if (GetGlobalInt( "BetNotifyTime" ) > 0) then
		win = (LocalPlayer():GetNWInt('HBet') + LocalPlayer():GetNWInt('PBet')) * LOTTERY_BET_COEFFICIENT
		txt = 'HUNTERS: '..tostring(LocalPlayer():GetNWInt('HBet'))..' POINTS | PROPS: '..tostring(LocalPlayer():GetNWInt('PBet'))..' POINTS | TOTAL WIN: '..win..' POINTS'
		local w,h = surface.GetTextSize(txt)
		--draw.WordBox(5, ScrW()/2-w/2, 50, txt, 'Trebuchet24', Color(0,0,0,150), Color(244, 188, 66))
		--draw.RoundedBox(8, ScrW()/2-w/2-10, 30, w+20, 26, Color(0, 0, 0, 75))
		draw.DrawText(txt, "Trebuchet24", ScrW()/2, 7, Color(255, 174, 0), TEXT_ALIGN_CENTER)
		draw.DrawText(txt, "Trebuchet24", ScrW()/2+1, 7+1, Color(255, 174, 0), TEXT_ALIGN_CENTER)
	end

	if (winNotice == 1) then
		txt = ply:Nick().." won the lottery "..bet.." points!"
		draw.DrawText(txt, "Trebuchet24", ScrW()/2, 51, Color(255, 174, 0), TEXT_ALIGN_CENTER)
		draw.DrawText(txt, "Trebuchet24", ScrW()/2+1, 51+1, Color(255, 174, 0), TEXT_ALIGN_CENTER)
	end
end

hook.Add("HUDPaint", 'draw_bet_info', drawBetStat)

net.Receive('new_lottery', function()
	local ply = net.ReadEntity()
	local bet = net.ReadInt(32)

	chat.AddText(Color(73,204,108),"[HybridBet] ", Color(0,255,0), "Player ",Color(255,255,255), ply:Nick(), Color(0,255,0), "Started a lottery! Current Prize: ", Color(255,255,255), tostring(bet), Color(0,255,0)," points")
	LocalPlayer():EmitSound(LOTTERY_LOT_START)
end)

net.Receive('win_lottery', function()
	ply = net.ReadEntity()
	bet = net.ReadInt(32)

	winNotice = 1
	LocalPlayer():EmitSound(LOTTERY_LOT_WIN)
	timer.Simple(3, function()
		winNotice = 0
	end)
end)