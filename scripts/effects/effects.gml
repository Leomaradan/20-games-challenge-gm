function effects(){
	var pongEffects = [
		new FX_Bloom(true, 16, 0.78, 3),
		// new FX_SunShafts(true, [0.5, 0], 0.78, 2.1),
		new FX_SlowMotion(true, 0.78, 1, 5),
		new FX_Shockwaves(true, 0.1, 0.2, sprite_get_texture(__spr_ppf_prism_lut_gp, 0)),
		new FX_LUT(true, 1, 1, 8, sprite_get_texture(__spr_ppf_lut_grid_default, 0)),
	]


	return { pongEffects }
}