if(global.pause) {
	return;	
}

if(h_speed == 0 && v_speed == 0) {
	if(timeout > 0) {
		timeout--;
	} else {
		h_speed = initial_velocity;	
		playSound(sndPongBallLaunch);
	}
}

x += h_speed;
y += v_speed;


var _paddle_collision = instance_place(x, y, oPaddle);
var _wall_collision = instance_place(x, y, oWall);
var _oob_collision = instance_place(x, y, oOOB);

show_debug_message("velocity {0}", velocity);

if(_paddle_collision) {
	
	var _start_y = _paddle_collision.y - _paddle_collision.half_paddle_size;
	var _end_y = _paddle_collision.y + _paddle_collision.half_paddle_size;
	
	var _progression = ((y - _start_y) / (_end_y - _start_y)) - 0.5;
	
	vertical_angle = clamp( _progression - vertical_angle, -1, 1);


	h_speed = _paddle_collision.is_player ? velocity : 0 - velocity;
	v_speed = velocity * vertical_angle;

	last_hit_player = _paddle_collision.is_player;
	velocity += 0.1;
	oPong.score_pass++;
	playSound(sndPongBallBounce, 0.5, 0.2);
	
	if(last_hit_player) {
		shockwave_instance_create(oPlayerPaddle.x, oPlayerPaddle.y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
	} else {
		shockwave_instance_create(oEnemyPaddle.x + 70, oEnemyPaddle.y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
	}
	
	
	
}

if(_wall_collision) {
	v_speed = 0 - v_speed;
	playSound(sndPongBallBounce, 0.5, 0.2);
	shockwave_instance_create(x, y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
}

if(_oob_collision) {
	x = initial_x;
	y = initial_y;
	pong_init();
 
	if(last_hit_player) {
		oPong.score_player++;
		initial_velocity = velocity;	
	} else {
		oPong.score_enemy++;
		initial_velocity = 0 - velocity;
	}
	
	last_hit_player = false;	
	
	if(oPong.score_enemy >= WIN || oPong.score_player >= WIN) {
		
		if(oPong.score_player > oPong.score_enemy) {
			playSound(sndPongVictory);
		} else {
			playSound(sndPongDefeat);
		}
		
		room_goto(rmPongGameover);	
	} else {
		playSound(sndMenuClick);
	}

}

