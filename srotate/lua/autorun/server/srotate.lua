
  --    		      __________        __          __          
--  			 _____\______   \ _____/  |______ _/  |_  ____  
 --				/  ___/|       _//  _ \   __\__  \\   __\/ __ \ 
-- 				\___ \ |    |   (  <_> )  |  / __ \|  | \  ___/ 
--				/____  >|____|_  /\____/|__| (____  /__|  \___  >
 --  				  \/        \/                 \/          \/ 
--								Developed by MrBrumble
--								Copyright 2020.
--					MIT License in effect; use this code but give credit.


-- Where it says SEE NOTE ABOVE, please insert your community name, the name of your server that you DON'T want to change on refresh.
-- Anything else after the comma WILL be rotated randomly with a title in the table below.
-- For example "Community name - " anything after the - will be rotated in the table.
-- By all means change ANY titles in the table below you want to, or add more if you choose to.
-- The text AFTER the BaseServerName will change every time you refresh the server list.
-- Put this in lua/autorun/server/ and restart your server.


local BaseServerName = "SEE NOTE ABOVE " -- keep something short so it fits well in server search

    local Server_Names = { -- all the names the server wwill cycle through
        "WEABU SERVER GAVE ME AIDS",
        "Sandbox is gay",
        "Adminz will bann you!",
        "I WIL DDOX U BOI",
        "if you play on here then youre a god",
        "nemesis more like bunch of 9 year olds",
        "lithe was made by rice",
        "cracked by hne",
        "trols computer name is del",
        "no proof no ban",
        "why are you reading this? ",
        "tell your friends",
        "hey bro im spooky bitch",
        "virustotal is bullshit",
        "trol renamed indigo",
        "spooky is a fanboy of everything",
        "toggle is 1",
        "wtf is cake anti cheat?",
        "spooky isnt spooky",
        "nya renamed latemod",
        "disco party more like deluge rename",
        "exile squad, ha! Eggsiles",
        "this server is cancer",
        "fuck the adminz",
        "prop hunt is gay af",
        "VALVE WILL BAN THIS SERVER!",
        "Join this server is you want aids",
        "Weeb Hunt 9000!",
        "Faggots!",
        "I iz facepunch i banni you!",
    }

    local function ChangeName()

        local cmd = table.Random(Server_Names)
        local txt = BaseServerName..cmd
        RunConsoleCommand("hostname",txt)

    end

    hook.Add("Think","NameChanger",ChangeName)
