while {true} do 
{
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
	"dynamicBlur" ppEffectCommit 15; // time it takes to normal
	resetCamShake; // resets the shake
	20 fadeSound 1; //fades the sound back to normal
	
	waituntil{
		((nearestObject [getpos player, "SmokeShellOrange"]) distance player < 10) and (getpos (nearestObject [getpos player, "SmokeShellOrange"]) select 2 < 0.5)
		or
		((nearestObject [getpos player, "G_40mm_SmokeOrange"]) distance player < 10) and (getpos (nearestObject [getpos player, "G_40mm_SmokeOrange"]) select 2 < 0.5) 
	};

	//if (goggles player != "G_Balaclava_lowprofile" || goggles player != "G_Balaclava_combat")
	if (goggles player != "G_Balaclava_combat") then
	{
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
			enableCamShake false; // enables camera shake
			addCamShake [10, 45, 10]; // sets shakevalues
			player setFatigue 1; // sets the fatigue to 100%
			5 fadeSound 0.1; // fades the sound to 10% in 5 seconds
	};

	sleep 0.5;
};