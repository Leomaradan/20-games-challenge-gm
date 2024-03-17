if(global.pause) {
	return;	
}

y += v_speed;

y = clamp(y, PADDING + half_paddle_size, 800-PADDING - half_paddle_size);

//var ppfx_id = is_player ? obj_pong.ppfx_id_player : obj_pong.ppfx_id_enemy;
/*ppfx_id.SetEffectParameter(FX_EFFECT.MOTION_BLUR, 
[
	PP_MOTION_BLUR_ANGLE, 
	PP_MOTION_BLUR_RADIUS 
	//PP_MOTION_BLUR_CENTER
], 
[
	90,
	abs(v_speed),
	//[x, y]
]);*/

//ppfx_id.SetEffectParameter(FX_EFFECT.MOTION_BLUR, PP_MOTION_BLUR_ANGLE, 90);
//ppfx_id.SetEffectParameter(FX_EFFECT.MOTION_BLUR, PP_MOTION_BLUR_RADIUS, abs(v_speed));