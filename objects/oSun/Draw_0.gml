


// create "day night cycle" surface and draw LUT sprite inside it
if (!surface_exists(dayNightSurf)) {
	dayNightSurf = surface_create(dayNightLUTWidth, dayNightLUTHeight);
	oPostProcess.ppfx.SetEffectParameter(FX_EFFECT.LUT, PP_LUT_TEXTURE, surface_get_texture(dayNightSurf));
}
// generate day night cycle surface
surface_set_target(dayNightSurf);
draw_clear_alpha(c_black, 0);
draw_sprite_stretched_ext(dayNightBgSprite, 0, 0, 0, dayNightLUTWidth, dayNightLUTHeight, c_white, 1);
draw_sprite_stretched_ext(dayNightBgOldSprite, 0, 0, 0, dayNightLUTWidth, dayNightLUTHeight, c_white, dayNightBgFadeAlpha);
surface_reset_target();

// apply emission to the sun
shader_set(shSunShaft);
shader_set_uniform_f(shader_get_uniform(shSunShaft, "u_emission"), emission);
draw_self();
shader_reset();