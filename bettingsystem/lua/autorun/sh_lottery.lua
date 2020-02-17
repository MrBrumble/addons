hook.Add('PostGamemodeLoaded', 'load_lot_modules', function()
	if SERVER then
		AddCSLuaFile('lottery_config.lua')
		AddCSLuaFile('cl_lfunctions.lua')

		include('lottery_config.lua')
		include('gm_rfunc.lua')
		include('sv_lfunctions.lua')
	else
		include('lottery_config.lua')
		include('cl_lfunctions.lua')
	end
end)