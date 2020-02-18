--[[
              ______                    __                ____      ______ 
.-----.-----.|      |.----.---.-.-----.|  |--.    .--.--.|_   |    |      |
|     |  _  ||   ---||   _|  _  |__ --||     |    |  |  | _|  |_ __|  --  |
|__|__|_____||______||__| |___._|_____||__|__|     \___/ |______|__|______|
                                                                           
 SERVERSIDE SCRIPT - AVAILABLE ON GITHUB - MADE BY MrBrumble

This script will stop cunt players trying to exploit 
 the advanced duplicator to crash/lag your server.
 When a player attempts this, it will notify the entire server
 and the player themselves; then kick them.
]]



util.AddNetworkString( "0nocrash0-0alert0" ) -- declares the network string
hook.Add( "CanTool", "AdvDupeCheck.CanTool", function( ply, tr, tool )
local dupetab =
(tool == 'adv_duplicator' and ply:GetActiveWeapon():GetToolObject().Entities) or
(tool == 'advdupe2' and ply.AdvDupe2 and ply.AdvDupe2.Entities) or
(tool == 'duplicator' and ply.CurrentDupe and ply.CurrentDupe.Entities)
if dupetab then
for k, v in pairs(dupetab) do
if !v.ModelScale then return end
if v.ModelScale > 10 then
net.Start("0nocrash0-0alert0") -- starts the network message when someone triggers the exploit.
net.Send(ply) -- sends the exploit to the player that tried to crash the server
-- You can add serverside code within the following ---------------------------------------------------------------------------------------------
print("[NOCRASH]".. ply:Nick().. " "..ply:SteamID().." Tried to crash the server!.") -- prints that a player tried to do the exploit
ply:Kick("Please don't attempt to crash our server")
-- Add code here for example 'ply:Kick("Don't crash our server.")' to kick the player or 'ply:Kill()' to kill the player
--------------------------------------------------------------------------------------------------------------------------------------
return false -- removing this line will allow players to spawn the dupe, but it will spawn normally withot causing any harm.
-- do not add more code after this line.
end
v.ModelScale = 1
end
end
end)
print("NoCrash Loaded - By MrBrumble)
