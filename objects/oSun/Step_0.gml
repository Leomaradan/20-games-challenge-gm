//x = mouse_x;
//y = mouse_y;


//oPostProcess.ppfx.SetEffectParameter(FX_EFFECT.SUNSHAFTS, PP_SUNSHAFTS_POSITION, [GUI_MOUSE_X_NORMALIZED, GUI_MOUSE_Y_NORMALIZED]);
//oPostProcess.ppfx.SetEffectParameter(FX_EFFECT.SUNSHAFTS, PP_SUNSHAFTS_POSITION, [0.05, 0.5]);

//dayNightMs += 10;
dayNightSecond += 25;
if (dayNightMs > 59) {dayNightMs = 0; dayNightSecond += 1;}
if (dayNightSecond > 59) {dayNightMinute += 4; dayNightSecond = 0;}
if (dayNightMinute > 59) {dayNightHour += 1; dayNightMinute = 0;}
if (dayNightHour > 23) {
	dayNightDay += 1;
	dayNightHour = 0;
	dayNightMinute = 0;
	dayNightSecond = 0;
}



// update crossfade effect
// time: goes from 0 to 1
dayNightTime = (3600 * dayNightHour + 60 * dayNightMinute + dayNightSecond) / 86400;
dayNightPosition = animcurve_channel_evaluate(animcurve_get_channel(acDayNight, 0), dayNightTime);

dayNightBgFadeAlpha = max(dayNightBgFadeAlpha-dayNightVelocity, 0);
if (dayNightPosition % 0.25 == 0) { // for each 25% (of 100%) of position
	arrayShift(dayNightLUTSprites); // shift array
	
	dayNightBgOldSprite = dayNightLUTSprites[0];
	dayNightBgSprite = dayNightLUTSprites[1];
	dayNightBgFadeAlpha = 1;
}

var _sunPosition = animcurve_channel_evaluate(animcurve_get_channel(aBounce, 0), dayNightPosition);

	
y = lerp(192, 640, _sunPosition);
var _sunOffset = lerp(0.21,0.81,_sunPosition);

oPostProcess.ppfx.SetEffectParameter(FX_EFFECT.SUNSHAFTS, PP_SUNSHAFTS_POSITION, [0.97, _sunOffset]);


// show_debug_message({ dayNightSecond,dayNightMinute, dayNightHour, dayNightDay, dayNightTime, dayNightPosition,_sunPosition});
