Option Explicit
Randomize
'*******************************************
'  User Options
'*******************************************

'----- DMD Options -----
Dim UseFlexDMD : UseFlexDMD = 0		'0 = no FlexDMD, 1 = enable FlexDMD. FlexDMD cannot be used with VR.

'----- Staged flippers options -----
Const stagedFlipperStyle = 0		' 0 = MagnaSaves, 1 = A and apostrophe

'----- Action button options -----
Const BlastWithPlunger = True		' Set to True to use the plunger key as the action button.
									' Only recommended if you have an analog plunger.
Const HideBlastButton = False		' Set to True to hide the button on the lockbar.

'----- Outlane difficulty -----
Const LeftOutlaneDifficulty = 1		' 0 = easy, 1 = medium (default), 2 = hard, 3 = extra hard (no post)
Const RightOutlaneDifficulty = 2	' 0 = easy, 1 = medium, 2 = hard (default), 3 = extra hard (no post)

'----- Shadow Options -----
Const DynamicBallShadowsOn = 0		'0 = no dynamic ball shadow ("triangles" near slings and such), 1 = enable dynamic ball shadow
Const AmbientBallShadowOn = 0		'0 = Static shadow under ball ("flasher" image, like JP's)
									'1 = Moving ball shadow ("primitive" object, like ninuzzu's) - This is the only one that shows up on the pf when in ramps and fades when close to lights!
									'2 = flasher image shadow, but it moves like ninuzzu's

'----- Music Options -----
Const fMusicVolume = 0.5			'Music volume. 0 = no music, 1 = full volume
COnst fAttractVolume = 0.3			'Attract mode music volume. 0 = no music, 1 = full volume
Const fDuckfactor = 0.1				'Duck music to 10% (multiplicative with fMusicVolume) during videos

'----- General Sound Options -----
Const VolumeDial = 0.8				'Overall Mechanical sound effect volume. Recommended values should be no greater than 1.
Const BallRollVolume = 0.5 			'Level of ball rolling volume. Value between 0 and 1
Const RampRollVolume = 0.5 			'Level of ramp rolling volume. Value between 0 and 1

'----- VR Room Options -----

Dim VRRoomChoice : VRRoomChoice = 1
'1 - Deluxe Room
'2 - Minimal room

Dim VR_Obj
Dim DesktopMode: DesktopMode = Table1.ShowDT

If RenderingMode = 2 Then
	Table1.PlayfieldReflectionStrength = 5  ' Sets VR Playfield reflection strength
	UseFlexDMD = 0
    For Each VR_Obj in VRCabinet : VR_Obj.Visible = 1 : Next
	If VRRoomChoice = 1 Then
		For Each VR_Obj in VRDeluxeRoom : VR_Obj.Visible = 1 : Next
	Else
		For Each VR_Obj in VRMinimalRoom : VR_Obj.Visible = 1 : Next
	End If
Else
	For Each VR_Obj in VRDeluxeRoom : VR_Obj.Visible = 0 : Next
	For Each VR_Obj in VRMinimalRoom : VR_Obj.Visible = 0 : Next
	If DesktopMode=True Then PinCab_Rails.visible = 1
End if

' Based on the VPW Example Table
'
' CONTENT CONTRIBUTION CREDITS
' Dynamic Ball Shadows: iaakki, apophis, Wylte
' Rubberizer: iaakki
' Target Bouncer: iaakki, wrd1972, apophis
' Flipper and physics corrections: nFozzy, Rothbauerw
' Sound effects package: Fleep
' Ramp rolling sounds: nFozzy
' Lampz: nFozzy
' Bumpers: Flupper
' Flasher domes: Flupper
' 3D inserts: Flupper, Benji
' Drop targets: Rothbauerw
' VR Cabinet & Room: Sixtoe, Flupper, 3rdaxis
' FlexDMD: oqqsan
'
' Futurama change log:
' 010 (wizball) : Fix playfield mesh with corrected upper hole
'	Bender multiball fixes
'	Change hit threshold on metal walls to make less rattling sounds
'	Fix crash in DMDTimedText
'	Increase lower flipper strength to 3250
' 016 (Wizball) : Add animation to slugs
'	Add insert blinks to drop targets
'	Add blasting with action button
'	Add blast count to DMD
' 018 (Wizball) : Add a kicker to the right ramp to make the shot faster
'	Add a skill shot
'	Add animation to the suicide booth
'	Add a Hypnotoad image to spinning disk
'	When slowing down the spinning disk from full speed, end at 0 degrees
' 019 (Wizball) : Make the transition out of the loop of the right ramp smoother
'	Reduce the strength of the kicker on the right ramp
' 022 (Wizball) : Use a trigger instead of a kicker for the right ramp speedup, for better sound
'	Add grace period for multiballs
'	Add skill shot
'	Add combo awards
'	Add combo awards to DMD
' 025 (Wizball) : Fix bug in extra ball handling
'	Fix bug where a multiball didn't end if a ball ended during the multiball's grace period
'	Add lights to signpost
'	Add Omicron Persei 8, Amazonia, and Decapod 10 modes (no select for now)
' 028 (Wizball) : Added light to blast button
'	Hide flipper shadows in desktop mode
'	Added mode Select
'   Added Mars, Daily Planet, Moon, Chapek 9, Earth, and Osiris 4 modes
' 029 (Wizball) : Fix script crash on winning a mode
' 030 (Wizball) : Add High scores
' Show previous game’s score in attract mode
' When selecting modes, show if a mode has previous progress
' In Moon mode, hitting a shot with both white and grays arrows now gives double progress
' Fixed all arrow lights being momentarily off when shots move in e.g. Mars mode
' 031 (Wizball) : Added bonus
' Blast light is now always off when all blasts are used
' Added mystery award
' Added queue system
' Added framework for PuP events
' 032 (Wizball) : Add light shows
' 033 (Wizball) : Add suicide booth
' Reduce size of lower scoop to prevent jams in multiball
' 034 (Wizball) : Add instant info
' Add Mini wizard mode 1
' Add kickout alert for lower scoop
' 035 (Wizball) : Add mini wizard mode 2, event queue fixes
' 036 (Wizball) : Add adjustable outlane posts
' 037 (Wizball) : Add staged flippers
' add Slurm wizard mode
' Remove shot debugger
' 040 (Wizball) : Wire beer bottle animation to an invisible drop target
' Add black walls to hide the desktop background from the drop target holes
' 041 (Wizball) : Fix bug that could cause mini-wizard modes to be available twice in a row
' 042 (jsm174) : Standalone fixes
' 043 (Wizball) : PuP integration
' 044 (Wizball) : Fix blast light, add PuP suicide booth, add PuP mode select
'				  Update playfield art and playfield multiplier LED color
' 046 (Wizball) : Fix zCol_Rubber_Sleeve008 collections
'				  Fix bug where slugs could become intangible in 10.8
'				  Add Slug Invasion PuP, Add slug sound effects
'				  Update apron and rule card images
'				  Update VR backbox, update lockbar, rails, and side blades
'				  Game should now work with FlexDMD disabled
'				  Added multiple videos for ball save
'				  Display now updates mode progress text if it changes while displayed
' 048 (Wizball) : Fix mode progress display for Naturama
'				  Change how cutscene skipping is handled if the ball is in the lower scoop
'				  Fix cutscene skip for suicide booth loss
'				  Work around PuP font size issue for scores (size used to vary with UI scale)
'				  Add music and music ducking
'				  Add hypnotoad mechanical sound
'				  Add inlane slowdown code
' 049 (Rawd)      VR Room Overhaul
' 050 (tomate)    New tube ramp texture added.
' 051 (apophis)   DOF commands added. Pincab rails visible in desktop mode. Minor physics script updates.
' RC1 (wizball)	: Add Option to blast with plunger button
'				  Add depth bias to drop targets and insert labels so they don't appear on top of the tube
'				  Increased volume of Chapek 9 music
'                 Add bottle sound to Bender jackpots
'                 Mute other music during Bender multiball
'				  Adjusted Multibaseball value to 25M jackpot / 60M super jackpot
'				  Add credits image to PuP
'				  Changed apron image so that a ball at the plunger is visible in destop view
' RC2 (Joe)		: New Tube texture
' RC3 (Wizball) : Blasts can no longer be used if a mode or multiball is not running
'				  Removed cheats and debug prints
' RC4 (apophis) : Updated DOF calls
' RC5, RC6(Joe) : Fix floating gate, scoop visuals, and flipper decals
' RC7 (Wizball) : Change GI around slingshots
'				  Fix gap around shoot again insert
'				  Clean up debug table objects
'				  New playfield textures
' RC8 (joe/wiz) : Darken desktop background behind the table (fixes blue artifacts in DT)
'				  Fix gap between side wall and back wall
'				  Hide side rails in cabinet mode
'				  Add attract mode music (can be disabled in script options)
' 1.0 (wizball) : Fix attract mode music playing during high score entry
'				  Add blocker walls over and behind the lower scoop
'				  New visual for lower scoop
' 1.1 (joe/wiz) : Fix DOF flipper solenoids staying on after a drain
'				  Fix modes not stopping after a tilt
'				  Add option to hide blast button
' 				  Move side loop inserts for better visibility
'				  Fix Morbo not appearing in the TV in 10.8
' 1.2 (wizball) : Fix bug where the game rarely would not feed a ball after a Bender lock
'				  Add sound cue when reverse flippers expire
'				  Attract music now has the proper volume after a game over
'				  Prevent selecting a mode from using a blast with some button configs

'***********************************
' DOF IDs
'***********************************
'E101 0/1 LeftFlipper
'E102 0/1 RightFlipper
'E103 2 Leftslingshot
'E104 2 Rightslingshot
'E105 2 Bumper 1
'E106 2 Bumper 2
'E107 2 Bumper 3
'E108 2 right drop targets
'E109 2 center standup/drop targets
'E110 2 leftkicker and kicker001 kick
'E111 2 ball release and autoplunge kicker
'E118 0/1 Launch/Fire button pulse
'E119 0/1 Fire button ready
'E120 0/1 Start game button ready
'E121 0/1 Launch ball ready
'E122 2 ball fired from plunger
'E123 2 Spinner (top center) spinner
'E124 2 Spinner2 (middle center) spinner
'E125 2 Spinner3 (bottom left) spinner
'E126 2 drain hit (ball not saved)
'E127 2 drain hit (ball saved)
'E130 2 Blast used
'E131 2 Combo added/awarded
'E132 2 Extra ball awarded
'E133 2 Mystery awarded
'E141 2 Flasher 1 (lower left, green)
'E142 2 Flasher 2 (lower right, red)
'E143 2 Flasher 3 (upper right, blue)
'E144 2 Flasher 4 (upper left, white)
'E150 0/1 undercab red fades in and out slowly
'E151 0/1 undercab blue fades in and holds
'E153 2 tilt warning
'E154 2 tilt
'E155 0/1 attract mode
'E160 0/1 Multiball 1 active
'E161 0/1 Multiball 2 active
'E180 2 CHAPEK 9 progress (PURPLE)
'E181 2 DECAPOD 10 progress (ORANGE)
'E182 2 DAILY PLANET progress (TEAL)
'E183 2 OMICRON PERSEI 8 progress (YELLOW)
'E184 2 AMAZONIA progress (PINK)
'E185 2 EARTH progress (BLUE)
'E186 2 MOON progress (GRAY)
'E187 2 SLUG INVASION progress (BROWN)
'E188 2 MARS progress (RED)
'E189 2 MINI WIZARD 1 progress (GREEN)
'E190 2 MINI WIZARD 2 progress (LIME)
'E191 2 SLURM jackpot
'E192 2 SLURM super jackpot
'E193 2 Basemultiball jackpot
'E194 2 Basemultiball super jackpot
'E195 2 Bender jackpot
'E196 2 Bender super jackpot




On Error Resume Next
ExecuteGlobal GetTextFile("controller.vbs")
If Err Then MsgBox "You need the controller.vbs in order to run this table, available in the vp10 package"
On Error Goto 0

'*******************************************
'  Constants and Global Variables
'*******************************************

Const UsingROM = False				'The UsingROM flag is to indicate code that requires ROM usage. Mostly for instructional purposes only.

Const BallSize = 50					'Ball size must be 50
Const BallMass = 1					'Ball mass must be 1
Const tnob = 6						'Total number of balls
Const lob = 0						'Locked balls
Const cGameName = "futurama"
Const bEnablePuP = True   			'Disabling PuP is not supported

Dim nAutoPlungeBalls	' Count of balls to autoplunge
Dim nBallsToFeed		' Count of balls to feed from the trough
Dim nReleaseDelay		' Time in ms before the trough can release a new ball

Dim tablewidth: tablewidth = Table1.width
Dim tableheight: tableheight = Table1.height
Dim BIPL : BIPL = False				'Ball in plunger lane

Dim bResetInlines
Dim oLastBallInInlines	' The most recent ball object that hit the end of the inline drop lane
' Lock sequence for the third multiball and afterward
' 0. Hit the bottom drop target to clear a path to the end
' 1. Hit the middle drop target to clear a path to the end
' 2. Hit the top drop target to clear a path to the end
' 3. Hit the end of the lane to capture a ball in the middle slot
' 4. Hit the middle drop to move the captured ball to the top slot
' 5. Hit the middle drop to open the middle slot
' 6. Shoot a ball into the middle slot
' 7. Hit the bottom drop to open the bottom slot
' 8. Shoot a ball into the bottom slot
' The first mutiball only has steps 3, 4, and 6.
' The second mutiball skips steps 0, 1, and 2.
Dim anInlineStateGoals
' Array of numbers indicating what targets should be raised before each lock state
anInlineStateGoals = Array(7, 6, 4, 0, 2, 6, 4, 7, 6, 7)
' State 0 : all raised (4 + 2 + 1)
' State 1 : middle and top raised (4 + 2 + 0)
' State 2 : top raised (4 + 0 + 0)
' State 3 : none raised (0 + 0 + 0)
' State 4 : middle raised (0 + 2 + 0)
' State 5 : middle and top raised (4 + 2 + 0)
' State 6 : top raised (4 + 0 + 0)
' State 7 : all raised (4 + 2 + 1)
' State 8 : middle and top raised (4 + 2 + 0)
' State 9 : preparing to release, all raised (4 + 2 + 1)
Dim aoBenderLockedBalls(2)	' Array of balls locked in the inline drops
Dim nTimeReleaseLock	' Time in ms remaining until a lock is released
Dim anScore(4)
Dim nPlayer				' 0 based index of the current player (0 = player 1)
Dim nPlayersInGame		' Count of the number of players currently in the game
Dim nPlayersLastGame	' Count of players last game
Dim bPlayerChanged		' Boolean, true if the player has changed
Dim nTimeLowerLeftFlip	' The time when the lower left flipper was last raised
Dim nTimeLowerRightFlip	' The time when the lower right flipper was last raised
Dim nTimeUpperLeftFlip	' The time when the lower left flipper was last raised
Dim nTimeUpperRightFlip	' The time when the lower right flipper was last raised
Dim nTimeBlastUsed		' The time when a player last pressed the blast button
Dim bDrainingBalls		' Is the table draining balls after a tilt or timed out multiball?
Dim nTimeStartPressed	' timestamp when the start button was pressed
Dim nTimeVUKFired		' timestamp when the kickout from the upper scoop was last fired
Dim bBallHeld			' Is the ball grabbed by something (pausing timers)?
Dim bBallinLowerScoop	' Is there at least one ball in the lower scoop?
Dim bFirstSwitchHit		' True if the ball has hit a switch since the start of the ball
Dim bMball2Ended		' True if the inline drops should be raised after Bender multiball
Dim oEventQueue			' Global event queue
Dim oCurrentEvent		' The event currently being handled
Dim nTimeLastPuP		' GameTime when the last PuP event was handled

Dim oHypnotoad
Dim bHypnoToadSpin				' True if hypnotoad should spin, false if hypnotoad should stand still
Dim dHypnotoadSpeed				' Current hypnotoad RPM
Dim nTimeHypnotoadUpdate		' Time in ms when hypnotoad was last animated
Const nHypnotoadMaxSpeed = 160  ' rpm
Const nHypnotoadSpinUpDown = 1000 ' ms between standstill and full speed
Const dRpmToDegPerMs = 0.006    ' revolutions per minute to degrees per millisecond
Dim fBoothTargetAngle			' Angle in degrees to animate the sucicide booth rotating to
Const nBoothRotateSpeed = 40		' rpm

Dim LRRRraisedLeft
Dim LRRRRaisedRight
Const LRRRMoveTime = 300 		' Time in milliseconds between raised and lowered LRRR states
Const LRRRMoveHeight = 125		' Distance in VP Units between raised and lowered LRRR states

Dim anColorCycleLight	' Array of colors of lights turned on in the color cycle
Dim anColorCycleDark	' Array of colors of lights turned off in the color cycle
Dim nColorCycleIndex	' Index of which color the lights are during attract mode
Dim aoShotLights		' Array of control lights for shots
Dim aoComboLights		' Array of control lights for combos
Dim aoModeLights		' Array of control lights for modes
Dim aoLaneLights		' Array of control lights for inlanes and outlanes
Dim ao5BankLights		' Array of control light for the 5 drop target bank
Dim aoMball1LockLights	' Array of lock lights for multiball 1
Const eColorNone = -1
Const eColorRed = 0
Const eColorOrange = 1
Const eColorYellow = 2
Const eColorLime = 3
Const eColorGreen = 4
Const eColorCyan = 5
Const eColorBlue = 6
Const eColorPurple = 7
Const eColorPink = 8
Const eColorWhite = 9
Const eColorGray = 10
Const eColorRainbow = 11
Const nColorsInCycle = 11
anColorCycleLight = Array(RGB(185,0,20), RGB(255,85,20), RGB(255,200,0), _
	RGB(171, 255, 0), RGB(25,205,25), RGB(0,255,200), RGB(15,85,255), _
	RGB(128,0,255), RGB(163,102,255), RGB(255,245,235), RGB(48, 48, 48))
aoShotLights = Array(cLightLeftLane, cLightLowerScoop, cLightLeftLoop, _
	cLightSideLoop, cLightUpperScoop, cLightLeftRamp, cLightCenterLane, _
	cLightRightRamp, cLightInlineDrops, cLightRightLoop)
aoComboLights = Array(cLightComboLLane, cLightComboLowScoop, cLightComboLLoop, _
	cLightComboSideLoop, cLightComboTopScoop, cLightComboLRamp, cLightComboCLane, _
	cLightComboRRamp, cLightComboInlines, cLightComboRLoop)
aoModeLights = Array(cLightModeOmicron, cLightModeMars, cLightModeDaily, _
	cLightModeMoon, cLightModeChapek, cLightModeEarth, cLightModeAmazonia, _
	cLightModeOsiris, cLightModeDecapod)
aoMball1LockLights = Array(cLightMball1Lock1, cLightMball1Lock2, cLightMball1Lock3)
ao5BankLights = Array(cLightDrop1, cLightDrop2, cLightDrop3, cLightDrop4, cLightDrop5)
aoLaneLights = Array(cLightLeftOutlane, cLightLeftInlane, _
	cLightRightInlane, cLightRightOutlane)

Dim aoDigit1Lights, aoDigit2Lights
Dim anDigitSegments
anDigitSegments = Array(63, 6, 91, 79, 102, 109, 125, 7, 127, 111)
Dim aPowersOfTwo
aPowersOfTwo = Array(1, 2, 4, 8, &h10, &h20, &h40, &h80,_
				&h100, &h200, &h400, &h800, &h1000, &h2000, &h4000, 32768,_ 
				&h10000, &h20000, &h40000, &h80000, &h100000, &h200000, &h400000, &h800000,_
				&h1000000, &h2000000, &h4000000, &h8000000, &h10000000, &h20000000, &h40000000)

aoDigit1Lights = Array(LightD1S1, LightD1S3, LightD1S6, LightD1S7,_
	LightD1S5, LightD1S2, LightD1S4)
aoDigit2Lights = Array(LightD2S1, LightD2S3, LightD2S6, LightD2S7,_
	LightD2S5, LightD2S2, LightD2S4)

Dim nAttractModePage	' 0 based index of attract mode page to display
Const nAttractModePageCount = 8
Const nAttractModePageTime = 2500 ' Time in ms between switching attract mode pages
Dim nTextPriority ' a low number is a high priority, 1 means top priority
				  ' 99 means "only display if otherwise idle"
Dim nTextDuration ' Time in ms of long to display the current message
Dim nModeOnScores ' The mode currently displayed on the scoreboard

const eModeNone = -1 : const eModeOmicron = 7 : const eModeMars = 8 : const eModeDaily = 2
const eModeMoon = 6 : const eModeChapek = 0 : Const eModeEarth = 5 : Const eModeAmazonia = 4
Const eModeOsiris = 3 : Const eModeDecapod = 1 : Const eModeMultiball1 = 9
Const eModeMultiball2 = 10 : Const eModeSuperBumpers = 11 : Const eModeSuperSpinners = 12
Const eModeSuperLoops = 13 : Const eModeSuperRamps = 14 : Const eModeFrenzy = 15
Const eModeImmolation = 16 : Const eModeCherryBomb = 17 : const eModeSlurm = 18
Const eModeReverseFlips = 19 : Const eModeHypnotoad = 20
Dim asModeNames
asModeNames = Array("CHAPEK 9", "DECAPOD 10", "NATURAMA", "OMICRON PERSEI 8", _
	"AMAZONIA", "EARTH", "THE MOON", "SLUG INVASION", "MARS", "BASEMULTIBALL", "BENDER MULTIBALL", _
	"SUPER BUMPERS", "SUPER SPINNER", "SUPER LOOPS", "SUPER RAMPS", "FRENZY", "FEMINISTA", _
	"POKER CHAMPIONSHIP", "SLURM", "REVERSE FLIPPERS", "HYPNOTOAD SPINS")
Dim asModeGoals
asModeGoals = Array("HIT PURPLE ARROWS", "HIT ORANGE ARROWS", "HIT TEAL ARROWS", _
	"HIT YELLOW ARROWS", "HIT PINK ARROWS", "HIT BLUE ARROWS", _
	"HIT WHITE AND GRAY ARROWS", "HIT THE SLUGS", "HIT RED ARROWS", "HIT GREEN ARROWS", _
	"HIT LIME ARROWS", "HIT THE BUMPERS", "HIT THE SPINNERS", _
	"HIT LOOPS", "HIT RAMPS", "HIT ANY SWITCH", "HIT RIGHT RAMP", _
	"HIT BLINKING ARROWS", "RED - YELLOW - GREEN", "SURVIVE", "SURVIVE")
Dim anShotsToWin
anShotsToWin = Array(9, 10, 10, 7, 10, 8, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
Dim aoLightForMode
aoLightForMode = Array(cLightModeChapek, cLightModeDecapod, cLightModeDaily, _
	cLightModeOsiris, cLightModeAmazonia, cLightModeEarth, _
	cLightModeMoon, cLightModeOmicron, cLightModeMars)
Dim anModeStartTime
anModeStartTime = Array(93499, 78499, 78499, 88499, 63499, _
	63499, 48499, 33499, 78499, 0, 0, 62499, 62499, 62499, _
	62499, 62499, 0, 0, 0, 30000, 60000)
Dim anModeStartTriggers, anModeProgressTriggers, anModeEndTriggers
anModeStartTriggers = Array(721, 724, 727, 730, 734, 737, _
	740, 743, 746, 763, 773, 0, 0, 0, 0, 0, 749, 752, 755)
anModeProgressTriggers = Array(722, 725, 728, 731, 735, 738, _
	741, 744, 747, 764, 774, 0, 0, 0, 0, 0, 750, 753, 756)
anModeEndTriggers = Array(723, 726, 729, 732, 736, 739, _
	742, 745, 748, 766, 776, 0, 0, 0, 0, 0, 751, 754, 758)
Dim afModeXCoordinates, afShipYCoordinates, afCompletionYCoords
afModeXCoordinates = Array(9.1, 8.6, 23.2, 35.4, 45.9, _
	59.2, 73.1, 86.7, 74.4)
afShipYCoordinates = Array(62.0, 10.5, 34.6, 12.3, 56.2, _
	29.2, 7.31, 31.6, 65.5)
afCompletionYCoords = Array(74.1, 22.6, 46.7, 24.4, 68.2, _
	41.2, 19.4, 43.6, 77.5)

Dim anTimedModes
anTimedModes = Array(eModeOmicron, eModeMars, eModeDaily, eModeMoon, eModeChapek, _
	eModeEarth, eModeAmazonia, eModeOsiris, eModeDecapod, eModeSuperBumpers, _
	eModeSuperSpinners, eModeSuperLoops, eModeSuperRamps, eModeFrenzy, _
	eModeReverseFlips, eModeHypnotoad)
Dim anAddTimeModes
anAddTimeModes = Array(eModeOmicron, eModeMars, eModeDaily, eModeMoon, eModeChapek, _
	eModeEarth, eModeAmazonia, eModeOsiris, eModeDecapod, eModeSuperBumpers, _
	eModeSuperSpinners, eModeSuperLoops, eModeSuperRamps, eModeFrenzy)

Const eComboAwardNone = -1 : Const eComboAwardBumpers = 0 : Const eComboAwardSpinners = 1
Const eComboAwardLoops = 2 : Const eComboAwardRamps = 3 : Const eComboAwardFrenzy = 4
Const eComboAwardLightEB = 5 : Const eComboAwardPoints = 6
Dim asComboAwardText
asComboAwardText = Array("SUPER BUMPERS", "SUPER SPINNER", "SUPER LOOPS", "SUPER RAMPS", _
	"FRENZY", "EXTRA BALL", "BIG POINTS")

Const eShotNone = -1 : Const eShotLeftLane = 0 : Const eShotLowerScoop = 1
Const eShotLeftLoop = 2 : Const eShotSideLoop = 3 : Const eShotUpperScoop = 4
Const eShotLeftRamp = 5 : Const eShotCenterLane = 6 : Const eShotRightRamp = 7
Const eShotInlineDrops = 8 : Const eShotRightLoop = 9 : Const eShotLRRRLeft = 10
Const eShotLRRRRight = 11
Dim asShotNames
asShotNames = Array("LEFT LANE", "LOWER SCOOP", "LEFT LOOP", "SIDE LOOP", "UPPER SCOOP", _
	"LEFT RAMP", "CENTER LANE", "RIGHT RAMP", "BENDER LANE", "RIGHT LOOP", _
	"LEFT SLIME", "RIGHT SLIME")

Const eMysteryNone = 0 : Const eMysteryPoints = 1 : Const eMysteryMBall1 = 2
Const eMysteryMBall2 = 3 : Const eMysteryPlayfieldX = 4 : Const eMysteryBonusX = 5
Const eMysteryBallSave = 6 : Const eMysteryBlast = 7 : Const eMysterySuperShot = 8
Const eMysteryAddTime = 9 : Const eMysteryAddABall = 10 : Const eMysteryJoke = 11
Dim asJokeAwards
asJokeAwards = Array("3 KILOS OF PURE DIRT", "LEGALIZE DEATH SAVES", _
	"EAT PLAYER'S QUARTER", "5 FREE GAMES", "TAKE LOWEST SCORE", _
	"MINUS 50 DKP", "PROMOTE A PAWN", "GO TO JAIL", "TROUGH MALFUNCTION", _
	"WARP FACTOR 9", "TOUR THE MANSION", "REVERSE GRAVITY", _
	"FORCE VPX UPDATE")

Dim asBonusLabels
asBonusLabels = Array("BonusCaption", "SwitchCaption", "SwitchValue", _
	"ComboCaption", "ComboValue", "DeliverCaption", "DeliverValue", _
	"BonusX", "BonusTotal", "BonusScoreCaption", "BonusScoreValue")

Dim anBenderJackpotShots
anBenderJackpotShots = Array(eShotLeftLane, eShotLowerScoop, eShotSideLoop, _
	eShotUpperScoop, eShotLeftRamp, eShotCenterLane, eShotRightRamp, eShotRightLoop)

Dim anSwitchLastHit(33)
Dim nTimeAnySwitch
Const nDebounceTime = 150 ' Time in ms to ignore a switch after its last Hit

Const eSwitchNone = -1 : Const eSwitchLeftInlane = 0 : Const eSwitchLeftOutlane = 1
Const eSwitchLeftSpinner = 2 : Const eSwitchLowerScoop = 3 : Const eSwitchLeftSlingShot = 4
Const eSwitchTargetPurple = 5 : Const eSwitchLeftBumper = 6 : Const eSwitchMiddleBumper = 7
Const eSwitchRightBumper = 8 : Const eSwitchSideSpinner = 9 : Const eSwitchLeftLoop = 10
Const eSwitchSideLoop = 11 : Const eSwitchUpperScoop = 12 : Const eSwitchLeftRamp = 13
Const eSwitchUpperSpinner = 14 : Const eSwitchUpperLoop = 15 : Const eSwitchCenterLane = 16
Const eSwitchRightRamp = 17 : Const eSwitchInlineLower = 18 : Const eSwitchInlineMiddle = 19
Const eSwitchInlineUpper = 20 : Const eSwitchInlineEnd = 21 : Const eSwitchRightLoop = 22
Const eSwitchRightLoopEnter = 23 : Const eSwitchDropB = 24 : Const eSwitchDropL = 25
Const eSwitchDropA = 26 : Const eSwitchDropS = 27 : Const eSwitchDropT = 28
Const eSwitchPlungerLane = 29 : Const eSwitchRightOutlane = 30 : Const eSwitchSuicideBooth = 31
Const eSwitchRightinlane = 32 : Const eSwitchRightSlingshot =  33

Dim anSkillShotSwitches
anSkillShotSwitches = Array(eSwitchDropB, eSwitchDropL, eSwitchDropA, eSwitchDropS, _
	eSwitchDropT, eSwitchSideSpinner, eSwitchSideLoop, eSwitchUpperScoop, eSwitchLeftRamp, _
	eSwitchUpperSpinner, eSwitchUpperLoop, eSwitchCenterLane, eSwitchRightLoop, eSwitchRightLoopEnter)
Const eSkillSideSpinner = 0 : Const eSkillSideLoop = 1 : Const eSkillScoopFromRight = 2
Const eSkillScoopFromLeft = 3 : Const eSkillLeftRamp = 4 : Const eSkillLaneFromPlunge = 5
Const eSkillLaneFromLeft = 6 : Const eSkillDrops = 7

' Signpost light numbers
Const eLightExtraBall = 52 : Const eLightMystery = 53
Const eLightSelectMode = 54 : Const eLightCollectCombo = 55
' Blast button light
Const eLightBlastButton = 56
Dim nPostLightStates

' Display priorities
Const ePrioTilt = 1 : Const ePrioNewPlayer = 2 : Const ePrioBallSave = 3
Const ePrioBlast = 4 : Const ePrioSuperJackpot = 5
Const ePrioTiltWarning = 6 : Const ePrioExtraBall = 7 : Const ePrioModeEnd = 8
Const ePrioModeStart = 9 : Const ePrioMystery = 10 : Const ePrioMballStart = 11
Const ePrioComboCollect = 12 : Const ePrioMballReady = 13 : Const ePrioMballLock = 14
Const ePrioModeProgress = 15 : Const ePrioJackpot = 16 : Const ePrioCombo = 17
Const ePrioModeSelect = 18 : Const ePrioSkillShot = 19 : Const ePiroShotLit = 20
Const ePrioBonusX = 21 : Const ePrioBlastAdded = 22 : Const ePrioMysteryLit = 23
Const ePrioIdle = 99

' Light shows
Const eLightShowHatchLong = 1 : Const eLightShowHatchShort = 2 : Const eLightShowRadarLong = 3
Const eLightShowRadarShort = 4 : Const eLightShowRiseLong = 5 : Const eLightShowRiseShort = 6
Const eLightShowSinkLong = 7 : Const eLightShowSinkShort = 8 : Const eLightShowDiagLong = 9
Const eLightShowDiagShort = 10 : Const eLightShowCircleLong = 11 : Const eLightShowCircleShort = 12
Const eLightShowMball1Long = 13 : Const eLightShowMball1Short = 14 :  Const eLightShowMystery = 15
Const eLightShowStrobeLong = 16 : Const eLightShowStrobeShort = 17 : Const eLightShowModeComplete = 18
Const eLightShowNone = 0

'high scores
Const cHighScoreAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ. <"
Const nHighScoreSlots = 5
Dim HighScore(4)
Dim HighScoreName(4)
Dim SortedHighscores()
Dim SortedHighscoreNames()
Dim aScoreRanks
Dim nHighScoreIter
Dim nTimePressedLeft	' For entering highscores: when L button was pressed
Dim nTimePressedRight	' For entering highscores: when R button was pressed
Dim HighscoreLetter		' The index of the current letter in the cHighScoreAlphabet
Dim InitialsEntered     ' The initials being entered in the highscore
Dim bEnteringHighScore	' Are we currently entering a high score?

Const nBallSaveNewBall = 14500
Const nBallSaveMball2 = 12500
Const nBallSaveMiniWizard1 = 22500
Const nBallSaveMiniWizard2 = 32500
Const nBallSaveSlurm = 32500
Const nBallSaveAddBall = 10500
Const nTimeMBallGrace = 4000

'*******************************************
' Per player variables
'*******************************************

Dim fPlayfieldX			' Playfield multiplier for the current player
Dim nTimeXPause			' Time in ms that the playfield multiplier countdown is paused
Dim nTimeXCountdown		' Time in ms until the playfield multiplier counts down
Const nXPauseStart = 5000 ' How long to pause the X countdown after increasing X
Const nXPauseAdd = 2000 ' How long the "add time" spinner pauses the X countdown
Const nXCountdownInterval = 2000 ' Time in ms between decreases of the playfield multiplier
Const nModeAdd = 2000	' How much time the "add time" spinner adds to modes per spin
Dim nBonusX				' Bonus multiplier for the current player
Dim nBonusTotal			' Total bonus earned this ball
Dim bCountingBonus		' Is the game currently displaying the bonus count?
Dim nBonusScreen		' What screen of the bonus is being displayed
Dim avBeerLanes(3)		' BitSet per player of bottom lanes
Dim BIP					' Count of the number of balls 
Dim nBall				' Ball 1, 2, 3, etc for the current player
Dim nExtraBalls			' Number of extra balls the current player has 
Dim anExtraBallsLit		' Count per player of extra balls lit
Dim nTimeBallStart		' Timestamp of when the current ball started
Dim avSkillShotsHit(3)	' Bitset per player of unique skill shots hit
Dim bSkillShotActive	' Boolean, True if a skill shot is active
Dim avDrops5bankHit(3)	' Bitset per player of which drop targets are hit in the right bank
Dim bSettingDrops		' Boolean, true if lowering drops (so they aren't hits)
Dim anComboTimer(11)	' Array per shot of time remaining on combos
Dim anCombos(3)			' Array of counts per player of combos made
Dim anNextComboAward(3)	' Array per player of what the next combo award will be
Dim anComboLastCollect(3) ' Array per player of what combo count was when it was collected
Dim abComboEBCollected(3) ' Boolean per player of if the player collected the extra ball from combos
Dim anBlasts			' Array per player of blast button uses
Dim anMysteryLevelLit	' Which mystery level is lit if any, per player
Dim nTimeMBallGraceLeft	' Time in ms remaining on the multiball grace period
Dim anLiteLockShots		' Count per player of shots towards lighting a lock
Dim abMball1LoopLeft	' Boolean, true if hitting the left loop lights a lock
Dim abMball1LoopRight	' Boolean, true if hitting the right loop lights a lock
Dim anMBall1Locks		' Count per player of virtual lock state for multiball 1
Dim anMball1Played		' Count per player of times multiball 1 has been played
Dim anMball1Jackpots(1) ' Array of what shots are the jackpots during multiball 1
Dim anMBall2Locks		' Count per player of virtual lock state
Dim anMball2Played		' Count per player of times Bender multiball has been played
Dim nTimeDelayMultiball ' Time in ms to delay multiball for a light show
Dim nTimeDelayVUK		' Time in ms to delay kickout on the VUK
Dim nTimeDelayLowerScoop' Time in ms to delay kickout on lower scoop
Dim nTimeDelayBooth		' Time in ms to delay kickout on the suicide booth
Dim nTimeBallSave		' Time in ms left on the ball save
Dim bOutlaneSave		' Boolean of if a ball has been saved after an outlane drain
Dim abBoothReady(3)		' Boolean per player for if the suicide booth can save the ball
Dim nTimeBooth			' Time in ms left to pick a suicide booth option
Dim nTimeBoothChange	' Time in ms until the suicide booth option changes
Dim avBoothOptionsUsed(3) ' BitSet per player of non-drain suicide booth options used
Dim nBoothOption		' The current suicide booth option
Dim bBlinkBoothOption	' Boolean, On / Off state for blinking suicide booth option
Dim bBoothSaved			' True if the suicide booth kicks to the shooter lane, false = drain
Dim nBoothWheel			' Wheel image number on the booth PuP
Dim aanShotLastHit(3, 11)' Time a certain shot was last hit, per player
Dim nModeSelected		' Current choice in mode selection
Dim bSelectingMode		' True if the player is currently selecting a mode
Dim bInMode				' Boolean, true if a one ball mode is currently running
Dim avModesRunning(3)	' Array of bitsets per player of modes currently running
Dim nModePending		' Mode pending on bottom scoop kickout
Dim bMusicAfterKick		' Boolean, True if mode music should play after the scoop kickout
Dim bMovingShip			' boolean, true if the ship is animating on the mode select PuP
Dim nShipMoves			' count of times the ship has moved on the mode select PuP
Dim aanModeTime(3,20)	' Time left per player and mode
Dim aanModeShots(3,20)	' Count of mode shots made per player and mode
Dim aavShotsLit(3,20)	' BitSet per player and mode of shots lit
Dim avModesStarted(3)	' Array of bitsets per player of modes started
Dim avModesCompleted(3)	' Array of bitsets per player of modes completed
Dim aanModeAttempts(3,20) ' Count per player and mode of times the mode is attempted
Dim anModeScore(20)		' Count of points earned during the currect mode attempt
Dim avShotColors(9)		' Array of bitsets for which colors to blink per upper arrow
Dim anMarsShot(3)		' Leftmost shot lit in Mars mode
Dim asModeMessage		' Message to display for mode progress
Dim nTimeModeTextUpdate	' Timestamp of when the mode message was last changed
Dim nTimeModeTextDisplay' Timestamp of when the mode message was last changed on the display
Dim nTimeMarsMove		' Time in ms before shots move in Mars mode
Dim bMarsMoveLeft		' Boolean, true if shots in Mars mode move left
Dim anMoonShotWhite(3)	' Array per player of the white shot in moon mode
Dim anMoonShotGray(3)	' Array per player of the gray shot in moon mode
Dim anAmazoniaLastShot(3) ' Last shot hit in Amazonia mode
Dim anOsirisSpins(3)	' Array per player of top spinner spins in Omicron Persei mode
Dim anOsirisShotsAdded(3)' Array per player of number of shots added in Omicron Persei mode
Dim anOrisisVideos(3)	' Count per player of videos played in Omicron Persei mode
Dim anMiniWizard1JPs(9)	' Array of jackpot shots in Mini-wizard mode 1
Dim nMiniWizard1Videos	' Count of videos played in Mini-wizard mode 1
Dim anSlurmShots(9)		' Count of jackpots made per shot in Slurm
Dim anMysteryShotsMade(3)' Array per player of times the Light Mystery target has been hit
Dim bAddTimeAwarded		' Boolean, True if "add time" has been a mystery award this mode attempt
Dim bAddBallAwarded		' Boolean, True if "add a ball" has been a mystery award this multiball
Dim aanRecentMysteries(3,3)' Array per player of most recent mysteries, most recent first
Dim anPossibleAwards()	' Array of eligible mystery awards
Dim nPossibleAwardCount	' Count of eligible mystery awards
Dim nMysteryAnimStep	' Step of the mystery award display animation
Dim nLightShowPriority	' The priority of the light show currently playing
Dim nLightShowCurrent	' The number of the light show currently running, 0 = none
Dim nLightShowTime		' Time in ms remaining of the light show currently playing
Dim bLightShowBlinkOdd  ' Boolean: If odd or even lights should be on when strobing all lights
Dim anFlashOrder		' Array of what flasher to fire during a light show
Dim nMaxFlashes			' Maximum number of flashers to fire during a light show
Dim nTiltWarnings		' Number of tilt warnings used this ball
Dim nTiltLevel			' How much has the game been nudged?
Dim bShowingInstantInfo ' Is the display currently showing instant info?
Dim nInstantInfoPage    ' Count of which page instant info is currently showing
Dim nTimeInfoChange		' Timestamp of when instant info was last updated
Const cLastInfoPage = 25


'*******************************************
'  ZDMD : FlexDMD
'*******************************************
'
' DMDTimer @17ms
' StartFlex with the intro @ Table1_Init
' Startgame ( KeyDown : PlungerKey ) calls the Game DMD to start if intro is on
' Make a copy of VPWExampleTableDMD folder, rename and paste into Visual Pinball\Tables\"InsertTableNameDMD"
' Update .ProjectFolder = ".\VPWExampleTableDMD\" to DMD folder name from previous step
' Update DMDTimer_Timer Sub to allow DMD to update remaining balls and credit: find ("Ball") and ("Credit")

' For another demo, see the following from the FlexDMD developer:
'   https://github.com/vbousquet/flexdmd/tree/master/FlexDemo


Dim FlexDMD				'This is the FlexDMD object
Dim FlexFrame			'This is the current Frame count. It increments every time DMDTimer_Timer is run
Dim sDMDScene		 	'Name of the DMD scene intended to be playing
Dim sDMDCurrentScene	'Name of the DMD scene currently playing
Dim nDMDMode			'What mode is shown on the mode info screen
Dim sDMDModeName		'What mode name is shown on the mode info screen
Dim sDMDModeGoal		'What mode goal is shown on the mode info screen
Dim sDMDModeInfo		'What is shown for time and shots left on the mode info screen
Dim sDMDModeScore		'What is shown as the score on the mode info screen
Dim sDMDModeBlasts		'What is shown as the blast count the mode info screen

Const 	FlexDMD_RenderMode_DMD_GRAY = 0, _
		FlexDMD_RenderMode_DMD_GRAY_4 = 1, _
		FlexDMD_RenderMode_DMD_RGB = 2, _
		FlexDMD_RenderMode_SEG_2x16Alpha = 3, _
		FlexDMD_RenderMode_SEG_2x20Alpha = 4, _
		FlexDMD_RenderMode_SEG_2x7Alpha_2x7Num = 5, _
		FlexDMD_RenderMode_SEG_2x7Alpha_2x7Num_4x1Num = 6, _
		FlexDMD_RenderMode_SEG_2x7Num_2x7Num_4x1Num = 7, _
		FlexDMD_RenderMode_SEG_2x7Num_2x7Num_10x1Num = 8, _
		FlexDMD_RenderMode_SEG_2x7Num_2x7Num_4x1Num_gen7 = 9, _
		FlexDMD_RenderMode_SEG_2x7Num10_2x7Num10_4x1Num = 10, _
		FlexDMD_RenderMode_SEG_2x6Num_2x6Num_4x1Num = 11, _
		FlexDMD_RenderMode_SEG_2x6Num10_2x6Num10_4x1Num = 12, _
		FlexDMD_RenderMode_SEG_4x7Num10 = 13, _
		FlexDMD_RenderMode_SEG_6x4Num_4x1Num = 14, _
		FlexDMD_RenderMode_SEG_2x7Num_4x1Num_1x16Alpha = 15, _
		FlexDMD_RenderMode_SEG_1x16Alpha_1x16Num_1x7Num = 16

Const FlexDMD_Align_TopLeft = 0
Const FlexDMD_Align_Top = 1
Const FlexDMD_Align_TopRight = 2
Const FlexDMD_Align_Left = 3
Const FlexDMD_Align_Center = 4
Const FlexDMD_Align_Right = 5
Const FlexDMD_Align_BottomLeft = 6
Const FlexDMD_Align_Bottom = 7
Const FlexDMD_Align_BottomRight = 8

Const cColorGray66 = &ha9a9a9
Const cColorGray33 = &h555555
Dim oDMDFontTiny, oDMDFontSmall, oDMDFontSmallThin, oDMDFontThinScore
Dim oDMDFontMedium, oDMDFontBig, oDMDFontHuge, oDMDFontAttract, oDMDFontColossal
Dim oDMDFontTinyDark, oDMDFontSmallDark
Dim oDMDFontTinyFaded, oDMDFontScoreFaded, oDMDFontSmallFaded ' FlexDMD fonts
Dim oDMDScoreboard	' FlexDMD Scene object for the scoreboard
Dim oDMDModeName	' FlexDMD Label object for the mode name
Dim oDMDModeInfoSB	' FlexDMD Label object for the mode info on the scoreboard
Dim oDMDScoreP1	' FlexDMD Label object for player 1 score
Dim oDMDScoreP2	' FlexDMD Label object for player 2 score
Dim oDMDScoreP3	' FlexDMD Label object for player 3 score
Dim oDMDScoreP4	' FlexDMD Label object for player 4 score
Dim oDMDCredits ' FlexDMD Label object for credits text (will always say FREE PLAY)
Dim oDMDBlasts	' FlexDMD Label object for Number of hadron enforcers
Dim oDMDBallNr	' FlexDMD Label object for ball number
Dim oDMD1Line ' FlexDMD Scene object for showing 1 text line
Dim oDMD1LineText ' FlexDMD Label object for the text in a 1 line text scene
Dim oDMDAttract ' FlexDMD Scene object for attract mode
Dim oDMDAttractLine1 ' FlexDMD Scene object for line 1 of attract mode text
Dim oDMDAttractLine2 ' FlexDMD Scene object for line 2 of attract mode text
Dim oDMD2Line ' FlexDMD Scene object for showing 2 text lines
Dim oDMD2LineText1 ' FlexDMD Label object for the text in line 1 of a 2 line text scene
Dim oDMD2LineText2 ' FlexDMD Label object for the text in line 2 of a 2 line text scene
Dim oDMD3Line ' FlexDMD Scene object for showing 3 text lines
Dim oDMD3LineText1 ' FlexDMD Label object for the text in line 1 of a 3 line text scene
Dim oDMD3LineText2 ' FlexDMD Label object for the text in line 2 of a 3 line text scene
Dim oDMD3LineText3 ' FlexDMD Label object for the text in line 3 of a 3 line text scene
Dim oDMDModeInfo ' FlexDMD Scene object for showing mode info
Dim oDMDModeInfoName ' FlexDMD Label object for the name of a mode
Dim oDMDModeInfoGoal ' FlexDMD Label object for the goal of a mode
Dim oDMDModeInfoStatus ' FlexDMD Label object for the status of a mode
Dim oDMDModeInfoBlasts ' FlexDMD Label object for ball and player number when in a mode
Dim oDMDModeInfoScore ' FlexDMD Label object for current player's score when in a mode
Dim oDMDBooth ' FlexDMD scene for the suicide booth
Dim aoDMDBoothOptions(5) ' Array of FlexDMD Label objects for the suicide booth options
Dim oDMDBoothTimer ' FlexDMD Label object for the suicide booth timer
Dim oDMDBoothInfo ' FlexDMD Label object for the suicide booth instructions
Dim oDMDInstantInfo ' FlexDMD Scene object for showing instant info
Dim oDMDInstantInfoHeader ' FlexDMD Label object for the instant info header
Dim oDMDInstantInfoLine1 ' FlexDMD Label object for line 1 of instant info
Dim oDMDInstantInfoLine2 ' FlexDMD Label object for line 2 of instant info

Dim DMDTextOnScore
Dim nDMDTextDisplayTime ' Time in ms the current text has been displayed
Dim nTimePupStartPlay	' Timestamp of when the current video started playing. 0 = no video
Dim bDMD4PlayerScores	' true = show score, false = show ball number
Dim nDMD4PlayerTime		' Timestamp of changing between score and ball number
Dim DMDTextEffect


Sub Flex_Init
	If UseFlexDMD = 0 Then Exit Sub
	Set FlexDMD = CreateObject("FlexDMD.FlexDMD")
    If FlexDMD is Nothing Then
        MsgBox "No FlexDMD found. This table will NOT run without it."
        Exit Sub
    End If
	With FlexDMD
		.GameName = cGameName
		.TableFile = Table1.Filename & ".vpx"
		.Color = RGB(255, 88, 32)
		.RenderMode = FlexDMD_RenderMode_DMD_GRAY_4
		.Width = 128
		.Height = 32
		.ProjectFolder = "./Futurama.flexDMD/"
		.Clear = True
		.Run = True
	End With
	Set oDMDFontTiny = FlexDMD.NewFont("FlexDMD.Resources.teeny_tiny_pixls-5.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontSmall = FlexDMD.NewFont("FlexDMD.Resources.udmd-f4by5.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontSmallThin = FlexDMD.NewFont("4x8px.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontThinScore = FlexDMD.NewFont("5x10digits.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontMedium = FlexDMD.NewFont("FlexDMD.Resources.udmd-f5by7.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontBig = FlexDMD.NewFont("6x12bold.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontHuge = FlexDMD.NewFont("FlexDMD.Resources.udmd-f6by12.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontAttract = FlexDMD.NewFont("FlexDMD.Resources.udmd-f7by13.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontColossal = FlexDMD.NewFont("FlexDMD.Resources.udmd-f12by24.fnt", vbWhite, vbWhite, 0)
	Set oDMDFontTinyFaded = FlexDMD.NewFont("4x8px.fnt", cColorGray66, cColorGray66, 0)
	Set oDMDFontSmallFaded = FlexDMD.NewFont("FlexDMD.Resources.udmd-f4by5.fnt", cColorGray66, cColorGray66, 0)
	Set oDMDFontScoreFaded = FlexDMD.NewFont("5x8digits.fnt", cColorGray66, cColorGray66, 0)
	Set oDMDFontTinyDark = FlexDMD.NewFont("FlexDMD.Resources.teeny_tiny_pixls-5.fnt", cColorGray33, cColorGray33, 0)
	Set oDMDFontSmallDark = FlexDMD.NewFont("FlexDMD.Resources.udmd-f4by5.fnt", cColorGray33, cColorGray33, 0)
	CreateDMDScoreboard
	CreateDMDScenes
End Sub

Sub CreateDMDScenes
	FlexDMD.LockRenderThread

	' One big line of Text
	Set oDMD1Line = FlexDMD.NewGroup("oneline")
    oDMD1Line.AddActor FlexDMD.NewImage("Back", "FlexDMD.Resources.dmds.black.png")
	Set oDMD1LineText = FlexDMD.NewLabel("onelinetext", oDMDFontAttract, " ")
	oDMD1LineText.SetAlignedPosition 64, 16, FlexDMD_Align_Center
	oDMD1Line.AddActor oDMD1LineText

	' Attract mode (Two lines, one big, and one bigger)
	Set oDMDAttract = FlexDMD.NewGroup("attract")
	oDMDAttract.AddActor FlexDMD.NewImage("Back", "FlexDMD.Resources.dmds.black.png")
	Set oDMDAttractLine1 = FlexDMD.NewLabel("linea1", oDMDFontHuge, " ")
	oDMDAttractLine1.SetAlignedPosition 64, 8, FlexDMD_Align_Center
	oDMDAttract.AddActor oDMDAttractLine1
	Set oDMDAttractLine2 = FlexDMD.NewLabel("linea2", oDMDFontAttract, " ")
	oDMDAttractLine2.SetAlignedPosition 64, 24, FlexDMD_Align_Center
	oDMDAttract.AddActor oDMDAttractLine2

	' 2 text lines (one big header, smaller text on bottom)
	Set oDMD2Line = FlexDMD.NewGroup("twoline")
	oDMD2Line.AddActor FlexDMD.NewImage("Back", "FlexDMD.Resources.dmds.black.png")
	Set oDMD2LineText1 = FlexDMD.NewLabel("line2a", oDMDFontBig, " ")
	oDMD2LineText1.SetAlignedPosition 64, 8, FlexDMD_Align_Center
	oDMD2Line.AddActor oDMD2LineText1
	Set oDMD2LineText2 = FlexDMD.NewLabel("line2b", oDMDFontMedium, " ")
	oDMD2LineText2.SetAlignedPosition 64, 24, FlexDMD_Align_Center
	oDMD2Line.AddActor oDMD2LineText2

	' 3 text lines (one big header, 2 lines of smaller text on bottom)
	Set oDMD3Line = FlexDMD.NewGroup("threeline")
	oDMD3Line.AddActor FlexDMD.NewImage("Back", "FlexDMD.Resources.dmds.black.png")
	Set oDMD3LineText1 = FlexDMD.NewLabel("line3a", oDMDFontBig, " ")
	oDMD3Line.AddActor oDMD3LineText1
	Set oDMD3LineText2 = FlexDMD.NewLabel("line3b", oDMDFontMedium, " ")
	oDMD3Line.AddActor oDMD3LineText2
	Set oDMD3LineText3 = FlexDMD.NewLabel("line3c", oDMDFontMedium, " ")
	oDMD3LineText1.SetAlignedPosition 64, 2, FlexDMD_Align_Top
	oDMD3LineText2.SetAlignedPosition 64, 15, FlexDMD_Align_Top
	oDMD3LineText3.SetAlignedPosition 64, 24, FlexDMD_Align_Top
	oDMD3Line.AddActor oDMD3LineText3

	' 4 text lines (one big header, 3 lines of smaller text on bottom)
	Set oDMDModeInfo = FlexDMD.NewGroup("modeinfo")
	oDMDModeInfo.AddActor FlexDMD.NewImage("Back", "FlexDMD.Resources.dmds.black.png")
	Set oDMDModeInfoName = FlexDMD.NewLabel("modename", oDMDFontBig, " ")
	oDMDModeInfo.AddActor oDMDModeInfoName
	Set oDMDModeInfoGoal = FlexDMD.NewLabel("modegoal", oDMDFontSmall, " ")
	oDMDModeInfo.AddActor oDMDModeInfoGoal
	Set oDMDModeInfoStatus = FlexDMD.NewLabel("modestatus", oDMDFontMedium, " ")
	oDMDModeInfo.AddActor oDMDModeInfoStatus
	Set oDMDModeInfoScore = FlexDMD.NewLabel("modeplayer", oDMDFontSmall, " ")
	oDMDModeInfo.AddActor oDMDModeInfoScore
	Set oDMDModeInfoBlasts = FlexDMD.NewLabel("modescore", oDMDFontSmall, " ")
	oDMDModeInfo.AddActor oDMDModeInfoBlasts
	oDMDModeInfoName.SetAlignedPosition 64, 0, FlexDMD_Align_Top
	oDMDModeInfoGoal.SetAlignedPosition 64, 12, FlexDMD_Align_Top
	oDMDModeInfoStatus.SetAlignedPosition 64, 18, FlexDMD_Align_Top
	oDMDModeInfoScore.SetAlignedPosition 0, 27, FlexDMD_Align_TopLeft
	oDMDModeInfoBlasts.SetAlignedPosition 128, 27, FlexDMD_Align_TopRight
	
	' Suicide booth wheel of misfortune
	Set oDMDBooth = FlexDMD.NewGroup("booth")
	oDMDBooth.AddActor FlexDMD.NewImage("Back", "FlexDMD.Resources.dmds.black.png")
	Set aoDMDBoothOptions(0) = FlexDMD.NewLabel("opt1", oDMDFontSmallDark , "LOSE BALL")
	oDMDBooth.AddActor aoDMDBoothOptions(0)
	Set aoDMDBoothOptions(1) = FlexDMD.NewLabel("opt2", oDMDFontSmallDark, "HYPNOTOAD")
	oDMDBooth.AddActor aoDMDBoothOptions(1)
	Set aoDMDBoothOptions(2) = FlexDMD.NewLabel("opt3", oDMDFontSmallDark, "LOSE BALL")
	oDMDBooth.AddActor aoDMDBoothOptions(2)
	Set aoDMDBoothOptions(3) = FlexDMD.NewLabel("opt4", oDMDFontSmallDark, "0.5 X PLAYFIELD")
	oDMDBooth.AddActor aoDMDBoothOptions(3)
	Set aoDMDBoothOptions(4) = FlexDMD.NewLabel("opt5", oDMDFontSmallDark, "LOSE BALL")
	oDMDBooth.AddActor aoDMDBoothOptions(4)
	Set aoDMDBoothOptions(5) = FlexDMD.NewLabel("opt6", oDMDFontTinyDark, "REVERSE FLIP")
	oDMDBooth.AddActor aoDMDBoothOptions(5)
	Set oDMDBoothInfo = FlexDMD.NewLabel("instructions", oDMDFontSmallThin, "PRESS ACTION BUTTON TO CHOOSE")
	oDMDBooth.AddActor oDMDBoothInfo
	Set oDMDBoothTimer =  FlexDMD.NewLabel("timer", oDMDfontColossal, "5")
	oDMDBooth.AddActor oDMDBoothTimer
	aoDMDBoothOptions(0).SetAlignedPosition 70, 8, FlexDMD_Align_Top
	aoDMDBoothOptions(1).SetAlignedPosition 74, 14, FlexDMD_Align_TopLeft
	aoDMDBoothOptions(2).SetAlignedPosition 74, 20, FlexDMD_Align_TopLeft
	aoDMDBoothOptions(3).SetAlignedPosition 70, 26, FlexDMD_Align_Top
	aoDMDBoothOptions(4).SetAlignedPosition 66, 20, FlexDMD_Align_TopRight
	aoDMDBoothOptions(5).SetAlignedPosition 66, 14, FlexDMD_Align_TopRight
	oDMDBoothInfo.SetAlignedPosition 64, 0, FlexDMD_Align_Top
	oDMDBoothTimer.SetAlignedPosition 0, 8, FlexDMD_Align_TopLeft

	' Instant info
	Set oDMDInstantInfo = FlexDMD.NewGroup("instantinfo")
	oDMDInstantInfo.AddActor FlexDMD.NewImage("Back", "FlexDMD.Resources.dmds.black.png")
	Set oDMDInstantInfoHeader = FlexDMD.NewLabel("infohead", oDMDFontMedium , "INSTANT INFO")
	oDMDInstantInfo.AddActor oDMDInstantInfoHeader
	Set oDMDInstantInfoLine1 = FlexDMD.NewLabel("infoline1", oDMDFontBig , "")
	oDMDInstantInfo.AddActor oDMDInstantInfoLine1
	Set oDMDInstantInfoLine2 = FlexDMD.NewLabel("infoline2", oDMDFontBig , "")
	oDMDInstantInfo.AddActor oDMDInstantInfoLine2
	oDMDInstantInfoHeader.SetAlignedPosition 64, 0, FlexDMD_Align_Top
	oDMDInstantInfoLine1.SetAlignedPosition 64, 8, FlexDMD_Align_Top
	oDMDInstantInfoLine2.SetAlignedPosition 64, 20, FlexDMD_Align_Top

	FlexDMD.UnlockRenderThread
End Sub

Dim nScoreLastFrame, bScoreUpdatedThisFrame ' The score last frame (only change font once when score >= 1B)
Dim aoDMDScores

Sub CreateDMDScoreboard
	If UseFlexDMD = 0 Then Exit Sub

	Set oDMDScoreboard = FlexDMD.NewGroup("scoreboard")
	
	With oDMDScoreboard
		.AddActor FlexDMD.NewImage("bg","FlexDMD.Resources.dmds.black.png")
		.Getimage("bg").visible = True ' False
	End With
	Set oDMDModeName = FlexDMD.NewLabel("scoremode", oDMDFontTiny, " ")
	oDMDModeName.SetAlignedPosition 0, 21, FlexDMD_Align_TopLeft
	Set oDMDModeInfoSB = FlexDMD.NewLabel("scoretime", oDMDFontTiny, " ")
	oDMDModeInfoSB.SetAlignedPosition 128, 21, FlexDMD_Align_TopRight
    Set oDMDScoreP1 = FlexDMD.NewLabel("scorep1", oDMDFontBig, " ")
	oDMDScoreP1.SetAlignedPosition 0, 0, FlexDMD_Align_TopLeft
    Set oDMDScoreP2 = FlexDMD.NewLabel("scorep2", oDMDFontSmall, " ")
	oDMDScoreP2.SetAlignedPosition 128, 0, FlexDMD_Align_TopRight
    Set oDMDScoreP3 = FlexDMD.NewLabel("scorep3", oDMDFontSmall, " ")
	oDMDScoreP3.SetAlignedPosition 0, 13, FlexDMD_Align_TopLeft
    Set oDMDScoreP4 = FlexDMD.NewLabel("scorep4", oDMDFontSmall, " ")
	oDMDScoreP4.SetAlignedPosition 128, 6, FlexDMD_Align_TopRight
	Set oDMDCredits = FlexDMD.NewLabel("credits", oDMDFontSmallFaded, "FREE PLAY")
	oDMDCredits.SetAlignedPosition 128, 27, FlexDMD_Align_TopRight
	Set oDMDBlasts = FlexDMD.NewLabel("blasts", oDMDFontTiny, " ")
	oDMDBlasts.SetAlignedPosition 58, 27, FlexDMD_Align_Top
	Set oDMDBallNr = FlexDMD.NewLabel("ballnr", oDMDFontSmall, "GAME OVER")
	oDMDBallNr.SetAlignedPosition 0, 27, FlexDMD_Align_TopLeft


	FlexDMD.LockRenderThread
	With oDMDScoreboard
		.AddActor oDMDScoreP1
		.AddActor oDMDScoreP2
		.AddActor oDMDScoreP3
		.AddActor oDMDScoreP4
		.AddActor oDMDCredits
		.AddActor oDMDBallNr
		.AddActor oDMDBlasts
		.AddActor oDMDModeName
		.AddActor oDMDModeInfoSB
	End With
	aoDMDScores = Array(oDMDScoreP1, oDMDScoreP2, oDMDScoreP3, oDMDScoreP4)
	FlexDMD.UnlockRenderThread
End Sub

Sub DMDUpdateModeInfo
	Dim sNewName, sNewGoal, nTimeDisplayed, nShots, sNewInfo, sNewScore, sNewBlasts, i
	Dim nSuperValue, nShotsComplete, bTimedModeRunning

	If Not bInMode Then
		sDMDScene = "scoreboard"
		Exit Sub
	End If
	sNewName = asModeNames(nDMDMode)
	sNewGoal = asModeGoals(nDMDMode)

	bTimedModeRunning = False
	If avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
		nShots = 1
		For i = 0 to 8
			if anMiniWizard1JPs(i) <> eShotNone Then
				nShots = nShots + 1
			End If
		Next

		Select Case (nDMDTextDisplayTime \ 2000) Mod nShots
			Case 1
				sNewInfo = "RED = " & FormatScore(2 * SCORE_MINIWIZONE_BASE)
			Case 2
				sNewInfo = "ORANGE = " & FormatScore(3 * SCORE_MINIWIZONE_BASE)
			Case 3
				sNewInfo = "YELLOW = " & FormatScore(4 * SCORE_MINIWIZONE_BASE)
			Case 4
				sNewInfo = "LIME = " & FormatScore(5 * SCORE_MINIWIZONE_BASE)
			Case 5
				sNewInfo = "GREEN = " & FormatScore(6 * SCORE_MINIWIZONE_BASE)
			Case 6
				sNewInfo = "TEAL = " & FormatScore(7 * SCORE_MINIWIZONE_BASE)
			Case 7
				sNewInfo = "BLUE = " & FormatScore(8 * SCORE_MINIWIZONE_BASE)
			Case 8
				sNewInfo = "PURPLE = " & FormatScore(9 * SCORE_MINIWIZONE_BASE)
			Case 9
				sNewInfo = "PINK = " & FormatScore(10 * SCORE_MINIWIZONE_BASE)
			Case Else
				sNewInfo = "WHITE = " & FormatScore(SCORE_MINIWIZONE_BASE)
		End Select
	Elseif avModesRunning(nPlayer).Contains(eModeImmolation) Then
		sNewInfo = BIP & " BALLS - JACKPOT=" & (BIP * 12) & "M"
	Elseif avModesRunning(nPlayer).Contains(eModeSlurm) Then
		nSuperValue = 0
		nShotsComplete = 0
		For i = 0 to 9
			If anSlurmShots(i) >= 3 Then
				nSuperValue = nSuperValue + _
					SCORE_SLURM_SUPERJP + (SCORE_SLURM_ADD * nShotsComplete)
				nShotsComplete = nShotsComplete + 1
			End If
		Next

		If 0 = nShotsComplete Then
			sNewInfo = "GREEN LITES SUPER JP"
		Else
			sNewInfo = "SUPER JP = " & FormatScore(nSuperValue)
		End If
	Else
		bTimedModeRunning = True
		nTimeDisplayed = (aanModeTime(nPlayer, nDMDMode) - 2500) \ 1000
		If nTimeDisplayed < 0 then nTimeDisplayed = 0
		nShots = anShotsToWin(nDMDMode) - aanModeShots(nPlayer, nDMDMode)
		If 1 = nShots Then
			sNewInfo = "1 SHOT LEFT  TIME:" & nTimeDisplayed
		Else
			sNewInfo = nShots & " SHOTS LEFT  TIME:" & nTimeDisplayed
		End If
	End If
	sNewScore = "P" & (1 + nPlayer) & " " & FormatScore(anScore(nPlayer))
	If 1 = anBlasts(nPlayer) Then
		sNewBlasts = "1 BLAST"
	Else
		sNewBlasts = anBlasts(nPlayer) & " BLASTS"
	End If

	If UseFlexDMD Then FlexDMD.LockRenderThread
	If sNewName <> sDMDModeName Then
		If UseFlexDMD Then oDMDModeInfoName.text = sNewName
		If UseFlexDMD Then oDMDModeInfoName.SetAlignedPosition 64, 0, FlexDMD_Align_Top
		sDMDModeName = sNewName
	End If
	If sNewGoal <> sDMDModeGoal Then
		If UseFlexDMD Then oDMDModeInfoGoal.text = sNewGoal
		If UseFlexDMD Then oDMDModeInfoGoal.SetAlignedPosition 64, 12, FlexDMD_Align_Top
		If bEnablePuP Then pDMDLabelSet "ModeInfo", sNewGoal
		sDMDModeGoal = sNewGoal
	End If
	If sNewInfo <> sDMDModeInfo Then
		If UseFlexDMD Then oDMDModeInfoStatus.text = sNewInfo
		If UseFlexDMD Then oDMDModeInfoStatus.SetAlignedPosition 64, 18, FlexDMD_Align_Top
		If bEnablePuP And bTimedModeRunning Then
			pDMDLabelSet "TimeSeconds", nTimeDisplayed
			pDMDLabelSet "ShotsLeft", nShots
		Elseif bEnablePuP and (Not bTimedModeRunning) Then
			pDMDLabelSet "ModeInfo", sNewInfo
		End If
		sDMDModeInfo = sNewInfo
	End If
	If sNewScore <> sDMDModeScore Then
		If UseFlexDMD Then oDMDModeInfoScore.text = sNewScore
		If len(sNewScore) <> len(sDMDModeScore) Then
			If UseFlexDMD Then oDMDModeInfoScore.SetAlignedPosition 0, 27, FlexDMD_Align_TopLeft
		End If
		sDMDModeScore = sNewScore
	End If
	If sNewBlasts <> sDMDModeBlasts Then
		If UseFlexDMD Then oDMDModeInfoBlasts.text = sNewBlasts
		If UseFlexDMD Then oDMDModeInfoBlasts.SetAlignedPosition 128, 27, FlexDMD_Align_TopRight
		sDMDModeBlasts = sNewBlasts
	End If
	If UseFlexDMD Then FlexDMD.UnlockRenderThread
End Sub

'Sub DMDShootAgain
'	DMDTimedText Array("SHOOT AGAIN", "PLAYER " & (nPlayer + 1)), 2500, ePrioNewPlayer
'End Sub

Sub DMDUpdateScore
	Dim i, j, sScores(3)
	Dim nMillions, nFrames, fFontSize

	If sDMDCurrentScene <> "scoreboard" And (Not bEnablePuP) then exit sub

	' Update if the player changes or the number of digits in the score changes
	if bPlayerChanged Or (Len(nScoreLastFrame) <> Len(anScore(nPlayer))) Then
		If bEnablePuP And bPlayerChanged Then
			For i = 0 to 3
				If i < nPlayersInGame Then
					sScores(i) = FormatScore(anScore(i))
				Elseif 3 = i Then
					sScores(i) = "BALL " & nBall
				Else
					sScores(i) = ""
				End If
			Next
			
			Select Case nPlayer
				Case 0
					pDMDLabelShow "ScoreOverlay1"
					pDMDLabelHide "ScoreOverlay2"
					pDMDLabelHide "ScoreOverlay3"
					pDMDLabelHide "ScoreOverlay4"
					' Handle 12+ digit scores
					If anScore(nPlayer) >= 1e11 Then
						pDMDLabelSet "Score1Big", " "
						PuPlayer.LabelSet pDMD, "Score1Small", sScores(0), 1,_
							"{'mt':2, 'xpos':15.2, 'ypos':95.5}"
					Else
						PuPlayer.LabelSet pDMD, "Score1Big", sScores(0), 1,_
							"{'mt':2, 'xpos':15.2, 'ypos':95.5}"
						pDMDLabelSet "Score1Small", " "
					End If
					pDMDLabelSet "Score2Big", " "
					PuPlayer.LabelSet pDMD, "Score2Small", sScores(1), 1,_
						"{'mt':2, 'xpos':42.3, 'ypos':97.5}"
					pDMDLabelSet "Score3Big", " "
					PuPlayer.LabelSet pDMD, "Score3Small", sScores(2), 1,_
						"{'mt':2, 'xpos':65.3, 'ypos':97.5}"
					pDMDLabelSet "Score4Big", " "
					PuPlayer.LabelSet pDMD, "Score4Small", sScores(3), 1,_
						"{'mt':2, 'xpos':88.4, 'ypos':97.5}"
				Case 1
					pDMDLabelHide "ScoreOverlay1"
					pDMDLabelShow "ScoreOverlay2"
					pDMDLabelHide "ScoreOverlay3"
					pDMDLabelHide "ScoreOverlay4"
					pDMDLabelSet "Score1Big", " "
					PuPlayer.LabelSet pDMD, "Score1Small", sScores(0), 1,_
						"{'mt':2, 'xpos':11.5, 'ypos':97.5}"
					' Handle 12+ digit scores
					If anScore(nPlayer) >= 1e11 Then
						pDMDLabelSet "Score2Big", " "
						PuPlayer.LabelSet pDMD, "Score2Small", sScores(1), 1,_
							"{'mt':2, 'xpos': 38.5, 'ypos': 95.5}"
					Else
						PuPlayer.LabelSet pDMD, "Score2Big", sScores(1), 1,_
							"{'mt':2, 'xpos': 38.5, 'ypos': 95.5}"
						pDMDLabelSet "Score2Small", " "
					End If
					pDMDLabelSet "Score3Big", " "
					PuPlayer.LabelSet pDMD, "Score3Small", sScores(2), 1,_
						"{'mt':2, 'xpos':65.3, 'ypos':97.5}"
					pDMDLabelSet "Score4Big", " "
					PuPlayer.LabelSet pDMD, "Score4Small", sScores(3), 1,_
						"{'mt':2, 'xpos':88.4, 'ypos':97.5}"
				Case 2
					pDMDLabelHide "ScoreOverlay1"
					pDMDLabelHide "ScoreOverlay2"
					pDMDLabelShow "ScoreOverlay3"
					pDMDLabelHide "ScoreOverlay4"
					pDMDLabelSet "Score1Big", " "
					PuPlayer.LabelSet pDMD, "Score1Small", sScores(0), 1,_
						"{'mt':2, 'xpos':11.5, 'ypos':97.5}"
					pDMDLabelSet "Score2Big", " "
					PuPlayer.LabelSet pDMD, "Score2Small", sScores(1), 1,_
						"{'mt':2, 'xpos':34.6, 'ypos':97.5}"
					' Handle 12+ digit scores
					If anScore(nPlayer) >= 1e11 Then
						pDMDLabelSet "Score3Big", " "
						PuPlayer.LabelSet pDMD, "Score3Small", sScores(2), 1,_
							"{'mt':2, 'xpos': 61.5, 'ypos': 95.5}"
					Else
						PuPlayer.LabelSet pDMD, "Score3Big", sScores(2), 1,_
							"{'mt':2, 'xpos': 61.5, 'ypos': 95.5}"
						pDMDLabelSet "Score3Small", " "
					End If
					pDMDLabelSet "Score4Big", " "
					PuPlayer.LabelSet pDMD, "Score4Small", sScores(3), 1,_
						"{'mt':2, 'xpos':88.4, 'ypos':97.5}"
				Case 3
					pDMDLabelHide "ScoreOverlay1"
					pDMDLabelHide "ScoreOverlay2"
					pDMDLabelHide "ScoreOverlay3"
					pDMDLabelShow "ScoreOverlay4"
					pDMDLabelSet "Score1Big", " "
					PuPlayer.LabelSet pDMD, "Score1Small", sScores(0), 1,_
						"{'mt':2, 'xpos':11.5, 'ypos':97.5}"
					pDMDLabelSet "Score2Big", " "
					PuPlayer.LabelSet pDMD, "Score2Small", sScores(1), 1,_
						"{'mt':2, 'xpos':34.6, 'ypos':97.5}"
					pDMDLabelSet "Score3Big", " "
					PuPlayer.LabelSet pDMD, "Score3Small", sScores(2), 1,_
						"{'mt':2, 'xpos':58.5, 'ypos':97.5}"
					' Handle 12+ digit scores
					If anScore(nPlayer) >= 1e11 Then
						pDMDLabelSet "Score4Big", " "
						PuPlayer.LabelSet pDMD, "Score4Small", sScores(3), 1,_
							"{'mt':2, 'xpos':84.6, 'ypos':95.5}"
					Else
						PuPlayer.LabelSet pDMD, "Score4Big", sScores(3), 1,_
							"{'mt':2, 'xpos':84.6, 'ypos':95.5}"
						pDMDLabelSet "Score4Small", " "
					End If
			End Select
		End If
		bPlayerChanged = False
		If UseFlexDMD Then
			FlexDMD.LockRenderThread
			For j = 0 to 3
				If ((nPlayersInGame < 1 And anScore(j) = 0) _
				Or (nPlayersInGame > 0 And j > (nPlayersInGame - 1))) Then
					aoDMDScores(j).Text = " "
				ElseIf j = nPlayer Then
					If anScore(j) < 1e9 then
						aoDMDScores(j).Font = oDMDFontHuge
					Elseif anScore(j) < 1e11 Then' Smaller font if score >= 1B
						aoDMDScores(j).Font = oDMDFontBig
					Else ' Even smaller font if score >= 100B
						aoDMDScores(j).Font = oDMDFontThinScore
					End If
					aoDMDScores(j).Text = Trim(FormatScore(anScore(j)))
				Else
					If anScore(j) < 1e9 then
						aoDMDScores(j).Font = oDMDFontScoreFaded
					Else ' Smaller font if score > 1B
						aoDMDScores(j).Font = oDMDFontTinyFaded
					End If
					If anScore(j) >= 1e12 Then ' handle trillions
						nMillions = Int(anScore(j) / 1e6)
						aoDMDScores(j).Text = Trim(FormatScore(nMillions)) & " MIL"
					Else
						aoDMDScores(j).Text = Trim(FormatScore(anScore(j)))
					End If
				End If
			Next
			Select Case nPlayer
				Case 0
					oDMDScoreP1.SetAlignedPosition 0, 0, FlexDMD_Align_TopLeft
					oDMDScoreP2.SetAlignedPosition 128, 0, FlexDMD_Align_TopRight
					oDMDScoreP3.SetAlignedPosition 0, 13, FlexDMD_Align_TopLeft
					oDMDScoreP4.SetAlignedPosition 128, 13, FlexDMD_Align_TopRight
				Case 1
					oDMDScoreP1.SetAlignedPosition 0, 0, FlexDMD_Align_TopLeft
					oDMDScoreP2.SetAlignedPosition 128, 0, FlexDMD_Align_TopRight
					oDMDScoreP3.SetAlignedPosition 0, 13, FlexDMD_Align_TopLeft
					oDMDScoreP4.SetAlignedPosition 128, 13, FlexDMD_Align_TopRight
				Case Else
					oDMDScoreP1.SetAlignedPosition 0, 0, FlexDMD_Align_TopLeft
					oDMDScoreP2.SetAlignedPosition 128, 0, FlexDMD_Align_TopRight
					oDMDScoreP3.SetAlignedPosition 0, 8, FlexDMD_Align_TopLeft
					oDMDScoreP4.SetAlignedPosition 128, 8, FlexDMD_Align_TopRight
			End Select
			DMDUpdateModeOnScoreboard
			FlexDMD.UnlockRenderThread
		End If
	Else
		If UseFlexDMD Then
			FlexDMD.LockRenderThread
			aoDMDScores(nPlayer).Text = Trim(FormatScore(anScore(nPlayer)))
			DMDUpdateModeOnScoreboard
			FlexDMD.UnlockRenderThread
		End If
		if bEnablePuP Then
			' Only update every 3rd frame for performance
			nFrames = nDMDTextDisplayTime \ DMDTimer.Interval
			If nFrames Mod 3 = 0 Then
				' Handle 12+ digit scores
				If anScore(nPlayer) >= 1e11 Then
					pDMDLabelSet "Score" & (1 + nPlayer) & "Small", FormatScore(anScore(nPlayer))
					pDMDLabelSet "Score" & (1 + nPlayer) & "Big", ""
				Else
					pDMDLabelSet "Score" & (1 + nPlayer) & "Small", ""
					pDMDLabelSet "Score" & (1 + nPlayer) & "Big", FormatScore(anScore(nPlayer))
				End If
				If 4 = nPlayersInGame Then
					' every 2 seconds, switch between displaying ball nr and score
					If Gametime - nDMD4PlayerTime > 2000 Then
						nDMD4PlayerTime = GameTime
						bDMD4PlayerScores = Not bDMD4PlayerScores
						If bDMD4PlayerScores Then
							If 3 = nPlayer Then
								pDMDLabelSet "Score1Small", FormatScore(anScore(0))
							Else
								pDMDLabelSet "Score4Small", FormatScore(anScore(3))
							End If
						Else
							If 3 = nPlayer Then
								pDMDLabelSet "Score1Small", "BALL " & nBall
							Else
								pDMDLabelSet "Score4Small", "BALL " & nBall
							End If
						End If
					End If
				End If
				' Update playfield X
				If LightStateOn = D1Period.state then
					Dim nFirstDigit, nSecondDigit, nNumber
					nNumber = Round(10 * fPlayfieldX)
					nFirstDigit = nNumber \ 10
					nSecondDigit = nNumber Mod 10

					pDMDLabelSet "MultiplierLabel1", "PLAYFIELD"
					pDMDLabelSet "MultiplierLabel2", "MULTIPLIER"
					pDMDLabelSet "MultiplierValue", nFirstDigit & "." & nSecondDigit & " X"
				End If
			End If
		End If
	End If
	nScoreLastFrame = anScore(nPlayer)
end Sub

Sub DMDUpdateModeOnScoreboard
	Dim sOldText, sNewText, sOldTime, sNewTime, nSecDisplayed
	Dim nSecBefore, nSecAfter, nMode, nNextMode, nModeCount, i

	If UseFlexDMD Then
		sOldText = oDMDModeName.text
		sNewText = sOldText
		sOldTime = oDMDModeInfoSB.text
	End If

	nModeCount = 0
	For i = 0 to 20
		If avModesRunning(nPlayer).Contains(i) _
		And (i <> eModeMultiball1) And (i <> eModeMultiball2) Then
			nModeCount = nModeCount + 1
		End If
	Next

	If 0 = nModeCount Then
		nModeOnScores = eModeNone
		If (sOldText <> "") and UseFlexDMD Then oDMDModeName.text = ""
		If (sOldTime <> "") and UseFlexDMD Then oDMDModeInfoSB.text = ""
	Else
		nSecBefore = (nDMDTextDisplayTime - DMDTimer.Interval) \ 1000
		nSecAfter = nDMDTextDisplayTime \ 1000
	
		If ((nSecBefore <> nSecAfter) and (nSecBefore Mod 3 = 2)) _
		Or (eModeNone = nModeOnScores) Then
			If nModeOnScores = eModeNone Then nModeOnScores = 0
			For i = 1 to 21
				nMode = (nModeOnScores + i) Mod 21
				If avModesRunning(nPlayer).Contains(nMode) _
				And (nMode <> eModeMultiball1) _
				And (nMode <> eModeMultiball2) Then
					nNextMode = nMode
					Exit For
				End If
			Next
			sNewText = asModeNames(nNextMode)
			nModeOnScores = nNextMode
		End If

		If eModeReverseFlips = nModeOnScores or eModeHypnotoad = nModeOnScores Then
			nSecDisplayed = aanModeTime(nPlayer, nModeOnScores) \ 1000
		Else
			nSecDisplayed = (aanModeTime(nPlayer, nModeOnScores) - 2500) \ 1000
		End If
		if nSecDisplayed < 0 then nSecDisplayed = 0
		sNewTime = nSecDisplayed & " SEC"
		If sNewTime <> sOldTime Then
			If UseFlexDMD Then
				oDMDModeInfoSB.text = sNewTime
				oDMDModeInfoSB.SetAlignedPosition 128, 21, FlexDMD_Align_TopRight
			End If
		End If

		If sNewText <> sOldText Then
			If UseFlexDMD Then
				oDMDModeName.text = sNewText
				oDMDModeName.SetAlignedPosition 0, 21, FlexDMD_Align_TopLeft
			End If
		End If
	End If
End Sub

Sub DMDUpdateBallNumber(nBallNr)
	If UseFlexDMD Then
		FlexDMD.LockRenderThread
		oDMDBallNr.text = "BALL " & nBallNr
		oDMDBallNr.SetAlignedPosition 0, 27, FlexDMD_Align_TopLeft
		FlexDMD.UnlockRenderThread
	End If
End Sub

Sub DMDUpdateBlasts
	Dim i
	If UseFlexDMD Then
		FlexDMD.LockRenderThread
		If 1 = anBlasts(nPlayer) Then
			oDMDBlasts.text = "1 BLAST"
		Else
			oDMDBlasts.text = anBlasts(nPlayer) & " BLASTS"
		End If
		oDMDBlasts.SetAlignedPosition 58, 27, FlexDMD_Align_Top
		FlexDMD.UnlockRenderThread
	End If
	If bEnablePuP Then
		For i = 1 to 3
			If anBlasts(nPlayer) >= i Then
				pDMDLabelShow "Blast" & i
			Else
				pDMDLabelHide "Blast" & i
			End If
		Next
	End If
End Sub

Sub DMDHideBlasts
	Dim i
	If bEnablePuP Then
		For i = 1 to 3
			pDMDLabelHide "Blast" & i
		Next
	End If
End Sub

' Flex on vrroom and playfield runs this one
Sub FlexFlasher
		Dim DMDp
		DMDp = FlexDMD.DmdColoredPixels
		If Not IsEmpty(DMDp) Then
			DMDWidth = FlexDMD.Width
			DMDHeight = FlexDMD.Height
			DMDColoredPixels = DMDp
		End If
End Sub

Sub DMDBoothInit
	Dim i
	nTimeBooth = 5000
	nBoothWheel = 0
	Select Case avBoothOptionsUsed(nPlayer).Count
		Case 0
			nTimeBoothChange = 250
		Case 1
			nTimeBoothChange = 200
		Case Else
			nTimeBoothChange = 167
	End Select
	nBoothOption = 0
	bBlinkBoothOption = False

	If UseFlexDMD then
		FlexDMD.LockRenderThread
		oDMDBoothTimer.text = "5"
		aoDMDBoothOptions(0).font = oDMDFontSmall
		for i = 1 to 4
			aoDMDBoothOptions(i).font = oDMDFontSmallDark
		next
	End If
		
	If avBoothOptionsUsed(nPlayer).Contains(1) Then
		If UseFlexDMD then aoDMDBoothOptions(1).text = "LOSE BALL"
	Else
		If UseFlexDMD then aoDMDBoothOptions(1).text = "HYPNOTOAD"
		nBoothWheel = nBoothWheel + 4
	End If
	If UseFlexDMD then aoDMDBoothOptions(1).SetAlignedPosition 74, 14, FlexDMD_Align_TopLeft

	If avBoothOptionsUsed(nPlayer).Contains(3) Then
		If UseFlexDMD then aoDMDBoothOptions(3).text = "LOSE BALL"
	Else
		If UseFlexDMD then aoDMDBoothOptions(3).text = "0.5 X PLAYFIELD"
		nBoothWheel = nBoothWheel + 2
	End If
	If UseFlexDMD then aoDMDBoothOptions(3).SetAlignedPosition 70, 26, FlexDMD_Align_Top
	
	If avBoothOptionsUsed(nPlayer).Contains(5) Then
		If UseFlexDMD then aoDMDBoothOptions(5).text = "LOSE BALL"
		If UseFlexDMD then aoDMDBoothOptions(5).font = oDMDFontSmallDark
	Else
		If UseFlexDMD then aoDMDBoothOptions(5).text = "REVERSE FLIP"
		If UseFlexDMD then aoDMDBoothOptions(5).font = oDMDFontTinyDark
		nBoothWheel = nBoothWheel + 1
	End If
	If UseFlexDMD then aoDMDBoothOptions(5).SetAlignedPosition 66, 14, FlexDMD_Align_TopRight

	If UseFlexDMD then FlexDMD.UnlockRenderThread
	If bEnablePuP Then
		pDMDRotateWheel nBoothWheel, 2080
		pDMDLabelSet "BoothTime", "5"
	End If
	sDMDScene = "booth"
End Sub

Dim bSkipFrame : bSkipFrame = False
Sub DMDBoothUpdate
	Dim nTimeRev, nTimePassed, dDegrees, nDegreeTenths

	If KickerBooth.timerEnabled Then
		bBlinkBoothOption = Not bBlinkBoothOption
		If UseFlexDMD then
			FlexDMD.LockRenderThread
			If bBlinkBoothOption Then
				If (5 = nBoothOption) And (Not avBoothOptionsUsed(nPlayer).Contains(5)) Then
					aoDMDBoothOptions(5).font = oDMDFontTiny
				Else
					aoDMDBoothOptions(nBoothOption).font = oDMDFontSmall
				End If
			Else
				If (5 = nBoothOption) And (Not avBoothOptionsUsed(nPlayer).Contains(5)) Then
					aoDMDBoothOptions(5).font = oDMDFontTinyDark
				Else
					aoDMDBoothOptions(nBoothOption).font = oDMDFontSmallDark
				End If
			End If
			FlexDMD.UnlockRenderThread
		End If
	Else
		nTimeBoothChange = nTimeBoothChange - DMDTimer.Interval
		If UseFlexDMD then FlexDMD.LockRenderThread
		If nTimeBoothChange <= 0 Then
			Select Case avBoothOptionsUsed(nPlayer).Count
				Case 0
					nTimeBoothChange = 250
				Case 1
					nTimeBoothChange = 200
				Case Else
					nTimeBoothChange = 167
			End Select
			If (5 = nBoothOption) And (Not avBoothOptionsUsed(nPlayer).Contains(5)) Then
				If UseFlexDMD then aoDMDBoothOptions(5).font = oDMDFontTinyDark
			Else
				If UseFlexDMD then aoDMDBoothOptions(nBoothOption).font = oDMDFontSmallDark
			End If
			nBoothOption = (nBoothOption + 1) Mod 6
			If (5 = nBoothOption) And (Not avBoothOptionsUsed(nPlayer).Contains(5)) Then
				If UseFlexDMD then aoDMDBoothOptions(5).font = oDMDFontTiny
			Else
				If UseFlexDMD then aoDMDBoothOptions(nBoothOption).font = oDMDFontSmall
			End If
			If bEnablePuP Then
				bSkipFrame = True
				dDegrees = 208 - (nBoothOption * 60)
				If dDegrees < 0 Then dDegrees = dDegrees + 360
				nDegreeTenths = CInt(dDegrees * 10)
				pDMDRotateWheel nBoothWheel, nDegreeTenths
			End If
		Elseif bEnablePuP Then
			If Not bSkipFrame Then
				dDegrees = 208 - (nBoothOption * 60)
				Select Case avBoothOptionsUsed(nPlayer).Count
					Case 0
						dDegrees = dDegrees - (60 * ((250 - nTimeBoothChange) / 250))
					Case 1
						dDegrees = dDegrees - (60 * ((200 - nTimeBoothChange) / 200))
					Case Else
						dDegrees = dDegrees - (60 * ((167 - nTimeBoothChange) / 167))
				End Select
				If dDegrees < 0 Then dDegrees = dDegrees + 360
				nDegreeTenths = CInt(dDegrees * 10)
				pDMDRotateWheel nBoothWheel, nDegreeTenths
				pDMDLabelSet "BoothTime", CStr((nTimeBooth + 999) \ 1000)
			End If
			bSkipFrame = Not bSkipFrame
		End If

		nTimeBooth = nTimeBooth - DMDTimer.Interval
		If nTimeBooth < 0 Then nTimeBooth = 0
		If UseFlexDMD then oDMDBoothTimer.text = CStr((nTimeBooth + 999) \ 1000)
		If 0 = nTimeBooth Then
			KickerBooth.timerEnabled = True
			If (5 = nBoothOption) And (Not avBoothOptionsUsed(nPlayer).Contains(5)) Then
				If UseFlexDMD then aoDMDBoothOptions(5).font = oDMDFontTinyDark
			Else
				If UseFlexDMD then aoDMDBoothOptions(nBoothOption).font = oDMDFontSmallDark
			End If
			nBoothOption = 0
			fBoothTargetAngle = 315
			bBoothSaved = False
			BoothOpenDoors
			If bEnablePuP Then
				pDMDRotateWheel nBoothWheel, 180
				pDMDLabelSet "BoothTime", "0"
			End If
		End If
		If UseFlexDMD then FlexDMD.UnlockRenderThread
	End If
End Sub

Sub DMDInstantInfoUpdate (nPage)
	Dim asInfo

	asInfo = GetInstantInfoPage(nPage)
	' Don't lock / unlock the render thread, DMDTimer_Timer calls this and handles locks
	If UseFlexDMD Then
		oDMDInstantInfoLine1.text = asInfo(0)
		oDMDInstantInfoLine2.text = asInfo(1)
		oDMDInstantInfoLine1.SetAlignedPosition 64, 8, FlexDMD_Align_Top
		oDMDInstantInfoLine2.SetAlignedPosition 64, 20, FlexDMD_Align_Top
	End If
	If bEnablePuP Then
		pDMDLabelSet "Splash3A", "INSTANT INFO"
		pDMDLabelSet "Splash3B", asInfo(0)
		pDMDLabelSet "Splash3C", asInfo(1)
	End If
End Sub

Sub DMDTimedText(asText, nTime, nPriority)
	Dim i, nLines
	If nPriority <= nTextPriority Then
		nTextPriority = nPriority
		nDMDTextDisplayTime = 0
		nTextDuration = nTime
		nLines = 1
		If IsArray(asText) Then nLines = UBound(asText) + 1
		Select Case nLines
			Case 1
				sDMDScene = "text1line"
				If UseFlexDMD Then
					FlexDMD.LockRenderThread
					If IsArray(asText) Then
						oDMD1LineText.text = asText(0)
					Else
						oDMD1LineText.text = asText
					End If
					oDMD1LineText.SetAlignedPosition 64, 16, FlexDMD_Align_Center
					FlexDMD.UnlockRenderThread
				End If
				If bEnablePuP and not bCountingBonus Then
					If IsArray(asText) Then
						pDMDLabelSet "Splash1", asText(0)
					Else
						pDMDLabelSet "Splash1", asText
					End If
				End If
			Case 2
				sDMDScene = "text2lines"
				If UseFlexDMD Then
					FlexDMD.LockRenderThread
					oDMD2LineText1.text = asText(0)
					oDMD2LineText1.SetAlignedPosition 64, 8, FlexDMD_Align_Center
					oDMD2LineText2.text = asText(1)
					oDMD2LineText2.SetAlignedPosition 64, 24, FlexDMD_Align_Center
					FlexDMD.UnlockRenderThread
				End If
				If bEnablePuP and not bCountingBonus Then
					pDMDLabelSet "Splash2A", asText(0)
					pDMDLabelSet "Splash2B", asText(1)
				End If
			Case Else
				sDMDScene = "text3lines"
				If UseFlexDMD Then
					FlexDMD.LockRenderThread
					oDMD3LineText1.text = asText(0)
					oDMD3LineText2.text = asText(1)
					oDMD3LineText3.text = asText(2)
					oDMD3LineText1.SetAlignedPosition 64, 2, FlexDMD_Align_Top
					oDMD3LineText2.SetAlignedPosition 64, 15, FlexDMD_Align_Top
					oDMD3LineText3.SetAlignedPosition 64, 24, FlexDMD_Align_Top
					FlexDMD.UnlockRenderThread
				End If
				If bEnablePuP and not bCountingBonus Then
					pDMDLabelSet "Splash3A", asText(0)
					pDMDLabelSet "Splash3B", asText(1)
					pDMDLabelSet "Splash3C", asText(2)
				End If
		End Select
	End If
End Sub

Sub DMDChangeScene(sScene)
	Dim i, dModePercent
	If UseFlexDMD Then
		FlexDMD.LockRenderThread
		FlexDMD.Stage.RemoveAll
	End If
	If bEnablePuP Then
		Select Case sDMDCurrentScene
			Case "attract"
				pDMDSetPage pScores
				DOF 155,DOFOff  'Attract mode ends
			Case "booth"
				pDMDLabelHide "Booth" & nBoothWheel
				pDMDSetPage pScores
			Case "text1line"
				pDMDLabelSet "Splash1", ""
			Case "text2lines"
				pDMDLabelSet "Splash2A", ""
				pDMDLabelSet "Splash2B", ""
			Case "text3lines", "instantinfo"
				pDMDLabelSet "Splash3A", ""
				pDMDLabelSet "Splash3B", ""
				pDMDLabelSet "Splash3C", ""
			Case "modeselect"
				For i = 1 to 9
					pDMDLabelSet "ModeProgress" & i, ""
					pDMDLabelHide "ModeComplete" & i
				Next
				pDMDLabelHide "ModeSelectBG"
				pDMDLabelHide "ModeShip"
		End Select
	End If

	Select Case sScene
		Case "scoreboard"
			nTextDuration = 0
			nTextPriority = ePrioIdle
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMDScoreboard
		Case "attract"
			DOF 155,DOFOn  'Attract mode begins
			nTextDuration = 0
			nTextPriority = ePrioIdle
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMDAttract
			If bEnablePuP Then pDMDSetPage pAttract
		Case "text1line"
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMD1Line
		Case "text2lines"
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMD2Line
		Case "text3lines"
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMD3Line
		Case "modeselect"
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMD3Line
			If bEnablePuP Then
				pDMDLabelShow "ModeSelectBG"
				For i = eModeChapek to eModeMars
					If avModesCompleted(nPlayer).Contains(i) Then
						pDMDLabelShow "ModeComplete" & (1 + i)
					Elseif aanModeAttempts(nPlayer, i) > 0 Then
						dModePercent = aanModeShots(nPlayer, i) / _
									   anShotsToWin(i)
						dModePercent = round(dModePercent * 100)
						pDMDLabelSet "ModeProgress" & (1 + i), dModePercent & "%"
					End If
				Next
				If nModeSelected >= eModeChapek and nModeSelected <= eModeMars Then
					PuPlayer.LabelSet pDMD, "ModeShip", "`u`", 1, "{'mt':2" & _
						", 'xpos':" & afModeXCoordinates(nModeSelected) & _
						", 'ypos':" & afShipYCoordinates(nModeSelected) & " }"
				End If
			End If
		Case "modeinfo"
			nTextDuration = 0
			nTextPriority = ePrioIdle
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMDModeInfo
			sDMDModeName = ""
			sDMDModeGoal = ""
			sDMDModeInfo = ""
			sDMDModeScore = ""
			sDMDModeBlasts = ""
		Case "booth"
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMDBooth
			If bEnablePuP Then pDMDSetPage pBooth
		Case "instantinfo"
			If UseFlexDMD Then FlexDMD.Stage.AddActor oDMDInstantInfo
	End Select
	If sScene <> "instantinfo" Then bShowingInstantInfo = False
	If UseFlexDMD Then FlexDMD.UnlockRenderThread
	sDMDCurrentScene = sScene
End Sub

' Main FlexDMD Timer
Sub DMDTimer_Timer
	Dim i, dModePercent, bKickout, oNextEvent
	Dim nSecBefore, nSecAfter, bModeUpdated
	
	nDMDTextDisplayTime = nDMDTextDisplayTime + DMDTimer.Interval
	' update audio ducking
	DuckUpdate

	' instant info
	If nPlayersInGame > 0 And bCountingBonus = False And nTimeAnySwitch > 0 _
	And (GameTime - nTimeAnySwitch > 2000) And 0 = oEventQueue.Size _
	And oCurrentEvent is Nothing And ePrioIdle = nTextPriority Then
		If ((nTimeUpperLeftFlip > 0) And (GameTime - nTimeUpperLeftFlip > 2000)) Or _
		  ((nTimeUpperRightFlip > 0) And (GameTime - nTimeUpperRightFlip > 2000))  Then
			If Not bShowingInstantInfo Then
				sDMDScene = "instantinfo"
				bShowingInstantInfo = True
				nTimeInfoChange = nDMDTextDisplayTime
			End If
		End If
	End If

	If sDMDCurrentScene <> sDMDScene Then
		DMDChangeScene sDMDScene
	End If

	If UseFlexDMD Then FlexDMD.LockRenderThread
	If bEnablePuP And nPlayersInGame > 0 Then DMDUpdateScore
	bModeUpdated = False
	If bEnablePuP And bInMode Then
		DMDUpdateModeInfo
		bModeUpdated = True
	End If
	Select Case sDMDScene
		Case "scoreboard"
			If Not bEnablePuP Then DMDUpdateScore
		Case "modeinfo"
			If Not bModeUpdated Then DMDUpdateModeInfo
			' Lower scoop kickout alert
			bKickout = False
			' Don't make a kickout alert if the next event in the queue will hold the ball
			If Not (oCurrentEvent is Nothing) Then
				if (eShotLowerScoop = oCurrentEvent.holdBallAt) And bBallinLowerScoop Then
					If oEventQueue.Size > 0 Then
						Set oNextEvent = oEventQueue.Peek
						If eShotLowerScoop <> oNextEvent.holdBallAt _
						And "modeselect" <> oNextEvent.special Then
							bKickout = True
						End If
						If oCurrentEvent.withMode <> eModeNone Then
							If Not avModesRunning(nPlayer).Contains(oCurrentEvent.withMode) Then
								bKickout = False
							End If
						End If
					Else
						bKickout = True
					End If
				End If

				' kickout visual and audio alert
				if bKickout And ((nDMDTextDisplayTime + 1000) >= oCurrentEvent.duration) _
				And (oCurrentEvent.duration > 1000) and (Not TimerKickoutWarning.Enabled) Then
					TimerKickoutWarning.Enabled = True
					PlaySound "kickout"
				End If
			End If
		Case "booth"
			DMDBoothUpdate
		Case "attract"
			if nDMDTextDisplayTime >= nAttractModePageTime Then
				nAttractModePage = (nAttractModePage + 1) Mod nAttractModePageCount
				nDMDTextDisplayTime = 0
				' For PuP, only update labels when changing pages
				if bEnablePuP Then
					If 0 = nAttractModePage Then
						pDMDSetPage pCredits
					ElseIf 1 = nAttractModePage Then
						pDMDSetPage pPrevScores
						pDMDLabelSet "PrevScores", "PREVIOUS GAME"
						For i = 1 to 4
							If i <= nPlayersLastGame Then
								pDMDLabelSet "PrevP" & i & "Label", "PLAYER " & i
								pDMDLabelSet "PrevP" & i & "Score", FormatScore(anScore(i - 1))
							Else
								pDMDLabelSet "PrevP" & i & "Label", ""
								pDMDLabelSet "PrevP" & i & "Score", ""
							End If
						Next
					Elseif 2 = nAttractModePage Then
						pDMDSetPage pAttract
						pDMDLabelSet "Attract1", "FREE PLAY"
						pDMDLabelSet "Attract2", "PRESS START"
					Elseif 3 = nAttractModePage Then
						pDMDSetPage pAttract
						pDMDLabelSet "Attract1", HighScoreName(0) & " " & FormatScore(HighScore(0))
						pDMDLabelSet "Attract2", "GRAND CHAMPION"
					Elseif 4 = nAttractModePage Then
						pDMDSetPage pAttract
						pDMDLabelSet "Attract1", HighScoreName(1) & " " & FormatScore(HighScore(1))
						pDMDLabelSet "Attract2", "HIGH SCORE 1"
					Elseif 5 = nAttractModePage Then
						pDMDSetPage pAttract
						pDMDLabelSet "Attract1", HighScoreName(2) & " " & FormatScore(HighScore(2))
						pDMDLabelSet "Attract2", "HIGH SCORE 2"
					Elseif 6 = nAttractModePage Then
						pDMDSetPage pAttract
						pDMDLabelSet "Attract1", HighScoreName(3) & " " & FormatScore(HighScore(3))
						pDMDLabelSet "Attract2", "HIGH SCORE 3"
					Elseif 7 = nAttractModePage Then
						pDMDSetPage pAttract
						pDMDLabelSet "Attract1", HighScoreName(4) & " " & FormatScore(HighScore(4))
						pDMDLabelSet "Attract2", "HIGH SCORE 4"
					End If
				End If

				' update labels when changing to showing last game's scores
				If UseFlexDMD Then
					If 1 = nAttractModePage Then
						FlexDMD.Stage.RemoveAll
						FlexDMD.Stage.AddActor oDMDScoreboard
						For i = 0 to 3
							If anScore(i) < 1e9 then
								aoDMDScores(i).Font = oDMDFontScoreFaded
							Else ' Smaller font if score > 1B
								aoDMDScores(i).Font = oDMDFontTinyFaded
							End If
							if nPlayersLastGame > i Then
								aoDMDScores(i).Text = Trim(FormatScore(anScore(i)))
							Else
								aoDMDScores(i).Text = " "
							End If
						Next
						oDMDScoreP1.SetAlignedPosition 0, 0, FlexDMD_Align_TopLeft
						oDMDScoreP2.SetAlignedPosition 128, 0, FlexDMD_Align_TopRight
						oDMDScoreP3.SetAlignedPosition 0, 13, FlexDMD_Align_TopLeft
						oDMDScoreP4.SetAlignedPosition 128, 13, FlexDMD_Align_TopRight

						oDMDModeName.text = " "
						oDMDModeInfoSB.text = " "
						oDMDBlasts.text = " "
						oDMDBallNr.text = "GAME OVER"
						oDMDBallNr.SetAlignedPosition 0, 27, FlexDMD_Align_TopLeft
					' update labels when changing away from showing last game's scores
					Elseif 2 = nAttractModePage Or 0 = nAttractModePage Then
						FlexDMD.Stage.RemoveAll
						FlexDMD.Stage.AddActor oDMDAttract
					End If
				End If
			end if
			If UseFlexDMD then
				If 0 = nAttractModePage Then
					oDMDAttractLine1.text = ""
					oDMDAttractLine2.text = "FUTURAMA"
				' page 1 is handled when switching to it
				Elseif 2 = nAttractModePage Then
					oDMDAttractLine1.text = "FREE PLAY"
					oDMDAttractLine2.text = "PRESS START"
				Elseif 3 = nAttractModePage Then
					oDMDAttractLine1.text = HighScoreName(0) & " " & FormatScore(HighScore(0))
					oDMDAttractLine2.text = "GRAND CHAMPION"
				Elseif 4 = nAttractModePage Then
					oDMDAttractLine1.text = HighScoreName(1) & " " & FormatScore(HighScore(1))
					oDMDAttractLine2.text = "HIGH SCORE 1"
				Elseif 5 = nAttractModePage Then
					oDMDAttractLine1.text = HighScoreName(2) & " " & FormatScore(HighScore(2))
					oDMDAttractLine2.text = "HIGH SCORE 2"
				Elseif 6 = nAttractModePage Then
					oDMDAttractLine1.text = HighScoreName(3) & " " & FormatScore(HighScore(3))
					oDMDAttractLine2.text = "HIGH SCORE 3"
				Elseif 7 = nAttractModePage Then
					oDMDAttractLine1.text = HighScoreName(4) & " " & FormatScore(HighScore(4))
					oDMDAttractLine2.text = "HIGH SCORE 4"
				End If
				oDMDAttractLine1.SetAlignedPosition 64, 8, FlexDMD_Align_Center
				oDMDAttractLine2.SetAlignedPosition 64, 24, FlexDMD_Align_Center
			End If
		Case "instantinfo"
			If nTimeUpperLeftFlip = -1 And nTimeUpperRightFlip = -1 Then
				bShowingInstantInfo = False
				nTimeInfoChange = 0

				if 0 = nPlayersInGame Then
					sDMDScene = "attract"
				ElseIf bInMode Then
					sDMDScene = "modeinfo"
				Else
					sDMDScene = "scoreboard"
				End If
			Else
				If nTimeInfoChange = nDMDTextDisplayTime Then
					DMDInstantInfoUpdate nInstantInfoPage
				ElseIf nDMDTextDisplayTime - nTimeInfoChange >= 2000 Then
					nTimeInfoChange = nDMDTextDisplayTime
					nInstantInfoPage = (nInstantInfoPage + 1)
					If nInstantInfoPage > cLastInfoPage Then
						nInstantInfoPage = 0
					End If
					DMDInstantInfoUpdate nInstantInfoPage
				End If
			End If
		Case "text1line", "text2lines", "text3lines"
			' Lower scoop kickout alert
			bKickout = False
			' Don't make a kickout alert if the next event in the queue will hold the ball
			If Not (oCurrentEvent is Nothing) Then
				if (eShotLowerScoop = oCurrentEvent.holdBallAt) And bBallinLowerScoop Then
					If oEventQueue.Size > 0 Then
						Set oNextEvent = oEventQueue.Peek
						If eShotLowerScoop <> oNextEvent.holdBallAt _
						And "modeselect" <> oNextEvent.special Then
							bKickout = True
						End If
						If oCurrentEvent.withMode <> eModeNone Then
							If Not avModesRunning(nPlayer).Contains(oCurrentEvent.withMode) Then
								bKickout = False
							End If
						End If
					Else
						bKickout = True
					End If
				End If

				' Update mode progress
				If ePrioModeProgress = oCurrentEvent.priority _
				And "text3lines" = sDMDScene _
				And nTimeModeTextUpdate > nTimeModeTextDisplay Then
					nTimeModeTextDisplay = nTimeModeTextUpdate
					If UseFlexDMD Then
						oDMD3LineText1.text = asModeMessage(0)
						oDMD3LineText2.text = asModeMessage(1)
						oDMD3LineText3.text = asModeMessage(2)
						oDMD3LineText1.SetAlignedPosition 64, 2, FlexDMD_Align_Top
						oDMD3LineText2.SetAlignedPosition 64, 15, FlexDMD_Align_Top
						oDMD3LineText3.SetAlignedPosition 64, 24, FlexDMD_Align_Top
					End If
					If bEnablePuP and not bCountingBonus Then
						pDMDLabelSet "Splash3A", asModeMessage(0)
						pDMDLabelSet "Splash3B", asModeMessage(1)
						pDMDLabelSet "Splash3C", asModeMessage(2)
					End If
				End If

				' kickout visual and audio alert
				if bKickout And ((nDMDTextDisplayTime + 1000) >= oCurrentEvent.duration) _
				And (oCurrentEvent.duration > 1000) and (Not TimerKickoutWarning.Enabled) Then
					TimerKickoutWarning.Enabled = True
					PlaySound "kickout"
				End If
			End If

			if nDMDTextDisplayTime >= nTextDuration Then
				nTextDuration = 0
				nTextPriority = ePrioIdle
				Set oCurrentEvent = Nothing

				if 0 = nPlayersInGame Then
					sDMDScene = "attract"
				ElseIf bInMode Then
					sDMDScene = "modeinfo"
				Else
					sDMDScene = "scoreboard"
				End If
			End If
		Case "modeselect"
			If nModeSelected >= 0 And nModeSelected <= 8 Then
				If aanModeAttempts(nPlayer, nModeSelected) > 0 Then
					dModePercent = aanModeShots(nPlayer, nModeSelected) / _
								   anShotsToWin(nModeSelected)
					dModePercent = round(dModePercent * 100)
					If UseFlexDMD Then
						oDMD3LineText1.text = asModeNames(nModeSelected) & _
							"(" & dModePercent & "%)"
					End If
				Else
					If UseFlexDMD Then
						oDMD3LineText1.text = asModeNames(nModeSelected)
					End If
				End If
			End If
			If UseFlexDMD Then
				oDMD3LineText2.text = "CHANGE WITH FLIPPERS"
				oDMD3LineText3.text = "PRESS BOTH TO SELECT"
				oDMD3LineText1.SetAlignedPosition 64, 2, FlexDMD_Align_Top
				oDMD3LineText2.SetAlignedPosition 64, 15, FlexDMD_Align_Top
				oDMD3LineText3.SetAlignedPosition 64, 24, FlexDMD_Align_Top
			End If
	End Select

	If UseFlexDMD Then FlexDMD.UnlockRenderThread
	If oCurrentEvent is Nothing And oEventQueue.Size > 0 Then
		nTextDuration = 0
		nTextPriority = ePrioIdle
		HandleQueueEvent
	Elseif Not (oCurrentEvent is Nothing) Then
		If nDMDTextDisplayTime > oCurrentEvent.duration And oEventQueue.Size > 0 Then
			nTextDuration = 0
			nTextPriority = ePrioIdle
			HandleQueueEvent
		ElseIf nTimePupStartPlay > 0 _
		And ((nTimePupStartPlay + oCurrentEvent.duration) < GameTime) Then
			nTimePupStartPlay = 0
			Set oCurrentEvent = Nothing
		End If
	End If

End Sub

'*******************************************
' ZPUP - PinUp display
'*******************************************
Dim pGameName       : pGameName=cGameName
Dim PuPlayer
Dim oLabelText
Const pFontFuturama = "Futurama Bold Font"

Const pDMD=5
Const pBackglass=2
Const pMusic=4

'pages
Const pDMDBlank = 0
Const pScores = 1
Const pAttract = 2
Const pPrevScores = 3
Const pCredits = 4
Const pBooth = 5

Sub PuPInit
	If Not bEnablePuP Then Exit Sub
	Set PuPlayer = CreateObject("PinUpPlayer.PinDisplay")
	Set oLabelText = CreateObject("Scripting.Dictionary")
	CheckPupVersion ' ensure we are using the correct version of Pup Player for the Table1
	PuPlayer.B2SInit "", pGameName
	PuPlayer.LabelInit pDMD					
	pSetPageLayouts
	pDMDSetPage(pAttract)   'set blank text overlay page.
	PupEvent 779 'Start backglass
	PupEvent 780 'Default background
	nDMD4PlayerTime = 0
	bDMD4PlayerScores = True
End Sub

Sub CheckPupVersion

	Dim strPupVersion
	strPupVersion = PuPlayer.GetVersion
	strPupVersion = Replace(strPupVersion, ".", "")
	strPupVersion = mid (strPupVersion, 1,3)
    strPupVersion = CDbl(strPupVersion)

	If strPupVersion => 150 then
		exit sub
	Else
		msgbox "This table requires PuP Player version 1.5 or greater.  Please update your pup install to play the table", 0
		Table1_Exit	
	End if
End sub

const fontScaling = 0.8

Sub pSetPageLayouts
	Dim i

	' Scores
	PuPlayer.LabelNew pDMD, "Score1Small", pFontFuturama, 4 * fontScaling, VBWhite, 0, 1, 1, 12, 97, pScores, 0
	PuPlayer.LabelNew pDMD, "Score1Big", pFontFuturama, 6  * fontScaling, VBWhite, 0, 1, 1, 12, 97, pScores, 0
	PuPlayer.LabelNew pDMD, "Score2Small", pFontFuturama, 4 * fontScaling, VBWhite, 0, 1, 1, 37, 97, pScores, 0
	PuPlayer.LabelNew pDMD, "Score2Big", pFontFuturama, 6 * fontScaling, VBWhite, 0, 1, 1, 12, 97, pScores, 0
	PuPlayer.LabelNew pDMD, "Score3Small", pFontFuturama, 4 * fontScaling, VBWhite, 0, 1, 1, 62, 97, pScores, 0
	PuPlayer.LabelNew pDMD, "Score3Big", pFontFuturama, 6 * fontScaling, VBWhite, 0, 1, 1, 12, 97, pScores, 0
	PuPlayer.LabelNew pDMD, "Score4Small", pFontFuturama, 4 * fontScaling, VBWhite, 0, 1, 1, 87, 97, pScores, 0
	PuPlayer.LabelNew pDMD, "Score4Big", pFontFuturama, 6 * fontScaling, VBWhite, 0, 1, 1, 12, 97, pScores, 0

	' Score Overlays
	PuPlayer.LabelNew pDMD, "ScoreOverlay1", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "ScoreOverlay1", "PuPOverlays\\Futurama_1P.png", 0, "{'mt':2, 'zback':1, 'width':100, 'height':100, 'yalign':0, 'xalign':0, 'ypos':0, 'xpos':0}"
	PuPlayer.LabelNew pDMD, "ScoreOverlay2", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "ScoreOverlay2", "PuPOverlays\\Futurama_2P.png", 0, "{'mt':2, 'zback':1, 'width':100, 'height':100, 'yalign':0, 'xalign':0, 'ypos':0, 'xpos':0}"
	PuPlayer.LabelNew pDMD, "ScoreOverlay3", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "ScoreOverlay3", "PuPOverlays\\Futurama_3P.png", 0, "{'mt':2, 'zback':1, 'width':100, 'height':100, 'yalign':0, 'xalign':0, 'ypos':0, 'xpos':0}"
	PuPlayer.LabelNew pDMD, "ScoreOverlay4", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "ScoreOverlay4", "PuPOverlays\\Futurama_4P.png", 0, "{'mt':2, 'zback':1, 'width':100, 'height':100, 'yalign':0, 'xalign':0, 'ypos':0, 'xpos':0}"

	' Attract mode: high scores
	PuPlayer.LabelNew pDMD, "Attract1", pFontFuturama, 16 * fontScaling, VBWhite, 0, 1, 1, 50, 30, pAttract, 0
	PuPlayer.LabelNew pDMD, "Attract2", pFontFuturama, 16 * fontScaling, VBWhite, 0, 1, 1, 50, 60, pAttract, 0
	'Add outlines to text labels
	PuPlayer.LabelSet pDMD, "Attract1", "", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "Attract2", "", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"

	' Attract mode: the previous game's scores
	PuPlayer.LabelNew pDMD, "PrevScores", pFontFuturama, 15 * fontScaling, VBWhite, 0, 1, 1, 50, 20, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP1Label", pFontFuturama, 10 * fontScaling, VBWhite, 0, 0, 1, 10, 40, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP1Score", pFontFuturama, 10 * fontScaling, VBWhite, 0, 2, 1, 90, 40, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP2Label", pFontFuturama, 10 * fontScaling, VBWhite, 0, 0, 1, 10, 52, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP2Score", pFontFuturama, 10 * fontScaling, VBWhite, 0, 2, 1, 90, 52, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP3Label", pFontFuturama, 10 * fontScaling, VBWhite, 0, 0, 1, 10, 64, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP3Score", pFontFuturama, 10 * fontScaling, VBWhite, 0, 2, 1, 90, 64, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP4Label", pFontFuturama, 10 * fontScaling, VBWhite, 0, 0, 1, 10, 76, pPrevScores, 0
	PuPlayer.LabelNew pDMD, "PrevP4Score", pFontFuturama, 10 * fontScaling, VBWhite, 0, 2, 1, 90, 76, pPrevScores, 0
	'Add outlines to text labels
	PuPlayer.LabelSet pDMD, "PrevScores", " PREVIOUS GAME ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP1Label", " PLAYER 1 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP1Score", " 00 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP2Label", " PLAYER 2 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP2Score", " 00 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP3Label", " PLAYER 3 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP3Score", " 00 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP4Label", " PLAYER 4 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "PrevP4Score", " 00 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"

	' Attract mode: Credits
	PuPlayer.LabelNew pDMD, "Credits", pFontFuturama, 4 * fontScaling, VBWhite,	0, 1, 1, 0, 0, pCredits, 1
	PuPlayer.LabelSet pDMD, "Credits", "pngs\\credits2.png", 1, "{'mt':2, 'zback':1, 'width':100, 'height':100, 'yalign':0, 'xalign':0, 'ypos':0, 'xpos':0}"

	' Splash text
	PuPlayer.LabelNew pDMD, "Splash1", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 50, 45, pScores, 0
	PuPlayer.LabelNew pDMD, "Splash2A", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 50, 38, pScores, 0
	PuPlayer.LabelNew pDMD, "Splash2B", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 50, 52, pScores, 0
	PuPlayer.LabelNew pDMD, "Splash3A", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 50, 31, pScores, 0
	PuPlayer.LabelNew pDMD, "Splash3B", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 50, 45, pScores, 0
	PuPlayer.LabelNew pDMD, "Splash3C", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 50, 59, pScores, 0
	'Add outlines to text labels
	PuPlayer.LabelSet pDMD, "Splash1", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "Splash2A", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "Splash2B", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "Splash3A", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "Splash3B", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "Splash3C", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"

	' Mode info
	PuPlayer.LabelNew pDMD, "TimeLabel", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 6, 10, pScores, 0
	PuPlayer.LabelNew pDMD, "TimeSeconds", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 6, 16, pScores, 0
	PuPlayer.LabelNew pDMD, "ShotsLabel", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 94, 10, pScores, 0
	PuPlayer.LabelNew pDMD, "ShotsLeft", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 94, 16, pScores, 0
	PuPlayer.LabelNew pDMD, "ModeInfo", pFontFuturama, 8 * fontScaling, VBWhite, 0, 1, 1, 50, 6, pScores, 0
	'Add outlines to text labels
	PuPlayer.LabelSet pDMD, "TimeLabel", " TIME ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "TimeSeconds", " 0 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "ShotsLabel", " SHOTS ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "ShotsLeft", " 6 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "ModeInfo", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"

	'Blasts
	PuPlayer.LabelNew pDMD, "Blast1", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "Blast1", "pngs\\blastlogo.png", 0, "{'mt':2, 'zback':1, 'width':9, 'height':16, 'yalign':2, 'xalign':0, 'ypos':88, 'xpos':2}"
	PuPlayer.LabelNew pDMD, "Blast2", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "Blast2", "pngs\\blastlogo.png", 0, "{'mt':2, 'zback':1, 'width':9, 'height':16, 'yalign':2, 'xalign':0, 'ypos':73, 'xpos':2}"
	PuPlayer.LabelNew pDMD, "Blast3", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "Blast3", "pngs\\blastlogo.png", 0, "{'mt':2, 'zback':1, 'width':9, 'height':16, 'yalign':2, 'xalign':0, 'ypos':58, 'xpos':2}"

	'Playfield multiplier
	PuPlayer.LabelNew pDMD, "MultiplierLabel1", pFontFuturama, 3.4 * fontScaling, VBWhite, 0, 1, 1, 94, 76, pScores, 0
	PuPlayer.LabelNew pDMD, "MultiplierLabel2", pFontFuturama, 3.4 * fontScaling, VBWhite, 0, 1, 1, 94, 80, pScores, 0
	PuPlayer.LabelNew pDMD, "MultiplierValue", pFontFuturama, 8 * fontScaling, VBWhite, 0, 1, 1, 94, 86, pScores, 0
	PuPlayer.LabelSet pDMD, "MultiplierLabel1", " PLAYFIELD ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 13, 'yoffset': 12, 'outline':1}"
	PuPlayer.LabelSet pDMD, "MultiplierLabel2", " MULTIPLIER ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 13, 'yoffset': 12, 'outline':1}"
	PuPlayer.LabelSet pDMD, "MultiplierValue", " 1.0 X ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 14, 'yoffset': 13, 'outline':1}"

	' Super Features and booth effects
	PuPlayer.LabelNew pDMD, "EffectsLabel", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 94, 56, pScores, 0
	PuPlayer.LabelNew pDMD, "EffectsSeconds", pFontFuturama, 10 * fontScaling, VBWhite, 0, 1, 1, 94, 62, pScores, 0
	PuPlayer.LabelSet pDMD, "EffectsLabel", " ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "EffectsSeconds", " 0 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"

	' Bonus
	PuPlayer.LabelNew pDMD, "BonusCaption", pFontFuturama, 15 * fontScaling, VBWhite, 0, 1, 1, 50, 10, pScores, 0
	PuPlayer.LabelNew pDMD, "SwitchCaption", pFontFuturama, 8 * fontScaling, VBWhite, 0, 0, 1, 15, 20, pScores, 0
	PuPlayer.LabelNew pDMD, "SwitchValue", pFontFuturama, 8 * fontScaling, VBWhite, 0, 2, 1, 85, 20, pScores, 0
	PuPlayer.LabelNew pDMD, "ComboCaption", pFontFuturama, 8 * fontScaling, VBWhite, 0, 0, 1, 15, 28, pScores, 0
	PuPlayer.LabelNew pDMD, "ComboValue", pFontFuturama, 8 * fontScaling, VBWhite, 0, 2, 1, 85, 28, pScores, 0
	PuPlayer.LabelNew pDMD, "DeliverCaption", pFontFuturama, 8 * fontScaling, VBWhite, 0, 0, 1, 15, 36, pScores, 0
	PuPlayer.LabelNew pDMD, "DeliverValue", pFontFuturama, 8 * fontScaling, VBWhite, 0, 2, 1, 85, 36, pScores, 0
	PuPlayer.LabelNew pDMD, "BonusX", pFontFuturama, 8 * fontScaling, VBWhite, 0, 1, 1, 50, 50, pScores, 0
	PuPlayer.LabelNew pDMD, "BonusTotal", pFontFuturama, 8 * fontScaling, VBWhite, 0, 1, 1, 50, 58, pScores, 0
	PuPlayer.LabelNew pDMD, "BonusScoreCaption", pFontFuturama, 8 * fontScaling, VBWhite, 0, 1, 1, 50, 70, pScores, 0
	PuPlayer.LabelNew pDMD, "BonusScoreValue", pFontFuturama, 8 * fontScaling, VBWhite, 0, 1, 1, 50, 78, pScores, 0
	'Add outlines to text labels
	PuPlayer.LabelSet pDMD, "BonusCaption", " BONUS ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "SwitchCaption", " SWITCHES ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "SwitchValue", " 0 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "ComboCaption", " COMBOS ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "ComboValue", " 0 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "DeliverCaption", " MODES ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "DeliverValue", " 0 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "BonusX", " BONUS X 1 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "BonusTotal", " BONUS TOTAL 0 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 11, 'xoffset': 5, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "BonusScoreCaption", " PLAYER 1 TOTAL SCORE ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"
	PuPlayer.LabelSet pDMD, "BonusScoreValue", " 00 ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 15, 'yoffset': 14, 'outline':1}"

	'Suicide booth
	PuPlayer.LabelNew pDMD, "Booth1", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 0
	PuPlayer.LabelSet pDMD, "Booth1", "pngs\\boothwheel1.png", 0, "{'mt':2, 'zback':1, 'width':27, 'height':48, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':60}"
	PuPlayer.LabelNew pDMD, "Booth2", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 0
	PuPlayer.LabelSet pDMD, "Booth2", "pngs\\boothwheel2.png", 0, "{'mt':2, 'zback':1, 'width':27, 'height':48, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':60}"
	PuPlayer.LabelNew pDMD, "Booth3", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 0
	PuPlayer.LabelSet pDMD, "Booth3", "pngs\\boothwheel3.png", 0, "{'mt':2, 'zback':1, 'width':27, 'height':48, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':60}"
	PuPlayer.LabelNew pDMD, "Booth4", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 0
	PuPlayer.LabelSet pDMD, "Booth4", "pngs\\boothwheel4.png", 0, "{'mt':2, 'zback':1, 'width':27, 'height':48, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':60}"
	PuPlayer.LabelNew pDMD, "Booth5", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 0
	PuPlayer.LabelSet pDMD, "Booth5", "pngs\\boothwheel5.png", 0, "{'mt':2, 'zback':1, 'width':27, 'height':48, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':60}"
	PuPlayer.LabelNew pDMD, "Booth6", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 0
	PuPlayer.LabelSet pDMD, "Booth6", "pngs\\boothwheel6.png", 0, "{'mt':2, 'zback':1, 'width':27, 'height':48, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':60}"
	PuPlayer.LabelNew pDMD, "Booth7", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 0
	PuPlayer.LabelSet pDMD, "Booth7", "pngs\\boothwheel7.png", 0, "{'mt':2, 'zback':1, 'width':27, 'height':48, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':60}"
	PuPlayer.LabelNew pDMD, "BoothArrow", pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pBooth, 1
	PuPlayer.LabelSet pDMD, "BoothArrow", "pngs\\arrow.png", 1, "{'mt':2, 'zback':1, 'width':50, 'height':50, 'yalign':1, 'xalign':1, 'ypos':60, 'xpos':55}"
	PuPlayer.LabelNew pDMD, "BoothText", pFontFuturama, 8 * fontScaling, VBWhite, 0, 1, 1, 50, 90, pBooth, 1
	PuPlayer.LabelSet pDMD, "BoothText", " PRESS ACTION BUTTON TO CHOOSE ", 1, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 14, 'yoffset': 13, 'outline':1}"
	PuPlayer.LabelNew pDMD, "BoothTime", pFontFuturama, 50 * fontScaling, VBWhite, 0, 1, 1, 20, 50, pBooth, 1
	PuPlayer.LabelSet pDMD, "BoothTime", " 5 ", 1, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 14, 'yoffset': 13, 'outline':1}"

	' mode selection
	For i = eModeChapek to eModeMars
		PuPlayer.LabelNew pDMD, "ModeProgress" & (1 + i), pFontFuturama, 5 * fontScaling, VBWhite, 0, 1, 1, afModeXCoordinates(i), afCompletionYCoords(i), pScores, 0
		PuPlayer.LabelSet pDMD, "ModeProgress" & (1 + i), " 0% ", 0, "{'mt':2,'shadowcolor':0, 'shadowstate': 1, 'xoffset': 13, 'yoffset': 12, 'outline':1}"
		PuPlayer.LabelNew pDMD, "ModeComplete" & (1 + i), pFontFuturama, 4 * fontScaling, VBWhite, 0, 1, 1, afModeXCoordinates(i), afCompletionYCoords(i), pScores, 0
		PuPlayer.LabelSet pDMD, "ModeComplete" & (1 + i), "pngs\\mode_complete.png", 0, "{'mt':2, 'zback':2, 'width':6.51, 'height':9.72}"
	Next
	PuPlayer.LabelNew pDMD, "ModeSelectBG", pFontFuturama, 4 * fontScaling, VBWhite, 0, 1, 1, 0, 0, pScores, 0
	PuPlayer.LabelSet pDMD, "ModeSelectBG", "pngs\\mode_select.png", 0,	"{'mt':2, 'zback':1, 'width':100, 'height':100, 'yalign':0, 'xalign':0, 'ypos':0, 'xpos':0}"
	PuPlayer.LabelNew pDMD, "ModeShip", pFontFuturama, 4 * fontScaling, VBWhite, 0, 1, 1, 50, 50, pScores, 0
	PuPlayer.LabelSet pDMD, "ModeShip", "pngs\\shipicon.png", 0, "{'mt':2, 'width':14.27, 'height':10.19}"

End Sub

'***********************************************************PinUP Player DMD Helper Functions

Sub pDMDLabelSet(labName,LabText)
	If oLabelText.Item(LabName) <> LabText Then
		oLabelText.Item(LabName) = LabText
		PuPlayer.LabelSet pDMD, labName, " " & LabText & " ", 1, ""
	End If
end sub

Sub pDMDLabelHide(labName)
	PuPlayer.LabelSet pDMD,labName,"",0,""
end sub

Sub pDMDLabelShow(labName)
	PuPlayer.LabelSet pDMD,labName,"",1,""
end sub

' Use E as a prefix for event triggers in the Pup Pack Editor
Sub PuPEvent(EventNum)
'    Select Case EventNum  'apophis DOF
'       'Case 705,467,468,469: 						DOF 127, DOFPulse		' Ball saved
'       'Case 707,708: 								DOF 153, DOFPulse 		' Tilt warning
'       'Case 709: 									DOF 154, DOFPulse 		' Tilt
'       'Case 713,304,305,306: 						DOF 130, DOFPulse 		' Blast used
'		'Case 714,715:								DOF 131, DOFPulse 		' Combo added/awarded
'		'Case 717:									DOF 132, DOFPulse 		' Extra ball awarded
'		'Case 719:									DOF 133, DOFPulse 		' Mystery awarded
'		'Case 722,316,317,318,319,320,321,322:		DOF 180, DOFPulse 		' CHAPEK 9 progress
'		'Case 725,324,325,326,327,328,329,330,331:	DOF 181, DOFPulse 		' DECAPOD 10 progress
'		'Case 728,333,334,335,336,337,338,339,340:	DOF 182, DOFPulse 		' DAILY PLANET progress
'		'Case 731,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360:	DOF 183, DOFPulse 	' OMICRON PERSEI 8 progress
'		'Case 735,362,363,364,365,366,367,368,369:	DOF 184, DOFPulse 		' AMAZONIA progress
'		'Case 738,371,372,373,374,375,376:			DOF 185, DOFPulse 		' EARTH progress
'		'Case 741,385,386,387,388:					DOF 186, DOFPulse 		' MOON progress
'		'Case 744,462,463,464,465:					DOF 187, DOFPulse 		' SLUG INVASION progress
'		'Case 747,378,379,380,381,382,383:			DOF 188, DOFPulse 		' MARS progress
'		'Case 750,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409:	DOF 189, DOFPulse 	' MINI WIZARD 1 progress
'		'Case 753,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428:	DOF 190, DOFPulse 	' MINI WIZARD 2 progress
'		'Case 756,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446:		DOF 191, DOFPulse 	' SLURM jackpot
'       'Case 757: 									DOF 192, DOFPulse		' SLURM super jackpot
'       'Case 764: 									DOF 193, DOFPulse		' Basemultiball jackpot
'       'Case 765: 									DOF 194, DOFPulse		' Basemultiball super jackpot
'    End Select
	if Not bEnablePuP then Exit Sub
	nTimeLastPuP = GameTime
	PuPlayer.B2SData "E" & EventNum, 1 'send event to puppack driver
End Sub

Sub pDMDSetPage(pagenum)
    PuPlayer.LabelShowPage pDMD,pagenum,0,""   'set page to blank 0 page if want off
end Sub

Sub pDMDHideModeLabels
	If bEnablePuP Then
		pDMDLabelSet "TimeLabel", ""
		pDMDLabelSet "TimeSeconds", ""
		pDMDLabelSet "ShotsLabel", ""
		pDMDLabelSet "ShotsLeft", ""
		pDMDLabelSet "ModeInfo", ""
	End If
End Sub

Sub pDMDRotateWheel (nWheel, dDegreeTenths)
	PuPlayer.LabelSet pDMD, "Booth" & nWheel, "`u`", 1, "{'mt':2,'rotate':" & dDegreeTenths & "}"
End Sub

sub pDMDImageMoveTo(LabName, mLen, pStartX, pStartY, pEndX, pEndY)
	Dim sJson
	sJson = "{'mt':1, 'at':2, 'mlen':" & (mLen) & ", 'len':" & (600000) & ", 'xps':" & pStartX & ",'xpe':" & pEndX &  ", 'yps':" & pStartY & ", 'ype':" & pEndY & ", 'tt':2 ,'ad':1}"
    PuPlayer.LabelSet pDMD, labName, "`u`", 1, sJson
end Sub
'*******************************************
'  Timers
'*******************************************


' The game timer interval is 10 ms
Sub GameTimer_Timer()
	Cor.Update 						'update ball tracking (this sometimes goes in the RDampen_Timer sub)
	RollingUpdate					'update rolling sounds
	DoDTAnim 						'handle drop target animations
	DoSTAnim						'handle stand up target animations
End Sub


' The frame timer interval is -1, so executes at the display frame rate
dim FrameTime, InitFrameTime : InitFrameTime = 0
Sub FrameTimer_Timer()
	FrameTime = gametime - InitFrameTime : InitFrameTime = gametime	'Count frametime
	FlipperVisualUpdate				'update flipper shadows and primitives
	HypnotoadAnimate
	BoothAnimate
	LRRRUpdate
	UpdateRainbow
	UpdateBeerBottles
	If DynamicBallShadowsOn Or AmbientBallShadowOn Then DynamicBSUpdate 'update ball shadows
End Sub



'*******************************************
'  Table Initialization and Exiting
'*******************************************

LoadCoreFiles
Sub LoadCoreFiles
	On Error Resume Next
	ExecuteGlobal GetTextFile("core.vbs")
	If Err Then MsgBox "Can't open core.vbs"
	On Error Goto 0
End Sub


Dim ETBall1, ETBall2, ETBall3, ETBall4, ETBall5, ETBall6, gBOT

Sub Table1_Init
	Dim i, oEvent

	'Ball initializations need for physical trough
	Set ETBall1 = KickerTrough1.CreateSizedballWithMass(Ballsize/2,Ballmass)
	Set ETBall2 = KickerTrough2.CreateSizedballWithMass(Ballsize/2,Ballmass)
	Set ETBall3 = KickerTrough3.CreateSizedballWithMass(Ballsize/2,Ballmass)
	Set ETBall4 = KickerTrough4.CreateSizedballWithMass(Ballsize/2,Ballmass)
	Set ETBall5 = KickerTrough5.CreateSizedballWithMass(Ballsize/2,Ballmass)
	Set ETBall6 = KickerTrough6.CreateSizedballWithMass(Ballsize/2,Ballmass)
	nBallsToFeed = 0

	'*** Use gBOT in the script wherever BOT is normally used. Then there is no need for GetBalls calls ***
	gBOT = Array(ETBall1, ETBall2, ETBall3, ETBall4, ETBall5, ETBall6)

	' Event queue
	Set oEventQueue = New EventQueue
	Set oCurrentEvent = Nothing
	nTimeLastPuP = 0
	InitRoundRobin

	' load high scores
	Loadhs

	' Setup hypnotoad turntable
	Set oHypnotoad = New cvpmTurntable
	oHypnotoad.InitTurntable TriggerHypnotoad, 50
	oHypnotoad.SpinDown = 10
	oHypnotoad.CreateEvents "oHypnotoad"
	bHypnoToadSpin = False
	dHypnotoadSpeed = 0
	nTimeHypnotoadUpdate = 0

	' Setup Suicide booth
	fBoothTargetAngle = 270

	' Setup LRRR pop-ups
	LRRRraisedLeft = False
	LRRRRaisedRight = False
	LRRRprimLeft.TransZ = 0.1
	LRRRWallLeft.collidable = False
	LRRRprimLeft.TransZ = 0.1
	LRRRWallRightUp.collidable = False

	' Turn on the GI lights
	dim xx
	For Each xx in GI
		xx.state = 1
	Next

	' Make drop target shadows visible
	for each xx in ShadowDT
		xx.visible=True
	Next

	' Turn off the bumper lights
	FlBumperFadeTarget(1) = 0
	FlBumperFadeTarget(2) = 0
	FlBumperFadeTarget(3) = 0

	' Init RGB inserts
	AllLightsOff
	nColorCycleIndex = 0
	LightSeqAttract.UpdateInterval = 25
	LightSeqAttract.Play SeqCircleOutOn, 40

	' Init signpost lights
	nPostLightStates = LightStateOff

	' Outlanes
	UpdateOutlanePosts

	' Blast button
	If HideBlastButton Then
		BlastButton.visible = False
		BlastPlate.visible = False
		Buttontopsticker.visible = False
	End If

	' flippers
	nTimeLowerLeftFlip = -1
	nTimeLowerRightFlip = -1
	nTimeUpperLeftFlip = -1
	nTimeUpperRightFlip = -1
	nTimeBlastUsed = 0
	If Table1.ShowDT Then
		FlipperULSh.Visible = False
		FlipperURSh.Visible = False
	End If

	' Gameplay variable inits
	For i = 0 to 3
		anScore(i) = 0
	Next
	nPlayersInGame = 0
	nPlayersLastGame = 1
	For i = 0 to 3
		Set avModesRunning(i) = new BitSet : avModesRunning(i).Capacity = 21
		Set avModesStarted(i) = new BitSet : avModesStarted(i).Capacity = 21
		Set avModesCompleted(i) = new BitSet : avModesCompleted(i).Capacity = 21
		Set avSkillShotsHit(i) = New BitSet : avSkillShotsHit(i).Capacity = 10
		Set avDrops5bankHit(i) = new BitSet : avDrops5bankHit(i).Capacity = 5
		Set avBeerLanes(i) = new BitSet : avBeerLanes(i).Capacity = 4
		Set avBoothOptionsUsed(i) = new BitSet : avBoothOptionsUsed(i).Capacity = 6
		for xx = 0 to 20
			Set aavShotsLit(i,xx) = New BitSet : aavShotsLit(i,xx).Capacity = 10
		Next
	Next
	For i = 0 to 9
		Set avShotColors(i) = New BitSet : avShotColors(i).Capacity = 12
	Next

	' FlexDMD
	SetLocale(1033)
	nDMDTextDisplayTime = 0
	nTimeInfoChange = 0
	nAttractModePage = 0
	sDMDCurrentScene = ""
	sDMDScene = "attract"
	If UseFlexDMD Then Flex_Init

	' PuP
	LoadEM
	If bEnablePuP Then PuPInit
	nTimePupStartPlay = 0

	' Init 7 segment digital display
	UpdateLEDs -1

	nTextPriority = ePrioIdle
	nModeOnScores = eModeNone
	Set oEvent = new EventItem

	oEvent.pupTrigger = 700 ' Attract mode
	oEvent.priority = ePrioNewPlayer
	oEventQueue.add oEvent

	DOF 120,DOFOn  'start button on

	GITimer.enabled = True 'Turn on GI
	SwitchMusic "music-attract"

End Sub

Sub Table1_Exit
	If B2SOn Then
		Controller.Pause = False
		Controller.Stop
	End If
	If UseFlexDMD = 0 Then Exit Sub
    If Not FlexDMD is Nothing Then
		FlexDMD.Show = False
		FlexDMD.Run = False
		FlexDMD = NULL
    End If
End Sub

'*******************************************
' ZLIF - Game lifecycle
'*******************************************

Sub TimerRestart_Timer
	If nPlayersInGame > 0 And nBall > 1 And True = BIPL And BIP < 2 Then
		If nTimeStartPressed > 0 And ((GameTime - nTimeStartPressed) > 1999) Then
			InitGame True
		End If
	End If
End Sub

Sub InitGame(bFastRestart)
	Dim i, j, oEvent

	For i = 0 to 3
		anScore(i) = 0
		avModesRunning(i).Clear
		avModesStarted(i).Clear
		avModesCompleted(i).Clear
		avSkillShotsHit(i).Clear
		avDrops5bankHit(i).Clear
		avBoothOptionsUsed(i).Clear
		for j = 0 to 20
			aanModeShots(i, j) = 0
			aanModeTime(i, j) = 0
			aanModeAttempts(i, j) = 0
			aavShotsLit(i, j).Clear
		Next
		' Because of Earth mode mechanics of being lit at the 
		' least recently hit shot, I init the shots to different times
		aanShotLastHit(i, eShotLeftLane) = 10
		aanShotLastHit(i, eShotLeftLoop) = 5
		aanShotLastHit(i, eShotLowerScoop) = 7
		aanShotLastHit(i, eShotSideLoop) = 9
		aanShotLastHit(i, eShotUpperScoop) = 1
		aanShotLastHit(i, eShotLeftRamp) = 3
		aanShotLastHit(i, eShotCenterLane) = 8
		aanShotLastHit(i, eShotInlineDrops) = 6
		aanShotLastHit(i, eShotRightRamp) = 4
		aanShotLastHit(i, eShotRightLoop) = 2

		anCombos(i) = 0
		anNextComboAward(i) = eComboAwardBumpers
		anComboLastCollect(i) = 0
		abComboEBCollected(i) = False
		anMysteryShotsMade(i) = 0
		For j = 0 to 3
			aanRecentMysteries(i, j) = eMysteryNone
		Next
	Next
	If Not bFastRestart Then
		SolDTBankInline True
		For i = 0 to 2
			Set aoBenderLockedBalls(i) = Nothing
		Next
	End If
	nPlayer = 0
	nPlayersInGame = 1
	nBall = 1
	nExtraBalls = 0
	nTimeVUKFired = 0
	nScoreLastFrame = 0
	nTimeAnySwitch = 0
	abMball1LoopLeft = Array(True, True, True, True)
	abMball1LoopRight = Array(True, True, True, True)
	anMBall1Locks = Array(0, 0, 0, 0)
	anMball1Played = Array(0, 0, 0, 0)
	anMBall2Locks = Array(3, 3, 3, 3)
	anMball2Played = Array(0, 0, 0, 0)
	anLiteLockShots = Array(0, 0, 0, 0)
	anMysteryLevelLit = Array(0, 0, 0, 0)
	anExtraBallsLit = Array(0, 0, 0, 0)
	anBlasts = Array(0, 0, 0, 0)

	LightSeqAttract.StopPlay
	TimerBlinkFast.Enabled = True
	TimerBlinkMedium.Enabled = True
	TimerBlinkSlow.Enabled = True
	InitBall bFastRestart
End Sub

Sub InitBall(bFastRestart)
	Dim i, oEvent
	nBonusX = 1
	fPlayfieldX = 1.0
	nTimeXPause = 0
	nTimeXCountdown = 0
	UpdateLEDs fPlayfieldX
	nTiltWarnings = 0
	nTiltLevel = 0
	ToggleSolenoids True
	nTimeDelayVUK = 0
	nTimeDelayLowerScoop = 0
	nTimeDelayBooth = 0
	nTimeMBallGraceLeft = 0
	bMusicAfterKick = False
	nTimeBallStart = GameTime
	bScoreUpdatedThisFrame = False
	bPlayerChanged = True
	bCountingBonus = False
	bFirstSwitchHit = False
	bMball2Ended = False
	bInMode = False
	bSelectingMode = False
	bMovingShip = False
	nShipMoves = 0
	bBallinLowerScoop = False
	nModePending = eModeNone

	bAddTimeAwarded = False
	bAddBallAwarded = False
	bShowingInstantInfo = False
	nTimeLowerLeftFlip = -1
	nTimeLowerRightFlip = -1
	nTimeUpperLeftFlip = -1
	nTimeUpperRightFlip = -1
	asModeMessage = Array("", "", "")
	nTimeModeTextUpdate = 0
	nTimeModeTextDisplay = 0
	nLightShowCurrent = eLightShowNone
	nLightShowPriority = ePrioIdle
	nLightShowTime = 0
	bLightShowBlinkOdd = False
	nTimeBooth = 0
	
	nModeSelected = eModeNone
	nBonusX = 1
	nBonusTotal = BONUS_ROLLOVER
	avBeerLanes(nPlayer).Clear

	nTextPriority = ePrioIdle
	nModeOnScores = eModeNone
	ClearEvents

	If 1 = nPlayersInGame And 1 = nBall And 0 = nExtraBalls Then
		Set oEvent = new EventItem
		oEvent.pupTrigger = RoundRobinEvent("NewGame") ' Player 1 added
		oEvent.duration = RoundRobinLength("NewGame")
		oEvent.priority = ePrioBlastAdded
		oEventQueue.add oEvent
	End If

	if nExtraBalls > 0 then
		nExtraBalls = nExtraBalls - 1
		Set oEvent = new EventItem
		oEvent.pupTrigger = 704 'Shoot again
		oEvent.text = Array("PLAYER " & (nPlayer + 1), "SHOOT AGAIN")
		oEvent.duration = 3167
		oEvent.priority = ePrioNewPlayer
		oEvent.interruptOngoing = True
		oEventQueue.add oEvent
	Else
		sDMDScene = "scoreboard"
	End If
	DMDUpdateBallNumber nBall
	DMDUpdateBlasts
	PlayModeMusic

	For i = 0 to 33
		anSwitchLastHit(i) = 0
	Next
	vpmTimer.AddTimer 500, "SolDTBank1to5 True '"

	For i = 0 to 9
		ClearShotColor i
		anComboTimer(i) = 0
	Next

	TimerMode.Enabled = True
	KickerAutoPlunge.Enabled = False

	SetLockForNewPlayer
	If avBoothOptionsUsed(nPlayer).Count > 2 Then
		abBoothReady(nPlayer) = False
		cLightSuicideBooth.state = LightStateOff
	Else
		abBoothReady(nPlayer) = True
		cLightSuicideBooth.state = LightStateOn
	End If

	BIP = 1
	If Not bFastRestart Then SolRelease True
	SkillShotInit
End Sub

Sub EndBall
	Dim oEvent
	AllLightsOff
	if nPlayer = nPlayersInGame - 1 and nBall = 3 and nExtraBalls = 0 then
		EndGame
		exit sub
	elseif nExtraBalls < 1 then
		if nPlayer = nPlayersInGame - 1 then
			nPlayer = 0
			nBall = nBall + 1
		else 
			nPlayer = nPlayer + 1
		end if
	end if
	InitBall False
End Sub

Sub EndGame
	Dim i, oEvent
	TimerMode.Enabled = False
	TimerBlinkFast.Enabled = False
	TimerBlinkMedium.Enabled = False
	TimerBlinkSlow.Enabled = False
	nPlayersLastGame = nPlayersInGame
	nPlayersInGame = 0
	for i = 0 to 2
		bResetInlines = True
		DTDrop 6 + i
		if Not aoBenderLockedBalls(i) is Nothing Then
			BIP = BIP + 1
			bDrainingBalls = True
			Set aoBenderLockedBalls(i) = Nothing
		End If
		vpmTimer.AddTimer 500, "bResetInlines = False '"
	next
	If bDrainingBalls Then ToggleSolenoids False
	UpdateLEDs -1
	LightSeqAttract.UpdateInterval = 25
	LightSeqAttract.Play SeqCircleOutOn, 40

	ClearEvents
	Set oEvent = new EventItem
	oEvent.pupTrigger = 700 ' Attract mode
	oEvent.priority = ePrioNewPlayer
	oEventQueue.add oEvent

	sDMDScene = "attract"
	CheckHighScore(anScore)
End Sub

'*******************************************
'  ZDRN - Drain, Trough, and Ball Release
'*******************************************
' It is best practice to never destroy balls. This leads to more stable and accurate pinball game simulations.
' The following code supports a "physical trough" where balls are not destroyed.
' To use this, 
'	- The trough geometry needs to be modeled with walls, and a set of kickers needs to be added to 
'     the trough. The number of kickers depends on the number of physical balls on the table.
' 	- A timer called "UpdateTroughTimer" needs to be added to the table. It should have an interval of 300 and be initially disabled.
'   - The balls need to be created within the Table1_Init sub. A global ball array (gBOT) can be created and used throughout the script


'TROUGH 
Sub KickerTrough1_Hit   : UpdateTrough : End Sub
Sub KickerTrough1_UnHit : UpdateTrough : End Sub
Sub KickerTrough2_Hit   : UpdateTrough : End Sub
Sub KickerTrough2_UnHit : UpdateTrough : End Sub
Sub KickerTrough3_Hit   : UpdateTrough : End Sub
Sub KickerTrough3_UnHit : UpdateTrough : End Sub
Sub KickerTrough4_Hit   : UpdateTrough : End Sub
Sub KickerTrough4_UnHit : UpdateTrough : End Sub
Sub KickerTrough5_Hit   : UpdateTrough : End Sub
Sub KickerTrough5_UnHit : UpdateTrough : End Sub
'Sub KickerTrough6_Hit   : UpdateTrough : End Sub
Sub KickerTrough6_UnHit : UpdateTrough : End Sub


Sub UpdateTrough
	UpdateTroughTimer.Interval = 300
	UpdateTroughTimer.Enabled = 1
End Sub

Sub UpdateTroughTimer_Timer
'	sTimersRun = sTimersRun & " UpdateTroughTimer"
	nReleaseDelay = nReleaseDelay - 300
	If nReleaseDelay < 1 Then nReleaseDelay = 0
	If KickerTrough1.BallCntOver = 0 Then KickerTrough2.kick 57, 10
	If KickerTrough2.BallCntOver = 0 Then KickerTrough3.kick 57, 10
	If KickerTrough2.BallCntOver = 0 Then KickerTrough3.kick 57, 10
	If KickerTrough3.BallCntOver = 0 Then KickerTrough4.kick 57, 10
	If KickerTrough4.BallCntOver = 0 Then KickerTrough5.kick 57, 10
	If KickerTrough5.BallCntOver = 0 Then KickerTrough6.kick 57, 10
	If nBallsToFeed > 0 and KickerTrough1.BallCntOver > 0 _
	And nReleaseDelay < 1 And nTimeDelayMultiball < 1 Then
		SolRelease True
		KickerTrough1.kick 90, 7
		nBallsToFeed = nBallsToFeed - 1
		nReleaseDelay = 2000
	End If
	If nReleaseDelay < 1 and nBallsToFeed < 1 then Me.Enabled = 0
End Sub

Sub Drain_Hit
	RandomSoundDrain Drain 
	Drain.TimerEnabled = True
End Sub

Sub Drain_Timer
	Drain.kick 57, 20
	Drain.TimerEnabled = False
End Sub

Sub KickerTrough6_Hit
	Dim i, oEvent

	UpdateTrough
	BIP = BIP - 1
	If bSkillShotActive Then SkillShotEnd
	' Handle balls kicked out from locks after a game over
	If nPlayersInGame = 0 Then
		If BIP <= 0 Then
			BIP = 0
			bDrainingBalls = False
		End If
		Exit Sub
	End If

	' Handle ball that drained in an outlane during ball save
	If bOutlaneSave Then
		BIP = BIP + 1
		bOutlaneSave = False
	' handle ball saver
	Elseif (nTimeBallSave > 0) Then
		BIP = BIP + 1
		If BIP < 2 Then
			ClearEvents
			Set oEvent = New EventItem
			oEvent.text = "BALL SAVED"
			oEvent.pupTrigger = RoundRobinEvent("BallSaved"): DOF 127, DOFPulse
			oEvent.duration = RoundRobinLength("BallSaved")
			oEvent.priority = ePrioBallSave
			oEvent.interruptOngoing = True
			oEventQueue.Add oEvent
			If nExtraBalls > 0 Then
				cLightShootAgain.state = LightStateOn
			Else
				cLightShootAgain.state = LightStateOff
			End If
			nTimeBallSave = 0
		End If
		nBallsToFeed = nBallsToFeed + 1
		KickerAutoPlunge.Enabled = True
		Exit Sub
	End If

	If 1 = BIP Then
		if avModesRunning(nPlayer).Contains(eModeMultiball1) Then
			nTimeMBallGraceLeft = nTimeMBallGrace
			ModeMultiball1Update eShotNone, eSwitchNone, False
		end If
		if avModesRunning(nPlayer).Contains(eModeMultiball2) Then
			nTimeMBallGraceLeft = nTimeMBallGrace
			ModeMultiball2Update eShotNone, eSwitchNone, False
			If bEnablePuP Then
				PuPEvent 776
				' default background
				vpmTimer.AddTimer 200, "PuPEvent 780 '"
				nTimeLastPuP = gameTime + 200
			End If
		end If
		if avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
			nTimeMBallGraceLeft = nTimeMBallGrace
			ModeMiniWizard1Update eShotNone, eSwitchNone, False
		end If
		if avModesRunning(nPlayer).Contains(eModeImmolation) Then
			nTimeMBallGraceLeft = nTimeMBallGrace
			ModeMiniWizard2Update eShotNone, eSwitchNone, False
		end If
		if avModesRunning(nPlayer).Contains(eModeSlurm) Then
			nTimeMBallGraceLeft = nTimeMBallGrace
			ModeSlurmUpdate eShotNone, eSwitchNone, False
		end If
	End If

	If 0 = BIP then
        SolLFlipper False
        SolRFlipper False
        SolULFlipper False
        SolURFlipper False
		nTimeLowerLeftFlip = -1
		nTimeLowerRightFlip = -1
		nTimeUpperLeftFlip = -1
		nTimeUpperRightFlip = -1

		If bDrainingBalls Then
			ToggleSolenoids True
			' handle tilt
			If nTiltWarnings < 3 Then
				' Handle modes which drain balls after they end (Cherry Bomb)
'				BIP = 1
'				AutoPlunge 1
			Else
				DMDHideBlasts
				nTextDuration = 0
				nTextPriority = ePrioIdle
				EndBall
			End If
			bDrainingBalls = False
			Exit Sub
		Else
			' End Modes
			for i = 0 to 20
				If avModesRunning(nPlayer).Contains(i) Then
					EndMode i, True, False, eShotNone
				End If
			next
			UpdateLEDs -1
			DMDHideBlasts
			StopAllMusic
			InitBonus
		End If
	End If
End Sub


Sub SolRelease(enabled)
	If enabled Then
		If KickerTrough1.BallCntOver > 0 Then
			DOF 111,DOFPulse
			KickerTrough1.kick 90, 10		
			RandomSoundBallRelease KickerTrough1
		Else
			nBallsToFeed = nBallsToFeed + 1
			UpdateTrough
		End If
	End If
End Sub



'*******************************************
'  ZSCO - Scoring
'*******************************************

Const SCORE_MBALL1_LIGHT_LOCK = 1500000 '1.5m
Const SCORE_MBALL1_LOCK = 5000000 '5m
Const SCORE_MBALL1_START = 5000000 ' 5m
Const SCORE_MBALL1_SUPERJP = 60000000 ' 60m
Const SCORE_MBALL1_JACKPOT = 25000000 ' 25m
Const SCORE_BENDER_LIGHT_LOCK = 1500000 '1.5m
Const SCORE_BENDER_LOCK = 5000000 ' 5m
Const SCORE_BENDER_START = 5000000 '5m
Const SCORE_BENDER_JACKPOT = 15000000 ' 15m
Const SCORE_BENDER_RELIGHT = 5000000 '5m
Const SCORE_BENDER_SUPERJP = 80000000 ' 80m
Const SCORE_MINIWIZONE_BASE = 10000000 ' 10m
Const SCORE_MINIWIZTWO_BASE = 12000000 ' 12m
Const SCORE_MINIWIZTWO_ADD = 4000000 ' 4m
Const SCORE_SLURM_BASE = 10000000 ' 10m
Const SCORE_SLURM_ADD = 10000000 ' 10m
Const SCORE_SLURM_SUPERJP = 50000000 ' 50m
Const SCORE_BUMPER_UNLIT = 290870
Const SCORE_BUMPER_SUPER = 2000000 ' 2m
Const SCORE_TARGET_UNLIT = 470130
Const SCORE_LOWER_LANES = 378850
Const SCORE_BLASTS_MAXED = 5000000 ' 5m
Const SCORE_SLINGHOT = 62910
Const SCORE_SPINNER_UNLIT = 148930
Const SCORE_SPINNER_SUPER = 1000000 ' 1m
Const SCORE_SUPER_RAMPS = 8000000 ' 8m
Const SCORE_SUPER_LOOPS = 5000000 ' 5m
Const SCORE_FRENZY = 1000000 ' 1m
Const SCORE_SKILLSHOT_UNIQUE = 25000000 ' 25m
Const SCORE_SKILLSHOT_REPEAT = 15000000 ' 15m
Const SCORE_COMBO = 3000000 ' 3m
Const SCORE_BIG_POINTS = 50000000 ' 50m
Const SCORE_SPEED_BONUS = 2000000 ' 2m per second left

Dim anShotUnlitValue(11)
anShotUnlitValue(eShotLeftLane) = 10 : anShotUnlitValue(eShotLowerScoop) = 1500080
anShotUnlitValue(eShotLeftLoop) = 1500030 : anShotUnlitValue(eShotSideLoop) = 1500020
anShotUnlitValue(eShotUpperScoop) = 1500010 : anShotUnlitValue(eShotLeftRamp) = 1500070
anShotUnlitValue(eShotCenterLane) = 1500090 : anShotUnlitValue(eShotRightRamp) = 1500060
anShotUnlitValue(eShotInlineDrops) = 10 : anShotUnlitValue(eShotRightLoop) = 1500060
anShotUnlitValue(eShotLRRRLeft) = 1000000 : anShotUnlitValue(eShotLRRRRight) = 1000000

Sub Addscore (value)
	anScore(nPlayer) = anScore(nPlayer) + (fPlayfieldX * value)
End Sub

' Locale independent number formatter
Function FormatScore(nScore)
	Dim i
	Dim sScore, sFormattedScore
	sScore = CStr(nScore)
	sFormattedScore = ""
	Dim nDigitCount
	Dim sDigit
	If "" = sScore or "0" = sScore Then
		FormatScore = "00"
		Exit Function
	End If
	nDigitCount = Len(sScore)
	For i = 1 to nDigitCount
		sDigit = Mid(sScore, (1 + (nDigitCount - i)), 1)
		If (i > 1) and (1 = (i mod 3)) Then
			sFormattedScore = sFormattedScore & "," & sDigit
		Else
			sFormattedScore = sFormattedScore & sDigit
		End If
	Next
	FormatScore = StrReverse(sFormattedScore)
End Function

'*******************************************
'  ZKEY - Key Press Handling
'*******************************************


Sub Table1_KeyDown(ByVal keycode)
	Dim oEvent, bReverse

	If keycode = 19 then ScoreCard=1 : CardTimer.enabled=True

	If keycode = LeftTiltKey Then Nudge 90, 2.5 : SoundNudgeLeft
	If keycode = RightTiltKey Then Nudge 270, 2.5 : SoundNudgeRight
	If keycode = CenterTiltKey Then Nudge 0, 3 : SoundNudgeCenter

	If keycode = LeftFlipperKey and Renderingmode = 2 then PinCab_Left_Flipper_Button.X = PinCab_Left_Flipper_Button.X + 8
	If keycode = RightFlipperKey and Renderingmode = 2 then PinCab_Right_Flipper_Button.X = PinCab_Right_Flipper_Button.X - 8

	bReverse = False
	If nPlayersInGame > 0 And not bDrainingBalls Then
		If aanModeTime(nPlayer, eModeReverseFlips) > 0 Then bReverse = True

		If 0 = stagedFlipperStyle Then
			If ((LeftMagnaSave = keycode) And (Not bReverse)) _
			Or ((RightMagnaSave = keycode) And bReverse) Then
				nTimeLowerLeftFlip = GameTime
				If (not bSelectingMode) and (not bCountingBonus) _
				And (-1 = nTimeUpperLeftFlip) Then
					FlipperActivate LeftFlipper, LFPress
					SolLFlipper True
				End If
				If avModesRunning(nPlayer).Contains(eModeMoon) Then
					anMoonShotGray(nPlayer) = anMoonShotGray(nPlayer) - 1
					If anMoonShotGray(nPlayer) <= eShotLeftLane Then anMoonShotGray(nPlayer) = eShotRightLoop
					ModeMoonUpdate eShotNone, eSwitchNone, False
				End If
			End If

			If ((RightMagnaSave = keycode) And (Not bReverse)) _
			Or ((LeftMagnaSave = keycode) And bReverse) Then
				nTimeLowerRightFlip = GameTime
				If (not bSelectingMode) and (not bCountingBonus) _
				And (-1 = nTimeUpperRightFlip) Then
					FlipperActivate RightFlipper, RFPress
					SolRFlipper True
				End If
				If avModesRunning(nPlayer).Contains(eModeMoon) Then
					anMoonShotWhite(nPlayer) = anMoonShotWhite(nPlayer) + 1
					If anMoonShotWhite(nPlayer) > eShotRightLoop then anMoonShotWhite(nPlayer) = eShotLowerScoop
					ModeMoonUpdate eShotNone, eSwitchNone, False
				End If
			End If
		End If

		If 1 = stagedFlipperStyle Then
			If ((30 = keycode) And (Not bReverse)) _
			Or ((40 = keycode) And bReverse) Then
				If (not bSelectingMode) and (not bCountingBonus) and (not bDrainingBalls) Then
					SolULFlipper True
				End If
			End If

			If ((40 = keycode) And (Not bReverse)) _
			Or ((30 = keycode) And bReverse) Then
				If (not bSelectingMode) and (not bCountingBonus) and (not bDrainingBalls) Then
					SolURFlipper True
				End If
			End If
		End If

		If ((keycode = LeftFlipperKey) And (Not bReverse)) _
		Or ((keycode = RightFlipperKey) And bReverse) Then
			If bSelectingMode Then ModeSelectPrevious
			If not bCountingBonus Then
				FlipperActivate LeftFlipper, LFPress
				SolLFlipper True						'This would be called by the solenoid callbacks if using a ROM
				If stagedFlipperStyle <> 1 Then
					SolULFlipper True
				End If
				avBeerLanes(nPlayer).RotateLeft
				UpdateBeer
			End If
			' double flip skip if flips are less than 50 ms apart
			nTimeUpperLeftFlip = GameTime
			If (GameTime - nTimeUpperRightFlip) < 50 Then
				DoubleFlipHurry
			End If
			If avModesRunning(nPlayer).Contains(eModeMoon) Then
				anMoonShotGray(nPlayer) = anMoonShotGray(nPlayer) - 1
				If anMoonShotGray(nPlayer) <= eShotLeftLane Then anMoonShotGray(nPlayer) = eShotRightLoop
				ModeMoonUpdate eShotNone, eSwitchNone, False
			End If
			If bShowingInstantInfo Then
				nTimeInfoChange = nDMDTextDisplayTime - 2000
			End If
		End If

		If ((keycode = RightFlipperKey) And (Not bReverse)) _
		Or ((keycode = LeftFlipperKey) And bReverse) Then
			If bSelectingMode Then ModeSelectNext
			If not bCountingBonus Then
				FlipperActivate RightFlipper, RFPress
				SolRFlipper True						'This would be called by the solenoid callbacks if using a ROM
				If stagedFlipperStyle <> 1 Then
					SolURFlipper True
				End If
				avBeerLanes(nPlayer).RotateRight
				UpdateBeer
			End If
			' double flip skip if flips are less than 50 ms apart
			nTimeUpperRightFlip = GameTime
			If (GameTime - nTimeUpperLeftFlip) < 50 Then
				DoubleFlipHurry
			End If
			If avModesRunning(nPlayer).Contains(eModeMoon) Then
				anMoonShotWhite(nPlayer) = anMoonShotWhite(nPlayer) + 1
				If anMoonShotWhite(nPlayer) > eShotRightLoop then anMoonShotWhite(nPlayer) = eShotLowerScoop
				ModeMoonUpdate eShotNone, eSwitchNone, False
			End If
			If bShowingInstantInfo Then
				nTimeInfoChange = nDMDTextDisplayTime - 2000
			End If
		End If

		If keycode = PlungerKey Then
			If BlastWithPlunger And (Not BIPL) _
			And (Not bSelectingMode) And (nTimeBooth < 1) Then
				BlastButtonUsed
			End If
			If bSelectingMode And bFirstSwitchHit then
				nTimeBlastUsed = GameTime
				ModeSelectChoose
			ElseIf nTimeBooth > 0 Then
				nTimeBlastUsed = GameTime
				DoubleFlipHurry
			Else
				Plunger.Pullback
				SoundPlungerPull
				If RenderingMode = 2 then TimerVRPlunger.Enabled = True
				If RenderingMode = 2 then TimerVRPlunger2.Enabled = False
			End If
		End If

		If keycode = StartGameKey Then
			SoundStartButton
			If 1 = nBall and nPlayersInGame < 4 Then
				nPlayersInGame = nPlayersInGame + 1
				If nPlayersInGame > 1 Then
					bPlayerChanged = True
					' New player notification
					Set oEvent = new EventItem
					oEvent.interruptOngoing = True
					oEvent.priority = ePrioNewPlayer
					oEvent.text = Array("PLAYER " & nPlayersInGame, "JOINS THE GAME")
					If 2 = nPlayersInGame then
						oEvent.pupTrigger = 300 ' Player 2 added
						oEvent.duration = 6400
					Elseif 3 = nPlayersInGame Then
						oEvent.pupTrigger = 301 ' Player 3 added
						oEvent.duration = 6100
					Else
						oEvent.pupTrigger = 302 ' Player 4 added
						oEvent.duration = 5967
					End If
					oEventQueue.add oEvent
				End If
			End If
			nTimeStartPressed = GameTime
		End If

		If keycode = LockBarKey Then
			If nTimeBooth > 0 Then
				nTimeBlastUsed = GameTime
				DoubleFlipHurry
			ElseIf bSelectingMode Then
				nTimeBlastUsed = GameTime
				ModeSelectChoose
			Else
				BlastButtonUsed
			End If
		End If

		If keycode = LeftTiltKey Or keycode = RightTiltKey or _
		keycode = CenterTiltKey Then
			HandleTilt
		End If

		If keycode = MechanicalTilt Then
			SoundNudgeCenter
			nTiltLevel = nTiltLevel + 6
			HandleTilt
		End If
	Else

		If keycode = LeftFlipperKey And bEnteringHighScore Then
			HighScoreLeftPressed
		End If

		If keycode = RightFlipperKey And bEnteringHighScore Then
			HighScoreRightPressed
		End If

		If keycode = LeftFlipperKey And sDMDCurrentScene = "attract" Then
			' Go back two pages and tell the DMD to show the next page
			nAttractModePage = (nAttractModePage + (nAttractModePageCount - 2)) Mod nAttractModePageCount
			nDMDTextDisplayTime = nAttractModePageTime
		End If

		If keycode = RightFlipperKey And sDMDCurrentScene = "attract" Then
			' tell the DMD to show the next page
			nDMDTextDisplayTime = nAttractModePageTime
		End If

		If (keycode = LockBarKey or keycode = PlungerKey) And bEnteringHighScore Then
			HighScoreEnterPressed
		End If

		If keycode = StartGameKey And ((0 = BIP) or bEnteringHighScore) Then
			SoundStartButton
			If bEnteringHighScore Then
				HighScoreEnterPressed
			Else
				InitGame False
			End If
		End If
	End If

	'If keycode = keyInsertCoin1 or keycode = keyInsertCoin2 or keycode = keyInsertCoin3 or keycode = keyInsertCoin4 Then 'Use this for ROM based games
	If keycode = AddCreditKey or keycode = AddCreditKey2 Then
		Select Case Int(rnd*3)
			Case 0: PlaySound ("Coin_In_1"), 0, CoinSoundLevel, 0, 0.25
			Case 1: PlaySound ("Coin_In_2"), 0, CoinSoundLevel, 0, 0.25
			Case 2: PlaySound ("Coin_In_3"), 0, CoinSoundLevel, 0, 0.25
		End Select
	End If
End Sub

Sub Table1_KeyUp(ByVal keycode)
	Dim bReverse

	if keycode = 19 then ScoreCard=0
	if keycode = LeftFlipperKey And RenderingMode = 2 then PinCab_Left_Flipper_Button.X = PinCab_Left_Flipper_Button.X - 8
	if keycode = RightFlipperKey And RenderingMode = 2 then PinCab_Right_Flipper_Button.X = PinCab_Right_Flipper_Button.X + 8

	If KeyCode = PlungerKey Then
		Plunger.Fire
		If RenderingMode = 2 then TimerVRPlunger.Enabled = False
		If RenderingMode = 2 then TimerVRPlunger2.Enabled = True
		If RenderingMode = 2 then Pincab_Plunger.Y = 238.6666
		If BIPL Then
			SoundPlungerReleaseBall()			'Plunger release sound when there is a ball in shooter lane
		Else
			SoundPlungerReleaseNoBall()			'Plunger release sound when there is no ball in shooter lane
		End If
	End If

	bReverse = False
	If nPlayersInGame > 0 Then
		If aanModeTime(nPlayer, eModeReverseFlips) > 0 Then bReverse = True
	End If

	If 0 = stagedFlipperStyle Then
		If ((LeftMagnaSave = keycode) And (Not bReverse)) _
		Or ((RightMagnaSave = keycode) And bReverse) Then
			nTimeLowerLeftFlip = -1
			If nTimeUpperLeftFlip = -1 And bCountingBonus = False And _
			bEnteringHighScore = False And bDrainingBalls = False Then
				FlipperDeActivate LeftFlipper, LFPress
				SolLFlipper False
			End If
		End If

		If ((RightMagnaSave = keycode) And (Not bReverse)) _
		Or ((LeftMagnaSave = keycode) And bReverse) Then
			nTimeLowerRightFlip = -1
			If nTimeUpperRightFlip = -1 And bCountingBonus = False And _
			bEnteringHighScore = False And bDrainingBalls = False Then
				FlipperDeActivate RightFlipper, RFPress
				SolRFlipper False
			End If
		End If
	End If

	If 1 = stagedFlipperStyle Then
		If ((30 = keycode) And (Not bReverse)) _
		Or ((40 = keycode) And bReverse) Then
			SolULFlipper False
		End If

		If ((40 = keycode) And (Not bReverse)) _
		Or ((30 = keycode) And bReverse) Then
			SolURFlipper False
		End If
	End If

	If ((keycode = LeftFlipperKey) And (Not bReverse)) _
	Or ((keycode = RightFlipperKey) And bReverse) Then
		If bEnteringHighScore Then
			HighScoreLeftReleased
		Elseif not bCountingBonus Then
			nTimeUpperLeftFlip = -1
			If stagedFlipperStyle <> 1 Then
				SolULFlipper False
			End If
			If stagedFlipperStyle <> 0 or -1 = nTimeLowerLeftFlip Then
				FlipperDeActivate LeftFlipper, LFPress
				SolLFlipper False
			End If
		End If
	End If

	If ((keycode = RightFlipperKey) And (Not bReverse)) _
	Or ((keycode = LeftFlipperKey) And bReverse) Then
		If bEnteringHighScore Then
			HighScoreRightReleased
		Elseif not bCountingBonus Then
			nTimeUpperRightFlip = -1
			If stagedFlipperStyle <> 1 Then
				SolURFlipper False
			End If
			If stagedFlipperStyle <> 0 or -1 = nTimeLowerRightFlip Then
				FlipperDeActivate RightFlipper, RFPress
				SolRFlipper False
			End If
		End If
	End If

	If keycode = StartGameKey Then
		nTimeStartPressed = 0
	End If
End Sub

Sub DoubleFlipHurry
	Dim oEvent, i

	If nTimeBooth > 0 Then
		If (1 = nBoothOption) and (Not avBoothOptionsUsed(nPlayer).Contains(1)) Then
			avBoothOptionsUsed(nPlayer).add 1
			aanModeTime(nPlayer, eModeHypnotoad) = anModeStartTime(eModeHypnotoad)
			avModesRunning(nPlayer).Add eModeHypnotoad
			SpinHypnotoad True
			bBoothSaved = True
			fBoothTargetAngle = 190
		Elseif (3 = nBoothOption) and (Not avBoothOptionsUsed(nPlayer).Contains(3)) Then
			avBoothOptionsUsed(nPlayer).add 3
			fPlayfieldX = 0.5
			UpdateLEDs fPlayfieldX
			bBoothSaved = True
			fBoothTargetAngle = 190
		Elseif (5 = nBoothOption) and (Not avBoothOptionsUsed(nPlayer).Contains(5)) Then
			avBoothOptionsUsed(nPlayer).add 5
			aanModeTime(nPlayer, eModeReverseFlips) = anModeStartTime(eModeReverseFlips)
			avModesRunning(nPlayer).Add eModeReverseFlips
			bBoothSaved = True
			fBoothTargetAngle = 190
		Else
			fBoothTargetAngle = 315
			bBoothSaved = False
		End If
		BoothOpenDoors
		nTimeBooth = 0
		KickerBooth.TimerEnabled = True
	End If

	If nTimeReleaseLock > 0 Then
		If oEventQueue.Size > 0 Then
			for i = 1 to oEventQueue.Size
				Set oEvent = oEventQueue.Peek
				If eShotInlineDrops <> oEvent.holdBallAt Then
					Exit For
				Else
					Set oEvent = oEventQueue.deQueue
				End If
			Next
		End If
		nTimeReleaseLock = 1
		TimerLock_Timer
	End If

	If nTimeDelayVUK > 0 Then
		If oEventQueue.Size > 0 Then
			for i = 1 to oEventQueue.Size
				Set oEvent = oEventQueue.Peek
				If eShotUpperScoop <> oEvent.holdBallAt Then
					Exit For
				Else
					Set oEvent = oEventQueue.deQueue
				End If
			Next
		End If
		nTimeDelayVUK = 1
	End If

	If nTimeDelayLowerScoop > 0 Then
		if bSelectingMode Then
			ModeSelectChoose
		Else
			If oEventQueue.Size > 0 And (Not bSelectingMode) Then
				Set oCurrentEvent = Nothing
				nTextDuration = 0
				nTextPriority = ePrioIdle
				HandleQueueEvent
			End If
			' Make sure the queue updates before the kickout
			If Not bSelectingMode Then
				nTimeDelayLowerScoop = 35
				TimerKickoutWarning.Enabled = False
			End If
		End If
	End If
	If (sDMDScene = "text2lines") And TimerMystery.Enabled _
	And (nMysteryAnimStep < 6) Then
		AwardMystery anPossibleAwards(0)
		TimerMystery.Enabled = False
	End If

	If (nTimeDelayBooth > 0) And KickerBooth.TimerEnabled Then
		nTimeDelayBooth = 1
		KickerBooth_Timer
	End If

	If bCountingBonus and nBonusScreen < 4 Then
		nBonusScreen = 4
		TimerBonus_Timer
	End If
End Sub

'*******************************************
'  Flippers
'*******************************************

Const ReflipAngle = 20

' Flipper Solenoid Callbacks (these subs mimics how you would handle flippers in ROM based tables)
Sub SolLFlipper(Enabled)
	If Enabled Then
		LF.Fire  'leftflipper.rotatetoend
		DOF 101,DOFOn
		If leftflipper.currentangle < leftflipper.endangle + ReflipAngle Then 
			RandomSoundReflipUpLeft LeftFlipper
		Else 
			SoundFlipperUpAttackLeft LeftFlipper
			RandomSoundFlipperUpLeft LeftFlipper
		End If		
	Else
		LeftFlipper.RotateToStart
		DOF 101,DOFOff
		If LeftFlipper.currentangle < LeftFlipper.startAngle - 5 Then
			RandomSoundFlipperDownLeft LeftFlipper
		End If
		FlipperLeftHitParm = FlipperUpSoundLevel
	End If
End Sub

Sub SolRFlipper(Enabled)
	If Enabled Then
		RF.Fire 'rightflipper.rotatetoend
		DOF 102,DOFOn
		If rightflipper.currentangle > rightflipper.endangle - ReflipAngle Then
			RandomSoundReflipUpRight RightFlipper
		Else 
			SoundFlipperUpAttackRight RightFlipper
			RandomSoundFlipperUpRight RightFlipper
		End If
	Else
		RightFlipper.RotateToStart
		DOF 102,DOFOff
		If RightFlipper.currentangle > RightFlipper.startAngle + 5 Then
			RandomSoundFlipperDownRight RightFlipper
		End If	
		FlipperRightHitParm = FlipperUpSoundLevel
	End If
End Sub

Sub SolURFlipper(Enabled)
	If Enabled Then
		upperRightflipper.rotatetoend

		If upperRightflipper.currentangle > upperRightflipper.endangle - ReflipAngle Then
			RandomSoundReflipUpRight upperRightflipper
		Else 
			SoundFlipperUpAttackRight upperRightflipper
			RandomSoundFlipperUpRight upperRightflipper
		End If
	Else
		upperRightflipper.RotateToStart
		If upperRightflipper.currentangle > upperRightflipper.startAngle + 5 Then
			RandomSoundFlipperDownRight upperRightflipper
		End If	
		FlipperRightHitParm = FlipperUpSoundLevel
	End If
End Sub

Sub SolULFlipper(Enabled)
	If Enabled Then
		upperLeftflipper.rotatetoend

		If upperLeftflipper.currentangle > upperLeftflipper.endangle - ReflipAngle Then
			RandomSoundReflipUpRight upperLeftflipper
		Else 
			SoundFlipperUpAttackRight upperLeftflipper
			RandomSoundFlipperUpRight upperLeftflipper
		End If
	Else
		upperLeftflipper.RotateToStart
		If upperLeftflipper.currentangle > upperLeftflipper.startAngle + 5 Then
			RandomSoundFlipperDownRight upperLeftflipper
		End If	
		FlipperRightHitParm = FlipperUpSoundLevel
	End If
End Sub

' Flipper collide subs
Sub LeftFlipper_Collide(parm)
	CheckLiveCatch Activeball, LeftFlipper, LFCount, parm
	LeftFlipperCollide parm
End Sub

Sub RightFlipper_Collide(parm)
	CheckLiveCatch Activeball, RightFlipper, RFCount, parm
	RightFlipperCollide parm
End Sub

' This subroutine updates the flipper shadows and visual primitives
Sub FlipperVisualUpdate
	FlipperLSh.RotZ = LeftFlipper.CurrentAngle
	FlipperULSh.RotZ = UpperLeftFlipper.CurrentAngle
	FlipperRSh.RotZ = RightFlipper.CurrentAngle
	FlipperURSh.RotZ = UpperRightFlipper.CurrentAngle
	LFLogo.RotZ = LeftFlipper.CurrentAngle
	ULFLogo.RotZ = UpperLeftFlipper.CurrentAngle
	RFlogo.RotZ = RightFlipper.CurrentAngle
	URFLogo.RotZ = UpperRightFlipper.CurrentAngle
End Sub

' ZTOY - Toy visual updates

Sub RaiseLRRRLeft
	LRRRraisedLeft = True
End Sub

Sub LowerLRRRLeft
	LRRRraisedLeft = False
End Sub

Sub RaiseLRRRRight
	LRRRRaisedRight = True
End Sub

Sub LowerLRRRRight
	LRRRRaisedRight = False
End Sub

Sub LRRRUpdate
	If LRRRraisedLeft Then
		If slugleft.TransY < LRRRMoveHeight Then
			slugleft.TransY = slugleft.TransY + (LRRRMoveHeight * (FrameTime / LRRRMoveTime))
			If slugleft.TransY >= LRRRMoveHeight Then
				slugleft.TransY = LRRRMoveHeight
				LRRRWallLeft.collidable = True
				PlaySoundAt "slug_raise", slugleft
			End If
		sluglefteye.TransY = slugleft.TransY
		slugleftpupil.TransY = slugleft.TransY
		End If
	Else
		If slugleft.TransY > 0.1 Then
			slugleft.TransY = slugleft.TransY - (LRRRMoveHeight * (FrameTime / LRRRMoveTime))
			If slugleft.TransY < 0.1 Then
				slugleft.TransY = 0.1
				LRRRWallLeft.collidable = False
				sluglefteye.TransY = slugleft.TransY
				slugleftpupil.TransY = slugleft.TransY
			End If
		End If
	End If
	If LRRRRaisedRight Then
		If slugright.TransY < LRRRMoveHeight Then
			slugright.TransY = slugright.TransY + (LRRRMoveHeight * (FrameTime / LRRRMoveTime))
			If slugright.TransY >= LRRRMoveHeight Then
				slugright.TransY = LRRRMoveHeight
				LRRRWallRightUp.collidable = True
				PlaySoundAt "slug_raise", slugright
			End If
			slugrigtheye.TransY = slugright.TransY
			slugrightpupil.TransY = slugright.TransY
		End If
	Else
		If slugright.TransY > 0.1 Then
			slugright.TransY = slugright.TransY - (LRRRMoveHeight * (FrameTime / LRRRMoveTime))
			If slugright.TransY < 0.1 Then
				slugright.TransY = 0.1
				LRRRWallRightUp.collidable = False
				slugrigtheye.TransY = slugright.TransY
				slugrightpupil.TransY = slugright.TransY
			End If
		End If
	End If
End Sub

Sub SpinHypnotoad(bEnabled)
	bHypnoToadSpin = bEnabled
	oHypnotoad.MotorOn = bEnabled
End Sub

Sub HypnotoadAnimate
	Dim dAccel, nTimePassed, dAngle, dVolume
	dAccel = nHypnotoadMaxSpeed / nHypnotoadSpinUpDown
	nTimePassed = GameTime - nTimeHypnotoadUpdate

	if bHypnoToadSpin Then
		If dHypnotoadSpeed < nHypnotoadMaxSpeed Then
			dHypnotoadSpeed = dHypnotoadSpeed + (dAccel * nTimePassed)
			dVolume = Solenoid_SpinWheelsMotor_SoundLevel * (dHypnotoadSpeed / nHypnotoadMaxSpeed)
			PlaySoundAtLevelExistingStaticLoop "Spin_Wheels_Motors_Loop_Regular", dVolume, ToadVisual
		End If
		If dHypnotoadSpeed > nHypnotoadMaxSpeed Then
			dHypnotoadSpeed = nHypnotoadMaxSpeed
		End If
		dAngle = (ToadVisual.RotY + (dHypnotoadSpeed * dRpmToDegPerMs * nTimePassed))
		If dAngle > 360 then dAngle = dAngle - 360
		ToadVisual.RotY = dAngle
	Else
		dAngle = (ToadVisual.RotY + (dHypnotoadSpeed * dRpmToDegPerMs * nTimePassed))
		' Start slowdown at 244 degrees, so that the slowdown ends at 0 degrees
		If dHypnotoadSpeed > 0 Then
			If (dHypnotoadSpeed < nHypnotoadMaxSpeed) _
			Or ((ToadVisual.RotY < 244) And (dAngle >= 244)) Then
				dHypnotoadSpeed = dHypnotoadSpeed - (dAccel * nTimePassed)
				If dHypnotoadSpeed > 0 Then
					StopSound "Spin_Wheels_Motors_Loop_Regular"
				Else
					dHypnotoadSpeed = 0
				End If
			End If
		End If
		If dHypnotoadSpeed <= 0 Then
			dHypnotoadSpeed = 0
		Else
			If dAngle > 360 then dAngle = dAngle - 360
			ToadVisual.RotY = dAngle
		End If
	End If
	nTimeHypnotoadUpdate = GameTime
End Sub

Sub UpdateOutlanePosts
	Select Case LeftOutlaneDifficulty
		Case 0
			zCol_OutlaneLeftEasy.collidable = True
			RubberOutlaneLeftEasy.visible = True
			PinOutlaneLeftEasy.visible = True
			zCol_OutlaneLeftMedium.collidable = False
			RubberOutlaneLeftMedium.visible = False
			PinOutlaneLeftMedium.visible = False
			zCol_OutlaneLeftHard.collidable = False
			RubberOutlaneLeftHard.visible = False
			PinOutlaneLeftHard.visible = False
		Case 1
			zCol_OutlaneLeftEasy.collidable = False
			RubberOutlaneLeftEasy.visible = False
			PinOutlaneLeftEasy.visible = False
			zCol_OutlaneLeftMedium.collidable = True
			RubberOutlaneLeftMedium.visible = True
			PinOutlaneLeftMedium.visible = True
			zCol_OutlaneLeftHard.collidable = False
			RubberOutlaneLeftHard.visible = False
			PinOutlaneLeftHard.visible = False
		Case 2
			zCol_OutlaneLeftEasy.collidable = False
			RubberOutlaneLeftEasy.visible = False
			PinOutlaneLeftEasy.visible = False
			zCol_OutlaneLeftMedium.collidable = False
			RubberOutlaneLeftMedium.visible = False
			PinOutlaneLeftMedium.visible = False
			zCol_OutlaneLeftHard.collidable = True
			RubberOutlaneLeftHard.visible = True
			PinOutlaneLeftHard.visible = True
		Case 3
			zCol_OutlaneLeftEasy.collidable = False
			RubberOutlaneLeftEasy.visible = False
			PinOutlaneLeftEasy.visible = False
			zCol_OutlaneLeftMedium.collidable = False
			RubberOutlaneLeftMedium.visible = False
			PinOutlaneLeftMedium.visible = False
			zCol_OutlaneLeftHard.collidable = False
			RubberOutlaneLeftHard.visible = False
			PinOutlaneLeftHard.visible = False
	End Select

	Select Case RightOutlaneDifficulty
		Case 0
			zCol_OutlaneRightEasy.collidable = True
			RubberOutlaneRightEasy.visible = True
			PinOutlaneRightEasy.visible = True
			zCol_OutlaneRightMedium.collidable = False
			RubberOutlaneRightMedium.visible = False
			PinOutlaneRightMedium.visible = False
			zCol_OutlaneRightHard.collidable = False
			RubberOutlaneRightHard.visible = False
			PinOutlaneRightHard.visible = False
		Case 1
			zCol_OutlaneRightEasy.collidable = False
			RubberOutlaneRightEasy.visible = False
			PinOutlaneRightEasy.visible = False
			zCol_OutlaneRightMedium.collidable = True
			RubberOutlaneRightMedium.visible = True
			PinOutlaneRightMedium.visible = True
			zCol_OutlaneRightHard.collidable = False
			RubberOutlaneRightHard.visible = False
			PinOutlaneRightHard.visible = False
		Case 2
			zCol_OutlaneRightEasy.collidable = False
			RubberOutlaneRightEasy.visible = False
			PinOutlaneRightEasy.visible = False
			zCol_OutlaneRightMedium.collidable = False
			RubberOutlaneRightMedium.visible = False
			PinOutlaneRightMedium.visible = False
			zCol_OutlaneRightHard.collidable = True
			RubberOutlaneRightHard.visible = True
			PinOutlaneRightHard.visible = True
		Case 3
			zCol_OutlaneRightEasy.collidable = False
			RubberOutlaneRightEasy.visible = False
			PinOutlaneRightEasy.visible = False
			zCol_OutlaneRightMedium.collidable = False
			RubberOutlaneRightMedium.visible = False
			PinOutlaneRightMedium.visible = False
			zCol_OutlaneRightHard.collidable = False
			RubberOutlaneRightHard.visible = False
			PinOutlaneRightHard.visible = False
	End Select
End Sub

'*******************************************
' ZTIL - Tilt handling
'*******************************************

Sub HandleTilt
	Dim i, oEvent

	If BIP < 1 Then Exit Sub
	nTiltLevel = nTiltLevel + 10
	If nTiltLevel > 15 Then
		nTiltWarnings = nTiltWarnings + 1
		Select Case nTiltWarnings
			Case 1
				Set oEvent = New EventItem
				oEvent.text = Array("DANGER!", "TILT WARNING")
				oEvent.priority = ePrioTiltWarning
				oEvent.duration = 7000
				oEvent.interruptOngoing = True
				oEvent.pupTrigger = 707: DOF 153, DOFPulse
				oEvent.lightshow = eLightShowStrobeShort
				oEventQueue.Add oEvent
'				DMDTimedText Array("DANGER!", "TILT WARNING"), 2000, Array("DANGER!", "TILT WARNING")
			Case 2
				Set oEvent = New EventItem
				oEvent.text = Array("DANGER! DANGER!", "LAST TILT WARNING")
				oEvent.priority = ePrioTiltWarning
				oEvent.duration = 6133
				oEvent.interruptOngoing = True
				oEvent.pupTrigger = 708: DOF 153, DOFPulse
				oEvent.lightshow = eLightShowStrobeShort
				oEventQueue.Add oEvent
'				DMDTimedText Array("DANGER! DANGER!", "LAST TILT WARNING"), 2000, ePrioTiltWarning
			Case 3
				bDrainingBalls = True
				nTimeBallSave = 0
				nTimeDelayVUK = 1
				nTimeDelayLowerScoop = 1

				' End Modes
				for i = eModeChapek to eModeSlurm
					If avModesRunning(nPlayer).Contains(i) Then
						EndMode i, True, False, eShotNone
					End If
				next
				if avModesRunning(nPlayer).Contains(eModeMultiball1) Then
					ModeMultiball1End
				end If
				if avModesRunning(nPlayer).Contains(eModeMultiball2) Then
					ModeMultiball2End
				end If
				if avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
					ModeMiniWizard1End True, False, eShotNone
				end If
				if avModesRunning(nPlayer).Contains(eModeImmolation) Then
					ModeMiniWizard2End True, False, eShotNone
				end If
				if avModesRunning(nPlayer).Contains(eModeSlurm) Then
					ModeSlurmEnd True, False, eShotNone
				end If

				StopAllMusic
				ClearEvents
				Set oEvent = New EventItem
				oEvent.text = "TILT"
				oEvent.priority = ePrioTilt
				oEvent.duration = 999999999
				oEvent.interruptOngoing = True
				oEvent.pupTrigger = 709: DOF 154, DOFPulse
				oEventQueue.Add oEvent
'				DMDTimedText "TILT", 999999999, ePrioTilt
				
				SpinHypnotoad False
				ToggleSolenoids False
				AllLightsOff
				UpdateLEDs -1
				LightSeqAttract.play SeqDownOff

				DOF 126,DOFPulse
				ToggleGI 0
		End Select
	End If
End Sub

Sub ToggleSolenoids (bEnabled)
	If bEnabled Then
		LeftSlingshot.disabled = False
		RightSlingshot.disabled = False
		Bumper1.HasHitEvent = True
		Bumper2.HasHitEvent = True
		Bumper3.HasHitEvent = True
	Else
		LeftSlingshot.disabled = True
		RightSlingshot.disabled = True
		Bumper1.HasHitEvent = False
		Bumper2.HasHitEvent = False
		Bumper3.HasHitEvent = False
        SolLFlipper False
        SolRFlipper False
        SolULFlipper False
        SolURFlipper False
	End If
End Sub

Sub TimerTilt_Timer
	TimerTilt.Enabled = True
	If nTiltLevel > 0 Then nTiltLevel = nTiltLevel - 1
End Sub

'*******************************************
'  Bumpers
'*******************************************
Sub Bumper1_Hit 
	DOF 105,DOFPulse
	RandomSoundBumperTop Bumper1
	FlBumperFadeTarget(1) = 1		'Flupper bumper demo
	Bumper1.timerenabled = True
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If avModesRunning(nPlayer).Contains(eModeSuperBumpers) Then
		Addscore SCORE_BUMPER_SUPER
	Else
		Addscore SCORE_BUMPER_UNLIT
	End If
	AnySwitchHit eSwitchLeftBumper
End Sub

Sub Bumper1_Timer
	FlBumperFadeTarget(1) = 0
End Sub

Sub Bumper2_Hit 
	DOF 106,DOFPulse
	RandomSoundBumperMiddle Bumper2
	FlBumperFadeTarget(2) = 1		'Flupper bumper demo
	Bumper2.timerenabled = True
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If avModesRunning(nPlayer).Contains(eModeSuperBumpers) Then
		Addscore SCORE_BUMPER_SUPER
	Else
		Addscore SCORE_BUMPER_UNLIT
	End If
	AnySwitchHit eSwitchRightBumper
End Sub

Sub Bumper2_Timer
	FlBumperFadeTarget(2) = 0
End Sub

Sub Bumper3_Hit 
	DOF 107,DOFPulse
	RandomSoundBumperBottom Bumper3
	FlBumperFadeTarget(3) = 1		'Flupper bumper demo
	Bumper3.timerenabled = True
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If avModesRunning(nPlayer).Contains(eModeSuperBumpers) Then
		Addscore SCORE_BUMPER_SUPER
	Else
		Addscore SCORE_BUMPER_UNLIT
	End If
	AnySwitchHit eSwitchMiddleBumper
End Sub

Sub Bumper3_Timer
	FlBumperFadeTarget(3) = 0
End Sub

'****************************************************************
'  GI
'****************************************************************
dim gilvl:gilvl = 1		'General Illumination light state tracked for Dynamic Ball Shadows
Sub ToggleGI(Enabled)
	dim xx
	If enabled Then
		for each xx in GI:xx.state = 1:Next
		gilvl = 1
		DOF 151,DOFOn
	Else
		for each xx in GI:xx.state = 0:Next	
		GITimer.enabled = True
		gilvl = 0
		DOF 151,DOFOff
	End If
	Sound_GI_Relay enabled, bumper1
End Sub

Sub GITimer_Timer()
	me.enabled = False
	ToggleGI 1
End Sub


'****************************************************************
'  Slingshots
'****************************************************************

' RStep and LStep are the variables that increment the animation
Dim RStep, LStep

Sub RightSlingShot_Slingshot
	DOF 104,DOFPulse
	RS.VelocityCorrect(ActiveBall)
	If Not bDrainingBalls And (nPlayersInGame > 0) Then
		Addscore SCORE_SLINGHOT
		AnySwitchHit eSwitchRightSlingShot
	End If
	RSling1.Visible = 1
	Sling1.TransY = -20			'Sling Metal Bracket
	RStep = 0
	RightSlingShot.TimerEnabled = 1
	RightSlingShot.TimerInterval = 10
	'	vpmTimer.PulseSw 52			'Slingshot Rom Switch
	RandomSoundSlingshotRight Sling1
End Sub

Sub RightSlingShot_Timer
	Select Case RStep
		Case 3:RSLing1.Visible = 0:RSLing2.Visible = 1:Sling1.TransY = -10
		Case 4:RSLing2.Visible = 0:Sling1.TransY = 0:RightSlingShot.TimerEnabled = 0
	End Select
	RStep = RStep + 1
End Sub

Sub LeftSlingShot_Slingshot
	DOF 103,DOFPulse
	LS.VelocityCorrect(ActiveBall)
	If Not bDrainingBalls And (nPlayersInGame > 0) Then
		Addscore SCORE_SLINGHOT
		AnySwitchHit eSwitchLeftSlingShot
	End If
	LSling1.Visible = 1
	Sling2.TransY = -20			'Sling Metal Bracket
	LStep = 0
	LeftSlingShot.TimerEnabled = 1
	LeftSlingShot.TimerInterval = 10
	'	vpmTimer.PulseSw 51			'Slingshot Rom Switch
	RandomSoundSlingshotLeft Sling2
End Sub

Sub LeftSlingShot_Timer
	Select Case LStep
		Case 3:LSLing1.Visible = 0:LSLing2.Visible = 1:Sling2.TransY = -10
		Case 4:LSLing2.Visible = 0:Sling2.TransY = 0:LeftSlingShot.TimerEnabled = 0
	End Select
	LStep = LStep + 1
End Sub

'*******************************************
'  Kickers, Saucers
'*******************************************

'To include some randomness in the Kicker's kick, use the following parmeters
Const KickerAngleTol = 2   		'Number of degrees the kicker angle varies around its intended direction
Const KickerStrengthTol = 1   	'Number of strength units the kicker varies around its intended strength

Sub Kicker001_Hit
'	SoundSaucerLock
	AnySwitchHit eSwitchUpperScoop
	ShotHit eShotUpperScoop
	bBallHeld = True
	Kicker001.timerenabled=True
End Sub

Sub Kicker001_Timer
	Dim oEvent

	' Kick out ball
	If nTimeDelayVUK > 0 Then
		nTimeDelayVUK = nTimeDelayVUK - Kicker001.TimerInterval
		If nTimeDelayVUK <= 0 then
			If 0 = oEventQueue.Size Then
				nTimeDelayVUK = 0
			Else
				Set oEvent = oEventQueue.Peek
				If eShotUpperScoop = oEvent.holdBallAt Then
					' extend delay until the next event in the queue is handled
					nTimeDelayVUK = 1
				Elseif Not (oCurrentEvent is Nothing) Then
					If eShotLowerScoop = oCurrentEvent.holdBallAt Then
						nTimeDelayVUK = 1
					Else
						nTimeDelayVUK = 0
					End If
				Else
					nTimeDelayVUK = 0
				End If
			End If
		End If
	Else
		bBallHeld = False
		DOF 110,DOFPulse
		SoundSaucerKick 1, Kicker001
		Kicker001.Kick 0, 40, 1.56
		nTimeVUKFired = GameTime
		Kicker001.timerenabled=False
		If anMBall1Locks(nPlayer) >= 3 Then
			ModeMultiball1Init
		End If
	End If
End Sub

Sub KickerLeft_Hit
	If Not bDrainingBalls And (nPlayersInGame > 0) Then ShotHit eShotLowerScoop
	SoundSaucerLock
	AnySwitchHit eSwitchLowerScoop
	bBallHeld = True
	bBallinLowerScoop = True
	KickerLeft.timerenabled=True
End Sub

Sub KickerLeft_Timer
	Dim oEvent
	if nTimeDelayLowerScoop > 0 Then
		nTimeDelayLowerScoop = nTimeDelayLowerScoop - KickerLeft.TimerInterval
		If nTimeDelayLowerScoop <= 0 Then
			If 0 = oEventQueue.Size Then
				nTimeDelayLowerScoop = 0
			Else
				Set oEvent = oEventQueue.Peek
				If "modeselect" = oEvent.special or eShotLowerScoop = oEvent.holdBallAt Then
					' extend delay until the next event in the queue is handled
					nTimeDelayLowerScoop = 1
				Elseif Not (oCurrentEvent is Nothing) Then
					If eShotLowerScoop = oCurrentEvent.holdBallAt Then
						nTimeDelayLowerScoop = 1
					Else
						nTimeDelayLowerScoop = 0
					End If
				Else
					nTimeDelayLowerScoop = 0
				End If
			End If
		End If
	Else
		' Kick out ball
		SoundSaucerKick 1, KickerLeft
		DOF 110,DOFPulse
		If TimerKickoutWarning.Enabled Then
			TimerKickoutWarning.Enabled = False
			Lampz.SetLamp eLightCollectCombo, LightStateOff
			Lampz.SetLamp eLightExtraBall, LightStateOff
			Lampz.SetLamp eLightSelectMode, LightStateOff
			Lampz.SetLamp eLightMystery, LightStateOff
		End If
		If eModeNone <> nModePending Then
			StartMode nModePending
			nModePending = eModeNone
		End If
		If bMusicAfterKick Then
			PlayModeMusic
			bMusicAfterKick = False
		End If
		bBallinLowerScoop = False
		KickerLeft.KickZ 167+RndNum(-KickerAngleTol,KickerAngleTol), 25+RndNum(-KickerStrengthTol,KickerStrengthTol), 0, 80
		bBallHeld = False
		KickerLeft.timerenabled=False
	End If
End Sub

Sub KickerAutoPlunge_hit
	KickerAutoPlunge.timerenabled=True
End Sub

Sub KickerAutoPlunge_Timer
	' Kick out ball
	DOF 111,DOFPulse
	SoundSaucerKick 1, KickerAutoPlunge
	KickerAutoPlunge.Kick 0, 45+RndNum(-KickerStrengthTol,KickerStrengthTol)
	KickerAutoPlunge.timerenabled=False
End Sub

Sub KickerBooth_Hit
	Dim oEvent

	SoundSaucerLock
	If abBoothReady(nPlayer) And 1 = BIP Then
		If nTimeBallSave < 1 Then
			ClearEvents
			Set oEvent = new EventItem
			oEvent.priority = ePrioMysteryLit
			oEvent.pupTrigger = RoundRobinEvent("BoothEnter")
			oEvent.duration = RoundRobinLength("BoothEnter")
			oEventQueue.Add oEvent
			DMDBoothInit
		Else
			bBoothSaved = True
			fBoothTargetAngle = 190
			KickerBooth.TimerEnabled = True
			nBoothOption = 0
			bBallHeld = True	
		End If
	Else
		fBoothTargetAngle = 315
		bBoothSaved = False
		KickerBooth.TimerEnabled = True
		bBallHeld = True
	End If
	BoothOpenDoors
End Sub

Sub KickerBooth_Timer
	Dim oEvent

	If nTimeDelayBooth > 0 Then
		nTimeDelayBooth = nTimeDelayBooth - KickerBooth.TimerInterval
		If nTimeDelayBooth <= 0 Then
			nTimeDelayBooth = 0
			KickerBooth.TimerEnabled = False
			KickerBooth.Kick 225, 7
			vpmTimer.AddTimer 750, "BoothCloseDoors '"
			fBoothTargetAngle = 270
		End If
		Exit Sub
	Else
		KickerBooth.TimerEnabled = False
	End If
	If bInMode Then
		sDMDScene = "modeinfo"
	Else
		sDMDScene = "scoreboard"
	End If
	If avBoothOptionsUsed(nPlayer).Count > 2 Then
		abBoothReady(nPlayer) = False
		cLightSuicideBooth.state = LightStateOff
	Else
		abBoothReady(nPlayer) = True
		cLightSuicideBooth.state = LightStateOn
	End If
	Set oEvent = new EventItem
	If bBoothSaved Then
		If 1 = nBoothOption Then
			oEvent.text = Array("BALL SAVED", "SUICIDE BOOTH", "SPIN HYPNOTOAD")
		Elseif 3 = nBoothOption Then
			oEvent.text = Array("BALL SAVED", "SUICIDE BOOTH", "0.5 X PLAYFIELD")
		Elseif 5 = nBoothOption Then
			oEvent.text = Array("BALL SAVED", "SUICIDE BOOTH", "REVERSE FLIPPERS")
		Else
			oEvent.text = Array("BALL SAVED", "SUICIDE BOOTH", "MALFUNCTION")
		End If
		oEvent.priority = ePrioBallSave
		oEvent.pupTrigger = RoundRobinEvent("BoothSave")
		oEvent.duration = RoundRobinLength("BoothSave")
		oEvent.interruptOngoing = True
		oEventQueue.Add oEvent
		SoundSaucerKick 1, KickerBooth
		KickerBooth.Kick 100, 7
		KickerAutoPlunge.Enabled = True
		vpmTimer.AddTimer 750, "BoothCloseDoors '"
		fBoothTargetAngle = 270
	Else
		bBallHeld = False
		If 1 = BIP Then
			nTimeDelayBooth = 2500
			KickerBooth.TimerEnabled = True
			Set oEvent = New EventItem
			oEvent.text = Array("SUICIDE BOOTH", "BALL LOST")
			oEvent.priority = ePrioBallSave
			oEvent.pupTrigger = 711
			oEvent.duration = 4467
			oEvent.interruptOngoing = True
			oEventQueue.Add oEvent
		Else
			KickerBooth.Kick 225, 7
			vpmTimer.AddTimer 750, "BoothCloseDoors '"
			fBoothTargetAngle = 270
		End If
	End If
End Sub

Sub BoothAnimate
	Dim dAngle

	If cabinetsuicide001.RotY < fBoothTargetAngle Then
		dAngle = (cabinetsuicide001.RotY + (nBoothRotateSpeed * dRpmToDegPerMs * FrameTime))
		If dAngle > fBoothTargetAngle Then dAngle = fBoothTargetAngle
		cabinetsuicide001.RotY = dAngle
		cabinetsign001.RotY = dAngle
		cabinetleftdoor001.RotY = dAngle
		cabinetrightdoor001.RotY = dAngle
	Elseif cabinetsuicide001.RotY > fBoothTargetAngle Then
		dAngle = (cabinetsuicide001.RotY - (nBoothRotateSpeed * dRpmToDegPerMs * FrameTime))
		If dAngle < fBoothTargetAngle Then dAngle = fBoothTargetAngle
		cabinetsuicide001.RotY = dAngle
		cabinetsign001.RotY = dAngle
		cabinetleftdoor001.RotY = dAngle
		cabinetrightdoor001.RotY = dAngle
	End If
End Sub

Sub BoothOpenDoors
	cabinetleftdoor001.visible = False
	cabinetrightdoor001.visible = False
End Sub

Sub BoothCloseDoors
	cabinetleftdoor001.visible = True
	cabinetrightdoor001.visible = True
End Sub

Sub UpdateBeerBottles
	beerdt1.RotX = sw1p.RotX + 90
	beerdt1.RotZ = sw1p.RotY
	beerdt1.TransY = sw1p.TransZ
	beerdt2.RotX = sw2p.RotX + 90
	beerdt2.RotZ = sw2p.RotY
	beerdt2.TransY = sw2p.TransZ
	beerdt3.RotX = sw3p.RotX + 90
	beerdt3.RotZ = sw3p.RotY
	beerdt3.TransY = sw3p.TransZ
End Sub
'*******************************************
'  Triggers
'*******************************************

Sub Trigger1_Hit
	BIPL = True
	DOF 121,DOFOn
End Sub

Sub Trigger1_UnHit
	BIPL = False
	DOF 121,DOFOff
	DOF 122,DOFPulse
End Sub

Sub Spinner_Spin
	DOF 123,DOFPulse
	SoundSpinner Spinner
	If Not bDrainingBalls And (nPlayersInGame > 0) Then
		If avModesRunning(nPlayer).Contains(eModeSuperSpinners) Then
			Addscore SCORE_SPINNER_SUPER
		Else
			Addscore SCORE_SPINNER_UNLIT
		End If
		AnySwitchHit eSwitchUpperSpinner
		If bSkillShotActive Then
			If anSwitchLastHit(eSwitchSideLoop) > anSwitchLastHit(eSwitchCenterLane) Then
				SkillShotAward eSkillLaneFromLeft
			Else
				SkillShotAward eSkillLaneFromPlunge
			End If
		End If
	End If
End Sub

Sub Spinner2_Spin
	DOF 124,DOFPulse
	SoundSpinner Spinner2
	If Not bDrainingBalls And (nPlayersInGame > 0) Then
		If avModesRunning(nPlayer).Contains(eModeSuperSpinners) Then
			Addscore SCORE_SPINNER_SUPER
		Else
			Addscore SCORE_SPINNER_UNLIT
		End If
		If bSkillShotActive Then
			SkillShotAward eSkillSideSpinner
		End If
		AnySwitchHit eSwitchSideSpinner
		fPlayfieldX = Round(fPlayfieldX + 0.1, 1)
		If fPlayfieldX > 5.01 Then fPlayfieldX = 5
		If nTimeXPause < nXPauseStart Then nTimeXPause = nXPauseStart
		nTimeXCountdown = 0
		UpdateLEDs fPlayfieldX
	End If
End Sub

Sub Spinner3_Spin
	Dim i
	DOF 125,DOFPulse
	SoundSpinner Spinner3
	If Not bDrainingBalls And (nPlayersInGame > 0) Then
		nTimeXPause = nTimeXPause + nXPauseAdd
		For Each i in anAddTimeModes
			if avModesRunning(nPlayer).Contains(i) then
				aanModeTime(nPlayer, i) = aanModeTime(nPlayer, i) + nModeAdd
			end if
		Next
		If avModesRunning(nPlayer).Contains(eModeSuperSpinners) Then
			Addscore SCORE_SPINNER_SUPER
		Else
			Addscore SCORE_SPINNER_UNLIT
		End If
		AnySwitchHit eSwitchLeftSpinner
	End If
End Sub

Sub LeftOutlane_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchLeftOutlane) > nDebounceTime Then
		anSwitchLastHit(eSwitchLeftOutlane) = GameTime
		Addscore SCORE_LOWER_LANES
		AnySwitchHit eSwitchLeftOutlane
		avBeerLanes(nPlayer).Add 0
		UpdateBeer
		If nTimeBallSave > 0 and BIP < 2 and (not (bOutlaneSave or bDrainingBalls)) Then
			OutlaneSave
		End If
	End If
End Sub

Sub LeftInlane_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchLeftInlane) > nDebounceTime Then
		leftInlaneSpeedLimit
		anSwitchLastHit(eSwitchLeftInlane) = GameTime
		Addscore SCORE_LOWER_LANES
		AnySwitchHit eSwitchLeftInlane
		avBeerLanes(nPlayer).Add 1
		UpdateBeer
	End If
End Sub

Sub RightInlane_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchRightInlane) > nDebounceTime Then
		rightInlaneSpeedLimit
		anSwitchLastHit(eSwitchRightOutlane) = GameTime
		Addscore SCORE_LOWER_LANES
		AnySwitchHit eSwitchRightinlane
		avBeerLanes(nPlayer).Add 2
		UpdateBeer
	End If
End Sub

Sub RightOutlane_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchRightOutlane) > nDebounceTime Then
		anSwitchLastHit(eSwitchRightOutlane) = GameTime
		Addscore SCORE_LOWER_LANES
		AnySwitchHit eSwitchRightOutlane
		avBeerLanes(nPlayer).Add 3
		UpdateBeer
		' Suicide booth handles ball save
	End If
End Sub

Sub OutlaneSave
	Dim oEvent

	nBallsToFeed = nBallsToFeed + 1
	UpdateTrough
	KickerAutoPlunge.Enabled = True
	bOutlaneSave = True
	If nExtraBalls > 0 Then
		cLightShootAgain.state = LightStateOn
	Else
		cLightShootAgain.state = LightStateOff
	End If
	nTimeBallSave = 0
	Set oEvent = New EventItem
	oEvent.text = Array("BALL SAVED")
	oEvent.pupTrigger = RoundRobinEvent("BallSaved"): DOF 127, DOFPulse
	oEvent.duration = RoundRobinLength("BallSaved")
	oEvent.interruptOngoing = True
	oEventQueue.Add oEvent
End Sub

Sub TriggerLeftLoop_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchLeftLoop) > nDebounceTime Then
		anSwitchLastHit(eSwitchLeftLoop) = GameTime
		Addscore 10000
		AnySwitchHit eSwitchLeftLoop
	End If
End Sub

Sub TriggerLoopSide_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchSideLoop) > nDebounceTime Then
		anSwitchLastHit(eSwitchSideLoop) = GameTime
		Addscore 10000
		AnySwitchHit eSwitchSideLoop
	End If
End Sub

Sub TriggerRightLoopEnter_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchRightLoopEnter) > nDebounceTime Then
		anSwitchLastHit(eSwitchRightLoopEnter) = GameTime
		Addscore 10000
		AnySwitchHit eSwitchRightLoopEnter
	End If
End Sub

Sub TriggerLoopUpper_Hit
	Dim nLastLoopSwitch
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchUpperLoop) > nDebounceTime Then
		anSwitchLastHit(eSwitchUpperLoop) = GameTime
		Addscore 10000
		AnySwitchHit eSwitchUpperLoop

		nLastLoopSwitch = eSwitchLeftLoop
		If anSwitchLastHit(eSwitchSideLoop) > anSwitchLastHit(nLastLoopSwitch) Then
			nLastLoopSwitch = eSwitchSideLoop
		End If
		If anSwitchLastHit(eSwitchRightLoopEnter) > anSwitchLastHit(nLastLoopSwitch) Then
			nLastLoopSwitch = eSwitchRightLoopEnter
		End If
		If anSwitchLastHit(nLastLoopSwitch) > 0 _
		And (GameTime - anSwitchLastHit(nLastLoopSwitch) < 1500) Then
			anSwitchLastHit(nLastLoopSwitch) = 0
			Select Case nLastLoopSwitch
				Case eSwitchLeftLoop
					ShotHit eShotLeftLoop
				Case eSwitchSideLoop
					ShotHit eShotSideLoop
				Case eSwitchRightLoopEnter
					ShotHit eShotRightLoop
			End Select
		End If
	End If
End Sub

Sub TriggerLoopCenter_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchCenterLane) > nDebounceTime Then
		anSwitchLastHit(eSwitchCenterLane) = GameTime
		Addscore 10000
		AnySwitchHit eSwitchCenterLane
	End If
End Sub

Sub TriggerLoopRight_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchRightLoop) > nDebounceTime Then
		anSwitchLastHit(eSwitchRightLoop) = GameTime
		Addscore 10000
		AnySwitchHit eSwitchRightLoop
		If anSwitchLastHit(eSwitchCenterLane) > 0 _
		and GameTime - anSwitchLastHit(eSwitchCenterLane) < 1000 Then
			ShotHit eShotCenterLane
			anSwitchLastHit(eSwitchCenterLane) = 0
		End If
	End If
End Sub

Sub TriggerInlineEntry_Hit
End Sub

Sub TriggerScoopDrop_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchUpperScoop) > nDebounceTime Then
		RandomSoundBallBouncePlayfieldHard ActiveBall
		anSwitchLastHit(eSwitchUpperScoop) = GameTime
	End If
End Sub

'*******************************************
'  Ramp Triggers
'*******************************************
Sub ramptrigger01_hit()
	WireRampOn True 'Play Plastic Ramp Sound
End Sub

Sub ramptrigger02_hit()
	WireRampOff ' Turn off the Plastic Ramp Sound
End Sub

Sub ramptrigger03_hit()
	WireRampOn True ' Play Plastic Ramp Sound
End Sub

Sub ramptrigger04_hit()
	WireRampOff ' Turn off the Plastic Ramp Sound
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchLeftRamp) > nDebounceTime Then
		anSwitchLastHit(eSwitchLeftRamp) = GameTime
		AnySwitchHit eSwitchLeftRamp
		ShotHit eShotLeftRamp
	End If
End Sub

Sub ramptrigger04_unhit()
	WireRampOn False ' On Wire Ramp Pay Wire Ramp Sound
End Sub

Sub ramptrigger05_Hit()
	If GameTime - nTimeVUKFired < 1000 Then
		nTimeVUKFired = 0
		WireRampOn False ' Ball entered left ramp wire from the VUK
	End If
End Sub

Sub TriggerRightRamp_Hit
	If bDrainingBalls Or (nPlayersInGame < 1) Then Exit Sub
	If GameTime - anSwitchLastHit(eSwitchRightRamp) > nDebounceTime Then
		anSwitchLastHit(eSwitchRightRamp) = GameTime
		AnySwitchHit eSwitchRightRamp
		ShotHit eShotRightRamp
		' Speed ball up
		If ActiveBall.VelX > -35 Then ActiveBall.VelX = -40
	End If
End Sub

Sub LeftRampDrop_hit()
	WireRampOff
End Sub

'********************************************
'  Targets
'********************************************

Sub sw12_Hit
	STHit 12
End Sub

Sub sw12o_Hit
	TargetBouncer Activeball, 1
End Sub

Sub sw13_Hit
	Set oLastBallInInlines = ActiveBall
	STHit 13
End Sub

Sub sw13o_Hit
	TargetBouncer Activeball, 1
End Sub

Sub LRRRWallLeft_Hit
	ShotHit eShotLRRRLeft
End Sub

Sub LRRRWallRightUp_Hit
	ShotHit eShotLRRRRight
End Sub


'********************************************
'  Drop Target Controls
'********************************************

Sub sw7_Hit
	DTHit 1
End Sub

Sub sw8_Hit
	DTHit 2
End Sub

Sub sw9_Hit
	DTHit 3
End Sub

Sub sw10_Hit
	DTHit 4
End Sub

Sub drop11_Hit
	DTHit 5
End Sub

Sub sw1_Hit
	Dim oCaptive
	' Discard hits from behind, except in multiball
	If Activeball.velY < 0 And (Not avModesRunning(nPlayer).Contains(eModeMultiball2)) then
		exit sub
	End If
	If Not aoBenderLockedBalls(0) Is Nothing Then
		Set oCaptive = aoBenderLockedBalls(0)
		oCaptive.VelX = ActiveBall.VelX
		oCaptive.VelY = ActiveBall.VelY
	End If
	If nPlayersInGame > 0 and (Not bDrainingBalls) Then
		AnySwitchHit eSwitchInlineLower
		If eSwitchInlineLower = ExpectedInlineSwitch Then
			If anComboTimer(eShotInlineDrops) > 0 Then AwardCombo eShotInlineDrops
		End If
		If avModesRunning(nPlayer).Contains(eModeMultiball2) Then
			DTHit 6
		Elseif CanAdvanceMultiballs Then
			AdvanceMball2 eSwitchInlineLower, activeBall
		End If
	End If
End Sub

Sub sw2_Hit
	Dim oCaptive
	' Discard hits from behind, except in multiball
	If Activeball.velY < 0 And (Not avModesRunning(nPlayer).Contains(eModeMultiball2)) then
		exit sub
	End If
	If Not aoBenderLockedBalls(1) Is Nothing Then
		Set oCaptive = aoBenderLockedBalls(1)
		oCaptive.VelX = ActiveBall.VelX
		oCaptive.VelY = ActiveBall.VelY
	End If
	If nPlayersInGame > 0 and (Not bDrainingBalls) Then
		AnySwitchHit eSwitchInlineMiddle
		If eSwitchInlineMiddle = ExpectedInlineSwitch Then
			If anComboTimer(eShotInlineDrops) > 0 Then AwardCombo eShotInlineDrops
		End If
		If avModesRunning(nPlayer).Contains(eModeMultiball2) Then
			DTHit 7
		Elseif CanAdvanceMultiballs Then
			AdvanceMball2 eSwitchInlineMiddle, activeBall
		End If
	End If
End Sub

Sub sw3_Hit
	Dim oCaptive
	' Discard hits from behind, except in multiball
	If Activeball.velY < 0 And (Not avModesRunning(nPlayer).Contains(eModeMultiball2)) then
		exit sub
	End If
	If Not aoBenderLockedBalls(2) Is Nothing Then
		Set oCaptive = aoBenderLockedBalls(2)
		oCaptive.VelX = ActiveBall.VelX
		oCaptive.VelY = ActiveBall.VelY
	End If
	If nPlayersInGame > 0 and (Not bDrainingBalls) Then
		AnySwitchHit eSwitchInlineUpper
		If eSwitchInlineUpper = ExpectedInlineSwitch Then
			If anComboTimer(eShotInlineDrops) > 0 Then AwardCombo eShotInlineDrops
		End If
		If avModesRunning(nPlayer).Contains(eModeMultiball2) Then
			DTHit 8
		Elseif CanAdvanceMultiballs Then
			AdvanceMball2 eSwitchInlineUpper, activeBall
		End If
	End If
End Sub

' If the drop targets can be reset individually, use specific solenoid subs for each like below
' These subroutines would be called by the solenoid callbacks if using a ROM

' Drop Target 6 Solenoid (lower inline target)
Sub SolDT6(enabled)
	If enabled Then
		RandomSoundDropTargetReset sw1p
		DTRaise 6
		DOF 109,DOFPulse
	End If
End Sub

' Drop Target 7 Solenoid (middle inline target)
Sub SolDT7(enabled)
	If enabled Then
		RandomSoundDropTargetReset sw2p
		DTRaise 7
		DOF 109,DOFPulse
	End If
End Sub

' Drop Target 8 Solenoid (upper inline target)
Sub SolDT8(enabled)
	If enabled Then
		RandomSoundDropTargetReset sw3p
		DTRaise 8
		DOF 109,DOFPulse
	End If
End Sub

' If a whole bank of drop targets can be reset at once, use sub like below

Sub SolDTBank1to5(enabled)
	dim xx
	if enabled then
		DOF 108,DOFPulse
		RandomSoundDropTargetReset sw9p
		for xx = 1 to 5
			DTRaise xx
		Next
	end if
End Sub

Sub TimerResetInlines_Timer
	TimerResetInlines.Enabled = False
	SolDTBankInline True
End Sub

Sub SolDTBankInline(enabled)
	dim xx
	DOF 109,DOFPulse
	if enabled then
		RandomSoundDropTargetReset sw2p
		for xx = 6 to 8
			DTRaise xx
		Next
	end if
End Sub

'*******************************************
'  Other Solenoids
'*******************************************

' Knocker (this sub mimics how you would handle kicker in ROM based tables)
' For this to work, you must create a primite on the table named KnockerPosition
' SolCallback(XX) = "SolKnocker"  'In ROM based tables, change the solenoid number XX to the correct number for your table.
Sub SolKnocker(Enabled)
	If enabled Then
		KnockerSolenoid 'Add knocker position object
	End If
End Sub

'*******************************************
'  ZMOD - Game logic: modes
'*******************************************

Sub BlastButtonUsed
	Dim anShotTotal(11)
	Dim nBiggestShot, nBiggestValue, i, sPoints, oEvent

	If GameTime - nTimeBlastUsed < 50 Then
		Exit Sub
	Else
		nTimeBlastUsed = GameTime
	End If
	If (nPlayersInGame < 1) Or bDrainingBalls Or bCountingBonus Then Exit Sub

	If 0 = anBlasts(nPlayer) Or avModesRunning(nPlayer).count < 1 Then
		SoundStartButton
		Exit Sub
	Else
		anBlasts(nPlayer) = anBlasts(nPlayer) - 1
		DMDUpdateBlasts
	End If

	For i = 0 to 11 : anShotTotal(i) = anShotUnlitValue(i) : Next
	For i = 0 to 11 
		If avModesRunning(nPlayer).Contains(eModeOmicron) Then
			anShotTotal(i) = anShotTotal(i) + ModeOmicronGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeMars) Then
			anShotTotal(i) = anShotTotal(i) + ModeMarsGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeDaily) Then
			anShotTotal(i) = anShotTotal(i) + ModeDailyGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeMoon) Then
			anShotTotal(i) = anShotTotal(i) + ModeMoonGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeChapek) Then
			anShotTotal(i) = anShotTotal(i) + ModeChapekGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeEarth) Then
			anShotTotal(i) = anShotTotal(i) + ModeEarthGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeAmazonia) Then
			anShotTotal(i) = anShotTotal(i) + ModeAmazoniaGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeOsiris) Then
			anShotTotal(i) = anShotTotal(i) + ModeOsirisGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeDecapod) Then
			anShotTotal(i) = anShotTotal(i) + ModeDecapodGetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeMultiball1) Then
			anShotTotal(i) = anShotTotal(i) + ModeMultiball1GetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeMultiball2) Then
			anShotTotal(i) = anShotTotal(i) + ModeMultiball2GetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeImmolation) Then
			anShotTotal(i) = anShotTotal(i) + ModeMiniWizard2GetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
			anShotTotal(i) = anShotTotal(i) + ModeMiniWizard1GetScore(i)
		End If
		If avModesRunning(nPlayer).Contains(eModeSlurm) Then
			anShotTotal(i) = anShotTotal(i) + ModeSlurmGetScore(i)
		End If
		If anComboTimer(i) > 0 Then
			anShotTotal(i) = anShotTotal(i) + SCORE_COMBO
		End If
	next

	nBiggestValue = 0
	nBiggestShot = eShotLeftLane
	for i = 0 to 11
		If anShotTotal(i) > nBiggestValue Then
			nBiggestValue = anShotTotal(i)
			nBiggestShot = i
		End If
	next

	sPoints = FormatScore(nBiggestValue * fPlayfieldX)

	Set oEvent = New EventItem
	oEvent.text = Array(sPoints, asShotNames(nBiggestShot) & " BLASTED!")
	oEvent.priority = ePrioBlast
	oEvent.interruptOngoing = True
	oEvent.pupTrigger = RoundRobinEvent("BlastUsed"): DOF 130, DOFPulse
	oEvent.duration = RoundRobinLength("BlastUsed")
	oEvent.lightshow = eLightShowCircleLong
	oEventQueue.Add oEvent
'	DMDTimedText Array(sPoints, asShotNames(nBiggestShot) & " BLASTED!"), 3000, ePrioSuperJackpot
	Addscore anShotUnlitValue(nBiggestShot)
	If anComboTimer(nBiggestShot) > 0 Then
		AwardCombo nBiggestShot
	End If
	for i = 0 to 18
		if avModesRunning(nPlayer).Contains(i) Then
			UpdateMode i, nBiggestShot, eSwitchNone, True
		End If
	Next
End Sub

Sub AnySwitchHit(nSwitch)
	Dim i, bIgnore, nAward
	bBallHeld = False
	nTimeAnySwitch = GameTime
	If Not bFirstSwitchHit Then
		bFirstSwitchHit = True
		nTimeBallSave = nBallSaveNewBall
	End If
	' frenzy
	If avModesRunning(nPlayer).Contains(eModeFrenzy) Then
		Addscore SCORE_FRENZY
	End If

	' Reset inline drops, but try not to do so if the ball is in the inline drop lane
	If bMball2Ended And (eSwitchInlineUpper <> nSwitch) And (eSwitchInlineMiddle <> nSwitch) _
	And (eSwitchInlineLower <> nSwitch) And (eSwitchInlineEnd <> nSwitch) Then
		bMball2Ended = False
		SolDTBankInline True
	End if
	' Update modes with inline drops
	If (eSwitchInlineUpper = nSwitch) or (eSwitchInlineMiddle = nSwitch) _
	or (eSwitchInlineLower = nSwitch) or (eSwitchInlineEnd = nSwitch) Then
		If ExpectedInlineSwitch = nSwitch Then
			for i = 0 to 18
				if avModesRunning(nPlayer).Contains(i) Then
					aanShotLastHit(nPlayer, eShotInlineDrops) = GameTime
					UpdateMode i, eShotInlineDrops, nSwitch, False
				End If
			Next
		End If
	End If
	' Update modes with left lane
	If eSwitchLeftSpinner = nSwitch Then
		for i = 0 to 18
			if avModesRunning(nPlayer).Contains(i) Then
				UpdateMode i, eShotLeftLane, eSwitchNone, False
			End If
		Next
	End If
	' Update Osiris 4 (uses upper spinner)
	If eSwitchUpperSpinner = nSwitch Then
		if avModesRunning(nPlayer).Contains(eModeOsiris) Then
			UpdateMode eModeOsiris, eShotNone, eSwitchUpperSpinner, False
		End If
	End If

	' Update skill shot
	If bSkillShotActive Then
		bIgnore = False
		For Each i In anSkillShotSwitches
			If i = nSwitch Then
				bIgnore = True
				Exit For
			End If
		Next
		If Not bIgnore Then SkillShotEnd
	End If

	' Bonus
	Select Case nSwitch
		Case eSwitchLeftSpinner, eSwitchUpperSpinner, eSwitchSideSpinner
			nBonusTotal = nBonusTotal + BONUS_SPINNER
		Case eSwitchLeftBumper, eSwitchMiddleBumper, eSwitchRightBumper
			nBonusTotal = nBonusTotal + BONUS_BUMPER
		Case eSwitchInlineLower, eSwitchInlineMiddle, eSwitchInlineUpper, _
		eSwitchInlineEnd, eSwitchDropB, eSwitchDropL, eSwitchDropA, _
		eSwitchDropS, eSwitchDropT
			nBonusTotal = nBonusTotal + BONUS_TARGET
		Case eSwitchLeftSlingShot, eSwitchRightSlingshot
			nBonusTotal = nBonusTotal + BONUS_SLINGHOT
		Case Else
			nBonusTotal = nBonusTotal + BONUS_ROLLOVER
	End Select
End Sub

Sub ShotHit(nShot)
	Dim i, nAward, nModesPlayed, oEvent
	
	aanShotLastHit(nPlayer, nShot) = GameTime
	
	If avModesRunning(nPlayer).Contains(eModeSuperRamps) _
	And ((eShotLeftRamp = nShot) Or (eShotRightRamp = nShot)) Then
		Addscore SCORE_SUPER_RAMPS
	Elseif avModesRunning(nPlayer).Contains(eModeSuperLoops) _
	And ((eShotLeftLoop = nShot) Or (eShotSideLoop = nShot) _
	Or (eShotCenterLane = nShot) Or (eShotRightLoop = nShot)) Then
		Addscore SCORE_SUPER_LOOPS
	Else
		Addscore anShotUnlitValue(nShot)
	End If

	If CanAdvanceMultiballs Then
		If (nShot = eShotUpperScoop) And (Not abMball1LoopLeft(nPlayer)) _
		And (Not abMball1LoopRight(nPlayer)) Then
			ModeMultiball1Advance nShot
		Elseif abMball1LoopLeft(nPlayer) and (eShotLeftLoop = nShot) Then
			ModeMultiball1Advance nShot
		Elseif abMball1LoopRight(nPlayer) and (eShotRightLoop = nShot) Then
			ModeMultiball1Advance nShot
		End If
	End If

	If bSkillShotActive Then
		Select Case nShot
			Case eShotSideLoop
				SkillShotAward eSkillSideLoop
			Case eShotUpperScoop
				If GameTime - anSwitchLastHit(eSwitchUpperLoop) > 2000 Then
					SkillShotAward eSkillScoopFromLeft
				Else
					SkillShotAward eSkillScoopFromRight
				End If
			Case eShotLeftRamp
				SkillShotAward eSkillLeftRamp
			Case Else
				SkillShotEnd
		End Select
	End If

	for i = 0 to 18
		if avModesRunning(nPlayer).Contains(i) Then UpdateMode i, nShot, eSwitchNone, False
	Next

	If (eShotLowerScoop = nShot) And (anCombos(nPlayer) >= anComboLastCollect(nPlayer) + 5) Then
		AwardSuperFeature False
	End If

	If anComboTimer(nShot) > 0 Then AwardCombo nShot
	StartCombo nShot

	If (anMysteryShotsMade(nPlayer) >= 3) And (eShotLowerScoop = nShot) Then
		nAward = SelectMystery
		DisplayMysteryInit nAward
		nTimeDelayLowerScoop = 2000
	End if

	if (eShotLowerScoop = nShot) and (not binMode) _
	and (CanAdvanceMultiballs or (nTimeMBallGraceLeft > 0)) then
		If nTimeMBallGraceLeft > 0 Then
			nTimeMBallGraceLeft = 0
			if avModesRunning(nPlayer).Contains(eModeMultiball1) Then
				ModeMultiball1End
			end If
			if avModesRunning(nPlayer).Contains(eModeMultiball2) Then
				ModeMultiball2End
			end If
			if avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
				ModeMiniWizard1End True, False, eShotNone
			end If
			if avModesRunning(nPlayer).Contains(eModeImmolation) Then
				ModeMiniWizard2End True, False, eShotNone
			end If
			if avModesRunning(nPlayer).Contains(eModeSlurm) Then
				ModeSlurmEnd True, False, eShotNone
			end If
		End If
		If 3 = avModesCompleted(nPlayer).Count Then
			Set oEvent = New EventItem
			oEvent.text = Array("3 MODES COMPLETED", "UNIVERSAL POKER", "CHAMPIONSHIP")
			oEvent.duration = 6666
			oEvent.holdBallAt = eShotLowerScoop
			oEvent.priority = ePrioModeSelect
			oEvent.pupTrigger = 749
			oEvent.lightshow = eLightShowModeComplete
			oEventQueue.Add oEvent
			nTimeDelayLowerScoop = 6666
			nModePending = eModeCherryBomb
		Elseif 7 = avModesCompleted(nPlayer).Count Then
			Set oEvent = New EventItem
			oEvent.text = Array("6 MODES COMPLETED", "FEMINISTA", "MULTIBALL")
			oEvent.duration = 6100
			oEvent.holdBallAt = eShotLowerScoop
			oEvent.priority = ePrioModeSelect
			oEvent.pupTrigger = 752
			oEvent.lightshow = eLightShowModeComplete
			oEventQueue.Add oEvent
			nTimeDelayLowerScoop = 6100
			nModePending = eModeImmolation
		Elseif 11 = avModesCompleted(nPlayer).Count Then
			Set oEvent = New EventItem
			oEvent.text = Array("9 MODES COMPLETED", "SLURM WIZARD MODE")
			oEvent.duration = 9466
			oEvent.holdBallAt = eShotLowerScoop
			oEvent.priority = ePrioModeSelect
			oEvent.pupTrigger = 755
			oEvent.lightshow = eLightShowModeComplete
			oEventQueue.Add oEvent
			nTimeDelayLowerScoop = 9466
			nModePending = eModeSlurm
		Else
			nTimeDelayLowerScoop = 999999999
			Set oEvent = New EventItem
			oEvent.special = "modeselect"
			oEvent.pupTrigger = 720
			oEventQueue.Add oEvent
		End If
	end if
End Sub

Sub AwardCombo (nShot)
	Dim sNextAward, nNextAwardAt, sScore, oEvent
	anCombos(nPlayer) = anCombos(nPlayer) + 1
	Addscore SCORE_COMBO

	nNextAwardAt = anComboLastCollect(nPlayer) + 5

	If eComboAwardNone = anNextComboAward(nPlayer) Then
		sNextAward = "ABSOLUTELY NOTHING"
	Else
		sNextAward = asComboAwardText(anNextComboAward(nPlayer))
	End If

	If 1 = anCombos(nPlayer) Then
		sScore = "1 COMBO! " & FormatScore(SCORE_COMBO * fPlayfieldX)
	Else
		sScore = anCombos(nPlayer) & " COMBOS! " & FormatScore(SCORE_COMBO * fPlayfieldX)
	End If

	If anCombos(nPlayer) < nNextAwardAt Then
		Set oEvent = New EventItem
		oEvent.text = Array(sScore, "LIGHT " & sNextAward, "AT " & nNextAwardAt & " COMBOS")
		oEvent.priority = ePrioCombo
		oEvent.maxQueueLength = 0
		oEvent.pupTrigger = RoundRobinEvent("Combo"): DOF 131, DOFPulse
		oEvent.duration = RoundRobinLength("Combo")
		oEventQueue.Add oEvent
'		DMDTimedText Array(sScore, "LIGHT " & sNextAward, "AT " & nNextAwardAt & " COMBOS"), 2000, ePrioCombo
	Else
		Set oEvent = New EventItem
		oEvent.text = Array(sScore, "LOWER SCOOP AWARDS", sNextAward)
		oEvent.priority = ePrioCombo
		If anCombos(nPlayer) = nNextAwardAt And eComboAwardLightEB = anNextComboAward(nPlayer) Then
			' light extra ball
			oEvent.pupTrigger = 716
			oEvent.duration = 5100
			oEvent.priority = ePrioExtraBall
			oEvent.lightshow = eLightShowModeComplete
			oEvent.interruptOngoing = True
		Else
			oEvent.maxQueueLength = 0
			oEvent.pupTrigger = 714
			oEvent.pupTrigger = RoundRobinEvent("Combo"): DOF 131, DOFPulse
			oEvent.duration = RoundRobinLength("Combo")
		End If
		oEventQueue.Add oEvent
'		DMDTimedText Array(sScore, "LOWER SCOOP AWARDS", sNextAward), 2000, ePrioCombo
	End If
	EndCombo nShot
End Sub

Sub StartCombo (nFromShot)
	Dim i
	Select Case nFromShot
		' Shots that feed left flipper
		Case eShotUpperScoop, eShotLeftRamp
			For each i in Array(eShotCenterLane, eShotRightRamp, eShotInlineDrops, eShotRightLoop)
				anComboTimer(i) = 4000
				aoComboLights(i).state = LightStateOn
			Next
		' Shots that feed right flipper
		Case eShotRightRamp
			For each i in Array(eShotLeftLane, eShotLeftLoop, eShotLowerScoop, eShotLeftRamp, eShotCenterLane)
				anComboTimer(i) = 4000
				aoComboLights(i).state = LightStateOn
			Next
		' Shots that feed upper left flipper
		Case eShotLeftLoop, eShotCenterLane, eShotSideLoop
			For each i in Array(eShotSideLoop, eShotUpperScoop)
				anComboTimer(i) = 4000
				aoComboLights(i).state = LightStateOn
			Next
		' Shots that feed upper right flipper
		Case eShotRightLoop
			For each i in Array(eShotUpperScoop, eShotLeftRamp, eShotCenterLane)
				anComboTimer(i) = 4000
				aoComboLights(i).state = LightStateOn
			Next
	End Select
End Sub

Sub AwardSuperFeature (bFromMystery)
	Dim sAward, oEvent

	If eComboAwardNone = anNextComboAward(nPlayer) Then
		sAward = "ABSOLUTELY NOTHING"
	Elseif eComboAwardPoints = anNextComboAward(nPlayer) Then
		sAward = FormatScore(SCORE_BIG_POINTS * fPlayfieldX) & " POINTS"
	Else
		sAward = asComboAwardText(anNextComboAward(nPlayer))
	End If

	If Not bFromMystery Then
		anComboLastCollect(nPlayer) = anCombos(nPlayer)
		Set oEvent = New EventItem
		oEvent.text = Array(sAward, "COMBO AWARD")
		oEvent.holdBallAt = eShotLowerScoop
		If eComboAwardLightEB = anNextComboAward(nPlayer) Then
			oEvent.lightshow = eLightShowModeComplete
			oEvent.pupTrigger = 717: DOF 132, DOFPulse
			oEvent.duration = 8500
			oEvent.priority = ePrioExtraBall
		Else
			oEvent.lightshow = eLightShowSinkShort
			oEvent.pupTrigger = 715: DOF 131, DOFPulse
			oEvent.duration = 2300
			oEvent.priority = ePrioComboCollect
		End If
		oEventQueue.Add oEvent
		nTimeDelayLowerScoop = 2500
'		DMDTimedText Array(sAward, "COMBO AWARD"), 2500, ePrioMystery
	End if
	
	Select Case anNextComboAward(nPlayer)
		Case eComboAwardNone
			anNextComboAward(nPlayer) = eComboAwardBumpers
		Case eComboAwardFrenzy
			aanModeTime(nPlayer, eModeFrenzy) = 62499
			avModesRunning(nPlayer).Add eModeFrenzy
			anNextComboAward(nPlayer) = eComboAwardBumpers
		Case eComboAwardBumpers
			aanModeTime(nPlayer, eModeSuperBumpers) = 62499
			avModesRunning(nPlayer).Add eModeSuperBumpers
			anNextComboAward(nPlayer) = eComboAwardSpinners
		Case eComboAwardSpinners
			aanModeTime(nPlayer, eModeSuperSpinners) = 62499
			avModesRunning(nPlayer).Add eModeSuperSpinners
			If Not abComboEBCollected(nPlayer) Then
				anNextComboAward(nPlayer) = eComboAwardLightEB
			Else
				anNextComboAward(nPlayer) = eComboAwardPoints
			End If
		Case eComboAwardPoints
			Addscore SCORE_BIG_POINTS
			anNextComboAward(nPlayer) = eComboAwardLoops
		Case eComboAwardLightEB
			abComboEBCollected(nPlayer) = True
			nExtraBalls = nExtraBalls + 1
			anNextComboAward(nPlayer) = eComboAwardLoops
		Case eComboAwardLoops
			aanModeTime(nPlayer, eModeSuperLoops) = 62499
			avModesRunning(nPlayer).Add eModeSuperLoops
			anNextComboAward(nPlayer) = eComboAwardRamps
		Case eComboAwardRamps
			aanModeTime(nPlayer, eModeSuperRamps) = 62499
			avModesRunning(nPlayer).Add eModeSuperRamps
			anNextComboAward(nPlayer) = eComboAwardFrenzy
	End Select
End Sub

Function ModeSelectRandom
	Dim i, n, nMode

	nMode = eModeSlurm
	n = 0
	For i = 0 to 8
		If Not avModesCompleted(nPlayer).Contains(i) Then
			n = n + 1
			If Rnd < (1 / n) Then nMode = i
		End If
	Next
	ModeSelectRandom = nMode
End Function

Sub ModeSelectNext
	Dim i, nStartLookingAt, nNextMode
	Dim dShipXfrom, dShipYfrom, dShipXto, dShipYto

	StopMovingShip nShipMoves
	bMovingShip = False

	if eModeNone = nModeSelected Then
		nStartLookingAt = ModeSelectRandom
	Else
		nStartLookingAt = nModeSelected
	End If
	If avModesCompleted(nPlayer).Contains(nStartLookingAt) Then
		aoLightForMode(nStartLookingAt).state = LightStateOn
	Else
		aoLightForMode(nStartLookingAt).state = LightStateOff
	End If
	
	for i = 0 to 8
		nNextMode = (nStartLookingAt + i + 1) Mod 9
		If Not avModesCompleted(nPlayer).Contains(nNextMode) Then
			nModeSelected = nNextMode
			aoLightForMode(nModeSelected).state = LightStateOn
			aoLightForMode(nModeSelected).state = LightStateBlinking
'			If bSelectingMode Then ModePreviewLights nModeSelected
			If bEnablePuP Then
				bMovingShip = True
				nShipMoves = nShipMoves + 1
				' These offsets are because the stationary ship has its
				' coordinates at its center, but the moving ship has its
				' coordinates at its upper left.
				If eModeDecapod = nStartLookingAt Then
					dShipXfrom = afModeXCoordinates(nStartLookingAt) - 6.14
				Else
					dShipXfrom = afModeXCoordinates(nStartLookingAt) - 7.14
				End If
				dShipYfrom = afShipYCoordinates(nStartLookingAt) - 5.09
				If eModeDecapod = nModeSelected Then
					dShipXto = afModeXCoordinates(nModeSelected) - 6.14
				Else
					dShipXto = afModeXCoordinates(nModeSelected) - 7.14
				End If
				dShipYto = afShipYCoordinates(nModeSelected) - 5.09

				pDMDImageMoveTo "ModeShip", 1000, dShipXfrom, dShipYfrom, dShipXto, dShipYto
			End If
			Exit Sub
		End If
	Next
End Sub

Sub ModeSelectPrevious
	Dim i, nStartLookingAt, nNextMode
	Dim dShipXfrom, dShipYfrom, dShipXto, dShipYto

	StopMovingShip nShipMoves
	bMovingShip = False

	if eModeNone = nModeSelected Then
		nStartLookingAt = ModeSelectRandom
	Else
		nStartLookingAt = nModeSelected
	End If
	If avModesCompleted(nPlayer).Contains(nStartLookingAt) Then
		aoLightForMode(nStartLookingAt).state = LightStateOn
	Else
		aoLightForMode(nStartLookingAt).state = LightStateOff
	End If
	
	for i = 0 to 8
		nNextMode = (nStartLookingAt + (8 - i)) Mod 9
		If Not avModesCompleted(nPlayer).Contains(nNextMode) Then
			nModeSelected = nNextMode
			aoLightForMode(nModeSelected).state = LightStateOn
			aoLightForMode(nModeSelected).state = LightStateBlinking
'			If bSelectingMode Then ModePreviewLights nModeSelected
			If bEnablePuP Then
				bMovingShip = True
				nShipMoves = nShipMoves + 1
				' These offsets are because the stationary ship has its
				' coordinates at its center, but the moving ship has its
				' coordinates at its upper left.
				If eModeDecapod = nStartLookingAt Then
					dShipXfrom = afModeXCoordinates(nStartLookingAt) - 6.14
				Else
					dShipXfrom = afModeXCoordinates(nStartLookingAt) - 7.14
				End If
				dShipYfrom = afShipYCoordinates(nStartLookingAt) - 5.09
				If eModeDecapod = nModeSelected Then
					dShipXto = afModeXCoordinates(nModeSelected) - 6.14
				Else
					dShipXto = afModeXCoordinates(nModeSelected) - 7.14
				End If
				dShipYto = afShipYCoordinates(nModeSelected) - 5.09

				pDMDImageMoveTo "ModeShip", 1000, dShipXfrom, dShipYfrom, dShipXto, dShipYto
			End If
			Exit Sub
		End If
	Next
End Sub

Sub ModeSelectChoose
	StopMovingShip nShipMoves
	bSelectingMode = False
	DOF 118,DOFOff
	nTimeDelayLowerScoop = 1
	ClearEvents
	StartMode nModeSelected
End Sub

Sub StopMovingShip (nMove)
	If bMovingShip and (nMove = nShipMoves) Then
		PuPlayer.LabelSet pDMD,"ModeShip","`u`",1,"{'mt':2,'stopani':1 }"
		bMovingShip = False
	End If
	If nModeSelected >= eModeChapek and nModeSelected <= eModeMars Then
		PuPlayer.LabelSet pDMD, "ModeShip", "`u`", 1, "{'mt':2" & _
			", 'xpos':" & afModeXCoordinates(nModeSelected) & _
			", 'ypos':" & afShipYCoordinates(nModeSelected) & " }"
	End If
End Sub

Sub EndCombo (nAtShot)
	Dim nTime, i

	' End all combos that were started at the same time as the shot that was hit
	nTime = anComboTimer(nAtShot)
	If 0 = nTime Then Exit Sub

	for i = eShotLeftLane to eShotRightLoop
		If nTime = anComboTimer(i) Then
			anComboTimer(i) = 0
			aoComboLights(i).state = LightStateOff
		End If
	Next
End Sub

Sub StartMode (nMode)
	Select Case nMode
		Case eModeOmicron
			ModeOmicronInit
		Case eModeMars
			ModeMarsInit
		Case eModeDaily
			ModeDailyInit
		Case eModeMoon
			ModeMoonInit
		Case eModeChapek
			ModeChapekInit
		Case eModeEarth
			ModeEarthInit
		Case eModeAmazonia
			ModeAmazoniaInit
		Case eModeOsiris
			ModeOsirisInit
		Case eModeDecapod
			ModeDecapodInit
		Case eModeCherryBomb
			ModeMiniWizard1Init
		Case eModeImmolation
			ModeMiniWizard2Init
		Case eModeSlurm
			ModeSlurmInit
	End Select
End Sub

Sub UpdateMode (nMode, nShot, nSwitch, bBlastUsed)
	Select Case nMode
		Case eModeMultiball1
			ModeMultiball1Update nShot, nSwitch, bBlastUsed
		Case eModeMultiball2
			ModeMultiball2Update nShot, nSwitch, bBlastUsed
		Case eModeOmicron
			ModeOmicronUpdate nShot, nSwitch, bBlastUsed
		Case eModeMars
			ModeMarsUpdate nShot, nSwitch, bBlastUsed
		Case eModeDaily
			ModeDailyUpdate nShot, nSwitch, bBlastUsed
		Case eModeMoon
			ModeMoonUpdate nShot, nSwitch, bBlastUsed
		Case eModeChapek
			ModeChapekUpdate nShot, nSwitch, bBlastUsed
		Case eModeEarth
			ModeEarthUpdate nShot, nSwitch, bBlastUsed
		Case eModeAmazonia
			ModeAmazoniaUpdate nShot, nSwitch, bBlastUsed
		Case eModeOsiris
			ModeOsirisUpdate nShot, nSwitch, bBlastUsed
		Case eModeDecapod
			ModeDecapodUpdate nShot, nSwitch, bBlastUsed
		Case eModeCherryBomb
			ModeMiniWizard1Update nShot, nSwitch, bBlastUsed
		Case eModeImmolation
			ModeMiniWizard2Update nShot, nSwitch, bBlastUsed
		Case eModeSlurm
			ModeSlurmUpdate nShot, nSwitch, bBlastUsed
	End Select
End Sub

Sub EndMode (nMode, bLostByDrain, bLostByTime, nSHot)
	avModesRunning(nPlayer).Remove nMode
	Select Case nMode
		Case eModeMultiball1
			nTimeMBallGraceLeft = 0
			ModeMultiball1End
		Case eModeMultiball2
			nTimeMBallGraceLeft = 0
			ModeMultiball2End
		Case eModeOmicron
			ModeOmicronEnd bLostByDrain, bLostByTime, nSHot
		Case eModeMars
			ModeMarsEnd bLostByDrain, bLostByTime, nSHot
		Case eModeDaily
			ModeDailyEnd bLostByDrain, bLostByTime, nSHot
		Case eModeMoon
			ModeMoonEnd bLostByDrain, bLostByTime, nSHot
		Case eModeChapek
			ModeChapekEnd bLostByDrain, bLostByTime, nSHot
		Case eModeEarth
			ModeEarthEnd bLostByDrain, bLostByTime, nSHot
		Case eModeAmazonia
			ModeAmazoniaEnd bLostByDrain, bLostByTime, nSHot
		Case eModeOsiris
			ModeOsirisEnd bLostByDrain, bLostByTime, nSHot
		Case eModeDecapod
			ModeDecapodEnd bLostByDrain, bLostByTime, nSHot
		Case eModeSuperBumpers
			aanModeTime(nPlayer, eModeSuperBumpers) = 0
		Case eModeSuperSpinners
			aanModeTime(nPlayer, eModeSuperSpinners) = 0
		Case eModeSuperLoops
			aanModeTime(nPlayer, eModeSuperLoops) = 0
		Case eModeSuperRamps
			aanModeTime(nPlayer, eModeSuperRamps) = 0
		Case eModeFrenzy
			aanModeTime(nPlayer, eModeFrenzy) = 0
		Case eModeReverseFlips
			aanModeTime(nPlayer, eModeReverseFlips) = 0
		Case eModeHypnotoad
			aanModeTime(nPlayer, eModeHypnotoad) = 0
			SpinHypnotoad False
		Case eModeCherryBomb
			nTimeMBallGraceLeft = 0
			ModeMiniWizard1End bLostByDrain, bLostByTime, nShot
		Case eModeImmolation
			nTimeMBallGraceLeft = 0
			ModeMiniWizard2End bLostByDrain, bLostByTime, nShot
		Case eModeSlurm
			nTimeMBallGraceLeft = 0
			ModeSlurmEnd bLostByDrain, bLostByTime, nShot
	End Select
End Sub

Sub CommonModeInit (nMode)
	avModesRunning(nPlayer).add nMode
	bMusicAfterKick = True
	bAddTimeAwarded = False
	aanModeAttempts(nPlayer, nMode) = aanModeAttempts(nPlayer, nMode) + 1
	anModeScore(nMode) = 0
	bInMode = True
	nDMDMode = nMode
	sDMDScene = "modeinfo"
	nDMDTextDisplayTime = 0
	If bEnablePuP And (nMode <> eModeSlurm) And (nMode <> eModeImmolation) _
	And (nMode <> eModeCherryBomb) Then
		pDMDLabelSet "TimeLabel", "TIME"
		pDMDLabelSet "ShotsLabel", "SHOTS"
	End If
End Sub

Sub CommonModeEnd (nMode, bLostByDrain, bLostByTime, nShot)
	Dim sScore, sBonus, nSpeedBonus, oEvent, nLightShow, nPupTrigger, nPupDuration
	avModesRunning(nPlayer).Remove nMode
	PlayModeMusic
	bInMode = False
	nModeSelected = eModeNone
	If bEnablePuP Then pDMDHideModeLabels
	Select Case nMode
		Case eModeChapek
			nLightShow = eLightShowSinkLong
		Case eModeDecapod
			nLightShow = eLightShowRadarLong
		Case eModeDaily
			nLightShow = eLightShowRiseLong
		Case eModeOsiris
			nLightShow = eLightShowSinkLong
		Case eModeAmazonia
			nLightShow = eLightShowHatchLong
		Case eModeEarth
			nLightShow = eLightShowRiseLong
		Case eModeMoon
			nLightShow = eLightShowRadarLong
		Case eModeMars
			nLightShow = eLightShowHatchLong
		Case eModeOmicron
			nLightShow = eLightShowDiagLong
		Case Else			
			nLightShow = eLightShowNone
	End Select

	sScore = ""
	If Not (bLostByDrain Or bLostByTime) Then
		avModesCompleted(nPlayer).Add nMode
		aanModeShots(nPlayer, nMode) = 0
		aavShotsLit(nPlayer, nMode).Clear
		Select Case nMode
			Case eModeChapek
				nPupTrigger = 723
				nPupDuration = 6500
			Case eModeDecapod
				nPupTrigger = 726
				nPupDuration = 6266
			Case eModeDaily
				nPupTrigger = 729
				nPupDuration = 7800
			Case eModeOsiris
				nPupTrigger = 732
				nPupDuration = 8900
			Case eModeAmazonia
				nPupTrigger = 736
				nPupDuration = 9200
			Case eModeEarth
				nPupTrigger = 739
				nPupDuration = 6700
			Case eModeMars
				nPupTrigger = 748
				nPupDuration = 5100
			Case eModeMoon
				nPupTrigger = 742
				nPupDuration = 7266
			Case eModeOmicron
				nPupTrigger = 745
				nPupDuration = 6866
			Case eModeCherryBomb
				nPupTrigger = 751
				nPupDuration = 7866
			Case eModeImmolation
				nPupTrigger = 754
				nPupDuration = 7900
			Case eModeSlurm
				nPupTrigger = 758
				nPupDuration = 4800
		End Select
		If 1 = aanModeAttempts(nPlayer, nMode) Then
			nSpeedBonus = SCORE_SPEED_BONUS * (aanModeTime(nPlayer, nMode) \ 1000)
			Addscore nSpeedBonus
			sBonus = "FAST DELIVERY " & (nSpeedBonus * fPlayfieldX) \ 1e6 & " MIL"
			anModeScore(nMode) = anModeScore(nMode) + nSpeedBonus
			If anModeScore(nMode) < 1e9 Then
				sScore = "MODE TOTAL " & FormatScore(anModeScore(nMode))
			Else
				sScore = "TOTAL " & FormatScore(anModeScore(nMode))
			End If
			Set oEvent = New EventItem
			oEvent.text = Array(asModeNames(nMode), sBonus, sScore)
			oEvent.priority = ePrioModeEnd
			oEvent.duration = nPupDuration
			oEvent.interruptOngoing = True
			oEvent.pupTrigger = nPupTrigger
			oEvent.lightshow = nLightShow
			If eShotLowerScoop = nShot Or eShotUpperScoop = nShot Then
				oEvent.holdBallAt = nShot
			End If
			oEventQueue.Add oEvent

'			DMDTimedText Array(asModeNames(nMode), sBonus, sScore), 2500, ePrioModeEnd
		Else
			If anModeScore(nMode) < 1e9 Then
				sScore = "MODE TOTAL " & FormatScore(anModeScore(nMode))
			Else
				sScore = "TOTAL " & FormatScore(anModeScore(nMode))
			End If
			Set oEvent = New EventItem
			oEvent.text = Array(asModeNames(nMode), "MODE COMPLETED", sScore)
			oEvent.priority = ePrioModeEnd
			oEvent.duration = nPupDuration
			oEvent.interruptOngoing = True
			oEvent.lightshow = nLightShow
			If eShotLowerScoop = nShot Or eShotUpperScoop = nShot Then
				oEvent.holdBallAt = nShot
			End If
			oEvent.pupTrigger = nPupTrigger
			oEventQueue.Add oEvent
'			DMDTimedText Array(asModeNames(nMode), "MODE COMPLETED", sScore), 2500, ePrioModeEnd
		End If
	End If
	aanModeTime(nPlayer, nMode) = 0

	If eModeCherryBomb = nMode Or eModeImmolation = nMode Or eModeSlurm = nMode Then
		avModesCompleted(nPlayer).Add nMode
	End If

	If "" = sScore And (Not bLostByDrain) Then
		If anModeScore(nMode) < 1e9 Then
			sScore = "MODE TOTAL " & FormatScore(anModeScore(nMode))
		Else
			sScore = "TOTAL " & FormatScore(anModeScore(nMode))
		End If
		Select Case nMode
			Case eModeChapek
				nPupTrigger = 323
				nPupDuration = 4300
			Case eModeDecapod
				nPupTrigger = 332
				nPupDuration = 7066
			Case eModeDaily
				nPupTrigger = 341
				nPupDuration = 6333
			Case eModeOsiris
				nPupTrigger = 361
				nPupDuration = 7700
			Case eModeAmazonia
				nPupTrigger = 370
				nPupDuration = 6100
			Case eModeEarth
				nPupTrigger = 377
				nPupDuration = 6000
			Case eModeMoon
				nPupTrigger = 389
				nPupDuration = 5500
			Case eModeMars
				nPupTrigger = 384
				nPupDuration = 8100
			Case eModeOmicron
				nPupTrigger = 466
				nPupDuration = 6100
		End Select
		Set oEvent = New EventItem
		oEvent.text = Array(asModeNames(nMode), sScore)
		oEvent.priority = ePrioModeEnd
		oEvent.duration = nPupDuration
		oEvent.lightshow = eLightShowSinkLong
		oEvent.pupTrigger = nPupTrigger 'Generic mode time out
		oEventQueue.Add oEvent
'		DMDTimedText Array(asModeNames(nMode), sScore), 2500, ePrioModeEnd
	End If
End Sub

Sub ModeAmazoniaInit
	Dim oEvent

	anAmazoniaLastShot(nPlayer) = eShotUpperScoop
	aanModeTime(nPlayer, eModeAmazonia) = anModeStartTime(eModeAmazonia)
	CommonModeInit eModeAmazonia
	If bEnablePuP Then
		Set oEvent = new EventItem
		oEvent.pupTrigger = anModeStartTriggers(eModeAmazonia)
		oEvent.duration = 5166
		oEvent.priority = ePrioModeStart
		oEvent.holdBallAt = eShotLowerScoop
		oEventQueue.add oEvent
	End If
	ModeAmazoniaUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeAmazoniaGetScore (nShot)
	Dim i
	If eShotNone = nShot Then
		ModeAmazoniaGetScore = 0
	ElseIf aavShotsLit(nPlayer, eModeAmazonia).Contains(nShot) Then
		ModeAmazoniaGetScore = 12000000
	Else
		ModeAmazoniaGetScore = 0
	End If
End Function

Sub ModeAmazoniaUpdate (nShot, nSwitch, bBlastUsed)
	Dim i, oEvent
	Dim nValue, sScore, bValidShot, bUpdateArrows, nProgress

	bValidShot = False
	bUpdateArrows = False
	nProgress = aanModeShots(nPlayer, eModeAmazonia)
	If nShot <> eShotNone Then
		If aavShotsLit(nPlayer, eModeAmazonia).Contains(nShot) Then
			bValidShot = True
			bUpdateArrows = True
		End If
	End If
	If eShotNone = nShot And eSwitchNone = nSwitch Then
		bUpdateArrows = True
	End If

	If bValidShot Then
		nValue = 12000000
		anModeScore(eModeAmazonia) = anModeScore(eModeAmazonia) + (nValue * fPlayfieldX)
		Addscore nValue
		aanModeShots(nPlayer, eModeAmazonia) = aanModeShots(nPlayer, eModeAmazonia) + 1
		nProgress = aanModeShots(nPlayer, eModeAmazonia)
		anAmazoniaLastShot(nPlayer) = nShot
		sScore = FormatScore(nValue * fPlayfieldX)
		If nProgress > 9 Then
			ModeAmazoniaEnd False, False, nShot
			exit Sub
		End If
		asModeMessage = Array(sScore, asModeNames(eModeAmazonia), nProgress & "/10 SHOTS HIT")
		nTimeModeTextUpdate = GameTime
		If not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			oEvent.maxQueueLength = 0
			DOF 184, DOFPulse
			Select Case nProgress
				Case 1
					oEvent.pupTrigger = anModeProgressTriggers(eModeAmazonia)
					oEvent.duration = 4300
				Case 2
					oEvent.pupTrigger = 362
					oEvent.duration = 7200
				Case 3
					oEvent.pupTrigger = 363
					oEvent.duration = 9200
				Case 4
					oEvent.pupTrigger = 364
					oEvent.duration = 4200
				Case 5
					oEvent.pupTrigger = 365
					oEvent.duration = 10300
				Case 6
					oEvent.pupTrigger = 366
					oEvent.duration = 8600
				Case 7
					oEvent.pupTrigger = 367
					oEvent.duration = 11000
				Case 8
					oEvent.pupTrigger = 368
					oEvent.duration = 8000
				Case 9
					oEvent.pupTrigger = 369
					oEvent.duration = 7100
			End Select
			oEvent.lightshow = eLightShowHatchShort
			oEvent.withMode = eModeAmazonia
			oEventQueue.Add oEvent
		End If
	End If

	If bUpdateArrows Then
		aavShotsLit(nPlayer, eModeAmazonia).Clear
		For i = eShotLeftLane to eShotRightLoop
			RemoveShotColor i, eColorPink
		Next

		If nProgress Mod 2 = 0 Then
			For i = eShotLeftLane to eShotRightLoop
				If i > anAmazoniaLastShot(nPlayer) then
					aavShotsLit(nPlayer, eModeAmazonia).add i
					AddShotColor i, eColorPink
				End If
			Next
		Else
			For i = eShotLeftLane to eShotRightLoop
				If i < anAmazoniaLastShot(nPlayer) then
					aavShotsLit(nPlayer, eModeAmazonia).add i
					AddShotColor i, eColorPink
				End If
			Next
		End If
	End If
End Sub

Sub ModeAmazoniaEnd (bLostByDrain, bLostByTime, nShot)
	Dim i
	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorPink
	Next

	CommonModeEnd eModeAmazonia, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeOmicronInit
	Dim oEvent
	aanModeTime(nPlayer, eModeOmicron) = anModeStartTime(eModeOmicron)
	CommonModeInit eModeOmicron
	If 0 = aanModeShots(nPlayer, eModeOmicron) Mod 2 Then
		RaiseLRRRLeft
	Else
		RaiseLRRRRight
	End If
	If bEnablePuP Then
		Set oEvent = new EventItem
		oEvent.pupTrigger = anModeStartTriggers(eModeOmicron)
		oEvent.duration = 2366
		oEvent.priority = ePrioModeStart
		oEvent.holdBallAt = eShotLowerScoop
		oEventQueue.add oEvent
	End If
	ModeOmicronUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeOmicronGetScore (nShot)
	Dim nProgress

	nProgress = aanModeShots(nPlayer, eModeOmicron)
	If ((0 = nProgress Mod 2) and (eShotLRRRLeft = nShot)) _
	Or ((1 = nProgress Mod 2) and (eShotLRRRRight = nShot)) Then
		ModeOmicronGetScore = 15000000
	Else
		ModeOmicronGetScore = 0
	End If	
End Function

Sub ModeOmicronUpdate (nShot, nSwitch, bBlastUsed)
	Dim i
	Dim nValue, sScore, nProgress, oEvent, nPupTrigger, nPupDuration

	nValue = 0
	nProgress = aanModeShots(nPlayer, eModeOmicron)
	If nShot <> eShotNone Then
		If (0 = nProgress Mod 2) and (eShotLRRRLeft = nShot) Then
			nValue = 15000000
			LowerLRRRLeft
			PlaySoundAt "slug_hit", slugleft
			aanModeShots(nPlayer, eModeOmicron) = aanModeShots(nPlayer, eModeOmicron) + 1
			nProgress = aanModeShots(nPlayer, eModeOmicron)
			If nProgress < anShotsToWin(eModeOmicron) Then
				RaiseLRRRRight
			End If
		Elseif (1 = nProgress Mod 2) and (eShotLRRRRight = nShot) Then
			nValue = 15000000
			LowerLRRRRight
			PlaySoundAt "slug_hit", slugright
			aanModeShots(nPlayer, eModeOmicron) = aanModeShots(nPlayer, eModeOmicron) + 1
			nProgress = aanModeShots(nPlayer, eModeOmicron)
			If nProgress < anShotsToWin(eModeOmicron) Then
				RaiseLRRRLeft
			End If
		End If
	End If

	If nValue > 0 Then
		anModeScore(eModeOmicron) = anModeScore(eModeOmicron) + (nValue * fPlayfieldX)
		Addscore nValue
		Select Case nProgress
			Case 1
				nPupTrigger = 744
				nPupDuration = 5566
			Case 2
				nPupTrigger = 462
				nPupDuration = 1833
			Case 3
				nPupTrigger = 463
				nPupDuration = 4200
			Case 4
				nPupTrigger = 464
				nPupDuration = 7466
			Case 5
				nPupTrigger = 465
				nPupDuration = 8133
		End Select
		sScore = FormatScore(nValue * fPlayfieldX)
		asModeMessage = Array(sScore, "SLUG INVASION", nProgress & "/6 SLUGS HIT")
		nTimeModeTextUpdate = GameTime
		If not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			oEvent.lightshow = eLightShowDiagShort
			oEvent.maxQueueLength = 0
			oEvent.withMode = eModeOmicron
			oEvent.pupTrigger = nPupTrigger: DOF 187, DOFPulse
			oEvent.duration = nPupDuration
			oEventQueue.Add oEvent
		End If
		If nProgress >= anShotsToWin(eModeOmicron) Then
			ModeOmicronEnd False, False, nShot
			exit Sub
		End If
	End If
End Sub

Sub ModeOmicronEnd (bLostByDrain, bLostByTime, nShot)
	LowerLRRRLeft
	LowerLRRRRight
	CommonModeEnd eModeOmicron, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeDecapodInit
	Dim i, oEvent

	aanModeTime(nPlayer, eModeDecapod) = anModeStartTime(eModeDecapod)
	CommonModeInit eModeDecapod
	If 0 = aanModeShots(nPlayer, eModeDecapod) Then
		for i = eShotLeftLane to eShotRightLoop
			aavShotsLit(nPlayer, eModeDecapod).add i
		next
	End If
	Set oEvent = new EventItem
	oEvent.priority = ePrioModeStart
	If bEnablePuP Then
		oEvent.pupTrigger = anModeStartTriggers(eModeDecapod)
		oEvent.duration = 6300
		oEvent.holdBallAt = eShotLowerScoop
	End if
	oEventQueue.add oEvent
	ModeDecapodUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeDecapodGetScore (nShot)
	Dim nProgress

	nProgress = aanModeShots(nPlayer, eModeDecapod)
	If aavShotsLit(nPlayer, eModeDecapod).Contains(nShot) Then
		ModeDecapodGetScore = 10000000 + (1000000 * nProgress)
	Else
		ModeDecapodGetScore = 0
	End If
End Function

Sub ModeDecapodUpdate (nShot, nSwitch, bBlastUsed)
	Dim i
	Dim nValue, sScore, bValidShot, bUpdateArrows, nProgress, oEvent

	bValidShot = False
	bUpdateArrows = False
	nProgress = aanModeShots(nPlayer, eModeDecapod)
	If nShot <> eShotNone Then
		If aavShotsLit(nPlayer, eModeDecapod).Contains(nShot) Then
			bValidShot = True
			bUpdateArrows = True
		End If
	End If
	If eShotNone = nShot And eSwitchNone = nSwitch Then
		bUpdateArrows = True
	End If

	If bValidShot Then
		nValue = 10000000 + (1000000 * nProgress)
		anModeScore(eModeDecapod) = anModeScore(eModeDecapod) + (nValue * fPlayfieldX)
		Addscore nValue
		aavShotsLit(nPlayer, eModeDecapod).Remove nShot
		aanModeShots(nPlayer, eModeDecapod) = aanModeShots(nPlayer, eModeDecapod) + 1
		nProgress = aanModeShots(nPlayer, eModeDecapod)
		sScore = FormatScore(nValue * fPlayfieldX)
		asModeMessage =  Array(sScore, "DECAPOD 10", nProgress & "/10 SHOTS HIT")
		nTimeModeTextUpdate = GameTime
		If nProgress > 9 Then
			ModeDecapodEnd False, False, nShot
			exit Sub
		Elseif not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			oEvent.maxQueueLength = 0
			DOF 181, DOFPulse 
			Select Case nProgress
				Case 1
					oEvent.pupTrigger = 725
					oEvent.duration = 8000
				Case 2
					oEvent.pupTrigger = 324
					oEvent.duration = 9600
				Case 3
					oEvent.pupTrigger = 325
					oEvent.duration = 7200
				Case 4
					oEvent.pupTrigger = 326
					oEvent.duration = 8000
				Case 5
					oEvent.pupTrigger = 327
					oEvent.duration = 6700
				Case 6
					oEvent.pupTrigger = 328
					oEvent.duration = 6800
				Case 7
					oEvent.pupTrigger = 329
					oEvent.duration = 5900
				Case 8
					oEvent.pupTrigger = 330
					oEvent.duration = 6900
				Case 9
					oEvent.pupTrigger = 331
					oEvent.duration = 10700
			End Select
			oEvent.lightshow = eLightShowRadarShort
			oEvent.withMode = eModeDecapod
			oEventQueue.Add oEvent
		End If
	End If

	If bUpdateArrows Then
		For i = eShotLeftLane to eShotRightLoop
			If aavShotsLit(nPlayer, eModeDecapod).Contains(i) Then
				AddShotColor i, eColorOrange
			Else
				RemoveShotColor i, eColorOrange
			End If
		Next
	End If
End Sub

Sub ModeDecapodEnd (bLostByDrain, bLostByTime, nShot)
	Dim i

	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorOrange
	Next

	CommonModeEnd eModeDecapod, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeMarsInit
	Dim i, oEvent

	aanModeTime(nPlayer, eModeMars) = anModeStartTime(eModeMars)
	CommonModeInit eModeMars
	If 0 = aanModeShots(nPlayer, eModeMars) Then
		anMarsShot(nPlayer) = eShotLowerScoop
		nTimeMarsMove = 3500
		bMarsMoveLeft = False
	End If
	If bEnablePuP Then
		Set oEvent = new EventItem
		oEvent.pupTrigger = anModeStartTriggers(eModeMars)
		oEvent.priority = ePrioModeStart
		oEvent.duration = 4000
		oEvent.holdBallAt = eShotLowerScoop
		oEventQueue.add oEvent
	End If
	ModeMarsUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeMarsGetScore (nShot)
	Dim nProgress

	nProgress = aanModeShots(nPlayer, eModeMars)
	If aavShotsLit(nPlayer, eModeMars).Contains(nShot) Then
		ModeMarsGetScore = 12000000 + (1000000 * (nProgress \ 2))
	Else
		ModeMarsGetScore = 0
	End If
End Function

Sub ModeMarsUpdate (nShot, nSwitch, bBlastUsed)
	Dim i, sScore, oEvent
	Dim nValue, bValidShot, nProgress, bUpdateArrows, nShotCount, nLastShot, nMoveTime

	bValidShot = False
	bUpdateArrows = False
	nProgress = aanModeShots(nPlayer, eModeMars)
	Select Case nProgress
		Case 0, 1
			nMoveTime = 3640
		Case 2, 3
			nMoveTime = 3120
		Case 4, 5
			nMoveTime = 2600
		Case Else
			nMoveTime = 2080
	End Select
	nLastShot = anMarsShot(nPlayer) + aavShotsLit(nPlayer, eModeMars).Count
	If nLastShot > eShotRightLoop Then nLastShot = eShotRightLoop
	If eShotNone <> nShot Then
		If aavShotsLit(nPlayer, eModeMars).Contains(nShot) Then
			bValidShot = True
			bUpdateArrows = True
		Elseif bMarsMoveLeft Then
			If nMoveTime - nTimeMarsMove <= 1500 And _
			aavShotsLit(nPlayer, eModeMars).Contains(nLastShot) Then
				bValidShot = True
				bUpdateArrows = True
			End If
		Elseif (Not bMarsMoveLeft) and (nShot > eShotLowerScoop) Then
			If nMoveTime - nTimeMarsMove <= 1500 And _
			aavShotsLit(nPlayer, eModeMars).Contains(nShot - 1) Then
				bValidShot = True
				bUpdateArrows = True
			End If
		End If
	End If
	If (eShotNone = nShot) And (eSwitchNone = nSwitch) Then
		bUpdateArrows = True
	End If
			
	If bValidShot Then
		nValue = 12000000 + (1000000 * (nProgress \ 2))
		anModeScore(eModeMars) = anModeScore(eModeMars) + nValue
		Addscore nValue
		aanModeShots(nPlayer, eModeMars) = aanModeShots(nPlayer, eModeMars) + 1
		nProgress = aanModeShots(nPlayer, eModeMars)
		sScore = FormatScore(nValue * fPlayfieldX)
		asModeMessage = Array(sScore, "MARS", nProgress & "/8 SHOTS HIT")
		nTimeModeTextUpdate = GameTime
		If not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			oEvent.maxQueueLength = 0
			DOF 188, DOFPulse
			Select Case nProgress
				Case 1
					oEvent.pupTrigger = 747
					oEvent.duration = 6300
				Case 2
					oEvent.pupTrigger = 378
					oEvent.duration = 9766
				Case 3
					oEvent.pupTrigger = 379
					oEvent.duration = 12200
				Case 4
					oEvent.pupTrigger = 380
					oEvent.duration = 9100
				Case 5
					oEvent.pupTrigger = 381
					oEvent.duration = 9300
				Case 6
					oEvent.pupTrigger = 382
					oEvent.duration = 10566
				Case 7
					oEvent.pupTrigger = 383
					oEvent.duration = 9500
			End Select
			oEvent.lightshow = eLightShowHatchShort
			oEvent.withMode = eModeMars
			oEventQueue.Add oEvent
		End If
		If nProgress >= anShotsToWin(eModeMars) Then
			ModeMarsEnd False, False, nShot
			exit Sub
		End If
	End If

	If bUpdateArrows Then
		Select Case nProgress
			Case 0, 1
				nShotCount = 5
			Case 2, 3
				nShotCount = 4
			Case 4, 5
				nShotCount = 3
			Case Else
				nShotCount = 2
		End Select
		aavShotsLit(nPlayer, eModeMars).Clear
		For i = 0 to 9 : RemoveShotColor i, eColorRed : Next
		For i = 0 to (nShotCount - 1)
			If anMarsShot(nPlayer) + i <= eShotRightLoop Then
				AddShotColor anMarsShot(nPlayer) + i, eColorRed
				aavShotsLit(nPlayer, eModeMars).add anMarsShot(nPlayer) + i
			End If
		Next
	End If
End Sub

Sub ModeMarsEnd (bLostByDrain, bLostByTime, nShot)
	Dim i

	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorRed
	Next

	CommonModeEnd eModeMars, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeDailyInit
	Dim i, oEvent

	aanModeTime(nPlayer, eModeDaily) = anModeStartTime(eModeDaily)
	CommonModeInit eModeDaily
	If 0 = aanModeShots(nPlayer, eModeDaily) Then
		aavShotsLit(nPlayer, eModeDaily).add eShotLowerScoop
		aavShotsLit(nPlayer, eModeDaily).add eShotLeftRamp
		aavShotsLit(nPlayer, eModeDaily).add eShotInlineDrops
	End If
	Set oEvent = new EventItem
	oEvent.priority = ePrioModeStart
	If bEnablePuP Then
		oEvent.holdBallAt = eShotLowerScoop
		oEvent.pupTrigger = anModeStartTriggers(eModeDaily)
		oEvent.duration = 6000
	End If
	oEventQueue.add oEvent
	ModeDailyUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeDailyGetScore (nShot)
	Dim nProgress

	nProgress = aanModeShots(nPlayer, eModeDaily)
	If aavShotsLit(nPlayer, eModeDaily).Contains(nShot) Then
		ModeDailyGetScore = 12000000
	Else
		ModeDailyGetScore = 0
	End If
End Function

Sub ModeDailyUpdate (nShot, nSwitch, bBlastUsed)
	Dim i, sShotsHit, oEvent
	Dim nValue, sScore, bValidShot, bUpdateArrows, nProgress

	bValidShot = False
	bUpdateArrows = False
	nProgress = aanModeShots(nPlayer, eModeDaily)
	If nShot <> eShotNone Then
		If aavShotsLit(nPlayer, eModeDaily).Contains(nShot) Then
			bValidShot = True
			bUpdateArrows = True
		End If
	End If
	If eShotNone = nShot And eSwitchNone = nSwitch Then
		bUpdateArrows = True
	End If

	If bValidShot Then
		nValue = 12000000
		anModeScore(eModeDaily) = anModeScore(eModeDaily) + (nValue * fPlayfieldX)
		Addscore nValue
		aavShotsLit(nPlayer, eModeDaily).Remove nShot
		aavShotsLit(nPlayer, eModeDaily).Add ((nShot + 1) Mod 10)
		aavShotsLit(nPlayer, eModeDaily).Add ((nShot + 9) Mod 10)
		aanModeShots(nPlayer, eModeDaily) = aanModeShots(nPlayer, eModeDaily) + 1
		nProgress = aanModeShots(nPlayer, eModeDaily)
		sScore = FormatScore(nValue * fPlayfieldX)
		sShotsHit = nProgress & "/" & anShotsToWin(eModeDaily) &" SHOTS HIT"
		asModeMessage = Array(sScore, asModeNames(eModeDaily), sShotsHit)
		nTimeModeTextUpdate = GameTime
		If nProgress >= anShotsToWin(eModeDaily) Then
			ModeDailyEnd False, False, nShot
			exit Sub
		Elseif not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			oEvent.maxQueueLength = 0
			DOF 182, DOFPulse
			Select Case nProgress
				Case 1
					oEvent.pupTrigger = 728
					oEvent.duration = 7600
				Case 2
					oEvent.pupTrigger = 333
					oEvent.duration = 7100
				Case 3
					oEvent.pupTrigger = 334
					oEvent.duration = 6200
				Case 4
					oEvent.pupTrigger = 335
					oEvent.duration = 8133
				Case 5
					oEvent.pupTrigger = 336
					oEvent.duration = 9333
				Case 6
					oEvent.pupTrigger = 337
					oEvent.duration = 8400
				Case 7
					oEvent.pupTrigger = 338
					oEvent.duration = 9300
				Case 8
					oEvent.pupTrigger = 339
					oEvent.duration = 5200
				Case 9
					oEvent.pupTrigger = 340
					oEvent.duration = 5233
			End Select
			oEvent.lightshow = eLightShowRiseShort
			oEvent.withMode = eModeDaily
			oEventQueue.Add oEvent
		End If
	End If

	If bUpdateArrows Then
		For i = eShotLeftLane to eShotRightLoop
			If aavShotsLit(nPlayer, eModeDaily).Contains(i) Then
				AddShotColor i, eColorCyan
			Else
				RemoveShotColor i, eColorCyan
			End If
		Next
	End If
End Sub

Sub ModeDailyEnd (bLostByDrain, bLostByTime, nShot)
	Dim i

	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorCyan
	Next

	CommonModeEnd eModeDaily, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeMoonInit
	Dim oEvent

	aanModeTime(nPlayer, eModeMoon) = anModeStartTime(eModeMoon)
	If 0 = aanModeAttempts(nPlayer, eModeMars) Then
		anMoonShotWhite(nPlayer) = eShotSideLoop
		anMoonShotGray(nPlayer) = eShotCenterLane
	End If
	CommonModeInit eModeMoon
	If bEnablePuP Then
		Set oEvent = new EventItem
		oEvent.pupTrigger = anModeStartTriggers(eModeMoon)
		oEvent.priority = ePrioModeStart
		oEvent.duration = 4866
		oEvent.holdBallAt = eShotLowerScoop
		oEventQueue.add oEvent
	End If
	ModeMoonUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeMoonGetScore (nShot)
	Dim nShotsHit

	nShotsHit = 0
	If nShot = anMoonShotWhite(nPlayer) Then nShotsHit = nShotsHit + 1
	If nShot = anMoonShotGray(nPlayer) Then nShotsHit = nShotsHit + 1

	ModeMoonGetScore = 17500000 * nShotsHit
End Function

Sub ModeMoonUpdate (nShot, nSwitch, bBlastUsed)
	Dim i, sShotsHit, oEvent
	Dim nValue, sScore, nShotsHit, bUpdateArrows, nProgress

	bUpdateArrows = False
	nShotsHit = 0
	nProgress = aanModeShots(nPlayer, eModeMoon)
	If nShot = anMoonShotWhite(nPlayer) Then nShotsHit = nShotsHit + 1
	If nShot = anMoonShotGray(nPlayer) Then nShotsHit = nShotsHit + 1
	If eShotNone = nShot And eSwitchNone = nSwitch Then
		bUpdateArrows = True
	End If

	If nShotsHit > 0 Then
		bUpdateArrows = True
		nValue = 17500000 * nShotsHit
		anModeScore(eModeMoon) = anModeScore(eModeMoon) + (nValue * fPlayfieldX)
		Addscore nValue
		aanModeShots(nPlayer, eModeMoon) = aanModeShots(nPlayer, eModeMoon) + nShotsHit
		nProgress = aanModeShots(nPlayer, eModeMoon)
		If nProgress > anShotsToWin(eModeMoon) Then
			nProgress = anShotsToWin(eModeMoon)
		End If
		' TODO: Light show
		If nProgress = anShotsToWin(eModeMoon) Then
			ModeMoonEnd False, False, nShot
			exit Sub
		End If
		sShotsHit = nProgress & "/" & anShotsToWin(eModeMoon) &" SHOTS HIT"
		asModeMessage = Array(sScore, "THE MOON", sShotsHit)
		nTimeModeTextUpdate = GameTime
		sScore = FormatScore(nValue * fPlayfieldX)
		If not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			oEvent.maxQueueLength = 0
			DOF 186, DOFPulse
			Select Case nProgress
				Case 1
					oEvent.pupTrigger = 741
					oEvent.duration = 4500
				Case 2
					oEvent.pupTrigger = 385
					oEvent.duration = 9300
				Case 3
					oEvent.pupTrigger = 386
					oEvent.duration = 700
				Case 4
					oEvent.pupTrigger = 387
					oEvent.duration = 7733
				Case 5
					oEvent.pupTrigger = 388
					oEvent.duration = 8633
			End Select
			oEvent.lightshow = eLightShowRadarShort
			oEvent.withMode = eModeMoon
			oEventQueue.Add oEvent
		End If
	End If

	If bUpdateArrows Then
		For i = eShotLeftLane to eShotRightLoop
			RemoveShotColor i, eColorWhite
			RemoveShotColor i, eColorGray
		Next

		AddShotColor anMoonShotWhite(nPlayer), eColorWhite
		AddShotColor anMoonShotGray(nPlayer), eColorGray
	End If
End Sub

Sub ModeMoonEnd (bLostByDrain, bLostByTime, nShot)
	Dim i
	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorWhite
		RemoveShotColor i, eColorGray
	Next

	CommonModeEnd eModeMoon, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeChapekInit
	Dim i, oEvent

	aanModeTime(nPlayer, eModeChapek) = anModeStartTime(eModeChapek)
	CommonModeInit eModeChapek
	If 0 = aanModeShots(nPlayer, eModeChapek) Then
		aavShotsLit(nPlayer, eModeChapek).add eShotLeftRamp
		aavShotsLit(nPlayer, eModeChapek).add eShotRightRamp
	End If
	Set oEvent = new EventItem
	If bEnablePuP Then
		oEvent.holdBallAt = eShotLowerScoop
		oEvent.pupTrigger = anModeStartTriggers(eModeChapek)
		oEvent.duration = 5700
	End If
	oEvent.priority = ePrioModeStart
	oEventQueue.add oEvent
	ModeChapekUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeChapekGetScore (nShot)
	Dim nProgress

	nProgress = aanModeShots(nPlayer, eModeChapek)
	If aavShotsLit(nPlayer, eModeChapek).Contains(nShot) Then
		ModeChapekGetScore = 13500000
	Else
		ModeChapekGetScore = 0
	End If
End Function

Sub ModeChapekUpdate (nShot, nSwitch, bBlastUsed)
	Dim i, sShotsHit, oEvent
	Dim nValue, sScore, bValidShot, bUpdateArrows, nProgress

	bValidShot = False
	bUpdateArrows = False
	nProgress = aanModeShots(nPlayer, eModeChapek)
	If nShot <> eShotNone Then
		If aavShotsLit(nPlayer, eModeChapek).Contains(nShot) Then
			bValidShot = True
			bUpdateArrows = True
		End If
	End If
	If eShotNone = nShot And eSwitchNone = nSwitch Then
		bUpdateArrows = True
	End If

	If bValidShot Then
		nValue = 13500000
		anModeScore(eModeChapek) = anModeScore(eModeChapek) + (nValue * fPlayfieldX)
		Addscore nValue
		aavShotsLit(nPlayer, eModeChapek).Remove nShot
		aanModeShots(nPlayer, eModeChapek) = aanModeShots(nPlayer, eModeChapek) + 1
		nProgress = aanModeShots(nPlayer, eModeChapek)
		sScore = FormatScore(nValue * fPlayfieldX)
		sShotsHit = nProgress & "/" & anShotsToWin(eModeChapek) &" SHOTS HIT"
		asModeMessage = Array(sScore, "CHAPEK 9", sShotsHit)
		nTimeModeTextUpdate = GameTime
		If nProgress >= anShotsToWin(eModeChapek) Then
			ModeChapekEnd False, False, nShot
			exit Sub
		Elseif not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			oEvent.maxQueueLength = 0
			DOF 180, DOFPulse
			Select Case nProgress
				Case 1
					oEvent.pupTrigger = anModeProgressTriggers(eModeChapek)
					oEvent.duration = 4600
				Case 2
					oEvent.pupTrigger = 316
					oEvent.duration = 6600
				Case 3
					oEvent.pupTrigger = 317
					oEvent.duration = 9200
				Case 4
					oEvent.pupTrigger = 318
					oEvent.duration = 5700
				Case 5
					oEvent.pupTrigger = 319
					oEvent.duration = 7233
				Case 6
					oEvent.pupTrigger = 320
					oEvent.duration = 7600
				Case 7
					oEvent.pupTrigger = 321
					oEvent.duration = 5400
				Case 8
					oEvent.pupTrigger = 322
					oEvent.duration = 7333
			End Select
			oEvent.lightshow = eLightShowSinkShort
			oEvent.withMode = eModeChapek
			oEventQueue.Add oEvent
		End If
	End If

	If bUpdateArrows Then
		aavShotsLit(nPlayer, eModeChapek).Clear
		Select Case nProgress Mod 3
			Case 0
				aavShotsLit(nPlayer, eModeChapek).add eShotLeftRamp
				aavShotsLit(nPlayer, eModeChapek).add eShotRightRamp
			Case 1
				aavShotsLit(nPlayer, eModeChapek).add eShotLeftLoop
				aavShotsLit(nPlayer, eModeChapek).add eShotSideLoop
				aavShotsLit(nPlayer, eModeChapek).add eShotCenterLane
				aavShotsLit(nPlayer, eModeChapek).add eShotRightLoop
			Case 2
				aavShotsLit(nPlayer, eModeChapek).add eShotLowerScoop
				aavShotsLit(nPlayer, eModeChapek).add eShotUpperScoop
				aavShotsLit(nPlayer, eModeChapek).add eShotInlineDrops
		End Select

		For i = eShotLeftLane to eShotRightLoop
			If aavShotsLit(nPlayer, eModeChapek).Contains(i) Then
				AddShotColor i, eColorPurple
			Else
				RemoveShotColor i, eColorPurple
			End If
		Next
	End If
End Sub

Sub ModeChapekEnd (bLostByDrain, bLostByTime, nShot)
	Dim i

	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorPurple
	Next

	CommonModeEnd eModeChapek, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeEarthInit
	Dim oEvent

	aanModeTime(nPlayer, eModeEarth) = anModeStartTime(eModeEarth)
	CommonModeInit eModeEarth
	if bEnablePuP Then
		Set oEvent = new EventItem
		oEvent.pupTrigger = anModeStartTriggers(eModeEarth)
		oEvent.duration = 6200
		oEvent.holdBallAt = eShotLowerScoop
		oEvent.priority = ePrioModeStart
		oEventQueue.add oEvent
	End If
	ModeEarthUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeEarthGetScore (nShot)
	If aavShotsLit(nPlayer, eModeEarth).Contains(nShot) Then
		ModeEarthGetScore = 15000000
	Else
		ModeEarthGetScore = 0
	End If
End Function

Sub ModeEarthUpdate (nShot, nSwitch, bBlastUsed)
	Dim i, sShotsHit, anShots, nShotsAdded, oEvent
	Dim nValue, sScore, bValidShot, bUpdateArrows, nProgress

	bValidShot = False
	bUpdateArrows = False
	nProgress = aanModeShots(nPlayer, eModeEarth)
	If nShot <> eShotNone Then
		If aavShotsLit(nPlayer, eModeEarth).Contains(nShot) Then
			bValidShot = True
			bUpdateArrows = True
			If bBlastUsed then aanShotLastHit(nPlayer, nShot) = GameTime
		End If
	End If
	If eShotNone = nShot And eSwitchNone = nSwitch Then
		bUpdateArrows = True
	End If

	If bValidShot Then
		nValue = 15000000
		anModeScore(eModeEarth) = anModeScore(eModeEarth) + (nValue * fPlayfieldX)
		Addscore nValue
		aavShotsLit(nPlayer, eModeEarth).Remove nShot
		aanModeShots(nPlayer, eModeEarth) = aanModeShots(nPlayer, eModeEarth) + 1
		nProgress = aanModeShots(nPlayer, eModeEarth)
		sScore = FormatScore(nValue * fPlayfieldX)
		sShotsHit = nProgress & "/" & anShotsToWin(eModeEarth) &" SHOTS HIT"
		asModeMessage = Array(sScore, asModeNames(eModeEarth), sShotsHit)
		If nProgress >= anShotsToWin(eModeEarth) Then
			ModeEarthEnd False, False, nShot
			exit Sub
		Elseif not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			DOF 185, DOFPulse
			Select Case nProgress
				Case 1
					oEvent.pupTrigger = 738
					oEvent.duration = 8200
				Case 2
					oEvent.pupTrigger = 371
					oEvent.duration = 8600
				Case 3
					oEvent.pupTrigger = 372
					oEvent.duration = 7266
				Case 4
					oEvent.pupTrigger = 373
					oEvent.duration = 7900
				Case 5
					oEvent.pupTrigger = 374
					oEvent.duration = 12166
				Case 6
					oEvent.pupTrigger = 375
					oEvent.duration = 8466
				Case 7
					oEvent.pupTrigger = 376
					oEvent.duration = 5500
			End Select
			oEvent.maxQueueLength = 0
			oEvent.lightshow = eLightShowRiseShort
			oEvent.withMode = eModeEarth
			oEventQueue.Add oEvent
		End If
	End If

	If bUpdateArrows Then
		aavShotsLit(nPlayer, eModeEarth).Clear
		nShotsAdded = 0
		anShots = getLeastRecentShots(5)
		for i = 0 to 4
			if anShots(i) <> eShotLeftLane then
				aavShotsLit(nPlayer, eModeEarth).add anShots(i)
				nShotsAdded = nShotsAdded + 1
				If nShotsAdded >= 4 Then Exit For
			end if
		next

		For i = eShotLeftLane to eShotRightLoop
			If aavShotsLit(nPlayer, eModeEarth).Contains(i) Then
				AddShotColor i, eColorBlue
			Else
				RemoveShotColor i, eColorBlue
			End If
		Next
	End If
End Sub

Sub ModeEarthEnd (bLostByDrain, bLostByTime, nShot)
	Dim i

	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorBlue
	Next

	CommonModeEnd eModeEarth, bLostByDrain, bLostByTime, nShot
End Sub

Sub ModeOsirisInit
	Dim oEvent

	aanModeTime(nPlayer, eModeOsiris) = anModeStartTime(eModeOsiris)
	CommonModeInit eModeOsiris
	If 0 = aanModeShots(nPlayer, eModeOsiris) Then
		anOsirisSpins(nPlayer) = 0
		anOsirisShotsAdded(nPlayer) = 0
		anOrisisVideos(nPlayer) = 0
	End If
	If bEnablePuP Then
		Set oEvent = new EventItem
		oEvent.pupTrigger = anModeStartTriggers(eModeOsiris)
		oEvent.holdBallAt = eShotLowerScoop
		oEvent.priority = ePrioModeStart
		oEvent.duration = 6700
		oEventQueue.add oEvent
	End If
	ModeOsirisUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeOsirisGetScore (nShot)
	Dim nProgress

	nProgress = aanModeShots(nPlayer, eModeOsiris)
	If eShotCenterLane = nShot Then
		ModeOsirisGetScore = 3000000
	elseIf aavShotsLit(nPlayer, eModeOsiris).Contains(nShot) Then
		ModeOsirisGetScore = 12000000
	Else
		ModeOsirisGetScore = 0
	End If
End Function

Dim anOsirisShotOrder
anOsirisShotOrder = Array(eShotLeftRamp, eShotRightRamp, eShotUpperScoop,_
	eShotInlineDrops, eShotSideLoop, eShotRightLoop, eShotLowerScoop, _
	eShotLeftLane, eShotLowerScoop)
Sub ModeOsirisUpdate (nShot, nSwitch, bBlastUsed)
	Dim i, sShotsHit, bAddShot, nShotToAdd, oEvent
	Dim bIsPlaying, nPupTrigger, nPupDuration
	Dim nValue, sScore, bValidShot, bUpdateArrows, nProgress

	bValidShot = False
	bUpdateArrows = False
	bAddShot = False
	nProgress = aanModeShots(nPlayer, eModeOsiris)
	If eSwitchUpperSpinner = nSwitch Then
		anOsirisSpins(nPlayer) = anOsirisSpins(nPlayer) + 1
		If anOsirisSpins(nPlayer) Mod 8 = 1 Then
			bAddShot = true
		End If
	End If
	If (eShotCenterLane = nShot) And bBlastUsed Then
		bAddShot = true
	elseIf nShot <> eShotNone and nShot <> eShotCenterLane Then
		If aavShotsLit(nPlayer, eModeOsiris).Contains(nShot) Then
			bValidShot = True
			bUpdateArrows = True
		End If
	End If
	If eShotNone = nShot And eSwitchNone = nSwitch Then
		bUpdateArrows = True
	End If

	bIsPlaying = False
	If Not oCurrentEvent is Nothing Then
		If eModeOsiris = oCurrentEvent.withMode Then
			bIsPlaying = True
		End If
	End If

	Select Case anOrisisVideos(nPlayer) + 1
		Case 1
			nPupTrigger = 731
			nPupDuration = 7000
		Case 2
			nPupTrigger = 342
			nPupDuration = 9300
		Case 3
			nPupTrigger = 343
			nPupDuration = 9900
		Case 4
			nPupTrigger = 344
			nPupDuration = 8800
		Case 5
			nPupTrigger = 345
			nPupDuration = 10800
		Case 6
			nPupTrigger = 346
			nPupDuration = 5400
		Case 7
			nPupTrigger = 347
			nPupDuration = 7600
		Case 8
			nPupTrigger = 348
			nPupDuration = 7300
		Case 9
			nPupTrigger = 349
			nPupDuration = 4800
		Case 10
			nPupTrigger = 350
			nPupDuration = 13800
		Case 11
			nPupTrigger = 351
			nPupDuration = 9700
		Case 12
			nPupTrigger = 352
			nPupDuration = 10100
		Case 13
			nPupTrigger = 353
			nPupDuration = 8066
		Case 14
			nPupTrigger = 354
			nPupDuration = 6466
		Case 15
			nPupTrigger = 355
			nPupDuration = 5900
		Case 16
			nPupTrigger = 356
			nPupDuration = 8100
		Case 17
			nPupTrigger = 357
			nPupDuration = 7900
		Case 18
			nPupTrigger = 358
			nPupDuration = 7800
		Case 19
			nPupTrigger = 359
			nPupDuration = 6900
		Case 20
			nPupTrigger = 360
			nPupDuration = 5466
	End Select
	If bAddShot Then
		if aavShotsLit(nPlayer, eModeOsiris).Count < 9 Then
			for i = 0 to 8
				nShotToAdd = anOsirisShotOrder((i + anOsirisShotsAdded(nPlayer)) Mod 9)
				if not aavShotsLit(nPlayer, eModeOsiris).Contains(nShotToAdd) Then
					bUpdateArrows = True
					aavShotsLit(nPlayer, eModeOsiris).add nShotToAdd
					anOsirisShotsAdded(nPlayer) = anOsirisShotsAdded(nPlayer) + 1
					Addscore 3000000
					sScore = FormatScore(3000000 * fPlayfieldX)
					if not bBlastUsed then
						Set oEvent = New EventItem
						oEvent.text = Array(sScore, asShotNames(nShotToAdd), "ADDED")
						oEvent.priority = ePiroShotLit
						if not bIsPlaying Then
							oEvent.pupTrigger = nPupTrigger
							oEvent.duration = nPupDuration
							anOrisisVideos(nPlayer) = anOrisisVideos(nPlayer) + 1
						Else
							oEvent.duration = 1500
						End If
						oEvent.maxQueueLength = 0
						oEvent.lightshow = eLightShowDiagShort
						oEvent.withMode = eModeOsiris
						oEventQueue.Add oEvent
'						DMDTimedText Array(sScore, asShotNames(nShotToAdd), "ADDED"), 1500, ePiroShotLit
					end if
					exit for
				end if
			next
		end if
	End If

	If bValidShot Then
		nValue = 12000000
		anModeScore(eModeOsiris) = anModeScore(eModeOsiris) + (nValue * fPlayfieldX)
		Addscore nValue
		aavShotsLit(nPlayer, eModeOsiris).Remove nShot
		aanModeShots(nPlayer, eModeOsiris) = aanModeShots(nPlayer, eModeOsiris) + 1
		nProgress = aanModeShots(nPlayer, eModeOsiris)
		sScore = FormatScore(nValue * fPlayfieldX)
		sShotsHit = nProgress & "/" & anShotsToWin(eModeOsiris) &" SHOTS HIT"
		asModeMessage = Array(sScore, asModeNames(eModeOsiris), sShotsHit)
		If nProgress >= anShotsToWin(eModeOsiris) Then
			ModeOsirisEnd False, False, nShot
			exit Sub
		Elseif not bBlastUsed Then
			Set oEvent = New EventItem
			oEvent.text = asModeMessage
			oEvent.priority = ePrioModeProgress
			if not bIsPlaying Then
				anOrisisVideos(nPlayer) = anOrisisVideos(nPlayer) + 1
			End If
			oEvent.pupTrigger = nPupTrigger: DOF 183, DOFPulse
			oEvent.duration = nPupDuration
			oEvent.maxQueueLength = 0
			oEvent.lightshow = eLightShowDiagShort
			oEvent.withMode = eModeOsiris
			oEventQueue.Add oEvent
		End If
	End If

	If bUpdateArrows Then
		If aavShotsLit(nPlayer, eModeOsiris).Count > 0 Then
			asModeGoals(eModeOsiris) = "HIT YELLOW ARROWS"
		Else
			asModeGoals(eModeOsiris) = "HIT UPPER SPINNER"
		End If
		For i = eShotLeftLane to eShotRightLoop
			If aavShotsLit(nPlayer, eModeOsiris).Contains(i) Then
				AddShotColor i, eColorYellow
			Else
				RemoveShotColor i, eColorYellow
			End If
		Next
		if aavShotsLit(nPlayer, eModeOsiris).Count < 9 Then
			RemoveShotColor eShotCenterLane, eColorYellow
			AddShotColor eShotCenterLane, eColorRainbow
		else
			RemoveShotColor eShotCenterLane, eColorYellow
			RemoveShotColor eShotCenterLane, eColorRainbow
		end if
	End If
End Sub

Sub ModeOsirisEnd (bLostByDrain, bLostByTime, nShot)
	Dim i

	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorYellow
	Next
	RemoveShotColor eShotCenterLane, eColorRainbow

	CommonModeEnd eModeOsiris, bLostByDrain, bLostByTime, nShot
End Sub

Sub TimerMode_Timer
	Dim i, nTimeNext, nShotNext

	If bDrainingBalls Or bSelectingMode Or (nPlayersInGame < 1) Then Exit Sub
	If (1 = BIP) and bBallHeld Then Exit Sub

	' Ball Save
	If nTimeBallSave > 0 Then
		nTimeBallSave = nTimeBallSave - TimerMode.Interval
		If nTimeBallSave < 0 Then nTimeBallSave = 0
	End If

	' mars moving shot
	If avModesRunning(nPlayer).Contains(eModeMars) Then
		nTimeMarsMove = nTimeMarsMove - TimerMode.interval
		If nTimeMarsMove < 1 Then
			Select Case aanModeShots(nPlayer, eModeMars)
				Case 0, 1
					nTimeNext = 3640
				Case 2, 3
					nTimeNext = 3120
				Case 4, 5
					nTimeNext = 2600
				Case Else
					nTimeNext = 2080
			End Select
			nTimeMarsMove = nTimeNext
			If bMarsMoveLeft Then
				If anMarsShot(nPlayer) <= eShotLowerScoop Then
					anMarsShot(nPlayer) = anMarsShot(nPlayer) + 1
					bMarsMoveLeft = False
				Else
					anMarsShot(nPlayer) = anMarsShot(nPlayer) - 1
				End If
			Else
				nShotNext = anMarsShot(nPlayer) + aavShotsLit(nPlayer, eModeMars).Count
				If nShotNext > eShotRightLoop Then
					anMarsShot(nPlayer) = anMarsShot(nPlayer) - 1
					bMarsMoveLeft = True
				Else
					anMarsShot(nPlayer) = anMarsShot(nPlayer) + 1
				End If
			End If
			ModeMarsUpdate eShotNone, eSwitchNone, False
		End If
	End If

	' Stop timers other than ball save or moving shots if a ball is trapped
	' (More than 3 sec since any switch was hit and a flipper is held up)
	If (GameTime - nTimeAnySwitch >= 3000) And _
	((nTimeLowerLeftFlip > 0) Or (nTimeLowerRightFlip > 0) _
	or (nTimeUpperLeftFlip > 0) Or (nTimeUpperRightFlip > 0)) Then
		Exit Sub
	End If

	' Playfield multiplier
	If nTimeXPause > 0 Then
		nTimeXPause = nTimeXPause - TimerMode.Interval
		If nTimeXPause < 0 then nTimeXPause = 0
	Elseif fPlayfieldX > 1.01 Then
		If nTimeXCountdown <= 0 Then
			fPlayfieldX = Round(fPlayfieldX - 0.1, 1)
			If fPlayfieldX > 1.01 then
				nTimeXCountdown = nXCountdownInterval
			Else
				fPlayfieldX = 1
			End If
			UpdateLEDs fPlayfieldX
		Else
			nTimeXCountdown = nTimeXCountdown - TimerMode.Interval
		End If
	End If

	' Multiball grace period
	If nTimeMBallGraceLeft > 0 Then
		nTimeMBallGraceLeft = nTimeMBallGraceLeft - TimerMode.Interval
		If nTimeMBallGraceLeft <= 0 then
			nTimeMBallGraceLeft = 0
			If avModesRunning(nPlayer).Contains(eModeMultiball1) Then
				ModeMultiball1End
			End If
			If avModesRunning(nPlayer).Contains(eModeMultiball2) Then
				ModeMultiball2End
			End If
			If avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
				ModeMiniWizard1End False, False, eShotNone
			End If
			If avModesRunning(nPlayer).Contains(eModeImmolation) Then
				ModeMiniWizard2End False, False, eShotNone
			End If
			If avModesRunning(nPlayer).Contains(eModeSlurm) Then
				ModeSlurmEnd False, False, eShotNone
			End If
		End If
	End If

	' Combos
	For i = eShotLeftLane to eShotRightLoop
		If anComboTimer(i) > 0 Then
			anComboTimer(i) = anComboTimer(i) - TimerMode.interval
			If anComboTimer(i) < 1 then
				anComboTimer(i) = 0
			End If
		End If
	Next

	' timed modes
	for each i in anTimedModes
		if avModesRunning(nPlayer).Contains(i) Then
			aanModeTime(nPlayer, i) = aanModeTime(nPlayer, i) - TimerMode.interval
			If aanModeTime(nPlayer, i) < 1 Then
				If i = eModeReverseFlips Then
					PlaySound "buzzer"
				End If
				aanModeTime(nPlayer, i) = 0
				EndMode i, False, True, eShotNone
			End If
		End If
	next
End Sub

Sub SkillShotInit
	bSkillShotActive = True
	AddShotColor eShotSideLoop, eColorGreen
	AddShotColor eShotUpperScoop, eColorGreen
	AddShotColor eShotLeftRamp, eColorGreen
	AddShotColor eShotCenterLane, eColorGreen
End Sub

Sub SkillShotAward(nSkillshot)
	Dim sScore, oEvent

	Set oEvent = New EventItem
	oEvent.priority = ePrioSkillShot
	oEvent.duration = 2500
	oEvent.lightshow = eLightShowStrobeShort
	oEvent.maxQueueLength = 0
	If Not avSkillShotsHit(nPlayer).Contains(nSkillshot) Then
		Addscore SCORE_SKILLSHOT_UNIQUE
		sScore = FormatScore(SCORE_SKILLSHOT_UNIQUE * fPlayfieldX)
		oEvent.text = Array(sScore, "UNIQUE SKILL SHOT!")
		oEvent.pupTrigger = RoundRobinEvent("SkillShot")
		oEvent.duration = RoundRobinLength("SkillShot")
		oEventQueue.Add oEvent
'		DMDTimedText Array(sScore, "UNIQUE SKILL SHOT!"), 2500, ePrioSkillShot
	Else
		Addscore SCORE_SKILLSHOT_REPEAT
		sScore = FormatScore(SCORE_SKILLSHOT_REPEAT * fPlayfieldX)
		oEvent.text = Array(sScore, "SKILL SHOT!")
		oEvent.pupTrigger = RoundRobinEvent("SkillShot")
		oEvent.duration = RoundRobinLength("SkillShot")
		oEventQueue.Add oEvent
'		DMDTimedText Array(sScore, "SKILL SHOT!"), 2500, ePrioSkillShot
	End If
	avSkillShotsHit(nPlayer).Add nSkillshot
	SkillShotEnd
End Sub

Sub SkillShotEnd
	bSkillShotActive = False
	RemoveShotColor eShotSideLoop, eColorGreen
	RemoveShotColor eShotUpperScoop, eColorGreen
	RemoveShotColor eShotLeftRamp, eColorGreen
	RemoveShotColor eShotCenterLane, eColorGreen
End Sub 

Function getLeastRecentShots(nShots)
	Dim aIndices
	Dim nLowestTime
	Dim nLowestIndex
	Dim anShotTimeCopy(9)
	Dim temp
	Dim i, j
	aIndices = Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

	' create a copy of the array of shot times so that we can sort it without
	' affecting the global aanShotLastHit variable
	For i = 0 to 9
		anShotTimeCopy(i) = aanShotLastHit(nPlayer, i)
	Next

	' sort the enemy times and adjust the aIndices array after how the shot
	' times were sorted
	For i = 0 to 8
		nLowestTime = anShotTimeCopy(i)
		nLowestIndex = i
		For j = i + 1 to 8
			If anShotTimeCopy(j) < nLowestTime Then
				nLowestTime = anShotTimeCopy(j)
				nLowestIndex = j
			End If
		Next
		temp = anShotTimeCopy(i)
		anShotTimeCopy(i) = anShotTimeCopy(nLowestIndex)
		anShotTimeCopy(nLowestIndex) = temp
		temp = aIndices(i)
		aIndices(i) = aIndices(nLowestIndex)
		aIndices(nLowestIndex) = temp
	Next

	' truncate the array of indeces 
	ReDim Preserve aIndices(nShots - 1)

	getLeastRecentShots = aIndices
End Function

'*******************************************
' ZWIZ - Game logic: wizard modes
'*******************************************

Sub ModeMiniWizard1Init
	Dim oEvent, i

	for i = 0 to 9
		anMiniWizard1JPs(i) = eShotNone
	Next
	nMiniWizard1Videos = 0
	aavShotsLit(nPlayer, eModeCherryBomb).Clear
	RemoveShotColor eShotLowerScoop, eColorRainbow
		
	CommonModeInit eModeCherryBomb
	bAddBallAwarded = False
	KickerAutoPlunge.Enabled = True
	AddBalls 3
	nTimeBallSave = nTimeBallSave + nBallSaveMiniWizard1
	' Mark as 2nd attempt so that time bonus is not awarded
	aanModeAttempts(nPlayer, eModeCherryBomb) = 2
	ModeMiniWizard1Update eShotNone, eSwitchNone, False
End Sub

Function ModeMiniWizard1GetScore (nShot)
	Dim i, bSelectingJP, bValidShot

	Select Case aanModeShots(nPlayer, eModeCherryBomb)
		Case 0, 2, 5, 9, 14, 20, 27, 35, 44
			bSelectingJP = True
		Case Else
			bSelectingJP = False
	End Select

	ModeMiniWizard1GetScore = 0
	If bSelectingJP Then
		If nShot <> eShotLeftLane Then
			bValidShot = True
			For i = 0 to 8
				If anMiniWizard1JPs(i) = nShot Then
					bValidShot = False
					Exit For
				End If
			Next

			If bValidShot Then ModeMiniWizard1GetScore = SCORE_MINIWIZONE_BASE
		End If
	Else
		bValidShot = False
		If Not aavShotsLit(nPlayer, eModeCherryBomb).Contains(nShot) Then
			for i = 0 to 8
				If anMiniWizard1JPs(i) = nShot Then
					bValidShot = True
					Exit For
				End If
			Next
		End If

		If bValidShot Then ModeMiniWizard1GetScore = SCORE_MINIWIZONE_BASE * (i + 2)
	End If
End Function

Sub ModeMiniWizard1Update (nShot, nSwitch, bBlastUsed)
	Dim bUpdateLights, bValidShot, nHitShots, sPoints, bSelectingJP, i, oEvent
	Dim anColors(9), nIndex, bPlayVideo, nPupTrigger, nPupDuration

	Select Case aanModeShots(nPlayer, eModeCherryBomb)
		Case 0, 2, 5, 9, 14, 20, 27, 35, 44
			bSelectingJP = True
		Case Else
			bSelectingJP = False
	End Select
	nHitShots = 0
	For i = 0 to 9
		if eShotNone = anMiniWizard1JPs(i) Then
			Exit For
		Else
			nHitShots = nHitShots + 1
		End If
	Next

	bPlayVideo = True
	If Not oCurrentEvent is Nothing Then
		If oCurrentEvent.priority = ePrioJackpot Then bPlayVideo = False
	End If
	Select Case nMiniWizard1Videos
		Case 0
			nPupTrigger = 750
			nPupDuration = 7966
		Case 1
			nPupTrigger = 391
			nPupDuration = 6500
		Case 2
			nPupTrigger = 392
			nPupDuration = 7366
		Case 3
			nPupTrigger = 393
			nPupDuration = 7966
		Case 4
			nPupTrigger = 394
			nPupDuration = 7000
		Case 5
			nPupTrigger = 395
			nPupDuration = 5666
		Case 6
			nPupTrigger = 396
			nPupDuration = 7200
		Case 7
			nPupTrigger = 397
			nPupDuration = 7000
		Case 8
			nPupTrigger = 398
			nPupDuration = 6800
		Case 9
			nPupTrigger = 399
			nPupDuration = 5166
		Case 10
			nPupTrigger = 400
			nPupDuration = 5100
		Case 11
			nPupTrigger = 401
			nPupDuration = 7500
		Case 12
			nPupTrigger = 402
			nPupDuration = 7800
		Case 13
			nPupTrigger = 403
			nPupDuration = 6700
		Case 14
			nPupTrigger = 404
			nPupDuration = 6466
		Case 15
			nPupTrigger = 405
			nPupDuration = 5600
		Case 16
			nPupTrigger = 406
			nPupDuration = 6300
		Case 17
			nPupTrigger = 407
			nPupDuration = 5166
		Case 18
			nPupTrigger = 408
			nPupDuration = 4600
		Case 19
			nPupTrigger = 409
			nPupDuration = 6500
	End Select
	bUpdateLights = False
	If eShotNone = nShot Then
		bUpdateLights = True
	Elseif bSelectingJP Then
		If nShot <> eShotLeftLane Then
			bValidShot = True
			For i = 0 to nHitShots
				If anMiniWizard1JPs(i) = nShot Then
					bValidShot = False
					Exit For
				End If
			Next

			if bValidShot Then
				bUpdateLights = True
				sPoints = FormatScore(SCORE_MINIWIZONE_BASE * fPlayfieldX)
				anModeScore(eModeCherryBomb) = _
					anModeScore(eModeCherryBomb) + (SCORE_MINIWIZONE_BASE * fPlayfieldX)
				Addscore SCORE_MINIWIZONE_BASE
				anMiniWizard1JPs(nHitShots) = nShot
				aavShotsLit(nPlayer, eModeCherryBomb).Clear
				aanModeShots(nPlayer, eModeCherryBomb) = _
					aanModeShots(nPlayer, eModeCherryBomb) + 1
				If not bBlastUsed Then
					If bPlayVideo Then
						nMiniWizard1Videos = (nMiniWizard1Videos + 1) Mod 20
					End If
					Set oEvent = New EventItem
					oEvent.text = Array(sPoints, "CHAMPIONSHIP", "JACKPOT")
					oEvent.priority = ePrioJackpot
					oEvent.lightshow = eLightShowStrobeShort
					oEvent.duration = nPupTrigger
					oEvent.pupTrigger = nPupDuration
					oEvent.maxQueueLength = 0
					oEventQueue.Add oEvent
				End If
			End If
		End If
	Else
		bValidShot = False
		If Not aavShotsLit(nPlayer, eModeCherryBomb).Contains(nShot) Then
			for i = 0 to nHitShots
				If anMiniWizard1JPs(i) = nShot Then
					nIndex = i
					bValidShot = True
					Exit For
				End If
			Next
		End If

		if bValidShot Then
			bUpdateLights = True
			sPoints = FormatScore(SCORE_MINIWIZONE_BASE * fPlayfieldX * (nIndex + 2))
			Addscore SCORE_MINIWIZONE_BASE * (nIndex  + 2)
			anModeScore(eModeCherryBomb) = _
				anModeScore(eModeCherryBomb) + (fPlayfieldX * SCORE_MINIWIZONE_BASE * (nIndex + 2))
			aavShotsLit(nPlayer, eModeCherryBomb).add nShot
			aanModeShots(nPlayer, eModeCherryBomb) = _
				aanModeShots(nPlayer, eModeCherryBomb) + 1
			If not bBlastUsed Then
				If bPlayVideo Then
					nMiniWizard1Videos = (nMiniWizard1Videos + 1) Mod 20
				End If
				Set oEvent = New EventItem
				Select Case nIndex
					Case 1
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "TRIPLE JACKPOT")
					Case 2
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "QUADRUPLE JACKPOT")
					Case 3
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "QUINTUPLE JACKPOT")
					Case 4
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "SEXTUPLE JACKPOT")
					Case 5
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "SEPTUPLE JACKPOT")
					Case 6
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "OCTUPLE JACKPOT")
					Case 7
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "NONUPLE JACKPOT")
					Case 8
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "DECUPLE JACKPOT")
					Case Else
						oEvent.text = Array(sPoints, "CHAMPIONSHIP", "DOUBLE JACKPOT")
				End Select
				oEvent.priority = ePrioJackpot
				oEvent.lightshow = eLightShowStrobeShort
				oEvent.duration = nPupDuration
				oEvent.pupTrigger = nPupTrigger: DOF 189, DOFPulse
				oEvent.maxQueueLength = 0
				oEventQueue.Add oEvent
			End If
		End If
	End If

	If bUpdateLights Then
		For i = eShotLowerScoop to eShotRightLoop
			ClearShotColor i
		Next

		If nTimeMBallGraceLeft > 0 Then
			Exit Sub
		End If

		Select Case aanModeShots(nPlayer, eModeCherryBomb)
			Case 0, 2, 5, 9, 14, 20, 27, 35, 44
				bSelectingJP = True
			Case Else
				bSelectingJP = False
		End Select

		For i = 0 to 9
			anColors(i) = eColorNone
		Next

		For i = 0 to 8
			if anMiniWizard1JPs(i) <> eShotNone Then
				nIndex = anMiniWizard1JPs(i)
				if (not aavShotsLit(nPlayer, eModeCherryBomb).Contains(nIndex)) _
				or bSelectingJP Then
					anColors(nIndex) = i
				End If
			End If
		Next

		If bSelectingJP Then
			For i = eShotLowerScoop to eShotRightLoop
				If eColorNone = anColors(i) Then
					AddShotColor i, eColorWhite
				End If
			Next
		Else
			For i = eShotLowerScoop to eShotRightLoop
				If eColorNone <> anColors(i) Then
					AddShotColor i, anColors(i)
				End If
			Next
		End If
	End If
End Sub

Sub ModeMiniWizard1End (bLostByDrain, bLostByTime, nShot)
	Dim i
	For i = eShotLeftLane to eShotRightLoop
		ClearShotColor i
	Next

	CommonModeEnd eModeCherryBomb, bLostByDrain, bLostByTime, nShot
End Sub

Dim anWizard2ShotOrder, nWizard2Videos
anWizard2ShotOrder = Array(eShotUpperScoop, eShotCenterLane, eShotLeftRamp, _
	eShotRightLoop, eShotLowerScoop, eShotInlineDrops, eShotLeftLoop, _
	eShotSideLoop, eShotLeftLane)
Sub ModeMiniWizard2Init
	Dim oEvent, i, nBallsToAdd

	RemoveShotColor eShotLowerScoop, eColorRainbow
	for i = 0 to 9
		anMiniWizard1JPs(i) = eShotNone
	Next
	aavShotsLit(nPlayer, eModeImmolation).Clear
	for i = 0 to 2
		aavShotsLit(nPlayer, eModeImmolation).add anWizard2ShotOrder(i)
	Next
	nWizard2Videos = 0
		
	CommonModeInit eModeImmolation
	bAddBallAwarded = False
	KickerAutoPlunge.Enabled = True
	nBallsToAdd = 5 - CountPhysicalLocks
	If nBallsToAdd < 5 Then
	' Empty physical lock
		bResetInlines = True
		for i = 0 to 2
			DTDrop 6 + i
			Set aoBenderLockedBalls(i) = Nothing
		next
		vpmTimer.AddTimer 500, "bResetInlines = False '"
		TimerResetInlines.enabled = True
	End If
	AddBalls nBallsToAdd
	BIP = 6
	
	nTimeBallSave = nTimeBallSave + nBallSaveMiniWizard2
	' Mark as 2nd attempt so that time bonus is not awarded
	aanModeAttempts(nPlayer, eModeImmolation) = 2
	ModeMiniWizard2Update eShotNone, eSwitchNone, False
End Sub

Function ModeMiniWizard2GetScore (nShot)
	If eShotNone = nShot Then
		ModeMiniWizard2GetScore = 0
	Elseif eShotRightRamp = nShot Then
		ModeMiniWizard2GetScore = SCORE_MINIWIZTWO_BASE * BIP
	Elseif aavShotsLit(nPlayer, eModeImmolation).Contains(nShot) Then
		ModeMiniWizard2GetScore = SCORE_MINIWIZTWO_ADD
	Else
		ModeMiniWizard2GetScore = 0
	End If
End Function

Sub ModeMiniWizard2Update (nShot, nSwitch, bBlastUsed)
	Dim bUpdateLights, bValidShot, nLitShots, sPoints, i, oEvent
	Dim nPupTrigger, nPupDuration

	Select Case nWizard2Videos + 1
		Case 1
			nPupTrigger = 753
			nPupDuration = 7300
		Case 2
			nPupTrigger = 410
			nPupDuration = 7600
		Case 3
			nPupTrigger = 411
			nPupDuration = 6000
		Case 4
			nPupTrigger = 412
			nPupDuration = 7966
		Case 5
			nPupTrigger = 413
			nPupDuration = 6266
		Case 6
			nPupTrigger = 414
			nPupDuration = 6300
		Case 7
			nPupTrigger = 415
			nPupDuration = 6800
		Case 8
			nPupTrigger = 416
			nPupDuration = 5766
		Case 9
			nPupTrigger = 417
			nPupDuration = 6666
		Case 10
			nPupTrigger = 418
			nPupDuration = 5466
		Case 11
			nPupTrigger = 419
			nPupDuration = 7900
		Case 12
			nPupTrigger = 420
			nPupDuration = 5600
		Case 13
			nPupTrigger = 421
			nPupDuration = 7966
		Case 14
			nPupTrigger = 422
			nPupDuration = 7000
		Case 15
			nPupTrigger = 423
			nPupDuration = 5500
		Case 16
			nPupTrigger = 424
			nPupDuration = 6200
		Case 17
			nPupTrigger = 425
			nPupDuration = 5700
		Case 18
			nPupTrigger = 426
			nPupDuration = 5766
		Case 19
			nPupTrigger = 427
			nPupDuration = 7200
		Case 20
			nPupTrigger = 428
			nPupDuration = 6366
	End Select

	bUpdateLights = False
	If eShotNone = nShot Then
		bUpdateLights = True
	Else
		If eShotRightRamp = nShot Then
			bUpdateLights = True
			sPoints = FormatScore(SCORE_MINIWIZTWO_BASE * fPlayfieldX * BIP)
			anModeScore(eModeImmolation) = _
				anModeScore(eModeImmolation) + (SCORE_MINIWIZTWO_BASE * fPlayfieldX * BIP)
			Addscore SCORE_MINIWIZTWO_BASE * BIP
			If not bBlastUsed Then
				Set oEvent = New EventItem
				oEvent.text = Array(sPoints, "FEMINISTA", "JACKPOT")
				oEvent.priority = ePrioSuperJackpot
				oEvent.lightshow = eLightShowStrobeShort
				oEvent.duration = nPupDuration
				oEvent.pupTrigger = nPupTrigger: DOF 190, DOFPulse
				oEvent.interruptOngoing = True
				nWizard2Videos = (nWizard2Videos + 1) Mod 20
				oEventQueue.Add oEvent
			End If
		Elseif aavShotsLit(nPlayer, eModeImmolation).Contains(nShot) Then
			bUpdateLights = True
			sPoints = FormatScore(SCORE_MINIWIZTWO_ADD * fPlayfieldX)
			anModeScore(eModeImmolation) = _
				anModeScore(eModeImmolation) + (SCORE_MINIWIZTWO_ADD * fPlayfieldX)
			Addscore SCORE_MINIWIZTWO_ADD
			aavShotsLit(nPlayer, eModeImmolation).Remove nShot
			nLitShots = aavShotsLit(nPlayer, eModeImmolation).Count
			If 0 = nLitShots Then
				If aanModeShots(nPlayer, eModeImmolation) < 6 Then
					nTimeBallSave = nTimeBallSave + nBallSaveAddBall
					nTimeMBallGraceLeft = 0
					If BIP < 6 Then AddBalls 1
					aanModeShots(nPlayer, eModeImmolation) = _
						aanModeShots(nPlayer, eModeImmolation) + 1
					For i = 0 to (aanModeShots(nPlayer, eModeImmolation) + 2)
						aavShotsLit(nPlayer, eModeImmolation).add anWizard2ShotOrder(i)
					Next
				End If
			End If
			If not bBlastUsed Then
				Set oEvent = New EventItem
				If 0 = nLitShots Then
					oEvent.text = Array("FEMINISTA", "BALL ADDED")
				Elseif 1 = nLitShots Then
					oEvent.text = Array("FEMINISTA", nLitShots & " BLUE SHOT", "TO ADD A BALL")
				Else
					oEvent.text = Array("FEMINISTA", nLitShots & " BLUE SHOTS", "TO ADD A BALL")
				End If
				oEvent.priority = ePrioJackpot
				oEvent.lightshow = eLightShowMball1Short
				If oEventQueue.Size < 1 Then
					nWizard2Videos = (nWizard2Videos + 1) Mod 20
				End If
				oEvent.maxQueueLength = 0
				oEvent.duration = nPupDuration
				oEvent.pupTrigger = nPupTrigger: DOF 190, DOFPulse
				oEventQueue.Add oEvent
			End If
		End If
	End If

	If bUpdateLights Then
		for i = 0 to 9
			if i <> eShotRightRamp Then
				If aavShotsLit(nPlayer, eModeImmolation).Contains(i) _
				And nTimeMBallGraceLeft < 1 Then
					AddShotColor i, eColorBlue
				Else
					RemoveShotColor i, eColorBlue
				End If
			End If
		Next

		If nTimeMBallGraceLeft < 1 Then
			AddShotColor eShotRightRamp, eColorRainbow
		Else
			RemoveShotColor eShotRightRamp, eColorRainbow
		End If
	End If
End Sub

Sub ModeMiniWizard2End (bLostByDrain, bLostByTime, nShot)
	Dim i
	For i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorBlue
	Next
	RemoveShotColor eShotRightRamp, eColorRainbow

	CommonModeEnd eModeImmolation, bLostByDrain, bLostByTime, nShot
End Sub

Dim nSlurmVideos
Sub ModeSlurmInit
	Dim oEvent, i, nBallsToAdd

	RemoveShotColor eShotLowerScoop, eColorRainbow
	for i = 0 to 9
		anSlurmShots(i) = 0
	Next
	aavShotsLit(nPlayer, eModeSlurm).Clear
	nSlurmVideos = 0

	CommonModeInit eModeSlurm
	bAddBallAwarded = False
	KickerAutoPlunge.Enabled = True
	nBallsToAdd = 5 - CountPhysicalLocks
	If nBallsToAdd < 5 Then
	' Empty physical lock
		bResetInlines = True
		for i = 0 to 2
			DTDrop 6 + i
			Set aoBenderLockedBalls(i) = Nothing
		next
		vpmTimer.AddTimer 500, "bResetInlines = False '"
		TimerResetInlines.enabled = True
	End If
	AddBalls nBallsToAdd
	BIP = 6
	
	nTimeBallSave = nTimeBallSave + nBallSaveSlurm
	' Mark as 2nd attempt so that time bonus is not awarded
	aanModeAttempts(nPlayer, eModeSlurm) = 2
	ModeSlurmUpdate eShotNone, eSwitchNone, False
End Sub

Function ModeSlurmGetScore (nShot)
	Dim i, nSuperValue, nShotsComplete

	nSuperValue = 0
	nShotsComplete = 0
	For i = 0 to 9
		If anSlurmShots(i) >= 3 Then
			nSuperValue = nSuperValue + _
				SCORE_SLURM_SUPERJP + (SCORE_SLURM_ADD * nShotsComplete)
			nShotsComplete = nShotsComplete + 1
		End If
	Next

	ModeSlurmGetScore = 0
	If eShotSideLoop = nShot Then
		ModeSlurmGetScore = nSuperValue
	Else
		If nShot <= eShotRightLoop Then
			If anSlurmShots(nShot) < 3 Then
				ModeSlurmGetScore = SCORE_SLURM_BASE * (anSlurmShots(nShot) + 1)
			Else
				ModeSlurmGetScore = 0
			End If
		Else
			ModeSlurmGetScore = 0
		End If
	End If
End Function

Sub ModeSlurmUpdate (nShot, nSwitch, bBlastUsed)
	Dim bUpdateLights, sPoints, i, oEvent, nSuperValue, nShotsComplete
	Dim bPlayVideo, nPupTrigger, nPupDuration

	nSuperValue = 0
	nShotsComplete = 0
	For i = 0 to 9
		If anSlurmShots(i) >= 3 Then
			nSuperValue = nSuperValue + _
				SCORE_SLURM_SUPERJP + (SCORE_SLURM_ADD * nShotsComplete)
			nShotsComplete = nShotsComplete + 1
		End If
	Next

	Select Case 1 + nSlurmVideos
		Case 1
			nPupTrigger = 756
			nPupDuration = 9500
		Case 2
			nPupTrigger = 429
			nPupDuration = 8400
		Case 3
			nPupTrigger = 430
			nPupDuration = 10200
		Case 4
			nPupTrigger = 431
			nPupDuration = 7700
		Case 5
			nPupTrigger = 432
			nPupDuration = 5200
		Case 6
			nPupTrigger = 433
			nPupDuration = 5966
		Case 7
			nPupTrigger = 434
			nPupDuration = 7666
		Case 8
			nPupTrigger = 435
			nPupDuration = 6000
		Case 9
			nPupTrigger = 436
			nPupDuration = 11700
		Case 10
			nPupTrigger = 437
			nPupDuration = 8000
		Case 11
			nPupTrigger = 438
			nPupDuration = 7700
		Case 12
			nPupTrigger = 439
			nPupDuration = 7566
		Case 13
			nPupTrigger = 440
			nPupDuration = 10900
		Case 14
			nPupTrigger = 441
			nPupDuration = 5266
		Case 15
			nPupTrigger = 442
			nPupDuration = 5200
		Case 16
			nPupTrigger = 443
			nPupDuration = 7700
		Case 17
			nPupTrigger = 444
			nPupDuration = 8100
		Case 18
			nPupTrigger = 445
			nPupDuration = 11000
		Case 19
			nPupTrigger = 446
			nPupDuration = 4133
	End Select

	bUpdateLights = False
	If eShotNone = nShot Then
		bUpdateLights = True
	Else
		if eShotSideLoop = nShot Then
			If nShotsComplete > 0 Then
				bUpdateLights = True
				Addscore nSuperValue
				sPoints = FormatScore(nSuperValue * fPlayfieldX)
				anModeScore(eModeSlurm) = anModeScore(eModeSlurm) + _
					(fPlayfieldX * nSuperValue)
				If not bBlastUsed Then
					Set oEvent = New EventItem
					oEvent.text = Array(sPoints, "SLURM", "SUPER JACKPOT")
					oEvent.priority = ePrioJackpot
					oEvent.lightshow = eLightShowStrobeLong
					oEvent.duration = nPupDuration
					oEvent.pupTrigger = nPupTrigger: DOF 192, DOFPulse 
					oEvent.interruptOngoing = True
					oEventQueue.Add oEvent
					nSlurmVideos = (nSlurmVideos + 1) Mod 19
				End If
				For i = 0 to 9
					If anSlurmShots(i) >= 3 Then
						anSlurmShots(i) = 0
					End If
				Next
				nShotsComplete = 0
				nSuperValue = 0
			End If
		Else
			If anSlurmShots(nShot) < 3 Then
				bUpdateLights = True
				anSlurmShots(nShot) = anSlurmShots(nShot) + 1
				Addscore SCORE_SLURM_BASE * anSlurmShots(nShot)
				sPoints = FormatScore(SCORE_SLURM_BASE * anSlurmShots(nShot) * fPlayfieldX)
				anModeScore(eModeSlurm) = anModeScore(eModeSlurm) + _
					(fPlayfieldX * SCORE_SLURM_BASE * anSlurmShots(nShot))
				If anSlurmShots(nShot) >= 3 Then
					nSuperValue = nSuperValue + _
						SCORE_SLURM_SUPERJP + (SCORE_SLURM_ADD * nShotsComplete)
					nShotsComplete = nShotsComplete + 1
				End If
				If not bBlastUsed Then
					Set oEvent = New EventItem
					Select Case anSlurmShots(nShot)
						Case 1
							oEvent.text = Array(sPoints, "SLURM JACKPOT")
						Case 2
							oEvent.text = Array(sPoints, "SLURM", "DOUBLE JACKPOT")
						Case Else
							oEvent.text = Array(sPoints, "SLURM", "TRIPLE JACKPOT")
					End Select
					oEvent.priority = ePrioJackpot
					oEvent.lightshow = eLightShowStrobeShort
					oEvent.duration = nPupDuration
					oEvent.pupTrigger = nPupTrigger: DOF 191, DOFPulse
					if oEventQueue.Size < 1 Then
						nSlurmVideos = (nSlurmVideos + 1) Mod 19
					End if
					oEvent.maxQueueLength = 0
					oEventQueue.Add oEvent
				End If
			End If
		End If
	End If

	If bUpdateLights Then
		For i = eShotLeftLane to eShotRightLoop
			ClearShotColor i
		Next

		If nTimeMBallGraceLeft > 0 Then Exit Sub

		For i = 0 to 9
			If eShotSideLoop = i Then
				If nShotsComplete > 0 Then
					AddShotColor eShotSideLoop, eColorRainbow
				End If
			Else
				If 0 = anSlurmShots(i) Then
					AddShotColor i, eColorRed
				Elseif 1 = anSlurmShots(i) Then
					AddShotColor i, eColorYellow
				Elseif 2 = anSlurmShots(i) Then
					AddShotColor i, eColorGreen
				End If
			End If
		Next
	End If
End Sub

Sub ModeSlurmEnd (bLostByDrain, bLostByTime, nShot)
	Dim i
	For i = eShotLeftLane to eShotRightLoop
		ClearShotColor i
	Next

	CommonModeEnd eModeSlurm, bLostByDrain, bLostByTime, nShot
	avModesCompleted(nPlayer).Clear
	avModesStarted(nPlayer).Clear
	For i = 0 to 8
		aanModeAttempts(nPlayer, i) = 0
		aanModeShots(nPlayer, i) = 0
	Next
End Sub

'*******************************************
' ZMBL - Game logic: multiballs
'*******************************************

Sub AddBalls(nBalls)
	Dim nBallsPhysLocked
	nBallsPhysLocked = CountPhysicalLocks
	If BIP + nBalls + nBallsToFeed + nBallsPhysLocked <= 6 Then
		nBallsToFeed = nBallsToFeed + nBalls
		BIP = BIP + nBalls
		UpdateTrough
	ElseIf BIP + nBallsPhysLocked + nBallsToFeed <= 6 Then
		nBallsToFeed = 6 - (BIP + nBallsPhysLocked + nBallsToFeed)
		BIP = 6 - nBallsPhysLocked
		If nBallsToFeed > 0 Then UpdateTrough
	End If
End Sub

Function CanAdvanceMultiballs
	If avModesRunning(nPlayer).Contains(eModeMultiball1) Then
		CanAdvanceMultiballs = False
	Elseif avModesRunning(nPlayer).Contains(eModeMultiball2) Then
		CanAdvanceMultiballs = False
	Elseif avModesRunning(nPlayer).Contains(eModeImmolation) Then
		CanAdvanceMultiballs = False
	Elseif avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
		CanAdvanceMultiballs = False
	Elseif avModesRunning(nPlayer).Contains(eModeSlurm) Then
		CanAdvanceMultiballs = False
	Else
		CanAdvanceMultiballs = True
	End If
End Function

Sub ModeMultiball1Advance(nShot)
	Dim i, nLock, bUpdateLock, oEvent, nPupTrigger, nPupDuration

	bUpdateLock = False
	If ((eShotUpperScoop = nShot) Or (eShotLowerScoop = nShot)) _
	And (Not abMball1LoopLeft(nPlayer)) And (Not abMball1LoopRight(nPlayer)) Then
		bUpdateLock = True
		nLock = anMBall1Locks(nPlayer) + 1
		anMBall1Locks(nPlayer) = nLock
		If eShotLowerScoop <> nShot Then
			Set oEvent = New EventItem
			oEvent.text = Array("BALL " & nLock & " LOCKED")
			oEvent.priority = ePrioMballLock
			Select Case nLock
				Case 1
					nPupTrigger = 762
					nPupDuration = 4800
				Case 2
					nPupTrigger = 449
					nPupDuration = 1792
				Case 3
					nPupTrigger = 763
					nPupDuration = 3000
			End Select
			oEvent.duration = nPupDuration
			oEvent.pupTrigger = nPupTrigger
			oEvent.lightshow = eLightShowMball1Long
			oEventQueue.Add oEvent
	'		DMDTimedText Array("BALL " & nLock & " LOCKED", "UNTITLED MULTIBALL"), 2500, ePrioMballLock
			nTimeDelayVUK = nPupDuration
		End If
		If nLock >= 3 Then
			anMball1Played(nPlayer) = anMball1Played(nPlayer) + 1
			Addscore SCORE_MBALL1_START
		Else
			Addscore SCORE_MBALL1_LOCK
		End If
	Elseif abMball1LoopLeft(nPlayer) And (eShotLeftLoop = nShot) Then
		Addscore SCORE_MBALL1_LIGHT_LOCK
		bUpdateLock = True
	Elseif abMball1LoopRight(nPlayer) And (eShotRightLoop = nShot) Then
		Addscore SCORE_MBALL1_LIGHT_LOCK
		bUpdateLock = True
	Elseif eShotLowerScoop = nShot Then
		Addscore SCORE_MBALL1_LIGHT_LOCK
		bUpdateLock = True
	End If

	nLock = anMBall1Locks(nPlayer) + 1
	Select Case nLock
		Case 1
			nPupTrigger = 761
			nPupDuration = 3433
		Case 2
			nPupTrigger = 448
			nPupDuration = 4500
		Case Else
			nPupTrigger = 450
			nPupDuration = 4833
	End Select
	If bUpdateLock Then
		Select Case anMball1Played(nPlayer)
			Case 0
				If (Not abMball1LoopLeft(nPlayer)) And (Not abMball1LoopRight(nPlayer)) Then
					abMball1LoopLeft(nPlayer) = True
					abMball1LoopRight(nPlayer) = True
				Else
					If eShotLowerScoop <> nShot Then
						Set oEvent = New EventItem
						oEvent.text = Array("LOCK " & nLock & " LIT")
						oEvent.priority = ePrioMballLock
						oEvent.duration = nPupDuration
						oEvent.pupTrigger = nPupTrigger
						oEvent.lightshow = eLightShowMball1Short
						oEventQueue.Add oEvent
'						DMDTimedText Array("LOCK " & nLock & " LIT", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
					End If
					abMball1LoopLeft(nPlayer) = False
					abMball1LoopRight(nPlayer) = False
				End If
			Case 1
				If (Not abMball1LoopLeft(nPlayer)) And (Not abMball1LoopRight(nPlayer)) Then
					if 1 = anMBall1Locks(nPlayer) Then
						abMball1LoopLeft(nPlayer) = False
						abMball1LoopRight(nPlayer) = True
					Else
						abMball1LoopLeft(nPlayer) = True
						abMball1LoopRight(nPlayer) = False
					End If
				Else
					If eShotLowerScoop <> nShot Then
						Set oEvent = New EventItem
						oEvent.text = Array("LOCK " & nLock & " LIT")
						oEvent.priority = ePrioMballLock
						oEvent.lightshow = eLightShowMball1Short
						oEvent.duration = nPupDuration
						oEvent.pupTrigger = nPupTrigger
						oEventQueue.Add oEvent
'					DMDTimedText Array("LOCK " & nLock & " LIT", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
					End If
					abMball1LoopLeft(nPlayer) = False
					abMball1LoopRight(nPlayer) = False
				End If
			Case 2
				If (Not abMball1LoopLeft(nPlayer)) And (Not abMball1LoopRight(nPlayer)) Then
					abMball1LoopLeft(nPlayer) = True
					abMball1LoopRight(nPlayer) = True
				Elseif eShotLowerScoop = nShot Then
					If abMball1LoopLeft(nPlayer) Then
						abMball1LoopLeft(nPlayer) = False
					Else
						abMball1LoopRight(nPlayer) = False
					End If
				Elseif eShotLeftLoop = nShot Then
					Set oEvent = New EventItem
					oEvent.priority = ePrioMballLock
					oEvent.duration = nPupDuration
					oEvent.pupTrigger = nPupTrigger
					oEvent.lightshow = eLightShowMball1Short
					abMball1LoopLeft(nPlayer) = False
					If Not abMball1LoopRight(nPlayer) Then
						oEvent.text = Array("LOCK " & nLock & " LIT")
						oEventQueue.Add oEvent
'						DMDTimedText Array("LOCK " & nLock & " LIT", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
					Else
						oEvent.text = Array("HIT THE RIGHT LOOP", "TO LIGHT LOCK")
						oEventQueue.Add oEvent
'						DMDTimedText Array("HIT THE RIGHT LOOP", "TO LIGHT LOCK FOR", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
					End If
				Elseif eShotRightLoop = nShot Then
					abMball1LoopRight(nPlayer) = False
					Set oEvent = New EventItem
					oEvent.priority = ePrioMballLock
					oEvent.duration = nPupDuration
					oEvent.pupTrigger = nPupTrigger
					oEvent.lightshow = eLightShowMball1Short
					If Not abMball1LoopLeft(nPlayer) Then
						oEvent.text = Array("LOCK " & nLock & " LIT")
						oEventQueue.Add oEvent
'						DMDTimedText Array("LOCK " & nLock & " LIT", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
					Else
						oEvent.text = Array("HIT THE LEFT LOOP", "TO LIGHT LOCK")
						oEventQueue.Add oEvent
'						DMDTimedText Array("HIT THE LEFT LOOP", "TO LIGHT LOCK FOR", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
					End If
				End If
			Case Else
				If (Not abMball1LoopLeft(nPlayer)) And (Not abMball1LoopRight(nPlayer)) Then
					abMball1LoopLeft(nPlayer) = True
					abMball1LoopRight(nPlayer) = False
				Elseif eShotLowerScoop = nShot Then
					If abMball1LoopLeft(nPlayer) Then
						abMball1LoopLeft(nPlayer) = False
						abMball1LoopRight(nPlayer) = True
					Else
						abMball1LoopRight(nPlayer) = False
					End If
				Elseif eShotLeftLoop = nShot Then
					abMball1LoopLeft(nPlayer) = False
					abMball1LoopRight(nPlayer) = True
					Set oEvent = New EventItem
					oEvent.text = Array("HIT THE RIGHT LOOP", "TO LIGHT LOCK")
					oEvent.priority = ePrioMballLock
					oEvent.duration = nPupDuration
					oEvent.pupTrigger = nPupTrigger
					oEvent.lightshow = eLightShowMball1Short
					oEventQueue.Add oEvent
'					DMDTimedText Array("HIT THE RIGHT LOOP", "TO LIGHT LOCK FOR", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
				Elseif eShotRightLoop = nShot Then
					abMball1LoopRight(nPlayer) = False
					Set oEvent = New EventItem
					oEvent.text = Array("LOCK " & nLock & " LIT")
					oEvent.priority = ePrioMballLock
					oEvent.duration = nPupDuration
					oEvent.pupTrigger = nPupTrigger
					oEvent.lightshow = eLightShowMball1Short
					oEventQueue.Add oEvent
'					DMDTimedText Array("LOCK " & nLock & " LIT", "UNTITLED MULTIBALL"), 2000, ePrioMballLock
				End If
		End Select
		If abMball1LoopLeft(nPlayer) Then
			cLightMball2LiteL.state = LightStateOn
		Else
			cLightMball2LiteL.state = LightStateOff
		End If
		If abMball1LoopRight(nPlayer) Then
			cLightMball2LiteR.state = LightStateOn
		Else
			cLightMball2LiteR.state = LightStateOff
		End If
	End If
End Sub

Sub ModeMultiball1Init
	DOF 160,DOFOn
	anMBall1Locks(nPlayer) = 0
	RemoveShotColor eShotLowerScoop, eColorRainbow
	avModesRunning(nPlayer).add eModeMultiball1
	PlayModeMusic
	anMball1Jackpots(0) = eShotLeftRamp
	anMball1Jackpots(1) = eShotRightRamp
	bAddBallAwarded = False
	ModeMultiball1Update eShotNone, eSwitchNone, False
	KickerAutoPlunge.Enabled = True
	AddBalls 2
	nTimeBallSave = nTimeBallSave + nBallSaveMball2
End Sub

Function ModeMultiball1GetScore(nShot)
	Dim i
	ModeMultiball1GetScore = 0
	If nShot = eShotSideLoop And anMball1Jackpots(0) = eShotSideLoop _
	And anMball1Jackpots(1) = eShotSideLoop Then
		ModeMultiball1GetScore = SCORE_MBALL1_SUPERJP * 2
	Else
		For Each i in anMball1Jackpots
			If i = nShot And eShotSideLoop = nShot Then
				ModeMultiball1GetScore = SCORE_MBALL1_SUPERJP
			Elseif i = nShot Then
				ModeMultiball1GetScore = SCORE_MBALL1_JACKPOT
			End If
		Next
	End If
End Function

Sub ModeMultiball1Update (nShot, nSwitch, bBlastUsed)
	Dim bUpdateLights, nHitShots, sPoints, abMoveShot, i, oEvent

	abMoveShot = Array(False, False)
	bUpdateLights = False
	if nShot <> eShotNone Then
		nHitShots = 0
		' Check special case: double super jackpot
		If nShot = eShotSideLoop And anMball1Jackpots(0) = eShotSideLoop _
		And anMball1Jackpots(1) = eShotSideLoop Then
			sPoints = FormatScore(SCORE_MBALL1_SUPERJP * 2 * fPlayfieldX)
			Addscore SCORE_MBALL1_SUPERJP * 2
			If not bBlastUsed Then
				Set oEvent = New EventItem
				oEvent.text = Array(sPoints, "DOUBLE SUPER JACKPOT")
				oEvent.priority = ePrioSuperJackpot
				oEvent.duration = 6100
				oEvent.interruptOngoing = True
				oEvent.pupTrigger = 765: DOF 194, DOFPulse
				oEvent.lightshow = eLightShowMball1Long
				oEventQueue.Add oEvent
'				DMDTimedText Array(sPoints, "UNTITLED MULTIBALL", "DOUBLE SUPER JACKPOT"), _
'					3000, ePrioSuperJackpot
			End If
			abMoveShot(0) = True
			abMoveShot(1) = True
		Else
			For i = 0 to 1
				If anMball1Jackpots(i) = nShot And eShotSideLoop = nShot Then
					abMoveShot(i) = True
					sPoints = FormatScore(SCORE_MBALL1_SUPERJP * fPlayfieldX)
					Addscore SCORE_MBALL1_SUPERJP
					If not bBlastUsed Then
						Set oEvent = New EventItem
						oEvent.text = Array(sPoints, "SUPER JACKPOT")
						oEvent.priority = ePrioSuperJackpot
						oEvent.duration = 6100
						oEvent.lightshow = eLightShowMball1Long
						oEvent.interruptOngoing = True
						oEvent.pupTrigger = 765: DOF 194, DOFPulse
						oEventQueue.Add oEvent
'						DMDTimedText Array(sPoints, "UNTITLED MULTIBALL", "SUPER JACKPOT"), _
'							3000, ePrioSuperJackpot
					End If
				Elseif anMball1Jackpots(i) = nShot Then
					abMoveShot(i) = True
					sPoints = FormatScore(SCORE_MBALL1_JACKPOT * fPlayfieldX)
					Addscore SCORE_MBALL1_JACKPOT
					If not bBlastUsed Then
						Set oEvent = New EventItem
						oEvent.text = Array(sPoints, "JACKPOT")
						oEvent.priority = ePrioJackpot
						oEvent.lightshow = eLightShowMball1Short
						oEvent.duration = 2300
						oEvent.pupTrigger = 764: DOF 193, DOFPulse
						oEventQueue.Add oEvent
'						DMDTimedText Array(sPoints, "UNTITLED MULTIBALL", "JACKPOT"), _
'							2500, ePrioJackpot
					End If
				End If
			Next
		End If
	Elseif eSwitchNone = nSwitch Then
		' If both shot and switch are none, awlways update the lights
		bUpdateLights = True
	End If

	' Move jackpots if either are hit
	If abMoveShot(0) Then
		bUpdateLights = True
		If eShotLeftRamp = anMball1Jackpots(0) Then
			anMball1Jackpots(0) = eShotLowerScoop
		ElseIf eShotLowerScoop = anMball1Jackpots(0) Then
			anMball1Jackpots(0) = eShotLeftLoop
		ElseIf eShotLeftLoop = anMball1Jackpots(0) Then
			anMball1Jackpots(0) = eShotSideLoop
		Else
			anMball1Jackpots(0) = eShotLeftRamp
		End If
	End If
	If abMoveShot(1) Then
		bUpdateLights = True
		If eShotRightRamp = anMball1Jackpots(1) Then
			anMball1Jackpots(1) = eShotUpperScoop
		ElseIf eShotUpperScoop = anMball1Jackpots(1) Then
			anMball1Jackpots(1) = eShotRightLoop
		ElseIf eShotRightLoop = anMball1Jackpots(1) Then
			anMball1Jackpots(1) = eShotSideLoop
		Else
			anMball1Jackpots(1) = eShotRightRamp
		End If
	End If

	' Update arrows
	If bUpdateLights Then
		for i = eShotLeftLane to eShotRightLoop
			RemoveShotColor i, eColorGreen
		Next

		If 0 = nTimeMBallGraceLeft Then
			For i = eShotLeftLane to eShotRightLoop
				If i = anMball1Jackpots(0) or i = anMball1Jackpots(1) Then
					AddShotColor i, eColorGreen
				End If
			Next
		End If
	End If
End Sub

Sub ModeMultiball1End
	Dim i
	DOF 160,DOFOff
	for i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorGreen
	Next

	KickerAutoPlunge.Enabled = False
	avModesRunning(nPlayer).Remove(eModeMultiball1)
	PlayModeMusic
End Sub

Function CountPhysicalLocks()
	Dim i, nLocks
	nLocks = 0
	for i = 0 to 2
		if Not (aoBenderLockedBalls(i) is Nothing) then nLocks = nLocks + 1
	next
	CountPhysicalLocks = nLocks
End Function

Function GetLockPhysicalState()
	Dim nLocks
	nLocks = CountPhysicalLocks
	If 0 = nLocks Then
		If Not DTIsDropped(6) Then
			' State 0 - 0 balls locked, all targets raised
			GetLockPhysicalState = 0
			' Fix impossible state by raising all targets behind the lowest raised target
			If DTIsDropped(7) Then SolDT7 True
			If DTIsDropped(8) Then SolDT8 True
		Elseif Not DTIsDropped(7) Then
			' State 1 - 0 balls locked, mid and upper targets raised
			GetLockPhysicalState = 1
			' Fix impossible state by raising all targets behind the lowest raised target
			If DTIsDropped(8) Then SolDT8 True
		Elseif Not DTIsDropped(8) Then
			' State 2 - 0 balls locked, upper target raised
			GetLockPhysicalState = 2
		Else
			' State 3 - 0 balls locked, no targets raised
			GetLockPhysicalState = 3
		End If
	Elseif Not (aoBenderLockedBalls(0) is Nothing) Then
		' A ball locked in the lower slot is always "release imminent" state
		' Any impossible states will be fixed by the release
		GetLockPhysicalState = 9
	Elseif 1 = nLocks Then
		If Not (aoBenderLockedBalls(1) is Nothing) Then
			' State 4 - ball behind mid target, only middle target is raised
			GetLockPhysicalState = 4
			' Fix impossible state: Only middle target should be raised
			bResetInlines = True
			If Not DTIsDropped(6) Then DTDrop 6
			If Not DTIsDropped(8) Then DTDrop 8
			vpmTimer.AddTimer 500, "bResetInlines = False '"
		Elseif Not DTIsDropped(7) Then
			' State 5 - ball behind upper target, upper and middle targets are raised
			GetLockPhysicalState = 5
			' Fix impossible state: Lower target should not be raised
			bResetInlines = True
			If Not DTIsDropped(6) Then DTDrop 6
			vpmTimer.AddTimer 500, "bResetInlines = False '"
		Else
			' State 6 - ball behind upper target, only upper target is raised
			GetLockPhysicalState = 6
			' Fix impossible state: Lower target should not be raised
			bResetInlines = True
			If Not DTIsDropped(6) Then DTDrop 6
			vpmTimer.AddTimer 500, "bResetInlines = False '"
		End If
	Elseif Not DTIsDropped(6) Then
		' State 7 - balls behind mid and upper targets, lower target is raised
		GetLockPhysicalState = 7
	Else
		' State 8 - balls behind mid and upper targets, lower target is down
		GetLockPhysicalState = 8
	End If
End Function

Sub LockBallVirtual
	Dim oEvent
	Set oEvent = New EventItem
	oEvent.priority = ePrioMballLock
	oEvent.duration = 2000
	oEvent.lightshow = eLightShowStrobeShort

	If 0 = anMball2Played(nPlayer) Then
		Select Case anMBall2Locks(nPlayer)
			Case 0, 1, 2, 3
				oEvent.pupTrigger = 769
				oEvent.text = "BALL 1 LOCKED"
				oEvent.duration = 6700
'				DMDTimedText "BALL 1 LOCKED", 2500, ePrioMballLock
			Case 4, 5
				oEvent.pupTrigger = 771
				oEvent.text = "BALL 2 LOCKED"
				oEvent.duration = 5400
'				DMDTimedText "BALL 2 LOCKED", 2500, ePrioMballLock
			Case Else
				oEvent.pupTrigger = 773
				oEvent.text = "BALL 3 LOCKED"
				oEvent.priority = ePrioMballStart
				nModePending = eModeMultiball2
'				DMDTimedText "BALL 3 LOCKED", 2500, ePrioMballLock
		End Select
	Else
		Select Case anMBall2Locks(nPlayer)
			Case 0, 1, 2, 3
				oEvent.pupTrigger = 768
				oEvent.text = "LOCK 1 LIT"
				oEvent.duration = 6000
'				DMDTimedText "LOCK 1 LIT", 2500, ePrioMballLock
			Case 4
				oEvent.pupTrigger = 769
				oEvent.text = "BALL 1 LOCKED"
				oEvent.duration = 6700
'				DMDTimedText "BALL 2 LOCKED", 2500, ePrioMballLock
			Case 5
				oEvent.pupTrigger = 770
				oEvent.text = "LOCK 2 LIT"
				oEvent.duration = 9300
'				DMDTimedText "LOCK 2 LIT", 2500, ePrioMballLock
			Case 6
				oEvent.pupTrigger = 771
				oEvent.text = "BALL 2 LOCKED"
				oEvent.duration = 5400
'				DMDTimedText "BALL 2 LOCKED", 2500, ePrioMballLock
			Case 7
				oEvent.pupTrigger = 772
				oEvent.text = "LOCK 3 LIT"
				oEvent.duration = 5300
'				DMDTimedText "LOCK 3 LIT", 2500, ePrioMballLock
			Case Else
				oEvent.pupTrigger = 773
				oEvent.text = "BALL 3 LOCKED"
				oEvent.priority = ePrioMballStart
				nModePending = eModeMultiball2
'				DMDTimedText "BALL 3 LOCKED", 2500, ePrioMballLock
		End Select
	End If
	oEventQueue.Add oEvent
	SolDT6 True
	nTimeReleaseLock = 2500
	TimerLock.Enabled = True
End Sub

Sub SetLockForNewPlayer
	Dim nLocks, i, bRaised

	nLocks = CountPhysicalLocks
	bResetInlines = True
	bRaised = False
	if 0 = nLocks Then
		for i = 0 to 2
			if anMBall2Locks(nPlayer) <= i Then
				bRaised = True
				DTRaise 6 + i
			else
				DTDrop 6 + i
			end if
		next
	Else
		for i = 0 to 2
			if Not (aoBenderLockedBalls(i) is Nothing) then exit for
			if anInlineStateGoals(anMBall2Locks(nPlayer)) And aPowersOfTwo(i) Then
				bRaised = True
				DTRaise 6 + i
			else
				DTDrop 6 + i
			end if
		next
		'Fix impossible states
		vpmTimer.AddTimer 400, "GetLockPhysicalState '"
	End If
	If bRaised Then RandomSoundDropTargetReset sw2p
	vpmTimer.AddTimer 500, "bResetInlines = False '"
End Sub

Sub TimerLock_Timer
	Dim oEvent

	nTimeReleaseLock = nTimeReleaseLock - TimerLock.Interval
	If nTimeReleaseLock <= 0 Then
		If 0 = oEventQueue.Size Then
			nTimeReleaseLock = 0
		Else
			Set oEvent = oEventQueue.Peek
			If eShotInlineDrops = oEvent.holdBallAt Then
				' extend delay until the next event in the queue is handled
				nTimeReleaseLock = 1
			Else
				nTimeReleaseLock = 0
			End If
		End If
	End If

	If 0 = nTimeReleaseLock Then
		If 9 = anMBall2Locks(nPlayer) Then
			ReleaseMball2
		Else
			anMBall2Locks(nPlayer) = anMBall2Locks(nPlayer) + 1
			If 0 = anMball2Played(nPlayer) And 5 = anMBall2Locks(nPlayer) Then
				anMBall2Locks(nPlayer) = 6
			End If
			DTDrop 6
		End If
		TimerLock.Enabled = False
	End If
End Sub

Sub ReleaseMball2
	Dim i, nBallsReleased

	DOF 161,DOFOn
	nBallsReleased = 0
	bResetInlines = True
	for i = 0 to 2
		DTDrop 6 + i
		if Not aoBenderLockedBalls(i) is Nothing Then
			nBallsReleased = nBallsReleased + 1
			Set aoBenderLockedBalls(i) = Nothing
		End If
	next
	anMball2Played(nPlayer) = anMball2Played(nPlayer) + 1
	If anMball2Played(nPlayer) >= 2 Then
		anMBall2Locks(nPlayer) = 0
	Else
		anMBall2Locks(nPlayer) = 3
	End If
	vpmTimer.AddTimer 500, "bResetInlines = False '"
	TimerResetInlines.enabled = True
	' The current ball in play is always released
	BIP = BIP + (nBallsReleased - 1)
	If nBallsReleased < 3 Then
		AddBalls 3 - nBallsReleased
	End If
	avModesRunning(nPlayer).add eModeMultiball2
	nModePending = eModeNone
	KickerAutoPlunge.Enabled = True
	ModeMultiball2Init
End Sub

Sub ModeMultiball2Init
	PlayModeMusic
	RemoveShotColor eShotLowerScoop, eColorRainbow
	aavShotsLit(nPlayer, eModeMultiball2).add eShotLeftLane
	aavShotsLit(nPlayer, eModeMultiball2).add eShotLowerScoop
	aavShotsLit(nPlayer, eModeMultiball2).add eShotSideLoop
	aavShotsLit(nPlayer, eModeMultiball2).add eShotLeftRamp
	aavShotsLit(nPlayer, eModeMultiball2).add eShotCenterLane
	aavShotsLit(nPlayer, eModeMultiball2).add eShotRightRamp
	aavShotsLit(nPlayer, eModeMultiball2).add eShotRightLoop
	ModeMultiball2Update eShotNone, eSwitchNone, False
	bAddBallAwarded = False
	nTimeBallSave = nTimeBallSave + nBallSaveMball2
End Sub

Function ModeMultiball2GetScore(nShot)
	Dim i
	ModeMultiball2GetScore = 0
	If eShotInlineDrops = nShot Then
		If TimerResetInlines.Enabled Then
			ModeMultiball2GetScore = 0
		Elseif Not DTIsDropped(6) Then
			ModeMultiball2GetScore = SCORE_BENDER_LIGHT_LOCK
		Elseif Not DTIsDropped(7) Then
			ModeMultiball2GetScore = SCORE_BENDER_LIGHT_LOCK
		Elseif Not DTIsDropped(8) Then
			ModeMultiball2GetScore = SCORE_BENDER_LIGHT_LOCK
		Elseif aavShotsLit(nPlayer, eModeMultiball2).Contains(eShotInlineDrops) Then
			ModeMultiball2GetScore = SCORE_BENDER_SUPERJP
		End If
	Elseif nShot <> eSwitchNone Then
		For Each i in anBenderJackpotShots
			If i = nShot And aavShotsLit(nPlayer, eModeMultiball2).Contains(i) Then
				ModeMultiball2GetScore = SCORE_BENDER_JACKPOT
			End If
		Next
		If eShotLeftLoop = nShot _
		And aavShotsLit(nPlayer, eModeMultiball2).Contains(eShotLeftLoop) Then
			ModeMultiball2GetScore = SCORE_BENDER_RELIGHT
		End If
	End if
End Function

Sub ModeMultiball2Update (nShot, nSwitch, bBlastUsed)
	Dim bUpdateLights, nHitShots, sPoints, i, oEvent

	bUpdateLights = False
	If nSwitch <> eSwitchNone Then
		If Not TimerResetInlines.Enabled Then
			Select Case nSwitch
				Case eSwitchInlineLower
					bUpdateLights = True
					If not bBlastUsed Then
						Set oEvent = New EventItem
						oEvent.text = Array("2 MORE HITS", "TO LIGHT BENDER", "SUPER JACKPOT")
						oEvent.priority = ePrioJackpot
						oEvent.duration = 2000
						oEvent.pupTrigger = 774
						oEvent.lightshow = eLightShowStrobeShort
						oEventQueue.Add oEvent
'						DMDTimedText Array("2 MORE HITS", "TO LIGHT BENDER", "SUPER JACKPOT"), _
'							2000, ePrioJackpot
					End If
					Addscore SCORE_BENDER_LIGHT_LOCK
				Case eSwitchInlineMiddle
					bUpdateLights = True
					If not bBlastUsed Then
						Set oEvent = New EventItem
						oEvent.text = Array("1 MORE HIT", "TO LIGHT BENDER", "SUPER JACKPOT")
						oEvent.priority = ePrioJackpot
						oEvent.duration = 2000
						oEvent.pupTrigger = 774
						oEvent.lightshow = eLightShowStrobeShort
						oEventQueue.Add oEvent
'						DMDTimedText Array("1 MORE HIT", "TO LIGHT BENDER", "SUPER JACKPOT"), _
'							2000, ePrioJackpot
					End If
					Addscore SCORE_BENDER_LIGHT_LOCK
				Case eSwitchInlineUpper
					bUpdateLights = True
					If not bBlastUsed Then
						Set oEvent = New EventItem
						oEvent.text = Array("SUPER JACKPOT LIT", "HIT THE END OF", "THE DROP TARGET LANE")
						oEvent.priority = ePrioJackpot
						oEvent.duration = 2000
						oEvent.pupTrigger = 774
						oEvent.lightshow = eLightShowStrobeShort
						oEventQueue.Add oEvent
'						DMDTimedText Array("SUPER JACKPOT LIT", "HIT THE END OF", "THE DROP TARGET LANE"), _
'							2000, ePrioJackpot
					End If
					Addscore SCORE_BENDER_LIGHT_LOCK
					aavShotsLit(nPlayer, eModeMultiball2).add eShotInlineDrops
				Case eSwitchInlineEnd
					bUpdateLights = True
					sPoints = FormatScore(SCORE_BENDER_SUPERJP * fPlayfieldX)
					Addscore SCORE_BENDER_SUPERJP
					PlaySound "bender-jackpot"
					If not bBlastUsed Then
						Set oEvent = New EventItem
						oEvent.text = Array(sPoints, "BENDER SUPER JACKPOT")
						oEvent.priority = ePrioSuperJackpot
						oEvent.duration = 3000
						oEvent.interruptOngoing = True
						oEvent.pupTrigger = 775
						oEvent.lightshow = eLightShowStrobeLong
						oEventQueue.Add oEvent
'						DMDTimedText Array(sPoints, "BENDER SUPER JACKPOT"), _
'							4000, ePrioSuperJackpot
					End If
					aavShotsLit(nPlayer, eModeMultiball2).Remove eShotInlineDrops
					TimerResetInlines.Enabled = True
			End Select
		End If
	Elseif nShot <> eShotNone Then
		nHitShots = 0
		For Each i in anBenderJackpotShots
			If aavShotsLit(nPlayer, eModeMultiball2).Contains(i) Then
				nHitShots = nHitShots + 1
				If i = nShot Then
					bUpdateLights = True
					sPoints = FormatScore(SCORE_BENDER_JACKPOT * fPlayfieldX)
					Addscore SCORE_BENDER_JACKPOT
					PlaySound "bender-jackpot"
					If not bBlastUsed Then
						Set oEvent = New EventItem
						oEvent.text = Array(sPoints, "BENDER JACKPOT", "RELIGHT AT LEFT LOOP")
						oEvent.priority = ePrioJackpot
						oEvent.duration = 2500
						oEvent.pupTrigger = 774
						oEvent.lightshow = eLightShowStrobeShort
						oEventQueue.Add oEvent
'						DMDTimedText Array(sPoints, "BENDER JACKPOT", "RELIGHT AT LEFT LOOP"), _
'							2500, ePrioJackpot
					End If
					aavShotsLit(nPlayer, eModeMultiball2).Remove i
					aavShotsLit(nPlayer, eModeMultiball2).Add eShotLeftLoop
				End If
			End If
		Next
		If bBlastUsed And (eShotInlineDrops = nShot) Then
			bUpdateLights = True
			Addscore SCORE_BENDER_SUPERJP
			aavShotsLit(nPlayer, eModeMultiball2).Remove eShotInlineDrops
			TimerResetInlines.Enabled = True
		End If
		if eShotLeftLoop = nShot Then
			bUpdateLights = True
			Addscore SCORE_BENDER_RELIGHT
			PlaySound "bender-jackpot"
			If not bBlastUsed Then
				Set oEvent = New EventItem
				oEvent.text = "JACKPOTS RELIT"
				oEvent.priority = ePrioJackpot
				oEvent.duration = 2000
				oEvent.pupTrigger = 774
				oEvent.lightshow = eLightShowStrobeShort
				oEventQueue.Add oEvent
'				DMDTimedText "JACKPOTS RELIT", 2000, ePrioJackpot
			End If
			For each i in anBenderJackpotShots
				aavShotsLit(nPlayer, eModeMultiball2).add i
			Next
			aavShotsLit(nPlayer, eModeMultiball2).Remove eShotLeftLoop
		End If
	Else
		' If both shot and switch are none, awlways update the lights
		bUpdateLights = True
	End If

	If bUpdateLights Then
		for i = eShotLeftLane to eShotRightLoop
			RemoveShotColor i, eColorLime
		Next
		RemoveShotColor eShotLeftLoop, eColorGreen

		if 0 = nTimeMBallGraceLeft Then
			For Each i in Array(eShotLeftLane, eShotLowerScoop, eShotSideLoop, eShotInlineDrops, _
			eShotUpperScoop, eShotLeftRamp, eShotCenterLane, eShotRightRamp, eShotRightLoop)
				If aavShotsLit(nPlayer, eModeMultiball2).Contains(i) Then
					AddShotColor i, eColorLime
				End If
			Next

			If aavShotsLit(nPlayer, eModeMultiball2).Contains(eShotLeftLoop) Then
				AddShotColor eShotLeftLoop, eColorGreen
			End If
		End If
	End If
End Sub

Sub ModeMultiball2End
	Dim i
	DOF 161,DOFOff
	If anMball2Played(nPlayer) < 2 Then
		DTDrop 6
		DTDrop 7
		DTDrop 8
	Else
		bMball2Ended = True
	End If

	for i = eShotLeftLane to eShotRightLoop
		RemoveShotColor i, eColorLime
	Next
	RemoveShotColor eShotLeftLoop, eColorGreen

	KickerAutoPlunge.Enabled = False
	avModesRunning(nPlayer).Remove(eModeMultiball2)
	PlayModeMusic
End Sub

Function ExpectedInlineSwitch
	Dim nLockState
	' Discard unexpected switches - they are the result of locked balls moving
	nLockState = GetLockPhysicalState
	If 3 = anMBall2Locks(nPlayer) and 4 = nLockState Then
		ExpectedInlineSwitch = eSwitchInlineMiddle
	Else
		Select Case nLockState
			Case 3, 4
				ExpectedInlineSwitch = eSwitchInlineEnd
			Case 2, 6
				ExpectedInlineSwitch = eSwitchInlineUpper
			Case 1, 5, 8
				ExpectedInlineSwitch = eSwitchInlineMiddle
			Case Else
				ExpectedInlineSwitch = eSwitchInlineLower
		End Select
	End If
End Function

Sub AdvanceMball2 (nSwitch, oBall)
	Dim nLockState, nExpectedSwitch, nHitsLeft, oEvent
	nLockState = GetLockPhysicalState
	nExpectedSwitch = ExpectedInlineSwitch
	If nSwitch <> nExpectedSwitch Then
		Exit Sub
	End If

	If anMBall2Locks(nPlayer) < 3 Then
		Set oEvent = New EventItem
		oEvent.priority = ePrioMballLock
		oEvent.duration = 2500
		If 2 = anMBall2Locks(nPlayer) Then
			oEvent.text = Array("1 MORE HIT", "TO LIGHT LOCK")
			oEvent.pupTrigger = 764: DOF 193, DOFPulse
			oEventQueue.Add oEvent
'			DMDTimedText Array("1 MORE HIT", "TO LIGHT LOCK"), 2500, ePrioMballLock
		Else
			oEvent.text = Array(nHitsLeft & " MORE HITS", "TO LIGHT LOCK")
			oEvent.pupTrigger = 764: DOF 193, DOFPulse
			oEventQueue.Add oEvent
			nHitsLeft = 3 - anMBall2Locks(nPlayer)
'			DMDTimedText Array(nHitsLeft & " MORE HITS", "TO LIGHT LOCK"), 2500, ePrioMballLock
		End if
		Select Case nExpectedSwitch
			Case eSwitchInlineLower
				DTDrop 6
			Case eSwitchInlineMiddle
				DTDrop 7
			Case eSwitchInlineUpper
				DTDrop 8
		End Select
		anMBall2Locks(nPlayer) = anMBall2Locks(nPlayer) + 1
	Elseif 3 = anMBall2Locks(nPlayer) Then
		If nLockState > 3 Then
			LockBallVirtual
		Elseif nLockState < 3 Then
			bResetInlines = True
			If Not DTIsDropped(6) Then DTDrop 6
			If Not DTIsDropped(7) Then DTDrop 7
			If Not DTIsDropped(8) Then DTDrop 8
			vpmTimer.AddTimer 500, "bResetInlines = False '"
			LockBallVirtual
		Else
			anMBall2Locks(nPlayer) = 4
			Set oEvent = New EventItem
			oEvent.priority = ePrioMballLock
			oEvent.lightshow = eLightShowStrobeShort
			If 0 = anMball2Played(nPlayer) Then
				oEvent.text = "BALL 1 LOCKED"
				oEvent.pupTrigger = 769
				oEvent.duration = 6700
				oEventQueue.Add oEvent
'				DMDTimedText "BALL 1 LOCKED", 2500, ePrioMballLock
			Else
				oEvent.text = "LOCK 1 LIT"
				oEvent.pupTrigger = 768
				oEvent.duration = 6000
				oEventQueue.Add oEvent
'				DMDTimedText "LOCK 1 LIT", 2500, ePrioMballLock
			End If
			Set aoBenderLockedBalls(1) = oBall
			SolDT7 True
			KickerAutoPlunge.Enabled = False
			bBallHeld = True
			SolRelease True
			SkillShotInit
		End If
	Elseif 4 = anMBall2Locks(nPlayer) Then
		If nLockState > 4 Then
			LockBallVirtual
		Elseif nLockState < 3 Then
			LockBallVirtual
		Else
			Set oEvent = New EventItem
			oEvent.priority = ePrioMballLock
			oEvent.duration = 2500
			oEvent.lightshow = eLightShowStrobeShort
			bResetInlines = True
			If 0 = anMball2Played(nPlayer) Then
				oEvent.text = "BALL 2 LOCKED"
				oEvent.pupTrigger = 771
				oEvent.duration = 5400
				oEventQueue.Add oEvent
'				DMDTimedText "BALL 2 LOCKED", 2500, ePrioMballLock
				SolDT8 True
				DTDrop 7
				anMBall2Locks(nPlayer) = 6
			Else
				oEvent.text = "BALL 1 LOCKED"
				oEvent.pupTrigger = 769
				oEvent.duration = 6700
				oEventQueue.Add oEvent
				SolDT8 True
				SolDT7 True
				anMBall2Locks(nPlayer) = 5
			End If
			If 3 = nLockState Then
				bBallHeld = True
				KickerAutoPlunge.Enabled = False
				SolRelease True
			Elseif nTimeBallSave < 3000 Then
				nTimeBallSave = 3000
			End If
			Set aoBenderLockedBalls(1) = Nothing
			Set aoBenderLockedBalls(2) = oBall
			vpmTimer.AddTimer 500, "bResetInlines = False '"
		End If
	Elseif 5 = anMBall2Locks(nPlayer) Then
		If nLockState <> 5 Then
			LockBallVirtual
		Else
			bResetInlines = True
			DTDrop 7
			vpmTimer.AddTimer 500, "bResetInlines = False '"
			anMBall2Locks(nPlayer) = anMBall2Locks(nPlayer) + 1
			Set oEvent = New EventItem
			oEvent.priority = ePrioMballLock
			oEvent.duration = 9300
			oEvent.text = "LOCK 2 LIT"
			oEvent.pupTrigger = 770
			oEvent.lightshow = eLightShowStrobeShort
			oEventQueue.Add oEvent
		End If
	Elseif 6 = anMBall2Locks(nPlayer) Then
		If 0 = anMball2Played(nPlayer) Then
			anMBall2Locks(nPlayer) = 9
			Set aoBenderLockedBalls(0) = oBall
			SolDT6 True
			Set oEvent = New EventItem
			oEvent.priority = ePrioMballStart
			oEvent.duration = 2000
			oEvent.text = "BENDER MULTIBALL"
			oEvent.lightshow = eLightShowStrobeShort
			oEvent.pupTrigger = 773
			oEventQueue.Add oEvent
			nModePending = eModeMultiball2
'			DMDTimedText "BENDER MULTIBALL", 2500, ePrioMballStart
			nTimeReleaseLock = 2500
			TimerLock.Enabled = True
		ElseIf nLockState <> 6 Then
			LockBallVirtual
		Else
			Set oEvent = New EventItem
			oEvent.priority = ePrioMballLock
			oEvent.duration = 5400
			oEvent.text = "BALL 2 LOCKED"
			oEvent.lightshow = eLightShowStrobeShort
			oEvent.pupTrigger = 771
			oEventQueue.Add oEvent
'			DMDTimedText "BALL 2 LOCKED", 2500, ePrioMballLock
			SolDT6 True
			SolDT7 True
			Set aoBenderLockedBalls(1) = oBall
			anMBall2Locks(nPlayer) = 7
			KickerAutoPlunge.Enabled = False
			SolRelease True
			SkillShotInit
		End if
	Elseif 7 = anMBall2Locks(nPlayer) Then
		If nExpectedSwitch <> eSwitchInlineLower Then
			LockBallVirtual
		Else
			bResetInlines = True
			DTDrop 6
			vpmTimer.AddTimer 500, "bResetInlines = False '"
			anMBall2Locks(nPlayer) = anMBall2Locks(nPlayer) + 1
			Set oEvent = New EventItem
			oEvent.priority = ePrioMballLock
			oEvent.duration = 5400
			oEvent.text = "LOCK 3 LIT"
			oEvent.pupTrigger = 772
			oEvent.lightshow = eLightShowStrobeShort
			oEventQueue.Add oEvent
		End If
	Else
		anMBall2Locks(nPlayer) = 9
		Set aoBenderLockedBalls(0) = oBall
		SolDT6 True
		Set oEvent = New EventItem
		oEvent.priority = ePrioMballStart
		oEvent.duration = 2500
		oEvent.text = "BENDER MULTIBALL"
		oEvent.pupTrigger = 773
		oEvent.lightshow = eLightShowStrobeShort
		oEventQueue.Add oEvent
		nModePending = eModeMultiball2
		nTimeReleaseLock = 2500
		TimerLock.Enabled = True
	End If
End Sub

'*******************************************
'  ZMYS - Mystery award
'*******************************************

Function SelectMystery
	Dim nValue
	Dim nWeight
	Dim nHighestWeight
	Dim nAward
	Dim i
	Dim oEvent
	Dim nTime
	Dim nShotsLeft

	anMysteryShotsMade(nPlayer) = 0
	Redim anPossibleAwards(10)
	nPossibleAwardCount = 0

	' Calculate weights for awards
	nHighestWeight = 0

	nAward = eMysteryNone
	' ADD A BALL : Always the chosen award if it is available
	If (avModesRunning(nPlayer).Contains(eModeMultiball1) _
	Or avModesRunning(nPlayer).Contains(eModeMultiball2) _
	Or avModesRunning(nPlayer).Contains(eModeCherryBomb) _
	Or avModesRunning(nPlayer).Contains(eModeImmolation) _
	Or avModesRunning(nPlayer).Contains(eModeSlurm)) _
	And (not bAddBallAwarded) And 0 = nTimeMBallGraceLeft Then
		nAward = eMysteryAddABall
		nHighestWeight = 200
		anPossibleAwards(nPossibleAwardCount) = eMysteryAddABall
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If

	' ADD TIME : Always the chosen award if less than half the initial time is left
	For Each i in anAddTimeModes
		If avModesRunning(nPlayer).Contains(i) _
		And (aanModeTime(nPlayer, i) < (anModeStartTime(i) / 2)) Then
			nWeight = 150
			anPossibleAwards(nPossibleAwardCount) = eMysteryAddTime
			nPossibleAwardCount = nPossibleAwardCount + 1
			If nWeight > nHighestWeight Then
				nAward = eMysteryAddTime
				nHighestWeight = nWeight
				End If
			Exit For
		End If
	Next

	' ADD A BLAST : base weight 11. Weighed extra if:
	'	* The player currently has fewer than 2 blasts
	nWeight = 11
	If anBlasts(nPlayer) < 1 Then
		nWeight = nWeight + 50
	Elseif anBlasts(nPlayer) < 2 Then
		nWeight = nWeight + 20
	Elseif anBlasts(nPlayer) > 2 Then
		nWeight = -100
	End If
	If nWeight > 0 Then
		anPossibleAwards(nPossibleAwardCount) = eMysteryBlast
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If
	nWeight = nWeight + RecentlySeenWeight(eMysteryBlast)
	If nWeight > nHighestWeight Then
		nAward = eMysteryBlast
		nHighestWeight = nWeight
	End If

	' ADVANCE MBALL 1: base weight 13
	' weight +30 if 0 balls locked
	' weight +10 if 1 ball locked
	' weight -100 if 2 balls locked
	nWeight = 13
	If not CanAdvanceMultiballs Then
		nWeight = -100
	Elseif anMBall1Locks(nPlayer) < 1 Then
		nWeight = nWeight + 30
	Elseif anMBall1Locks(nPlayer) < 2 Then
		nWeight = nWeight + 10
	Else
		nWeight = -100
	End If
	If nWeight > 0 Then
		anPossibleAwards(nPossibleAwardCount) = eMysteryMBall1
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If
	nWeight = nWeight + RecentlySeenWeight(eMysteryMBall1)
	If nWeight > nHighestWeight Then
		nAward = eMysteryMBall1
		nHighestWeight = nWeight
	End If

	' ADVANCE MBALL 2: base weight 12
	' weight +30 if 0 balls locked
	' weight +10 if 1 ball locked
	' weight -100 if 2 balls locked
	nWeight = 12
	If not CanAdvanceMultiballs Then
		nWeight = -100
	Elseif anMBall2Locks(nPlayer) < 4 Then
		nWeight = nWeight + 30
	Elseif anMBall1Locks(nPlayer) < 5 Then
		nWeight = nWeight + 10
	Else
		nWeight = -100
	End If
	If nWeight > 0 Then
		anPossibleAwards(nPossibleAwardCount) = eMysteryMBall2
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If
	nWeight = nWeight + RecentlySeenWeight(eMysteryMBall2)
	If nWeight > nHighestWeight Then
		nAward = eMysteryMBall2
		nHighestWeight = nWeight
	End If

	' PLAYFIELD MULTIPLIER: base weight 14
	' extra weight if the current multiplier is < 2
	nWeight = 14
	If fPlayfieldX < 2 Then
		nWeight = nWeight + (30 * (2 - fPlayfieldX))
	Elseif fPlayfieldX > 4 Then
		nWeight = -100
	End If
	If nWeight > 0 Then
		anPossibleAwards(nPossibleAwardCount) = eMysteryPlayfieldX
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If
	nWeight = nWeight + RecentlySeenWeight(eMysteryPlayfieldX)
	If nWeight > nHighestWeight Then
		nAward = eMysteryPlayfieldX
		nHighestWeight = nWeight
	End If

	' BALL SAVE: Base weight 7
	'+20 if <45 s ball time
	'+15 if <90 s ball time
	'+10 if <135 s ball time
	If nTimeBallSave > 0 Then
		nWeight = -100
	Elseif GameTime - nTimeBallStart < 45000 Then
		nWeight = 27
	Elseif GameTime - nTimeBallStart < 90000 Then
		nWeight = 22
	Elseif GameTime - nTimeBallStart < 135000 Then
		nWeight = 17
	Else
		nWeight = 7
	End If
	If nWeight > 0 Then
		anPossibleAwards(nPossibleAwardCount) = eMysteryBallSave
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If
	nWeight = nWeight + RecentlySeenWeight(eMysteryBallSave)
	If nWeight > nHighestWeight Then
		nHighestWeight = nWeight
		nAward = eMysteryBallSave
	End If

	' BONUS X:Base weight 4
	' + (10 * ((7 - max(current bonus, 6)) / 2))
	nWeight = 4
	If nBonusX > 5 Then
		nWeight = 9
	Else
		nWeight = nWeight + (10 * ((7 - nBonusX) / 2))
	End If
	If nWeight > 0 Then
		anPossibleAwards(nPossibleAwardCount) = eMysteryBonusX
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If
	nWeight = nWeight + RecentlySeenWeight(eMysteryBonusX)
	If nWeight > nHighestWeight Then
		nHighestWeight = nWeight
		nAward = eMysteryBonusX
	End If

	' SUPER FEATURE: Base weight 9
	' Weighted more if earning a combo feature is far away
	nWeight = 9
	nShotsLeft = 5 - (anCombos(nPlayer) - anComboLastCollect(nPlayer))
	If nShotsLeft >= 0 Then
		nWeight = -100
	Elseif eComboAwardLightEB = anNextComboAward(nPlayer) Then
		nWeight = -100
	Else
		nWeight = nWeight + (8 * nShotsLeft)
	End If
	If nWeight > 0 Then
		anPossibleAwards(nPossibleAwardCount) = eMysterySuperShot
		nPossibleAwardCount = nPossibleAwardCount + 1
	End If
	nWeight = nWeight + RecentlySeenWeight(eMysterySuperShot)
	If nWeight > nHighestWeight Then
		nHighestWeight = nWeight
		nAward = eMysterySuperShot
	End If

	' POINTS
	' Weighted more with a high playfield X
	nWeight = 1
	nWeight = nWeight + (10 * (fPlayfieldX - 1))
	anPossibleAwards(nPossibleAwardCount) = eMysteryPoints
	nPossibleAwardCount = nPossibleAwardCount + 1

	If nWeight > nHighestWeight or eMysteryNone = nAward Then
		nHighestWeight = nWeight
		nAward = eMysteryPoints
	End If

	SelectMystery = nAward

	aanRecentMysteries(nPlayer, 3) = aanRecentMysteries(nPlayer, 2)
	aanRecentMysteries(nPlayer, 2) = aanRecentMysteries(nPlayer, 1)
	aanRecentMysteries(nPlayer, 1) = aanRecentMysteries(nPlayer, 0)
	aanRecentMysteries(nPlayer, 0) = nAward
End Function

Sub AwardMystery(nAward)
	Dim i

	If eMysteryAddABall = nAward Then
		bAddBallAwarded = True
		nTimeBallSave = nTimeBallSave + nBallSaveAddBall
		If nTimeMBallGraceLeft > 0 Then
			nTimeMBallGraceLeft = 0
		End If
		AddBalls 1
	End If

	If eMysteryAddTime = nAward Then
		For Each i in anAddTimeModes
			aanModeTime(nPlayer, i) = aanModeTime(nPlayer, i) + (anModeStartTime(i) \ 3)
		Next
	End If

	if eMysteryBlast = nAward Then
		anBlasts(nPlayer) = anBlasts(nPlayer) + 1
		DMDUpdateBlasts
	End If

	if eMysteryMBall1 = nAward Then
		ModeMultiball1Advance eShotLowerScoop
	End If

	If eMysteryMBall2 = nAward Then
		anMBall2Locks(nPlayer) = anMBall2Locks(nPlayer) + 1
	End If

	If eMysteryPlayfieldX = nAward Then
		fPlayfieldX = fPlayfieldX + 1
		if fPlayfieldX > 5 then fPlayfieldX = 5
		UpdateLEDs fPlayfieldX
	End If

	If eMysteryBallSave = nAward Then
		nTimeBallSave = nTimeBallSave + nBallSaveNewBall
	End If

	If eMysteryBonusX = nAward Then
		nBonusX = nBonusX + 1
	End If

	If eMysterySuperShot = nAward Then
		AwardSuperFeature True
	End If

	If eMysteryPoints = nAward Then
		Addscore SCORE_BIG_POINTS
	End If
End Sub

Sub DisplayMysteryInit(nSelectedAward)
	Dim i, oEvent

	anPossibleAwards(nPossibleAwardCount) = eMysteryJoke
	nPossibleAwardCount = nPossibleAwardCount + 1
	Redim Preserve anPossibleAwards(nPossibleAwardCount - 1)

	RandomShuffleArray anPossibleAwards
	' Set the selected award as the first element
	For i = 1 to nPossibleAwardCount - 1
		if nSelectedAward = anPossibleAwards(i) Then
			anPossibleAwards(i) = anPossibleAwards(0)
			anPossibleAwards(0) = nSelectedAward
			Exit For
		End If
	Next

	Set oEvent = New EventItem
	oEvent.priority = ePrioMystery
	oEvent.duration = 3400
	oEvent.text = Array("MYSTERY AWARD", "")
	oEvent.pupTrigger = 719: DOF 133, DOFPulse
	oEvent.holdBallAt = eShotLowerScoop
	oEvent.lightshow = eLightShowMystery
	oEventQueue.Add oEvent
End Sub

Sub RandomShuffleArray(ByRef aArray)
	Dim i, randIdx, temp, lastIdx
	lastIdx = uBound(aArray)
	If lastIdx < 1 Then Exit Sub
	For i = 0 to lastIdx - 1
		randIdx = Int(Rnd * ((lastIdx + 1) - i)) + i
		temp = aArray(randIdx)
		aArray(randIdx) = aArray(i)
		aArray(i) = temp
	Next
End Sub

Sub TimerMystery_timer
	Dim sText, nStep, nLength
	If Not oCurrentEvent is Nothing Then
		If Not oCurrentEvent.priority = ePrioMystery Then
			TimerMystery.Enabled = False
			nMysteryAnimStep = 0
			If bEnablePuP Then
				pDMDLabelSet "Splash2B", ""
			End If
		End If
	End If
	If TimerMystery.Enabled Then
		nLength = UBound(anPossibleAwards) - 1
		If 6 = nMysteryAnimStep Then
			AwardMystery anPossibleAwards(0)
		End If
		If nMysteryAnimStep > 5 Or nMysteryAnimStep > nLength Then
			nStep = 0
		Else
			nStep = nMysteryAnimStep
		End If
		Select Case anPossibleAwards(nStep)
			Case eMysteryAddABall
				sText = "ADD A BALL"
			Case eMysteryAddTime
				sText = "ADD MORE TIME"
			Case eMysteryBlast
				sText = "ADD ONE BLAST"
			Case eMysteryMBall1
				sText = "ADVANCE BASEMULTIBALL"
			Case eMysteryMBall2
				sText = "ADVANCE BENDER MBALL"
			Case eMysteryPlayfieldX
				sText = "+1 PLAYFIELD X"
			Case eMysteryBonusX
				sText = "+1 BONUS X"
			Case eMysteryBallSave
				sText = "BALL SAVE"
			Case eMysterySuperShot
				If eComboAwardFrenzy = anNextComboAward(nPlayer) Then
					sText = "FRENZY"
				Elseif eComboAwardBumpers = anNextComboAward(nPlayer) Then
					sText = "SUPER BUMPERS"
				Elseif eComboAwardSpinners = anNextComboAward(nPlayer) Then
					sText = "SUPER SPINNERS"
				Elseif eComboAwardRamps = anNextComboAward(nPlayer) Then
					sText = "SUPER RAMPS"
				Elseif eComboAwardLoops = anNextComboAward(nPlayer) Then
					sText = "SUPER LOOPS"
				Else
					sText = "SUPER BUMPERS"
				End If
			Case eMysteryPoints
				sText = FormatScore(SCORE_BIG_POINTS * fPlayfieldX) & " POINTS"
			Case eMysteryJoke
				sText = asJokeAwards(Int(Rnd * UBound(asJokeAwards)))
		End Select

		If UseFlexDMD Then
			FlexDMD.LockRenderThread
			oDMD2LineText2.text = sText
			oDMD2LineText2.SetAlignedPosition 64, 24, FlexDMD_Align_Center
			FlexDMD.UnlockRenderThread
		End If
		If bEnablePuP Then
			pDMDLabelSet "Splash2B", sText
		End If
		nMysteryAnimStep = nMysteryAnimStep + 1
	End If
End Sub

' Calculate the weight adjustment for a mystery award depending on if the same
' award has been recently awarded
Function RecentlySeenWeight(nMystery)
	If nMystery = aanRecentMysteries(nPlayer, 0) Then
		RecentlySeenWeight = -90
	ElseIf nMystery = aanRecentMysteries(nPlayer, 1) Then	
		RecentlySeenWeight = -50
	ElseIf nMystery = aanRecentMysteries(nPlayer, 2) Then	
		RecentlySeenWeight = -30
	ElseIf nMystery = aanRecentMysteries(nPlayer, 3) Then
		RecentlySeenWeight = -10
	Else
		RecentlySeenWeight = 0
	End If
End Function


'*******************************************
'  ZBON - Bonus
'*******************************************
Const BONUS_ROLLOVER = 57230
Const BONUS_TARGET = 87230
Const BONUS_SLINGHOT = 57230
Const BONUS_BUMPER = 14230
Const BONUS_SPINNER = 8360
Const BONUS_COMBO = 200000
Const BONUS_DELIVERY = 3000000

Sub InitBonus
	Dim oEvent, i
	nBonusScreen = 0
	TimerBonus.Enabled = True
	bCountingBonus = True
	UpdateLEDs -1
	nTextDuration = 0
	nTextPriority = ePrioIdle
	ClearEvents
	If bEnablePuP Then
		For Each i in Array("Splash1", "Splash2A", "Splash2B", _
							"Splash3A", "Splash3B", "Splash3C")
			pDMDLabelSet i, ""
		Next
	End If
	Set oEvent = new EventItem
	oEvent.pupTrigger = RoundRobinEvent("Drain")
	oEvent.duration = RoundRobinLength("Drain")
	oEvent.priority = ePrioNewPlayer
	oEventQueue.add oEvent
	TimerBonus_Timer
End Sub

Sub TimerBonus_Timer
	Dim i, sBonus, nFinalBonus, sFinalBonus, sScore

	nFinalBonus = nBonusTotal
	nFinalBonus = nFinalBonus + (anCombos(nPlayer) * BONUS_COMBO)
	nFinalBonus = nFinalBonus + (avModesCompleted(nPlayer).Count * BONUS_DELIVERY)
	sBonus = FormatScore(nFinalBonus)
	sFinalBonus = FormatScore(nFinalBonus * nBonusX)

	If 0 = nBonusScreen Then
		anScore(nPlayer) = anScore(nPlayer) + (nFinalBonus * nBonusX)
		DMDTimedText Array("BONUS", sBonus & " X " & nBonusX & " =", sFinalBonus), 1517, ePrioNewPlayer
		If bEnablePuP Then
			pDMDLabelSet "BonusCaption", "BONUS"
			pDMDLabelSet "SwitchCaption", "STUFF HIT"
			pDMDLabelSet "SwitchValue", FormatScore(nBonusTotal)
		End If
		nBonusScreen = 1
	Elseif 1 = nBonusScreen Then
		If bEnablePuP Then
			pDMDLabelSet "ComboCaption", "COMBOS"
			pDMDLabelSet "ComboValue", FormatScore(anCombos(nPlayer) * BONUS_COMBO)
		End If
		nBonusScreen = 2
	Elseif 2 = nBonusScreen Then
		If bEnablePuP Then
			pDMDLabelSet "DeliverCaption", "MODES WON"
			pDMDLabelSet "DeliverValue", FormatScore(avModesCompleted(nPlayer).Count * BONUS_DELIVERY)
		End If
		nBonusScreen = 3
	Elseif 3 = nBonusScreen Then
		If bEnablePuP Then
			pDMDLabelSet "BonusX", "BONUS X " & nBonusX & " ="
			pDMDLabelSet "BonusTotal", sFinalBonus
		End If
		nBonusScreen = 4
	Elseif 4 = nBonusScreen Then
		sScore = FormatScore(anScore(nPlayer))
		DMDTimedText Array("BONUS", sFinalBonus, "P" & (1 + nPlayer) & " " & sScore), 1517, ePrioNewPlayer
		If bEnablePuP Then
			pDMDLabelSet "BonusCaption", "BONUS"
			pDMDLabelSet "SwitchCaption", "STUFF HIT"
			pDMDLabelSet "SwitchValue", FormatScore(nBonusTotal)
			pDMDLabelSet "ComboCaption", "COMBOS"
			pDMDLabelSet "ComboValue", FormatScore(anCombos(nPlayer) * BONUS_COMBO)
			pDMDLabelSet "DeliverCaption", "MODES WON"
			pDMDLabelSet "DeliverValue", FormatScore(avModesCompleted(nPlayer).Count * BONUS_DELIVERY)
			pDMDLabelSet "BonusX", "BONUS X " & nBonusX & " ="
			pDMDLabelSet "BonusTotal", sFinalBonus
			pDMDLabelSet "BonusScoreCaption", "PLAYER " & (1 + nPlayer) & " TOTAL SCORE"
			pDMDLabelSet "BonusScoreValue", FormatScore(anScore(nPlayer))
		End If
		nBonusScreen = 5
	Elseif nBonusScreen < 6 Then
		nBonusScreen = nBonusScreen + 1
	Else
		If bEnablePuP Then
			For Each i in asBonusLabels
				pDMDLabelSet i, ""
			Next
			PuPlayer.playStop pDMD
		End If
		TimerBonus.Enabled = False
		bCountingBonus = False
		nTextDuration = 0
		nTextPriority = ePrioIdle
		EndBall
	End If
End Sub

Sub UpdateBeer
	Dim i, oEvent

	if TimerBlinkLanes.Enabled Then exit Sub
	If avBeerLanes(nPlayer).IsFull Then
		avBeerLanes(nPlayer).Clear
		for i = 0 to 3
			aoLaneLights(i).state = LightStateBlinking
		next
		nBonusX = nBonusX + 1
		Set oEvent = New EventItem
		oEvent.priority = ePrioBonusX
		oEvent.duration = 1500
		oEvent.text = nBonusX & "X BONUS"
		oEventQueue.Add oEvent
'		DMDTimedText nBonusX & "X BONUS", 1500, ePrioBonusX
		TimerBlinkLanes.Enabled = True
	Else
		for i = 0 to 3
			if avBeerLanes(nPlayer).Contains(i) Then
				aoLaneLights(i).state = LightStateOn
			Else
				aoLaneLights(i).state = LightStateOff
			End If
		next
	End If
End Sub

Sub TimerBlinkLanes_Timer
	TimerBlinkLanes.Enabled = False
	UpdateBeer
End Sub

'*******************************************
'  ZHIG - High score handling
'*******************************************

Dim nHighScoreUpdates
Dim sLineOne
Dim sInitialsDisplayed

Sub HighscoreUpdate_Timer
	Dim i, oEvent
	If HighscoreLetter = -1 Then
		SortedHighscoreNames(aScoreRanks(nHighScoreIter)) = InitialsEntered
		If nHighScoreIter < 3 Then
			For i = (nHighScoreIter + 1) to 3
				nHighScoreIter = i
				If aScoreRanks(i) < nHighScoreSlots Then
					InitHighscore
					Exit For
				End If
			Next
		Else
			HighscoreUpdate.enabled = False
			bEnteringHighScore = false
			StopAllMusic
			SwitchMusic "music-attract"
			savehs
			nTextDuration = 0
			Set oEvent = new EventItem
			oEvent.pupTrigger = RoundRobinEvent("GameOver") ' Game over video
			oEvent.duration = RoundRobinLength("GameOver")
			oEvent.text = "GAME OVER"
			oEvent.priority = ePrioTilt
			oEventQueue.add oEvent
		End If
		Exit Sub
	End If
	If (nTimePressedRight > 0) And (gameTime - nTimePressedRight > 749) Then
		ChangeHighScoreLetter(1)
	End If
	If (nTimePressedLeft > 0) And (gameTime - nTimePressedLeft > 749) Then
		ChangeHighScoreLetter(-1)
	End If
	If nHighScoreUpdates < 5 Then
		sInitialsDisplayed = InitialsEntered & Mid(cHighScoreAlphabet, HighscoreLetter, 1) &_
			Space(2 - len(InitialsEntered))
	Else
		sInitialsDisplayed = InitialsEntered & "_" & Space(2 - len(InitialsEntered))
	End If
	DMDTimedText Array(sLineOne, FormatScore(anScore(nHighScoreIter)) & " <" & _
		sInitialsDisplayed & ">"), HighscoreUpdate.interval + 17, ePrioNewPlayer
	nHighScoreUpdates = (nHighScoreUpdates + 1) mod 10
End Sub

Sub InitHighscore()
	bEnteringHighScore = True
	' SwitchMusic "music-oom"
	If aScoreRanks(nHighScoreIter) < 1 then
		sLineOne = "P" & (nHighScoreIter + 1) & " GRAND CHAMPION"
	Else
		sLineOne = "P" & (nHighScoreIter + 1) & " HIGH SCORE " & (aScoreRanks(nHighScoreIter))
	End If
	DMDTimedText Array(sLineOne, FormatScore(anScore(nHighScoreIter)) & " <" & _
		sInitialsDisplayed & ">"), HighscoreUpdate.interval + 17, ePrioNewPlayer
	InitialsEntered = ""
	HighscoreLetter = 1
	nHighScoreUpdates = 0
	nTimePressedLeft = -1
	nTimePressedRight = -1
	HighscoreUpdate.enabled = True
End Sub

Sub HighScoreRightPressed
	If nTimePressedRight < 0 Then nTimePressedRight = GameTime
End Sub

Sub HighScoreRightReleased
	If GameTime - nTimePressedRight < 750 Then ChangeHighScoreLetter(1)
	nTimePressedRight = -1
End Sub

Sub HighScoreLeftPressed
	If nTimePressedLeft < 0 Then nTimePressedLeft = GameTime
End Sub

Sub HighScoreLeftReleased
	If GameTime - nTimePressedLeft < 750 Then ChangeHighScoreLetter(-1)
	nTimePressedLeft = -1
End Sub

Sub ChangeHighScoreLetter(offset)
	If HighscoreLetter = -1 then Exit Sub
	HighscoreLetter = HighscoreLetter + offset
	If HighscoreLetter > len(cHighScoreAlphabet) Then HighscoreLetter = 1
	If HighscoreLetter < 1 Then HighscoreLetter = len(cHighScoreAlphabet)
	nHighScoreUpdates = 0
End Sub

Sub HighScoreEnterPressed
	' letter "<" means delete
	Dim Letter
	If HighscoreLetter = -1 then Exit Sub
	Letter = Mid(cHighScoreAlphabet, HighscoreLetter, 1)
	If Letter = "<" And Len(InitialsEntered) > 0 Then
		Letter = Right(InitialsEntered, 1)
		InitialsEntered = Left(InitialsEntered, Len(InitialsEntered) - 1)
		sInitialsDisplayed = InitialsEntered & Letter & Space(2 - len(InitialsEntered))
		HighscoreLetter = inStr(1, cHighScoreAlphabet, Letter, vbTextCompare)
	Elseif Letter <> "<" Then
		InitialsEntered = InitialsEntered & Letter
		If Len(InitialsEntered) > 2 Then
			HighscoreLetter = -1
			sInitialsDisplayed = InitialsEntered
		Else
			sInitialsDisplayed = InitialsEntered & Letter & Space(2 - len(InitialsEntered))
		End If
	End If
	DMDTimedText Array(sLineOne, FormatScore(anScore(nHighScoreIter)) & " <" & _
		sInitialsDisplayed & ">"), HighscoreUpdate.interval + 17, ePrioNewPlayer
End Sub

Sub Loadhs
    Dim x
    x = LoadValue(cGameName, "HighScore1")
    If(x <> "") Then HighScore(0) = CDbl(x) Else HighScore(0) = 1000000000 End If
    x = LoadValue(cGameName, "HighScore1Name")
    If(x <> "") Then HighScoreName(0) = x Else HighScoreName(0) = "FRY" End If
    x = LoadValue(cGameName, "HighScore2")
    If(x <> "") then HighScore(1) = CDbl(x) Else HighScore(1) = 800000000 End If
    x = LoadValue(cGameName, "HighScore2Name")
    If(x <> "") then HighScoreName(1) = x Else HighScoreName(1) = "LEL" End If
    x = LoadValue(cGameName, "HighScore3")
    If(x <> "") then HighScore(2) = CDbl(x) Else HighScore(2) = 650000000 End If
    x = LoadValue(cGameName, "HighScore3Name")
    If(x <> "") then HighScoreName(2) = x Else HighScoreName(2) = "BND" End If
    x = LoadValue(cGameName, "HighScore4")
    If(x <> "") then HighScore(3) = CDbl(x) Else HighScore(3) = 550000000 End If
    x = LoadValue(cGameName, "HighScore4Name")
    If(x <> "") then HighScoreName(3) = x Else HighScoreName(3) = "PRF" End If
    x = LoadValue(cGameName, "HighScore5")
    If(x <> "") then HighScore(4) = CDbl(x) Else HighScore(4) = 450000000 End If
    x = LoadValue(cGameName, "HighScore5Name")
    If(x <> "") then HighScoreName(4) = x Else HighScoreName(4) = "ZOI" End If
End Sub

Sub Savehs
	Dim i
	For i = 0 to nHighScoreSlots - 1
		HighScore(i) = SortedHighscores(i)
		HighScoreName(i) = SortedHighscoreNames(i)
	Next
    SaveValue cGameName, "HighScore1", SortedHighscores(0)
    SaveValue cGameName, "HighScore1Name", SortedHighscoreNames(0)
    SaveValue cGameName, "HighScore2", SortedHighscores(1)
    SaveValue cGameName, "HighScore2Name", SortedHighscoreNames(1)
    SaveValue cGameName, "HighScore3", SortedHighscores(2)
    SaveValue cGameName, "HighScore3Name", SortedHighscoreNames(2)
    SaveValue cGameName, "HighScore4", SortedHighscores(3)
    SaveValue cGameName, "HighScore4Name", SortedHighscoreNames(3)
    SaveValue cGameName, "HighScore5", SortedHighscores(4)
    SaveValue cGameName, "HighScore5Name", SortedHighscoreNames(4)
End Sub

Sub Reseths
	Redim SortedHighscores(nHighScoreSlots - 1)
	Redim SortedHighscoreNames(nHighScoreSlots - 1)
	SortedHighscores(0) = 1000000000 '1b
	SortedHighscoreNames(0) = "FRY"
	SortedHighscores(1) = 800000000 '800m
	SortedHighscoreNames(1) = "LEL"
	SortedHighscores(2) = 650000000 '650 m
	SortedHighscoreNames(2) = "BND"
	SortedHighscores(3) = 550000000 '550 m
	SortedHighscoreNames(3) = "PRF"
	SortedHighscores(4) = 450000000 '450m
	SortedHighscoreNames(4) = "ZOI"
	Savehs
End Sub

' Input: an array of scores of player 1, 2, etc.
' Output: an array of the position in the highscores of the player
Sub CheckHighScore(aScores)
	Dim aIndices()
	Dim scoreIndices()
	Dim i,j
	Dim highestScore
	Dim highestIndex
	Dim bWillEnterHighScore
	Dim temp
	Dim oEvent

	Redim SortedHighscoreNames(nHighScoreSlots + UBound(aScores))
	Redim SortedHighscores(nHighScoreSlots + UBound(aScores))
	Redim aIndices(nHighScoreSlots + UBound(aScores))
	Redim scoreIndices(UBound(aScores))
	bWillEnterHighScore = False

	For i = 0 to UBound(SortedHighscores)
		aIndices(i) = i
		If i < nHighScoreSlots Then
			SortedHighscores(i) = HighScore(i)
			SortedHighscoreNames(i) = HighScoreName(i)
		Else
			temp = aScores(i - nHighScoreSlots)
			SortedHighscores(i) = temp
			SortedHighscoreNames(i) = "NEW"
		End If
	Next

	' sort the scores and adjust the aIndices array after how the scores
	' were sorted
	For i = 0 to UBound(SortedHighscores)
		highestScore = SortedHighscores(i)
		highestIndex = i
		For j = i + 1 to UBound(SortedHighscores)
			If SortedHighscores(j) > highestScore Then
				highestScore = SortedHighscores(j)
				highestIndex = j
			End If
		Next
		temp = SortedHighscoreNames(i)
		SortedHighscoreNames(i) = SortedHighscoreNames(highestIndex)
		SortedHighscoreNames(highestIndex) = temp
		temp = SortedHighscores(i)
		SortedHighscores(i) = SortedHighscores(highestIndex)
		SortedHighscores(highestIndex) = temp
		temp = aIndices(i)
		aIndices(i) = aIndices(highestIndex)
		aIndices(highestIndex) = temp
	Next

	' return an array of the positions of the new scores in the sorted scores
	For i = nHighScoreSlots to UBound(aIndices)
		For j = 0 to UBound(SortedHighscores)
			If aIndices(j) = i Then scoreIndices(i - nHighScoreSlots) = j
		Next
	Next

	aScoreRanks = scoreIndices

	For i = 0 to 3
		nHighScoreIter = i
		If aScoreRanks(i) < nHighScoreSlots Then
			nTextDuration = 0
			bWillEnterHighScore = True
			InitHighscore
			Exit For
		End If
	Next

	If bWillEnterHighScore Then
		PlayModeMusic
	Else
		Set oEvent = new EventItem
		oEvent.pupTrigger = RoundRobinEvent("GameOver") ' Game over video
		oEvent.duration = RoundRobinLength("GameOver")
		oEvent.text = "GAME OVER"
		oEvent.priority = ePrioTilt
		oEventQueue.add oEvent
		SwitchMusic "music-attract"
	End If
End Sub

'*******************************************
'  ZINS - Insert lights
'*******************************************
Sub LightSeqAttract_PlayDone
	Dim i
	dim colorFull
	If nPlayersInGame < 1 Then
		nColorCycleIndex = (nColorCycleIndex + 1) mod nColorsInCycle
		colorFull = anColorCycleLight(nColorCycleIndex)
		for i = 2 to 11
			ApplyLampRGB i, colorFull
		next
		LightSeqAttract.UpdateInterval = 25
		LightSeqAttract.Play SeqCircleOutOn, 40
	End If
End Sub

Sub AllLightsOff
	Dim i
	For each i in aoShotLights : i.state = LightStateOff : Next
	For each i in aoModeLights : i.state = LightStateOff : Next
	For each i in aoComboLights : i.state = LightStateOff : Next
	For each i in ao5BankLights : i.state = LightStateOff : Next
	For each i in Array(cLightAddTime, cLightLiteMystery, cLightShootAgain, _
	cLightMball1Lock1, cLightMball1Lock2, cLightMball1Lock3, cLightLiteMystery, _
	cLightMball2Lock1, cLightMball2Lock2, cLightMball2Lock3, _
	cLightMball2LiteL, cLightMball2LiteR, cLightLeftOutlane, _
	cLightLeftInlane, cLightRightInlane, cLightRightOutlane, cLightSuicideBooth)
		i.state = LightStateOff
	Next
	Lampz.SetLamp eLightCollectCombo, LightStateOff
	Lampz.SetLamp eLightSelectMode, LightStateOff
	Lampz.SetLamp eLightMystery, LightStateOff
	Lampz.SetLamp eLightExtraBall, LightStateOff
	Lampz.SetLamp eLightBlastButton, LightStateOff
End Sub

Sub AddShotColor(nShot, nColor)
	avShotColors(nShot).add nColor
End Sub

Sub RemoveShotColor(nShot, nColor)
	Dim nlampNr
	avShotColors(nShot).remove nColor
'	If avShotColors(nShot).Count < 1 Then
'		aoShotLights(nShot).state = 0
'		nlampNr = nShot + 2
'		Lampz.SetLamp nlampNr, 0
'	End If
End Sub

Sub ClearShotColor(nShot)
	avShotColors(nShot).Clear
'	aoShotLights(nShot).state = 0
End Sub

Sub TimerBlinkSlow_Timer
	Dim i, nLocks, bTimedModeRunning
	' Untitled multiball lock Lights
	for i = 0 to 2
		aoMball1LockLights(i).state = LightStateOff
	Next
	cLightMball2LiteL.state = LightStateOff
	cLightMball2LiteR.state = LightStateOff

	If CanAdvanceMultiballs Then
		For i = 0 to 2
			If anMBall1Locks(nPlayer) > i Then
				aoMball1LockLights(i).state = LightStateOn
			End If
		Next

		If abMball1LoopLeft(nPlayer) Then
			cLightMball2LiteL.state = LightStateBlinking
		End If
		If abMball1LoopRight(nPlayer) Then
			cLightMball2LiteR.state = LightStateBlinking
		End If
		If (Not abMball1LoopLeft(nPlayer)) And (Not abMball1LoopRight(nPlayer)) Then
			nLocks = anMBall1Locks(nPlayer)
			if nLocks < 3 Then
				aoMball1LockLights(nLocks).state = LightStateBlinking
			End If
		End If
	End If

	' Bender multiball lock lights
	cLightMball2Lock1.state = LightStateOff
	cLightMball2Lock2.state = LightStateOff
	cLightMball2Lock3.state = LightStateOff
	If avModesRunning(nPlayer).Contains(eModeMultiball2) _
	And (0 = nTimeMBallGraceLeft) Then
		If Not TimerResetInlines.Enabled Then
			cLightMball2Lock1.state = LightStateBlinking
			If DTIsDropped(6) Then
				cLightMball2Lock2.state = LightStateBlinking
			End If
			If DTIsDropped(7) Then
				cLightMball2Lock3.state = LightStateBlinking
			End If
		End If
	Elseif CanAdvanceMultiballs and (0 = anMball2Played(nPlayer)) Then
		If 3 = anMBall2Locks(nPlayer) Then
			cLightMball2Lock1.state = LightStateBlinking
		Elseif 4 = anMBall2Locks(nPlayer) Then
			cLightMball2Lock1.state = LightStateOn
			cLightMball2Lock2.state = LightStateBlinking
		Elseif 6 = anMBall2Locks(nPlayer) Then
			cLightMball2Lock1.state = LightStateOn
			cLightMball2Lock2.state = LightStateOn
			cLightMball2Lock3.state = LightStateBlinking
		End If
	Elseif CanAdvanceMultiballs Then
		If 4 = anMBall2Locks(nPlayer) Then
			cLightMball2Lock1.state = LightStateBlinking
		Elseif 5 = anMBall2Locks(nPlayer) Then
			cLightMball2Lock1.state = LightStateOn
		Elseif 6 = anMBall2Locks(nPlayer) Then
			cLightMball2Lock1.state = LightStateOn
			cLightMball2Lock2.state = LightStateBlinking
		Elseif 7 = anMBall2Locks(nPlayer) Then
			cLightMball2Lock1.state = LightStateOn
			cLightMball2Lock2.state = LightStateOn
		Elseif 8 = anMBall2Locks(nPlayer) Then
			cLightMball2lock1.state = LightStateOn
			cLightMball2Lock2.state = LightStateOn
			cLightMball2Lock3.state = LightStateBlinking
		End If
	End If

	' Add time light
	bTimedModeRunning = False
	For Each i in anAddTimeModes
		if avModesRunning(nPlayer).Contains(i) Then
			bTimedModeRunning = True
			Exit For
		End If
	Next
	cLightAddTime.state = LightStateOff
	If bTimedModeRunning Then cLightAddTime.state = LightStateBlinking

	' Lite Mystery light
	cLightLiteMystery.state = LightStateOff
	Select Case anMysteryShotsMade(nPlayer)
		Case 0
			cLightLiteMystery.blinkPattern = "1000"
			cLightLiteMystery.state = LightStateBlinking
		Case 1
			cLightLiteMystery.blinkPattern = "1100"
			cLightLiteMystery.state = LightStateBlinking
		Case 2
			cLightLiteMystery.blinkPattern = "1110"
			cLightLiteMystery.state = LightStateBlinking
	End Select

	' Planet lights
	for i = 0 to 8
		aoLightForMode(i).state = LightStateOff
		If avModesCompleted(nPlayer).Contains(i) Then
			aoLightForMode(i).state = LightStateOn
		Elseif avModesRunning(nPlayer).Contains(i) _
		Or (bSelectingMode and (i = nModeSelected)) Then
			aoLightForMode(i).state = LightStateBlinking
		End If
	Next
End Sub

Sub TimerBlinkMedium_Timer
	Dim i

	' BLAST drop target 5 bank
	For i = 0 to 4
		ao5BankLights(i).state = LightStateOff
		If anBlasts(nPlayer) < 3 Then
			If avDrops5bankHit(nPlayer).Contains(i) Then
				ao5BankLights(i).state = LightStateOn
			Else
				ao5BankLights(i).state = LightStateBlinking
			End If
		End If
	Next

	' Combo lights
	for i = eShotLeftLane to eShotRightLoop
		aoComboLights(i).state = LightStateOff
		If anComboTimer(i) > 999 then aoComboLights(i).state = LightStateBlinking
	Next
End Sub

Sub TimerBlinkFast_Timer
	Dim i
	Dim nProgress, nFirstLight, nLastLight
'	sTimersRun = sTimersRun + " TimerBlinkFast"
	If nPlayersInGame = 0 then exit sub ' Don't update colors during attract mode
	If True = bDrainingBalls Or True = bCountingBonus Then exit sub

	If LightStateOff = nPostLightStates Then
		nPostLightStates = LightStateOn
	Else
		nPostLightStates = LightStateOff
	End If

	For i = 0 to 9
		UpdateArrowColor i
	Next

	nColorCycleIndex = nColorCycleIndex + 1
	nColorCycleIndex = nColorCycleIndex mod 60

	' Ball Save
	If nExtraBalls > 0 Then
		clightShootAgain.state = LightStateOn
	Else
		clightShootAgain.state = LightStateOff
	End If
'	cLightInlineDrops.BlinkInterval = 130
	If nTimeBallSave > 2499 and nTimeBallSave < 4500 Then
		clightShootAgain.BlinkInterval = 65
		clightShootAgain.state = LightStateBlinking
	Elseif nTimeBallSave > 4499 Then
		clightShootAgain.BlinkInterval = 130
		clightShootAgain.state = LightStateBlinking
	End If

	' Strobing from kickout warning overrides regular signpost lights
	If TimerKickoutWarning.enabled Then exit Sub

	' Signpost: combo collect
	If anCombos(nPlayer) >= anComboLastCollect(nPlayer) + 5 Then
		If eComboAwardLightEB = anNextComboAward(nPlayer) Then
			Lampz.SetLamp eLightExtraBall, nPostLightStates
		Else
			Lampz.SetLamp eLightCollectCombo, nPostLightStates
		End If
	Else
		Lampz.SetLamp eLightCollectCombo, LightStateOff
		Lampz.SetLamp eLightExtraBall, LightStateOff
	End If

	' Signpost: mystery
	If anMysteryShotsMade(nPlayer) < 3 Then
		Lampz.SetLamp eLightMystery, LightStateOff
	Else
		Lampz.SetLamp eLightMystery, nPostLightStates
	End If

	' Signpost: Mode Start
	If (not binMode) and (CanAdvanceMultiballs or (nTimeMBallGraceLeft > 0)) Then
		Lampz.SetLamp eLightSelectMode, nPostLightStates
		If not bSelectingMode Then AddShotColor eShotLowerScoop, eColorRainbow
	Else
		Lampz.SetLamp eLightSelectMode, LightStateOff
	End If

	' Blast Button
	If anBlasts(nPlayer) > 0 And avModesRunning(nPlayer).Count > 0 Then
		If Not HideBlastButton then
			Lampz.SetLamp eLightBlastButton, nPostLightStates
		End If
		DOF 119,DOFOn
	Else
		Lampz.SetLamp eLightBlastButton, LightStateOff
		DOF 119,DOFOff
	End If

End Sub

Dim nStrobes : nStrobes = 0
Sub TimerKickoutWarning_Timer
	nStrobes = nStrobes + 1

	If Not bBallinLowerScoop Then
		TimerKickoutWarning.Enabled = False
		Exit Sub
	End If

	If nStrobes Mod 2 = 0 Then
		Lampz.SetLamp eLightExtraBall, LightStateOn
		Lampz.SetLamp eLightCollectCombo, LightStateOff
		Lampz.SetLamp eLightMystery, LightStateOn
		Lampz.SetLamp eLightSelectMode, LightStateOff
	Else
		Lampz.SetLamp eLightExtraBall, LightStateOff
		Lampz.SetLamp eLightCollectCombo, LightStateOn
		Lampz.SetLamp eLightMystery, LightStateOff
		Lampz.SetLamp eLightSelectMode, LightStateOn
	End If
End Sub

Sub UpdateArrowColor(nShot)
	Dim i
	Dim oLight, nLampNr
	Dim nColorCount
	Dim vColors
	Dim aActiveColors(11)
	Dim nColorToUse, nColor

	Set oLight = aoShotLights(nShot)
	Set vColors = avShotColors(nShot)
	nLampNr = 2 + nShot

	nColorCount = 0
	for i = 0 to nColorsInCycle - 1 ' colors
		if vColors.Contains(i) Then
			aActiveColors(nColorCount) = i
			nColorCount = nColorCount + 1
		end If
	next
	If nColorCount > 0 Then
		nColorToUse = nColorCycleIndex mod nColorCount
		nColor = aActiveColors(nColorToUse)
	End If
	oLight.state = LightStateOff
	If vColors.Contains(eColorRainbow) Then
		oLight.state = LightStateOn
	ElseIf nColorCount > 0 Then
		oLight.BlinkInterval = 130
		If avModesRunning(nPlayer).Contains(eModeMultiball1) _
		And (eShotSideLoop = nShot) And (eColorGreen = nColor) Then
			' Super jackpot blinks faster
			oLight.blinkInterval = 65
		End If
		If avModesRunning(nPlayer).Contains(eModeMultiball2) _
		And (eShotInlineDrops = nShot) And (eColorLime = nColor) Then
			' Super jackpot blinks faster
			oLight.blinkInterval = 65
		End If
		ApplyLampRGB nLampNr, anColorCycleLight(nColor)
		oLight.state = LightStateBlinking
	Else
		oLight.state = LightStateOff
		Lampz.SetLamp nLampNr, 0
	end if
End Sub

Sub UpdateRainbow
	Dim nTick, nColor, i

	nTick = GameTime mod 1536
	If nPlayersInGame = 0 then exit sub ' Don't update colors during attract mode
	If bDrainingBalls Or bCountingBonus Then exit sub
	
	If nTick < 256 Then ' Red to yellow
		nColor = RGB(255, nTick, 0)
	Elseif nTick < 512 Then ' Yellow to green
		nColor = RGB(512 - nTick, 255, 0)
	Elseif nTick < 768 Then ' Green to cyan
		nColor = RGB(0, 255, nTick - 512)
	Elseif nTick < 1024 Then ' cyan to blue
		nColor = RGB(0, 1024 - nTick, 255)
	Elseif nTick < 1280 Then ' blue to magenta
		nColor = RGB(nTick - 1024, 0, 255)
	Else ' magenta to red
		nColor = RGB(255, 0, 1536 - nTick)
	End if
	For i = 0 to 9
		If avShotColors(i).Contains(eColorRainbow) Then
			ApplyLampRGB 2 + i, nColor
		End If
	Next
End Sub

Sub LightShowEnd
	Dim i
	TimerLightShow.Enabled = False
	LightSeqAlmostAll.StopPlay
	LightSeqEven.StopPlay
	LightSeqOdd.StopPlay
	LightSeqAlmostAll.UpdateInterval = 17
	' Reset GI to incandescent warm white
	nLightShowCurrent = eLightShowNone
	nLightShowTime = 0
	nLightShowPriority = ePrioIdle
End Sub

Dim nLightShowUpdates
Sub TimerLightShow_Timer
	nLightShowUpdates = nLightShowUpdates + 1
	nLightShowTime = nLightShowTime - TimerLightShow.interval
	If nLightShowTime < 1 Then
		LightShowEnd
	End If
	If nLightShowUpdates <= nMaxFlashes Then
		FlashOnce anFlashOrder(nLightShowUpdates Mod 4)
	End If
	If (eLightShowStrobeLong = nLightShowCurrent) or (eLightShowStrobeShort = nLightShowCurrent) _
	or ((eLightShowModeComplete = nLightShowCurrent) and (nLightShowUpdates Mod 2 = 0)) Then
		LightSeqEven.stopPlay
		LightSeqOdd.stopPlay
		If bLightShowBlinkOdd Then
			LightSeqEven.play SeqAllOff
			LightSeqOdd.play SeqAllOn
			bLightShowBlinkOdd = False
		Else
			LightSeqOdd.play SeqAllOff
			LightSeqEven.play SeqAllOn
			bLightShowBlinkOdd = True
		End If
	End If
End Sub

Sub LightShowStart (oEvent)
	Dim i

	If eLightShowNone = oEvent.lightshow Then Exit Sub
	LightShowEnd
	nLightShowTime = oEvent.duration
	If nLightShowTime > 4000 then nLightShowTime = 4000
	
	Select Case oEvent.lightshow
		Case eLightShowHatchShort
			LightSeqAlmostAll.UpdateInterval = 11
			LightSeqAlmostAll.play SeqStripe1HorizOn,40
			anFlashOrder = Array(1, 2, 3, 4)
			nMaxFlashes = 4
		Case eLightShowHatchLong
			LightSeqAlmostAll.UpdateInterval = 33
			LightSeqAlmostAll.play SeqStripe1HorizOn,40
			anFlashOrder = Array(1, 2, 3, 4)
			nMaxFlashes = 12
		Case eLightShowRadarShort
			LightSeqAlmostAll.UpdateInterval = 5
			LightSeqAlmostAll.play SeqRadarRightOn, 40
			anFlashOrder = Array(1, 4, 3, 2)
			nMaxFlashes = 4
		Case eLightShowRadarLong
			LightSeqAlmostAll.UpdateInterval = 17
			LightSeqAlmostAll.play SeqRadarRightOn, 40
			anFlashOrder = Array(1, 4, 3, 2)
			nMaxFlashes = 12
		Case eLightShowRiseShort
			LightSeqAlmostAll.UpdateInterval = 8
			LightSeqAlmostAll.play SeqUpOn, 40
			anFlashOrder = Array(1, 2, 4, 3)
			nMaxFlashes = 4
		Case eLightShowRiseLong
			LightSeqAlmostAll.UpdateInterval = 22
			LightSeqAlmostAll.play SeqUpOn, 60
			anFlashOrder = Array(1, 2, 4, 3)
			nMaxFlashes = 12
		Case eLightShowSinkShort
			LightSeqAlmostAll.UpdateInterval = 8
			LightSeqAlmostAll.play SeqDownOn, 60
			anFlashOrder = Array(3, 4, 1, 2)
			nMaxFlashes = 4
		Case eLightShowSinkLong
			LightSeqAlmostAll.UpdateInterval = 22
			LightSeqAlmostAll.play SeqDownOn, 60
			anFlashOrder = Array(3, 4, 3, 2)
			nMaxFlashes = 12
		Case eLightShowDiagShort
			LightSeqAlmostAll.UpdateInterval = 5
			LightSeqAlmostAll.play SeqDiagUpLeftOn, 40
			anFlashOrder = Array(2, 1, 3, 4)
			nMaxFlashes = 4
		Case eLightShowDiagLong
			LightSeqAlmostAll.UpdateInterval = 17
			LightSeqAlmostAll.play SeqDiagUpLeftOn, 40
			anFlashOrder = Array(2, 1, 3, 4)
			nMaxFlashes = 12
		Case eLightShowCircleShort
			LightSeqAlmostAll.UpdateInterval = 8
			LightSeqAlmostAll.play SeqCircleInOn, 40
			anFlashOrder = Array(4, 3, 2, 1)
			nMaxFlashes = 4
		Case eLightShowCircleLong
			LightSeqAlmostAll.UpdateInterval = 22
			LightSeqAlmostAll.play SeqCircleInOn, 40
			anFlashOrder = Array(4, 3, 2, 1)
			nMaxFlashes = 12
		Case eLightShowMball1Short
			LightSeqAlmostAll.UpdateInterval = 8
			LightSeqAlmostAll.play SeqFanLeftUpOn, 40
			anFlashOrder = Array(1, 2, 3, 4)
			nMaxFlashes = 4
		Case eLightShowMball1Long
			LightSeqAlmostAll.UpdateInterval = 17
			LightSeqAlmostAll.play SeqFanLeftUpOn, 40
			anFlashOrder = Array(1, 2, 3, 4)
			nMaxFlashes = 12
		Case eLightShowMystery
			LightSeqAlmostAll.UpdateInterval = 8
			LightSeqAlmostAll.play SeqScrewLeftOn, 25, 999
			anFlashOrder = Array(1, 2, 3, 4)
			nMaxFlashes = 12
		Case eLightShowStrobeLong, eLightShowModeComplete
			LightSeqEven.play SeqAllOn
			LightSeqOdd.play SeqAllOff
			bLightShowBlinkOdd = True
			anFlashOrder = Array(2, 4, 3, 1)
			nMaxFlashes = 12
		Case eLightShowStrobeShort
			LightSeqEven.play SeqAllOff
			LightSeqOdd.play SeqAllOn
			bLightShowBlinkOdd = True
			anFlashOrder = Array(2, 4, 3, 1)
			nMaxFlashes = 4
			nLightShowTime = 1000
	End Select

	nLightShowCurrent = oEvent.lightshow
	TimerLightShow.Enabled = True
	nLightShowUpdates = 0
End Sub


'*******************************************
'  ZQUE - Event queue
'*******************************************

Class EventItem
	Public priority
	Public maxQueueLength
	Public text
	Public duration
	Public soundName
	Public soundVolume
	Public pupTrigger
	Public lightshow
	Public holdBallAt
	Public interruptOngoing
	Public special
	Public Enabled
	Public withMode

	Private Sub Class_Initialize
		priority = ePrioIdle
		maxQueueLength = Empty
		text = ""
		duration = 0
		soundName = ""
		soundVolume = 0
		pupTrigger = 0
		lightshow = eLightShowNone
		holdBallAt = eShotNone
		interruptOngoing = False
		special = ""
		Enabled = True
		withMode = eModeNone
	End Sub
End Class

' priority queue for events
Class EventQueue
	private maQueue()
	private mnSize
	private mnCapacity

	private sub Class_Initialize
		mnCapacity = 10
		mnSize = 0
		redim maQueue(mnCapacity)
	end Sub

	public property get Size
		Size = mnSize
	end property

	public Sub add(element)
		Dim i, nInsertPoint
		Dim nValidItems

		If "modeselect" = element.special Then
			element.duration = 999999999
			element.priority = ePrioModeSelect
		End If
		' Check if queue length exceeds max for the event
		If (Not IsEmpty(element.maxQueueLength)) Then
			If mnSize > element.maxQueueLength Then Exit Sub
		End If
		' Grow capacity if needed
		If mnSize >= mnCapacity Then
			mnCapacity = mnCapacity * 2
			Redim preserve maQueue(mnCapacity)
		End If
		' Handle event immediately if the event should interrupt ongoing events
		If element.interruptOngoing Then
			If oCurrentEvent is Nothing Then
				' TODO: interrupt audio / video / lightshows
				' HandleQueueEvent element
				' Exit Sub
			Elseif element.priority <= oCurrentEvent.priority Then
				' TODO: interrupt audio / video
				'If bEnablePuP Then
				'	PuPlayer.playstop pDMD
				'End If
				Set oCurrentEvent = Nothing
				nTextDuration = 0
				nTextPriority = ePrioIdle
				if bEnablePuP Then
					For Each i in Array("Splash1", "Splash2A", "Splash2B", _
										"Splash3A", "Splash3B", "Splash3C")
						pDMDLabelSet i, ""
					Next
				End If
				' interrupt light shows
				LightShowEnd
				'HandleQueueEvent element
				'Exit Sub
			End If
		End If
		' Special case if the queue is empty
		if 0 = mnSize Then
'			If oCurrentEvent is Nothing Then
				' Handle event immediately if no event is currently ongoing
'				HandleQueueEvent element
'			Else
				Set maQueue(0) = element
				mnSize = mnSize + 1
'			End If
		Else
			' Find the first item less prioritized than the item to add
			nInsertPoint = mnSize
			For i = 0 to mnSize - 1
				If maQueue(i).priority > element.priority Then
					nInsertPoint = i
					Exit For
				End If
			Next
			'copy everything past the insert point to the next index
			If nInsertPoint < mnSize Then
				For i = mnSize - 1 to nInsertPoint step -1
					Set maQueue(i + 1) = maQueue(i)
				Next
			End If

			'overwrite the item at the insert point
			Set maQueue(nInsertPoint) = element
			mnSize = mnSize + 1

			' delete items where the new queue size exceeds the item's max
			nValidItems = 0
			For i = 0 to mnSize - 1
				If IsEmpty(maQueue(i).maxQueueLength) Then
					Set maQueue(nValidItems) = maQueue(i)
					nValidItems = nValidItems + 1
				Elseif maQueue(i).maxQueueLength <= mnSize Then
					Set maQueue(nValidItems) = maQueue(i)
					nValidItems = nValidItems + 1
				End If
			Next

			If 0 = nValidItems Then
				mnCapacity = 10
				mnSize = 0
				redim maQueue(mnCapacity)
			Else
				mnSize = nValidItems
			End If
		End If
	end Sub

	public Function deQueue()
		Dim i

		If 0 = mnSize Then
			set deQueue = null
		Else
			set deQueue = maQueue(0)
			'copy everything past the first item to the previous index
			If mnSize > 1 Then
				For i = 1 to mnSize - 1
					Set maQueue(i - 1) = maQueue(i)
				Next
			End If
			mnSize = mnSize - 1
			' shrink the queue capacity if it has grown and we removed the last item
			if mnSize < 1 and mnCapacity > 10 Then
				mnCapacity = 10
				mnSize = 0
				redim maQueue(mnCapacity)
			End If
		End If
	End Function

	' Return the first item without removing it
	public function Peek()
		If 0 = mnSize Then
			set Peek = null
		Else
			set Peek = maQueue(0)
		End If
	end Function

	public sub Clear()
		mnCapacity = 10
		mnSize = 0
		redim maQueue(mnCapacity)
	end Sub
End Class

Sub HandleQueueEvent
	Dim i, bHandleMore, bSkipEvent

	If GameTime - nTimeLastPuP < 200 Then
		Set oCurrentEvent = Nothing
		Exit Sub
	End If
	Set oCurrentEvent = oEventQueue.deQueue
	bHandleMore = True
	While bHandleMore
		If "modeselect" = oCurrentEvent.special Then
			nTimeDelayLowerScoop = 999999999
			nModeSelected = ModeSelectRandom
			bSelectingMode = True
			DOF 118,DOFOn
			bHandleMore = False
			RemoveShotColor eShotLowerScoop, eColorRainbow
			sDMDScene = "modeselect"
		Else
			bSkipEvent = False
			If oCurrentEvent.withMode <> eModeNone Then
				If Not avModesRunning(nPlayer).Contains(oCurrentEvent.withMode) Then
					bSkipEvent = True
				End If
			End If
			If ePrioMystery = oCurrentEvent.priority Then
				nMysteryAnimStep = 1
				TimerMystery_timer
				TimerMystery.Enabled = True
			End If
			If eShotLowerScoop = oCurrentEvent.holdBallAt Then
				nTimeDelayLowerScoop = oCurrentEvent.duration
			Elseif eShotUpperScoop =  oCurrentEvent.holdBallAt Then
				nTimeDelayVUK = oCurrentEvent.duration
			End If
			If oCurrentEvent.duration > 0 And (not bSkipEvent) Then
                Select Case oCurrentEvent.pupTrigger
                    Case 774:  DOF 195, DOFPulse ' Bender jackpot
                    Case 775:  DOF 196, DOFPulse ' Bender super jackpot
                End Select
				If IsArray(oCurrentEvent.text) Then
					If ePrioModeProgress = oCurrentEvent.priority then
						nTimeModeTextDisplay = GameTime
						DMDTimedText asModeMessage, oCurrentEvent.duration, oCurrentEvent.priority
					Else
						DMDTimedText oCurrentEvent.text, oCurrentEvent.duration, oCurrentEvent.priority
					End If
				ElseIf oCurrentEvent.text <> "" Then
					DMDTimedText oCurrentEvent.text, oCurrentEvent.duration, oCurrentEvent.priority
				Else
					nDMDTextDisplayTime = 0
				End If
				bHandleMore = False
				' lightshows
				If oCurrentEvent.lightshow <> eLightShowNone Then
					LightShowStart oCurrentEvent
				End If
				' video 
				If (oCurrentEvent.pupTrigger <> 0) And bEnablePuP _
				And (Not (avModesRunning(nPlayer).Contains(eModeMultiball2) _
				  Or (nModePending = eModeMultiball2)) or oCurrentEvent.pupTrigger = 773) Then
					' Do not play any video other than Bender multiball
					' if Bender multiball is starting or running
					nTimePupStartPlay = GameTime
					PuPEvent oCurrentEvent.pupTrigger
				End If
				' audio
				DuckMusic
			Else
			' If an event has duration 0, handle the next event immediately after
				If oEventQueue.Size > 0 Then
					Set oCurrentEvent = oEventQueue.deQueue
					bHandleMore = True
				Else
					Set oCurrentEvent = Nothing
					bHandleMore = False
				End If
			End If
		End If
	Wend
End Sub

Sub ClearEvents
	' interrupt videos
	If bEnablePuP and (Not oCurrentEvent is Nothing) Then
		PuPlayer.playstop pDMD
	End If
	Set oCurrentEvent = Nothing
	nTextDuration = 0
	nTextPriority = ePrioIdle
	oEventQueue.Clear
	nTimeLastPuP = GameTime
	' interrupt light shows
	LightShowEnd
End Sub

'***************************************************************
'* ZINF - Instant info
'***************************************************************

Function GetInstantInfoPage(nPage)
	Dim i
	Dim nCount
	Dim nShots
	Dim nMode
	Dim sText, sNextAward, nNextAwardAt

	Select Case nPage
		Case 0
			nCount = anExtraBallsLit(nPlayer)
			If 1 = nCount Then
				sText = "1 EXTRA BALL LIT"
			Else
				sText = nCount & " EXTRA BALLS LIT"
			End If
			If 1 = nExtraBalls Then
				GetInstantInfoPage = Array("1 EXTRA BALL", sText)
			Else
				GetInstantInfoPage = Array(nExtraBalls & " EXTRA BALLS", sText)
			End If
		Case 1
			nCount = anBlasts(nPlayer)
			If 0 = nCount Then
				GetInstantInfoPage = Array("NO BLASTS READY", "DROP TARGETS ADD BLAST")
			ElseIf 1 = nCount Then
				GetInstantInfoPage = Array("1 BLAST READY - HIT", "ACTION BUTTON TO USE")
			Else
				GetInstantInfoPage = Array(nCount & " BLASTS READY - HIT", "ACTION BUTTON TO USE")
			End If
		Case 2
			GetInstantInfoPage = Array("PLAYFIELD MULTIPLIER", Round(fPlayfieldX, 1) & " X")
		Case 3
			nCount = anMysteryShotsMade(nPlayer)
			If 2 = nCount Then
				GetInstantInfoPage = Array("ONE MORE HIT", "TO LIGHT MYSTERY")
			Elseif nCount > 2 Then
				GetInstantInfoPage = Array("MYSTERY IS LIT", "AT LOWER SCOOP")
			Else
				GetInstantInfoPage = Array((3 - nCount) & " MORE HITS", "TO LIGHT MYSTERY")
			End If
		Case 4
			nNextAwardAt = anComboLastCollect(nPlayer) + 5
			If 1 = anCombos(nPlayer) Then
				sText = "1 COMBO"
			Else
				sText = anCombos(nPlayer) & " COMBOS"
			End If
			If eComboAwardNone = anNextComboAward(nPlayer) Then
				sNextAward = "ABSOLUTELY NOTHING"
			Else
				sNextAward = asComboAwardText(anNextComboAward(nPlayer))
			End If

			If anCombos(nPlayer) < nNextAwardAt Then
				GetInstantInfoPage = Array(sText & " - LIGHT", sNextAward & " AT " & nNextAwardAt)
			Else
				GetInstantInfoPage = Array(sText, sNextAward & " IS LIT")
			End If
		Case 5
			If avModesRunning(nPlayer).Contains(eModeMultiball1) Then
				GetInstantInfoPage = Array("BASEMULTIBALL", "RUNNING, JACKPOT=30M")
			ElseIf 1 = anMBall1Locks(nPlayer) Then
				GetInstantInfoPage = Array("BASEMULTIBALL", "1 BALL LOCKED")
			Else
				sText = anMBall1Locks(nPlayer) & " BALLS LOCKED"
				GetInstantInfoPage = Array("BASEMULTIBALL", sText)
			End If
		Case 6
			If avModesRunning(nPlayer).Contains(eModeMultiball1) Then
				GetInstantInfoPage = Array("BASEMULTIBALL", "RUNNING, SUPER JP=80M")
			Elseif (Not abMball1LoopLeft(nPlayer)) And (Not abMball1LoopRight(nPlayer)) Then
				GetInstantInfoPage = Array("BASEMULTIBALL", "LOCK IS LIT")
			Elseif 0 = anMball1Played(nPlayer) Or 1 = anMball1Played(nPlayer) then
				GetInstantInfoPage = Array("BASEMULTIBALL", "1 SHOT TO LIGHT LOCK")
			Elseif 2 = anMball1Played(nPlayer) then
				If abMball1LoopLeft(nPlayer) And abMball1LoopRight(nPlayer) Then
					GetInstantInfoPage = Array("BASEMULTIBALL", "2 SHOTS TO LIGHT LOCK")
				Else
					GetInstantInfoPage = Array("BASEMULTIBALL", "1 SHOT TO LIGHT LOCK")
				End If
			Else
				If abMball1LoopLeft(nPlayer) Then
					GetInstantInfoPage = Array("BASEMULTIBALL", "2 SHOTS TO LIGHT LOCK")
				Else
					GetInstantInfoPage = Array("BASEMULTIBALL", "1 SHOT TO LIGHT LOCK")
				End If
			End If
		Case 7
			If avModesRunning(nPlayer).Contains(eModeMultiball2) Then
				GetInstantInfoPage = Array("BENDER MULTIBALL", "RUNNING, JACKPOT=15M")
			ElseIf 1 = anMBall1Locks(nPlayer) Then
				GetInstantInfoPage = Array("BENDER MULTIBALL", "1 BALL LOCKED")
			Else
				sText = anMBall1Locks(nPlayer) & " BALLS LOCKED"
				GetInstantInfoPage = Array("BENDER MULTIBALL", sText)
			End If
		Case 8
			If avModesRunning(nPlayer).Contains(eModeMultiball2) Then
				GetInstantInfoPage = Array("BENDER MULTIBALL", "RUNNING, SUPER JP=80M")
			ElseIf 0 = anMball2Played(nPlayer) Then
				GetInstantInfoPage = Array("BENDER MULTIBALL", "LOCK IS LIT")
			Else
				Select Case anMBall2Locks(nPlayer)
					Case 3, 5, 7
						GetInstantInfoPage = Array("BENDER MULTIBALL", "LOCK IS LIT")
					Case 2, 4, 6
						GetInstantInfoPage = Array("BENDER MULTIBALL", "1 HIT TO LIGHT LOCK")
					Case 1
						GetInstantInfoPage = Array("BENDER MULTIBALL", "2 HITS TO LIGHT LOCK")
					Case Else
						GetInstantInfoPage = Array("BENDER MULTIBALL", "3 HITS TO LIGHT LOCK")
				End Select
			End If
		Case 9, 10, 11, 12, 13, 14, 15, 16, 17
			nMode = nPage - 9
			If avModesCompleted(nPlayer).Contains(nMode) Then
				GetInstantInfoPage = Array(asModeNames(nMode), "MODE COMPLETED")
			Elseif 0 = aanModeAttempts(nPlayer, nMode) Then
				GetInstantInfoPage = Array(asModeNames(nMode), "MODE NOT STARTED")
			Else
				sText = "PROGRESS: " & aanModeShots(nPlayer, nMode) & " / " & anShotsToWin(nMode)
				GetInstantInfoPage = Array(asModeNames(nMode), sText)
			End If
		Case 18
			If avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
				GetInstantInfoPage = Array("MINI-WIZARD 1", "NOW RUNNING")
			Elseif avModesCompleted(nPlayer).Contains(eModeCherryBomb) Then
				GetInstantInfoPage = Array("MINI-WIZARD 1", "HAS BEEN PLAYED")
			Else
				nCount = 0
				For i = 0 to 8
					if avModesCompleted(nPlayer).Contains(i) Then nCount = nCount + 1
				Next
				If 3 = nCount Then
					GetInstantInfoPage = Array("MINI-WIZARD 1", "IS READY")
				Elseif 2 = nCount Then
					GetInstantInfoPage = Array("COMPLETE 1 MODE TO", "LIGHT MINI-WIZARD 1")
				Else
					sText = "COMPLETE " & (3 - nCount) & " MODES TO"
					GetInstantInfoPage = Array(sText, "LIGHT MINI-WIZARD 1")
				End If
			End If
		Case 19
			If avModesRunning(nPlayer).Contains(eModeImmolation) Then
				GetInstantInfoPage = Array("MINI-WIZARD 2", "NOW RUNNING")
			Elseif avModesCompleted(nPlayer).Contains(eModeImmolation) Then
				GetInstantInfoPage = Array("MINI-WIZARD 2", "HAS BEEN PLAYED")
			Else
				nCount = 0
				For i = 0 to 8
					if avModesCompleted(nPlayer).Contains(i) Then nCount = nCount + 1
				Next
				If 6 = nCount Then
					GetInstantInfoPage = Array("MINI-WIZARD 2", "IS READY")
				Elseif 5 = nCount Then
					GetInstantInfoPage = Array("COMPLETE 1 MODE TO", "LIGHT MINI-WIZARD 2")
				Else
					sText = "COMPLETE " & (6 - nCount) & " MODES TO"
					GetInstantInfoPage = Array(sText, "LIGHT MINI-WIZARD 2")
				End If
			End If
		Case 20
			If avModesRunning(nPlayer).Contains(eModeSlurm) Then
				GetInstantInfoPage = Array("SLURM", "NOW RUNNING")
			Elseif avModesCompleted(nPlayer).Contains(eModeSlurm) Then
				GetInstantInfoPage = Array("SLURM", "HAS BEEN PLAYED")
			Else
				nCount = 0
				For i = 0 to 8
					if avModesCompleted(nPlayer).Contains(i) Then nCount = nCount + 1
				Next
				If 9 = nCount Then
					GetInstantInfoPage = Array("SLURM", "IS READY")
				Elseif 8 = nCount Then
					GetInstantInfoPage = Array("COMPLETE 1 MODE TO", "LIGHT SLURM")
				Else
					sText = "COMPLETE " & (9 - nCount) & " MODES TO"
					GetInstantInfoPage = Array(sText, "LIGHT SLURM")
				End If
			End If
		Case 21
			sText = HighScoreName(0) & " " & FormatScore(HighScore(0))
			GetInstantInfoPage = Array("GRAND CHAMPION", sText)
		Case 22, 23, 24, 25
			nCount = nPage - 21
			sText = HighScoreName(nCount) & " " & FormatScore(HighScore(nCount))
			GetInstantInfoPage = Array("HIGH SCORE " & nCount, sText)
		Case Else
			GetInstantInfoPage = Array("REPORT THIS BUG", "PAGE " & nPage & " SHOULDN'T APPEAR")
	End Select
End Function

'***************************************************************
'* ZVAR - Round robin variations on videos
'***************************************************************
Dim oRoundRobinVariations
Dim oRoundRobinPlays
Dim oRoundRobinEvents
Dim oRoundRobinLengths

Sub InitRoundRobin
	Set oRoundRobinVariations = CreateObject("Scripting.Dictionary")
	Set oRoundRobinPlays = CreateObject("Scripting.Dictionary")
	Set oRoundRobinEvents = CreateObject("Scripting.Dictionary")
	Set oRoundRobinLengths = CreateObject("Scripting.Dictionary")

	oRoundRobinVariations.add "BlastAdded", 2
	oRoundRobinPlays.add "BlastAdded", 0
	oRoundRobinEvents.add "BlastAdded", Array(712, 303)
	oRoundRobinLengths.add "BlastAdded", Array(2066, 2466)

	oRoundRobinVariations.add "BlastUsed", 4
	oRoundRobinPlays.add "BlastUsed", 0
	oRoundRobinEvents.add "BlastUsed", Array(713, 304, 305, 306)
	oRoundRobinLengths.add "BlastUsed", Array(3600, 2100, 2700, 3800)

	oRoundRobinVariations.add "Combo", 5
	oRoundRobinPlays.add "Combo", 0
	oRoundRobinEvents.add "Combo", Array(714, 307, 308, 309, 310)
	oRoundRobinLengths.add "Combo", Array(3900, 3900, 3666, 2000, 2266)

	oRoundRobinVariations.add "Drain", 6
	oRoundRobinPlays.add "Drain", 0
	oRoundRobinEvents.add "Drain", Array(706, 311, 312, 313, 314, 315)
	oRoundRobinLengths.add "Drain", Array(6300, 6300, 6300, 6300, 6300, 6300)

	oRoundRobinVariations.add "SkillShot", 5
	oRoundRobinPlays.add "SkillShot", 0
	oRoundRobinEvents.add "SkillShot", Array(759, 760, 451, 452, 453)
	oRoundRobinLengths.add "SkillShot", Array(5400, 5500, 4800, 6766, 4000)

	oRoundRobinVariations.add "NewGame", 3
	oRoundRobinPlays.add "NewGame", 0
	oRoundRobinEvents.add "NewGame", Array(701, 702, 703)
	oRoundRobinLengths.add "NewGame", Array(6600, 3900, 6966)

	oRoundRobinVariations.add "GameOver", 3
	oRoundRobinPlays.add "GameOver", 0
	oRoundRobinEvents.add "GameOver", Array(790, 791, 789)
	oRoundRobinLengths.add "GameOver", Array(5800, 4600, 5800)

	oRoundRobinVariations.add "BoothEnter", 6
	oRoundRobinPlays.add "BoothEnter", 0
	oRoundRobinEvents.add "BoothEnter", Array(710, 454, 455, 456, 457, 458)
	oRoundRobinLengths.add "BoothEnter", Array(5700, 4700, 5500, 4400, 5000, 5433)

	oRoundRobinVariations.add "BoothSave", 3
	oRoundRobinPlays.add "BoothSave", 0
	oRoundRobinEvents.add "BoothSave", Array(459, 460, 461)
	oRoundRobinLengths.add "BoothSave", Array(3800, 4866, 4133)

	oRoundRobinVariations.add "BallSaved", 4
	oRoundRobinPlays.add "BallSaved", 0
	oRoundRobinEvents.add "BallSaved", Array(705, 467, 468, 469)
	oRoundRobinLengths.add "BallSaved", Array(5433, 7033, 4200, 6366)
End Sub

Function RoundRobinEvent(sEvent)
	Dim nIndex, nPlays, anEvents

	nPlays = oRoundRobinPlays.Item(sEvent)
	oRoundRobinPlays.Item(sEvent) = nPlays + 1
	nIndex = nPlays Mod oRoundRobinVariations.Item(sEvent)
	anEvents = oRoundRobinEvents.Item(sEvent)
	RoundRobinEvent = anEvents(nIndex)
End Function

Function RoundRobinLength(sEvent)
	Dim nIndex, nPlays, anEvents

	nPlays = oRoundRobinPlays.Item(sEvent) - 1
	nIndex = nPlays Mod oRoundRobinVariations.Item(sEvent)
	anEvents = oRoundRobinLengths.Item(sEvent)
	RoundRobinLength = anEvents(nIndex)
End Function

'*******************************************
'  ZMUS - Music
'*******************************************
Dim fCurrentMusicVol : fCurrentMusicVol = 0
Dim sMusicTrack : sMusicTrack = ""
Dim fSongVolume : fSongVolume = 1

Sub SwitchMusic(sTrack)
	If sTrack <> sMusicTrack Then
		StopSound sMusicTrack
		sMusicTrack = sTrack
		If "music-attract" = sTrack Then
			PlaySound sTrack, -1, fAttractVolume
			fCurrentMusicVol = fAttractVolume
		ElseIf Not oCurrentEvent is Nothing Then
			If oCurrentEvent.pupTrigger <> 0 Then
				PlaySound sTrack, -1, fMusicVolume * fDuckFactor * fSongVolume
				fCurrentMusicVol = fMusicVolume * fDuckfactor
			Else
				PlaySound sTrack, -1, fMusicVolume * fSongVolume
				fCurrentMusicVol = fMusicVolume
			End If
		Else
			PlaySound sTrack, -1, fMusicVolume * fSongVolume
			fCurrentMusicVol = fMusicVolume
		End If
	End If
End Sub

Sub DuckMusic
	Dim fGoalVolume
	If sMusicTrack = "music-attract" then
		fGoalVolume = fAttractVolume
	Else
		fGoalVolume = fMusicVolume
	end If
	PlaySound sMusicTrack, -1, fGoalVolume * fDuckFactor * fSongVolume,0,0,0,1,0
	fCurrentMusicVol = fGoalVolume * fDuckfactor
end sub

Sub DuckUpdate
	Dim bDuck, fGoalVolume
	bDuck = True

	If Not oCurrentEvent is Nothing Then
		If oCurrentEvent.pupTrigger <> 0 Then
			bDuck = True
		Else
			bDuck = False
		End If
	Else
		bDuck = False
	End If

	If (Not bDuck) And sMusicTrack <> "" Then
		If sMusicTrack = "music-attract" then
			fGoalVolume = fAttractVolume
		Else
			fGoalVolume = fMusicVolume
		end If

		If fCurrentMusicVol < fGoalVolume Then
			' fade in is 6 updates of 17 ms
			fCurrentMusicVol = fCurrentMusicVol + ((fGoalVolume - fDuckfactor) / 6)
			If fCurrentMusicVol >= fGoalVolume Then
				fCurrentMusicVol = fGoalVolume
			End If
			PlaySound sMusicTrack, -1, fCurrentMusicVol * fSongVolume,0,0,0,1,0
		End If
	End If
end sub

Sub PlayModeMusic
	fSongVolume = 1
	If bEnteringHighScore Then
		fSongVolume = 0.85
		SwitchMusic "music-highscore"
	Elseif avModesRunning(nPlayer).Contains(eModeSlurm) Then
		SwitchMusic "music-slurm"
	Elseif avModesRunning(nPlayer).Contains(eModeImmolation) Then
		SwitchMusic "music-wizard2"
	Elseif avModesRunning(nPlayer).Contains(eModeCherryBomb) Then
		SwitchMusic "music-poker"
	Elseif avModesRunning(nPlayer).Contains(eModeMultiball1) Then
		fSongVolume = 0.85
		SwitchMusic "music-multiball1"
	Elseif avModesRunning(nPlayer).Contains(eModeMultiball2) _
	and nTimeMBallGraceLeft < 1 Then
		StopAllMusic
	Elseif avModesRunning(nPlayer).Contains(eModeChapek) Then
		fSongVolume = 0.8
		SwitchMusic "music-chapek9"
	Elseif avModesRunning(nPlayer).Contains(eModeDecapod) Then
		SwitchMusic "music-decapod10"
	Elseif avModesRunning(nPlayer).Contains(eModeOsiris) Then
		SwitchMusic "music-omicron"
	Elseif avModesRunning(nPlayer).Contains(eModeDaily) Then
		SwitchMusic "music-naturama"
	Elseif avModesRunning(nPlayer).Contains(eModeAmazonia) Then
		SwitchMusic "music-amazonia"
	Elseif avModesRunning(nPlayer).Contains(eModeEarth) Then
		fSongVolume = 0.9
		SwitchMusic "music-earth"
	Elseif avModesRunning(nPlayer).Contains(eModeMoon) Then
		SwitchMusic "music-moon"
	Elseif avModesRunning(nPlayer).Contains(eModeOmicron) Then
		SwitchMusic "music-slug_invasion"
	Elseif avModesRunning(nPlayer).Contains(eModeMars) Then
		SwitchMusic "music-mars"
	Else
		SwitchMusic "music-oom"
	End If
End Sub

Sub StopAllMusic
	sMusicTrack = ""
	StopSound "music-amazonia"
	StopSound "music-attract"
	StopSound "music-chapek9"
	StopSound "music-decapod10"
	StopSound "music-earth"
	StopSound "music-highscore"
	StopSound "music-mars"
	StopSound "music-moon"
    StopSound "music-multiball1"
	StopSound "music-naturama"
	StopSound "music-omicron"
	StopSound "music-oom"
	StopSound "music-poker"
	StopSound "music-slug_invasion"
	StopSound "music-slurm"
	StopSound "music-wizard2"
End Sub

'***************************************************************
'* ZBSH - VPW DYNAMIC BALL SHADOWS by Iakki, Apophis, and Wylte
'***************************************************************

'****** INSTRUCTIONS please read ******

'****** Part A:  Table Elements ******
'
' Import the "bsrtx7" and "ballshadow" images
' Import the shadow materials file (3 sets included) (you can also export the 3 sets from this table to create the same file)
' Copy in the BallShadowA flasher set and the sets of primitives named BallShadow#, RtxBallShadow#, and RtxBall2Shadow#
'	* Count from 0 up, with at least as many objects each as there can be balls, including locked balls.  You'll get an "eval" warning if tnob is higher
'	* Warning:  If merging with another system (JP's ballrolling), you may need to check tnob math and add an extra BallShadowA# flasher (out of range error)
' Ensure you have a timer with a -1 interval that is always running
' Set plastic ramps DB to *less* than the ambient shadows (-10000) if you want to see the pf shadow through the ramp

' Create a collection called DynamicSources that includes all light sources you want to cast ball shadows
' It's recommended that you be selective in which lights go in this collection, as there are limitations:
' 1. The shadows can "pass through" solid objects and other light sources, so be mindful of where the lights would actually able to cast shadows
' 2. If there are more than two equidistant sources, the shadows can suddenly switch on and off, so places like top and bottom lanes need attention
' 3. At this time the shadows get the light on/off from tracking gilvl, so if you have lights you want shadows for that are on at different times you will need to either:
'	a) remove this restriction (shadows think lights are always On)
'	b) come up with a custom solution (see TZ example in script)
' After confirming the shadows work in general, use ball control to move around and look for any weird behavior

'****** End Part A:  Table Elements ******


'****** Part B:  Code and Functions ******

' *** Timer sub
' The "DynamicBSUpdate" sub should be called by a timer with an interval of -1 (framerate)
' Example timer sub:

'Sub FrameTimer_Timer()
'	If DynamicBallShadowsOn Or AmbientBallShadowOn Then DynamicBSUpdate 'update ball shadows
'End Sub

' *** These are usually defined elsewhere (ballrolling), but activate here if necessary
'Const tnob = 10 ' total number of balls
'Const lob = 0	'locked balls on start; might need some fiddling depending on how your locked balls are done
'Dim tablewidth: tablewidth = Table1.width
'Dim tableheight: tableheight = Table1.height

' *** User Options - Uncomment here or move to top for easy access by players
'----- Shadow Options -----
'Const DynamicBallShadowsOn = 1		'0 = no dynamic ball shadow ("triangles" near slings and such), 1 = enable dynamic ball shadow
'Const AmbientBallShadowOn = 1		'0 = Static shadow under ball ("flasher" image, like JP's)
'									'1 = Moving ball shadow ("primitive" object, like ninuzzu's) - This is the only one that shows up on the pf when in ramps and fades when close to lights!
'									'2 = flasher image shadow, but it moves like ninuzzu's

' *** This segment goes within the RollingUpdate sub, so that if Ambient...=0 and Dynamic...=0 the entire DynamicBSUpdate sub can be skipped for max performance
' *** Change gBOT to BOT if using existing getballs code
' *** Includes lines commonly found there, for reference:
'	' stop the sound of deleted balls
'	For b = UBound(gBOT) + 1 to tnob
'		If AmbientBallShadowOn = 0 Then BallShadowA(b).visible = 0
'		...rolling(b) = False
'		...StopSound("BallRoll_" & b)
'	Next
'
' ...rolling and drop sounds...

'		If DropCount(b) < 5 Then
'			DropCount(b) = DropCount(b) + 1
'		End If
'
'		' "Static" Ball Shadows
'		If AmbientBallShadowOn = 0 Then
'			If gBOT(b).Z > 30 Then
'				BallShadowA(b).height=gBOT(b).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping the ramp
'			Else
'				BallShadowA(b).height=gBOT(b).z - BallSize/2 + 5
'			End If
'			BallShadowA(b).Y = gBOT(b).Y + Ballsize/5 + offsetY
'			BallShadowA(b).X = gBOT(b).X + offsetX
'			BallShadowA(b).visible = 1
'		End If

' *** Required Functions, enable these if they are not already present elswhere in your table
Function max(a,b)
	if a > b then 
		max = a
	Else
		max = b
	end if
end Function

Function min(a,b)
	if a > b then 
		min = b
	Else
		min = a
	end if
end Function

'Function Distance(ax,ay,bx,by)
'	Distance = SQR((ax - bx)^2 + (ay - by)^2)
'End Function

'Dim PI: PI = 4*Atn(1)

'Function Atn2(dy, dx)
'	If dx > 0 Then
'		Atn2 = Atn(dy / dx)
'	ElseIf dx < 0 Then
'		If dy = 0 Then 
'			Atn2 = pi
'		Else
'			Atn2 = Sgn(dy) * (pi - Atn(Abs(dy / dx)))
'		end if
'	ElseIf dx = 0 Then
'		if dy = 0 Then
'			Atn2 = 0
'		else
'			Atn2 = Sgn(dy) * pi / 2
'		end if
'	End If
'End Function

'Function AnglePP(ax,ay,bx,by)
'	AnglePP = Atn2((by - ay),(bx - ax))*180/PI
'End Function

'****** End Part B:  Code and Functions ******


'****** Part C:  The Magic ******

' *** These define the appearance of shadows in your table	***

'Ambient (Room light source)
Const AmbientBSFactor 		= 0.9	'0 to 1, higher is darker
Const AmbientMovement		= 2		'1 to 4, higher means more movement as the ball moves left and right
Const offsetX				= 0		'Offset x position under ball	(These are if you want to change where the "room" light is for calculating the shadow position,)
Const offsetY				= 0		'Offset y position under ball	 (for example 5,5 if the light is in the back left corner)
'Dynamic (Table light sources)
Const DynamicBSFactor 		= 0.95	'0 to 1, higher is darker
Const Wideness				= 20	'Sets how wide the dynamic ball shadows can get (20 +5 thinness is technically most accurate for lights at z ~25 hitting a 50 unit ball)
Const Thinness				= 5		'Sets minimum as ball moves away from source

' ***														***

' *** Trim or extend these to *match* the number of balls/primitives/flashers on the table!
dim objrtx1(6), objrtx2(6)
dim objBallShadow(6)
Dim BallShadowA
BallShadowA = Array (BallShadowA0,BallShadowA1,BallShadowA2,BallShadowA3,BallShadowA4,BallShadowA5 )
Dim DSSources(30), numberofsources', DSGISide(30) 'Adapted for TZ with GI left / GI right

'Initialization
DynamicBSInit

sub DynamicBSInit()
	Dim iii, source

	for iii = 0 to tnob - 1								'Prepares the shadow objects before play begins
		Set objrtx1(iii) = Eval("RtxBallShadow" & iii)
		objrtx1(iii).material = "RtxBallShadow" & iii
		objrtx1(iii).z = 1 + iii/1000 + 0.01			'Separate z for layering without clipping
		objrtx1(iii).visible = 0

		Set objrtx2(iii) = Eval("RtxBall2Shadow" & iii)
		objrtx2(iii).material = "RtxBallShadow2_" & iii
		objrtx2(iii).z = 1 + iii/1000 + 0.02
		objrtx2(iii).visible = 0

		Set objBallShadow(iii) = Eval("BallShadow" & iii)
		objBallShadow(iii).material = "BallShadow" & iii
		UpdateMaterial objBallShadow(iii).material,1,0,0,0,0,0,AmbientBSFactor,RGB(0,0,0),0,0,False,True,0,0,0,0
		objBallShadow(iii).Z = 1 + iii/1000 + 0.04
		objBallShadow(iii).visible = 0

		BallShadowA(iii).Opacity = 100*AmbientBSFactor
		BallShadowA(iii).visible = 0
	Next

	iii = 0

	For Each Source in DynamicSources
		DSSources(iii) = Array(Source.x, Source.y)
'		If Instr(Source.name , "Left") > 0 Then DSGISide(iii) = 0 Else DSGISide(iii) = 1	'Adapted for TZ with GI left / GI right
		iii = iii + 1
	Next
	numberofsources = iii
end sub

Sub DynamicBSUpdate
	Dim falloff: falloff = 150 'Max distance to light sources, can be changed dynamically if you have a reason
	Dim ShadowOpacity1, ShadowOpacity2 
	Dim s, LSd, iii
	Dim dist1, dist2, src1, src2
'	Dim gBOT: gBOT=getballs	'Uncomment if you're deleting balls - Don't do it! #SaveTheBalls

	'Hide shadow of deleted balls
	For s = UBound(gBOT) + 1 to tnob - 1
		objrtx1(s).visible = 0
		objrtx2(s).visible = 0
		objBallShadow(s).visible = 0
		BallShadowA(s).visible = 0
	Next

	If UBound(gBOT) < lob Then Exit Sub		'No balls in play, exit

'The Magic happens now
	For s = lob to UBound(gBOT)

' *** Normal "ambient light" ball shadow
	'Layered from top to bottom. If you had an upper pf at for example 80 units and ramps even above that, your segments would be z>110; z<=110 And z>100; z<=100 And z>30; z<=30 And z>20; Else invisible

		If AmbientBallShadowOn = 1 Then			'Primitive shadow on playfield, flasher shadow in ramps
			If gBOT(s).Z > 30 Then							'The flasher follows the ball up ramps while the primitive is on the pf
				If gBOT(s).X < tablewidth/2 Then
					objBallShadow(s).X = ((gBOT(s).X) - (Ballsize/10) + ((gBOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + offsetX + 5
				Else
					objBallShadow(s).X = ((gBOT(s).X) + (Ballsize/10) + ((gBOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + offsetX - 5
				End If
				objBallShadow(s).Y = gBOT(s).Y + BallSize/10 + offsetY
				objBallShadow(s).visible = 1

				BallShadowA(s).X = gBOT(s).X + offsetX
				BallShadowA(s).Y = gBOT(s).Y + BallSize/5
				BallShadowA(s).height=gBOT(s).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping the ramp
				BallShadowA(s).visible = 1
			Elseif gBOT(s).Z <= 30 And gBOT(s).Z > 20 Then	'On pf, primitive only
				objBallShadow(s).visible = 1
				If gBOT(s).X < tablewidth/2 Then
					objBallShadow(s).X = ((gBOT(s).X) - (Ballsize/10) + ((gBOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + offsetX + 5
				Else
					objBallShadow(s).X = ((gBOT(s).X) + (Ballsize/10) + ((gBOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + offsetX - 5
				End If
				objBallShadow(s).Y = gBOT(s).Y + offsetY
'				objBallShadow(s).Z = gBOT(s).Z + s/1000 + 0.04		'Uncomment (and adjust If/Elseif height logic) if you want the primitive shadow on an upper/split pf
				BallShadowA(s).visible = 0
			Else											'Under pf, no shadows
				objBallShadow(s).visible = 0
				BallShadowA(s).visible = 0
			end if

		Elseif AmbientBallShadowOn = 2 Then		'Flasher shadow everywhere
			If gBOT(s).Z > 30 Then							'In a ramp
				BallShadowA(s).X = gBOT(s).X + offsetX
				BallShadowA(s).Y = gBOT(s).Y + BallSize/5
				BallShadowA(s).height=gBOT(s).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping the ramp
				BallShadowA(s).visible = 1
			Elseif gBOT(s).Z <= 30 And gBOT(s).Z > 20 Then	'On pf
				BallShadowA(s).visible = 1
				If gBOT(s).X < tablewidth/2 Then
					BallShadowA(s).X = ((gBOT(s).X) - (Ballsize/10) + ((gBOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + offsetX + 5
				Else
					BallShadowA(s).X = ((gBOT(s).X) + (Ballsize/10) + ((gBOT(s).X - (tablewidth/2))/(Ballsize/AmbientMovement))) + offsetX - 5
				End If
				BallShadowA(s).Y = gBOT(s).Y + Ballsize/10 + offsetY
				BallShadowA(s).height=gBOT(s).z - BallSize/2 + 5
			Else											'Under pf
				BallShadowA(s).visible = 0
			End If
		End If

' *** Dynamic shadows
		If DynamicBallShadowsOn Then
			If gBOT(s).Z < 30 And gBOT(s).X < 850 Then	'Parameters for where the shadows can show, here they are not visible above the table (no upper pf) or in the plunger lane
				dist1 = falloff:
				dist2 = falloff
				For iii = 0 to numberofsources - 1 ' Search the 2 nearest influencing lights
					LSd = Distance(gBOT(s).x, gBOT(s).y, DSSources(iii)(0), DSSources(iii)(1)) 'Calculating the Linear distance to the Source
					If LSd < falloff And gilvl > 0 Then
'					If LSd < dist2 And ((DSGISide(iii) = 0 And Lampz.State(100)>0) Or (DSGISide(iii) = 1 And Lampz.State(104)>0)) Then	'Adapted for TZ with GI left / GI right
						dist2 = dist1
						dist1 = LSd
						src2 = src1
						src1 = iii
					End If
				Next
				ShadowOpacity1 = 0
				If dist1 < falloff Then
					objrtx1(s).visible = 1 : objrtx1(s).X = gBOT(s).X : objrtx1(s).Y = gBOT(s).Y
					'objrtx1(s).Z = gBOT(s).Z - 25 + s/1000 + 0.01 'Uncomment if you want to add shadows to an upper/lower pf
					objrtx1(s).rotz = AnglePP(DSSources(src1)(0), DSSources(src1)(1), gBOT(s).X, gBOT(s).Y) + 90
					ShadowOpacity1 = 1 - dist1 / falloff
					objrtx1(s).size_y = Wideness * ShadowOpacity1 + Thinness
					UpdateMaterial objrtx1(s).material,1,0,0,0,0,0,ShadowOpacity1*DynamicBSFactor^3,RGB(0,0,0),0,0,False,True,0,0,0,0
				Else
					objrtx1(s).visible = 0
				End If
				ShadowOpacity2 = 0
				If dist2 < falloff Then
					objrtx2(s).visible = 1 : objrtx2(s).X = gBOT(s).X : objrtx2(s).Y = gBOT(s).Y + offsetY
					'objrtx2(s).Z = gBOT(s).Z - 25 + s/1000 + 0.02 'Uncomment if you want to add shadows to an upper/lower pf
					objrtx2(s).rotz = AnglePP(DSSources(src2)(0), DSSources(src2)(1), gBOT(s).X, gBOT(s).Y) + 90
					ShadowOpacity2 = 1 - dist2 / falloff
					objrtx2(s).size_y = Wideness * ShadowOpacity2 + Thinness
					UpdateMaterial objrtx2(s).material,1,0,0,0,0,0,ShadowOpacity2*DynamicBSFactor^3,RGB(0,0,0),0,0,False,True,0,0,0,0
				Else
					objrtx2(s).visible = 0
				End If
				If AmbientBallShadowOn = 1 Then
					'Fades the ambient shadow (primitive only) when it's close to a light
					UpdateMaterial objBallShadow(s).material,1,0,0,0,0,0,AmbientBSFactor*(1 - max(ShadowOpacity1, ShadowOpacity2)),RGB(0,0,0),0,0,False,True,0,0,0,0
				Else
					BallShadowA(s).Opacity = 100 * AmbientBSFactor * (1 - max(ShadowOpacity1, ShadowOpacity2))
				End If
			Else 'Hide dynamic shadows everywhere else, just in case
				objrtx2(s).visible = 0 : objrtx1(s).visible = 0
			End If
		End If
	Next
End Sub
'****************************************************************
'****  END VPW DYNAMIC BALL SHADOWS by Iakki, Apophis, and Wylte
'****************************************************************

'******************************************************
' VPW TargetBouncer for targets and posts by Iaakki, Wrd1972, Apophis
'******************************************************

Const TargetBouncerEnabled = 1 		'0 = normal standup targets, 1 = bouncy targets
Const TargetBouncerFactor = 0.7 	'Level of bounces. Recommmended value of 0.7

sub TargetBouncer(aBall,defvalue)
    dim zMultiplier, vel, vratio
    if TargetBouncerEnabled = 1 and aball.z < 30 then
        'debug.print "velx: " & aball.velx & " vely: " & aball.vely & " velz: " & aball.velz
        vel = BallSpeed(aBall)
        if aBall.velx = 0 then vratio = 1 else vratio = aBall.vely/aBall.velx
        Select Case Int(Rnd * 6) + 1
            Case 1: zMultiplier = 0.2*defvalue
			Case 2: zMultiplier = 0.25*defvalue
            Case 3: zMultiplier = 0.3*defvalue
			Case 4: zMultiplier = 0.4*defvalue
            Case 5: zMultiplier = 0.45*defvalue
            Case 6: zMultiplier = 0.5*defvalue
        End Select
        aBall.velz = abs(vel * zMultiplier * TargetBouncerFactor)
        aBall.velx = sgn(aBall.velx) * sqr(abs((vel^2 - aBall.velz^2)/(1+vratio^2)))
        aBall.vely = aBall.velx * vratio
        'debug.print "---> velx: " & aball.velx & " vely: " & aball.vely & " velz: " & aball.velz
        'debug.print "conservation check: " & BallSpeed(aBall)/vel
	end if
end sub

' Add targets or posts to the TargetBounce collection if you want to activate the targetbouncer code from them
Sub TargetBounce_Hit(idx)
	TargetBouncer activeball, 1
End Sub



'******************************************************
'****  GNEREAL ADVICE ON PHYSICS
'******************************************************
'
' It's advised that flipper corrections, dampeners, and general physics settings should all be updated per these 
' examples as all of these improvements work together to provide a realistic physics simulation.
'
' Tutorial videos provided by Bord
' Flippers: 	https://www.youtube.com/watch?v=FWvM9_CdVHw
' Dampeners: 	https://www.youtube.com/watch?v=tqsxx48C6Pg
' Physics: 		https://www.youtube.com/watch?v=UcRMG-2svvE
'
'
' Note: BallMass must be set to 1. BallSize should be set to 50 (in other words the ball radius is 25) 
'
' Recommended Table Physics Settings
' | Gravity Constant             | 0.97      |
' | Playfield Friction           | 0.15-0.25 |
' | Playfield Elasticity         | 0.25      |
' | Playfield Elasticity Falloff | 0         |
' | Playfield Scatter            | 0         |
' | Default Element Scatter      | 2         |
'
' Bumpers
' | Force         | 9.5-10.5 |
' | Hit Threshold | 1.6-2    |
' | Scatter Angle | 2        |
' 
' Slingshots
' | Hit Threshold      | 2    |
' | Slingshot Force    | 4-5  |
' | Slingshot Theshold | 2-3  |
' | Elasticity         | 0.85 |
' | Friction           | 0.8  |
' | Scatter Angle      | 1    |



'******************************************************
'****  FLIPPER CORRECTIONS by nFozzy
'******************************************************
'
' There are several steps for taking advantage of nFozzy's flipper solution.  At a high level well need the following:
'	1. flippers with specific physics settings
'	2. custom triggers for each flipper (TriggerLF, TriggerRF)
'	3. an object or point to tell the script where the tip of the flipper is at rest (EndPointLp, EndPointRp)
'	4. and, special scripting
'
' A common mistake is incorrect flipper length.  A 3-inch flipper with rubbers will be about 3.125 inches long.  
' This translates to about 147 vp units.  Therefore, the flipper start radius + the flipper length + the flipper end 
' radius should  equal approximately 147 vp units. Another common mistake is is that sometimes the right flipper
' angle was set with a large postive value (like 238 or something). It should be using negative value (like -122).
'
' The following settings are a solid starting point for various eras of pinballs.
' |                    | EM's           | late 70's to mid 80's | mid 80's to early 90's | mid 90's and later |
' | ------------------ | -------------- | --------------------- | ---------------------- | ------------------ |
' | Mass               | 1              | 1                     | 1                      | 1                  |
' | Strength           | 500-1000 (750) | 1400-1600 (1500)      | 2000-2600              | 3200-3300 (3250)   |
' | Elasticity         | 0.88           | 0.88                  | 0.88                   | 0.88               |
' | Elasticity Falloff | 0.15           | 0.15                  | 0.15                   | 0.15               |
' | Fricition          | 0.8-0.9        | 0.9                   | 0.9                    | 0.9                |
' | Return Strength    | 0.11           | 0.09                  | 0.07                   | 0.055              |
' | Coil Ramp Up       | 2.5            | 2.5                   | 2.5                    | 2.5                |
' | Scatter Angle      | 0              | 0                     | 0                      | 0                  |
' | EOS Torque         | 0.3            | 0.3                   | 0.275                  | 0.275              |
' | EOS Torque Angle   | 4              | 4                     | 6                      | 6                  |
'


'******************************************************
' Flippers Polarity (Select appropriate sub based on era) 
'******************************************************

dim LF : Set LF = New FlipperPolarity
dim RF : Set RF = New FlipperPolarity

InitPolarity

'
''*******************************************
'' Late 70's to early 80's
'
'Sub InitPolarity()
'   dim x, a : a = Array(LF, RF)
'	for each x in a
'		x.AddPt "Ycoef", 0, RightFlipper.Y-65, 1 'disabled
'		x.AddPt "Ycoef", 1, RightFlipper.Y-11, 1
'		x.enabled = True
'		x.TimeDelay = 80
'		x.DebugOn=False ' prints some info in debugger
'
'		x.AddPt "Polarity", 0, 0, 0
'		x.AddPt "Polarity", 1, 0.05, - 2.7
'		x.AddPt "Polarity", 2, 0.33, - 2.7
'		x.AddPt "Polarity", 3, 0.37, - 2.7
'		x.AddPt "Polarity", 4, 0.41, - 2.7
'		x.AddPt "Polarity", 5, 0.45, - 2.7
'		x.AddPt "Polarity", 6, 0.576, - 2.7
'		x.AddPt "Polarity", 7, 0.66, - 1.8
'		x.AddPt "Polarity", 8, 0.743, - 0.5
'		x.AddPt "Polarity", 9, 0.81, - 0.5
'		x.AddPt "Polarity", 10, 0.88, 0
'
'		x.AddPt "Velocity", 0, 0, 1
'		x.AddPt "Velocity", 1, 0.16, 1.06
'		x.AddPt "Velocity", 2, 0.41, 1.05
'		x.AddPt "Velocity", 3, 0.53, 1 '0.982
'		x.AddPt "Velocity", 4, 0.702, 0.968
'		x.AddPt "Velocity", 5, 0.95,  0.968
'		x.AddPt "Velocity", 6, 1.03, 0.945
'	Next
'
'	' SetObjects arguments: 1: name of object 2: flipper object: 3: Trigger object around flipper
'    LF.SetObjects "LF", LeftFlipper, TriggerLF
'    RF.SetObjects "RF", RightFlipper, TriggerRF
'End Sub
'
'
'
''*******************************************
'' Mid 80's
'
'Sub InitPolarity()
'   dim x, a : a = Array(LF, RF)
'	for each x in a
'		x.AddPt "Ycoef", 0, RightFlipper.Y-65, 1 'disabled
'		x.AddPt "Ycoef", 1, RightFlipper.Y-11, 1
'		x.enabled = True
'		x.TimeDelay = 80
'		x.DebugOn=False ' prints some info in debugger
'
'		x.AddPt "Polarity", 0, 0, 0
'		x.AddPt "Polarity", 1, 0.05, - 3.7
'		x.AddPt "Polarity", 2, 0.33, - 3.7
'		x.AddPt "Polarity", 3, 0.37, - 3.7
'		x.AddPt "Polarity", 4, 0.41, - 3.7
'		x.AddPt "Polarity", 5, 0.45, - 3.7
'		x.AddPt "Polarity", 6, 0.576,- 3.7
'		x.AddPt "Polarity", 7, 0.66, - 2.3
'		x.AddPt "Polarity", 8, 0.743, - 1.5
'		x.AddPt "Polarity", 9, 0.81, - 1
'		x.AddPt "Polarity", 10, 0.88, 0
'
'		x.AddPt "Velocity", 0, 0, 1
'		x.AddPt "Velocity", 1, 0.16, 1.06
'		x.AddPt "Velocity", 2, 0.41, 1.05
'		x.AddPt "Velocity", 3, 0.53, 1 '0.982
'		x.AddPt "Velocity", 4, 0.702, 0.968
'		x.AddPt "Velocity", 5, 0.95,  0.968
'		x.AddPt "Velocity", 6, 1.03, 0.945
'
'	Next
'
'	' SetObjects arguments: 1: name of object 2: flipper object: 3: Trigger object around flipper
'    LF.SetObjects "LF", LeftFlipper, TriggerLF
'    RF.SetObjects "RF", RightFlipper, TriggerRF
'End Sub
'
''*******************************************
''  Late 80's early 90's
'
'Sub InitPolarity()
'	dim x, a : a = Array(LF, RF)
'	for each x in a
'		x.AddPt "Ycoef", 0, RightFlipper.Y-65, 1 'disabled
'		x.AddPt "Ycoef", 1, RightFlipper.Y-11, 1
'		x.enabled = True
'		x.TimeDelay = 60
'		x.DebugOn=False ' prints some info in debugger
'
'		x.AddPt "Polarity", 0, 0, 0
'		x.AddPt "Polarity", 1, 0.05, - 5
'		x.AddPt "Polarity", 2, 0.4, - 5
'		x.AddPt "Polarity", 3, 0.6, - 4.5
'		x.AddPt "Polarity", 4, 0.65, - 4.0
'		x.AddPt "Polarity", 5, 0.7, - 3.5
'		x.AddPt "Polarity", 6, 0.75, - 3.0
'		x.AddPt "Polarity", 7, 0.8, - 2.5
'		x.AddPt "Polarity", 8, 0.85, - 2.0
'		x.AddPt "Polarity", 9, 0.9, - 1.5
'		x.AddPt "Polarity", 10, 0.95, - 1.0
'		x.AddPt "Polarity", 11, 1, - 0.5
'		x.AddPt "Polarity", 12, 1.1, 0
'		x.AddPt "Polarity", 13, 1.3, 0
'
'		x.AddPt "Velocity", 0, 0, 1
'		x.AddPt "Velocity", 1, 0.16, 1.06
'		x.AddPt "Velocity", 2, 0.41, 1.05
'		x.AddPt "Velocity", 3, 0.53, 1 '0.982
'		x.AddPt "Velocity", 4, 0.702, 0.968
'		x.AddPt "Velocity", 5, 0.95,  0.968
'		x.AddPt "Velocity", 6, 1.03,  0.945
'	Next
'
'	' SetObjects arguments: 1: name of object 2: flipper object: 3: Trigger object around flipper
'	LF.SetObjects "LF", LeftFlipper, TriggerLF
'	RF.SetObjects "RF", RightFlipper, TriggerRF
'End Sub

'*******************************************
' Early 90's and after

Sub InitPolarity()
	Dim x, a
	a = Array(LF, RF)
	For Each x In a
		x.AddPt "Ycoef", 0, RightFlipper.Y-65, 1 'disabled
		x.AddPt "Ycoef", 1, RightFlipper.Y-11, 1
		x.enabled = True
		x.TimeDelay = 60
		x.DebugOn=False ' prints some info in debugger
		
		x.AddPt "Polarity", 0, 0, 0
		x.AddPt "Polarity", 1, 0.05, -5.5
		x.AddPt "Polarity", 2, 0.4, -5.5
		x.AddPt "Polarity", 3, 0.6, -5.0
		x.AddPt "Polarity", 4, 0.65, -4.5
		x.AddPt "Polarity", 5, 0.7, -4.0
		x.AddPt "Polarity", 6, 0.75, -3.5
		x.AddPt "Polarity", 7, 0.8, -3.0
		x.AddPt "Polarity", 8, 0.85, -2.5
		x.AddPt "Polarity", 9, 0.9,-2.0
		x.AddPt "Polarity", 10, 0.95, -1.5
		x.AddPt "Polarity", 11, 1, -1.0
		x.AddPt "Polarity", 12, 1.05, -0.5
		x.AddPt "Polarity", 13, 1.1, 0
		x.AddPt "Polarity", 14, 1.3, 0
		
		x.AddPt "Velocity", 0, 0,	   1
		x.AddPt "Velocity", 1, 0.160, 1.06
		x.AddPt "Velocity", 2, 0.410, 1.05
		x.AddPt "Velocity", 3, 0.530, 1'0.982
		x.AddPt "Velocity", 4, 0.702, 0.968
		x.AddPt "Velocity", 5, 0.95,  0.968
		x.AddPt "Velocity", 6, 1.03,  0.945
	Next
	
	' SetObjects arguments: 1: name of object 2: flipper object: 3: Trigger object around flipper
	LF.SetObjects "LF", LeftFlipper, TriggerLF
	RF.SetObjects "RF", RightFlipper, TriggerRF
End Sub




'******************************************************
'  FLIPPER CORRECTION FUNCTIONS
'******************************************************

' modified 2023 by nFozzy
' Removed need for 'endpoint' objects
' Added 'createvents' type thing for TriggerLF / TriggerRF triggers.
' Removed AddPt function which complicated setup imo
' made DebugOn do something (prints some stuff in debugger)
'   Otherwise it should function exactly the same as before

Class FlipperPolarity
	Public DebugOn, Enabled
	Private FlipAt		'Timer variable (IE 'flip at 723,530ms...)
	Public TimeDelay		'delay before trigger turns off and polarity is disabled
	Private Flipper, FlipperStart, FlipperEnd, FlipperEndY, LR, PartialFlipCoef
	Private Balls(20), balldata(20)
	Private Name
	
	Dim PolarityIn, PolarityOut
	Dim VelocityIn, VelocityOut
	Dim YcoefIn, YcoefOut
	Public Sub Class_Initialize
		ReDim PolarityIn(0)
		ReDim PolarityOut(0)
		ReDim VelocityIn(0)
		ReDim VelocityOut(0)
		ReDim YcoefIn(0)
		ReDim YcoefOut(0)
		Enabled = True
		TimeDelay = 50
		LR = 1
		Dim x
		For x = 0 To UBound(balls)
			balls(x) = Empty
			Set Balldata(x) = new SpoofBall
		Next
	End Sub
	
	Public Sub SetObjects(aName, aFlipper, aTrigger)
		
		If TypeName(aName) <> "String" Then MsgBox "FlipperPolarity: .SetObjects error: first argument must be a String (And name of Object). Found:" & TypeName(aName) End If
		If TypeName(aFlipper) <> "Flipper" Then MsgBox "FlipperPolarity: .SetObjects error: Second argument must be a flipper. Found:" & TypeName(aFlipper) End If
		If TypeName(aTrigger) <> "Trigger" Then MsgBox "FlipperPolarity: .SetObjects error: third argument must be a trigger. Found:" & TypeName(aTrigger) End If
		If aFlipper.EndAngle > aFlipper.StartAngle Then LR = -1 Else LR = 1 End If
		Name = aName
		Set Flipper = aFlipper
		FlipperStart = aFlipper.x
		FlipperEnd = Flipper.Length * Sin((Flipper.StartAngle / 57.295779513082320876798154814105)) + Flipper.X ' big floats for degree to rad conversion
		FlipperEndY = Flipper.Length * Cos(Flipper.StartAngle / 57.295779513082320876798154814105)*-1 + Flipper.Y
		
		Dim str
		str = "Sub " & aTrigger.name & "_Hit() : " & aName & ".AddBall ActiveBall : End Sub'"
		ExecuteGlobal(str)
		str = "Sub " & aTrigger.name & "_UnHit() : " & aName & ".PolarityCorrect ActiveBall : End Sub'"
		ExecuteGlobal(str)
		
	End Sub
	
	' Legacy: just no op
	Public Property Let EndPoint(aInput)
		
	End Property
	
	Public Sub AddPt(aChooseArray, aIDX, aX, aY) 'Index #, X position, (in) y Position (out)
		Select Case aChooseArray
			Case "Polarity"
				ShuffleArrays PolarityIn, PolarityOut, 1
				PolarityIn(aIDX) = aX
				PolarityOut(aIDX) = aY
				ShuffleArrays PolarityIn, PolarityOut, 0
			Case "Velocity"
				ShuffleArrays VelocityIn, VelocityOut, 1
				VelocityIn(aIDX) = aX
				VelocityOut(aIDX) = aY
				ShuffleArrays VelocityIn, VelocityOut, 0
			Case "Ycoef"
				ShuffleArrays YcoefIn, YcoefOut, 1
				YcoefIn(aIDX) = aX
				YcoefOut(aIDX) = aY
				ShuffleArrays YcoefIn, YcoefOut, 0
		End Select
	End Sub
	
	Public Sub AddBall(aBall)
		Dim x
		For x = 0 To UBound(balls)
			If IsEmpty(balls(x)) Then
				Set balls(x) = aBall
				Exit Sub
			End If
		Next
	End Sub
	
	Private Sub RemoveBall(aBall)
		Dim x
		For x = 0 To UBound(balls)
			If TypeName(balls(x) ) = "IBall" Then
				If aBall.ID = Balls(x).ID Then
					balls(x) = Empty
					Balldata(x).Reset
				End If
			End If
		Next
	End Sub
	
	Public Sub Fire()
		Flipper.RotateToEnd
		processballs
	End Sub
	
	Public Property Get Pos 'returns % position a ball. For debug stuff.
		Dim x
		For x = 0 To UBound(balls)
			If Not IsEmpty(balls(x) ) Then
				pos = pSlope(Balls(x).x, FlipperStart, 0, FlipperEnd, 1)
			End If
		Next
	End Property
	
	Public Sub ProcessBalls() 'save data of balls in flipper range
		FlipAt = GameTime
		Dim x
		For x = 0 To UBound(balls)
			If Not IsEmpty(balls(x) ) Then
				balldata(x).Data = balls(x)
			End If
		Next
		PartialFlipCoef = ((Flipper.StartAngle - Flipper.CurrentAngle) / (Flipper.StartAngle - Flipper.EndAngle))
		PartialFlipCoef = abs(PartialFlipCoef-1)
	End Sub
	'Timer shutoff for polaritycorrect
	Private Function FlipperOn()
		If GameTime < FlipAt+TimeDelay Then
			FlipperOn = True
		End If
	End Function
	
	Public Sub PolarityCorrect(aBall)
		If FlipperOn() Then
			Dim tmp, BallPos, x, IDX, Ycoef
			Ycoef = 1
			
			'y safety Exit
			If aBall.VelY > -8 Then 'ball going down
				RemoveBall aBall
				Exit Sub
			End If
			
			'Find balldata. BallPos = % on Flipper
			For x = 0 To UBound(Balls)
				If aBall.id = BallData(x).id And Not IsEmpty(BallData(x).id) Then
					idx = x
					BallPos = PSlope(BallData(x).x, FlipperStart, 0, FlipperEnd, 1)
					If ballpos > 0.65 Then  Ycoef = LinearEnvelope(BallData(x).Y, YcoefIn, YcoefOut)								'find safety coefficient 'ycoef' data
				End If
			Next
			
			If BallPos = 0 Then 'no ball data meaning the ball is entering and exiting pretty close to the same position, use current values.
				BallPos = PSlope(aBall.x, FlipperStart, 0, FlipperEnd, 1)
				If ballpos > 0.65 Then  Ycoef = LinearEnvelope(aBall.Y, YcoefIn, YcoefOut)												'find safety coefficient 'ycoef' data
			End If
			
			'Velocity correction
			If Not IsEmpty(VelocityIn(0) ) Then
				Dim VelCoef
				VelCoef = LinearEnvelope(BallPos, VelocityIn, VelocityOut)
				
				If partialflipcoef < 1 Then VelCoef = PSlope(partialflipcoef, 0, 1, 1, VelCoef)
				
				If Enabled Then aBall.Velx = aBall.Velx*VelCoef
				If Enabled Then aBall.Vely = aBall.Vely*VelCoef
			End If
			
			'Polarity Correction (optional now)
			If Not IsEmpty(PolarityIn(0) ) Then
				Dim AddX
				AddX = LinearEnvelope(BallPos, PolarityIn, PolarityOut) * LR
				
				If Enabled Then aBall.VelX = aBall.VelX + 1 * (AddX*ycoef*PartialFlipcoef)
			End If
			If DebugOn Then debug.print "PolarityCorrect" & " " & Name & " @ " & GameTime & " " & Round(BallPos*100) & "%" & " AddX:" & Round(AddX,2) & " Vel%:" & Round(VelCoef*100)
		End If
		RemoveBall aBall
	End Sub
End Class





'******************************************************
'  SLINGSHOT CORRECTION FUNCTIONS
'******************************************************
' To add these slingshot corrections:
' 	- On the table, add the endpoint primitives that define the two ends of the Slingshot
'	- Initialize the SlingshotCorrection objects in InitSlingCorrection
' 	- Call the .VelocityCorrect methods from the respective _Slingshot event sub


dim LS : Set LS = New SlingshotCorrection
dim RS : Set RS = New SlingshotCorrection

InitSlingCorrection

Sub InitSlingCorrection

	LS.Object = LeftSlingshot
	LS.EndPoint1 = EndPoint1LS
	LS.EndPoint2 = EndPoint2LS

	RS.Object = RightSlingshot
	RS.EndPoint1 = EndPoint1RS
	RS.EndPoint2 = EndPoint2RS

	'Slingshot angle corrections (pt, BallPos in %, Angle in deg)
	' These values are best guesses. Retune them if needed based on specific table research.
	AddSlingsPt 0, 0.00,	-4
	AddSlingsPt 1, 0.45,	-7
	AddSlingsPt 2, 0.48,	0
	AddSlingsPt 3, 0.52,	0
	AddSlingsPt 4, 0.55,	7
	AddSlingsPt 5, 1.00,	4

End Sub


Sub AddSlingsPt(idx, aX, aY)        'debugger wrapper for adjusting flipper script in-game
	dim a : a = Array(LS, RS)
	dim x : for each x in a
		x.addpoint idx, aX, aY
	Next
End Sub

'' The following sub are needed, however they may exist somewhere else in the script. Uncomment below if needed
'Dim PI: PI = 4*Atn(1)
'Function dSin(degrees)
'	dsin = sin(degrees * Pi/180)
'End Function
'Function dCos(degrees)
'	dcos = cos(degrees * Pi/180)
'End Function
'
'Function RotPoint(x,y,angle)
'    dim rx, ry
'    rx = x*dCos(angle) - y*dSin(angle)
'    ry = x*dSin(angle) + y*dCos(angle)
'    RotPoint = Array(rx,ry)
'End Function

Class SlingshotCorrection
	Public DebugOn, Enabled
	private Slingshot, SlingX1, SlingX2, SlingY1, SlingY2

	Public ModIn, ModOut
	Private Sub Class_Initialize : redim ModIn(0) : redim Modout(0): Enabled = True : End Sub 

	Public Property let Object(aInput) : Set Slingshot = aInput : End Property
	Public Property Let EndPoint1(aInput) : SlingX1 = aInput.x: SlingY1 = aInput.y: End Property
	Public Property Let EndPoint2(aInput) : SlingX2 = aInput.x: SlingY2 = aInput.y: End Property

	Public Sub AddPoint(aIdx, aX, aY) 
		ShuffleArrays ModIn, ModOut, 1 : ModIn(aIDX) = aX : ModOut(aIDX) = aY : ShuffleArrays ModIn, ModOut, 0
		If gametime > 100 then Report
	End Sub

	Public Sub Report()         'debug, reports all coords in tbPL.text
		If not debugOn then exit sub
		dim a1, a2 : a1 = ModIn : a2 = ModOut
		dim str, x : for x = 0 to uBound(a1) : str = str & x & ": " & round(a1(x),4) & ", " & round(a2(x),4) & vbnewline : next
		TBPout.text = str
	End Sub


	Public Sub VelocityCorrect(aBall)
		dim BallPos, XL, XR, YL, YR
		
		'Assign right and left end points
		If SlingX1 < SlingX2 Then 
			XL = SlingX1 : YL = SlingY1 : XR = SlingX2 : YR = SlingY2
		Else
			XL = SlingX2 : YL = SlingY2 : XR = SlingX1 : YR = SlingY1
		End If

		'Find BallPos = % on Slingshot
		If Not IsEmpty(aBall.id) Then 
			If ABS(XR-XL) > ABS(YR-YL) Then 
				BallPos = PSlope(aBall.x, XL, 0, XR, 1)
			Else
				BallPos = PSlope(aBall.y, YL, 0, YR, 1)
			End If
			If BallPos < 0 Then BallPos = 0
			If BallPos > 1 Then BallPos = 1
		End If

		'Velocity angle correction
		If not IsEmpty(ModIn(0) ) then
			Dim Angle, RotVxVy
			Angle = LinearEnvelope(BallPos, ModIn, ModOut)
			'debug.print " BallPos=" & BallPos &" Angle=" & Angle 
			'debug.print " BEFORE: aBall.Velx=" & aBall.Velx &" aBall.Vely" & aBall.Vely 
			RotVxVy = RotPoint(aBall.Velx,aBall.Vely,Angle)
			If Enabled then aBall.Velx = RotVxVy(0)
			If Enabled then aBall.Vely = RotVxVy(1)
			'debug.print " AFTER: aBall.Velx=" & aBall.Velx &" aBall.Vely" & aBall.Vely 
			'debug.print " " 
		End If
	End Sub

End Class



'******************************************************
'  FLIPPER POLARITY. RUBBER DAMPENER, AND SLINGSHOT CORRECTION SUPPORTING FUNCTIONS 
'******************************************************

' Used for flipper correction and rubber dampeners
Sub ShuffleArray(ByRef aArray, byVal offset) 'shuffle 1d array
	Dim x, aCount
	aCount = 0
	ReDim a(UBound(aArray) )
	For x = 0 To UBound(aArray)		'Shuffle objects in a temp array
		If Not IsEmpty(aArray(x) ) Then
			If IsObject(aArray(x)) Then
				Set a(aCount) = aArray(x)
			Else
				a(aCount) = aArray(x)
			End If
			aCount = aCount + 1
		End If
	Next
	If offset < 0 Then offset = 0
	ReDim aArray(aCount-1+offset)		'Resize original array
	For x = 0 To aCount-1				'set objects back into original array
		If IsObject(a(x)) Then
			Set aArray(x) = a(x)
		Else
			aArray(x) = a(x)
		End If
	Next
End Sub

' Used for flipper correction and rubber dampeners
Sub ShuffleArrays(aArray1, aArray2, offset)
	ShuffleArray aArray1, offset
	ShuffleArray aArray2, offset
End Sub

' Used for flipper correction, rubber dampeners, and drop targets
Function BallSpeed(ball) 'Calculates the ball speed
	BallSpeed = Sqr(ball.VelX^2 + ball.VelY^2 + ball.VelZ^2)
End Function

' Used for flipper correction and rubber dampeners
Function PSlope(Input, X1, Y1, X2, Y2)		'Set up line via two points, no clamping. Input X, output Y
	Dim x, y, b, m
	x = input
	m = (Y2 - Y1) / (X2 - X1)
	b = Y2 - m*X2
	Y = M*x+b
	PSlope = Y
End Function

' Used for flipper correction
Class spoofball
	Public X, Y, Z, VelX, VelY, VelZ, ID, Mass, Radius
	Public Property Let Data(aBall)
		With aBall
			x = .x
			y = .y
			z = .z
			velx = .velx
			vely = .vely
			velz = .velz
			id = .ID
			mass = .mass
			radius = .radius
		End With
	End Property
	Public Sub Reset()
		x = Empty
		y = Empty
		z = Empty
		velx = Empty
		vely = Empty
		velz = Empty
		id = Empty
		mass = Empty
		radius = Empty
	End Sub
End Class

' Used for flipper correction and rubber dampeners
Function LinearEnvelope(xInput, xKeyFrame, yLvl)
	Dim y 'Y output
	Dim L 'Line
	'find active line
	Dim ii
	For ii = 1 To UBound(xKeyFrame)
		If xInput <= xKeyFrame(ii) Then
			L = ii
			Exit For
		End If
	Next
	If xInput > xKeyFrame(UBound(xKeyFrame) ) Then L = UBound(xKeyFrame)		'catch line overrun
	Y = pSlope(xInput, xKeyFrame(L-1), yLvl(L-1), xKeyFrame(L), yLvl(L) )
	
	If xInput <= xKeyFrame(LBound(xKeyFrame) ) Then Y = yLvl(LBound(xKeyFrame) )		 'Clamp lower
	If xInput >= xKeyFrame(UBound(xKeyFrame) ) Then Y = yLvl(UBound(xKeyFrame) )		'Clamp upper
	
	LinearEnvelope = Y
End Function


'******************************************************
'  FLIPPER TRICKS
'******************************************************
' To add the flipper tricks you must
'	 - Include a call to FlipperCradleCollision from within OnBallBallCollision subroutine
'	 - Include a call the CheckLiveCatch from the LeftFlipper_Collide and RightFlipper_Collide subroutines

RightFlipper.timerinterval = 1
Rightflipper.timerenabled = True

Sub RightFlipper_timer()
	FlipperTricks LeftFlipper, LFPress, LFCount, LFEndAngle, LFState
	FlipperTricks RightFlipper, RFPress, RFCount, RFEndAngle, RFState
	FlipperNudge RightFlipper, RFEndAngle, RFEOSNudge, LeftFlipper, LFEndAngle
	FlipperNudge LeftFlipper, LFEndAngle, LFEOSNudge,  RightFlipper, RFEndAngle
End Sub

Dim LFEOSNudge, RFEOSNudge

Sub FlipperNudge(Flipper1, Endangle1, EOSNudge1, Flipper2, EndAngle2)
	Dim b
	'   Dim BOT
	'   BOT = GetBalls
	
	If Flipper1.currentangle = Endangle1 And EOSNudge1 <> 1 Then
		EOSNudge1 = 1
		'   debug.print Flipper1.currentangle &" = "& Endangle1 &"--"& Flipper2.currentangle &" = "& EndAngle2
		If Flipper2.currentangle = EndAngle2 Then
			For b = 0 To UBound(gBOT)
				If FlipperTrigger(gBOT(b).x, gBOT(b).y, Flipper1) Then
					'Debug.Print "ball in flip1. exit"
					Exit Sub
				End If
			Next
			For b = 0 To UBound(gBOT)
				If FlipperTrigger(gBOT(b).x, gBOT(b).y, Flipper2) Then
					gBOT(b).velx = gBOT(b).velx / 1.3
					gBOT(b).vely = gBOT(b).vely - 0.5
				End If
			Next
		End If
	Else
		If Abs(Flipper1.currentangle) > Abs(EndAngle1) + 30 Then EOSNudge1 = 0
	End If
End Sub


Dim FCCDamping: FCCDamping = 0.4

Sub FlipperCradleCollision(ball1, ball2, velocity)
	if velocity < 0.7 then exit sub		'filter out gentle collisions
    Dim DoDamping, coef
    DoDamping = false
    'Check left flipper
    If LeftFlipper.currentangle = LFEndAngle Then
		If FlipperTrigger(ball1.x, ball1.y, LeftFlipper) OR FlipperTrigger(ball2.x, ball2.y, LeftFlipper) Then DoDamping = true
    End If
    'Check right flipper
    If RightFlipper.currentangle = RFEndAngle Then
		If FlipperTrigger(ball1.x, ball1.y, RightFlipper) OR FlipperTrigger(ball2.x, ball2.y, RightFlipper) Then DoDamping = true
    End If
    If DoDamping Then
		coef = FCCDamping
        ball1.velx = ball1.velx * coef: ball1.vely = ball1.vely * coef: ball1.velz = ball1.velz * coef
        ball2.velx = ball2.velx * coef: ball2.vely = ball2.vely * coef: ball2.velz = ball2.velz * coef
    End If
End Sub

'*****************
' Maths
'*****************
Dim PI
PI = 4 * Atn(1)

Function dSin(degrees)
	dsin = Sin(degrees * Pi / 180)
End Function

Function dCos(degrees)
	dcos = Cos(degrees * Pi / 180)
End Function

Function Atn2(dy, dx)
	If dx > 0 Then
		Atn2 = Atn(dy / dx)
	ElseIf dx < 0 Then
		If dy = 0 Then
			Atn2 = pi
		Else
			Atn2 = Sgn(dy) * (pi - Atn(Abs(dy / dx)))
		End If
	ElseIf dx = 0 Then
		If dy = 0 Then
			Atn2 = 0
		Else
			Atn2 = Sgn(dy) * pi / 2
		End If
	End If
End Function

'*************************************************
'  Check ball distance from Flipper for Rem
'*************************************************

Function Distance(ax,ay,bx,by)
	Distance = Sqr((ax - bx) ^ 2 + (ay - by) ^ 2)
End Function

Function DistancePL(px,py,ax,ay,bx,by) 'Distance between a point and a line where point Is px,py
	DistancePL = Abs((by - ay) * px - (bx - ax) * py + bx * ay - by * ax) / Distance(ax,ay,bx,by)
End Function

Function Radians(Degrees)
	Radians = Degrees * PI / 180
End Function

Function AnglePP(ax,ay,bx,by)
	AnglePP = Atn2((by - ay),(bx - ax)) * 180 / PI
End Function

Function DistanceFromFlipper(ballx, bally, Flipper)
	DistanceFromFlipper = DistancePL(ballx, bally, Flipper.x, Flipper.y, Cos(Radians(Flipper.currentangle + 90)) + Flipper.x, Sin(Radians(Flipper.currentangle + 90)) + Flipper.y)
End Function

Function FlipperTrigger(ballx, bally, Flipper)
	Dim DiffAngle
	DiffAngle = Abs(Flipper.currentangle - AnglePP(Flipper.x, Flipper.y, ballx, bally) - 90)
	If DiffAngle > 180 Then DiffAngle = DiffAngle - 360
	
	If DistanceFromFlipper(ballx,bally,Flipper) < 48 And DiffAngle <= 90 And Distance(ballx,bally,Flipper.x,Flipper.y) < Flipper.Length Then
		FlipperTrigger = True
	Else
		FlipperTrigger = False
	End If
End Function


'*************************************************
'  End - Check ball distance from Flipper for Rem
'*************************************************

Dim LFPress, RFPress, LFCount, RFCount
Dim LFState, RFState
Dim EOST, EOSA,Frampup, FElasticity,FReturn
Dim RFEndAngle, LFEndAngle

Const FlipperCoilRampupMode = 0 '0 = fast, 1 = medium, 2 = slow (tap passes should work)

LFState = 1
RFState = 1
EOST = leftflipper.eostorque
EOSA = leftflipper.eostorqueangle
Frampup = LeftFlipper.rampup
FElasticity = LeftFlipper.elasticity
FReturn = LeftFlipper.return
'Const EOSTnew = 1.5 'EM's to late 80's - new recommendation by rothbauerw (previously 1)
Const EOSTnew = 1.2 '90's and later - new recommendation by rothbauerw (previously 0.8)
Const EOSAnew = 1
Const EOSRampup = 0
Dim SOSRampup
Select Case FlipperCoilRampupMode
	Case 0
		SOSRampup = 2.5
	Case 1
		SOSRampup = 6
	Case 2
		SOSRampup = 8.5
End Select

Const LiveCatch = 16
Const LiveElasticity = 0.45
Const SOSEM = 0.815
'   Const EOSReturn = 0.055  'EM's
'   Const EOSReturn = 0.045  'late 70's to mid 80's
'   Const EOSReturn = 0.035  'mid 80's to early 90's
Const EOSReturn = 0.025  'mid 90's and later

LFEndAngle = Leftflipper.endangle
RFEndAngle = RightFlipper.endangle

Sub FlipperActivate(Flipper, FlipperPress)
	FlipperPress = 1
	Flipper.Elasticity = FElasticity
	
	Flipper.eostorque = EOST
	Flipper.eostorqueangle = EOSA
End Sub

Sub FlipperDeactivate(Flipper, FlipperPress)
	FlipperPress = 0
	Flipper.eostorqueangle = EOSA
	Flipper.eostorque = EOST * EOSReturn / FReturn
	
	If Abs(Flipper.currentangle) <= Abs(Flipper.endangle) + 0.1 Then
		Dim b', BOT
		'		BOT = GetBalls
		
		For b = 0 To UBound(gBOT)
			If Distance(gBOT(b).x, gBOT(b).y, Flipper.x, Flipper.y) < 55 Then 'check for cradle
				If gBOT(b).vely >= - 0.4 Then gBOT(b).vely =  - 0.4
			End If
		Next
	End If
End Sub

Sub FlipperTricks (Flipper, FlipperPress, FCount, FEndAngle, FState)
	Dim Dir
	Dir = Flipper.startangle / Abs(Flipper.startangle) '-1 for Right Flipper
	
	If Abs(Flipper.currentangle) > Abs(Flipper.startangle) - 0.05 Then
		If FState <> 1 Then
			Flipper.rampup = SOSRampup
			Flipper.endangle = FEndAngle - 3 * Dir
			Flipper.Elasticity = FElasticity * SOSEM
			FCount = 0
			FState = 1
		End If
	ElseIf Abs(Flipper.currentangle) <= Abs(Flipper.endangle) And FlipperPress = 1 Then
		If FCount = 0 Then FCount = GameTime
		
		If FState <> 2 Then
			Flipper.eostorqueangle = EOSAnew
			Flipper.eostorque = EOSTnew
			Flipper.rampup = EOSRampup
			Flipper.endangle = FEndAngle
			FState = 2
		End If
	ElseIf Abs(Flipper.currentangle) > Abs(Flipper.endangle) + 0.01 And FlipperPress = 1 Then
		If FState <> 3 Then
			Flipper.eostorque = EOST
			Flipper.eostorqueangle = EOSA
			Flipper.rampup = Frampup
			Flipper.Elasticity = FElasticity
			FState = 3
		End If
	End If
End Sub

Const LiveDistanceMin = 30  'minimum distance In vp units from flipper base live catch dampening will occur
Const LiveDistanceMax = 114 'maximum distance in vp units from flipper base live catch dampening will occur (tip protection)

Sub CheckLiveCatch(ball, Flipper, FCount, parm) 'Experimental new live catch
	Dim Dir
	Dir = Flipper.startangle / Abs(Flipper.startangle)	'-1 for Right Flipper
	Dim LiveCatchBounce																														'If live catch is not perfect, it won't freeze ball totally
	Dim CatchTime
	CatchTime = GameTime - FCount
	
	If CatchTime <= LiveCatch And parm > 6 And Abs(Flipper.x - ball.x) > LiveDistanceMin And Abs(Flipper.x - ball.x) < LiveDistanceMax Then
		If CatchTime <= LiveCatch * 0.5 Then												'Perfect catch only when catch time happens in the beginning of the window
			LiveCatchBounce = 0
		Else
			LiveCatchBounce = Abs((LiveCatch / 2) - CatchTime)		'Partial catch when catch happens a bit late
		End If
		
		If LiveCatchBounce = 0 And ball.velx * Dir > 0 Then ball.velx = 0
		ball.vely = LiveCatchBounce * (32 / LiveCatch) ' Multiplier for inaccuracy bounce
		ball.angmomx = 0
		ball.angmomy = 0
		ball.angmomz = 0
	Else
		If Abs(Flipper.currentangle) <= Abs(Flipper.endangle) + 1 Then FlippersD.Dampenf ActiveBall, parm
	End If
End Sub

'******************************************************
'****  END FLIPPER CORRECTIONS
'******************************************************

Sub leftInlaneSpeedLimit
	'Wylte's implementation
'    debug.print "Spin in: "& activeball.AngMomZ
'    debug.print "Speed in: "& activeball.vely
	if activeball.vely < 0 then exit sub 							'don't affect upwards movement
    activeball.AngMomZ = -abs(activeball.AngMomZ) * RndNum(3,6)
    If abs(activeball.AngMomZ) > 60 Then activeball.AngMomZ = 0.8 * activeball.AngMomZ
    If abs(activeball.AngMomZ) > 80 Then activeball.AngMomZ = 0.8 * activeball.AngMomZ
    If activeball.AngMomZ > 100 Then activeball.AngMomZ = RndNum(80,100)
    If activeball.AngMomZ < -100 Then activeball.AngMomZ = RndNum(-80,-100)

    if abs(activeball.vely) > 5 then activeball.vely = 0.8 * activeball.vely
    if abs(activeball.vely) > 10 then activeball.vely = 0.8 * activeball.vely
    if abs(activeball.vely) > 15 then activeball.vely = 0.8 * activeball.vely
    if activeball.vely > 16 then activeball.vely = RndNum(14,16)
    if activeball.vely < -16 then activeball.vely = RndNum(-14,-16)
'    debug.print "Spin out: "& activeball.AngMomZ
'    debug.print "Speed out: "& activeball.vely
End Sub


Sub rightInlaneSpeedLimit
	'Wylte's implementation
'    debug.print "Spin in: "& activeball.AngMomZ
'    debug.print "Speed in: "& activeball.vely
	if activeball.vely < 0 then exit sub 							'don't affect upwards movement
    activeball.AngMomZ = abs(activeball.AngMomZ) * RndNum(2,4)
    If abs(activeball.AngMomZ) > 60 Then activeball.AngMomZ = 0.8 * activeball.AngMomZ
    If abs(activeball.AngMomZ) > 80 Then activeball.AngMomZ = 0.8 * activeball.AngMomZ
    If activeball.AngMomZ > 100 Then activeball.AngMomZ = RndNum(80,100)
    If activeball.AngMomZ < -100 Then activeball.AngMomZ = RndNum(-80,-100)

	if abs(activeball.vely) > 5 then activeball.vely = 0.8 * activeball.vely
    if abs(activeball.vely) > 10 then activeball.vely = 0.8 * activeball.vely
    if abs(activeball.vely) > 15 then activeball.vely = 0.8 * activeball.vely
    if activeball.vely > 16 then activeball.vely = RndNum(14,16)
    if activeball.vely < -16 then activeball.vely = RndNum(-14,-16)
'    debug.print "Spin out: "& activeball.AngMomZ
'    debug.print "Speed out: "& activeball.vely
End Sub






'******************************************************
' 	ZDMP:  RUBBER  DAMPENERS
'******************************************************
' These are data mined bounce curves,
' dialed in with the in-game elasticity as much as possible to prevent angle / spin issues.
' Requires tracking ballspeed to calculate COR

Sub dPosts_Hit(idx)
	RubbersD.dampen ActiveBall
	TargetBouncer ActiveBall, 1
End Sub

Sub dSleeves_Hit(idx)
	SleevesD.Dampen ActiveBall
	TargetBouncer ActiveBall, 0.7
End Sub

Dim RubbersD				'frubber
Set RubbersD = New Dampener
RubbersD.name = "Rubbers"
RubbersD.debugOn = False	'shows info in textbox "TBPout"
RubbersD.Print = False	  'debug, reports In debugger (In vel, out cor); cor bounce curve (linear)

'for best results, try to match in-game velocity as closely as possible to the desired curve
'   RubbersD.addpoint 0, 0, 0.935   'point# (keep sequential), ballspeed, CoR (elasticity)
RubbersD.addpoint 0, 0, 1.1		 'point# (keep sequential), ballspeed, CoR (elasticity)
RubbersD.addpoint 1, 3.77, 0.97
RubbersD.addpoint 2, 5.76, 0.967	'dont take this as gospel. if you can data mine rubber elasticitiy, please help!
RubbersD.addpoint 3, 15.84, 0.874
RubbersD.addpoint 4, 56, 0.64	   'there's clamping so interpolate up to 56 at least

Dim SleevesD	'this is just rubber but cut down to 85%...
Set SleevesD = New Dampener
SleevesD.name = "Sleeves"
SleevesD.debugOn = False	'shows info in textbox "TBPout"
SleevesD.Print = False	  'debug, reports In debugger (In vel, out cor)
SleevesD.CopyCoef RubbersD, 0.85

'######################### Add new FlippersD Profile
'######################### Adjust these values to increase or lessen the elasticity

Dim FlippersD
Set FlippersD = New Dampener
FlippersD.name = "Flippers"
FlippersD.debugOn = False
FlippersD.Print = False
FlippersD.addpoint 0, 0, 1.1
FlippersD.addpoint 1, 3.77, 0.99
FlippersD.addpoint 2, 6, 0.99

Class Dampener
	Public Print, debugOn   'tbpOut.text
	Public name, Threshold  'Minimum threshold. Useful for Flippers, which don't have a hit threshold.
	Public ModIn, ModOut
	Private Sub Class_Initialize
		ReDim ModIn(0)
		ReDim Modout(0)
	End Sub
	
	Public Sub AddPoint(aIdx, aX, aY)
		ShuffleArrays ModIn, ModOut, 1
		ModIn(aIDX) = aX
		ModOut(aIDX) = aY
		ShuffleArrays ModIn, ModOut, 0
		If GameTime > 100 Then Report
	End Sub
	
	Public Sub Dampen(aBall)
		If threshold Then
			If BallSpeed(aBall) < threshold Then Exit Sub
		End If
		Dim RealCOR, DesiredCOR, str, coef
		DesiredCor = LinearEnvelope(cor.ballvel(aBall.id), ModIn, ModOut )
		RealCOR = BallSpeed(aBall) / (cor.ballvel(aBall.id) + 0.0001)
		coef = desiredcor / realcor
		If debugOn Then str = name & " In vel:" & Round(cor.ballvel(aBall.id),2 ) & vbNewLine & "desired cor: " & Round(desiredcor,4) & vbNewLine & _
		"actual cor: " & Round(realCOR,4) & vbNewLine & "ballspeed coef: " & Round(coef, 3) & vbNewLine
		If Print Then Debug.print Round(cor.ballvel(aBall.id),2) & ", " & Round(desiredcor,3)
		
		aBall.velx = aBall.velx * coef
		aBall.vely = aBall.vely * coef
		If debugOn Then TBPout.text = str
	End Sub
	
	Public Sub Dampenf(aBall, parm) 'Rubberizer is handle here
		Dim RealCOR, DesiredCOR, str, coef
		DesiredCor = LinearEnvelope(cor.ballvel(aBall.id), ModIn, ModOut )
		RealCOR = BallSpeed(aBall) / (cor.ballvel(aBall.id) + 0.0001)
		coef = desiredcor / realcor
		If Abs(aball.velx) < 2 And aball.vely < 0 And aball.vely >  - 3.75 Then
			aBall.velx = aBall.velx * coef
			aBall.vely = aBall.vely * coef
		End If
	End Sub
	
	Public Sub CopyCoef(aObj, aCoef) 'alternative addpoints, copy with coef
		Dim x
		For x = 0 To UBound(aObj.ModIn)
			addpoint x, aObj.ModIn(x), aObj.ModOut(x) * aCoef
		Next
	End Sub
	
	Public Sub Report() 'debug, reports all coords in tbPL.text
		If Not debugOn Then Exit Sub
		Dim a1, a2
		a1 = ModIn
		a2 = ModOut
		Dim str, x
		For x = 0 To UBound(a1)
			str = str & x & ": " & Round(a1(x),4) & ", " & Round(a2(x),4) & vbNewLine
		Next
		TBPout.text = str
	End Sub
End Class



'******************************************************
'  TRACK ALL BALL VELOCITIES
'  FOR RUBBER DAMPENER AND DROP TARGETS
'******************************************************

Dim cor
Set cor = New CoRTracker

Class CoRTracker
	Public ballvel, ballvelx, ballvely
	
	Private Sub Class_Initialize
		ReDim ballvel(0)
		ReDim ballvelx(0)
		ReDim ballvely(0)
	End Sub
	
	Public Sub Update()	'tracks in-ball-velocity
		Dim str, b, AllBalls, highestID
		allBalls = GetBalls
		
		For Each b In allballs
			If b.id >= HighestID Then highestID = b.id
		Next
		
		If UBound(ballvel) < highestID Then ReDim ballvel(highestID)	'set bounds
		If UBound(ballvelx) < highestID Then ReDim ballvelx(highestID)	'set bounds
		If UBound(ballvely) < highestID Then ReDim ballvely(highestID)	'set bounds
		
		For Each b In allballs
			ballvel(b.id) = BallSpeed(b)
			ballvelx(b.id) = b.velx
			ballvely(b.id) = b.vely
		Next
	End Sub
End Class

' Note, cor.update must be called in a 10 ms timer. The example table uses the GameTimer for this purpose, but sometimes a dedicated timer call RDampen is used.
'
'Sub RDampen_Timer
'	Cor.Update
'End Sub



'******************************************************
'****  END PHYSICS DAMPENERS
'******************************************************







'******************************************************
'****  DROP TARGETS by Rothbauerw
'******************************************************
' This solution improves the physics for drop targets to create more realistic behavior. It allows the ball 
' to move through the target enabling the ability to score more than one target with a well placed shot.
' It also handles full drop target animation, including deflection on hit and a slight lift when the drop 
' targets raise, switch handling, bricking, and popping the ball up if it's over the drop target when it raises.
'
'Add a Timer named DTAnim to editor to handle drop & standup target animations, or run them off an always-on 10ms timer (GameTimer)
'DTAnim.interval = 10
'DTAnim.enabled = True

'Sub DTAnim_Timer
'	DoDTAnim
'	DoSTAnim
'End Sub

' For each drop target, we'll use two wall objects for physics calculations and one primitive for visuals and   
' animation. We will not use target objects.  Place your drop target primitive the same as you would a VP drop target. 
' The primitive should have it's pivot point centered on the x and y axis and at or just below the playfield 
' level on the z axis. Orientation needs to be set using Rotz and bending deflection using Rotx. You'll find a hooded 
' target mesh in this table's example. It uses the same texture map as the VP drop targets.

'******************************************************
'  DROP TARGETS INITIALIZATION
'******************************************************

Class DropTarget
	Private m_primary, m_secondary, m_prim, m_sw, m_animate, m_isDropped
  
	Public Property Get Primary(): Set Primary = m_primary: End Property
	Public Property Let Primary(input): Set m_primary = input: End Property
  
	Public Property Get Secondary(): Set Secondary = m_secondary: End Property
	Public Property Let Secondary(input): Set m_secondary = input: End Property
  
	Public Property Get Prim(): Set Prim = m_prim: End Property
	Public Property Let Prim(input): Set m_prim = input: End Property
  
	Public Property Get Sw(): Sw = m_sw: End Property
	Public Property Let Sw(input): m_sw = input: End Property
  
	Public Property Get Animate(): Animate = m_animate: End Property
	Public Property Let Animate(input): m_animate = input: End Property
  
	Public Property Get IsDropped(): IsDropped = m_isDropped: End Property
	Public Property Let IsDropped(input): m_isDropped = input: End Property
  
	Public default Function init(primary, secondary, prim, sw, animate, isDropped)
	  Set m_primary = primary
	  Set m_secondary = secondary
	  Set m_prim = prim
	  m_sw = sw
	  m_animate = animate
	  m_isDropped = isDropped
  
	  Set Init = Me
	End Function
  End Class


'Set array with drop target objects
'
'DropTargetvar = Array(primary, secondary, prim, swtich, animate)
' 	primary: 			primary target wall to determine drop
'	secondary:			wall used to simulate the ball striking a bent or offset target after the initial Hit
'	prim:				primitive target used for visuals and animation
'							IMPORTANT!!! 
'							rotz must be used for orientation
'							rotx to bend the target back
'							transz to move it up and down
'							the pivot point should be in the center of the target on the x, y and at or below the playfield (0) on z
'	switch:				ROM switch number
'	animate:			Arrary slot for handling the animation instrucitons, set to 0
'
'	Values for annimate: 1 - bend target (hit to primary), 2 - drop target (hit to secondary), 3 - brick target (high velocity hit to secondary), -1 - raise target 



'********This is a modified version to DT's. Bend animation is reversed. Do not mix with other codes.*****
Dim DT1, DT2, DT3, DT4, DT5, DT6, DT7, DT8
Set DT1 = (new DropTarget)(sw7, sw7a, sw7p, 1, 0, false)
Set DT2 = (new DropTarget)(sw8, sw8a, sw8p, 2, 0, false)
Set DT3 = (new DropTarget)(sw9, sw9a, sw9p, 3, 0, false)
Set DT4 = (new DropTarget)(sw10, sw10a, sw10p, 4, 0, false)
Set DT5 = (new DropTarget)(drop11, drop11a, drop11p, 5, 0, false)
Set DT6 = (new DropTarget)(sw1, sw1a, sw1p, 6, 0, false)
Set DT7 = (new DropTarget)(sw2, sw2a, sw2p, 7, 0, false)
Set DT8 = (new DropTarget)(sw3, sw3a, sw3p, 8, 0, false)

Dim DTArray
DTArray = Array(DT1, DT2, DT3, DT4, DT5, DT6, DT7, DT8)

	'Configure the behavior of Drop Targets.
Const DTDropSpeed = 80 'in milliseconds
Const DTDropUpSpeed = 40 'in milliseconds
Const DTDropUnits = 49 'VP units primitive drops so top of at or below the playfield
Const DTDropUpUnits = 10 'VP units primitive raises above the up position on drops up
Const DTMaxBend = 8 'max degrees primitive rotates when hit
Const DTDropDelay = 20 'time in milliseconds before target drops (due to friction/impact of the ball)
Const DTRaiseDelay = 40 'time in milliseconds before target drops back to normal up position after the solenoid fires to raise the target
Const DTBrickVel = 0 'velocity at which the target will brick, set to '0' to disable brick

Const DTEnableBrick = 0 'Set to 0 to disable bricking, 1 to enable bricking
Const DTHitSound = "" 'Drop Target Hit sound
Const DTDropSound = "" 'Drop Target Drop sound
Const DTResetSound = "" 'Drop Target reset sound

Const DTMass = 0.2 'Mass of the Drop Target (between 0 and 1), higher values provide more resistance

'******************************************************
'  DROP TARGETS FUNCTIONS
'******************************************************

Sub DTHit(switch)
	Dim i
	i = DTArrayID(switch)

	PlayTargetSound
	DTArray(i).animate =  DTCheckBrick(Activeball,DTArray(i).prim)
	If DTArray(i).animate = 1 or DTArray(i).animate = 3 or DTArray(i).animate = 4 Then
		DTBallPhysics Activeball, DTArray(i).prim.rotz, DTMass
	End If
	DoDTAnim
End Sub

Sub DTRaise(switch)
	Dim i
	i = DTArrayID(switch)

	DTArray(i).animate = -1
	DTArray(i).IsDropped = False
	DoDTAnim
End Sub

Sub DTDrop(switch)
	Dim i
	i = DTArrayID(switch)

	DTArray(i).animate = 1
	DTArray(i).IsDropped = True
	DoDTAnim
End Sub

Function DTIsDropped(switch)
	Dim i
	i = DTArrayID(switch)

	DTIsDropped = DTArray(i).IsDropped
End Function

Function DTArrayID(switch)
	Dim i
	For i = 0 to uBound(DTArray) 
		If DTArray(i).sw = switch Then DTArrayID = i:Exit Function 
	Next
End Function


sub DTBallPhysics(aBall, angle, mass)
	dim rangle,bangle,calc1, calc2, calc3
	rangle = (angle - 90) * 3.1416 / 180
	bangle = atn2(cor.ballvely(aball.id),cor.ballvelx(aball.id))

	calc1 = cor.BallVel(aball.id) * cos(bangle - rangle) * (aball.mass - mass) / (aball.mass + mass)
	calc2 = cor.BallVel(aball.id) * sin(bangle - rangle) * cos(rangle + 4*Atn(1)/2)
	calc3 = cor.BallVel(aball.id) * sin(bangle - rangle) * sin(rangle + 4*Atn(1)/2)

	aBall.velx = calc1 * cos(rangle) + calc2
	aBall.vely = calc1 * sin(rangle) + calc3
End Sub


'Check if target is hit on it's face or sides and whether a 'brick' occurred
Function DTCheckBrick(aBall, dtprim) 
	dim bangle, bangleafter, rangle, rangle2, Xintersect, Yintersect, cdist, perpvel, perpvelafter, paravel, paravelafter
	rangle = (dtprim.rotz - 90) * 3.1416 / 180
	rangle2 = dtprim.rotz * 3.1416 / 180
	bangle = atn2(cor.ballvely(aball.id),cor.ballvelx(aball.id))
	bangleafter = Atn2(aBall.vely,aball.velx)

	Xintersect = (aBall.y - dtprim.y - tan(bangle) * aball.x + tan(rangle2) * dtprim.x) / (tan(rangle2) - tan(bangle))
	Yintersect = tan(rangle2) * Xintersect + (dtprim.y - tan(rangle2) * dtprim.x)

	cdist = Distance(dtprim.x, dtprim.y, Xintersect, Yintersect)

	perpvel = cor.BallVel(aball.id) * cos(bangle-rangle)
	paravel = cor.BallVel(aball.id) * sin(bangle-rangle)

	perpvelafter = BallSpeed(aBall) * cos(bangleafter - rangle) 
	paravelafter = BallSpeed(aBall) * sin(bangleafter - rangle)

	If perpvel > 0 and  perpvelafter <= 0 Then
		If DTEnableBrick = 1 and  perpvel > DTBrickVel and DTBrickVel <> 0 and cdist < 8 Then
			DTCheckBrick = 3
		Else
			DTCheckBrick = 1
		End If
	ElseIf perpvel > 0 and ((paravel > 0 and paravelafter > 0) or (paravel < 0 and paravelafter < 0)) Then
		DTCheckBrick = 4
	Else 
		DTCheckBrick = 0
	End If
End Function


Sub DoDTAnim()
	Dim i
	For i=0 to Ubound(DTArray)
		DTArray(i).animate = DTAnimate(DTArray(i).primary,DTArray(i).secondary,DTArray(i).prim,DTArray(i).sw,DTArray(i).animate, i)
	Next
End Sub

Function DTAnimate(primary, secondary, prim, switch, animate, index)
	dim transz, switchid
	Dim animtime, rangle

	switchid = switch

	rangle = prim.rotz * PI / 180

	DTAnimate = animate

	if animate = 0  Then
		primary.uservalue = 0
		DTAnimate = 0
		Exit Function
	Elseif primary.uservalue = 0 then 
		primary.uservalue = gametime
	end if

	animtime = gametime - primary.uservalue

	If (animate = 1 or animate = 4) and animtime < DTDropDelay Then
		primary.collidable = 0
	If animate = 1 then secondary.collidable = 1 else secondary.collidable= 0
		prim.rotx = -DTMaxBend * cos(rangle)
		prim.roty = DTMaxBend * sin(rangle)
		DTAnimate = animate
		Exit Function
		elseif (animate = 1 or animate = 4) and animtime > DTDropDelay Then
		primary.collidable = 0
		If animate = 1 then secondary.collidable = 1 else secondary.collidable= 0
		prim.rotx = -DTMaxBend * cos(rangle)
		prim.roty = DTMaxBend * sin(rangle)
		animate = 2
		SoundDropTargetDrop prim
	End If

	if animate = 2 Then
		transz = (animtime - DTDropDelay)/DTDropSpeed *  DTDropUnits * -1
		if prim.transz > -DTDropUnits  Then
			prim.transz = transz
		end if

		prim.rotx = -DTMaxBend * cos(rangle)/2
		prim.roty = DTMaxBend * sin(rangle)/2

		if prim.transz <= -DTDropUnits Then 
			prim.transz = -DTDropUnits
			secondary.collidable = 0
			DTArray(index).IsDropped = True
			DTAction switchid
			primary.uservalue = 0
			DTAnimate = 0
			Exit Function
		Else
			DTAnimate = 2
			Exit Function
		end If 
	End If

	If animate = 3 and animtime < DTDropDelay Then
		primary.collidable = 0
		secondary.collidable = 1
		prim.rotx = -DTMaxBend * cos(rangle)
		prim.roty = DTMaxBend * sin(rangle)
	elseif animate = 3 and animtime > DTDropDelay Then
		primary.collidable = 1
		secondary.collidable = 0
		prim.rotx = 0
		prim.roty = 0
		primary.uservalue = 0
		DTAnimate = 0
		Exit Function
	End If

	if animate = -1 Then
		transz = (1 - (animtime)/DTDropUpSpeed) *  DTDropUnits * -1

		If prim.transz = -DTDropUnits Then
			Dim b

			For b = 0 to UBound(gBOT)
				If InRotRect(gBOT(b).x,gBOT(b).y,prim.x, prim.y, prim.rotz, -25,-10,25,-10,25,25,-25,25) and gBOT(b).z < prim.z+DTDropUnits+25 Then
					gBOT(b).velz = 20
				End If
			Next
		End If

		if prim.transz < 0 Then
			prim.transz = transz
		elseif transz > 0 then
			prim.transz = transz
		end if

		if prim.transz > DTDropUpUnits then 
			DTAnimate = -2
			prim.transz = DTDropUpUnits
			prim.rotx = 0
			prim.roty = 0
			primary.uservalue = gametime
		end if
		primary.collidable = 0
		secondary.collidable = 1

	End If

	if animate = -2 and animtime > DTRaiseDelay Then
		prim.transz = (animtime - DTRaiseDelay)/DTDropSpeed *  DTDropUnits * -1 + DTDropUpUnits 
		if prim.transz < 0 then
			prim.transz = 0
			primary.uservalue = 0
			DTAnimate = 0

			primary.collidable = 1
			secondary.collidable = 0
		end If 
	End If
End Function

Sub DTAction(switchid)
	Select Case switchid
		Case 1, 2 ,3, 4, 5
			DOF 108,DOFPulse
			Addscore SCORE_TARGET_UNLIT
			avDrops5bankHit(nPlayer).add switchid - 1
			If bSkillShotActive Then
				SkillShotAward eSkillDrops
			End If
			AnySwitchHit eSwitchDropB + (switchid - 1)
			DTCheckBank
		Case 6, 7, 8
			If not bResetInlines Then
				DOF 109,DOFPulse
				Addscore SCORE_TARGET_UNLIT
'				if avModesRunning(nPlayer).Contains(eModeMultiball2) Then
'					ModeMultiball2Update eShotInlineDrops, eSwitchInlineLower + (switchid - 6)
'				End If
				DTCheckInlines
			End If
	End Select
End Sub

Sub DTCheckBank
	Dim i, n, sBlasts, oEvent
	n = 0

	for i = 0 to 4
		If DTArray(i).IsDropped Or avDrops5bankHit(nPlayer).Contains(i) Then
			n = n + 1
		End If
	next
	
	If avDrops5bankHit(nPlayer).IsFull Then
		avDrops5bankHit(nPlayer).Clear
		If anBlasts(nPlayer) < 3 Then
			anBlasts(nPlayer) = anBlasts(nPlayer) + 1
			If 1 = anBlasts(nPlayer) Then
				sBlasts = anBlasts(nPlayer) & " BLAST!"
			Else
				sBlasts = anBlasts(nPlayer) & " BLASTS!"
			End If
			DMDUpdateBlasts
			Set oEvent = New EventItem
			oEvent.priority = ePrioBlastAdded
			oEvent.text = Array(sBlasts, "HIT THE ACTION", "BUTTON TO BLAST!")
			oEvent.maxQueueLength = 0
			oEvent.pupTrigger = RoundRobinEvent("BlastAdded")
			oEvent.duration = RoundRobinLength("BlastAdded")
			oEvent.lightshow = eLightShowCircleShort
			oEventQueue.Add oEvent
'			DMDTimedText Array(sBlasts, "HIT THE ACTION", "BUTTON TO BLAST!"), 2000, ePrioBlastAdded
		Else
			sBlasts = "MAX BLASTS: " & FormatScore(SCORE_BLASTS_MAXED * fPlayfieldX)
			Addscore SCORE_BLASTS_MAXED
			Set oEvent = New EventItem
			oEvent.priority = ePrioBlastAdded
			oEvent.text = Array(sBlasts, "HIT THE ACTION", "BUTTON TO BLAST!")
			oEvent.maxQueueLength = 0
			oEvent.pupTrigger = RoundRobinEvent("BlastAdded")
			oEvent.duration = RoundRobinLength("BlastAdded")
			oEvent.lightshow = eLightShowCircleShort
			oEventQueue.Add oEvent
'			DMDTimedText Array(sBlasts, "HIT THE ACTION", "BUTTON TO BLAST!"), 2000, ePrioBlastAdded
		End If
	End If
	If 5 = n Then
		vpmTimer.AddTimer 500, "SolDTBank1to5 True '"
	End If
End Sub

Sub DTCheckInlines
	Dim i, n
	n = 0

	for i = 5 to 7
		If DTArray(i).IsDropped Then n = n + 1
	next
	
	If 3 = n Then
'		bResetInlines = True
	End If
End Sub

'******************************************************
'  DROP TARGET
'  SUPPORTING FUNCTIONS 
'******************************************************


' Used for drop targets
'*** Determines if a Points (px,py) is inside a 4 point polygon A-D in Clockwise/CCW order
Function InRect(px,py,ax,ay,bx,by,cx,cy,dx,dy)
	Dim AB, BC, CD, DA
	AB = (bx*py) - (by*px) - (ax*py) + (ay*px) + (ax*by) - (ay*bx)
	BC = (cx*py) - (cy*px) - (bx*py) + (by*px) + (bx*cy) - (by*cx)
	CD = (dx*py) - (dy*px) - (cx*py) + (cy*px) + (cx*dy) - (cy*dx)
	DA = (ax*py) - (ay*px) - (dx*py) + (dy*px) + (dx*ay) - (dy*ax)

	If (AB <= 0 AND BC <=0 AND CD <= 0 AND DA <= 0) Or (AB >= 0 AND BC >=0 AND CD >= 0 AND DA >= 0) Then
		InRect = True
	Else
		InRect = False       
	End If
End Function

Function InRotRect(ballx,bally,px,py,angle,ax,ay,bx,by,cx,cy,dx,dy)
    Dim rax,ray,rbx,rby,rcx,rcy,rdx,rdy
    Dim rotxy
    rotxy = RotPoint(ax,ay,angle)
    rax = rotxy(0)+px : ray = rotxy(1)+py
    rotxy = RotPoint(bx,by,angle)
    rbx = rotxy(0)+px : rby = rotxy(1)+py
    rotxy = RotPoint(cx,cy,angle)
    rcx = rotxy(0)+px : rcy = rotxy(1)+py
    rotxy = RotPoint(dx,dy,angle)
    rdx = rotxy(0)+px : rdy = rotxy(1)+py

    InRotRect = InRect(ballx,bally,rax,ray,rbx,rby,rcx,rcy,rdx,rdy)
End Function

Function RotPoint(x,y,angle)
    dim rx, ry
    rx = x*dCos(angle) - y*dSin(angle)
    ry = x*dSin(angle) + y*dCos(angle)
    RotPoint = Array(rx,ry)
End Function


'******************************************************
'****  END DROP TARGETS
'******************************************************

'******************************************************
'		STAND-UP TARGET INITIALIZATION
'******************************************************

Class StandupTarget
  Private m_primary, m_prim, m_sw, m_animate

  Public Property Get Primary(): Set Primary = m_primary: End Property
  Public Property Let Primary(input): Set m_primary = input: End Property

  Public Property Get Prim(): Set Prim = m_prim: End Property
  Public Property Let Prim(input): Set m_prim = input: End Property

  Public Property Get Sw(): Sw = m_sw: End Property
  Public Property Let Sw(input): m_sw = input: End Property

  Public Property Get Animate(): Animate = m_animate: End Property
  Public Property Let Animate(input): m_animate = input: End Property

  Public default Function init(primary, prim, sw, animate)
    Set m_primary = primary
    Set m_prim = prim
    m_sw = sw
    m_animate = animate

    Set Init = Me
  End Function
End Class



'Define a variable for each stand-up target
Dim ST12, ST13

'Set array with stand-up target objects
'
'StandupTargetvar = Array(primary, prim, swtich)
' 	primary: 			vp target to determine target hit
'	prim:				primitive target used for visuals and animation
'							IMPORTANT!!! 
'							transy must be used to offset the target animation
'	switch:				ROM switch number
'	animate:			Arrary slot for handling the animation instrucitons, set to 0
' 
'You will also need to add a secondary hit object for each stand up (name sw11o, sw12o, and sw13o on the example Table1)
'these are inclined primitives to simulate hitting a bent target and should provide so z velocity on high speed impacts

Set ST12 = (new StandupTarget)(sw12, psw12,12, 0)
Set ST13 = (new StandupTarget)(sw13, psw13,13, 0)

'Add all the Stand-up Target Arrays to Stand-up Target Animation Array
' STAnimationArray = Array(ST1, ST2, ....)
Dim STArray
STArray = Array(ST12, ST13)

'Configure the behavior of Stand-up Targets
Const STAnimStep =  1.5 				'vpunits per animation step (control return to Start)
Const STMaxOffset = 9 			'max vp units target moves when hit

Const STMass = 0.2				'Mass of the Stand-up Target (between 0 and 1), higher values provide more resistance

'******************************************************
'				STAND-UP TARGETS FUNCTIONS
'******************************************************

Sub STHit(switch)
	Dim i
	i = STArrayID(switch)

	PlayTargetSound
	STArray(i).animate =  STCheckHit(Activeball,STArray(i).primary)

	If STArray(i).animate <> 0 Then
		DTBallPhysics Activeball, STArray(i).primary.orientation, STMass
	End If
	DoSTAnim
End Sub

Function STArrayID(switch)
	Dim i
	For i = 0 to uBound(STArray) 
		If STArray(i).sw = switch Then STArrayID = i:Exit Function 
	Next
End Function

'Check if target is hit on it's face
Function STCheckHit(aBall, target) 
	dim bangle, bangleafter, rangle, rangle2, perpvel, perpvelafter, paravel, paravelafter
	rangle = (target.orientation - 90) * 3.1416 / 180	
	bangle = atn2(cor.ballvely(aball.id),cor.ballvelx(aball.id))
	bangleafter = Atn2(aBall.vely,aball.velx)

	perpvel = cor.BallVel(aball.id) * cos(bangle-rangle)
	paravel = cor.BallVel(aball.id) * sin(bangle-rangle)

	perpvelafter = BallSpeed(aBall) * cos(bangleafter - rangle) 
	paravelafter = BallSpeed(aBall) * sin(bangleafter - rangle)

	If perpvel > 0 and  perpvelafter <= 0 Then
		STCheckHit = 1
	ElseIf perpvel > 0 and ((paravel > 0 and paravelafter > 0) or (paravel < 0 and paravelafter < 0)) Then
		STCheckHit = 1
	Else 
		STCheckHit = 0
	End If
End Function

Sub DoSTAnim()
	Dim i
	For i=0 to Ubound(STArray)
		STArray(i).animate = STAnimate(STArray(i).primary,STArray(i).prim,STArray(i).sw,STArray(i).animate)
	Next
End Sub

Function STAnimate(primary, prim, switch,  animate)
	Dim animtime

	STAnimate = animate

	if animate = 0  Then
		primary.uservalue = 0
		STAnimate = 0
		Exit Function
	Elseif primary.uservalue = 0 then 
		primary.uservalue = gametime
	end if

	animtime = gametime - primary.uservalue

	If animate = 1 Then
		primary.collidable = 0
		prim.transy = -STMaxOffset
		if UsingROM then 
			vpmTimer.PulseSw switch
		else
			STAction switch
		end if
		STAnimate = 2
		Exit Function
	elseif animate = 2 Then
		prim.transy = prim.transy + STAnimStep
		If prim.transy >= 0 Then
			prim.transy = 0
			primary.collidable = 1
			STAnimate = 0
			Exit Function
		Else 
			STAnimate = 2
		End If
	End If	
End Function

Sub STAction(Switch)
	Dim oEvent
	Select Case Switch
		Case 12
			DOF 109,DOFPulse
			Addscore SCORE_TARGET_UNLIT
			AnySwitchHit eSwitchTargetPurple
			If anMysteryShotsMade(nPlayer) < 3 Then
				anMysteryShotsMade(nPlayer) = anMysteryShotsMade(nPlayer) + 1
				If anMysteryShotsMade(nPlayer) >= 3 Then
					Set oEvent = New EventItem
					oEvent.priority = ePrioMysteryLit
					oEvent.duration = 2500
					oEvent.maxQueueLength = 0
					oEvent.text = "MYSTERY IS LIT"
					oEvent.pupTrigger = 718
					oEventQueue.Add oEvent
					Lampz.SetLamp eLightMystery, LightStateOn
					cLightLiteMystery.state = LightStateOff
				End If
			End If
		Case 13
			DOF 108,DOFPulse
			If GameTime - anSwitchLastHit(eSwitchInlineEnd) > (nDebounceTime * 5) Then
				anSwitchLastHit(eSwitchInlineEnd) = GameTime
				Addscore SCORE_TARGET_UNLIT
				AnySwitchHit eSwitchInlineEnd
				If eSwitchInlineEnd = ExpectedInlineSwitch Then
					If anComboTimer(eShotInlineDrops) > 0 Then AwardCombo eShotInlineDrops
				End If
				If CanAdvanceMultiballs Then
					AdvanceMball2 eSwitchInlineEnd, oLastBallInInlines
				End If
			End If
	End Select
End Sub

'******************************************************
'		END STAND-UP TARGETS
'******************************************************



'******************************************************
'****  BALL ROLLING AND DROP SOUNDS
'******************************************************
'
' Be sure to call RollingUpdate in a timer with a 10ms interval see the GameTimer_Timer() sub

ReDim rolling(tnob)
InitRolling

Dim DropCount
ReDim DropCount(tnob)

Sub InitRolling
	Dim i
	For i = 0 to tnob
		rolling(i) = False
	Next
End Sub

Sub RollingUpdate()
	Dim b', BOT
'	BOT = GetBalls

	' stop the sound of deleted balls
	For b = UBound(gBOT) + 1 to tnob - 1
		' Comment the next line if you are not implementing Dyanmic Ball Shadows
		If AmbientBallShadowOn = 0 Then BallShadowA(b).visible = 0
		rolling(b) = False
		StopSound("BallRoll_" & b)
	Next

	' exit the sub if no balls on the table
	If UBound(gBOT) = -1 Then Exit Sub

	' play the rolling sound for each ball

	For b = 0 to UBound(gBOT)
		If BallVel(gBOT(b)) > 1 AND gBOT(b).z < 30 Then
			rolling(b) = True
			PlaySound ("BallRoll_" & b), -1, VolPlayfieldRoll(gBOT(b)) * BallRollVolume * VolumeDial, AudioPan(gBOT(b)), 0, PitchPlayfieldRoll(gBOT(b)), 1, 0, AudioFade(gBOT(b))

		Else
			If rolling(b) = True Then
				StopSound("BallRoll_" & b)
				rolling(b) = False
			End If
		End If

		' Ball Drop Sounds
		If gBOT(b).VelZ < -1 and gBOT(b).z < 55 and gBOT(b).z > 27 Then 'height adjust for ball drop sounds
			If DropCount(b) >= 5 Then
				DropCount(b) = 0
				If gBOT(b).velz > -7 Then
					RandomSoundBallBouncePlayfieldSoft gBOT(b)
				Else
					RandomSoundBallBouncePlayfieldHard gBOT(b)
				End If				
			End If
		End If
		If DropCount(b) < 5 Then
			DropCount(b) = DropCount(b) + 1
		End If

		' "Static" Ball Shadows
		' Comment the next If block, if you are not implementing the Dyanmic Ball Shadows
		If AmbientBallShadowOn = 0 Then
			If gBOT(b).Z > 30 Then
				BallShadowA(b).height=gBOT(b).z - BallSize/4		'This is technically 1/4 of the ball "above" the ramp, but it keeps it from clipping the ramp
			Else
				BallShadowA(b).height=gBOT(b).z - BallSize/2 + 5
			End If
			BallShadowA(b).Y = gBOT(b).Y + Ballsize/5 + offsetY
			BallShadowA(b).X = gBOT(b).X + offsetX
			BallShadowA(b).visible = 1
		End If
	Next
End Sub


'******************************************************
'****  END BALL ROLLING AND DROP SOUNDS
'******************************************************




'******************************************************
'**** RAMP ROLLING SFX
'******************************************************

'Ball tracking ramp SFX 1.0
'   Reqirements:
'          * Import A Sound File for each ball on the table for plastic ramps.  Call It RampLoop<Ball_Number> ex: RampLoop1, RampLoop2, ...
'          * Import a Sound File for each ball on the table for wire ramps. Call it WireLoop<Ball_Number> ex: WireLoop1, WireLoop2, ...
'          * Create a Timer called RampRoll, that is enabled, with a interval of 100
'          * Set RampBAlls and RampType variable to Total Number of Balls
'	Usage:
'          * Setup hit events and call WireRampOn True or WireRampOn False (True = Plastic ramp, False = Wire Ramp)
'          * To stop tracking ball
'                 * call WireRampOff
'                 * Otherwise, the ball will auto remove if it's below 30 vp units
'

dim RampMinLoops : RampMinLoops = 4

' RampBalls
'      Setup:        Set the array length of x in RampBalls(x,2) Total Number of Balls on table + 1:  if tnob = 5, then RammBalls(6,2)
'      Description:  
dim RampBalls(6,2)
'x,0 = ball x,1 = ID,	2 = Protection against ending early (minimum amount of updates)
'0,0 is boolean on/off, 0,1 unused for now
RampBalls(0,0) = False

' RampType
'     Setup: Set this array to the number Total number of balls that can be tracked at one time + 1.  5 ball multiball then set value to 6
'     Description: Array type indexed on BallId and a values used to deterimine what type of ramp the ball is on: False = Wire Ramp, True = Plastic Ramp
dim RampType(6)	

Sub WireRampOn(input)  : Waddball ActiveBall, input : RampRollUpdate: End Sub
Sub WireRampOff() : WRemoveBall ActiveBall.ID	: End Sub


' WaddBall (Active Ball, Boolean)
'     Description: This subroutine is called from WireRampOn to Add Balls to the RampBalls Array
Sub Waddball(input, RampInput)	'Add ball
	' This will loop through the RampBalls array checking each element of the array x, position 1
	' To see if the the ball was already added to the array.
	' If the ball is found then exit the subroutine
	dim x : for x = 1 to uBound(RampBalls)	'Check, don't add balls twice
		if RampBalls(x, 1) = input.id then 
			if Not IsEmpty(RampBalls(x,1) ) then Exit Sub	'Frustating issue with BallId 0. Empty variable = 0
		End If
	Next

	' This will itterate through the RampBalls Array.
	' The first time it comes to a element in the array where the Ball Id (Slot 1) is empty.  It will add the current ball to the array
	' The RampBalls assigns the ActiveBall to element x,0 and ball id of ActiveBall to 0,1
	' The RampType(BallId) is set to RampInput
	' RampBalls in 0,0 is set to True, this will enable the timer and the timer is also turned on
	For x = 1 to uBound(RampBalls)
		if IsEmpty(RampBalls(x, 1)) then 
			Set RampBalls(x, 0) = input
			RampBalls(x, 1)	= input.ID
			RampType(x) = RampInput
			RampBalls(x, 2)	= 0
			'exit For
			RampBalls(0,0) = True
			RampRoll.Enabled = 1	 'Turn on timer
			'RampRoll.Interval = RampRoll.Interval 'reset timer
			exit Sub
		End If
		if x = uBound(RampBalls) then 	'debug
			Debug.print "WireRampOn error, ball queue is full: " & vbnewline & _
			RampBalls(0, 0) & vbnewline & _
			Typename(RampBalls(1, 0)) & " ID:" & RampBalls(1, 1) & "type:" & RampType(1) & vbnewline & _
			Typename(RampBalls(2, 0)) & " ID:" & RampBalls(2, 1) & "type:" & RampType(2) & vbnewline & _
			Typename(RampBalls(3, 0)) & " ID:" & RampBalls(3, 1) & "type:" & RampType(3) & vbnewline & _
			Typename(RampBalls(4, 0)) & " ID:" & RampBalls(4, 1) & "type:" & RampType(4) & vbnewline & _
			Typename(RampBalls(5, 0)) & " ID:" & RampBalls(5, 1) & "type:" & RampType(5) & vbnewline & _
			" "
		End If
	next
End Sub

' WRemoveBall (BallId)
'    Description: This subroutine is called from the RampRollUpdate subroutine 
'                 and is used to remove and stop the ball rolling sounds
Sub WRemoveBall(ID)		'Remove ball
	'Debug.Print "In WRemoveBall() + Remove ball from loop array"
	dim ballcount : ballcount = 0
	dim x : for x = 1 to Ubound(RampBalls)
		if ID = RampBalls(x, 1) then 'remove ball
			Set RampBalls(x, 0) = Nothing
			RampBalls(x, 1) = Empty
			RampType(x) = Empty
			StopSound("RampLoop" & x)
			StopSound("wireloop" & x)
		end If
		'if RampBalls(x,1) = Not IsEmpty(Rampballs(x,1) then ballcount = ballcount + 1
		if not IsEmpty(Rampballs(x,1)) then ballcount = ballcount + 1
	next
	if BallCount = 0 then RampBalls(0,0) = False	'if no balls in queue, disable timer update
End Sub

Sub RampRoll_Timer():RampRollUpdate:End Sub

Sub RampRollUpdate()		'Timer update
	dim x : for x = 1 to uBound(RampBalls)
		if Not IsEmpty(RampBalls(x,1) ) then 
			if BallVel(RampBalls(x,0) ) > 1 then ' if ball is moving, play rolling sound
				If RampType(x) then 
					PlaySound("RampLoop" & x), -1, VolPlayfieldRoll(RampBalls(x,0)) * RampRollVolume * VolumeDial, AudioPan(RampBalls(x,0)), 0, BallPitchV(RampBalls(x,0)), 1, 0, AudioFade(RampBalls(x,0))				
					StopSound("wireloop" & x)
				Else
					StopSound("RampLoop" & x)
					PlaySound("wireloop" & x), -1, VolPlayfieldRoll(RampBalls(x,0)) * RampRollVolume * VolumeDial, AudioPan(RampBalls(x,0)), 0, BallPitch(RampBalls(x,0)), 1, 0, AudioFade(RampBalls(x,0))
				End If
				RampBalls(x, 2)	= RampBalls(x, 2) + 1
			Else
				StopSound("RampLoop" & x)
				StopSound("wireloop" & x)
			end if
			if RampBalls(x,0).Z < 30 and RampBalls(x, 2) > RampMinLoops then	'if ball is on the PF, remove  it
				StopSound("RampLoop" & x)
				StopSound("wireloop" & x)
				Wremoveball RampBalls(x,1)
			End If
		Else
			StopSound("RampLoop" & x)
			StopSound("wireloop" & x)
		end if
	next
	if not RampBalls(0,0) then RampRoll.enabled = 0

End Sub

' This can be used to debug the Ramp Roll time.  You need to enable the tbWR timer on the TextBox
Sub tbWR_Timer()	'debug textbox
	me.text =	"on? " & RampBalls(0, 0) & " timer: " & RampRoll.Enabled & vbnewline & _
	"1 " & Typename(RampBalls(1, 0)) & " ID:" & RampBalls(1, 1) & " type:" & RampType(1) & " Loops:" & RampBalls(1, 2) & vbnewline & _
	"2 " & Typename(RampBalls(2, 0)) & " ID:" & RampBalls(2, 1) & " type:" & RampType(2) & " Loops:" & RampBalls(2, 2) & vbnewline & _
	"3 " & Typename(RampBalls(3, 0)) & " ID:" & RampBalls(3, 1) & " type:" & RampType(3) & " Loops:" & RampBalls(3, 2) & vbnewline & _
	"4 " & Typename(RampBalls(4, 0)) & " ID:" & RampBalls(4, 1) & " type:" & RampType(4) & " Loops:" & RampBalls(4, 2) & vbnewline & _
	"5 " & Typename(RampBalls(5, 0)) & " ID:" & RampBalls(5, 1) & " type:" & RampType(5) & " Loops:" & RampBalls(5, 2) & vbnewline & _
	"6 " & Typename(RampBalls(6, 0)) & " ID:" & RampBalls(6, 1) & " type:" & RampType(6) & " Loops:" & RampBalls(6, 2) & vbnewline & _
	" "
End Sub


Function BallPitch(ball) ' Calculates the pitch of the sound based on the ball speed
    BallPitch = pSlope(BallVel(ball), 1, -1000, 60, 10000)
End Function

Function BallPitchV(ball) ' Calculates the pitch of the sound based on the ball speed Variation
	BallPitchV = pSlope(BallVel(ball), 1, -4000, 60, 7000)
End Function



'******************************************************
'**** END RAMP ROLLING SFX
'******************************************************





'******************************************************
'****  FLEEP MECHANICAL SOUNDS
'******************************************************

' This part in the script is an entire block that is dedicated to the physics sound system.
' Various scripts and sounds that may be pretty generic and could suit other WPC systems, but the most are tailored specifically for the TOM table

' Many of the sounds in this package can be added by creating collections and adding the appropriate objects to those collections.  
' Create the following new collections:
' 	Metals (all metal objects, metal walls, metal posts, metal wire guides)
' 	Apron (the apron walls and plunger wall)
' 	Walls (all wood or plastic walls)
' 	Rollovers (wire rollover triggers, star triggers, or button triggers)
' 	Targets (standup or drop targets, these are hit sounds only ... you will want to add separate dropping sounds for drop targets)
' 	Gates (plate gates)
' 	GatesWire (wire gates)
' 	Rubbers (all rubbers including posts, sleeves, pegs, and bands)
' When creating the collections, make sure "Fire events for this collection" is checked.  
' You'll also need to make sure "Has Hit Event" is checked for each object placed in these collections (not necessary for gates and triggers).  
' Once the collections and objects are added, the save, close, and restart VPX.
'
' Many places in the script need to be modified to include the correct sound effect subroutine calls. The tutorial videos linked below demonstrate 
' how to make these updates. But in summary the following needs to be updated:	
'	- Nudging, plunger, coin-in, start button sounds will be added to the keydown and keyup subs.
'	- Flipper sounds in the flipper solenoid subs. Flipper collision sounds in the flipper collide subs.
'	- Bumpers, slingshots, drain, ball release, knocker, spinner, and saucers in their respective subs
'	- Ball rolling sounds sub
'
' Tutorial vides by Apophis
' Part 1: 	https://youtu.be/PbE2kNiam3g
' Part 2: 	https://youtu.be/B5cm1Y8wQsk
' Part 3: 	https://youtu.be/eLhWyuYOyGg


'///////////////////////////////  SOUNDS PARAMETERS  //////////////////////////////
Dim GlobalSoundLevel, CoinSoundLevel, PlungerReleaseSoundLevel, PlungerPullSoundLevel, NudgeLeftSoundLevel
Dim NudgeRightSoundLevel, NudgeCenterSoundLevel, StartButtonSoundLevel, RollingSoundFactor

CoinSoundLevel = 1														'volume level; range [0, 1]
NudgeLeftSoundLevel = 1													'volume level; range [0, 1]
NudgeRightSoundLevel = 1												'volume level; range [0, 1]
NudgeCenterSoundLevel = 1												'volume level; range [0, 1]
StartButtonSoundLevel = 0.1												'volume level; range [0, 1]
PlungerReleaseSoundLevel = 0.8 '1 wjr											'volume level; range [0, 1]
PlungerPullSoundLevel = 1												'volume level; range [0, 1]
RollingSoundFactor = 1.1/5		

'///////////////////////-----Solenoids, Kickers and Flash Relays-----///////////////////////
Dim FlipperUpAttackMinimumSoundLevel, FlipperUpAttackMaximumSoundLevel, FlipperUpAttackLeftSoundLevel, FlipperUpAttackRightSoundLevel
Dim FlipperUpSoundLevel, FlipperDownSoundLevel, FlipperLeftHitParm, FlipperRightHitParm
Dim SlingshotSoundLevel, BumperSoundFactor, KnockerSoundLevel

FlipperUpAttackMinimumSoundLevel = 0.010           						'volume level; range [0, 1]
FlipperUpAttackMaximumSoundLevel = 0.635								'volume level; range [0, 1]
FlipperUpSoundLevel = 1.0                        						'volume level; range [0, 1]
FlipperDownSoundLevel = 0.45                      						'volume level; range [0, 1]
FlipperLeftHitParm = FlipperUpSoundLevel								'sound helper; not configurable
FlipperRightHitParm = FlipperUpSoundLevel								'sound helper; not configurable
SlingshotSoundLevel = 0.95												'volume level; range [0, 1]
BumperSoundFactor = 4.25												'volume multiplier; must not be zero
KnockerSoundLevel = 1 													'volume level; range [0, 1]
Const Solenoid_SpinWheelsMotor_SoundLevel = 0.2


'///////////////////////-----Ball Drops, Bumps and Collisions-----///////////////////////
Dim RubberStrongSoundFactor, RubberWeakSoundFactor, RubberFlipperSoundFactor,BallWithBallCollisionSoundFactor
Dim BallBouncePlayfieldSoftFactor, BallBouncePlayfieldHardFactor, PlasticRampDropToPlayfieldSoundLevel, WireRampDropToPlayfieldSoundLevel, DelayedBallDropOnPlayfieldSoundLevel
Dim WallImpactSoundFactor, MetalImpactSoundFactor, SubwaySoundLevel, SubwayEntrySoundLevel, ScoopEntrySoundLevel
Dim SaucerLockSoundLevel, SaucerKickSoundLevel

BallWithBallCollisionSoundFactor = 3.2									'volume multiplier; must not be zero
RubberStrongSoundFactor = 0.055/5											'volume multiplier; must not be zero
RubberWeakSoundFactor = 0.075/5											'volume multiplier; must not be zero
RubberFlipperSoundFactor = 0.075/5										'volume multiplier; must not be zero
BallBouncePlayfieldSoftFactor = 0.025									'volume multiplier; must not be zero
BallBouncePlayfieldHardFactor = 0.025									'volume multiplier; must not be zero
DelayedBallDropOnPlayfieldSoundLevel = 0.8									'volume level; range [0, 1]
WallImpactSoundFactor = 0.075											'volume multiplier; must not be zero
MetalImpactSoundFactor = 0.075/3
SaucerLockSoundLevel = 0.8
SaucerKickSoundLevel = 0.8

'///////////////////////-----Gates, Spinners, Rollovers and Targets-----///////////////////////

Dim GateSoundLevel, TargetSoundFactor, SpinnerSoundLevel, RolloverSoundLevel, DTSoundLevel

GateSoundLevel = 0.5/5													'volume level; range [0, 1]
TargetSoundFactor = 0.0025 * 10											'volume multiplier; must not be zero
DTSoundLevel = 0.25														'volume multiplier; must not be zero
RolloverSoundLevel = 0.25                              					'volume level; range [0, 1]
SpinnerSoundLevel = 0.5                              					'volume level; range [0, 1]

'///////////////////////-----Ball Release, Guides and Drain-----///////////////////////
Dim DrainSoundLevel, BallReleaseSoundLevel, BottomArchBallGuideSoundFactor, FlipperBallGuideSoundFactor 

DrainSoundLevel = 0.8														'volume level; range [0, 1]
BallReleaseSoundLevel = 1												'volume level; range [0, 1]
BottomArchBallGuideSoundFactor = 0.2									'volume multiplier; must not be zero
FlipperBallGuideSoundFactor = 0.015										'volume multiplier; must not be zero

'///////////////////////-----Loops and Lanes-----///////////////////////
Dim ArchSoundFactor
ArchSoundFactor = 0.025/5													'volume multiplier; must not be zero


'/////////////////////////////  SOUND PLAYBACK FUNCTIONS  ////////////////////////////
'/////////////////////////////  POSITIONAL SOUND PLAYBACK METHODS  ////////////////////////////
' Positional sound playback methods will play a sound, depending on the X,Y position of the table element or depending on ActiveBall object position
' These are similar subroutines that are less complicated to use (e.g. simply use standard parameters for the PlaySound call)
' For surround setup - positional sound playback functions will fade between front and rear surround channels and pan between left and right channels
' For stereo setup - positional sound playback functions will only pan between left and right channels
' For mono setup - positional sound playback functions will not pan between left and right channels and will not fade between front and rear channels

' PlaySound full syntax - PlaySound(string, int loopcount, float volume, float pan, float randompitch, int pitch, bool useexisting, bool restart, float front_rear_fade)
' Note - These functions will not work (currently) for walls/slingshots as these do not feature a simple, single X,Y position
Sub PlaySoundAtLevelStatic(playsoundparams, aVol, tableobj)
	PlaySound playsoundparams, 0, min(aVol,1) * VolumeDial, AudioPan(tableobj), 0, 0, 0, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelExistingStatic(playsoundparams, aVol, tableobj)
	PlaySound playsoundparams, 0, min(aVol,1) * VolumeDial, AudioPan(tableobj), 0, 0, 1, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelStaticLoop(playsoundparams, aVol, tableobj)
	PlaySound playsoundparams, -1, min(aVol,1) * VolumeDial, AudioPan(tableobj), 0, 0, 0, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelExistingStaticLoop(playsoundparams, aVol, tableobj)
    PlaySound playsoundparams, -1, min(aVol,1) * VolumeDial, AudioPan(tableobj), 0, 0, 1, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelStaticRandomPitch(playsoundparams, aVol, randomPitch, tableobj)
	PlaySound playsoundparams, 0, min(aVol,1) * VolumeDial, AudioPan(tableobj), randomPitch, 0, 0, 0, AudioFade(tableobj)
End Sub

Sub PlaySoundAtLevelActiveBall(playsoundparams, aVol)
	PlaySound playsoundparams, 0, min(aVol,1) * VolumeDial, AudioPan(ActiveBall), 0, 0, 0, 0, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtLevelExistingActiveBall(playsoundparams, aVol)
	PlaySound playsoundparams, 0, min(aVol,1) * VolumeDial, AudioPan(ActiveBall), 0, 0, 1, 0, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtLeveTimerActiveBall(playsoundparams, aVol, ballvariable)
	PlaySound playsoundparams, 0, min(aVol,1) * VolumeDial, AudioPan(ballvariable), 0, 0, 0, 0, AudioFade(ballvariable)
End Sub

Sub PlaySoundAtLevelTimerExistingActiveBall(playsoundparams, aVol, ballvariable)
	PlaySound playsoundparams, 0, min(aVol,1) * VolumeDial, AudioPan(ballvariable), 0, 0, 1, 0, AudioFade(ballvariable)
End Sub

Sub PlaySoundAtLevelRoll(playsoundparams, aVol, pitch)
	PlaySound playsoundparams, -1, min(aVol,1) * VolumeDial, AudioPan(tableobj), randomPitch, 0, 0, 0, AudioFade(tableobj)
End Sub

' Previous Positional Sound Subs

Sub PlaySoundAt(soundname, tableobj)
	PlaySound soundname, 1, 1 * VolumeDial, AudioPan(tableobj), 0,0,0, 1, AudioFade(tableobj)
End Sub

Sub PlaySoundAtVol(soundname, tableobj, aVol)
	PlaySound soundname, 1, min(aVol,1) * VolumeDial, AudioPan(tableobj), 0,0,0, 1, AudioFade(tableobj)
End Sub

Sub PlaySoundAtBall(soundname)
	PlaySoundAt soundname, ActiveBall
End Sub

Sub PlaySoundAtBallVol (Soundname, aVol)
	Playsound soundname, 1,min(aVol,1) * VolumeDial, AudioPan(ActiveBall), 0,0,0, 1, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtBallVolM (Soundname, aVol)
	Playsound soundname, 1,min(aVol,1) * VolumeDial, AudioPan(ActiveBall), 0,0,0, 0, AudioFade(ActiveBall)
End Sub

Sub PlaySoundAtVolLoops(sound, tableobj, Vol, Loops)
	PlaySound sound, Loops, Vol * VolumeDial, AudioPan(tableobj), 0,0,0, 1, AudioFade(tableobj)
End Sub


'******************************************************
'  Fleep  Supporting Ball & Sound Functions
'******************************************************

Function AudioFade(tableobj) ' Fades between front and back of the table (for surround systems or 2x2 speakers, etc), depending on the Y position on the table. "table1" is the name of the table
  Dim tmp
    tmp = tableobj.y * 2 / tableheight-1

	if tmp > 7000 Then
		tmp = 7000
	elseif tmp < -7000 Then
		tmp = -7000
	end if

    If tmp > 0 Then
		AudioFade = Csng(tmp ^10)
    Else
        AudioFade = Csng(-((- tmp) ^10) )
    End If
End Function

Function AudioPan(tableobj) ' Calculates the pan for a tableobj based on the X position on the table. "table1" is the name of the table
    Dim tmp
    tmp = tableobj.x * 2 / tablewidth-1

	if tmp > 7000 Then
		tmp = 7000
	elseif tmp < -7000 Then
		tmp = -7000
	end if

    If tmp > 0 Then
        AudioPan = Csng(tmp ^10)
    Else
        AudioPan = Csng(-((- tmp) ^10) )
    End If
End Function

Function Vol(ball) ' Calculates the volume of the sound based on the ball speed
	Vol = Csng(BallVel(ball) ^2)
End Function

Function Volz(ball) ' Calculates the volume of the sound based on the ball speed
	Volz = Csng((ball.velz) ^2)
End Function

Function Pitch(ball) ' Calculates the pitch of the sound based on the ball speed
	Pitch = BallVel(ball) * 20
End Function

Function BallVel(ball) 'Calculates the ball speed
	BallVel = INT(SQR((ball.VelX ^2) + (ball.VelY ^2) ) )
End Function

Function VolPlayfieldRoll(ball) ' Calculates the roll volume of the sound based on the ball speed
	VolPlayfieldRoll = RollingSoundFactor * 0.0005 * Csng(BallVel(ball) ^3)
End Function

Function PitchPlayfieldRoll(ball) ' Calculates the roll pitch of the sound based on the ball speed
	PitchPlayfieldRoll = BallVel(ball) ^2 * 15
End Function

Function RndInt(min, max)
	RndInt = Int(Rnd() * (max-min + 1) + min)' Sets a random number integer between min and max
End Function

Function RndNum(min, max)
	RndNum = Rnd() * (max-min) + min' Sets a random number between min and max
End Function

'/////////////////////////////  GENERAL SOUND SUBROUTINES  ////////////////////////////
Sub SoundStartButton()
	PlaySound ("Start_Button"), 0, StartButtonSoundLevel, 0, 0.25
End Sub

Sub SoundNudgeLeft()
	PlaySound ("Nudge_" & Int(Rnd*2)+1), 0, NudgeLeftSoundLevel * VolumeDial, -0.1, 0.25
End Sub

Sub SoundNudgeRight()
	PlaySound ("Nudge_" & Int(Rnd*2)+1), 0, NudgeRightSoundLevel * VolumeDial, 0.1, 0.25
End Sub

Sub SoundNudgeCenter()
	PlaySound ("Nudge_" & Int(Rnd*2)+1), 0, NudgeCenterSoundLevel * VolumeDial, 0, 0.25
End Sub


Sub SoundPlungerPull()
	PlaySoundAtLevelStatic ("Plunger_Pull_1"), PlungerPullSoundLevel, Plunger
End Sub

Sub SoundPlungerReleaseBall()
	PlaySoundAtLevelStatic ("Plunger_Release_Ball"), PlungerReleaseSoundLevel, Plunger	
End Sub

Sub SoundPlungerReleaseNoBall()
	PlaySoundAtLevelStatic ("Plunger_Release_No_Ball"), PlungerReleaseSoundLevel, Plunger
End Sub


'/////////////////////////////  KNOCKER SOLENOID  ////////////////////////////
Sub KnockerSolenoid()
	PlaySoundAtLevelStatic SoundFX("Knocker_1",DOFKnocker), KnockerSoundLevel, KnockerPosition
End Sub

'/////////////////////////////  DRAIN SOUNDS  ////////////////////////////
Sub RandomSoundDrain(drainswitch)
	PlaySoundAtLevelStatic ("Drain_" & Int(Rnd*11)+1), DrainSoundLevel, drainswitch
End Sub

'/////////////////////////////  TROUGH BALL RELEASE SOLENOID SOUNDS  ////////////////////////////

Sub RandomSoundBallRelease(drainswitch)
	PlaySoundAtLevelStatic SoundFX("BallRelease" & Int(Rnd*7)+1,DOFContactors), BallReleaseSoundLevel, drainswitch
End Sub

'/////////////////////////////  SLINGSHOT SOLENOID SOUNDS  ////////////////////////////
Sub RandomSoundSlingshotLeft(sling)
	PlaySoundAtLevelStatic SoundFX("Sling_L" & Int(Rnd*10)+1,DOFContactors), SlingshotSoundLevel, Sling
End Sub

Sub RandomSoundSlingshotRight(sling)
	PlaySoundAtLevelStatic SoundFX("Sling_R" & Int(Rnd*8)+1,DOFContactors), SlingshotSoundLevel, Sling
End Sub

'/////////////////////////////  BUMPER SOLENOID SOUNDS  ////////////////////////////
Sub RandomSoundBumperTop(Bump)
	PlaySoundAtLevelStatic SoundFX("Bumpers_Top_" & Int(Rnd*5)+1,DOFContactors), Vol(ActiveBall) * BumperSoundFactor, Bump
End Sub

Sub RandomSoundBumperMiddle(Bump)
	PlaySoundAtLevelStatic SoundFX("Bumpers_Middle_" & Int(Rnd*5)+1,DOFContactors), Vol(ActiveBall) * BumperSoundFactor, Bump
End Sub

Sub RandomSoundBumperBottom(Bump)
	PlaySoundAtLevelStatic SoundFX("Bumpers_Bottom_" & Int(Rnd*5)+1,DOFContactors), Vol(ActiveBall) * BumperSoundFactor, Bump
End Sub

'/////////////////////////////  SPINNER SOUNDS  ////////////////////////////
Sub SoundSpinner(spinnerswitch)
	PlaySoundAtLevelStatic ("Spinner"), SpinnerSoundLevel, spinnerswitch
End Sub


'/////////////////////////////  FLIPPER BATS SOUND SUBROUTINES  ////////////////////////////
'/////////////////////////////  FLIPPER BATS SOLENOID ATTACK SOUND  ////////////////////////////
Sub SoundFlipperUpAttackLeft(flipper)
	FlipperUpAttackLeftSoundLevel = RndNum(FlipperUpAttackMinimumSoundLevel, FlipperUpAttackMaximumSoundLevel)
	PlaySoundAtLevelStatic SoundFX("Flipper_Attack-L01",DOFFlippers), FlipperUpAttackLeftSoundLevel, flipper
End Sub

Sub SoundFlipperUpAttackRight(flipper)
	FlipperUpAttackRightSoundLevel = RndNum(FlipperUpAttackMinimumSoundLevel, FlipperUpAttackMaximumSoundLevel)
	PlaySoundAtLevelStatic SoundFX("Flipper_Attack-R01",DOFFlippers), FlipperUpAttackLeftSoundLevel, flipper
End Sub

'/////////////////////////////  FLIPPER BATS SOLENOID CORE SOUND  ////////////////////////////
Sub RandomSoundFlipperUpLeft(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_L0" & Int(Rnd*9)+1,DOFFlippers), FlipperLeftHitParm, Flipper
End Sub

Sub RandomSoundFlipperUpRight(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_R0" & Int(Rnd*9)+1,DOFFlippers), FlipperRightHitParm, Flipper
End Sub

Sub RandomSoundReflipUpLeft(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_ReFlip_L0" & Int(Rnd*3)+1,DOFFlippers), (RndNum(0.8, 1))*FlipperUpSoundLevel, Flipper
End Sub

Sub RandomSoundReflipUpRight(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_ReFlip_R0" & Int(Rnd*3)+1,DOFFlippers), (RndNum(0.8, 1))*FlipperUpSoundLevel, Flipper
End Sub

Sub RandomSoundFlipperDownLeft(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_Left_Down_" & Int(Rnd*7)+1,DOFFlippers), FlipperDownSoundLevel, Flipper
End Sub

Sub RandomSoundFlipperDownRight(flipper)
	PlaySoundAtLevelStatic SoundFX("Flipper_Right_Down_" & Int(Rnd*8)+1,DOFFlippers), FlipperDownSoundLevel, Flipper
End Sub

'/////////////////////////////  FLIPPER BATS BALL COLLIDE SOUND  ////////////////////////////

Sub LeftFlipperCollide(parm)
	FlipperLeftHitParm = parm/10
	If FlipperLeftHitParm > 1 Then
		FlipperLeftHitParm = 1
	End If
	FlipperLeftHitParm = FlipperUpSoundLevel * FlipperLeftHitParm
	RandomSoundRubberFlipper(parm)
End Sub

Sub RightFlipperCollide(parm)
	FlipperRightHitParm = parm/10
	If FlipperRightHitParm > 1 Then
		FlipperRightHitParm = 1
	End If
	FlipperRightHitParm = FlipperUpSoundLevel * FlipperRightHitParm
	RandomSoundRubberFlipper(parm)
End Sub

Sub RandomSoundRubberFlipper(parm)
	PlaySoundAtLevelActiveBall ("Flipper_Rubber_" & Int(Rnd*7)+1), parm  * RubberFlipperSoundFactor
End Sub

'/////////////////////////////  ROLLOVER SOUNDS  ////////////////////////////
Sub RandomSoundRollover()
	PlaySoundAtLevelActiveBall ("Rollover_" & Int(Rnd*4)+1), RolloverSoundLevel
End Sub

Sub Rollovers_Hit(idx)
	RandomSoundRollover
End Sub

'/////////////////////////////  VARIOUS PLAYFIELD SOUND SUBROUTINES  ////////////////////////////
'/////////////////////////////  RUBBERS AND POSTS  ////////////////////////////
'/////////////////////////////  RUBBERS - EVENTS  ////////////////////////////
Sub Rubbers_Hit(idx)
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 5 then		
		RandomSoundRubberStrong 1
	End if
	If finalspeed <= 5 then
		RandomSoundRubberWeak()
	End If	
End Sub

'/////////////////////////////  RUBBERS AND POSTS - STRONG IMPACTS  ////////////////////////////
Sub RandomSoundRubberStrong(voladj)
	Select Case Int(Rnd*10)+1
		Case 1 : PlaySoundAtLevelActiveBall ("Rubber_Strong_1"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 2 : PlaySoundAtLevelActiveBall ("Rubber_Strong_2"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 3 : PlaySoundAtLevelActiveBall ("Rubber_Strong_3"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 4 : PlaySoundAtLevelActiveBall ("Rubber_Strong_4"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 5 : PlaySoundAtLevelActiveBall ("Rubber_Strong_5"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 6 : PlaySoundAtLevelActiveBall ("Rubber_Strong_6"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 7 : PlaySoundAtLevelActiveBall ("Rubber_Strong_7"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 8 : PlaySoundAtLevelActiveBall ("Rubber_Strong_8"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 9 : PlaySoundAtLevelActiveBall ("Rubber_Strong_9"), Vol(ActiveBall) * RubberStrongSoundFactor*voladj
		Case 10 : PlaySoundAtLevelActiveBall ("Rubber_1_Hard"), Vol(ActiveBall) * RubberStrongSoundFactor * 0.6*voladj
	End Select
End Sub

'/////////////////////////////  RUBBERS AND POSTS - WEAK IMPACTS  ////////////////////////////
Sub RandomSoundRubberWeak()
	PlaySoundAtLevelActiveBall ("Rubber_" & Int(Rnd*9)+1), Vol(ActiveBall) * RubberWeakSoundFactor
End Sub

'/////////////////////////////  WALL IMPACTS  ////////////////////////////
Sub Walls_Hit(idx)
	RandomSoundWall()      
End Sub

Sub RandomSoundWall()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 16 then 
		Select Case Int(Rnd*5)+1
			Case 1 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_1"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 2 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_2"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 3 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_5"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 4 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_7"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 5 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_9"), Vol(ActiveBall) * WallImpactSoundFactor
		End Select
	End if
	If finalspeed >= 6 AND finalspeed <= 16 then
		Select Case Int(Rnd*4)+1
			Case 1 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_3"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 2 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_4"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 3 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_6"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 4 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_8"), Vol(ActiveBall) * WallImpactSoundFactor
		End Select
	End If
	If finalspeed < 6 Then
		Select Case Int(Rnd*3)+1
			Case 1 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_4"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 2 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_6"), Vol(ActiveBall) * WallImpactSoundFactor
			Case 3 : PlaySoundAtLevelExistingActiveBall ("Wall_Hit_8"), Vol(ActiveBall) * WallImpactSoundFactor
		End Select
	End if
End Sub

'/////////////////////////////  METAL TOUCH SOUNDS  ////////////////////////////
Sub RandomSoundMetal()
	PlaySoundAtLevelActiveBall ("Metal_Touch_" & Int(Rnd*13)+1), Vol(ActiveBall) * MetalImpactSoundFactor
End Sub

'/////////////////////////////  METAL - EVENTS  ////////////////////////////

Sub Metals_Hit (idx)
	RandomSoundMetal
End Sub

Sub ShooterDiverter_collide(idx)
	RandomSoundMetal
End Sub

'/////////////////////////////  BOTTOM ARCH BALL GUIDE  ////////////////////////////
'/////////////////////////////  BOTTOM ARCH BALL GUIDE - SOFT BOUNCES  ////////////////////////////
Sub RandomSoundBottomArchBallGuide()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 16 then 
		PlaySoundAtLevelActiveBall ("Apron_Bounce_"& Int(Rnd*2)+1), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
	End if
	If finalspeed >= 6 AND finalspeed <= 16 then
		Select Case Int(Rnd*2)+1
			Case 1 : PlaySoundAtLevelActiveBall ("Apron_Bounce_1"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
			Case 2 : PlaySoundAtLevelActiveBall ("Apron_Bounce_Soft_1"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
		End Select
	End If
	If finalspeed < 6 Then
		Select Case Int(Rnd*2)+1
			Case 1 : PlaySoundAtLevelActiveBall ("Apron_Bounce_Soft_1"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
			Case 2 : PlaySoundAtLevelActiveBall ("Apron_Medium_3"), Vol(ActiveBall) * BottomArchBallGuideSoundFactor
		End Select
	End if
End Sub

'/////////////////////////////  BOTTOM ARCH BALL GUIDE - HARD HITS  ////////////////////////////
Sub RandomSoundBottomArchBallGuideHardHit()
	PlaySoundAtLevelActiveBall ("Apron_Hard_Hit_" & Int(Rnd*3)+1), BottomArchBallGuideSoundFactor * 0.25
End Sub

Sub Apron_Hit (idx)
	If Abs(cor.ballvelx(activeball.id) < 4) and cor.ballvely(activeball.id) > 7 then
		RandomSoundBottomArchBallGuideHardHit()
	Else
		RandomSoundBottomArchBallGuide
	End If
End Sub

'/////////////////////////////  FLIPPER BALL GUIDE  ////////////////////////////
Sub RandomSoundFlipperBallGuide()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 16 then 
		Select Case Int(Rnd*2)+1
			Case 1 : PlaySoundAtLevelActiveBall ("Apron_Hard_1"),  Vol(ActiveBall) * FlipperBallGuideSoundFactor
			Case 2 : PlaySoundAtLevelActiveBall ("Apron_Hard_2"),  Vol(ActiveBall) * 0.8 * FlipperBallGuideSoundFactor
		End Select
	End if
	If finalspeed >= 6 AND finalspeed <= 16 then
		PlaySoundAtLevelActiveBall ("Apron_Medium_" & Int(Rnd*3)+1),  Vol(ActiveBall) * FlipperBallGuideSoundFactor
	End If
	If finalspeed < 6 Then
		PlaySoundAtLevelActiveBall ("Apron_Soft_" & Int(Rnd*7)+1),  Vol(ActiveBall) * FlipperBallGuideSoundFactor
	End If
End Sub

'/////////////////////////////  TARGET HIT SOUNDS  ////////////////////////////
Sub RandomSoundTargetHitStrong()
	PlaySoundAtLevelActiveBall SoundFX("Target_Hit_" & Int(Rnd*4)+5,DOFTargets), Vol(ActiveBall) * 0.45 * TargetSoundFactor
End Sub

Sub RandomSoundTargetHitWeak()		
	PlaySoundAtLevelActiveBall SoundFX("Target_Hit_" & Int(Rnd*4)+1,DOFTargets), Vol(ActiveBall) * TargetSoundFactor
End Sub

Sub PlayTargetSound()
	dim finalspeed
	finalspeed=SQR(activeball.velx * activeball.velx + activeball.vely * activeball.vely)
	If finalspeed > 10 then
		RandomSoundTargetHitStrong()
		RandomSoundBallBouncePlayfieldSoft Activeball
	Else 
		RandomSoundTargetHitWeak()
	End If	
End Sub

Sub Targets_Hit (idx)
	PlayTargetSound	
End Sub

'/////////////////////////////  BALL BOUNCE SOUNDS  ////////////////////////////
Sub RandomSoundBallBouncePlayfieldSoft(aBall)
	Select Case Int(Rnd*9)+1
		Case 1 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_1"), volz(aBall) * BallBouncePlayfieldSoftFactor, aBall
		Case 2 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_2"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.5, aBall
		Case 3 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_3"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.8, aBall
		Case 4 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_4"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.5, aBall
		Case 5 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Soft_5"), volz(aBall) * BallBouncePlayfieldSoftFactor, aBall
		Case 6 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_1"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.2, aBall
		Case 7 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_2"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.2, aBall
		Case 8 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_5"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.2, aBall
		Case 9 : PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_7"), volz(aBall) * BallBouncePlayfieldSoftFactor * 0.3, aBall
	End Select
End Sub

Sub RandomSoundBallBouncePlayfieldHard(aBall)
	PlaySoundAtLevelStatic ("Ball_Bounce_Playfield_Hard_" & Int(Rnd*7)+1), volz(aBall) * BallBouncePlayfieldHardFactor, aBall
End Sub

'/////////////////////////////  DELAYED DROP - TO PLAYFIELD - SOUND  ////////////////////////////
Sub RandomSoundDelayedBallDropOnPlayfield(aBall)
	Select Case Int(Rnd*5)+1
		Case 1 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_1_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 2 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_2_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 3 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_3_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 4 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_4_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
		Case 5 : PlaySoundAtLevelStatic ("Ball_Drop_Playfield_5_Delayed"), DelayedBallDropOnPlayfieldSoundLevel, aBall
	End Select
End Sub

'/////////////////////////////  BALL GATES AND BRACKET GATES SOUNDS  ////////////////////////////

Sub SoundPlayfieldGate()			
	PlaySoundAtLevelStatic ("Gate_FastTrigger_" & Int(Rnd*2)+1), GateSoundLevel, Activeball
End Sub

Sub SoundHeavyGate()
	PlaySoundAtLevelStatic ("Gate_2"), GateSoundLevel, Activeball
End Sub

Sub Gates_hit(idx)
	SoundHeavyGate
End Sub

Sub GatesWire_hit(idx)	
	SoundPlayfieldGate	
End Sub	

'/////////////////////////////  LEFT LANE ENTRANCE - SOUNDS  ////////////////////////////

Sub RandomSoundLeftArch()
	PlaySoundAtLevelActiveBall ("Arch_L" & Int(Rnd*4)+1), Vol(ActiveBall) * ArchSoundFactor
End Sub

Sub RandomSoundRightArch()
	PlaySoundAtLevelActiveBall ("Arch_R" & Int(Rnd*4)+1), Vol(ActiveBall) * ArchSoundFactor
End Sub


Sub Arch1_hit()
	If Activeball.velx > 1 Then SoundPlayfieldGate
	StopSound "Arch_L1"
	StopSound "Arch_L2"
	StopSound "Arch_L3"
	StopSound "Arch_L4"
End Sub

Sub Arch1_unhit()
	If activeball.velx < -8 Then
		RandomSoundRightArch
	End If
End Sub

Sub Arch2_hit()
	If Activeball.velx < 1 Then SoundPlayfieldGate
	StopSound "Arch_R1"
	StopSound "Arch_R2"
	StopSound "Arch_R3"
	StopSound "Arch_R4"
End Sub

Sub Arch2_unhit()
	If activeball.velx > 10 Then
		RandomSoundLeftArch
	End If
End Sub

'/////////////////////////////  SAUCERS (KICKER HOLES)  ////////////////////////////

Sub SoundSaucerLock()
	PlaySoundAtLevelStatic ("Saucer_Enter_" & Int(Rnd*2)+1), SaucerLockSoundLevel, Activeball
End Sub

Sub SoundSaucerKick(scenario, saucer)
	Select Case scenario
		Case 0: PlaySoundAtLevelStatic SoundFX("Saucer_Empty", DOFContactors), SaucerKickSoundLevel, saucer
		Case 1: PlaySoundAtLevelStatic SoundFX("Saucer_Kick", DOFContactors), SaucerKickSoundLevel, saucer
	End Select
End Sub

'/////////////////////////////  BALL COLLISION SOUND  ////////////////////////////
Sub OnBallBallCollision(ball1, ball2, velocity)
	FlipperCradleCollision ball1, ball2, velocity

	Dim snd
	Select Case Int(Rnd*7)+1
		Case 1 : snd = "Ball_Collide_1"
		Case 2 : snd = "Ball_Collide_2"
		Case 3 : snd = "Ball_Collide_3"
		Case 4 : snd = "Ball_Collide_4"
		Case 5 : snd = "Ball_Collide_5"
		Case 6 : snd = "Ball_Collide_6"
		Case 7 : snd = "Ball_Collide_7"
	End Select

	PlaySound (snd), 0, Csng(velocity) ^2 / 200 * BallWithBallCollisionSoundFactor * VolumeDial, AudioPan(ball1), 0, Pitch(ball1), 0, 0, AudioFade(ball1)
End Sub


'///////////////////////////  DROP TARGET HIT SOUNDS  ///////////////////////////

Sub RandomSoundDropTargetReset(obj)
	PlaySoundAtLevelStatic SoundFX("Drop_Target_Reset_" & Int(Rnd*6)+1,DOFContactors), 1, obj
End Sub

Sub SoundDropTargetDrop(obj)
	PlaySoundAtLevelStatic ("Drop_Target_Down_" & Int(Rnd*6)+1), 200, obj
End Sub

'/////////////////////////////  GI AND FLASHER RELAYS  ////////////////////////////

Const RelayFlashSoundLevel = 0.315									'volume level; range [0, 1];
Const RelayGISoundLevel = 1.05									'volume level; range [0, 1];

Sub Sound_GI_Relay(toggle, obj)
	Select Case toggle
		Case 1
			PlaySoundAtLevelStatic ("Relay_GI_On"), 0.025*RelayGISoundLevel, obj
		Case 0
			PlaySoundAtLevelStatic ("Relay_GI_Off"), 0.025*RelayGISoundLevel, obj
	End Select
End Sub

Sub Sound_Flash_Relay(toggle, obj)
	Select Case toggle
		Case 1
			PlaySoundAtLevelStatic ("Relay_Flash_On"), 0.025*RelayFlashSoundLevel, obj			
		Case 0
			PlaySoundAtLevelStatic ("Relay_Flash_Off"), 0.025*RelayFlashSoundLevel, obj		
	End Select
End Sub

'/////////////////////////////////////////////////////////////////
'					End Mechanical Sounds
'/////////////////////////////////////////////////////////////////

'******************************************************
'****  FLEEP MECHANICAL SOUNDS
'******************************************************


Sub ApplyLampRGB(nr, RGBval)
	If nr > 0 And nr < 11 Then
'		If anCurLightColor(nr) = RGBval Then
'			Exit Sub
'		Else
'			anCurLightColor(nr) = RGBval
'		End If
	End If
	If IsArray(Lampz.Obj(nr)) or IsObject(Lampz.Obj(nr)) Then ' double check so it wont fail
		dim tmp
		dim pon : set pon = Lampz.OnPrim(nr)
		If IsObject(Lampz.Obj(nr)) then
			set tmp = Lampz.Obj(nr)
			tmp.ColorFull = RGBval
		Else
			tmp = Lampz.Obj(nr)
			tmp(1).ColorFull = RGBval
		End If
		UpdateMaterial "InsertRGB" & nr - 1,0,0,1,0,0,0,0.9999,RGBval,0,0,False,True,0,0,0,0
'		pon.BlendDisableLighting = 300  'TODO: Make this a function of color
	Else
		Debug.print "not an array in ApplyLampRGB " & nr
		' FIX can remove this check aswell when
	End If
End Sub

Sub UpdateLEDs(ByVal nNumber)
	Dim i
	Dim nFirstDigit, nSecondDigit
	Dim bSegment1, bSegment2

	D1Period.state = LightStateOn
	If nNumber < 0 or bCountingBonus Then
		For each i in aoDigit1Lights : i.state = LightStateOff : Next
		For each i in aoDigit2Lights : i.state = LightStateOff : Next
		D1Period.state = LightStateOff
		if bEnablePuP Then
			pDMDLabelSet "MultiplierLabel1", ""
			pDMDLabelSet "MultiplierLabel2", ""
			pDMDLabelSet "MultiplierValue", ""
		End If
	Else
		nNumber = Round(10 * nNumber)
		nFirstDigit = nNumber \ 10
		nSecondDigit = nNumber Mod 10

		For i = 0 to 6
			bSegment1 = aPowersOfTwo(i) And anDigitSegments(nFirstDigit)
			bSegment2 = aPowersOfTwo(i) And anDigitSegments(nSecondDigit)
			If bSegment1 = 0 Then
				aoDigit1Lights(i).state = LightStateOff
			Else
				aoDigit1Lights(i).state = LightStateOn
			End If
			If bSegment2 = 0 Then
				aoDigit2Lights(i).state = LightStateOff
			Else
				aoDigit2Lights(i).state = LightStateOn
			End If
		Next
	End If
End Sub

'******************************************************
'****  LAMPZ by nFozzy
'******************************************************
' 
' Lampz is a utility designed to manage and fade the lights and light-related objects on a table that is being driven by a ROM.
' To set up Lampz, one must populate the Lampz.MassAssign array with VPX Light objects, where the index of the MassAssign array
' corrisponds to the ROM index of the associated light. More that one Light object can be associated with a single MassAssign index (not shown in this example)
' Optionally, callbacks can be assigned for each index using the Lampz.Callback array. This is very useful for allowing 3D Insert primitives
' to be controlled by the ROM. Note, the aLvl parameter (i.e. the fading level that ranges between 0 and 1) is appended to the callback call.

Dim NullFader : set NullFader = new NullFadingObject
Dim NullPrim : set NullPrim = new NullPrimObject
Dim Lampz : Set Lampz = New LampFader
InitLampsNF              	' Setup lamp assignments
LampTimer.Interval = -1
LampTimer.Enabled = 1

Dim nTimeReadControlLights
nTimeReadControlLights = 0
Sub LampTimer_Timer()
   'apophis - Use the InPlayState of the 1st light in the Lampz.obj array to set the Lampz.state
	dim idx
	If GameTime - nTimeReadControlLights > 16 then
		nTimeReadControlLights = GameTime
		for idx = 0 to 51 'uBound(Lampz.Obj) - 7
			if Lampz.IsLight(idx) then 
				if IsArray(Lampz.obj(idx)) then
					dim tmp : tmp = Lampz.obj(idx)
					Lampz.state(idx) = tmp(0).GetInPlayStateBool
				Else
					Lampz.state(idx) = Lampz.obj(idx).GetInPlayStateBool
				end if
			end if
		Next
	end if
	Lampz.Update2
End Sub

Sub DisableLighting(pri, DLintensity, ByVal aLvl)	'cp's script  DLintensity = disabled lighting intesity
	if Lampz.UseFunction then aLvl = Lampz.FilterOut(aLvl)	'Callbacks don't get this filter automatically
	pri.blenddisablelighting = aLvl * DLintensity
End Sub

Sub SetModLamp(id, val)
	Lampz.state(id) = val
End Sub


Sub InitLampsNF()
	Dim i
	Dim nModeIntensity ' Intensity of mode lights
	
	If Table1.version >= 10800 Then
		nModeIntensity = 25
		For Each i in Array(l43, l44, l45, l46, l47, l48, l49, l50, l51)
			i.intensity = 5
		Next
	Else
		nModeIntensity = 200
	End If

	'Filtering (comment out to disable)
	Lampz.Filter = "LampFilter"	'Puts all lamp intensityscale output (no callbacks) through this function before updating

	'Adjust fading speeds (max level / full MS fading time). The Modulate property must be set to 1 / max level if lamp is modulated.
	dim x : for x = 0 to 150 : Lampz.FadeSpeedUp(x) = 1/40 : Lampz.FadeSpeedDown(x) = 1/120 : Lampz.Modulate(x) = 1 : next
	

	'Lampz Assignments
	'  In a ROM based table, the lamp ID is used to set the state of the Lampz objects

	'MassAssign is an optional way to do assignments. It'll create arrays automatically / append objects to existing arrays
	Lampz.MassAssign(2) = cLightLeftLane
	Lampz.MassAssign(2) = l2
	Lampz.Callback(2) = "DisableLighting p2, 200,"
	Lampz.SetOnPrim(2) = p2
	Lampz.OnPrim(2).blenddisablelighting = 200
	
	Lampz.MassAssign(3) = cLightLowerScoop
	Lampz.MassAssign(3) = l3
	Lampz.Callback(3) = "DisableLighting p3, 200,"
	Lampz.SetOnPrim(3) = p3
	Lampz.OnPrim(3).blenddisablelighting = 200
	
	Lampz.MassAssign(4) = cLightLeftLoop
	Lampz.MassAssign(4) = l4
	Lampz.Callback(4) = "DisableLighting p4, 200,"
	Lampz.SetOnPrim(4) = p4
	Lampz.OnPrim(4).blenddisablelighting = 200
	
	Lampz.MassAssign(5) = cLightSideLoop
	Lampz.MassAssign(5) = l5
	Lampz.Callback(5) = "DisableLighting p5, 200,"
	Lampz.SetOnPrim(5) = p5
	Lampz.OnPrim(5).blenddisablelighting = 200
	
	Lampz.MassAssign(6) = cLightUpperScoop
	Lampz.MassAssign(6) = l6
	Lampz.Callback(6) = "DisableLighting p6, 200,"
	Lampz.SetOnPrim(6) = p6
	Lampz.OnPrim(6).blenddisablelighting = 200
	
	Lampz.MassAssign(7) = cLightLeftRamp
	Lampz.MassAssign(7) = l7
	Lampz.Callback(7) = "DisableLighting p7, 200,"
	Lampz.SetOnPrim(7) = p7
	Lampz.OnPrim(7).blenddisablelighting = 200
	
	Lampz.MassAssign(8) = cLightCenterLane
	Lampz.MassAssign(8) = l8
	Lampz.Callback(8) = "DisableLighting p8, 200,"
	Lampz.SetOnPrim(8) = p8
	Lampz.OnPrim(8).blenddisablelighting = 200
	
	Lampz.MassAssign(9) = cLightRightRamp
	Lampz.MassAssign(9) = l9
	Lampz.Callback(9) = "DisableLighting p9, 200,"
	Lampz.SetOnPrim(9) = p9
	Lampz.OnPrim(9).blenddisablelighting = 200
	
	Lampz.MassAssign(10) = cLightInlineDrops
	Lampz.MassAssign(10) = l10
	Lampz.Callback(10) = "DisableLighting p10, 200,"
	Lampz.SetOnPrim(10) = p10
	Lampz.OnPrim(10).blenddisablelighting = 200
	
	Lampz.MassAssign(11) = cLightRightLoop
	Lampz.MassAssign(11) = l11
	Lampz.Callback(11) = "DisableLighting p11, 200,"
	Lampz.SetOnPrim(11) = p11
	Lampz.OnPrim(11).blenddisablelighting = 200
	
	Lampz.MassAssign(12) = cLightDrop1
	Lampz.MassAssign(12) = l12
	Lampz.Callback(12) = "DisableLighting p12, 200,"
	Lampz.SetOnPrim(12) = p12
	Lampz.OnPrim(12).blenddisablelighting = 200
	
	Lampz.MassAssign(13) = cLightDrop2
	Lampz.MassAssign(13) = l13
	Lampz.Callback(13) = "DisableLighting p13, 200,"
	Lampz.SetOnPrim(13) = p13
	Lampz.OnPrim(13).blenddisablelighting = 200
	
	Lampz.MassAssign(14) = cLightDrop3
	Lampz.MassAssign(14) = l14
	Lampz.Callback(14) = "DisableLighting p14, 100,"
	Lampz.SetOnPrim(14) = p14
	Lampz.OnPrim(14).blenddisablelighting = 100
	
	Lampz.MassAssign(15) = cLightDrop4
	Lampz.MassAssign(15) = l15
	Lampz.Callback(15) = "DisableLighting p15, 200,"
	Lampz.SetOnPrim(15) = p15
	Lampz.OnPrim(15).blenddisablelighting = 200
	
	Lampz.MassAssign(16) = cLightDrop5
	Lampz.MassAssign(16) = l16
	Lampz.Callback(16) = "DisableLighting p16, 200,"
	Lampz.SetOnPrim(16) = p16
	Lampz.OnPrim(16).blenddisablelighting = 200
	
	Lampz.MassAssign(17) = cLightAddTime
	Lampz.MassAssign(17) = l17
	Lampz.Callback(17) = "DisableLighting p17, 250,"
	Lampz.SetOnPrim(17) = p17
	Lampz.OnPrim(17).blenddisablelighting = 250
	
	Lampz.MassAssign(18) = cLightLiteMystery
	Lampz.MassAssign(18) = l18
	Lampz.Callback(18) = "DisableLighting p18, 200,"
	Lampz.SetOnPrim(18) = p18
	Lampz.OnPrim(18).blenddisablelighting = 200
	
	Lampz.MassAssign(19) = cLightShootAgain
	Lampz.MassAssign(19) = l19
	Lampz.Callback(19) = "DisableLighting p19, 130,"
	Lampz.SetOnPrim(19) = p19
	Lampz.OnPrim(19).blenddisablelighting = 130
	
	Lampz.MassAssign(20) = cLightComboLLane
	Lampz.MassAssign(20) = l20
	Lampz.Callback(20) = "DisableLighting p20, 200,"
	Lampz.SetOnPrim(20) = p20
	Lampz.OnPrim(20).blenddisablelighting = 200
	
	Lampz.MassAssign(21) = cLightComboLowScoop
	Lampz.MassAssign(21) = l21
	Lampz.Callback(21) = "DisableLighting p21, 200,"
	Lampz.SetOnPrim(21) = p21
	Lampz.OnPrim(21).blenddisablelighting = 200
	
	Lampz.MassAssign(22) = cLightComboLLoop
	Lampz.MassAssign(22) = l22
	Lampz.Callback(22) = "DisableLighting p22, 200,"
	Lampz.SetOnPrim(22) = p22
	Lampz.OnPrim(22).blenddisablelighting = 200
	
	Lampz.MassAssign(23) = cLightComboSideLoop
	Lampz.MassAssign(23) = l23
	Lampz.Callback(23) = "DisableLighting p23, 200,"
	Lampz.SetOnPrim(23) = p23
	Lampz.OnPrim(23).blenddisablelighting = 200
	
	Lampz.MassAssign(24) = cLightComboTopScoop
	Lampz.MassAssign(24) = l24
	Lampz.Callback(24) = "DisableLighting p24, 200,"
	Lampz.SetOnPrim(24) = p24
	Lampz.OnPrim(24).blenddisablelighting = 200
	
	Lampz.MassAssign(25) = cLightComboLRamp
	Lampz.MassAssign(25) = l25
	Lampz.Callback(25) = "DisableLighting p25, 200,"
	Lampz.SetOnPrim(25) = p25
	Lampz.OnPrim(25).blenddisablelighting = 200
	
	Lampz.MassAssign(26) = cLightComboCLane
	Lampz.MassAssign(26) = l26
	Lampz.Callback(26) = "DisableLighting p26, 200,"
	Lampz.SetOnPrim(26) = p26
	Lampz.OnPrim(26).blenddisablelighting = 200
	
	Lampz.MassAssign(27) = cLightComboRRamp
	Lampz.MassAssign(27) = l27
	Lampz.Callback(27) = "DisableLighting p27, 200,"
	Lampz.SetOnPrim(27) = p27
	Lampz.OnPrim(27).blenddisablelighting = 200
	
	Lampz.MassAssign(28) = cLightComboInlines
	Lampz.MassAssign(28) = l28
	Lampz.Callback(28) = "DisableLighting p28, 200,"
	Lampz.SetOnPrim(28) = p28
	Lampz.OnPrim(28).blenddisablelighting = 200
	
	Lampz.MassAssign(29) = cLightComboRLoop
	Lampz.MassAssign(29) = l29
	Lampz.Callback(29) = "DisableLighting p29, 200,"
	Lampz.SetOnPrim(29) = p29
	Lampz.OnPrim(29).blenddisablelighting = 200
	
	Lampz.MassAssign(30) = cLightSuicideBooth
	Lampz.MassAssign(30) = l30
	Lampz.Callback(30) = "DisableLighting p30, 200,"
	Lampz.SetOnPrim(30) = p30
	Lampz.OnPrim(30).blenddisablelighting = 200
	
	Lampz.MassAssign(31) = cLightMball1Lock1
	Lampz.MassAssign(31) = l31
	Lampz.Callback(31) = "DisableLighting p31, 200,"
	Lampz.SetOnPrim(31) = p31
	Lampz.OnPrim(31).blenddisablelighting = 200
	
	Lampz.MassAssign(32) = cLightMball1Lock2
	Lampz.MassAssign(32) = l32
	Lampz.Callback(32) = "DisableLighting p32, 200,"
	Lampz.SetOnPrim(32) = p32
	Lampz.OnPrim(32).blenddisablelighting = 200
	
	Lampz.MassAssign(33) = cLightMball1Lock3
	Lampz.MassAssign(33) = l33
	Lampz.Callback(33) = "DisableLighting p33, 200,"
	Lampz.SetOnPrim(33) = p33
	Lampz.OnPrim(33).blenddisablelighting = 200
	
	Lampz.MassAssign(34) = cLightMball2Lock1
	Lampz.MassAssign(34) = l34
	Lampz.Callback(34) = "DisableLighting p34, 200,"
	Lampz.SetOnPrim(34) = p34
	Lampz.OnPrim(34).blenddisablelighting = 200
	
	Lampz.MassAssign(35) = cLightMball2Lock2
	Lampz.MassAssign(35) = l35
	Lampz.Callback(35) = "DisableLighting p35, 200,"
	Lampz.SetOnPrim(35) = p35
	Lampz.OnPrim(35).blenddisablelighting = 200
	
	Lampz.MassAssign(36) = cLightMball2Lock3
	Lampz.MassAssign(36) = l36
	Lampz.Callback(36) = "DisableLighting p36, 200,"
	Lampz.SetOnPrim(36) = p36
	Lampz.OnPrim(36).blenddisablelighting = 200
	
	Lampz.MassAssign(37) = cLightMball2LiteL
	Lampz.MassAssign(37) = l37
	Lampz.Callback(37) = "DisableLighting p37, 50,"
	Lampz.SetOnPrim(37) = p37
	Lampz.OnPrim(37).blenddisablelighting = 50
	
	Lampz.MassAssign(38) = cLightMball2LiteR
	Lampz.MassAssign(38) = l38
	Lampz.Callback(38) = "DisableLighting p38, 50,"
	Lampz.SetOnPrim(38) = p38
	Lampz.OnPrim(38).blenddisablelighting = 50
	
	Lampz.MassAssign(39) = cLightLeftOutlane
	Lampz.MassAssign(39) = l39
	Lampz.Callback(39) = "DisableLighting p39, 200,"
	Lampz.SetOnPrim(39) = p39
	Lampz.OnPrim(39).blenddisablelighting = 200
	
	Lampz.MassAssign(40) = cLightLeftInlane
	Lampz.MassAssign(40) = l40
	Lampz.Callback(40) = "DisableLighting p40, 200,"
	Lampz.SetOnPrim(40) = p40
	Lampz.OnPrim(40).blenddisablelighting = 200
	
	Lampz.MassAssign(41) = cLightRightInlane
	Lampz.MassAssign(41) = l41
	Lampz.Callback(41) = "DisableLighting p41, 200,"
	Lampz.SetOnPrim(41) = p41
	Lampz.OnPrim(41).blenddisablelighting = 200
	
	Lampz.MassAssign(42) = cLightRightOutlane
	Lampz.MassAssign(42) = l42
	Lampz.Callback(42) = "DisableLighting p42, 200,"
	Lampz.SetOnPrim(42) = p42
	Lampz.OnPrim(42).blenddisablelighting = 200
	
	Lampz.MassAssign(43) = cLightModeMoon
	Lampz.MassAssign(43) = l43
	Lampz.Callback(43) = "DisableLighting p43, " & nModeIntensity & ","
	Lampz.SetOnPrim(43) = p43
	Lampz.OnPrim(43).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(44) = cLightModeOsiris
	Lampz.MassAssign(44) = l44
	Lampz.Callback(44) = "DisableLighting p44, " & nModeIntensity & ","
	Lampz.SetOnPrim(44) = p44
	Lampz.OnPrim(44).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(45) = cLightModeMars
	Lampz.MassAssign(45) = l45
	Lampz.Callback(45) = "DisableLighting p45, " & nModeIntensity & ","
	Lampz.SetOnPrim(45) = p45
	Lampz.OnPrim(45).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(46) = cLightModeEarth
	Lampz.MassAssign(46) = l46
	Lampz.Callback(46) = "DisableLighting p46, " & nModeIntensity & ","
	Lampz.SetOnPrim(46) = p46
	Lampz.OnPrim(46).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(47) = cLightModeDecapod
	Lampz.MassAssign(47) = l47
	Lampz.Callback(47) = "DisableLighting p47, " & nModeIntensity & ","
	Lampz.SetOnPrim(47) = p47
	Lampz.OnPrim(47).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(48) = cLightModeAmazonia
	Lampz.MassAssign(48) = l48
	Lampz.Callback(48) = "DisableLighting p48, " & nModeIntensity & ","
	Lampz.SetOnPrim(48) = p48
	Lampz.OnPrim(48).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(49) = cLightModeChapek
	Lampz.MassAssign(49) = l49
	Lampz.Callback(49) = "DisableLighting p49, " & nModeIntensity & ","
	Lampz.SetOnPrim(49) = p49
	Lampz.OnPrim(49).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(50) = cLightModeOmicron
	Lampz.MassAssign(50) = l50
	Lampz.Callback(50) = "DisableLighting p50, " & nModeIntensity & ","
	Lampz.SetOnPrim(50) = p50
	Lampz.OnPrim(50).blenddisablelighting = nModeIntensity
	
	Lampz.MassAssign(51) = cLightModeDaily
	Lampz.MassAssign(51) = l51
	Lampz.Callback(51) = "DisableLighting p51, " & nModeIntensity & ","
	Lampz.SetOnPrim(51) = p51
	Lampz.OnPrim(51).blenddisablelighting = nModeIntensity

	Lampz.MassAssign(52) = f52
	Lampz.MassAssign(53) = f53
	Lampz.MassAssign(54) = f54
	Lampz.MassAssign(55) = f55
	Lampz.MassAssign(56) = LightBlast
	
	'Turn off all lamps on startup
	Lampz.Init	'This just turns state of any lamps to 1

	'Immediate update to turn on GI, turn off lamps
	Lampz.Update

End Sub


'====================
'Class jungle nf
'====================

Class NullFadingObject : Public Property Let IntensityScale(input) : : End Property : End Class
Class NullPrimObject 
	Public Property Let BlendDisableLighting(input) : : End Property
	Public Property Let Opacity(input) : : End Property
	Public Property Let ColorFull(input) : : End Property
	Public Property Let Color(input) : : End Property
End Class

'version 0.11 - Mass Assign, Changed modulate style
'version 0.12 - Update2 (single -1 timer update) update method for core.vbs
'Version 0.12a - Filter can now be accessed via 'FilterOut'
'Version 0.12b - Changed MassAssign from a sub to an indexed property (new syntax: lampfader.MassAssign(15) = Light1 )
'Version 0.13 - No longer requires setlocale. Callback() can be assigned multiple times per index
' Note: if using multiple 'LampFader' objects, set the 'name' variable to avoid conflicts with callbacks
'Version 0.14 - Updated to support modulated signals - Niwak
'Version 0.15 - added IsLight property and OnPrim objects to the class - apophis

Class LampFader
	Public IsLight(150)				'apophis
	Public OnPrim(150)				'apophis
	Public FadeSpeedDown(150), FadeSpeedUp(150)
	Private Lock(150), Loaded(150), OnOff(150)
	Public UseFunction
	Private cFilter
	Public UseCallback(150), cCallback(150)
	Public Lvl(150), Obj(150)
	Private Mult(150)
	Public FrameTime
	Private InitFrame
	Public Name

	Sub Class_Initialize()
		InitFrame = 0
		dim x : for x = 0 to uBound(OnOff) 	'Set up fade speeds
			FadeSpeedDown(x) = 1/100	'fade speed down
			FadeSpeedUp(x) = 1/80		'Fade speed up
			UseFunction = False
			lvl(x) = 0
			OnOff(x) = 0
			Lock(x) = True : Loaded(x) = False
			Mult(x) = 1
			IsLight(x) = False   		'apophis
		Next
		Name = "LampFaderNF" 'NEEDS TO BE CHANGED IF THERE'S MULTIPLE OF THESE OBJECTS, OTHERWISE CALLBACKS WILL INTERFERE WITH EACH OTHER!!
		for x = 0 to uBound(OnOff) 		'clear out empty obj
			if IsEmpty(obj(x)) then Set Obj(x) = NullFader' : Loaded(x) = True
			if IsEmpty(OnPrim(x)) then Set OnPrim(x) = NullPrim' : Loaded(x) = True				'apophis
		Next
	End Sub

	Public Property Let SetOnPrim(aIdx, aInput) 	    'apophis
		If TypeName(aInput) = "Primitive" Then : set OnPrim(aIdx) = aInput : End If
	End Property

	Public Property Get Locked(idx) : Locked = Lock(idx) : End Property		''debug.print Lampz.Locked(100)	'debug
	Public Property Get state(idx) : state = OnOff(idx) : end Property
	Public Property Let Filter(String) : Set cFilter = GetRef(String) : UseFunction = True : End Property
	Public Function FilterOut(aInput) : if UseFunction Then FilterOut = cFilter(aInput) Else FilterOut = aInput End If : End Function
	'Public Property Let Callback(idx, String) : cCallback(idx) = String : UseCallBack(idx) = True : End Property
	Public Property Let Callback(idx, String)
		UseCallBack(idx) = True
		'cCallback(idx) = String 'old execute method
		'New method: build wrapper subs using ExecuteGlobal, then call them
		cCallback(idx) = cCallback(idx) & "___" & String	'multiple strings dilineated by 3x _

		dim tmp : tmp = Split(cCallback(idx), "___")

		dim str, x : for x = 0 to uBound(tmp)	'build proc contents
			'If Not tmp(x)="" then str = str & "	" & tmp(x) & " aLVL" & "	'" & x & vbnewline	'more verbose
			If Not tmp(x)="" then str = str & tmp(x) & " aLVL:"
		Next
		'msgbox "Sub " & name & idx & "(aLvl):" & str & "End Sub"
		dim out : out = "Sub " & name & idx & "(aLvl):" & str & "End Sub"
		ExecuteGlobal Out

	End Property

	Public Property Let state(ByVal idx, input) 'Major update path
		if TypeName(input) <> "Double" and typename(input) <> "Integer"  and typename(input) <> "Long" then
			If input Then
				input = 1
			Else
				input = 0
			End If
		End If
		if Input <> OnOff(idx) then  'discard redundant updates
			OnOff(idx) = input
			Lock(idx) = False
			Loaded(idx) = False
		End If
	End Property

	'Mass assign, Builds arrays where necessary
	'Sub MassAssign(aIdx, aInput)
	Public Property Let MassAssign(aIdx, aInput)
		If typename(obj(aIdx)) = "NullFadingObject" Then 'if empty, use Set
			if IsArray(aInput) then
				obj(aIdx) = aInput
			Else
				Set obj(aIdx) = aInput
				if typename(aInput) = "Light" then IsLight(aIdx) = True   'apophis - If first object in array is a light, this will be set true
			end if
		Else
			Obj(aIdx) = AppendArray(obj(aIdx), aInput)
		end if
	end Property

	Sub SetLamp(aIdx, aOn) : state(aIdx) = aOn : End Sub	'Solenoid Handler

	Public Sub TurnOnStates()	'If obj contains any light objects, set their states to 1 (Fading is our job!)
		dim debugstr
		dim idx : for idx = 0 to uBound(obj)
			if IsArray(obj(idx)) then
				'debugstr = debugstr & "array found at " & idx & "..."
				dim x, tmp : tmp = obj(idx) 'set tmp to array in order to access it
				for x = 0 to uBound(tmp)
					if typename(tmp(x)) = "Light" then DisableState tmp(x)' : debugstr = debugstr & tmp(x).name & " state'd" & vbnewline
					tmp(x).intensityscale = 0.001 ' this can prevent init stuttering
				Next
			Else
				if typename(obj(idx)) = "Light" then DisableState obj(idx)' : debugstr = debugstr & obj(idx).name & " state'd (not array)" & vbnewline
				obj(idx).intensityscale = 0.001 ' this can prevent init stuttering
			end if
		Next
		''debug.print debugstr
	End Sub
	Private Sub DisableState(ByRef aObj) : aObj.FadeSpeedUp = 1000 : aObj.State = 1 : End Sub	'turn state to 1

	Public Sub Init()	'Just runs TurnOnStates right now
		TurnOnStates
	End Sub

	Public Property Let Modulate(aIdx, aCoef) : Mult(aIdx) = aCoef : Lock(aIdx) = False : Loaded(aIdx) = False: End Property
	Public Property Get Modulate(aIdx) : Modulate = Mult(aIdx) : End Property

	Public Sub Update1()	 'Handle all boolean numeric fading. If done fading, Lock(x) = True. Update on a '1' interval Timer!
		dim x : for x = 0 to uBound(OnOff)
			if not Lock(x) then 'and not Loaded(x) then
				if OnOff(x) > 0 then 'Fade Up
					Lvl(x) = Lvl(x) + FadeSpeedUp(x)
					if Lvl(x) >= OnOff(x) then Lvl(x) = OnOff(x) : Lock(x) = True
				else 'fade down
					Lvl(x) = Lvl(x) - FadeSpeedDown(x)
					if Lvl(x) <= 0 then Lvl(x) = 0 : Lock(x) = True
				end if
			end if
		Next
	End Sub

	Public Sub Update2()	 'Both updates on -1 timer (Lowest latency, but less accurate fading at 60fps vsync)
		FrameTime = gametime - InitFrame : InitFrame = GameTime	'Calculate frametime
		dim x : for x = 0 to uBound(OnOff)
			if not Lock(x) then 'and not Loaded(x) then
				if OnOff(x) > 0 then 'Fade Up
					Lvl(x) = Lvl(x) + FadeSpeedUp(x) * FrameTime
					if Lvl(x) >= OnOff(x) then Lvl(x) = OnOff(x) : Lock(x) = True
				else 'fade down
					Lvl(x) = Lvl(x) - FadeSpeedDown(x) * FrameTime
					if Lvl(x) <= 0 then Lvl(x) = 0 : Lock(x) = True
				end if
			end if
		Next
		Update
	End Sub

	Public Sub Update()	'Handle object updates. Update on a -1 Timer! If done fading, loaded(x) = True
		dim x,xx, aLvl : for x = 0 to uBound(OnOff)
			if not Loaded(x) then
				aLvl = Lvl(x)*Mult(x)
				if IsArray(obj(x) ) Then	'if array
					If UseFunction then
						for each xx in obj(x) : xx.IntensityScale = cFilter(aLvl) : Next
					Else
						for each xx in obj(x) : xx.IntensityScale = aLvl : Next
					End If
				else						'if single lamp or flasher
					If UseFunction then
						obj(x).Intensityscale = cFilter(aLvl)
					Else
						obj(x).Intensityscale = aLvl
					End If
				end if
				'if TypeName(lvl(x)) <> "Double" and typename(lvl(x)) <> "Integer" and typename(lvl(x)) <> "Long" then msgbox "uhh " & 2 & " = " & lvl(x)
				'If UseCallBack(x) then execute cCallback(x) & " " & (Lvl(x))	'Callback
				If UseCallBack(x) then Proc name & x,aLvl	'Proc
				If Lock(x) Then
					if Lvl(x) = OnOff(x) or Lvl(x) = 0 then Loaded(x) = True	'finished fading
				end if
			end if
		Next
	End Sub
End Class


'Lamp Filter
Function LampFilter(aLvl)
	LampFilter = aLvl^1.6	'exponential curve?
End Function


'Helper functions
Sub Proc(string, Callback)	'proc using a string and one argument
	'On Error Resume Next
	dim p : Set P = GetRef(String)
	P Callback
	If err.number = 13 then  msgbox "Proc error! No such procedure: " & vbnewline & string
	if err.number = 424 then msgbox "Proc error! No such Object"
End Sub

Function AppendArray(ByVal aArray, aInput)	'append one value, object, or Array onto the end of a 1 dimensional array
	if IsArray(aInput) then 'Input is an array...
		dim tmp : tmp = aArray
		If not IsArray(aArray) Then	'if not array, create an array
			tmp = aInput
		Else						'Append existing array with aInput array
			Redim Preserve tmp(uBound(aArray) + uBound(aInput)+1)	'If existing array, increase bounds by uBound of incoming array
			dim x : for x = 0 to uBound(aInput)
				if isObject(aInput(x)) then
					Set tmp(x+uBound(aArray)+1 ) = aInput(x)
				Else
					tmp(x+uBound(aArray)+1 ) = aInput(x)
				End If
			Next
			AppendArray = tmp	 'return new array
		End If
	Else 'Input is NOT an array...
		If not IsArray(aArray) Then	'if not array, create an array
			aArray = Array(aArray, aInput)
		Else
			Redim Preserve aArray(uBound(aArray)+1)	'If array, increase bounds by 1
			if isObject(aInput) then
				Set aArray(uBound(aArray)) = aInput
			Else
				aArray(uBound(aArray)) = aInput
			End If
		End If
		AppendArray = aArray 'return new array
	End If
End Function

'******************************************************
'****  END LAMPZ
'******************************************************





'******************************************************
'*****   3D INSERTS
'******************************************************
'
'
' Before you get started adding the inserts to your playfield in VPX, there are a few things you need to have done to prepare:
' 	1. Cut out all the inserts on the playfield image so there is alpha transparency where they should be.
'      Make sure the playfield material has Opacity Active checkbox checked.
'	2. All the  insert text and/or images that lie over the insert plastic needs to be in its own file with 
'	   alpha transparency. Many playfields may require finding the original font and remaking the insert text.
' 
' To add the inserts:
'	1. Import all the textures (images) and materials from this file that start with the word "Insert" into your Table
'   2. Copy and past the two primitves that make up the insert you want to use. One primitive is for the on state, the other for the off state.
'   3. Align the primitives with the associated insert light. Name the on and off primitives correctly.
'   4. Update the Lampz object array. Follow the example in this file.
'   5. You will need to manually tweak the disable lighting value and material parameters to achielve the effect you want.
'
'
' Quick Reference:  Laying the Inserts ( Tutorial From Iaakki)
' - Each insert consists of two primitives. On and Off primitive. Suggested naming convention is to use lamp number in the name. For example 
'   is lamp number is 57, the On primitive is "p57" and the Off primitive is "p57off". This makes it easier to work on script side.
' - When starting from a new table, I'd first select to make few inserts that look quite similar. Lets say there is total of 6 small triangle 
'   inserts, 4 yellow and 2 blue ones.
' - Import the insert on/off images from the image manager and the vpx materials used from the sample project first, and those should appear 
'   selected properly in the primitive settings when you paste your actual insert trays in your target table . Then open up your target project 
'   at same time as the sample project and use copy&paste to copy desired inserts to target project. 
' - There are quite many parameters in primitive that affect a lot how they will look. I wouldn't mess too much with them. Use Size options to 
'   scale the insert properly into PF hole. Some insert primitives may have incorrect pivot point, which means that changing the depth, you may 
'   also need to alter the Z-position too.
' - Once you have the first insert in place, wire it up in the script (detailed in part 3 below). Then set the light bulb's intensity to zero, 
'   so it won't harass the adjustment.
' - Start up the game with F6 and visually see if the On-primitive blinks properly. If it is too dim, hit D and open editor. Write: 
' - p57.BlendDisableLighting = 300 and hit enter
' - -> The insert should appear differently. Find good looking brightness level. Not too bright as the light bulb is still missing. Just generic good light.
'     - If you cannot find proper light color or "mood", you can also fiddle with primitive material values. Provided material should be 
'       quite ok for most of the cases.
'     - Now when you have found proper DL value (165), but that into script:
'     - Lampz.Callback(57) = " DisableLighting p57, 165,"
' - That one insert is now adjusted and you should be able to copy&paste rest of the triangle inserts in place and name them correctly. And add them 
'   into script. And fine tune their brightness and color.
'
' Light bulbs and ball reflection:
' 
' - This kind of lighted primitives are not giving you ball reflections. Also some more glow vould be needed to make the insert to bloom correctly.
' - Take the original lamp (l57), set the bulb mode enabled, set Halo Height to -3 (something that is inside the 2 insert primitives). I'd start with 
'   falloff 100, falloff Power 2-2.5, Intensity 10, scale mesh 10, Transmit 5.
' - Start the game with F6, throw a ball on it and move the ball near the blinking insert. Visually see how the reflection looks.
' - Hit D once the reflection is the highest. Open light editor and start fine tuning the bulb values to achieve realistic look for the reflection.
' - Falloff Power value is the one that will affect reflection creatly. The higher the power value is, the brighter the reflection on the ball is. 
'   This is the reason why falloff is rather large and falloff power is quite low. Change scale mesh if reflection is too small or large.
' - Transmit value can bring nice bloom for the insert, but it may also affect to other primitives nearby. Sometimes one need to set transmit to 
'   zero to avoid affecting surrounding plastics. If you really need to have higher transmit value, you may set Disable Lighting From Below to 1 
'   in surrounding primitive. This may remove the problem, but can make the primitive look worse too.



'******************************************************
'*****   END 3D INSERTS
'******************************************************





'******************************************************
'*****   FLUPPER DOMES 
'******************************************************
' Based on FlupperDoms2.2

' What you need in your table to use these flashers:
' Open this table and your table both in VPX
' Export all the materials domebasemat, Flashermaterial0 - 20 and import them in your table
' Export all textures (images) starting with the name "dome" and "ronddome" and import them into your table with the same names
' Export all textures (images) starting with the name "flasherbloom" and import them into your table with the same names
' Copy a set of 4 objects flasherbase, flasherlit, flasherlight and flasherflash from layer 7 to your table
' If you duplicate the four objects for a new flasher dome, be sure that they all end with the same number (in the 0-20 range)
' Copy the flasherbloom flashers from layer 10 to your table. you will need to make one per flasher dome that you plan to make
' Select the correct flasherbloom texture for each flasherbloom flasher, per flasher dome
' Copy the script below 

' Place your flasher base primitive where you want the flasher located on your Table
' Then run InitFlasher in the script with the number of your flasher objects and the color of the flasher.  This will align the flasher object, light object, and 
' flasher lit primitive.  It will also assign the appropriate flasher bloom images to the flasher bloom object.
'
' Example: InitFlasher 1, "green"
'
' Color Options: "blue", "green", "red", "purple", "yellow", "white", and "orange"

' You can use the RotateFlasher call to align the Rotz/ObjRotz of the flasher primitives with "handles".  Don't set those values in the editor,
' call the RotateFlasher sub instead (this call will likely crash VP if it's call for the flasher primitives without "handles")
'
' Example: RotateFlasher 1, 180 		'where 1 is the flasher number and 180 is the angle of Z rotation

' For flashing the flasher use in the script: "ObjLevel(1) = 1 : FlasherFlash1_Timer"
' This should also work for flashers with variable flash levels from the rom, just use ObjLevel(1) = xx from the rom (in the range 0-1)
'
' Notes (please read!!):
' - Setting TestFlashers = 1 (below in the ScriptsDirectory) will allow you to see how the flasher objects are aligned (need the targetflasher image imported to your table)
' - The rotation of the primitives with "handles" is done with a script command, not on the primitive itself (see RotateFlasher below)
' - Color of the objects are set in the script, not on the primitive itself
' - Screws are optional to copy and position manually
' - If your table is not named "Table1" then change the name below in the script
' - Every flasher uses its own material (Flashermaterialxx), do not use it for anything else
' - Lighting > Bloom Strength affects how the flashers look, do not set it too high
' - Change RotY and RotX of flasherbase only when having a flasher something other then parallel to the playfield
' - Leave RotX of the flasherflash object to -45; this makes sure that the flash effect is visible in FS and DT
' - If you want to resize a flasher, be sure to resize flasherbase, flasherlit and flasherflash with the same percentage
' - If you think that the flasher effects are too bright, change flasherlightintensity and/or flasherflareintensity below

' Some more notes for users of the v1 flashers and/or JP's fading lights routines:
' - Delete all textures/primitives/script/materials in your table from the v1 flashers and scripts before you start; they don't mix well with v2
' - Remove flupperflash(m) routines if you have them; they do not work with this new script
' - Do not try to mix this v2 script with the JP fading light routine (that is making it too complicated), just use the example script below

' example script for rom based tables (non modulated):

' SolCallback(25)="FlashRed"
'
' Sub FlashRed(flstate)
'	If Flstate Then
'		ObjTargetLevel(1) = 1
'	Else
'		ObjTargetLevel(1) = 0
'	End If
'   FlasherFlash1_Timer
' End Sub

' example script for rom based tables (modulated):

' SolModCallback(25)="FlashRed"
'
' Sub FlashRed(level)
'	ObjTargetLevel(1) = level/255 : FlasherFlash1_Timer
' End Sub

Sub FlashOnce(nFlasher)
	Select Case nFlasher
		Case 1
			Flash1 True
			vpmTimer.AddTimer 150,"Flash1 False'"
		Case 2
			Flash2 True
			vpmTimer.AddTimer 150,"Flash2 False'"
		Case 3
			Flash3 True
			vpmTimer.AddTimer 150,"Flash3 False'"
		Case 4
			Flash4 True
			vpmTimer.AddTimer 150,"Flash4 False'"
	End Select
End Sub

 Sub Flash1(Enabled)
	If Enabled Then		
		ObjTargetLevel(1) = 1
		DOF 141,DOFPulse
	Else
		ObjTargetLevel(1) = 0
	End If
	FlasherFlash1_Timer
	Sound_Flash_Relay enabled, Flasherbase1
 End Sub

 Sub Flash2(Enabled)
	If Enabled Then
		ObjTargetLevel(2) = 1
		DOF 142,DOFPulse
	Else
		ObjTargetLevel(2) = 0
	End If
	FlasherFlash2_Timer
	Sound_Flash_Relay enabled, Flasherbase2
 End Sub

 Sub Flash3(Enabled)
	If Enabled Then		
		ObjTargetLevel(3) = 1
		DOF 143,DOFPulse
	Else
		ObjTargetLevel(3) = 0
	End If
	FlasherFlash3_Timer
	Sound_Flash_Relay enabled, Flasherbase3
 End Sub

 Sub Flash4(Enabled)
	If Enabled Then
		ObjTargetLevel(4) = 1
		DOF 144,DOFPulse
	Else
		ObjTargetLevel(4) = 0
	End If
	FlasherFlash4_Timer
	Sound_Flash_Relay enabled, Flasherbase4
 End Sub




Dim TestFlashers, TableRef, FlasherLightIntensity, FlasherFlareIntensity, FlasherBloomIntensity, FlasherOffBrightness

								' *********************************************************************
TestFlashers = 0				' *** set this to 1 to check position of flasher object 			***
Set TableRef = Table1   		' *** change this, if your table has another name       			***
FlasherLightIntensity = 0.1		' *** lower this, if the VPX lights are too bright (i.e. 0.1)		***
FlasherFlareIntensity = 0.3		' *** lower this, if the flares are too bright (i.e. 0.1)			***
FlasherBloomIntensity = 0.2		' *** lower this, if the blooms are too bright (i.e. 0.1)			***	
FlasherOffBrightness = 0.5		' *** brightness of the flasher dome when switched off (range 0-2)	***
								' *********************************************************************

Dim ObjLevel(20), objbase(20), objlit(20), objflasher(20), objbloom(20), objlight(20), ObjTargetLevel(20)
'Dim tablewidth, tableheight : tablewidth = TableRef.width : tableheight = TableRef.height
'initialise the flasher color, you can only choose from "green", "red", "purple", "blue", "white" and "yellow"

InitFlasher 1, "green"
InitFlasher 2, "red"
InitFlasher 3, "blue"
InitFlasher 4, "white"

' rotate the flasher with the command below (first argument = flasher nr, second argument = angle in degrees)
'RotateFlasher 1,17 : RotateFlasher 2,0 : RotateFlasher 3,90 : RotateFlasher 4,90 


Sub InitFlasher(nr, col)
	' store all objects in an array for use in FlashFlasher subroutine
	Set objbase(nr) = Eval("Flasherbase" & nr) : Set objlit(nr) = Eval("Flasherlit" & nr)
	Set objflasher(nr) = Eval("Flasherflash" & nr) : Set objlight(nr) = Eval("Flasherlight" & nr)
	Set objbloom(nr) = Eval("Flasherbloom" & nr)
	' If the flasher is parallel to the playfield, rotate the VPX flasher object for POV and place it at the correct height
	If objbase(nr).RotY = 0 Then
		objbase(nr).ObjRotZ =  atn( (tablewidth/2 - objbase(nr).x) / (objbase(nr).y - tableheight*1.1)) * 180 / 3.14159
		objflasher(nr).RotZ = objbase(nr).ObjRotZ : objflasher(nr).height = objbase(nr).z + 40
	End If
	' set all effects to invisible and move the lit primitive at the same position and rotation as the base primitive
	objlight(nr).IntensityScale = 0 : objlit(nr).visible = 0 : objlit(nr).material = "Flashermaterial" & nr
	objlit(nr).RotX = objbase(nr).RotX : objlit(nr).RotY = objbase(nr).RotY : objlit(nr).RotZ = objbase(nr).RotZ
	objlit(nr).ObjRotX = objbase(nr).ObjRotX : objlit(nr).ObjRotY = objbase(nr).ObjRotY : objlit(nr).ObjRotZ = objbase(nr).ObjRotZ
	objlit(nr).x = objbase(nr).x : objlit(nr).y = objbase(nr).y : objlit(nr).z = objbase(nr).z
	objbase(nr).BlendDisableLighting = FlasherOffBrightness

	'rothbauerw
	'Adjust the position of the flasher object to align with the flasher base.
	'Comment out these lines if you want to manually adjust the flasher object
	If objbase(nr).roty > 135 then
		objflasher(nr).y = objbase(nr).y + 50
		objflasher(nr).height = objbase(nr).z + 20
	Else
		objflasher(nr).y = objbase(nr).y + 20
		objflasher(nr).height = objbase(nr).z + 50
	End If
	objflasher(nr).x = objbase(nr).x

	'rothbauerw
	'Adjust the position of the light object to align with the flasher base.
	'Comment out these lines if you want to manually adjust the flasher object
	objlight(nr).x = objbase(nr).x
	objlight(nr).y = objbase(nr).y
	objlight(nr).bulbhaloheight = objbase(nr).z -10

	'rothbauerw
	'Assign the appropriate bloom image basked on the location of the flasher base
	'Comment out these lines if you want to manually assign the bloom images
	dim xthird, ythird
	xthird = tablewidth/3
	ythird = tableheight/3

	If objbase(nr).x >= xthird and objbase(nr).x <= xthird*2 then
		objbloom(nr).imageA = "flasherbloomCenter"
		objbloom(nr).imageB = "flasherbloomCenter"
	elseif objbase(nr).x < xthird and objbase(nr).y < ythird then
		objbloom(nr).imageA = "flasherbloomUpperLeft"
		objbloom(nr).imageB = "flasherbloomUpperLeft"
	elseif  objbase(nr).x > xthird*2 and objbase(nr).y < ythird then
		objbloom(nr).imageA = "flasherbloomUpperRight"
		objbloom(nr).imageB = "flasherbloomUpperRight"
	elseif objbase(nr).x < xthird and objbase(nr).y < ythird*2 then
		objbloom(nr).imageA = "flasherbloomCenterLeft"
		objbloom(nr).imageB = "flasherbloomCenterLeft"
	elseif  objbase(nr).x > xthird*2 and objbase(nr).y < ythird*2 then
		objbloom(nr).imageA = "flasherbloomCenterRight"
		objbloom(nr).imageB = "flasherbloomCenterRight"
	elseif objbase(nr).x < xthird and objbase(nr).y < ythird*3 then
		objbloom(nr).imageA = "flasherbloomLowerLeft"
		objbloom(nr).imageB = "flasherbloomLowerLeft"
	elseif  objbase(nr).x > xthird*2 and objbase(nr).y < ythird*3 then
		objbloom(nr).imageA = "flasherbloomLowerRight"
		objbloom(nr).imageB = "flasherbloomLowerRight"
	end if

	' set the texture and color of all objects
	select case objbase(nr).image
		Case "dome2basewhite" : objbase(nr).image = "dome2base" & col : objlit(nr).image = "dome2lit" & col : 
		Case "ronddomebasewhite" : objbase(nr).image = "ronddomebase" & col : objlit(nr).image = "ronddomelit" & col
		Case "domeearbasewhite" : objbase(nr).image = "domeearbase" & col : objlit(nr).image = "domeearlit" & col
	end select
	If TestFlashers = 0 Then objflasher(nr).imageA = "domeflashwhite" : objflasher(nr).visible = 0 : End If
	select case col
		Case "blue" :   objlight(nr).color = RGB(4,120,255) : objflasher(nr).color = RGB(200,255,255) : objbloom(nr).color = RGB(4,120,255) : objlight(nr).intensity = 5000
		Case "green" :  objlight(nr).color = RGB(12,255,4) : objflasher(nr).color = RGB(12,255,4) : objbloom(nr).color = RGB(12,255,4)
		Case "red" :    objlight(nr).color = RGB(255,32,4) : objflasher(nr).color = RGB(255,32,4) : objbloom(nr).color = RGB(255,32,4)
		Case "purple" : objlight(nr).color = RGB(230,49,255) : objflasher(nr).color = RGB(255,64,255) : objbloom(nr).color = RGB(230,49,255) 
		Case "yellow" : objlight(nr).color = RGB(200,173,25) : objflasher(nr).color = RGB(255,200,50) : objbloom(nr).color = RGB(200,173,25)
		Case "white" :  objlight(nr).color = RGB(255,240,150) : objflasher(nr).color = RGB(100,86,59) : objbloom(nr).color = RGB(255,240,150)
		Case "orange" :  objlight(nr).color = RGB(255,70,0) : objflasher(nr).color = RGB(255,70,0) : objbloom(nr).color = RGB(255,70,0)
	end select
	objlight(nr).colorfull = objlight(nr).color
	If TableRef.ShowDT and ObjFlasher(nr).RotX = -45 Then 
		objflasher(nr).height = objflasher(nr).height - 20 * ObjFlasher(nr).y / tableheight
		ObjFlasher(nr).y = ObjFlasher(nr).y + 10
	End If
End Sub

Sub RotateFlasher(nr, angle) : angle = ((angle + 360 - objbase(nr).ObjRotZ) mod 180)/30 : objbase(nr).showframe(angle) : objlit(nr).showframe(angle) : End Sub

Sub FlashFlasher(nr)
	If not objflasher(nr).TimerEnabled Then objflasher(nr).TimerEnabled = True : objflasher(nr).visible = 1 : objbloom(nr).visible = 1 : objlit(nr).visible = 1 : End If
	objflasher(nr).opacity = 1000 *  FlasherFlareIntensity * ObjLevel(nr)^2.5
	objbloom(nr).opacity = 100 *  FlasherBloomIntensity * ObjLevel(nr)^2.5
	objlight(nr).IntensityScale = 0.5 * FlasherLightIntensity * ObjLevel(nr)^3
	objbase(nr).BlendDisableLighting =  FlasherOffBrightness + 10 * ObjLevel(nr)^3	
	objlit(nr).BlendDisableLighting = 10 * ObjLevel(nr)^2
	UpdateMaterial "Flashermaterial" & nr,0,0,0,0,0,0,ObjLevel(nr),RGB(255,255,255),0,0,False,True,0,0,0,0 
	if round(ObjTargetLevel(nr),1) > round(ObjLevel(nr),1) Then
		ObjLevel(nr) = ObjLevel(nr) + 0.3
		if ObjLevel(nr) > 1 then ObjLevel(nr) = 1
	Elseif round(ObjTargetLevel(nr),1) < round(ObjLevel(nr),1) Then
		ObjLevel(nr) = ObjLevel(nr) * 0.85 - 0.01
		if ObjLevel(nr) < 0 then ObjLevel(nr) = 0
	Else
		ObjLevel(nr) = round(ObjTargetLevel(nr),1)
		objflasher(nr).TimerEnabled = False
	end if
	'ObjLevel(nr) = ObjLevel(nr) * 0.9 - 0.01
	If ObjLevel(nr) < 0 Then objflasher(nr).TimerEnabled = False : objflasher(nr).visible = 0 : objbloom(nr).visible = 0 : objlit(nr).visible = 0 : End If
End Sub

Sub FlasherFlash1_Timer() : FlashFlasher(1) : End Sub 
Sub FlasherFlash2_Timer() : FlashFlasher(2) : End Sub 
Sub FlasherFlash3_Timer() : FlashFlasher(3) : End Sub 
Sub FlasherFlash4_Timer() : FlashFlasher(4) : End Sub 



'******************************************************
'******  END FLUPPER DOMES
'******************************************************




'******************************************************
'******  FLUPPER BUMPERS
'******************************************************
' Based on FlupperBumpers 0.145 final

' Explanation of how these bumpers work:
' There are 10 elements involved per bumper:
' - the shadow of the bumper ( a vpx flasher object)
' - the bumper skirt (primitive)
' - the bumperbase (primitive)
' - a vpx light which colors everything you can see through the bumpertop
' - the bulb (primitive)
' - another vpx light which lights up everything around the bumper
' - the bumpertop (primitive)
' - the VPX bumper object
' - the bumper screws (primitive)
' - the bulb highlight VPX flasher object
' All elements have a special name with the number of the bumper at the end, this is necessary for the fading routine and the initialisation.
' For the bulb and the bumpertop there is a unique material as well per bumpertop.
' To use these bumpers you have to first copy all 10 elements to your table.
' Also export the textures (images) with names that start with "Flbumper" and "Flhighlight" and materials with names that start with "bumper".
' Make sure that all the ten objects are aligned on center, if possible with the exact same x,y coordinates
' After that copy the script (below); also copy the BumperTimer vpx object to your table
' Every bumper needs to be initialised with the FlInitBumper command, see example below; 
' Colors available are red, white, blue, orange, yellow, green, purple and blacklight.
' In a GI subroutine you can then call set the bumperlight intensity with the "FlBumperFadeTarget(nr) = value" command
' where nr is the number of the bumper, value is between 0 (off) and 1 (full on) (so you can also use 0.3 0.4 etc).

' Notes:
' - There is only one color for the disk; you can photoshop it to a different color
' - The bumpertops are angle independent up to a degree; my estimate is -45 to + 45 degrees horizontally, 0 (topview) to 70-80 degrees (frontview)
' - I built in correction for the day-night slider; this might not work perfectly, depending on your table lighting
' - These elements, textures and materials do NOT integrate with any of the lighting routines I have seen in use in many VPX tables
'   (just find the GI handling routine and insert the FlBumperFadeTarget statement)
' - If you want to use VPX native bumperdisks just copy my bumperdisk but make it invisible



' prepare some global vars to dim/brighten objects when using day-night slider
Dim DayNightAdjust , DNA30, DNA45, DNA90
If NightDay < 10 Then
	DNA30 = 0 : DNA45 = (NightDay-10)/20 : DNA90 = 0 : DayNightAdjust = 0.4
Else
	DNA30 = (NightDay-10)/30 : DNA45 = (NightDay-10)/45 : DNA90 = (NightDay-10)/90 : DayNightAdjust = NightDay/25
End If

Dim FlBumperFadeActual(6), FlBumperFadeTarget(6), FlBumperColor(6), FlBumperTop(6), FlBumperSmallLight(6), Flbumperbiglight(6)
Dim FlBumperDisk(6), FlBumperBase(6), FlBumperBulb(6), FlBumperscrews(6), FlBumperActive(6), FlBumperHighlight(6)
Dim cnt : For cnt = 1 to 6 : FlBumperActive(cnt) = False : Next

' colors available are red, white, blue, orange, yellow, green, purple and blacklight

FlInitBumper 1, "yellow"
FlInitBumper 2, "yellow"
FlInitBumper 3, "yellow"

' ### uncomment the statement below to change the color for all bumpers ###
' Dim ind : For ind = 1 to 5 : FlInitBumper ind, "green" : next

Sub FlInitBumper(nr, col)
	FlBumperActive(nr) = True
	' store all objects in an array for use in FlFadeBumper subroutine
	FlBumperFadeActual(nr) = 1 : FlBumperFadeTarget(nr) = 1.1: FlBumperColor(nr) = col
	Set FlBumperTop(nr) = Eval("bumpertop" & nr) : FlBumperTop(nr).material = "bumpertopmat" & nr
	Set FlBumperSmallLight(nr) = Eval("bumpersmalllight" & nr) : Set Flbumperbiglight(nr) = Eval("bumperbiglight" & nr)
	Set FlBumperDisk(nr) = Eval("bumperdisk" & nr) : Set FlBumperBase(nr) = Eval("bumperbase" & nr)
	Set FlBumperBulb(nr) = Eval("bumperbulb" & nr) : FlBumperBulb(nr).material = "bumperbulbmat" & nr
	Set FlBumperscrews(nr) = Eval("bumperscrews" & nr): FlBumperscrews(nr).material = "bumperscrew" & col
	Set FlBumperHighlight(nr) = Eval("bumperhighlight" & nr)
	' set the color for the two VPX lights
	select case col
		Case "red"
			FlBumperSmallLight(nr).color = RGB(255,4,0) : FlBumperSmallLight(nr).colorfull = RGB(255,24,0)
			FlBumperBigLight(nr).color = RGB(255,32,0) : FlBumperBigLight(nr).colorfull = RGB(255,32,0)
			FlBumperHighlight(nr).color = RGB(64,255,0)
			FlBumperSmallLight(nr).BulbModulateVsAdd = 0.98
			FlBumperSmallLight(nr).TransmissionScale = 0
		Case "blue"
			FlBumperBigLight(nr).color = RGB(32,80,255) : FlBumperBigLight(nr).colorfull = RGB(32,80,255)
			FlBumperSmallLight(nr).color = RGB(0,80,255) : FlBumperSmallLight(nr).colorfull = RGB(0,80,255)
			FlBumperSmallLight(nr).TransmissionScale = 0 : MaterialColor "bumpertopmat" & nr, RGB(8,120,255)
			FlBumperHighlight(nr).color = RGB(255,16,8)
			FlBumperSmallLight(nr).BulbModulateVsAdd = 1
		Case "green"
			FlBumperSmallLight(nr).color = RGB(8,255,8) : FlBumperSmallLight(nr).colorfull = RGB(8,255,8)
			FlBumperBigLight(nr).color = RGB(32,255,32) : FlBumperBigLight(nr).colorfull = RGB(32,255,32)
			FlBumperHighlight(nr).color = RGB(255,32,255) : MaterialColor "bumpertopmat" & nr, RGB(16,255,16) 
			FlBumperSmallLight(nr).TransmissionScale = 0.005
			FlBumperSmallLight(nr).BulbModulateVsAdd = 1
		Case "orange"
			FlBumperHighlight(nr).color = RGB(255,130,255)
			FlBumperSmallLight(nr).BulbModulateVsAdd = 1 
			FlBumperSmallLight(nr).TransmissionScale = 0
			FlBumperSmallLight(nr).color = RGB(255,130,0) : FlBumperSmallLight(nr).colorfull = RGB (255,90,0)
			FlBumperBigLight(nr).color = RGB(255,190,8) : FlBumperBigLight(nr).colorfull = RGB(255,190,8)
		Case "white"
			FlBumperBigLight(nr).color = RGB(255,230,190) : FlBumperBigLight(nr).colorfull = RGB(255,230,190)
			FlBumperHighlight(nr).color = RGB(255,180,100) : 
			FlBumperSmallLight(nr).TransmissionScale = 0
			FlBumperSmallLight(nr).BulbModulateVsAdd = 0.99
		Case "blacklight"
			FlBumperBigLight(nr).color = RGB(32,32,255) : FlBumperBigLight(nr).colorfull = RGB(32,32,255)
			FlBumperHighlight(nr).color = RGB(48,8,255) : 
			FlBumperSmallLight(nr).TransmissionScale = 0
			FlBumperSmallLight(nr).BulbModulateVsAdd = 1
		Case "yellow"
			FlBumperSmallLight(nr).color = RGB(255,230,4) : FlBumperSmallLight(nr).colorfull = RGB(255,230,4)
			FlBumperBigLight(nr).color = RGB(255,240,50) : FlBumperBigLight(nr).colorfull = RGB(255,240,50)
			FlBumperHighlight(nr).color = RGB(255,255,220)
			FlBumperSmallLight(nr).BulbModulateVsAdd = 1 
			FlBumperSmallLight(nr).TransmissionScale = 0
		Case "purple"
			FlBumperBigLight(nr).color = RGB(80,32,255) : FlBumperBigLight(nr).colorfull = RGB(80,32,255)
			FlBumperSmallLight(nr).color = RGB(80,32,255) : FlBumperSmallLight(nr).colorfull = RGB(80,32,255)
			FlBumperSmallLight(nr).TransmissionScale = 0 : 
			FlBumperHighlight(nr).color = RGB(32,64,255)
			FlBumperSmallLight(nr).BulbModulateVsAdd = 1
	end select
End Sub

Sub FlFadeBumper(nr, Z)
	FlBumperBase(nr).BlendDisableLighting = 0.5 * DayNightAdjust
'	UpdateMaterial(string, float wrapLighting, float roughness, float glossyImageLerp, float thickness, float edge, float edgeAlpha, float opacity,
'               OLE_COLOR base, OLE_COLOR glossy, OLE_COLOR clearcoat, VARIANT_BOOL isMetal, VARIANT_BOOL opacityActive,
'               float elasticity, float elasticityFalloff, float friction, float scatterAngle) - updates all parameters of a material
	FlBumperDisk(nr).BlendDisableLighting = (0.5 - Z * 0.3 )* DayNightAdjust	

	select case FlBumperColor(nr)

		Case "blue" :
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 0.9999, RGB(38-24*Z,130 - 98*Z,255), RGB(255,255,255), RGB(32,32,32), false, True, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 20  + 500 * Z / (0.5 + DNA30)
			FlBumperTop(nr).BlendDisableLighting = 3 * DayNightAdjust + 50 * Z
			FlBumperBulb(nr).BlendDisableLighting = 12 * DayNightAdjust + 5000 * (0.03 * Z +0.97 * Z^3)
			Flbumperbiglight(nr).intensity = 25 * Z / (1 + DNA45)
			FlBumperHighlight(nr).opacity = 10000 * (Z^3) / (0.5 + DNA90)

		Case "green"	
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 0.9999, RGB(16 + 16 * sin(Z*3.14),255,16 + 16 * sin(Z*3.14)), RGB(255,255,255), RGB(32,32,32), false, True, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 10 + 150 * Z / (1 + DNA30)
			FlBumperTop(nr).BlendDisableLighting = 2 * DayNightAdjust + 20 * Z
			FlBumperBulb(nr).BlendDisableLighting = 7 * DayNightAdjust + 6000 * (0.03 * Z +0.97 * Z^10)
			Flbumperbiglight(nr).intensity = 10 * Z / (1 + DNA45)
			FlBumperHighlight(nr).opacity = 6000 * (Z^3) / (1 + DNA90)
		
		Case "red" 
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 0.9999, RGB(255, 16 - 11*Z + 16 * sin(Z*3.14),0), RGB(255,255,255), RGB(32,32,32), false, True, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 17 + 100 * Z / (1 + DNA30^2)
			FlBumperTop(nr).BlendDisableLighting = 3 * DayNightAdjust + 18 * Z / (1 + DNA90)
			FlBumperBulb(nr).BlendDisableLighting = 20 * DayNightAdjust + 9000 * (0.03 * Z +0.97 * Z^10)
			Flbumperbiglight(nr).intensity = 10 * Z / (1 + DNA45)
			FlBumperHighlight(nr).opacity = 2000 * (Z^3) / (1 + DNA90)
			MaterialColor "bumpertopmat" & nr, RGB(255,20 + Z*4,8-Z*8)
		
		Case "orange"
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 0.9999, RGB(255, 100 - 22*z  + 16 * sin(Z*3.14),Z*32), RGB(255,255,255), RGB(32,32,32), false, True, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 17 + 250 * Z / (1 + DNA30^2)
			FlBumperTop(nr).BlendDisableLighting = 3 * DayNightAdjust + 50 * Z / (1 + DNA90)
			FlBumperBulb(nr).BlendDisableLighting = 15 * DayNightAdjust + 2500 * (0.03 * Z +0.97 * Z^10)
			Flbumperbiglight(nr).intensity = 10 * Z / (1 + DNA45)
			FlBumperHighlight(nr).opacity = 4000 * (Z^3) / (1 + DNA90)
			MaterialColor "bumpertopmat" & nr, RGB(255,100 + Z*50, 0)

		Case "white"
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 0.9999, RGB(255,230 - 100 * Z, 200 - 150 * Z), RGB(255,255,255), RGB(32,32,32), false, true, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 20 + 180 * Z / (1 + DNA30)
			FlBumperTop(nr).BlendDisableLighting = 5 * DayNightAdjust + 30 * Z
			FlBumperBulb(nr).BlendDisableLighting = 18 * DayNightAdjust + 3000 * (0.03 * Z +0.97 * Z^10)
			Flbumperbiglight(nr).intensity = 8 * Z / (1 + DNA45)
			FlBumperHighlight(nr).opacity = 1000 * (Z^3) / (1 + DNA90)
			FlBumperSmallLight(nr).color = RGB(255,255 - 20*Z,255-65*Z) : FlBumperSmallLight(nr).colorfull = RGB(255,255 - 20*Z,255-65*Z)
			MaterialColor "bumpertopmat" & nr, RGB(255,235 - z*36,220 - Z*90)

		Case "blacklight"
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 1, RGB(30-27*Z^0.03,30-28*Z^0.01, 255), RGB(255,255,255), RGB(32,32,32), false, true, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 20 + 900 * Z / (1 + DNA30)
			FlBumperTop(nr).BlendDisableLighting = 3 * DayNightAdjust + 60 * Z
			FlBumperBulb(nr).BlendDisableLighting = 15 * DayNightAdjust + 30000 * Z^3
			Flbumperbiglight(nr).intensity = 25 * Z / (1 + DNA45)
			FlBumperHighlight(nr).opacity = 2000 * (Z^3) / (1 + DNA90)
			FlBumperSmallLight(nr).color = RGB(255-240*(Z^0.1),255 - 240*(Z^0.1),255) : FlBumperSmallLight(nr).colorfull = RGB(255-200*z,255 - 200*Z,255)
			MaterialColor "bumpertopmat" & nr, RGB(255-190*Z,235 - z*180,220 + 35*Z)

		Case "yellow"
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 0.9999, RGB(255, 180 + 40*z, 48* Z), RGB(255,255,255), RGB(32,32,32), false, True, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 17 + 200 * Z / (1 + DNA30^2)
			FlBumperTop(nr).BlendDisableLighting = 3 * DayNightAdjust + 40 * Z / (1 + DNA90)
			FlBumperBulb(nr).BlendDisableLighting = 12 * DayNightAdjust + 2000 * (0.03 * Z +0.97 * Z^10)
			Flbumperbiglight(nr).intensity = 10 * Z / (1 + DNA45)
			FlBumperHighlight(nr).opacity = 1000 * (Z^3) / (1 + DNA90)
			MaterialColor "bumpertopmat" & nr, RGB(255,200, 24 - 24 * z)

		Case "purple" :
			UpdateMaterial "bumperbulbmat" & nr, 0, 0.75 , 0, 1-Z, 1-Z, 1-Z, 0.9999, RGB(128-118*Z - 32 * sin(Z*3.14), 32-26*Z ,255), RGB(255,255,255), RGB(32,32,32), false, True, 0, 0, 0, 0
			FlBumperSmallLight(nr).intensity = 15  + 200 * Z / (0.5 + DNA30) 
			FlBumperTop(nr).BlendDisableLighting = 3 * DayNightAdjust + 50 * Z
			FlBumperBulb(nr).BlendDisableLighting = 15 * DayNightAdjust + 10000 * (0.03 * Z +0.97 * Z^3)
			Flbumperbiglight(nr).intensity = 25 * Z / (1 + DNA45) 
			FlBumperHighlight(nr).opacity = 4000 * (Z^3) / (0.5 + DNA90)
			MaterialColor "bumpertopmat" & nr, RGB(128-60*Z,32,255)


	end select
End Sub

Sub BumperTimer_Timer
	dim nr
	For nr = 1 to 6
		If FlBumperFadeActual(nr) < FlBumperFadeTarget(nr) and FlBumperActive(nr)  Then
			FlBumperFadeActual(nr) = FlBumperFadeActual(nr) + (FlBumperFadeTarget(nr) - FlBumperFadeActual(nr)) * 0.8
			If FlBumperFadeActual(nr) > 0.99 Then FlBumperFadeActual(nr) = 1 : End If
			FlFadeBumper nr, FlBumperFadeActual(nr)
		End If
		If FlBumperFadeActual(nr) > FlBumperFadeTarget(nr) and FlBumperActive(nr)  Then
			FlBumperFadeActual(nr) = FlBumperFadeActual(nr) + (FlBumperFadeTarget(nr) - FlBumperFadeActual(nr)) * 0.4 / (FlBumperFadeActual(nr) + 0.1)
			If FlBumperFadeActual(nr) < 0.01 Then FlBumperFadeActual(nr) = 0 : End If
			FlFadeBumper nr, FlBumperFadeActual(nr)
		End If
	next
End Sub


'******************************************************
'******  END FLUPPER BUMPERS
'******************************************************


'**********************************************************************************************************
'* InstructionCard *
'**********************************************************************************************************

Dim CardCounter, ScoreCard
Sub CardTimer_Timer
        If scorecard=1 Then
                CardCounter=CardCounter+2
                If CardCounter>50 Then CardCounter=50
        Else
                CardCounter=CardCounter-4
                If CardCounter<0 Then CardCounter=0
        End If
        InstructionCard.transX = -CardCounter*3.5
        InstructionCard.transY = CardCounter*2
        InstructionCard.transZ = -cardcounter*2.5
'        InstructionCard.objRotX = -cardcounter/2
        InstructionCard.size_x = 1+CardCounter/25
        InstructionCard.size_y = 1+CardCounter/25
        If CardCounter=0 Then 
                CardTimer.Enabled=False
                InstructionCard.visible=0
        Else
                InstructionCard.visible=1
        End If 
End Sub


' Bit sets, the set data type implemented as a bit vector
' Only numbers 0 to 30 are valid elements
Class BitSet

	private mnCapacity
	private mnBits
	private i
	private temp
	private lsb
	private msb

	private sub Class_Initialize
		mnCapacity = 0
		mnBits = 0
	end Sub
	
	public property get Capacity
		Capacity = mnCapacity
	end property

	public property let Capacity(nSize)
		mnCapacity = nSize
	end property

	public Sub Add (nElement)
		If Not (nElement < 0 or nElement >= mnCapacity) Then
			mnBits = mnBits Or aPowersOfTwo(nElement)
		End If
	End Sub

	public Sub Remove (nElement)
		If Not (nElement < 0 or nElement >= mnCapacity) Then
			mnBits = mnBits And Not aPowersOfTwo(nElement)
		End If
	End Sub

	public Sub Clear
		mnBits = 0
	End Sub

	public function Contains(nElement)
		If nElement < 0 or nElement >= mnCapacity Then
			Contains = False
		Else
			temp = mnBits And aPowersOfTwo(nElement)
			Contains = Temp <> 0
		End If
	end Function

	public function IsFull
		temp = aPowersOfTwo(mnCapacity) - 1
		IsFull = Not (mnBits <> temp)
	end Function

	public function Count
		Dim nCount
		nCount = 0
		for i = 0 to (mnCapacity - 1)
			If Me.Contains(i) Then nCount = nCount + 1
		Next
		Count = nCount
	End Function

	public Sub RotateLeft
	' save least significant bit
		lsb = mnBits And 1
	' shift all bits one to the right
		mnBits = Int(mnBits / 2)
	' Set the most significant bit to what the least significant bit was
		If lsb <> 0 Then
			mnBits = mnBits Or aPowersOfTwo(mnCapacity - 1)
		Else
			mnBits = mnBits And (Not aPowersOfTwo(mnCapacity - 1))
		End If
	End Sub

	public Sub RotateRight
	' save most significant bit
		msb = mnBits And aPowersOfTwo(mnCapacity - 1)
	' shift all bits one to the left
		mnBits = mnBits * 2
	' Clear anything past the most significant bit
		mnBits = mnBits And (Not aPowersOfTwo(mnCapacity))
	' Set the least significant bit to what the most significant bit was
		If msb <> 0 Then
			mnBits = mnBits Or aPowersOfTwo(0)
		Else
			mnBits = mnBits And (Not aPowersOfTwo(0))
		End If
	End Sub
End Class

' Hack to return Narnia ball back in play
Sub TimerNarnia_Timer
    Dim b
	For b = 0 to UBound(gBOT)
		if gBOT(b).z < -200 Then
			gBOT(b).x = 902 : gBOT(b).y = 2000  : gBOT(b).z = 0
			gBOT(b).angmomx= 0 : gBOT(b).angmomy= 0 :	gBOT(b).angmomz= 0
			gBOT(b).velx = 0 : gBOT(b).vely = 0 : gBOT(b).velz = 0
			KickerAutoPlunge.enabled = True
		end if
	next
end sub


'**********************************************************************************************************
' VR Plunger
'**********************************************************************************************************

Sub TimerVRPlunger_Timer
	If Pincab_Plunger.Y < 338.6666 then
		Pincab_Plunger.Y = Pincab_Plunger.Y + 5
	End If
End Sub

Sub TimerVRPlunger2_Timer
	Pincab_Plunger.Y = 238.6666 + (5* Plunger.Position) - 20
End Sub
