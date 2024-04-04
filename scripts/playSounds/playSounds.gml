function playSound(sound, intensityOffset = 0.5, randomnessOffset = 0){
	
	var _intensity = intensityOffset;
	var _randomness = randomnessOffset;
	
	switch(global.gameOptions.sound) {
		case 0:
			_intensity *= 0.1;
			_randomness *= 0.1;
			break;
		case 1:
			_intensity *= 0.5;
			_randomness *= 0.5;
			break;
		case 2:
		default:
			// nothing to do
	}
	
	var _intensityRandom = _randomness == 0 ? _intensity : random_range(_intensity - _randomness, _intensity + _randomness);
	
	audio_play_sound(sound, 1, false, _intensityRandom);
}

function playMusic(music, intensityOffset = 0.5){
	
	var _intensity = intensityOffset;
	
	switch(global.gameOptions.music) {
		case 0:
			_intensity *= 0.1;
			break;
		case 1:
			_intensity *= 0.5;
			break;
		case 2:
		default:
			// nothing to do
	}
	
	if(global.music.playing != music) {
		if(global.music.playing != undefined) {
			audio_stop_sound(global.music.playing);
		}
		global.music = {
			playing: music,
			intensity: intensityOffset,
			id: audio_play_sound(music, 1, true, _intensity)
		}

	}

}