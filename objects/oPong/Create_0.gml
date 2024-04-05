cleanupInstance = true;

score_player = 0;
score_enemy = 0;
score_pass = 0;


effect_set = false;

shockwaves_renderer_id = new PPFX_ShockwaveRenderer();
shockwaves_renderer_id.AddObject(__obj_ppf_shockwave);

playMusic(sndMusicPong);

global.allowPause = false;

glow_progress = 0;
glow_speed = 0.01;
glow_intensity = 1;

horizontalCenter = room_width / 2;
verticalTier = room_height / 3;
scoreVertical =  ((room_height / 3) * 2) - 24;
scoreVerticalOffset = 24 * 1.5;
scoreHorizontal = room_width - 20;

//optionSelected = 0;
//options = [];
optionsLayoutSmall = false;

emptyMenu = new Menu();

menu = emptyMenu;

// Creating an empty array first to prevent bug with Feather
//options = undefined;


optionRestartGame = new MenuItem(standardMenuTitle().newGame, function() {
	score_player = 0;
	score_enemy = 0;
	score_pass = 0;	
	global.pause = false;
	room_goto(rmPongStart);
});

optionStartGame = new MenuItem(standardMenuTitle().start, function() {
	room_goto(rmPongPlay);
});
