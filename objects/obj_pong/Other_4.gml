global.pauseOptions = undefined;

if(!effect_set) {
	obj_ppfx.ppfx.ProfileLoad(obj_ppfx.pong);
	global.blurmode = true;
	effect_set = true;
}

switch(room) {
	case rm_pong:	
		global.pauseOptions = [
			["Continue", Unpause],
			["Restart Game", function() {
				score_player = 0;
				score_enemy = 0;
				score_pass = 0;	
				room_goto(rm_pong_start);
			}],
			["Return to Game Selection",ReturnToMenuSelection],
			["Exit Games", ReturnToMenuSelection],
		];
		options = undefined;
		break;
	case rm_pong_start: 
		global.pauseOptions = undefined;
		optionsLayoutSmall = false;
		options = [
			["Start Game", function() {
				room_goto(rm_pong);
			}],
			["Return to Game Selection",ReturnToMenuSelection],
			["Exit Games", ReturnToMenuSelection]
		];
		break;
	case rm_pong_gameover: 
		global.pauseOptions = undefined;
		optionsLayoutSmall = true;
		options = [
			["Restart Game", function() {
				score_player = 0;
				score_enemy = 0;
				score_pass = 0;	
				room_goto(rm_pong_start);
			}],
			["Return to Game Selection",ReturnToMenuSelection],
			["Exit Games", ReturnToMenuSelection]
		];
		break;		
}
