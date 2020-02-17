// Bet commands
LOTTERY_BET_COMMANDS = {'!bet', '/bet'}

// Lottery commands
LOTTERY_COMMANDS = {'!lottery', '/lottery'}

// Lottery teams
LOTTERY_HUNTER = team.GetName(1)
LOTTERY_PROPS = team.GetName(2)

// The time during which you can bet (in seconds)
LOTTERY_TIME = 30

// Lottery min bet
LOTTERY_BET_MIN = 10

// Lottery max bet
LOTTERY_BET_MAX = 1000

// Lottery win coefficient
LOTTERY_BET_COEFFICIENT = 2

// Bet hud time (in sec)
LOTTERY_BET_HUDTIME = 30

// Min. online for access to bet command
LOTTERY_BET_ONLINE = 3

// Lottery min amount points
LOTTERY_LOT_MIN = 100

// Lottery cooldown (in sec)
LOTTERY_LOT_COOLDOWN = 180

// Lottery time (in sec)
LOTTERY_LOT_TIME = 80

// Min. online for access to lottery command
LOTTERY_LOT_ONLINE = 3

// Admin usergroups
LOTTERY_MAIN_ADMINS = {
	"superadmin",
	"admin",
	"owner",
	"moderator"
}

// Sounds
LOTTERY_BET_WIN = Sound("UI/buttonclickrelease.wav") -- Win lottery
LOTTERY_LOT_WIN = Sound("UI/buttonrollover.wav") -- Lottery win
LOTTERY_LOT_START = Sound("UI/buttonclick.wav") -- Lottery start


// Languange
LOTTERY_BET_ISHAVE = "You already have a bet!"
LOTTERY_BET_ERRORINSYNTAX = "Please use !bet 'team' 'amount' !"
LOTTERY_BET_AVIABLETEAMS = "Available teams:"
LOTTERY_BET_NOTENOUGHT = "Not enough points!"
LOTTERY_BET_ISWIN = "Congratulations, you won!"
LOTTERY_BET_WINBET = "Congrats, you've won!"
LOTTERY_BET_BETISCLOSE = "Betting is now closed, Good luck!"
LOTTERY_BET_BETISLOSE = "Sorry, you lost the bet!"

LOTTERY_LOT_ERRORINSYNTAX = "Please use !lottery 'amount' " 
LOTTERY_LOT_SUCMSG = "You start a new lottery!"

LOTTERY_MAIN_LOWONLINE = "Not enough players online! Min: 3"