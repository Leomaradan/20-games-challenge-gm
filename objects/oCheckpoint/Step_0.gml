x -= oFlappyBird.gameSpeed;

if(x <= -160) {
	instance_destroy()	;
}

var _triggerCollision = instance_place(x, y, oWall);

if(_triggerCollision && !hasTriggerLevel) {
	
	hasTriggerLevel = true;
	global.cpt++;
	
	var _design = array_pop(oFlappyBird.levelLayout);
	
	if(array_length(oFlappyBird.levelLayout) == 0) {
		oFlappyBird.levelLayout = generateLevel();
	}


	createInstances(1344, _design);		

}