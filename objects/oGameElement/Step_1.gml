if(global.pause) {
	return;	
}

x -= oWingSoar.gameSpeed;

if(x <= -160) {
	instance_destroy()	;
}