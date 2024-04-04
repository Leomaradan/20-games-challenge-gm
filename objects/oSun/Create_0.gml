emission = 2.5;

dayNightLUTSprites = [
	sLUTDefault, sLUTAfternoon, sLUTSunset, sLUTNight
];
dayNightLUTWidth = 512;
dayNightLUTHeight = 512;
dayNightPosition = 0;
dayNightSurf = -1;
dayNightTime = 0;
dayNightHour = 0;
dayNightMinute = 0;
dayNightSecond = 0;
dayNightMs = 0;
dayNightDay = 0;

dayNightBgOldSprite = dayNightLUTSprites[0];
dayNightBgSprite = dayNightLUTSprites[1];
dayNightBgFadeAlpha = 0;

dayNightVelocity = 0.02;