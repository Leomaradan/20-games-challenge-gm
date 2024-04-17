var _triggerCollision = instance_place(x, y, oWall);

if(_triggerCollision && !hasTriggerLevel) {
	
	hasTriggerLevel = true;
	global.cpt++;
	
	var _design = array_pop(oWingSoar.levelLayout);
	
	if(array_length(oWingSoar.levelLayout) == 0) {
		oWingSoar.levelLayout = generateLevel();
	}


	createInstances(1344, _design);		

}