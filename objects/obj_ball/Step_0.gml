if(global.pause) {
	return;	
}

if(h_speed == 0 && v_speed == 0) {
	if(timeout > 0) {
		timeout--;
	} else {
		h_speed = initial_velocity;	
		PlaySound(glass_bleep_trail);
	}
}

x += h_speed;
y += v_speed;


var _paddle_collision = instance_place(x, y, obj_paddle);
var _wall_collision = instance_place(x, y, obj_wall);
var _oob_collision = instance_place(x, y, obj_oob);

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
	obj_pong.score_pass++;
	PlaySound(synth1_b1, 0.5, 0.2);
	
	if(last_hit_player) {
		shockwave_instance_create(obj_player_paddle.x, obj_player_paddle.y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
	} else {
		shockwave_instance_create(obj_enemy_paddle.x + 70, obj_enemy_paddle.y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
	}
	
	
	
}

if(_wall_collision) {
	v_speed = 0 - v_speed;
	PlaySound(synth1_b1, 0.5, 0.2);
	shockwave_instance_create(x, y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
}

if(_oob_collision) {
	x = initial_x;
	y = initial_y;
	pong_init();
 
	if(last_hit_player) {
		obj_pong.score_player++;
		initial_velocity = velocity;	
	} else {
		obj_pong.score_enemy++;
		initial_velocity = 0 - velocity;
	}
	
	last_hit_player = false;	
	
	if(obj_pong.score_enemy >= WIN || obj_pong.score_player >= WIN) {
		
		if(obj_pong.score_player > obj_pong.score_enemy) {
			PlaySound(happy_bells_success);
		} else {
			PlaySound(happy_bells_diminish);
		}
		
		room_goto_next();	
	} else {
		PlaySound(bass_descend1);
	}

}

