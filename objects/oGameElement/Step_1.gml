if(global.pause) {
	return;	
}

x -= oFlappyBird.gameSpeed;

if(x <= -160) {
	instance_destroy()	;
}