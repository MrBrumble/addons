--[[
              ______                    __                ____      ______ 
.-----.-----.|      |.----.---.-.-----.|  |--.    .--.--.|_   |    |      |
|     |  _  ||   ---||   _|  _  |__ --||     |    |  |  | _|  |_ __|  --  |
|__|__|_____||______||__| |___._|_____||__|__|     \___/ |______|__|______|
                                                                           
                 CLIENTSIDE NOTIFICATION SCRIPT - BY RAINBOW
                      This is available for free on
                              GitHub
                                  -- Developed by Hybrid Networks.
]]


local ply = LocalPlayer()
net.Receive("0nocrash0-0alert0", function() -- Receive notification clientside.
notification.AddLegacy( "[NOCRASH] Exploit Prevented", NOTIFY_ERROR , 5 ) -- The message that will print as a notification in the server
surface.PlaySound( "buttons/button8.wav" ) -- the sound that will play when someone attempts to do the exploit
--you can add clientside code here if you wish so
end)
