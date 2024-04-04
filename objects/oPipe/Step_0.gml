x -= oFlappyBird.gameSpeed;

if(x <= -160) {
	instance_destroy()	;
}
// Si ça touche oWall, générer un nouvel obstacle

//if(