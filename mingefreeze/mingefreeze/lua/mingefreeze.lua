-----[[----------------------
--      Minge-Freeze
--          By
--   Rainbow & Berkark
--  Hybrid Gaming Servers
--        2017
-- MIT License is in effect 2017.
-- Please read Valve ToS and Steam ToS for licensing.
-- If you wish to edit this script please seek permission first.
-- -- Hybrid Gaming Network 2017.
----------------]]-----------

function FGod( ply, dmginfo )
    if(ply:GetNWInt("FGod") == 1) then
        dmginfo:ScaleDamage( 0 )
    end
end
hook.Add("EntityTakeDamage", "FGod", FGod)
 
hook.Add("PhysgunDrop", "ply_physgunfreeze", function(pl, ent)
    hook.Remove( "PhysgunDrop", "ulxPlayerDrop" )
    hook.Remove( "PhysgunDrop", "FAdmin_PickUpPlayers" )
   
    ent._physgunned = false
   
if( ent:IsPlayer() )then                          
                ent:SetMoveType(pl:KeyDown(IN_ATTACK2) and MOVETYPE_NOCLIP or MOVETYPE_WALK)
       
        if(pl:KeyDown(IN_ATTACK2)) then
            ent:Freeze(true)
            ent:SetNWInt("FGod", 1)
            if !timer.Exists("freeze"..ent:SteamID()) then
                print(pl:Name().."<"..pl:SteamID().."> has frozen "..ent:Name().."<"..ent:SteamID()..">")
                timer.Create( "freeze"..ent:SteamID(), 1, 1, function() end )                
            end
        elseif ent:GetNWInt("FGod") == 1 then
            ent:Freeze(false)
            ent:SetNWInt("FGod", 0)
            if !timer.Exists("unfreeze"..ent:SteamID()) then
                print(pl:Name().."<"..pl:SteamID().."> has un-frozen "..ent:Name().."<"..ent:SteamID()..">")
                timer.Create( "unfreeze"..ent:SteamID(), 1, 1, function() end )
            end
        end
           
        if SERVER then
           
            if !ent:Alive() then
                ent:Spawn()
                self:PlayerSpawn(ent)
                ent:SetPos(pl:GetEyeTrace().HitPos)
            end
        end
       
        return --self.BaseClass:PhysgunDrop( pl , ent )  
    end
end)
 
hook.Add( "PhysgunPickup", "ply_physgunned", function(pl, ent)
    ent._physgunned = true
end)
 
function playerDies( pl, weapon, killer )
    return pl:GetNWInt("FGod") == 0
end
hook.Add( "CanPlayerSuicide", "playerNoDeath", playerDies )
 
hook.Add("PlayerSwitchWeapon","Teststst",function(ply)
    return ply:GetNWInt("FGod") == 1
end)