global.debugVariables = [
	["pause",global.pause]
];

if(global.pause != previousState) {
	pauseText = translate("menuPause"); // Retranslate each time the pause is toggled
	previousState = global.pause;
	global.pauseToggle = true;
} else {
	global.pauseToggle = false;	
}