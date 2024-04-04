application_surface_draw_enable(false);

ppfx = new PPFX_System();

var _pongEffects = [
	new FX_Bloom(true, 16, 0.78, 3),
		
	// new FX_SlowMotion(true, 0.78, 1, 5),
	new FX_Shockwaves(true, 0.1, 0.2, sprite_get_texture(__spr_ppf_prism_lut_gp, 0)),
	new FX_LUT(true, 1, 1, 8, sprite_get_texture(__spr_ppf_lut_grid_default, 0)),
];
	
var _flappyBirdEffects = [
	new FX_LUT(true, 1, 1, 8, sprite_get_texture(__spr_ppf_lut_grid_default, 0)),
	new FX_ChannelMixer(true),
	// new FX_SlowMotion(true, 0.78, 1, 5),
	// new FX_SunShafts(true, [0.5, 0.5], 1.5, 2.5, 5, 1, 0, true, 0.5, 2, 0.03, 0.5,,false),
//spr_lut_test_0
];

pong = new PPFX_Profile("Pong",_pongEffects);
flappyBird = new PPFX_Profile("FlappyBird", _flappyBirdEffects);

global.blurmode = false;

debug_ui = new PPFX_DebugUI(ppfx);