if(global.pause) {
	return;	
}

if(startingTimer > 0) {
	startingTimer--;
	return;
}


var _flap = input_check("activate");


if(_flap) {
	vSpeed = 0 - flapSpeed;
}

if(vSpeed != 0) {
	vSpeed++;	
	if(vSpeed > 0) {
		vSpeed = 0;	
	}
}

var _resultingSpeed = vSpeed + gravityForce;

var _angle = point_direction(0, 0, oFlappyBird.gameSpeed, _resultingSpeed);
/*if(_resultingSpeed < 0) {
	// up
	image_angle	= 45
} else if(_resultingSpeed > 0) {
	// down
	
	image_angle = -45
} else {
	image_angle = 0;	
}*/

image_angle = _angle;

y+= _resultingSpeed;

addDebugVariable("flap", _flap);
addDebugVariable("vSpeed", vSpeed);
addDebugVariable("x", x);
addDebugVariable("y", y);
addDebugVariable("resultingSpeed", _resultingSpeed);
addDebugVariable("angle", _angle);


var _oobCollision = instance_place(x, y, oOOB);
var _pipeCollision = instance_place(x, y, oPipe);
var _checkpointCollision = instance_place(x, y, oCheckpoint);

if(instance_exists(_oobCollision)) {
	room_goto(rFlappyBirdGameOver);	
}

if(instance_exists(_pipeCollision)) {
	room_goto(rFlappyBirdGameOver);	
}

if(instance_exists(_checkpointCollision) && !_checkpointCollision.hasTriggerPlayer) {
	
	_checkpointCollision.hasTriggerPlayer = true;
	oFlappyBird.playerScore += _checkpointCollision.point;
	oFlappyBird.gameSpeed += 0.1;
	if(_checkpointCollision.point == 1) {
		playSound(sndBonusGet, 0.2);
	} else {
		playSound(sndBonusGet, 0.4);
	}
}