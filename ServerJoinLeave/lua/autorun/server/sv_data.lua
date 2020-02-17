hook.Add("PlayerInitialSpawn","lastjoin",function(pl, ply) 
	local lastjoin = pl:GetPData("lastjoined") 
	if lastjoin == nil then
		for _,ply in next,player.GetHumans() do 
			ply:PlayerMsg(Color(80,251,80),"● ",Color(255,255,255),pl:Nick().."("..pl:SteamID()..")".." has ",Color(80, 251, 80),"joined ",Color(255,255,255),"for the first time welcome!")--ply:ChatPrint(ply:Nick().."("..ply:SteamID()..")".."has joined for the first time welcome!") 
		end
	elseif lastjoin then
		for _,ply in next,player.GetHumans() do
		ply:PlayerMsg(Color(80, 251, 80),"● ",Color(255,255,255),pl:Nick().."("..pl:SteamID()..")".." has ",Color(80, 251, 80),"joined\n",Color(80, 80, 80),"● ",Color(255,255,255),"Last seen "..lastjoin)--ply:ChatPrint(ply:Nick().."("..ply:SteamID()..")".." has joined\nLast seen "..lastjoin)
		end
	end
end)

hook.Add("PlayerDisconnected","lastjoinsave",function(pl, ply)
		pl:SetPData("lastjoined",os.date("%d/%m/%Y %I:%M%p", os.time()))
	for _,ply in next,player.GetHumans() do 
		ply:PlayerMsg(Color(255, 51, 51, 255),"● ",Color(255,255,255),pl:Nick().."("..pl:SteamID()..")".." has ",Color(255, 51, 51, 255),"left ",Color(255,255,255),"the server.")
	end
end)
