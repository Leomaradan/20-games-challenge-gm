function createInstances(_posX, _design) {

	var _type = _design[0];
	var _breakpoint1Tiles = _design[1];
	var _breakpoint2Tiles = _design[2];
	var _breakpoint1 = _breakpoint1Tiles * FLAPPY_TILES;	
	var _breakpoint2 = _breakpoint2Tiles * FLAPPY_TILES;
	
	var _posXCheckpoints = _posX + 32;
	
	switch(_type) {
		case "pipe": {
			var _points = _design[3];
			instance_create_layer(_posX, _breakpoint1, "Instances", oUpperPipe)
		
			with(instance_create_layer(_posXCheckpoints, 0, "Instances", oCheckpoint)) {
				self.point = _points;
			}
		
			instance_create_layer(_posX, _breakpoint2, "Instances", oLowerPipe)	
			break;
		}
		
		case "half": {
			var _orientation = _design[3];
			if(_orientation == "up") {
				instance_create_layer(_posXCheckpoints, 0, "Instances", oCheckpoint)
				instance_create_layer(_posX, _breakpoint2, "Instances", oLowerPipe);						
			} else {
				instance_create_layer(_posX, _breakpoint1, "Instances", oUpperPipe);
				instance_create_layer(_posXCheckpoints, 0, "Instances", oCheckpoint);
			}
	
			break;
		}
		
		case "block": {
			instance_create_layer(_posXCheckpoints, 0, "Instances", oCheckpoint)
			instance_create_layer(_posX, _breakpoint1, "Instances", oBlockPipe)

			break;
		}	
		
		case "flag": {
			instance_create_layer(_posXCheckpoints, _breakpoint1, "Instances", oCheckpointFlag);

			break;
		}		
	}	
}

function generateLevel(){
	static _availableElements = [
		[1,["pipe",2,7,1]],
		[1,["pipe",3,8,1]],
		[1,["pipe",2,7,1]],
		[1,["pipe",4,9,1]],
		[1,["pipe",3,8,1]],
		[1,["pipe",4,9,1]],
		[1,["pipe",5,10,1]],
		[1,["pipe",6,11,1]],
		[1,["pipe",5,10,1]],
		[3,["pipe",3,6,3]],
		[3,["pipe",6,9,3]],
		[2,["half",0,5,"up"]],
		[2,["half",7,13,"down"]],
		[2,["block",3,6]],
		[2,["block",6,9]],
		[4,["flag",3,6]],
		[4,["flag",6,9]],	
	];

	var _sum = 15;
	var _results = [];
	
	var _shuffled = array_shuffle(_availableElements);
	
	while(_sum > 0) {
		var _elem = array_pop(_shuffled);
		
		if(_sum >= _elem[0]) {
			array_push(_results, _elem[1]);
			_sum -= _elem[0];
		}
	}
	

	return _results
}