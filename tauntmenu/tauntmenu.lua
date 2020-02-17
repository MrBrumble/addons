------[[-----------------------------------

---		Taunt Menu for Prop Hunt
--	 	Created by MrBrumble

-- LICENSE: Absolutely No modifications allowed.

-- FEEL FREE TO ADD ME ON STEAM IF YOU REQUIRE HELP
-- 
-------------------]]-----------------------

--- PLEASE NOTE: I HAVE COMMENTED OUT PAGES 2 THROUGH TO 10 ON EACH TEAM.
--- IF YOU REQUIRE ACCESS TO THESE PAGES PLEASE REMOVE THE /* */ FROM THE START AND END OF PAGE 2 TO 10.
--- I HAVE ALSO ADDED GUIDES BELOW ON HOW TO EDIT THIS SCRIPT.

if ( SERVER )	then 
	local TAUNT_DELAY = 3		//Taunt Delay Variable
	local tauntLength={			//Taunt Length Table, used to prevent taunt spam.
		["taunts/props/1.wav"] = 1, 					//Boom Headshot!
		["taunts/props/2.wav"] = 0,						//Doh!
		["taunts/props/3.wav"] = 3,						//Go away, or I shall taunt you.
		["taunts/props/4.wav"] = 4,						//WoW
		["taunts/props/5.wav"] = 1,						//Negative
		["taunts/props/6.wav"] = 7,						//Over 9000	
		["taunts/props/7.wav"] = 4,						//LEEERROOYY!!
		["taunts/props/8.wav"] = 0,						//Please come again
		["taunts/props/9.wav"] = 2,						//This is Sparta!
		["taunts/props/10.wav"] = 2,					//What is wrong with you?!
		["taunts/props/11.wav"] = 0,					//Woohoo
		["taunts/props/12.wav"] = 4,					//What do you like to play?
		["taunts/props/13.mp3"] = 3,					//I am Cornholio
		["taunts/props/14.wav"] = 3,					//Utorunaga Weeu!
		["taunts/props/15.wav"] = 3, 					//Snooping as Usual?
		["taunts/props/16.wav"] = 20,					//ATATATATATATA!!!
		["taunts/props/17.mp3"] = 10,					//HAHAHA
		["taunts/props/18.wav"] = 1,					//Get on the Ball
		["taunts/props/19.wav"] = 1,					//Horn
		["taunts/props/20.wav"] = 1,					//Are you on the Ball?
		["taunts/props/21.wav"] = 1,					//Only 19.99$
		["taunts/props/22.wav"] = 3,					//Pour or Measure
		["taunts/props/23.wav"] = 1,					//I guarantee it!
		["taunts/props/24.wav"] = 1,					//New Oxyclean
		["taunts/props/25.wav"] = 3,					//So Easy
		["taunts/props/26.wav"] = 1,					//So get on the Ball
		["taunts/props/27.mp3"] = 2,					//Oxyclean Detergent
		["taunts/props/28.wav"] = 2,					//Got Easier
		["taunts/props/29.wav"] = 6, 					//Running in the 90's
		["taunts/props/30.wav"] = 2,					//Forces Eliminated
		["taunts/props/31.mp3"] = 11,					//Bad Boys
		["taunts/props/32.mp3"] = 10,					//Blood Rave
		["taunts/props/33.mp3"] = 7,					//Follow Meee!!
		["taunts/props/34.mp3"] = 3,					//I am the one and only!
		["taunts/props/35.mp3"] = 1,					//Hodor
		["taunts/ill_be_back.wav"] = 1,					//I'll be back
		["taunts/oh_yea_he_will_pay.wav"] = 4,			//Oh yea' he will pay
		["taunts/ok_i_will_tell_you.wav"] = 5,			//Ok I will tell you
		["taunts/threat_neutralized.wav"] = 1,			//Threat Neutralized
		["taunts/you_dont_know_the_power.wav"] = 4,		//You Don't know the power of the dark side
		["taunts/you_underestimate_the_power.wav"] = 3,	//You underestimate the power of the dark side

		To add more lines just do the following:
		["..taunt_source_folder/taunt.mp3"] = #, (replace # with a number which will be the delay).
		Add same amount of lines according the amount of taunts you add.

	}
	
	//Points Table, awards props for taunting according to taunt used.
	local tauntPoint={								//Award Prop Team for taunting with PS Points
		["taunts/props/1.wav"] = 3, 				//Boom Headshot!
		["taunts/props/2.wav"] = 2,					//Doh!
		["taunts/props/3.wav"] = 5,					//Go away, or I shall taunt you.
		["taunts/props/4.wav"] = 5,					//WoW
		["taunts/props/5.wav"] = 2,					//Negative
		["taunts/props/6.wav"] = 5,					//Over 9000	
		["taunts/props/7.wav"] = 4,					//LEEERROOYY!!
		["taunts/props/8.wav"] = 2,					//Please come again
		["taunts/props/9.wav"] = 3,					//This is Sparta!
		["taunts/props/10.wav"] = 3,				//What is wrong with you?!
		["taunts/props/11.wav"] = 2,				//Woohoo
		["taunts/props/12.wav"] = 5,				//What do you like to play?
		["taunts/props/13.mp3"] = 3,				//I am Cornholio
		["taunts/props/14.wav"] = 4,				//Utorunaga Weeu!
		["taunts/props/15.wav"] = 5, 				//Snooping as Usual?
		["taunts/props/16.wav"] = 15,				//ATATATATATATA!!!
		["taunts/props/17.mp3"] = 10,				//HAHAHA
		["taunts/props/18.wav"] = 3,				//Get on the Ball
		["taunts/props/19.wav"] = 2,				//Horn
		["taunts/props/20.wav"] = 3,				//Are you on the Ball?
		["taunts/props/21.wav"] = 5,				//Only 19.99$
		["taunts/props/22.wav"] = 5,				//Pour or Measure
		["taunts/props/23.wav"] = 2,				//I guarantee it!
		["taunts/props/24.wav"] = 3,				//New Oxyclean
		["taunts/props/25.wav"] = 3,				//So Easy
		["taunts/props/26.wav"] = 3,				//So get on the Ball
		["taunts/props/27.mp3"] = 3,				//Oxyclean Detergent
		["taunts/props/28.wav"] = 3,				//Got Easier
		["taunts/props/29.wav"] = 20, 				//Running in the 90's
		["taunts/props/30.wav"] = 5,				//Forces Eliminated
		["taunts/props/31.mp3"] = 12,				//Bad Boys
		["taunts/props/32.mp3"] = 10,				//Blood Rave
		["taunts/props/33.mp3"] = 11,				//Follow Meee!!
		["taunts/props/34.mp3"] = 5,				//I am the one and only!
		["taunts/props/35.mp3"] = 3,				//Hodor
		["taunts/ill_be_back.wav"] = 3,				//I'll be back
		["taunts/oh_yea_he_will_pay.wav"] = 5,		//Oh yea' he will pay
		["taunts/ok_i_will_tell_you.wav"] = 7,		//Ok I will tell you
		["taunts/threat_neutralized.wav"] = 3,		//Threat Neutralized
		["taunts/you_dont_know_the_power.wav"] = 5,	//You Don't know the power of the dark side
		["taunts/you_underestimate_the_power.wav"] = 7,//You underestimate the power of the dark side	
	}

	util.AddNetworkString("send_taunt")
	net.Receive( "send_taunt", function( _, ply )
		local taunt = net.ReadString()
		local curTime = CurTime()
		if curTime - ( ply.LastTaunt or 0 ) >= TAUNT_DELAY then
			ply.LastTaunt = CurTime() + tauntLength[taunt]
			ply:EmitSound(taunt,150)
			if ply:Team() == 2 then //checks if player on Team Props
				ply:PS_GivePoints((tauntPoint)[taunt], "You've been awarded for taunting")
			    if ply:Team() == 2 then 	
				   ply:PS_Notify('You earned points for taunting!')	// Awards Point Shop Points according to the taunt used.
				end   
		    end
		end
	end )

--------------[[-----
-- For pointshop 1 please use the following code.
-- Copy all code from lines 123 to 137 REPLACE the code at line 105 to 116
-- For pointshop 2 please do not edit the above code
------------]]--------------

-- 	util.AddNetworkString("send_taunt")
--	net.Receive( "send_taunt", function( _, ply )
--		local taunt = net.ReadString()
--		local curTime = CurTime()
--		if curTime - ( ply.LastTaunt or 0 ) >= TAUNT_DELAY then
--			ply.LastTaunt = CurTime() + tauntLength[taunt]
--			ply:EmitSound(taunt,150)
--			if ply:Team() == 2 then //checks if player on Team Props
--				ply:PS_GivePoints((tauntPoint)[taunt], "You've been awarded for taunting")
--			    if ply:Team() == 2 then 	
--				   ply:PS_Notify('You earned points for taunting!')	// Awards Point Shop Points according to the taunt used.
--				end   
--			end
--		end
--	end )
-------------------]]-----


