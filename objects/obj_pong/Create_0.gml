score_player = 0;
score_enemy = 0;
score_pass = 0;


effect_set = false;

shockwaves_renderer_id = new PPFX_ShockwaveRenderer();
shockwaves_renderer_id.AddObject(__obj_ppf_shockwave);

playMusic(Modern_Futuristic_City);

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


optionRestartGame = new MenuItem("Restart Game", function() {
	score_player = 0;
	score_enemy = 0;
	score_pass = 0;	
	room_goto(rm_pong_start);
});

optionStartGame = new MenuItem("Start Game", function() {
	room_goto(rm_pong);
});
