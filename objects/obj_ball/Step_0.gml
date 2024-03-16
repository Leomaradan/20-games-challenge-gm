if(h_speed == 0 && v_speed == 0) {
	if(timeout > 0) {
		timeout--;
	} else {
		h_speed = initial_velocity;	
	}
}

x += h_speed;
y += v_speed;


var _paddle_collision = instance_place(x, y, obj_paddle);
var _wall_collision = instance_place(x, y, obj_wall);
var _oob_collision = instance_place(x, y, obj_oob);

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
}

if(_wall_collision) {
	v_speed = 0 - v_speed;
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
	
	if(obj_pong.score_enemy >= 9 || obj_pong.score_player >= 9) {
		room_goto_next();	
	}

}