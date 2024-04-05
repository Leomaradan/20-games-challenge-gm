cleanupInstance = true;

playerScore = 0;
gameSpeed = 5;

randomize();


effectSet = false;

//sunLayerId = new PPFX_LayerRenderer();
//sunLayerId.Apply(-1, layer_get_id("BackgroundNear"), layer_get_id("Sky"), false);

optionsLayoutSmall = false;

playMusic(sndMusicFlappyBird);

global.allowPause = false;

horizontalTier = room_width * 0.3;
horizontalCenter = room_width * 0.5;

verticalTier = room_height / 3;

scoreVertical =  ((room_height / 3) * 2) - 24;
scoreHorizontal = room_width - 20;
scoreVerticalOffset = 24 * 1.5;

emptyMenu = new Menu();

menu = emptyMenu;

optionRestartGame = new MenuItem(standardMenuTitle().newGame, function() {
	playerScore = 0;
	gameSpeed = 5;
	global.pause = false;
	room_goto(rFlappyBirdStart);
});

optionStartGame = new MenuItem(standardMenuTitle().start, function() {
	room_goto(rFlappyBirdPlay);
});

levelLayout = [];

background1 = layer_get_id("BackgroundNear");
background2 = layer_get_id("BackgroundMiddle");
background3 = layer_get_id("BackgroundFar");

initialBackgroundSpeed1 = layer_get_hspeed(background1);
initialBackgroundSpeed2 = layer_get_hspeed(background2);
initialBackgroundSpeed3 = layer_get_hspeed(background3);