if(hSpeed == 0 && vSpeed == 0) {
	if(timeout > 0) {
		timeout--;
	} else {
		hSpeed = initial_velocity;	
	}
}

x += hSpeed;
y += vSpeed;

/*
Touch a paddle : go opposite horizontal direction, increase speed
Touch a wall : go opposite vertical direction
Touch a OOB zone : increase score, reset ball position

*/

var _paddle_collision = instance_place(x, y, oPaddle);
var _wall_collision = instance_place(x, y, oWall);
var _oob_collision = instance_place(x, y, oOOB);

if(_paddle_collision) {
	// The ball touch a paddle
	
	// var _vertical_velocity = 0;

	//var paddleY1 = _paddle_collision.y - _paddle_collision.breakpointY;
	//var paddleY2 = _paddle_collision.y + _paddle_collision.breakpointY;
	
	var _start_y = _paddle_collision.y - _paddle_collision.halfPaddleSize;
	var _end_y = _paddle_collision.y + _paddle_collision.halfPaddleSize;
	
	var _progression = ((y - _start_y) / (_end_y - _start_y)) - 0.5;
	
	vertical_angle = clamp( _progression - vertical_angle, -1, 1);

	/*if(y < paddleY1) {
		_vertical_velocity = -1;	
	}

	if(y > paddleY2) {
		_vertical_velocity = 1;	
	}*/

	hSpeed = _paddle_collision.isPlayer ? velocity : 0 - velocity;
	vSpeed = velocity * vertical_angle;

	lastHitPlayer = _paddle_collision.isPlayer;
	velocity += 0.1;
	
	show_debug_message("velocity {}", velocity);
}

if(_wall_collision) {
	vSpeed = 0 - vSpeed;
}

if(_oob_collision) {
	x = initial_x;
	y = initial_y;
	pong_init();
 
	if(lastHitPlayer) {
		oPong.score_player++;
		initial_velocity = velocity;	
	} else {
		oPong.score_enemy++;
		initial_velocity = 0 - velocity;
	}
	
	lastHitPlayer = false;	

}