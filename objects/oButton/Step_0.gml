var _meet = position_meeting(mouse_x, mouse_y, self);
var _accept = input_check_pressed("accept");
var _click = input_check_pressed("click");

var _actionTrigger = function() {
	switch(other.vRoom) {
		case 0:
			playSound(sndMenuClickError);
			break;
		case -1:
			playSound(sndHomeMenuClick, 1);
			exitToDesktop();
			break;
		default:
			playSound(sndHomeMenuClick, 1);
			room_goto(other.vRoom);
			break;
		
	}
}

with(oMenu) {
	
	if(_meet) {
		buttonSelectedCol = other.vCol;	
		buttonSelectedRow = other.vRow;	
		if(_click) {
			_actionTrigger();
		}
	}
	
	if(other.vCol == buttonSelectedCol && other.vRow == buttonSelectedRow) {
		other.image_index = other.vRed ? 3 : 1;	
		if(_accept) {
			_actionTrigger();
		}
			
	} else {
		other.image_index = other.vRed ? 2 : 0;
	}
}