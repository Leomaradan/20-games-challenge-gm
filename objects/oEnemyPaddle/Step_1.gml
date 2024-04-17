var _positionX = oBall.x / room_width;

if(idleTime > 0) {
	idleTime--;	
} else {
	if(_positionX < 0.25) {
		// target_y =  room_height / 2;
		targetY = y + random_range(-15, 15);
	} else if (_positionX < 0.5) {
		targetY = mean(oPlayerPaddle.y, room_height / 2);
	} else if(_positionX < 0.75) {
		targetY = mean(oPlayerPaddle.y, oBall.y);
	} else {
		targetY = oBall.y;	
	}
		
	var _newRange = 15 + random_range(-5, 5);
	idleTime = random_range(0 - _newRange, _newRange);		
}

var _distance = targetY - y;
vSpeed = clamp(_distance, -5, 5);
