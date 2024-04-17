if(global.pause) {
	return;	
}

if(hSpeed == 0 && vSpeed == 0) {
	if(timeout > 0) {
		timeout--;
	} else {
		hSpeed = initialVelocity;	
		playSound(sndPongBallLaunch);
	}
}

x += hSpeed;
y += vSpeed;


var _paddleCollision = instance_place(x, y, oPaddle);
var _wallCollision = instance_place(x, y, oWall);
var _oobCollision = instance_place(x, y, oOOB);

show_debug_message("velocity {0}", velocity);

if(instance_exists(_paddleCollision)) {
	
	var _startY = _paddleCollision.y - _paddleCollision.halfPaddleSize;
	var _endY = _paddleCollision.y + _paddleCollision.halfPaddleSize;
	
	var _progression = ((y - _startY) / (_endY - _startY)) - 0.5;
	
	verticalAngle = clamp( _progression - verticalAngle, -1, 1);


	hSpeed = _paddleCollision.isPlayer ? velocity : 0 - velocity;
	vSpeed = velocity * verticalAngle;

	lastHitPlayer = _paddleCollision.isPlayer;
	velocity += 0.1;
	oPaddleDash.scorePass++;
	playSound(sndPongBallBounce, 0.5, 0.2);
	
	if(lastHitPlayer) {
		shockwave_instance_create(oPlayerPaddle.x, oPlayerPaddle.y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
	} else {
		shockwave_instance_create(oEnemyPaddle.x + 70, oEnemyPaddle.y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
	}	
}

if(instance_exists(_wallCollision)) {
	vSpeed = 0 - vSpeed;
	playSound(sndPongBallBounce, 0.5, 0.2);
	shockwave_instance_create(x, y, "Instances", 0, 2, 1, __obj_ppf_shockwave);	
}

if(instance_exists(_oobCollision)) {
	x = initialX;
	y = initialY;
	paddleDashInit();
 
	if(lastHitPlayer) {
		oPaddleDash.scorePlayer++;
		initialVelocity = velocity;	
	} else {
		oPaddleDash.scoreEnemy++;
		initialVelocity = 0 - velocity;
	}
	
	lastHitPlayer = false;	
	
	if(oPaddleDash.scoreEnemy >= WIN || oPaddleDash.scorePlayer >= WIN) {
		
		if(oPaddleDash.scorePlayer > oPaddleDash.scoreEnemy) {
			playSound(sndPongVictory);
		} else {
			playSound(sndPongDefeat);
		}
		
		room_goto(rPaddleDashGameover);	
	} else {
		playSound(sndMenuClick);
	}

}