if ( CLIENT ) then
	timer.Create("TauntMenuUse",180,0, function()
											chat.AddText(Color(214,0,0),"[Taunt Menu]", Color(0,225,126)," To open the menu press C or F4")//Chat message for player, every 3 minutes.
										end)
													//To change button color look for "surface.SetDrawColor(19, 105, 153)" in the code, works as "surface.SetDrawrColor(R, G, B)" (R=Red, G=Green, B=Blue)
	local MenuColor			=	Color(10,39,55)		//Color(R, G, B, A) = Set Menu background color.
	local ButtonTextColor	=	Color(255,255,255)	//Color(R, G, B, A)	= Set button text color.
	local pl				=	LocalPlayer();		//Assign pl as LocalPlayer().
	---- CHANGE THE 0's BELOW TO 1 TO ENABLE PAGES.
	-- IF YOU HAVE 3 PAGES OF TAUNTS THEN ONLY CHANGE OPEN, 2 AND 3 to a 1.
	-- ALL ZEROS WILL DISABLE THAT PAGE.
	pl.MenuOpen				=	1;					//Set for player MenuOpen to 0 by default.
	
	pl.MenuPage2			=	1;					//Set for player MenuPage3 to 0 by default
	pl.MenuPage3			=	1;					//Set for player MenuPage3 to 0 by default
	pl.MenuPage4			=	1;					//Set for player MenuPage4 to 0 by default
	pl.MenuPage5			=	1;					//Set for player MenuPage5 to 0 by default
	pl.MenuPage6			=	1;					//Set for player MenuPage6 to 0 by default
	pl.MenuPage7			=	1;					//Set for player MenuPage7 to 0 by default
	pl.MenuPage8			=	1;					//Set for player MenuPage8 to 0 by default
	pl.MenuPage9			=	1;					//Set for player MenuPage9 to 0 by default
	pl.MenuPage10			=	1;					//Set for player MenuPage10 to 0 by default
	
	
	pl.hMenuPage2			=	1;					//Set for player hMenuPage2 to 0 by default					
	pl.hMenuPage3			=	1;					//Set for player hMenuPage3 to 0 by default	
	pl.hMenuPage4			=	1;					//Set for player hMenuPage4 to 0 by default	
	pl.hMenuPage5			=	1;					//Set for player hMenuPage5 to 0 by default	
	pl.hMenuPage6			=	1;					//Set for player MenuPage6 to 0 by default
	pl.hMenuPage7			=	1;					//Set for player MenuPage7 to 0 by default
	pl.hMenuPage8			=	1;					//Set for player MenuPage8 to 0 by default
	pl.hMenuPage9			=	1;					//Set for player MenuPage9 to 0 by default
	pl.hMenuPage10			=	1;					//Set for player MenuPage10 to 0 by default
	
	--- ADD ALL OF YOUR TAUNT DESCRIPTIONS BELOW.
	--- THIS WILL ADD TEXT TO BUTTONS ON THE MENU
	local propButton={								//What text each button has on Prop Team.
		//Page 1
		p1_B1	=	"Doh!",
		p1_B2	=	"Go away, or I shall taunt you.",
		p1_B3	=	"WoW",
		p1_B4	=	"Over 9000",
		p1_B5	=	"LEEERROOYY!!",
		p1_B6	=	"Please come again",
		p1_B7	=	"This is Sparta!",
		p1_B8	=	"What is wrong with you!?",
		p1_B9	=	"Woohoo",
		p1_B10	=	"What do you like to play?",
		p1_B11	=	"I am Cornholio!",
		p1_B12	=	"Utorunaga Weeu!",
		p1_B13	=	"Snooping as Usual?",
		p1_B14	=	"ATATATATATATA!!!",
		//Page 2
		p2_B1	=	"HAHAHA",
		p2_B2	=	"Get on the Ball",
		p2_B3	=	"Horn",
		p2_B4	=	"Are you on the Ball?",
		p2_B5	=	"Only 19.99$",
		p2_B6	=	"Pour or Measure",
		p2_B7	=	"I guarantee it!",
		p2_B8	=	"New Oxyclean",
		p2_B9	=	"So Easy",
		p2_B10	=	"So get on the Ball",
		p2_B11	=	"Oxyclean Detergent",
		p2_B12	=	"Got Easier",
		p2_B13	=	"Running in the 90's",
		p2_B14	=	"Blood Rave",
		//Page 3
		p3_B1	=	"Follow Meee!!",
		p3_B2	=	"I am the one and only!",
		p3_B3	=	"AoE 2 Healer",
		p3_B4	=	"I will be back",
		p3_B5	=	"Okay I will tell you",
		p3_B6	=	"You don't know the power",
		p3_B7	=	"You underestimate the power",
		p3_B8	=	"New Taunt",
		p3_B9	=	"",
		p3_B10	=	"",
		p3_B11	=	"",
		p3_B12	=	"",
		p3_B13	=	"",
		p3_B14	=	"",
		//Page 4
		p4_B1	=	"",
		p4_B2	=	"",
		p4_B3	=	"",
		p4_B4	=	"",
		p4_B5	=	"",
		p4_B6	=	"",
		p4_B7	=	"",
		p4_B8	=	"",
		p4_B9	=	"",
		p4_B10	=	"",
		p4_B11	=	"",
		p4_B12	=	"",
		p4_B13	=	"",
		p4_B14	=	"",
		//Page 5
		p5_B1	=	"",
		p5_B2	=	"",
		p5_B3	=	"",
		p5_B4	=	"",
		p5_B5	=	"",
		p5_B6	=	"",
		p5_B7	=	"",
		p5_B8	=	"",
		p5_B9	=	"",
		p5_B10	=	"",
		p5_B11	=	"",
		p5_B12	=	"",
		p5_B13	=	"",
		p5_B14	=	"",
		//Page 6
		p6_B1	=	"",
		p6_B2	=	"",
		p6_B3	=	"",
		p6_B4	=	"",
		p6_B5	=	"",
		p6_B6	=	"",
		p6_B7	=	"",
		p6_B8	=	"",
		p6_B9	=	"",
		p6_B10	=	"",
		p6_B11	=	"",
		p6_B12	=	"",
		p6_B13	=	"",
		p6_B14	=	"",
		//Page 7
		p7_B1	=	"",
		p7_B2	=	"",
		p7_B3	=	"",
		p7_B4	=	"",
		p7_B5	=	"",
		p7_B6	=	"",
		p7_B7	=	"",
		p7_B8	=	"",
		p7_B9	=	"",
		p7_B10	=	"",
		p7_B11	=	"",
		p7_B12	=	"",
		p7_B13	=	"",
		p7_B14	=	"",
		//Page 8
		p8_B1	=	"",
		p8_B2	=	"",
		p8_B3	=	"",
		p8_B4	=	"",
		p8_B5	=	"",
		p8_B6	=	"",
		p8_B7	=	"",
		p8_B8	=	"",
		p8_B9	=	"",
		p8_B10	=	"",
		p8_B11	=	"",
		p8_B12	=	"",
		p8_B13	=	"",
		p8_B14	=	"",
		//Page 9
		p9_B1	=	"",
		p9_B2	=	"",
		p9_B3	=	"",
		p9_B4	=	"",
		p9_B5	=	"",
		p9_B6	=	"",
		p9_B7	=	"",
		p9_B8	=	"",
		p9_B9	=	"",
		p9_B10	=	"",
		p9_B11	=	"",
		p9_B12	=	"",
		p9_B13	=	"",
		p9_B14	=	"",
		//Page 10
		p10_B1	=	"",
		p10_B2	=	"",
		p10_B3	=	"",
		p10_B4	=	"",
		p10_B5	=	"",
		p10_B6	=	"",
		p10_B7	=	"",
		p10_B8	=	"",
		p10_B9	=	"",
		p10_B10	=	"",
		p10_B11	=	"",
		p10_B12	=	"",
		p10_B13	=	"",
		p10_B14	=	"",
	}

	local propWString={								//Prop net.WriteString(text) that is sent to server side.
		p1_B1	=	"taunts/props/2.wav",
		p1_B2	=	"taunts/props/3.wav",
		p1_B3	=	"taunts/props/4.wav",
		p1_B4	=	"taunts/props/6.wav",
		p1_B5	=	"taunts/props/7.wav",
		p1_B6	=	"taunts/props/8.wav",
		p1_B7	=	"taunts/props/9.wav",
		p1_B8	=	"taunts/props/10.wav",
		p1_B9	=	"taunts/props/11.wav",
		p1_B10	=	"taunts/props/12.wav",
		p1_B11	=	"taunts/props/13.mp3",
		p1_B12	=	"taunts/props/14.wav",
		p1_B13	=	"taunts/props/15.wav",
		p1_B14	=	"taunts/props/16.wav",
		//Page 2
		p2_B1	=	"taunts/props/17.mp3",
		p2_B2	=	"taunts/props/18.wav",
		p2_B3	=	"taunts/props/19.wav",
		p2_B4	=	"taunts/props/20.wav",
		p2_B5	=	"taunts/props/21.wav",
		p2_B6	=	"taunts/props/22.wav",
		p2_B7	=	"taunts/props/23.wav",
		p2_B8	=	"taunts/props/24.wav",
		p2_B9	=	"taunts/props/25.wav",
		p2_B10	=	"taunts/props/26.wav",
		p2_B11	=	"taunts/props/27.wav",
		p2_B12	=	"taunts/props/28.wav",
		p2_B13	=	"taunts/props/29.wav",
		p2_B14	=	"taunts/props/32.mp3",
		//Page 3
		p3_B1	=	"taunts/props/33.mp3",
		p3_B2	=	"taunts/props/34.mp3",
		p3_B3	=	"taunts/props/35.mp3",
		p3_B4	=	"taunts/ill_be_back.wav",
		p3_B5	=	"taunts/ok_i_will_tell_you.wav",
		p3_B6	=	"taunts/you_dont_know_the_power.wav",
		p3_B7	=	"taunts/you_underestimate_the_power.wav",
		p3_B8	=	"taunts/filename.mp3",
		p3_B9	=	"",
		p3_B10	=	"",
		p3_B11	=	"",
		p3_B12	=	"", 
		p3_B13	=	"",
		p3_B14	=	"",
		//Page 4
		p4_B1	=	"",
		p4_B2	=	"",
		p4_B3	=	"",
		p4_B4	=	"",
		p4_B5	=	"",
		p4_B6	=	"",
		p4_B7	=	"",
		p4_B8	=	"",
		p4_B9	=	"",
		p4_B10	=	"",
		p4_B11	=	"",
		p4_B12	=	"", 
		p4_B13	=	"",
		p4_B14	=	"",
		//Page 5
		p5_B1	=	"",
		p5_B2	=	"",
		p5_B3	=	"",
		p5_B4	=	"",
		p5_B5	=	"",
		p5_B6	=	"",
		p5_B7	=	"",
		p5_B8	=	"",
		p5_B9	=	"",
		p5_B10	=	"",
		p5_B11	=	"",
		p5_B12	=	"", 
		p5_B13	=	"",
		p5_B14	=	"",
		//Page 6
		p6_B1	=	"",
		p6_B2	=	"",
		p6_B3	=	"",
		p6_B4	=	"",
		p6_B5	=	"",
		p6_B6	=	"",
		p6_B7	=	"",
		p6_B8	=	"",
		p6_B9	=	"",
		p6_B10	=	"",
		p6_B11	=	"",
		p6_B12	=	"",
		p6_B13	=	"",
		p6_B14	=	"",
		//Page 7
		p7_B1	=	"",
		p7_B2	=	"",
		p7_B3	=	"",
		p7_B4	=	"",
		p7_B5	=	"",
		p7_B6	=	"",
		p7_B7	=	"",
		p7_B8	=	"",
		p7_B9	=	"",
		p7_B10	=	"",
		p7_B11	=	"",
		p7_B12	=	"",
		p7_B13	=	"",
		p7_B14	=	"",
		//Page 8
		p8_B1	=	"",
		p8_B2	=	"",
		p8_B3	=	"",
		p8_B4	=	"",
		p8_B5	=	"",
		p8_B6	=	"",
		p8_B7	=	"",
		p8_B8	=	"",
		p8_B9	=	"",
		p8_B10	=	"",
		p8_B11	=	"",
		p8_B12	=	"",
		p8_B13	=	"",
		p8_B14	=	"",
		//Page 9
		p9_B1	=	"",
		p9_B2	=	"",
		p9_B3	=	"",
		p9_B4	=	"",
		p9_B5	=	"",
		p9_B6	=	"",
		p9_B7	=	"",
		p9_B8	=	"",
		p9_B9	=	"",
		p9_B10	=	"",
		p9_B11	=	"",
		p9_B12	=	"",
		p9_B13	=	"",
		p9_B14	=	"",
		//Page 10
		p10_B1	=	"",
		p10_B2	=	"",
		p10_B3	=	"",
		p10_B4	=	"",
		p10_B5	=	"",
		p10_B6	=	"",
		p10_B7	=	"",
		p10_B8	=	"",
		p10_B9	=	"",
		p10_B10	=	"",
		p10_B11	=	"",
		p10_B12	=	"",
		p10_B13	=	"",
		p10_B14	=	"",
	}
	
	local hunterButton={							//What text each button has on Hunter Team.
		//Page 1
		h1_B1	=	"Boom Headshot!",
		h1_B2	=	"Doh!",
		h1_B3	=	"WoW",
		h1_B4	=	"Negative",
		h1_B5	=	"Please come again",
		h1_B6	=	"This is Sparta!",
		h1_B7	=	"What is wrong with you!?",
		h1_B8	=	"Woohoo",
		h1_B9	=	"What do you like to play?",
		h1_B10	=	"Utorunaga Weeu!",
		h1_B11	=	"ATATATATATATA!!!",
		h1_B12	=	"HAHAHA",
		h1_B13	=	"Running in the 90's",
		h1_B14	=	"Force Eliminated",
		//Page 2
		h2_B1	=	"Bad Boys",
		h2_B2	=	"Follow Meee!!",
		h2_B3	=	"I will be back",
		h2_B4	=	"Oh yea he will pay!",
		h2_B5	=	"Threat Neutralized",
		h2_B6	=	"You don't know the power",
		h2_B7	=	"You underestimate the power",
		h2_B8	=	"",
		h2_B9	=	"",
		h2_B10	=	"",
		h2_B11	=	"",
		h2_B12	=	"",
		h2_B13	=	"",
		h2_B14	=	"",
		//Page 3
		h3_B1	=	"",
		h3_B2	=	"",
		h3_B3	=	"",
		h3_B4	=	"",
		h3_B5	=	"",
		h3_B6	=	"",
		h3_B7	=	"",
		h3_B8	=	"",
		h3_B9	=	"",
		h3_B10	=	"",
		h3_B11	=	"",
		h3_B12	=	"",
		h3_B13	=	"",
		h3_B14	=	"",
		//Page 4
		h4_B1	=	"",
		h4_B2	=	"",
		h4_B3	=	"",
		h4_B4	=	"",
		h4_B5	=	"",
		h4_B6	=	"",
		h4_B7	=	"",
		h4_B8	=	"",
		h4_B9	=	"",
		h4_B10	=	"",
		h4_B11	=	"",
		h4_B12	=	"",
		h4_B13	=	"",
		h4_B14	=	"",
		//Page 5
		h5_B1	=	"",
		h5_B2	=	"",
		h5_B3	=	"",
		h5_B4	=	"",
		h5_B5	=	"",
		h5_B6	=	"",
		h5_B7	=	"",
		h5_B8	=	"",
		h5_B9	=	"",
		h5_B10	=	"",
		h5_B11	=	"",
		h5_B12	=	"",
		h5_B13	=	"",
		h5_B14	=	"",
		//Page 6
		h6_B1	=	"",
		h6_B2	=	"",
		h6_B3	=	"",
		h6_B4	=	"",
		h6_B5	=	"",
		h6_B6	=	"",
		h6_B7	=	"",
		h6_B8	=	"",
		h6_B9	=	"",
		h6_B10	=	"",
		h6_B11	=	"",
		h6_B12	=	"",
		h6_B13	=	"",
		h6_B14	=	"",
		//Page 7
		h7_B1	=	"",
		h7_B2	=	"",
		h7_B3	=	"",
		h7_B4	=	"",
		h7_B5	=	"",
		h7_B6	=	"",
		h7_B7	=	"",
		h7_B8	=	"",
		h7_B9	=	"",
		h7_B10	=	"",
		h7_B11	=	"",
		h7_B12	=	"",
		h7_B13	=	"",
		h7_B14	=	"",
		//Page 8
		h8_B1	=	"",
		h8_B2	=	"",
		h8_B3	=	"",
		h8_B4	=	"",
		h8_B5	=	"",
		h8_B6	=	"",
		h8_B7	=	"",
		h8_B8	=	"",
		h8_B9	=	"",
		h8_B10	=	"",
		h8_B11	=	"",
		h8_B12	=	"",
		h8_B13	=	"",
		h8_B14	=	"",
		//Page 9
		h9_B1	=	"",
		h9_B2	=	"",
		h9_B3	=	"",
		h9_B4	=	"",
		h9_B5	=	"",
		h9_B6	=	"",
		h9_B7	=	"",
		h9_B8	=	"",
		h9_B9	=	"",
		h9_B10	=	"",
		h9_B11	=	"",
		h9_B12	=	"",
		h9_B13	=	"",
		h9_B14	=	"",
		//Page 10
		h10_B1	=	"",
		h10_B2	=	"",
		h10_B3	=	"",
		h10_B4	=	"",
		h10_B5	=	"",
		h10_B6	=	"",
		h10_B7	=	"",
		h10_B8	=	"",
		h10_B9	=	"",
		h10_B10	=	"",
		h10_B11	=	"",
		h10_B12	=	"",
		h10_B13	=	"",
		h10_B14	=	"",
	}

	local hunterWString={							//Hunter net.WriteString(text) that is sent to server side.
		//Page 1
		h1_B1	=	"taunts/props/1.wav",
		h1_B2	=	"taunts/props/2.wav",
		h1_B3	=	"taunts/props/4.wav",
		h1_B4	=	"taunts/props/5.wav",
		h1_B5	=	"taunts/props/8.wav",
		h1_B6	=	"taunts/props/9.wav",
		h1_B7	=	"taunts/props/10.wav",
		h1_B8	=	"taunts/props/11.wav",
		h1_B9	=	"taunts/props/12.wav",
		h1_B10	=	"taunts/props/14.wav",
		h1_B11	=	"taunts/props/11.wav",
		h1_B12	=	"taunts/props/16.wav",
		h1_B13	=	"taunts/props/17.mp3",
		h1_B14	=	"taunts/props/29.wav",
		//Page 2
		h2_B1	=	"taunts/props/30.wav",
		h2_B2	=	"taunts/props/31.mp3",
		h2_B3	=	"taunts/props/33.mp3",
		h2_B4	=	"taunts/ill_be_back.wav",
		h2_B5	=	"taunts/oh_yea_he_will_pay.wav",
		h2_B6	=	"taunts/you_dont_know_the_power.wav",
		h2_B7	=	"taunts/you_underestimate_the_power.wav",
		h2_B8	=	"",
		h2_B9	=	"",
		h2_B10	=	"",
		h2_B11	=	"",
		h2_B12	=	"",
		h2_B13	=	"",
		h2_B14	=	"",
		//Page 3
		h3_B1	=	"",
		h3_B2	=	"",
		h3_B3	=	"",
		h3_B4	=	"",
		h3_B5	=	"",
		h3_B6	=	"",
		h3_B7	=	"",
		h3_B8	=	"",
		h3_B9	=	"",
		h3_B10	=	"",
		h3_B11	=	"",
		h3_B12	=	"",
		h3_B13	=	"",
		h3_B14	=	"", 
		//Page 4
		h4_B1	=	"",
		h4_B2	=	"",
		h4_B3	=	"",
		h4_B4	=	"",
		h4_B5	=	"",
		h4_B6	=	"",
		h4_B7	=	"",
		h4_B8	=	"",
		h4_B9	=	"",
		h4_B10	=	"",
		h4_B11	=	"",
		h4_B12	=	"",
		h4_B13	=	"",
		h4_B14	=	"",
		//Page 5
		h5_B1	=	"",
		h5_B2	=	"",
		h5_B3	=	"",
		h5_B4	=	"",
		h5_B5	=	"",
		h5_B6	=	"",
		h5_B7	=	"",
		h5_B8	=	"",
		h5_B9	=	"",
		h5_B10	=	"",
		h5_B11	=	"",
		h5_B12	=	"",
		h5_B13	=	"",
		h5_B14	=	"",
		//Page 6
		h6_B1	=	"",
		h6_B2	=	"",
		h6_B3	=	"",
		h6_B4	=	"",
		h6_B5	=	"",
		h6_B6	=	"",
		h6_B7	=	"",
		h6_B8	=	"",
		h6_B9	=	"",
		h6_B10	=	"",
		h6_B11	=	"",
		h6_B12	=	"",
		h6_B13	=	"",
		h6_B14	=	"",
		//Page 7
		h7_B1	=	"",
		h7_B2	=	"",
		h7_B3	=	"",
		h7_B4	=	"",
		h7_B5	=	"",
		h7_B6	=	"",
		h7_B7	=	"",
		h7_B8	=	"",
		h7_B9	=	"",
		h7_B10	=	"",
		h7_B11	=	"",
		h7_B12	=	"",
		h7_B13	=	"",
		h7_B14	=	"",
		//Page 8
		h8_B1	=	"",
		h8_B2	=	"",
		h8_B3	=	"",
		h8_B4	=	"",
		h8_B5	=	"",
		h8_B6	=	"",
		h8_B7	=	"",
		h8_B8	=	"",
		h8_B9	=	"",
		h8_B10	=	"",
		h8_B11	=	"",
		h8_B12	=	"",
		h8_B13	=	"",
		h8_B14	=	"",
		//Page 9
		h9_B1	=	"",
		h9_B2	=	"",
		h9_B3	=	"",
		h9_B4	=	"",
		h9_B5	=	"",
		h9_B6	=	"",
		h9_B7	=	"",
		h9_B8	=	"",
		h9_B9	=	"",
		h9_B10	=	"",
		h9_B11	=	"",
		h9_B12	=	"",
		h9_B13	=	"",
		h9_B14	=	"",
		//Page 10
		h10_B1	=	"",
		h10_B2	=	"",
		h10_B3	=	"",
		h10_B4	=	"",
		h10_B5	=	"",
		h10_B6	=	"",
		h10_B7	=	"",
		h10_B8	=	"",
		h10_B9	=	"",
		h10_B10	=	"",
		h10_B11	=	"",
		h10_B12	=	"",
		h10_B13	=	"",
		h10_B14	=	"",
	}
	-- FEEL FREE TO REMOVE "[Taunt Menu]", Color(0,225,126)," FROM BELOW. IT WILL REMOVE THE TAUNT MENU LOGO FROM THE 
	-- CHAT MESSAGES
	function IsAlive(pl)							//Checks if player alive & if menu is not open
		if ( pl:Alive() && pl.MenuOpen !=1 ) then 
			hook.Run("TeamCheck",pl)
		else
			if ( pl:Alive() && pl.MenuOpen !=0 ) then 
				chat.AddText(Color(214,0,0),"[Taunt Menu]", Color(0,225,126)," Menu is already open.")//Chat message for player.
			else
				chat.AddText(Color(214,0,0),"[Taunt Menu]", Color(0,225,126)," You are dead, you need to be alive to use this.")//Chat message for player.
			end
		end	
	end
	 
	function TeamCheck(pl)							//Checks player team & opens last visited page by player.
		if pl:Team() == 1 then
			if pl.hMenuPage2==1 then
				hook.Run("phm_h2",pl)
			else
				if pl.hMenuPage3==1 then
					hook.Run("phm_h3",pl)
				else
					if pl.hMenuPage4==1 then
						hook.Run("phm_h4",pl)
					else
						if pl.hMenuPage5==1 then
							hook.Run("phm_h5",pl)
						else
							if pl.hMenuPage6==1 then
								hook.Run("phm_h6",pl);
							else
								if pl.hMenuPage7==1 then 
									hook.Run("phm_h6",pl);
								else
									if pl.hMenuPage7==1 then
										hook.Run("phm_h7",pl)
									else
										if pl.hMenuPage8==1 then
											hook.Run("phm_h8",pl);
										else
											if pl.hMenuPage9==1 then
												hook.Run("phm_h9",pl);
											else
												if pl.hMenuPage10==1 then
													hook.Run("phm_h10",pl);
												else 
													hook.Run("phm_h1",pl)
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
			pl.MenuOpen=1;
		else
			if pl:Team() == 2 then
				if pl.MenuPage2==1 then
					hook.Run("phm_p2",pl)
				else
					if pl.MenuPage3==1 then
						hook.Run("phm_p3",pl)
					else
						if pl.MenuPage4==1 then
							hook.Run("phm_p4",pl)
						else
							if pl.MenuPage5==1 then
								hook.Run("phm_p5",pl)
							else
								if pl.MenuPage6==1 then
									hook.Run("phm_p6",pl);
								else
									if pl.MenuPage7==1 then 
										hook.Run("phm_p7",pl);
									else
										if pl.MenuPage8==1 then
											hook.Run("phm_p8",pl);
										else
											if pl.MenuPage9==1 then
												hook.Run("phm_p9",pl);
											else
												if pl.MenuPage10==1 then
													hook.Run("phm_p10",pl);
												else 
													hook.Run("phm_p1",pl)
												end
											end
										end
									end
								end
							end
						end
					end
				end
				pl.MenuOpen=1;
			else
				chat.AddText(Color(214,0,0),"[Taunt Menu]", Color(0,225,126)," You must be in one of the teams to use the menu.")
			end
		end
	end

	--- I HAVE COMMENTED OUT PAGES 2 THROUGH THE 10 -- PLEASE REMOVE THE --'s FROM THEM TO ENABLE THE PAGES
	
	//Props Team
	function phm_p1(pl)								//Prop Menu Page1
		local p1_base = vgui.Create( "DFrame")//Menu Frame.
			p1_base:SetSize(176, 571) 
			p1_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p1_base:SetTitle("Taunts - Page 1")
			p1_base:SetVisible( true )
			p1_base:SetDeleteOnClose(false)
			p1_base:ShowCloseButton(false)
			p1_base:SetDraggable(false)
			p1_base:MakePopup()
			p1_base:SetKeyBoardInputEnabled(false)
			p1_base:SetMouseInputEnabled(true)
			p1_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p1_base:GetWide(), p1_base:GetTall(), MenuColor )
							end
		local p1_base_bX = vgui.Create( "DButton", p1_base )	//Close Menu Button
			p1_base_bX:SetSize(35, 25)
			p1_base_bX:SetPos(69, 535)
			p1_base_bX:SetText("Close")
			p1_base_bX:SetTextColor(ButtonTextColor)
			p1_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p1_base_bX:GetWide(), p1_base_bX:GetTall() )
									end
			p1_base_bX.DoClick	=	function()
										p1_base:Close()
										pl.MenuOpen=0;
									end
		local p1_base_bNxt = vgui.Create( "DButton", p1_base )	//Next Page Button
			p1_base_bNxt:SetSize(55, 25)
			p1_base_bNxt:SetPos(107, 535)
			p1_base_bNxt:SetText("Next")
			p1_base_bNxt:SetTextColor(ButtonTextColor)
			p1_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p1_base_bNxt:GetWide(), p1_base_bNxt:GetTall() )
									end
			p1_base_bNxt.DoClick =	function()
										p1_base:Close() 
										hook.Run("phm_p2",pl)
									end	
		local b1 = vgui.Create("DButton", p1_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35) 
			b1:SetText(propButton["p1_B1"]) 
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B1"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p1_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p1_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B2"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p1_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p1_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B3"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p1_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p1_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B4"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p1_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p1_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B5"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p1_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p1_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B6"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p1_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p1_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B7"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p1_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p1_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B8"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p1_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p1_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B9"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p1_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p1_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B10"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p1_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p1_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B11"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p1_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p1_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B12"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p1_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p1_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B13"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p1_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p1_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p1_B14"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
	end
	
	function phm_p2(pl)								//Prop Menu Page2
		pl.MenuPage2=1;
		local p2_base = vgui.Create( "DFrame")//Menu Frame
			p2_base:SetSize(176, 571)
			p2_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p2_base:SetTitle("Taunts - Page 2")
			p2_base:SetVisible( true )
			p2_base:SetDeleteOnClose(false)
			p2_base:ShowCloseButton(false)
			p2_base:SetDraggable(false)
			p2_base:MakePopup()
			p2_base:SetKeyBoardInputEnabled(false)
			p2_base:SetMouseInputEnabled(true)
			p2_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p2_base:GetWide(), p2_base:GetTall(), MenuColor )
							end
		local p2_base_bX = vgui.Create( "DButton", p2_base )	//Close Menu Button
			p2_base_bX:SetSize(35, 25)
			p2_base_bX:SetPos(69, 535)
			p2_base_bX:SetText("Close")
			p2_base_bX:SetTextColor(ButtonTextColor)
			p2_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p2_base_bX:GetWide(), p2_base_bX:GetTall() )
									end
			p2_base_bX.DoClick	=	function()
										p2_base:Close()
										pl.MenuOpen=0;
									end
		local p2_base_bPrv = vgui.Create( "DButton", p2_base )	//Previous Page Button
			p2_base_bPrv:SetSize(55, 25)
			p2_base_bPrv:SetPos(12, 535)
			p2_base_bPrv:SetText("Previous")
			p2_base_bPrv:SetTextColor(ButtonTextColor)
			p2_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p2_base_bPrv:GetWide(), p2_base_bPrv:GetTall() )
									end
			p2_base_bPrv.DoClick	=	function()
											p2_base:Close()
											hook.Run("phm_p1",pl)
											pl.MenuPage2=0;
										end
		local p2_base_bNxt = vgui.Create( "DButton", p2_base )	//Next Page Button
			p2_base_bNxt:SetSize(55, 25)
			p2_base_bNxt:SetPos(107, 535)
			p2_base_bNxt:SetText("Next")
			p2_base_bNxt:SetTextColor(ButtonTextColor)
			p2_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p2_base_bNxt:GetWide(), p2_base_bNxt:GetTall() )
									end
			p2_base_bNxt.DoClick	=	function() 
											p2_base:Close()
											hook.Run("phm_p3",pl)
											pl.MenuPage2=0;
										end	
		local b1 = vgui.Create("DButton", p2_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p2_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B1"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p2_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p2_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B2"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p2_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p2_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B3"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p2_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p2_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B4"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p2_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p2_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B5"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p2_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p2_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B6"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p2_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p2_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B7"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p2_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p2_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B8"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p2_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p2_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B9"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p2_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p2_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B10"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p2_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p2_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B11"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p2_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p2_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B12"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p2_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p2_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B13"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p2_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p2_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p2_B14"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
	end
	
	function phm_p3(pl)								//Prop Menu Page3, Next button is commented out. Also some buttons are commented out, not being used.
		pl.MenuPage3=1;
		local p3_base = vgui.Create( "DFrame")//Menu Frame
			p3_base:SetSize(176, 571)
			p3_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p3_base:SetTitle("Taunts - Page 3")
			p3_base:SetVisible( true )
			p3_base:SetDeleteOnClose(false)
			p3_base:ShowCloseButton(false)
			p3_base:SetDraggable(false)
			p3_base:MakePopup()
			p3_base:SetKeyBoardInputEnabled(false)
			p3_base:SetMouseInputEnabled(true)
			p3_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p3_base:GetWide(), p3_base:GetTall(), MenuColor )
							end
		local p3_base_bX = vgui.Create( "DButton", p3_base )	//Close Menu Button
			p3_base_bX:SetSize(35, 25)
			p3_base_bX:SetPos(69, 535)
			p3_base_bX:SetText("Close")
			p3_base_bX:SetTextColor(ButtonTextColor)
			p3_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p3_base_bX:GetWide(), p3_base_bX:GetTall() )
									end
			p3_base_bX.DoClick = function()
									p3_base:Close()
									pl.MenuOpen=0;
								end
		local p3_base_bPrv = vgui.Create( "DButton", p3_base )	//Previous Page Button
			p3_base_bPrv:SetSize(55, 25)
			p3_base_bPrv:SetPos(12, 535)
			p3_base_bPrv:SetText("Previous")
			p3_base_bPrv:SetTextColor(ButtonTextColor)
			p3_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p3_base_bPrv:GetWide(), p3_base_bPrv:GetTall() )
									end
			p3_base_bPrv.DoClick	=	function ()
											p3_base:Close()
											hook.Run("phm_p2",pl)
											pl.MenuPage3=0;
										end
		local p3_base_bNxt = vgui.Create( "DButton", p3_base )	//Next Page Button
			p3_base_bNxt:SetSize(55, 25)
			p3_base_bNxt:SetPos(107, 535)
			p3_base_bNxt:SetText("Next")
			p3_base_bNxt:SetTextColor(ButtonTextColor)
			p3_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p3_base_bNxt:GetWide(), p3_base_bNxt:GetTall() )
									end
			p3_base_bNxt.DoClick	=	function() 
											p3_base:Close()
											hook.Run("phm_p4",pl)
											pl.MenuPage3=0;
										end		
		local b1 = vgui.Create("DButton", p3_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p3_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B1"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p3_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p3_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B2"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p3_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p3_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B3"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p3_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p3_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B4"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p3_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p3_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B5"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p3_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p3_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B6"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p3_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p3_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B7"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p3_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p3_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B8"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p3_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p3_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B9"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p3_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p3_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B10"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p3_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p3_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B11"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p3_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p3_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B12"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p3_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p3_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B13"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p3_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p3_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p3_B14"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end			
	end

	function phm_p4(pl)								//Prop Menu Page4, by default is not accessible.
		pl.MenuPage4=1;
		local p4_base = vgui.Create( "DFrame")//Menu Frame
			p4_base:SetSize(176, 571)
			p4_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p4_base:SetTitle("Taunts - Page 4")
			p4_base:SetVisible( true )
			p4_base:SetDeleteOnClose(false)
			p4_base:ShowCloseButton(false)
			p4_base:SetDraggable(false)
			p4_base:MakePopup()
			p4_base:SetKeyBoardInputEnabled(false)
			p4_base:SetMouseInputEnabled(true)
			p4_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p4_base:GetWide(), p4_base:GetTall(), MenuColor )
							end
		local p4_base_bX = vgui.Create( "DButton", p4_base )	//Close Menu Button
			p4_base_bX:SetSize(35, 25)
			p4_base_bX:SetPos(69, 535)
			p4_base_bX:SetText("Close")
			p4_base_bX:SetTextColor(ButtonTextColor)
			p4_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p4_base_bX:GetWide(), p4_base_bX:GetTall() )
									end
			p4_base_bX.DoClick = function()
									p4_base:Close()
									pl.MenuOpen=0;
								end
		local p4_base_bPrv = vgui.Create( "DButton", p4_base )	//Previous Page Button
			p4_base_bPrv:SetSize(55, 25)
			p4_base_bPrv:SetPos(12, 535)
			p4_base_bPrv:SetText("Previous")
			p4_base_bPrv:SetTextColor(ButtonTextColor)
			p4_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p4_base_bPrv:GetWide(), p4_base_bPrv:GetTall() )
									end
			p4_base_bPrv.DoClick	=	function ()
											p4_base:Close()
											hook.Run("phm_p3",pl)
											pl.MenuPage4=0;
										end
		local p4_base_bNxt = vgui.Create( "DButton", p4_base )	//Next Page Button
			p4_base_bNxt:SetSize(55, 25)
			p4_base_bNxt:SetPos(107, 535)
			p4_base_bNxt:SetText("Next")
			p4_base_bNxt:SetTextColor(ButtonTextColor)
			p4_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p4_base_bNxt:GetWide(), p4_base_bNxt:GetTall() )
									end
			p4_base_bNxt.DoClick = function()
											p4_base:Close()
											hook.Run("phm_p5",pl)
											pl.MenuPage4=0
										end	
		local b1 = vgui.Create("DButton", p4_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p4_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B1"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p4_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p4_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B2"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p4_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p4_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B3"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p4_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p4_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B4"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p4_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p4_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B5"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p4_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p4_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B6"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p4_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p4_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B7"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p4_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p4_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B8"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p4_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p4_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B9"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p4_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p4_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B10"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p4_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p4_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B11"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p4_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p4_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B12"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p4_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p4_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B13"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p4_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p4_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p4_B14"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end			
	end

	function phm_p5(pl)								//Prop Menu Page5, by default is not accessible.
		pl.MenuPage5=1;
		local p5_base = vgui.Create( "DFrame")//Menu Frame
			p5_base:SetSize(176, 571)
			p5_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p5_base:SetTitle("Taunts - Page 5")
			p5_base:SetVisible( true )
			p5_base:SetDeleteOnClose(false)
			p5_base:ShowCloseButton(false)
			p5_base:SetDraggable(false)
			p5_base:MakePopup()
			p5_base:SetKeyBoardInputEnabled(false)
			p5_base:SetMouseInputEnabled(true)
			p5_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p5_base:GetWide(), p5_base:GetTall(), MenuColor )
							end
		local p5_base_bX = vgui.Create( "DButton", p5_base )	//Close Menu Button
			p5_base_bX:SetSize(35, 25)
			p5_base_bX:SetPos(69, 535)
			p5_base_bX:SetText("Close")
			p5_base_bX:SetTextColor(ButtonTextColor)
			p5_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p5_base_bX:GetWide(), p5_base_bX:GetTall() )
									end
			p5_base_bX.DoClick = function()
									p5_base:Close()
									pl.MenuOpen=0;
								end
		local p5_base_bPrv = vgui.Create( "DButton", p5_base )	//Previous Page Button
			p5_base_bPrv:SetSize(55, 25)
			p5_base_bPrv:SetPos(12, 535)
			p5_base_bPrv:SetText("Previous")
			p5_base_bPrv:SetTextColor(ButtonTextColor)
			p5_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p5_base_bPrv:GetWide(), p5_base_bPrv:GetTall() )
									end
			p5_base_bPrv.DoClick	=	function ()
											p5_base:Close()
											hook.Run("phm_p4",pl)
											pl.MenuPage5=0;
										end
		local p5_base_bNxt = vgui.Create( "DButton", p5_base )	//Next Page Button
			p5_base_bNxt:SetSize(55, 25)
			p5_base_bNxt:SetPos(107, 535)
			p5_base_bNxt:SetText("Next")
			p5_base_bNxt:SetTextColor(ButtonTextColor)
			p5_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p5_base_bNxt:GetWide(), p5_base_bNxt:GetTall() )
									end
			p5_base_bNxt.DoClick = function()
											p5_base:Close()
											hook.Run("phm_p6",pl)
											pl.MenuPage5=0;
										end	
		local b1 = vgui.Create("DButton", p5_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p5_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B1"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p5_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p5_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B2"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p5_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p5_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B3"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p5_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p5_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B4"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p5_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p5_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B5"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p5_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p5_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B6"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p5_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p5_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B7"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p5_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p5_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B8"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p5_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p5_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B9"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p5_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p5_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B10"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p5_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p5_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B11"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p5_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p5_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B12"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p5_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p5_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B13"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p5_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p5_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p5_B14"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end			
	end

	function phm_p6(pl)								//Prop Menu Page6, by default is not accessible.
		pl.MenuPage6=1;
		local p6_base = vgui.Create( "DFrame")//Menu Frame
			p6_base:SetSize(176, 571)
			p6_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p6_base:SetTitle("Taunts - Page 6")
			p6_base:SetVisible( true )
			p6_base:SetDeleteOnClose(false)
			p6_base:ShowCloseButton(false)
			p6_base:SetDraggable(false)
			p6_base:MakePopup()
			p6_base:SetKeyBoardInputEnabled(false)
			p6_base:SetMouseInputEnabled(true)
			p6_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p6_base:GetWide(), p6_base:GetTall(), MenuColor )
							end
		local p6_base_bX = vgui.Create( "DButton", p6_base )	//Close Menu Button
			p6_base_bX:SetSize(35, 25)
			p6_base_bX:SetPos(69, 535)
			p6_base_bX:SetText("Close")
			p6_base_bX:SetTextColor(ButtonTextColor)
			p6_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p6_base_bX:GetWide(), p6_base_bX:GetTall() )
									end
			p6_base_bX.DoClick = function()
									p6_base:Close()
									pl.MenuOpen=0;
								end
		local p6_base_bPrv = vgui.Create( "DButton", p6_base )	//Previous Page Button
			p6_base_bPrv:SetSize(55, 25)
			p6_base_bPrv:SetPos(12, 535)
			p6_base_bPrv:SetText("Previous")
			p6_base_bPrv:SetTextColor(ButtonTextColor)
			p6_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p6_base_bPrv:GetWide(), p6_base_bPrv:GetTall() )
									end
			p6_base_bPrv.DoClick	=	function ()
											p6_base:Close()
											hook.Run("phm_p5",pl)
											pl.MenuPage6=0;
										end
		local p6_base_bNxt = vgui.Create( "DButton", p6_base )	//Next Page Button
			p6_base_bNxt:SetSize(55, 25)
			p6_base_bNxt:SetPos(107, 535)
			p6_base_bNxt:SetText("Next")
			p6_base_bNxt:SetTextColor(ButtonTextColor)
			p6_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p6_base_bNxt:GetWide(), p6_base_bNxt:GetTall() )
									end
			p6_base_bNxt.DoClick = function()
											p6_base:Close()
											hook.Run("phm_p7",pl)
											pl.MenuPage6=0;
										end	
		local b1 = vgui.Create("DButton", p6_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p6_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B1"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p6_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p6_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B2"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p6_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p6_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B3"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p6_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p6_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B4"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p6_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p6_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B5"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p6_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p6_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B6"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p6_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p6_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B7"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p6_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p6_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B8"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p6_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p6_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B9"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p6_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p6_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B10"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p6_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p6_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B11"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p6_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p6_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B12"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p6_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p6_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B13"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p6_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p6_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p6_B14"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end			
	end

	function phm_p7(pl)								//Prop Menu Page7, by default is not accessible.
		pl.MenuPage7=1;
		local p7_base = vgui.Create( "DFrame")//Menu Frame
			p7_base:SetSize(176, 571)
			p7_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p7_base:SetTitle("Taunts - Page 7")
			p7_base:SetVisible( true )
			p7_base:SetDeleteOnClose(false)
			p7_base:ShowCloseButton(false)
			p7_base:SetDraggable(false)
			p7_base:MakePopup()
			p7_base:SetKeyBoardInputEnabled(false)
			p7_base:SetMouseInputEnabled(true)
			p7_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p7_base:GetWide(), p7_base:GetTall(), MenuColor )
							end
		local p7_base_bX = vgui.Create( "DButton", p7_base )	//Close Menu Button
			p7_base_bX:SetSize(35, 25)
			p7_base_bX:SetPos(69, 535)
			p7_base_bX:SetText("Close")
			p7_base_bX:SetTextColor(ButtonTextColor)
			p7_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p7_base_bX:GetWide(), p7_base_bX:GetTall() )
									end
			p7_base_bX.DoClick = function()
									p7_base:Close()
									pl.MenuOpen=0;
								end
		local p7_base_bPrv = vgui.Create( "DButton", p7_base )	//Previous Page Button
			p7_base_bPrv:SetSize(55, 25)
			p7_base_bPrv:SetPos(12, 535)
			p7_base_bPrv:SetText("Previous")
			p7_base_bPrv:SetTextColor(ButtonTextColor)
			p7_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p7_base_bPrv:GetWide(), p7_base_bPrv:GetTall() )
									end
			p7_base_bPrv.DoClick	=	function ()
											p7_base:Close()
											hook.Run("phm_p6",pl)
											pl.MenuPage7=0;
										end
		local p7_base_bNxt = vgui.Create( "DButton", p7_base )	//Next Page Button
			p7_base_bNxt:SetSize(55, 25)
			p7_base_bNxt:SetPos(107, 535)
			p7_base_bNxt:SetText("Next")
			p7_base_bNxt:SetTextColor(ButtonTextColor)
			p7_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p7_base_bNxt:GetWide(), p7_base_bNxt:GetTall() )
									end
			p7_base_bNxt.DoClick = function()
											p7_base:Close()
											hook.Run("phm_p8",pl)
											pl.MenuPage7=0;
										end	
		local b1 = vgui.Create("DButton", p7_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p7_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B1"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p7_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p7_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B2"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p7_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p7_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B3"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p7_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p7_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B4"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p7_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p7_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B5"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p7_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p7_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B6"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p7_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p7_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B7"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p7_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p7_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B8"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p7_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p7_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B9"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p7_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p7_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B10"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p7_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p7_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B11"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p7_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p7_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B12"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p7_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p7_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B13"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p7_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p7_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p7_B14"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end			
	end

	function phm_p8(pl)								//Prop Menu Page8, by default is not accessible.
		pl.MenuPage8=1;
		local p8_base = vgui.Create( "DFrame")//Menu Frame
			p8_base:SetSize(176, 571)
			p8_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p8_base:SetTitle("Taunts - Page 8")
			p8_base:SetVisible( true )
			p8_base:SetDeleteOnClose(false)
			p8_base:ShowCloseButton(false)
			p8_base:SetDraggable(false)
			p8_base:MakePopup()
			p8_base:SetKeyBoardInputEnabled(false)
			p8_base:SetMouseInputEnabled(true)
			p8_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p8_base:GetWide(), p8_base:GetTall(), MenuColor )
							end
		local p8_base_bX = vgui.Create( "DButton", p8_base )	//Close Menu Button
			p8_base_bX:SetSize(35, 25)
			p8_base_bX:SetPos(69, 535)
			p8_base_bX:SetText("Close")
			p8_base_bX:SetTextColor(ButtonTextColor)
			p8_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p8_base_bX:GetWide(), p8_base_bX:GetTall() )
									end
			p8_base_bX.DoClick = function()
									p8_base:Close()
									pl.MenuOpen=0;
								end
		local p8_base_bPrv = vgui.Create( "DButton", p8_base )	//Previous Page Button
			p8_base_bPrv:SetSize(55, 25)
			p8_base_bPrv:SetPos(12, 535)
			p8_base_bPrv:SetText("Previous")
			p8_base_bPrv:SetTextColor(ButtonTextColor)
			p8_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p8_base_bPrv:GetWide(), p8_base_bPrv:GetTall() )
									end
			p8_base_bPrv.DoClick	=	function ()
											p8_base:Close()
											hook.Run("phm_p7",pl)
											pl.MenuPage8=0;
										end
		local p8_base_bNxt = vgui.Create( "DButton", p8_base )	//Next Page Button
			p8_base_bNxt:SetSize(55, 25)
			p8_base_bNxt:SetPos(107, 535)
			p8_base_bNxt:SetText("Next")
			p8_base_bNxt:SetTextColor(ButtonTextColor)
			p8_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p8_base_bNxt:GetWide(), p8_base_bNxt:GetTall() )
									end
			p8_base_bNxt.DoClick = function()
											p8_base:Close()
											hook.Run("phm_p9",pl)
											pl.MenuPage8=0;
										end	
		local b1 = vgui.Create("DButton", p8_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p8_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B1"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p8_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p8_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B2"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p8_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p8_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B3"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p8_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p8_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B4"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p8_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p8_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B5"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p8_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p8_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B6"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p8_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p8_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B7"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p8_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p8_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B8"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p8_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p8_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B9"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p8_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p8_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B10"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p8_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p8_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B11"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p8_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p8_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B12"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p8_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p8_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B13"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p8_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p8_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p8_B14"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end			
	end

	function phm_p9(pl)								//Prop Menu Page9, by default is not accessible.
		pl.MenuPage9=1;
		local p9_base = vgui.Create( "DFrame")//Menu Frame
			p9_base:SetSize(176, 571)
			p9_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p9_base:SetTitle("Taunts - Page 9")
			p9_base:SetVisible( true )
			p9_base:SetDeleteOnClose(false)
			p9_base:ShowCloseButton(false)
			p9_base:SetDraggable(false)
			p9_base:MakePopup()
			p9_base:SetKeyBoardInputEnabled(false)
			p9_base:SetMouseInputEnabled(true)
			p9_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p9_base:GetWide(), p9_base:GetTall(), MenuColor )
							end
		local p9_base_bX = vgui.Create( "DButton", p9_base )	//Close Menu Button
			p9_base_bX:SetSize(35, 25)
			p9_base_bX:SetPos(69, 535)
			p9_base_bX:SetText("Close")
			p9_base_bX:SetTextColor(ButtonTextColor)
			p9_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p9_base_bX:GetWide(), p9_base_bX:GetTall() )
									end
			p9_base_bX.DoClick = function()
									p9_base:Close()
									pl.MenuOpen=0;
								end
		local p9_base_bPrv = vgui.Create( "DButton", p9_base )	//Previous Page Button
			p9_base_bPrv:SetSize(55, 25)
			p9_base_bPrv:SetPos(12, 535)
			p9_base_bPrv:SetText("Previous")
			p9_base_bPrv:SetTextColor(ButtonTextColor)
			p9_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p9_base_bPrv:GetWide(), p9_base_bPrv:GetTall() )
									end
			p9_base_bPrv.DoClick	=	function ()
											p9_base:Close()
											hook.Run("phm_p8",pl)
											pl.MenuPage9=0;
										end
		local p9_base_bNxt = vgui.Create( "DButton", p9_base )	//Next Page Button
			p9_base_bNxt:SetSize(55, 25)
			p9_base_bNxt:SetPos(107, 535)
			p9_base_bNxt:SetText("Next")
			p9_base_bNxt:SetTextColor(ButtonTextColor)
			p9_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p9_base_bNxt:GetWide(), p9_base_bNxt:GetTall() )
									end
			p9_base_bNxt.DoClick = function()
											p9_base:Close()
											hook.Run("phm_p10",pl)
											pl.MenuPage9=0;
										end	
		local b1 = vgui.Create("DButton", p9_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p9_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B1"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p9_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p9_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B2"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p9_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p9_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B3"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p9_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p9_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B4"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p9_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p9_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B5"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p9_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p9_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B6"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p9_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p9_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B7"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p9_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p9_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B8"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p9_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p9_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B9"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p9_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p9_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B10"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p9_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p9_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B11"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p9_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p9_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B12"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p9_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p9_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B13"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p9_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p9_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p9_B14"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end			
	end

	function phm_p10(pl)							//Prop Menu Page10, by default is not accessible.
		pl.MenuPage10=1;
		local p10_base = vgui.Create( "DFrame")//Menu Frame
			p10_base:SetSize(176, 571)
			p10_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p10_base:SetTitle("Taunts - Page 10")
			p10_base:SetVisible( true )
			p10_base:SetDeleteOnClose(false)
			p10_base:ShowCloseButton(false)
			p10_base:SetDraggable(false)
			p10_base:MakePopup()
			p10_base:SetKeyBoardInputEnabled(false)
			p10_base:SetMouseInputEnabled(true)
			p10_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p10_base:GetWide(), p10_base:GetTall(), MenuColor )
							end
		local p10_base_bX = vgui.Create( "DButton", p10_base )	//Close Menu Button
			p10_base_bX:SetSize(35, 25)
			p10_base_bX:SetPos(69, 535)
			p10_base_bX:SetText("Close")
			p10_base_bX:SetTextColor(ButtonTextColor)
			p10_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p10_base_bX:GetWide(), p10_base_bX:GetTall() )
									end
			p10_base_bX.DoClick = function()
									p10_base:Close()
									pl.MenuOpen=0;
								end
		local p10_base_bPrv = vgui.Create( "DButton", p10_base )	//Previous Page Button
			p10_base_bPrv:SetSize(55, 25)
			p10_base_bPrv:SetPos(12, 535)
			p10_base_bPrv:SetText("Previous")
			p10_base_bPrv:SetTextColor(ButtonTextColor)
			p10_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p10_base_bPrv:GetWide(), p10_base_bPrv:GetTall() )
									end
			p10_base_bPrv.DoClick	=	function ()
											p10_base:Close()
											hook.Run("phm_p9",pl)
											pl.MenuPage10=0;
										end
		local p10_base_bNxt = vgui.Create( "DButton", p10_base )	//Next Page Button
			p10_base_bNxt:SetSize(55, 25)
			p10_base_bNxt:SetPos(107, 535)
			p10_base_bNxt:SetText("Next")
			p10_base_bNxt:SetTextColor(ButtonTextColor)
			p10_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p10_base_bNxt:GetWide(), p10_base_bNxt:GetTall() )
									end
			p10_base_bNxt.DoClick = function()
											p10_base:Close()
											hook.Run("phm_p11",pl)
											pl.MenuPage10=0;
										end	
		local b1 = vgui.Create("DButton", p10_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(propButton["p10_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B1"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p10_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(propButton["p10_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B2"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p10_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(propButton["p10_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B3"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p10_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(propButton["p10_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B4"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p10_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(propButton["p10_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B5"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p10_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(propButton["p10_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B6"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p10_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(propButton["p10_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B7"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p10_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(propButton["p10_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B8"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p10_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(propButton["p10_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B9"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p10_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(propButton["p10_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B10"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p10_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(propButton["p10_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B11"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p10_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(propButton["p10_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B12"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p10_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(propButton["p10_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B13"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p10_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(propButton["p10_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(propWString["p10_B14"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end			
	end

	//Hunters Team
	function phm_h1(pl)								//Hunter Menu Page1
		local p1_base = vgui.Create( "DFrame")//Menu Frame.
			p1_base:SetSize(176, 571) 
			p1_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p1_base:SetTitle("Taunts - Page 1")
			p1_base:SetVisible( true )
			p1_base:SetDeleteOnClose(false)
			p1_base:ShowCloseButton(false)
			p1_base:SetDraggable(false)
			p1_base:MakePopup()
			p1_base:SetKeyBoardInputEnabled(false)
			p1_base:SetMouseInputEnabled(true)
			p1_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p1_base:GetWide(), p1_base:GetTall(), MenuColor )
							end
		local p1_base_bX = vgui.Create( "DButton", p1_base )	//Close Menu Button
			p1_base_bX:SetSize(35, 25)
			p1_base_bX:SetPos(69, 535)
			p1_base_bX:SetText("Close")
			p1_base_bX:SetTextColor(ButtonTextColor)
			p1_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p1_base_bX:GetWide(), p1_base_bX:GetTall() )
									end
			p1_base_bX.DoClick	=	function()
										p1_base:Close()
										pl.MenuOpen=0;
									end
		local p1_base_bNxt = vgui.Create( "DButton", p1_base )	//Next Page Button
			p1_base_bNxt:SetSize(55, 25)
			p1_base_bNxt:SetPos(107, 535)
			p1_base_bNxt:SetText("Next")
			p1_base_bNxt:SetTextColor(ButtonTextColor)
			p1_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p1_base_bNxt:GetWide(), p1_base_bNxt:GetTall() )
									end
			p1_base_bNxt.DoClick =	function()
										p1_base:Close() 
										hook.Run("phm_h2",pl)
									end	
		local b1 = vgui.Create("DButton", p1_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35) 
			b1:SetText(hunterButton["h1_B1"]) 
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B1"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p1_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h1_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B2"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p1_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h1_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B3"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p1_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h1_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B4"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p1_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h1_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B5"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p1_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h1_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B6"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p1_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h1_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B7"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p1_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h1_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B8"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p1_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h1_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B9"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p1_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h1_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B10"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p1_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h1_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B11"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p1_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h1_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B12"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p1_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h1_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B13"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p1_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h1_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h1_B14"])
								net.SendToServer()
								p1_base:Close() pl.MenuOpen=0;
							end
	end
	
	function phm_h2(pl)								//Hunter Menu Page2, Next button is commented out. Also some buttons are commented out, not being used.
		pl.hMenuPage2=1;
		local p2_base = vgui.Create( "DFrame")//Menu Frame
			p2_base:SetSize(176, 571)
			p2_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p2_base:SetTitle("Taunts - Page 2")
			p2_base:SetVisible( true )
			p2_base:SetDeleteOnClose(false)
			p2_base:ShowCloseButton(false)
			p2_base:SetDraggable(false)
			p2_base:MakePopup()
			p2_base:SetKeyBoardInputEnabled(false)
			p2_base:SetMouseInputEnabled(true)
			p2_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p2_base:GetWide(), p2_base:GetTall(), MenuColor )
							end
		local p2_base_bX = vgui.Create( "DButton", p2_base )	//Close Menu Button
			p2_base_bX:SetSize(35, 25)
			p2_base_bX:SetPos(69, 535)
			p2_base_bX:SetText("Close")
			p2_base_bX:SetTextColor(ButtonTextColor)
			p2_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p2_base_bX:GetWide(), p2_base_bX:GetTall() )
									end
			p2_base_bX.DoClick	=	function()
										p2_base:Close()
										pl.MenuOpen=0;
									end
		local p2_base_bPrv = vgui.Create( "DButton", p2_base )	//Previous Page Button
			p2_base_bPrv:SetSize(55, 25)
			p2_base_bPrv:SetPos(12, 535)
			p2_base_bPrv:SetText("Previous")
			p2_base_bPrv:SetTextColor(ButtonTextColor)
			p2_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p2_base_bPrv:GetWide(), p2_base_bPrv:GetTall() )
									end
			p2_base_bPrv.DoClick	=	function()
											p2_base:Close()
											hook.Run("phm_h1",pl)
											pl.hMenuPage2=0;
										end
		local p2_base_bNxt = vgui.Create( "DButton", p2_base )	//Next Page Button
			p2_base_bNxt:SetSize(55, 25)
			p2_base_bNxt:SetPos(107, 535)
			p2_base_bNxt:SetText("Next")
			p2_base_bNxt:SetTextColor(ButtonTextColor)
			p2_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p2_base_bNxt:GetWide(), p2_base_bNxt:GetTall() )
									end
			p2_base_bNxt.DoClick	=	function() 
											p2_base:Close()
											hook.Run("phm_h3",pl)
											pl.hMenuPage2=0;
										end	
		local b1 = vgui.Create("DButton", p2_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h2_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B1"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p2_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h2_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B2"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p2_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h2_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p2_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h2_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B4"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p2_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h2_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B5"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p2_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h2_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B6"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p2_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h2_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B7"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p2_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h2_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B8"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p2_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h2_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B9"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p2_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h2_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B10"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p2_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h2_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B11"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p2_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h2_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B12"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p2_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h2_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B13"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p2_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h2_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h2_B14"])
								net.SendToServer()
								p2_base:Close() pl.MenuOpen=0;
							end
	end
	
	function phm_h3(pl)								//Hunter Menu Page3, by default is not accessible. 
		pl.hMenuPage3=1;
		local p3_base = vgui.Create( "DFrame")//Menu Frame
			p3_base:SetSize(176, 571)
			p3_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p3_base:SetTitle("Taunts - Page 3")
			p3_base:SetVisible( true )
			p3_base:SetDeleteOnClose(false)
			p3_base:ShowCloseButton(false)
			p3_base:SetDraggable(false)
			p3_base:MakePopup()
			p3_base:SetKeyBoardInputEnabled(false)
			p3_base:SetMouseInputEnabled(true)
			p3_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p3_base:GetWide(), p3_base:GetTall(), MenuColor )
							end
		local p3_base_bX = vgui.Create( "DButton", p3_base )	//Close Menu Button
			p3_base_bX:SetSize(35, 25)
			p3_base_bX:SetPos(69, 535)
			p3_base_bX:SetText("Close")
			p3_base_bX:SetTextColor(ButtonTextColor)
			p3_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p3_base_bX:GetWide(), p3_base_bX:GetTall() )
									end
			p3_base_bX.DoClick = function()
									p3_base:Close()
									pl.MenuOpen=0;
								end
		local p3_base_bPrv = vgui.Create( "DButton", p3_base )	//Previous Page Button
			p3_base_bPrv:SetSize(55, 25)
			p3_base_bPrv:SetPos(12, 535)
			p3_base_bPrv:SetText("Previous")
			p3_base_bPrv:SetTextColor(ButtonTextColor)
			p3_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p3_base_bPrv:GetWide(), p3_base_bPrv:GetTall() )
									end
			p3_base_bPrv.DoClick	=	function ()
											p3_base:Close()
											hook.Run("phm_h2",pl)
											pl.hMenuPage3=0;
										end
		local p3_base_bNxt = vgui.Create( "DButton", p3_base )	//Next Page Button
			p3_base_bNxt:SetSize(55, 25)
			p3_base_bNxt:SetPos(107, 535)
			p3_base_bNxt:SetText("Next")
			p3_base_bNxt:SetTextColor(ButtonTextColor)
			p3_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p3_base_bNxt:GetWide(), p3_base_bNxt:GetTall() )
									end
			p3_base_bNxt.DoClick = function()
											p3_base:Close()
											hook.Run("phm_h4",pl)
											pl.hMenuPage3=0
										end	
		local b1 = vgui.Create("DButton", p3_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h3_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B1"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p3_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h3_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B2"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p3_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h3_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p3_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h3_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B4"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p3_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h3_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B5"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p3_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h3_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B6"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p3_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h3_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B7"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p3_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h3_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B8"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p3_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h3_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B9"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p3_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h3_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B10"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p3_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h3_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B11"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p3_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h3_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b1:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B12"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p3_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h3_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B13"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p3_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h3_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_p3_B14")
									net.WriteString(hunterWString["h3_B14"])
								net.SendToServer()
								p3_base:Close() pl.MenuOpen=0;
							end			
	end
	
	function phm_h4(pl)								//Hunter Menu Page4, by default is not accessible.
		pl.hMenuPage4=1;
		local p4_base = vgui.Create( "DFrame")//Menu Frame
			p4_base:SetSize(176, 571)
			p4_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p4_base:SetTitle("Taunts - Page 4")
			p4_base:SetVisible( true )
			p4_base:SetDeleteOnClose(false)
			p4_base:ShowCloseButton(false)
			p4_base:SetDraggable(false)
			p4_base:MakePopup()
			p4_base:SetKeyBoardInputEnabled(false)
			p4_base:SetMouseInputEnabled(true)
			p4_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p4_base:GetWide(), p4_base:GetTall(), MenuColor )
							end
		local p4_base_bX = vgui.Create( "DButton", p4_base )	//Close Menu Button
			p4_base_bX:SetSize(35, 25)
			p4_base_bX:SetPos(69, 535)
			p4_base_bX:SetText("Close")
			p4_base_bX:SetTextColor(ButtonTextColor)
			p4_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p4_base_bX:GetWide(), p4_base_bX:GetTall() )
									end
			p4_base_bX.DoClick	=	function()
										p4_base:Close()
										pl.MenuOpen=0;
									end
		local p4_base_bPrv = vgui.Create( "DButton", p4_base )	//Previous Page Button
			p4_base_bPrv:SetSize(55, 25)
			p4_base_bPrv:SetPos(12, 535)
			p4_base_bPrv:SetText("Previous")
			p4_base_bPrv:SetTextColor(ButtonTextColor)
			p4_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p4_base_bPrv:GetWide(), p4_base_bPrv:GetTall() )
									end
			p4_base_bPrv.DoClick	=	function()
											p4_base:Close()
											hook.Run("phm_h3",pl)
											pl.hMenuPage4=0;
										end
		local p4_base_bNxt = vgui.Create( "DButton", p4_base )	//Next Page Button
			p4_base_bNxt:SetSize(55, 25)
			p4_base_bNxt:SetPos(107, 535)
			p4_base_bNxt:SetText("Next")
			p4_base_bNxt:SetTextColor(ButtonTextColor)
			p4_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p4_base_bNxt:GetWide(), p4_base_bNxt:GetTall() )
									end
			p4_base_bNxt.DoClick	=	function() 
											p4_base:Close()
											hook.Run("phm_h5",pl)
											pl.hMenuPage4=0;
										end
		local b1 = vgui.Create("DButton", p4_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h4_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B1"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p4_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h4_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B2"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p4_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h4_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p4_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h4_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B4"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p4_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h4_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B5"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p4_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h4_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B6"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p4_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h4_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B7"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p4_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h4_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B8"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p4_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h4_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B9"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p4_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h4_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B10"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p4_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h4_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B11"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p4_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h4_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B12"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p4_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h4_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B13"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p4_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h4_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h4_B14"])
								net.SendToServer()
								p4_base:Close() pl.MenuOpen=0;
							end
	end

	function phm_h5(pl)								//Hunter Menu Page5, by default is not accessible.
		pl.hMenuPage5=1;
		local p5_base = vgui.Create( "DFrame")//Menu Frame
			p5_base:SetSize(176, 571)
			p5_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p5_base:SetTitle("Taunts - Page 5")
			p5_base:SetVisible( true )
			p5_base:SetDeleteOnClose(false)
			p5_base:ShowCloseButton(false)
			p5_base:SetDraggable(false)
			p5_base:MakePopup()
			p5_base:SetKeyBoardInputEnabled(false)
			p5_base:SetMouseInputEnabled(true)
			p5_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p5_base:GetWide(), p5_base:GetTall(), MenuColor )
							end
		local p5_base_bX = vgui.Create( "DButton", p5_base )	//Close Menu Button
			p5_base_bX:SetSize(35, 25)
			p5_base_bX:SetPos(69, 535)
			p5_base_bX:SetText("Close")
			p5_base_bX:SetTextColor(ButtonTextColor)
			p5_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p5_base_bX:GetWide(), p5_base_bX:GetTall() )
									end
			p5_base_bX.DoClick	=	function()
										p5_base:Close()
										pl.MenuOpen=0;
									end
		local p5_base_bPrv = vgui.Create( "DButton", p5_base )	//Previous Page Button
			p5_base_bPrv:SetSize(55, 25)
			p5_base_bPrv:SetPos(12, 535)
			p5_base_bPrv:SetText("Previous")
			p5_base_bPrv:SetTextColor(ButtonTextColor)
			p5_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p5_base_bPrv:GetWide(), p5_base_bPrv:GetTall() )
									end
			p5_base_bPrv.DoClick	=	function()
											p5_base:Close()
											hook.Run("phm_h4",pl)
											pl.hMenuPage5=0;
										end
		local p5_base_bNxt = vgui.Create( "DButton", p5_base )	//Next Page Button, disabled by default (there's no 6th page so no use for it).
			p5_base_bNxt:SetSize(55, 25)
			p5_base_bNxt:SetPos(107, 535)
			p5_base_bNxt:SetText("Next")
			p5_base_bNxt:SetTextColor(ButtonTextColor)
			p5_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p5_base_bNxt:GetWide(), p5_base_bNxt:GetTall() )
									end
			p5_base_bNxt.DoClick	=	function() 
											p5_base:Close()
											hook.Run("phm_h6",pl)
											pl.hMenuPage5=0;
										end
		local b1 = vgui.Create("DButton", p5_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h5_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B1"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p5_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h5_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B2"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p5_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h5_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p5_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h5_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B4"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p5_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h5_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B5"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p5_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h5_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B6"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p5_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h5_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B7"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p5_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h5_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B8"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p5_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h5_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B9"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p5_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h5_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B10"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p5_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h5_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B11"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p5_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h5_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B12"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p5_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h5_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B13"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p5_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h5_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h5_B14"])
								net.SendToServer()
								p5_base:Close() pl.MenuOpen=0;
							end
	end

	function phm_h6(pl)								//Hunter Menu Page6, by default is not accessible.
		pl.hMenuPage6=1;
		local p6_base = vgui.Create( "DFrame")//Menu Frame
			p6_base:SetSize(176, 571)
			p6_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p6_base:SetTitle("Taunts - Page 6")
			p6_base:SetVisible( true )
			p6_base:SetDeleteOnClose(false)
			p6_base:ShowCloseButton(false)
			p6_base:SetDraggable(false)
			p6_base:MakePopup()
			p6_base:SetKeyBoardInputEnabled(false)
			p6_base:SetMouseInputEnabled(true)
			p6_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p6_base:GetWide(), p6_base:GetTall(), MenuColor )
							end
		local p6_base_bX = vgui.Create( "DButton", p6_base )	//Close Menu Button
			p6_base_bX:SetSize(35, 25)
			p6_base_bX:SetPos(69, 535)
			p6_base_bX:SetText("Close")
			p6_base_bX:SetTextColor(ButtonTextColor)
			p6_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p6_base_bX:GetWide(), p6_base_bX:GetTall() )
									end
			p6_base_bX.DoClick	=	function()
										p6_base:Close()
										pl.MenuOpen=0;
									end
		local p6_base_bPrv = vgui.Create( "DButton", p6_base )	//Previous Page Button
			p6_base_bPrv:SetSize(55, 25)
			p6_base_bPrv:SetPos(12, 535)
			p6_base_bPrv:SetText("Previous")
			p6_base_bPrv:SetTextColor(ButtonTextColor)
			p6_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p6_base_bPrv:GetWide(), p6_base_bPrv:GetTall() )
									end
			p6_base_bPrv.DoClick	=	function()
											p6_base:Close()
											hook.Run("phm_h5",pl)
											pl.hMenuPage6=0;
										end
		local p6_base_bNxt = vgui.Create( "DButton", p6_base )	//Next Page Button, disabled by default (there's no 6th page so no use for it).
			p6_base_bNxt:SetSize(55, 25)
			p6_base_bNxt:SetPos(107, 535)
			p6_base_bNxt:SetText("Next")
			p6_base_bNxt:SetTextColor(ButtonTextColor)
			p6_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p6_base_bNxt:GetWide(), p6_base_bNxt:GetTall() )
									end
			p6_base_bNxt.DoClick	=	function() 
											p6_base:Close()
											hook.Run("phm_h7",pl)
											pl.hMenuPage6=0;
										end
		local b1 = vgui.Create("DButton", p6_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h6_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B1"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p6_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h6_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B2"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p6_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h6_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p6_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h6_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B4"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p6_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h6_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B5"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p6_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h6_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B6"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p6_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h6_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B7"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p6_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h6_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B8"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p6_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h6_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B9"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p6_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h6_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B10"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p6_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h6_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B11"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p6_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h6_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B12"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p6_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h6_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B13"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p6_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h6_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h6_B14"])
								net.SendToServer()
								p6_base:Close() pl.MenuOpen=0;
							end
	end

	function phm_h7(pl)								//Hunter Menu Page7, by default is not accessible.
		pl.hMenuPage7=1;
		local p7_base = vgui.Create( "DFrame")//Menu Frame
			p7_base:SetSize(176, 571)
			p7_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p7_base:SetTitle("Taunts - Page 7")
			p7_base:SetVisible( true )
			p7_base:SetDeleteOnClose(false)
			p7_base:ShowCloseButton(false)
			p7_base:SetDraggable(false)
			p7_base:MakePopup()
			p7_base:SetKeyBoardInputEnabled(false)
			p7_base:SetMouseInputEnabled(true)
			p7_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p7_base:GetWide(), p7_base:GetTall(), MenuColor )
							end
		local p7_base_bX = vgui.Create( "DButton", p7_base )	//Close Menu Button
			p7_base_bX:SetSize(35, 25)
			p7_base_bX:SetPos(69, 535)
			p7_base_bX:SetText("Close")
			p7_base_bX:SetTextColor(ButtonTextColor)
			p7_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p7_base_bX:GetWide(), p7_base_bX:GetTall() )
									end
			p7_base_bX.DoClick	=	function()
										p7_base:Close()
										pl.MenuOpen=0;
									end
		local p7_base_bPrv = vgui.Create( "DButton", p7_base )	//Previous Page Button
			p7_base_bPrv:SetSize(55, 25)
			p7_base_bPrv:SetPos(12, 535)
			p7_base_bPrv:SetText("Previous")
			p7_base_bPrv:SetTextColor(ButtonTextColor)
			p7_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p7_base_bPrv:GetWide(), p7_base_bPrv:GetTall() )
									end
			p7_base_bPrv.DoClick	=	function()
											p7_base:Close()
											hook.Run("phm_h6",pl)
											pl.hMenuPage7=0;
										end
		local p7_base_bNxt = vgui.Create( "DButton", p7_base )	//Next Page Button, disabled by default (there's no 6th page so no use for it).
			p7_base_bNxt:SetSize(55, 25)
			p7_base_bNxt:SetPos(107, 535)
			p7_base_bNxt:SetText("Next")
			p7_base_bNxt:SetTextColor(ButtonTextColor)
			p7_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p7_base_bNxt:GetWide(), p7_base_bNxt:GetTall() )
									end
			p7_base_bNxt.DoClick	=	function() 
											p7_base:Close()
											hook.Run("phm_h8",pl)
											pl.hMenuPage7=0;
										end
		local b1 = vgui.Create("DButton", p7_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h7_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B1"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p7_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h7_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B2"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p7_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h7_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p7_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h7_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B4"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p7_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h7_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B5"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p7_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h7_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B6"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p7_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h7_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B7"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p7_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h7_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B8"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p7_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h7_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B9"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p7_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h7_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B10"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p7_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h7_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B11"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p7_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h7_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B12"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p7_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h7_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B13"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p7_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h7_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h7_B14"])
								net.SendToServer()
								p7_base:Close() pl.MenuOpen=0;
							end
	end

	function phm_h8(pl)								//Hunter Menu Page5, by default is not accessible.
		pl.hMenuPage8=1;
		local p8_base = vgui.Create( "DFrame")//Menu Frame
			p8_base:SetSize(176, 571)
			p8_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p8_base:SetTitle("Taunts - Page 8")
			p8_base:SetVisible( true )
			p8_base:SetDeleteOnClose(false)
			p8_base:ShowCloseButton(false)
			p8_base:SetDraggable(false)
			p8_base:MakePopup()
			p8_base:SetKeyBoardInputEnabled(false)
			p8_base:SetMouseInputEnabled(true)
			p8_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p8_base:GetWide(), p8_base:GetTall(), MenuColor )
							end
		local p8_base_bX = vgui.Create( "DButton", p8_base )	//Close Menu Button
			p8_base_bX:SetSize(35, 25)
			p8_base_bX:SetPos(69, 535)
			p8_base_bX:SetText("Close")
			p8_base_bX:SetTextColor(ButtonTextColor)
			p8_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p8_base_bX:GetWide(), p8_base_bX:GetTall() )
									end
			p8_base_bX.DoClick	=	function()
										p8_base:Close()
										pl.MenuOpen=0;
									end
		local p8_base_bPrv = vgui.Create( "DButton", p8_base )	//Previous Page Button
			p8_base_bPrv:SetSize(55, 25)
			p8_base_bPrv:SetPos(12, 535)
			p8_base_bPrv:SetText("Previous")
			p8_base_bPrv:SetTextColor(ButtonTextColor)
			p8_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p8_base_bPrv:GetWide(), p8_base_bPrv:GetTall() )
									end
			p8_base_bPrv.DoClick	=	function()
											p8_base:Close()
											hook.Run("phm_h7",pl)
											pl.hMenuPage8=0;
										end
		local p8_base_bNxt = vgui.Create( "DButton", p8_base )	//Next Page Button, disabled by default (there's no 6th page so no use for it).
			p8_base_bNxt:SetSize(55, 25)
			p8_base_bNxt:SetPos(107, 535)
			p8_base_bNxt:SetText("Next")
			p8_base_bNxt:SetTextColor(ButtonTextColor)
			p8_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p8_base_bNxt:GetWide(), p8_base_bNxt:GetTall() )
									end
			p8_base_bNxt.DoClick	=	function() 
											p8_base:Close()
											hook.Run("phm_h9",pl)
											pl.hMenuPage8=0;
										end
		local b1 = vgui.Create("DButton", p8_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h8_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B1"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p8_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h8_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B2"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p8_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h8_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p8_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h8_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B4"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p8_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h8_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B5"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p8_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h8_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B6"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p8_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h8_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B7"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p8_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h8_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B8"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p8_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h8_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B9"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p8_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h8_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B10"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p8_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h8_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B11"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p8_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h8_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B12"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p8_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h8_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B13"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p8_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h8_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h8_B14"])
								net.SendToServer()
								p8_base:Close() pl.MenuOpen=0;
							end
	end

	function phm_h9(pl)								//Hunter Menu Page5, by default is not accessible.
		pl.hMenuPage9=1;
		local p9_base = vgui.Create( "DFrame")//Menu Frame
			p9_base:SetSize(176, 571)
			p9_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p9_base:SetTitle("Taunts - Page 9")
			p9_base:SetVisible( true )
			p9_base:SetDeleteOnClose(false)
			p9_base:ShowCloseButton(false)
			p9_base:SetDraggable(false)
			p9_base:MakePopup()
			p9_base:SetKeyBoardInputEnabled(false)
			p9_base:SetMouseInputEnabled(true)
			p9_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p9_base:GetWide(), p9_base:GetTall(), MenuColor )
							end
		local p9_base_bX = vgui.Create( "DButton", p9_base )	//Close Menu Button
			p9_base_bX:SetSize(35, 25)
			p9_base_bX:SetPos(69, 535)
			p9_base_bX:SetText("Close")
			p9_base_bX:SetTextColor(ButtonTextColor)
			p9_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p9_base_bX:GetWide(), p9_base_bX:GetTall() )
									end
			p9_base_bX.DoClick	=	function()
										p9_base:Close()
										pl.MenuOpen=0;
									end
		local p9_base_bPrv = vgui.Create( "DButton", p9_base )	//Previous Page Button
			p9_base_bPrv:SetSize(55, 25)
			p9_base_bPrv:SetPos(12, 535)
			p9_base_bPrv:SetText("Previous")
			p9_base_bPrv:SetTextColor(ButtonTextColor)
			p9_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p9_base_bPrv:GetWide(), p9_base_bPrv:GetTall() )
									end
			p9_base_bPrv.DoClick	=	function()
											p9_base:Close()
											hook.Run("phm_h8",pl)
											pl.hMenuPage9=0;
										end
		local p9_base_bNxt = vgui.Create( "DButton", p9_base )	//Next Page Button, disabled by default (there's no 6th page so no use for it).
			p9_base_bNxt:SetSize(55, 25)
			p9_base_bNxt:SetPos(107, 535)
			p9_base_bNxt:SetText("Next")
			p9_base_bNxt:SetTextColor(ButtonTextColor)
			p9_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p9_base_bNxt:GetWide(), p9_base_bNxt:GetTall() )
									end
			p9_base_bNxt.DoClick	=	function() 
											p9_base:Close()
											hook.Run("phm_h10",pl)
											pl.hMenuPage9=0;
										end
		local b1 = vgui.Create("DButton", p9_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h9_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B1"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p9_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h9_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B2"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p9_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h9_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p9_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h9_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B4"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p9_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h9_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B5"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p9_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h9_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B6"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p9_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h9_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B7"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p9_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h9_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B8"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p9_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h9_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B9"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p9_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h9_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B10"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p9_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h9_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B11"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p9_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h9_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B12"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p9_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h9_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B13"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p9_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h9_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h9_B14"])
								net.SendToServer()
								p9_base:Close() pl.MenuOpen=0;
							end
	end

	function phm_h10(pl)							//Hunter Menu Page5, by default is not accessible.
		pl.hMenuPage10=1;
		local p10_base = vgui.Create( "DFrame")//Menu Frame
			p10_base:SetSize(176, 571)
			p10_base:SetPos(ScrW()-200,ScrH()-685)//850, old 850
			p10_base:SetTitle("Taunts - Page 10")
			p10_base:SetVisible( true )
			p10_base:SetDeleteOnClose(false)
			p10_base:ShowCloseButton(false)
			p10_base:SetDraggable(false)
			p10_base:MakePopup()
			p10_base:SetKeyBoardInputEnabled(false)
			p10_base:SetMouseInputEnabled(true)
			p10_base.Paint = function()
								draw.RoundedBox( 8, 0, 0, p10_base:GetWide(), p10_base:GetTall(), MenuColor )
							end
		local p10_base_bX = vgui.Create( "DButton", p10_base )	//Close Menu Button
			p10_base_bX:SetSize(35, 25)
			p10_base_bX:SetPos(69, 535)
			p10_base_bX:SetText("Close")
			p10_base_bX:SetTextColor(ButtonTextColor)
			p10_base_bX.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p10_base_bX:GetWide(), p10_base_bX:GetTall() )
									end
			p10_base_bX.DoClick	=	function()
										p10_base:Close()
										pl.MenuOpen=0;
									end
		local p10_base_bPrv = vgui.Create( "DButton", p10_base )	//Previous Page Button
			p10_base_bPrv:SetSize(55, 25)
			p10_base_bPrv:SetPos(12, 535)
			p10_base_bPrv:SetText("Previous")
			p10_base_bPrv:SetTextColor(ButtonTextColor)
			p10_base_bPrv.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p10_base_bPrv:GetWide(), p10_base_bPrv:GetTall() )
									end
			p10_base_bPrv.DoClick	=	function()
											p10_base:Close()
											hook.Run("phm_h9",pl)
											pl.hMenuPage10=0;
										end
		local p10_base_bNxt = vgui.Create( "DButton", p10_base )	//Next Page Button, disabled by default (there's no 6th page so no use for it).
			p10_base_bNxt:SetSize(55, 25)
			p10_base_bNxt:SetPos(107, 535)
			p10_base_bNxt:SetText("Next")
			p10_base_bNxt:SetTextColor(ButtonTextColor)
			p10_base_bNxt.Paint	=	function()
										surface.SetDrawColor(19, 105, 153)
										surface.DrawRect( 0, 0, p10_base_bNxt:GetWide(), p10_base_bNxt:GetTall() )
									end
			p10_base_bNxt.DoClick	=	function() 
											p10_base:Close()
											hook.Run("phm_h11",pl)
											pl.hMenuPage10=0;
										end
		local b1 = vgui.Create("DButton", p10_base)	//Button1
			b1:SetSize(150, 33)
			b1:SetPos(12,35)
			b1:SetText(hunterButton["h10_B1"])
			b1:SetTextColor(ButtonTextColor)
			b1.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b1:GetWide(), b1:GetTall() )
							end
			b1.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B1"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b2 = vgui.Create( "DButton", p10_base )	//Button2
			b2:SetSize(150, 33)
			b2:SetPos(12, 70)
			b2:SetText(hunterButton["h10_B2"])
			b2:SetTextColor(ButtonTextColor)
			b2.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b2:GetWide(), b2:GetTall() )
							end
			b2.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B2"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b3 = vgui.Create( "DButton", p10_base )	//Button3
			b3:SetSize(150, 33)
			b3:SetPos(12, 105)
			b3:SetText(hunterButton["h10_B3"])
			b3:SetTextColor(ButtonTextColor)
			b3.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b3:GetWide(), b3:GetTall() )
							end
			b3.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h3_B3"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b4 = vgui.Create( "DButton", p10_base )	//Button4
			b4:SetSize(150, 33)
			b4:SetPos(12, 140)
			b4:SetText(hunterButton["h10_B4"])
			b4:SetTextColor(ButtonTextColor)
			b4.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b4:GetWide(), b4:GetTall() )
							end
			b4.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B4"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b5 = vgui.Create( "DButton", p10_base )	//Button5
			b5:SetSize(150, 33)
			b5:SetPos(12, 175)
			b5:SetText(hunterButton["h10_B5"])
			b5:SetTextColor(ButtonTextColor)
			b5.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b5:GetWide(), b5:GetTall() )
							end
			b5.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B5"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b6 = vgui.Create( "DButton", p10_base )	//Button6
			b6:SetSize(150, 33)
			b6:SetPos(12, 210)
			b6:SetText(hunterButton["h10_B6"])
			b6:SetTextColor(ButtonTextColor)
			b6.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b6:GetWide(), b6:GetTall() )
							end
			b6.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B6"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b7 = vgui.Create( "DButton", p10_base )	//Button7
			b7:SetSize(150, 33)
			b7:SetPos(12, 245)
			b7:SetText(hunterButton["h10_B7"])
			b7:SetTextColor(ButtonTextColor)
			b7.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b7:GetWide(), b7:GetTall() )
							end
			b7.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B7"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b8 = vgui.Create( "DButton", p10_base )	//Button8
			b8:SetSize(150, 33)
			b8:SetPos(12, 280)
			b8:SetText(hunterButton["h10_B8"])
			b8:SetTextColor(ButtonTextColor)
			b8.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b8:GetWide(), b8:GetTall() )
							end
			b8.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B8"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b9 = vgui.Create( "DButton", p10_base )	//Button9
			b9:SetSize(150, 33)
			b9:SetPos(12, 315)
			b9:SetText(hunterButton["h10_B9"])
			b9:SetTextColor(ButtonTextColor)
			b9.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b9:GetWide(), b9:GetTall() )
							end
			b9.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B9"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b10 = vgui.Create( "DButton", p10_base )	//Button10
			b10:SetSize(150, 33)
			b10:SetPos(12, 350)
			b10:SetText(hunterButton["h10_B10"])
			b10:SetTextColor(ButtonTextColor)
			b10.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b10:GetWide(), b10:GetTall() )
							end
			b10.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B10"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b11 = vgui.Create( "DButton", p10_base )	//Button11		
			b11:SetSize(150, 33)
			b11:SetPos(12, 385)
			b11:SetText(hunterButton["h10_B11"])
			b11:SetTextColor(ButtonTextColor)
			b11.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b11:GetWide(), b11:GetTall() )
							end
			b11.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B11"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b12 = vgui.Create( "DButton", p10_base )	//Button12
			b12:SetSize(150, 33)
			b12:SetPos(12, 420)
			b12:SetText(hunterButton["h10_B12"])
			b12:SetTextColor(ButtonTextColor)
			b12.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b12:GetWide(), b12:GetTall() )
							end
			b12.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B12"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b13 = vgui.Create( "DButton", p10_base )	//Button13
			b13:SetSize(150, 33)
			b13:SetPos(12, 455)
			b13:SetText(hunterButton["h10_B13"])
			b13:SetTextColor(ButtonTextColor)
			b13.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b13:GetWide(), b13:GetTall() )
							end
			b13.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B13"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
		local b14 = vgui.Create( "DButton", p10_base )	//Button14
			b14:SetSize(150, 33)
			b14:SetPos(12, 490)
			b14:SetText(hunterButton["h10_B14"])
			b14:SetTextColor(ButtonTextColor)
			b14.Paint	=	function()
								surface.SetDrawColor(19, 105, 153)
								surface.DrawRect( 0, 0, b14:GetWide(), b14:GetTall() )
							end
			b14.DoClick	=	function () 
								net.Start("send_taunt")
									net.WriteString(hunterWString["h10_B14"])
								net.SendToServer()
								p10_base:Close() pl.MenuOpen=0;
							end
	end

	//Hook List 
	
	//Props Team
	hook.Add("phm_p1","Calling Prop Menu Page 1",phm_p1)//Hook to call phm_p1(Menu Page 1)
	hook.Add("phm_p2","Calling Prop Menu Page 2",phm_p2)//Hook to call phm_p2(Menu Page 2)
	hook.Add("phm_p3","Calling Prop Menu Page 3",phm_p3)//Hook to call phm_p3(Menu Page 3)
	hook.Add("phm_p4","Calling Prop Menu Page 4",phm_p4)//Hook to call phm_p4(Menu Page 4)
	hook.Add("phm_p5","Calling Prop Menu Page 5",phm_p5)//Hook to call phm_p4(Menu Page 5)
	hook.Add("phm_p6","Calling Prop Menu Page 6",phm_p6)//Hook to call phm_p6(Menu Page 6)
	hook.Add("phm_p7","Calling Prop Menu Page 7",phm_p7)//Hook to call phm_p7(Menu Page 7)
	hook.Add("phm_p8","Calling Prop Menu Page 8",phm_p8)//Hook to call phm_p8(Menu Page 8)
	hook.Add("phm_p9","Calling Prop Menu Page 9",phm_p9)//Hook to call phm_p9(Menu Page 9)
	hook.Add("phm_p10","Calling Prop Menu Page 10",phm_p10)//Hook to call phm_p10(Menu Page 10)

	//Hunters Team
	hook.Add("phm_h1","Calling Hunter Menu Page 1",phm_h1)//Hool to call phm_h1(Menu Page 1)
	hook.Add("phm_h2","Calling Hunter Menu Page 2",phm_h2)//Hool to call phm_h2(Menu Page 2)
	hook.Add("phm_h3","Calling Hunter Menu Page 3",phm_h3)//Hool to call phm_h3(Menu Page 3)
	hook.Add("phm_h4","Calling Hunter Menu Page 4",phm_h4)//Hool to call phm_h4(Menu Page 4)
	hook.Add("phm_h5","Calling Hunter Menu Page 5",phm_h5)//Hool to call phm_h5(Menu Page 5)
	hook.Add("phm_h6","Calling Hunter Menu Page 6",phm_h6)//Hook to call phm_h6(Menu Page 6)
	hook.Add("phm_h7","Calling Hunter Menu Page 7",phm_h7)//Hook to call phm_h7(Menu Page 7)
	hook.Add("phm_h8","Calling Hunter Menu Page 8",phm_h8)//Hook to call phm_h8(Menu Page 8)
	hook.Add("phm_h9","Calling Hunter Menu Page 9",phm_h9)//Hook to call phm_h9(Menu Page 9)
	hook.Add("phm_h10","Calling Hunter Menu Page 10",phm_h10)//Hook to call phm_h10(Menu Page 10)

	hook.Add("TeamCheck","Call check pl.Team()",TeamCheck)//Hook to call TeamCheck

	//Button Bind code:
	local FKeyMenus = {		//Remove either to disable the button.
		KEY_P = IsAlive;	//When X is pressed menu opens. -- CHANGE KEY_P TO WHATEVER BIND YOU WANT TO USE
		KEY_F6 = IsAlive;   // When F6 is pressed, Opens the menu
		
	};
	hook.Add( "PlayerBindPress", "PlayerBindPressFKeyMenus", function( _p, _bind, pressed )
		local _key = "KEY_" .. string.upper( input.LookupBinding( _bind ) );
		local _func = FKeyMenus[ _key ];
		if ( _func ) then  
			_func( LocalPlayer() );
		end 
	end);
end