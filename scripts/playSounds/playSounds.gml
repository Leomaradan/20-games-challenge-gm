function playSound(sound, intensity = 0.5, randomness = 0){
	var _intensityRandom = randomness == 0 ? intensity : random_range(intensity - randomness, intensity + randomness);
	
	audio_play_sound(sound, 1, false, _intensityRandom);
}

function playMusic(music, intensity = 0.5){
	if(global.musicPlaying != music) {
		if(global.musicPlaying != undefined) {
			audio_stop_sound(global.musicPlaying);
		}
		audio_play_sound(music, 1, true, intensity);
		global.musicPlaying = music;
	}

}