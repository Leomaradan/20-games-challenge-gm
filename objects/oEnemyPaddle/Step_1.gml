var _position_x = oBall.x / room_width;

if(idle_time > 0) {
	idle_time--;	
} else {
	if(_position_x < 0.25) {
		// target_y =  room_height / 2;
		target_y = y + random_range(-15, 15);
	} else if (_position_x < 0.5) {
		target_y = mean(oPlayerPaddle.y, room_height / 2);
	} else if(_position_x < 0.75) {
		target_y = mean(oPlayerPaddle.y, oBall.y);
	} else {
		target_y = oBall.y;	
	}
		
	var _new_range = 15 + random_range(-5, 5);
	idle_time = random_range(0 - _new_range, _new_range);		
}

var _distance = target_y - y;
v_speed = clamp(_distance, -5, 5);
