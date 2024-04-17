if(global.pause) {
	return;	
}

y += vSpeed;

y = clamp(y, PADDING + halfPaddleSize, 800-PADDING - halfPaddleSize);

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